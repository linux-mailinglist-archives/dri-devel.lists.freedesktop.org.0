Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA58A2729D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 14:21:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 827DF10E63E;
	Tue,  4 Feb 2025 13:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F05510E636;
 Tue,  4 Feb 2025 13:21:48 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <dev@lankhorst.se>, Ingo Molnar <mingo@kernel.org>,
 David Lechner <dlechner@baylibre.com>,
 Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH-resent-to-correct-ml 3/8] drm/xe: Add scoped guards for
 xe_force_wake
Date: Tue,  4 Feb 2025 14:22:32 +0100
Message-ID: <20250204132238.162608-4-dev@lankhorst.se>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204132238.162608-1-dev@lankhorst.se>
References: <20250204132238.162608-1-dev@lankhorst.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of finding bugs where we may or may not release force_wake, I've
decided to be inspired by the spinlock guards, and use the same ones to
do xe_force_wake handling.

Examples are added as documentation in xe_force_wake.c

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_force_wake.c | 51 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_force_wake.h | 15 +++++++++
 2 files changed, 66 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 4f6784e5abf88..805c19f6de9e7 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -16,6 +16,57 @@
 
 #define XE_FORCE_WAKE_ACK_TIMEOUT_MS	50
 
+/**
+ * DOC: Force wake handling
+ *
+ * Traditionally, the force wake handling has been done using the error prone
+ * set of calls:
+ *
+ * int func(struct xe_force_wake *fw)
+ * {
+ * 	unsigned int fw_ref = xe_force_wake_get(fw, XE_FORCEWAKE_ALL);
+ * 	if (!fw_ref)
+ * 		return -ETIMEDOUT;
+ *
+ * 	err = do_something();
+ *
+ * 	xe_force_wake_put(fw, fw_ref);
+ * 	return err;
+ * }
+ *
+ * A new, failure-safe approach is by using the scoped helpers,
+ * which changes the function to this:
+ *
+ * int func(struct xe_force_wake *fw)
+ * {
+ * 	scoped_cond_guard(xe_force_wake_get, return -ETIMEDOUT, fw, XE_FORCEWAKE_ALL) {
+ * 		return do_something();
+ * 	}
+ * }
+ *
+ * For completeness, the following options also work:
+ * void func(struct xe_force_wake *fw)
+ * {
+ * 	scoped_guard(xe_force_wake_get, fw, XE_FORCEWAKE_ALL) {
+ * 		do_something_only_if_fw_acquired();
+ * 	}
+ * }
+ *
+ * You can use xe_force_wake instead of force_wake_get, if the code
+ * must run but errors acquiring ignored:
+ * void func(struct xe_force_wake *fw)
+ * {
+ * 	scoped_guard(xe_force_wake, fw, XE_FORCEWAKE_ALL) {
+ * 		always_do_something_maybe_fw();
+ * 	}
+ *
+ * 	do_something_no_fw();
+ *
+ * 	guard(xe_force_wake)(fw, XE_FORCEWAKE_ALL);
+ * 	always_do_something_maybe_fw();
+ * }
+ */
+
 static const char *str_wake_sleep(bool wake)
 {
 	return wake ? "wake" : "sleep";
diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index 0e3e84bfa51c3..0fb1baae0a3a3 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -9,6 +9,8 @@
 #include "xe_assert.h"
 #include "xe_force_wake_types.h"
 
+#include <linux/cleanup.h>
+
 struct xe_gt;
 
 void xe_force_wake_init_gt(struct xe_gt *gt,
@@ -61,4 +63,17 @@ xe_force_wake_ref_has_domain(unsigned int fw_ref, enum xe_force_wake_domains dom
 	return fw_ref & domain;
 }
 
+DEFINE_LOCK_GUARD_1(xe_force_wake, struct xe_force_wake,
+		    _T->fw_ref = xe_force_wake_get(_T->lock, domain),
+		    xe_force_wake_put(_T->lock, _T->fw_ref),
+		    unsigned int fw_ref, enum xe_force_wake_domains domain);
+
+DEFINE_LOCK_GUARD_1_COND(xe_force_wake, _get,
+			 _T->fw_ref = xe_force_wake_get_all(_T->lock, domain),
+			 enum xe_force_wake_domains domain);
+
+/* Only useful for guard xe_force_wake, guard xe_force_wake_get gets all or nothing */
+#define xe_force_wake_scope_has_domain(domain) \
+	(xe_force_wake_ref_has_domain(scope.fw_ref, domain))
+
 #endif
-- 
2.47.1

