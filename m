Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4165737F0
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 15:51:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 883C99AC80;
	Wed, 13 Jul 2022 13:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36AB9AC72;
 Wed, 13 Jul 2022 13:50:46 +0000 (UTC)
Received: from hermes-devbox.fritz.box (82-71-8-225.dsl.in-addr.zen.co.uk
 [82.71.8.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbeckett)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 77EA56601A48;
 Wed, 13 Jul 2022 14:50:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1657720245;
 bh=ytHrbm7es59NYcCAUviukue+a4V5fUgnq/GNOzWK1Ms=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LwB3EXsWrZNqNQbuHXmYC6waOia6JAUif6VzN5guEnzLoNyEG2d7aCT56wX3AAshR
 7oy6KCkAV2RU9xvft7Of4ALK/gg0pz1siZt8HNOlouF6i35NHbo5XKrLeGBZ2YuMRw
 HMouICFf09s96hUejLpq54HUzBtRBqcYtiCgCHIO7OkURFJkFHsAbmld/9EXZrTKyB
 WbcJ/qn5CZNA9byxjbbTppwd/fBf1oh0BeyXNZjvd9KtqesG7MZL0nKQQxJqKe3tmt
 WnWJdahHYV/y6pSMz0nKltvoU0BM+RNrC04Sx+RXIDhpKqhqABjesgbvkKVdC1RiuI
 giH+fsAJ/GSYA==
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v11 09/10] drm/i915/selftest: maintain context ref during
 reset test
Date: Wed, 13 Jul 2022 14:50:21 +0100
Message-Id: <20220713135022.3710682-10-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220713135022.3710682-1-bob.beckett@collabora.com>
References: <20220713135022.3710682-1-bob.beckett@collabora.com>
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

Commit "bcb9aa45d5a0 Revert "drm/i915: Hold reference to intel_context over life of i915_request""
Stopped requests from maintaining a ref on the context.
This caused the contexts to be freed, releasing stolen memory while
under test, leading to false positive detection of stolen corruption.
Fix this by maintaining a ref on the contexts until testing is complete.

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
---
 drivers/gpu/drm/i915/gt/selftest_reset.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
index 55f3b34e5f6e..ba536e8a2e32 100644
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
+	struct intel_context *contexts[I915_NUM_ENGINES] = {0};
 	long max, count;
 	void *tmp;
 	u32 *crc;
@@ -71,12 +73,12 @@ __igt_reset_stolen(struct intel_gt *gt,
 			goto err_spin;
 		}
 		rq = igt_spinner_create_request(&spin, ce, MI_ARB_CHECK);
-		intel_context_put(ce);
 		if (IS_ERR(rq)) {
 			err = PTR_ERR(rq);
 			goto err_spin;
 		}
 		i915_request_add(rq);
+		contexts[id] = ce;
 	}
 
 	for (page = 0; page < num_pages; page++) {
@@ -165,8 +167,21 @@ __igt_reset_stolen(struct intel_gt *gt,
 		err = -EINVAL;
 	}
 
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
+	for (id = 0; id < I915_NUM_ENGINES; id++) {
+		if (!contexts[id])
+			continue;
+		intel_context_put(contexts[id]);
+	}
 
 err_lock:
 	intel_runtime_pm_put(gt->uncore->rpm, wakeref);
-- 
2.25.1

