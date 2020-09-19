Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F5327104F
	for <lists+dri-devel@lfdr.de>; Sat, 19 Sep 2020 21:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 155CE6E06B;
	Sat, 19 Sep 2020 19:36:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B7F6E04B
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Sep 2020 19:36:38 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id x123so5672517pfc.7
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Sep 2020 12:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7VsdxD+1OUY1iuOfImGtGZsxp93pIxtgiAELnGBIf8o=;
 b=CvFnInfCybqLqP+tNr86/LOeDZ/1iIdJWcGulCo/xLwBSujQolgiXW2EBmO/2FJa44
 S3tFBmDs4uSgRkDRTT3Knknj/t/JDLT1Wt7bqwCKVBr5KSpWpAf6qV6yZPL05aWUSr43
 gc0hH8x8d9qI8v00skwhTHs6B5IjgZ+XAavj1OnrhDMS4IXWNrlyKw3gVv3wGl7mJBU7
 u0Rn70DNl3/7jqM041w07g1NIZKyaYQrAZPH0yGqVGVPDlJ3Z3vkeg/Ndc9gDw0yJf8l
 RkoMibyK7xtSzcVVZbBP0YsbfvHUT5DW27eIwRaUVCUht9GRLJcvmXbnIfSZdrXS9NEt
 YbfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7VsdxD+1OUY1iuOfImGtGZsxp93pIxtgiAELnGBIf8o=;
 b=ZtWLozfvW72Y/qqPehH9zywY4QOQw/vtgJAXm6HjJufN+uBSBsRkffJz4K012BXDUN
 +lp8w8Z3I4/JJ0UptDWpMi+tPALaW9CVg7pI1+tRll/PP4CE0NAiJUVHr1zcQEXfM8A9
 N+jpI7MmOs3H2NYbOnGj3/X138oNHAnZWrTrLvv2CK8fFuzlhjKByWjBrBChNSmTwmhN
 j1ynlPN0p01DV0NXcsWEtJ+T3kmPzP0X2KedV6fMWPgdbjRC3f+hhz0lb7GpL3KkN2Ka
 Pi4CfQzII95x4cIiSQi1T+VFx4JUhY6lYuEVc/b6Hzoh7Oa9Upt5YVXv+VJ3bSJUKly8
 7yPQ==
X-Gm-Message-State: AOAM530OlQfGiCoUIfer1RHgOsoVTHGWbYij1mvgRSS7y6KxoGHRPfWJ
 wy1GDd5OXFs7tU2DV9ko3S4nZYlgJqM=
X-Google-Smtp-Source: ABdhPJz7NMJRNRuLfpWgnHbyS2MqLZ6mQ9iOw/mKZIE7oo1Gcm9Lw1ACSLLPOoArQXAbYQ7Ovip9xg==
X-Received: by 2002:a63:4b1c:: with SMTP id y28mr26589970pga.53.1600544197645; 
 Sat, 19 Sep 2020 12:36:37 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id k27sm6778575pgb.12.2020.09.19.12.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Sep 2020 12:36:36 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/crtc: Introduce per-crtc kworker
Date: Sat, 19 Sep 2020 12:37:24 -0700
Message-Id: <20200919193727.2093945-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200919193727.2093945-1-robdclark@gmail.com>
References: <20200919193727.2093945-1-robdclark@gmail.com>
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>, Peter Zijlstra <peterz@infradead.org>,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 timmurray@google.com, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This will be used for non-block atomic commits.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_crtc.c | 11 +++++++++++
 include/drm/drm_crtc.h     |  8 ++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index aecdd7ea26dc..4f7c0bfce0a3 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -326,6 +326,14 @@ int drm_crtc_init_with_planes(struct drm_device *dev, struct drm_crtc *crtc,
 					   config->prop_out_fence_ptr, 0);
 		drm_object_attach_property(&crtc->base,
 					   config->prop_vrr_enabled, 0);
+
+		crtc->worker = kthread_create_worker(0, "%s-worker", crtc->name);
+		if (IS_ERR(crtc->worker)) {
+			drm_mode_object_unregister(dev, &crtc->base);
+			ret = PTR_ERR(crtc->worker);
+			crtc->worker = NULL;
+			return ret;
+		}
 	}
 
 	return 0;
@@ -366,6 +374,9 @@ void drm_crtc_cleanup(struct drm_crtc *crtc)
 
 	kfree(crtc->name);
 
+	if (crtc->worker)
+		kthread_destroy_worker(crtc->worker);
+
 	memset(crtc, 0, sizeof(*crtc));
 }
 EXPORT_SYMBOL(drm_crtc_cleanup);
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 59b51a09cae6..8964a3732bca 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -30,6 +30,7 @@
 #include <linux/types.h>
 #include <linux/fb.h>
 #include <linux/hdmi.h>
+#include <linux/kthread.h>
 #include <linux/media-bus-format.h>
 #include <uapi/drm/drm_mode.h>
 #include <uapi/drm/drm_fourcc.h>
@@ -1172,6 +1173,13 @@ struct drm_crtc {
 	 * Initialized via drm_self_refresh_helper_init().
 	 */
 	struct drm_self_refresh_data *self_refresh_data;
+
+	/**
+	 * worker:
+	 *
+	 * Per-CRTC worker for nonblock atomic commits.
+	 */
+	struct kthread_worker *worker;
 };
 
 /**
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
