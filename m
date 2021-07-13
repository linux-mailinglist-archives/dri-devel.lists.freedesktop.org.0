Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F103C7F81
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 09:44:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4974B6E17A;
	Wed, 14 Jul 2021 07:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C9086E106
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 17:14:12 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1626196454; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=5ILuZ7SWoWEhdwMo5jhwP5i1sCLD6tJKUIb5xpgE1DU=;
 b=FuqsWomSw4UyFBP8ZBrVCNdYg8Jc3ZHH3e02cJsXOXXEWljTTKocSgAFrRPTBiik4U7JKBNZ
 oz9Z3H83zioykX1xipRX+EhxtwKwD1I932u9gxlXV2OBksyAlvUIgtejVfX0glSMsFwxn+GA
 YIsXQPXOck8FFg1mbTIWR6FOT8c=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60edc9d301dd9a9431ac2f7d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 13 Jul 2021 17:13:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1B0DCC433F1; Tue, 13 Jul 2021 17:13:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from hu-gracan-sd.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: gracan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5AD5CC433F1;
 Tue, 13 Jul 2021 17:13:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5AD5CC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=gracan@codeaurora.org
From: Grace An <gracan@codeaurora.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC] drm: return int error code from mode_fixup
Date: Tue, 13 Jul 2021 10:13:41 -0700
Message-Id: <1626196421-24595-1-git-send-email-gracan@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Wed, 14 Jul 2021 07:44:22 +0000
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
Cc: Grace An <gracan@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 pdhaval@codeaurora.org, abhinavk@codeaurora.org, swboyd@chromium.org,
 khsieh@codeaurora.org, seanpaul@chromium.org, dmitry.baryshkov@linaro.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When CONFIG_PROVE_LOCKING is defined, the kernel randomly injects
-EDEADLK errors for all the ww_mutex. This results in
drm_atomic_get_private_obj_state randomly returning -EDEADLK.
However, the mode_fixup functions do not propagate these error
codes and return false, causing the atomic commit to fail with
-EINVAL instead of retrying.

Change encoder, crtc, and bridge mode_fixup functions to return
an int instead of a boolean to indicate success or failure. If
any of these functions fail, the mode_fixup function now returns
the provided integer error code instead of -EINVAL.

This change needs modifications across drivers, but before submitting
the entire change, we want to get feedback on this RFC.

Signed-off-by: Grace An <gracan@codeaurora.org>
---
 drivers/gpu/drm/drm_atomic_helper.c      | 8 ++++----
 drivers/gpu/drm/drm_bridge.c             | 4 ++--
 include/drm/drm_bridge.h                 | 2 +-
 include/drm/drm_modeset_helper_vtables.h | 4 ++--
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index f2b3e28..d75f09a 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -457,10 +457,10 @@ mode_fixup(struct drm_atomic_state *state)
 		} else if (funcs && funcs->mode_fixup) {
 			ret = funcs->mode_fixup(encoder, &new_crtc_state->mode,
 						&new_crtc_state->adjusted_mode);
-			if (!ret) {
+			if (ret) {
 				DRM_DEBUG_ATOMIC("[ENCODER:%d:%s] fixup failed\n",
 						 encoder->base.id, encoder->name);
-				return -EINVAL;
+				return ret;
 			}
 		}
 	}
@@ -481,10 +481,10 @@ mode_fixup(struct drm_atomic_state *state)
 
 		ret = funcs->mode_fixup(crtc, &new_crtc_state->mode,
 					&new_crtc_state->adjusted_mode);
-		if (!ret) {
+		if (ret) {
 			DRM_DEBUG_ATOMIC("[CRTC:%d:%s] fixup failed\n",
 					 crtc->base.id, crtc->name);
-			return -EINVAL;
+			return ret;
 		}
 	}
 
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 64f0eff..3ad16b5 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -736,9 +736,9 @@ static int drm_atomic_bridge_check(struct drm_bridge *bridge,
 		if (ret)
 			return ret;
 	} else if (bridge->funcs->mode_fixup) {
-		if (!bridge->funcs->mode_fixup(bridge, &crtc_state->mode,
+		if (bridge->funcs->mode_fixup(bridge, &crtc_state->mode,
 					       &crtc_state->adjusted_mode))
-			return -EINVAL;
+			return ret;
 	}
 
 	return 0;
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 2195daa..5d02dfc 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -153,7 +153,7 @@ struct drm_bridge_funcs {
 	 * True if an acceptable configuration is possible, false if the modeset
 	 * operation should be rejected.
 	 */
-	bool (*mode_fixup)(struct drm_bridge *bridge,
+	int (*mode_fixup)(struct drm_bridge *bridge,
 			   const struct drm_display_mode *mode,
 			   struct drm_display_mode *adjusted_mode);
 	/**
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index f3a4b47..e305c97 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -184,7 +184,7 @@ struct drm_crtc_helper_funcs {
 	 * True if an acceptable configuration is possible, false if the modeset
 	 * operation should be rejected.
 	 */
-	bool (*mode_fixup)(struct drm_crtc *crtc,
+	int (*mode_fixup)(struct drm_crtc *crtc,
 			   const struct drm_display_mode *mode,
 			   struct drm_display_mode *adjusted_mode);
 
@@ -599,7 +599,7 @@ struct drm_encoder_helper_funcs {
 	 * True if an acceptable configuration is possible, false if the modeset
 	 * operation should be rejected.
 	 */
-	bool (*mode_fixup)(struct drm_encoder *encoder,
+	int (*mode_fixup)(struct drm_encoder *encoder,
 			   const struct drm_display_mode *mode,
 			   struct drm_display_mode *adjusted_mode);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

