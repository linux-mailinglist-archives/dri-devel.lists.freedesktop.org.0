Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 026AC56A846
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 18:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30140113FD5;
	Thu,  7 Jul 2022 16:36:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64F8D1128FD;
 Thu,  7 Jul 2022 16:36:51 +0000 (UTC)
Received: from hermes-devbox.fritz.box (82-71-8-225.dsl.in-addr.zen.co.uk
 [82.71.8.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbeckett)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A1EFB66019E0;
 Thu,  7 Jul 2022 17:36:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1657211810;
 bh=E5T70icBxb2SeJUS5t8AxNkSIQiak1K4e7CDoJQNNIg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DJ1Xc33RVVLPMaQyKloHcfIgoeAAzA02axrrSGTUsok/MCSLamqMJPU6E275N6YPt
 azfSdpX1SPv6NlLq1GkFww2yNIoa90S5yKgc2u2wY0nUxoy/k0FBx2vgG4t6z7qxM9
 HE0Naf9/VimHDTRhIx0Nct+bR876PlsilpZhgj6CR3bPV0ntpWH7UCHzk98wOtLwld
 WvthL4tH0mU3TsPq/siS77c+WqJfN6UDZlOH30E4VwETW/KtEMKdUTeUvaWbMSqx91
 9+zu1IOKTMWAMH0PZEv29Zfb1Xd/WF4+A/T1FmJfKyKUWhJPErvtpjfROq9SBbe3HF
 XdDOtdLyBf0vQ==
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v9 10/11] drm/i915/selftest: wait for requests during engine
 reset selftest
Date: Thu,  7 Jul 2022 16:36:05 +0000
Message-Id: <20220707163606.1474111-11-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707163606.1474111-1-bob.beckett@collabora.com>
References: <20220707163606.1474111-1-bob.beckett@collabora.com>
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 kernel@collabora.com, Matthew Auld <matthew.auld@intel.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While looping around each engine and testing for corrupted solen memory
during engine reset, the old requests from the previous engine can still
be yet to retire.
To prevent false positive corruption tests, wait for the outstanding
requests at the end of the test

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
---
 drivers/gpu/drm/i915/gt/selftest_reset.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
index 55f3b34e5f6e..52acef647396 100644
--- a/drivers/gpu/drm/i915/gt/selftest_reset.c
+++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
@@ -6,6 +6,7 @@
 #include <linux/crc32.h>
 
 #include "gem/i915_gem_stolen.h"
+#include "gt/intel_gt.h"
 
 #include "i915_memcpy.h"
 #include "i915_selftest.h"
@@ -26,6 +27,7 @@ __igt_reset_stolen(struct intel_gt *gt,
 	intel_wakeref_t wakeref;
 	enum intel_engine_id id;
 	struct igt_spinner spin;
+	struct i915_request *requests[I915_NUM_ENGINES] = {0};
 	long max, count;
 	void *tmp;
 	u32 *crc;
@@ -77,6 +79,7 @@ __igt_reset_stolen(struct intel_gt *gt,
 			goto err_spin;
 		}
 		i915_request_add(rq);
+		requests[id] = i915_request_get(rq);
 	}
 
 	for (page = 0; page < num_pages; page++) {
@@ -165,6 +168,27 @@ __igt_reset_stolen(struct intel_gt *gt,
 		err = -EINVAL;
 	}
 
+	/* wait for requests and idle, otherwise cleanup can happen on next loop */
+	for (id = 0; id < I915_NUM_ENGINES; id++) {
+		if (!requests[id])
+			continue;
+		err = i915_request_wait(requests[id], I915_WAIT_INTERRUPTIBLE, HZ);
+		if (err < 0) {
+			pr_err("%s failed to wait for rq: %d\n", msg, err);
+			goto err_spin;
+		}
+
+		i915_request_put(requests[id]);
+	}
+
+	err = intel_gt_wait_for_idle(gt, HZ);
+	if (err < 0) {
+		pr_err("%s failed to wait for gt idle: %d\n", msg, err);
+		goto err_spin;
+	}
+
+	err = 0;
+
 err_spin:
 	igt_spinner_fini(&spin);
 
-- 
2.25.1

