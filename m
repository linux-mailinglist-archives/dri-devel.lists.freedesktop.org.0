Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED4296F916
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 18:15:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB0810E3DD;
	Fri,  6 Sep 2024 16:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="KB4ENeco";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 842F410E3DD
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 16:15:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5CC71C0004;
 Fri,  6 Sep 2024 16:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1725639308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=q0PnbrhF1O5fN1oqIgr5KPh4QtUbDp9bJEI4UAGjXHQ=;
 b=KB4ENeco7YyieKpKIx3rPRs6rRSjmfka09HrCf8Em5yU00HB/pPEj7uvKF8nWXS+1OqffG
 edlCqZbvdaeLRyA6oraXGbD3l0rl2WlmIr6WxuccCxz9k4aqBink9jXY2BJDDW1mlpV2EJ
 srpKx01l8sahDmEwmUDAVZzfFgwfIC+7SKGkbgYkloa9+QCmBDqcupLJ3tmxFLoxccBzu/
 HjNJzDYnKKXeUmb710P+E5xG2DKwUwPcWFOq3q7KzD/qvPIL+xoXr6u+MPYyDWF8ID24It
 hMh1x5/ZJj4oUTp5LxwDRmuGPr1W3ccUaDl+fz+nt2KWbSJq0JzL810zx1jpqw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 06 Sep 2024 18:15:03 +0200
Subject: [PATCH] drm/vkms: Add missing check for CRTC initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240906-vkms-add-missing-check-v1-1-1afb3bf3d0a6@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAIYq22YC/zWMyw6CMBBFf6WZtRMLGiL8imHRxwgT0qKdSkgI/
 26VuLvnJudsIJSYBDq1QaKFhedYoDopcKOJAyH7wlDr+qpb3eAyBUHjPQYW4TigG8lNSJVtiG6
 +spcWivxM9OD1F773Byd6vUs/HydYI4RuDoFzp3wK36A7/wdGWjP0+/4BgDmxV6IAAAA=
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 thomas.petazzoni@bootlin.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1118;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=iSCIYXd8JJ0yfB4/YW7mtkxVQvJuK/tFIsGk1qmWCO8=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBm2yqKxmnf/KuDIrZgHU7yobFH88ctGQ1uL5ixH
 5kiONWKGcuJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZtsqigAKCRAgrS7GWxAs
 4vjwEACyrhtIbPu6IwBIDsy9yrifGo3ghgr/BtMLTkIjCWdLrF6MTBce228A7wf9n5rJSIXF8XY
 bJ+h3tJrhsVCtJQt1z0UgQPSaHCfE4Plv223T/mlS231hcSp7dtjNBxxEWbmfteg9sb63MJRnN/
 E5hSkHWlwrbQj7e4uTgDAhP4FP5FgOV9oUxpPLdtAaSrJ29EfjLPyUaOCTlTOL7p1Gdloiz+ys6
 0e1mXXRbcCl9Hf0FClqeGcWsGkl3kKy1MvAZU5YJpEwLebPYeub1mWoFqjwBRIrq8y1qsIgCn0i
 MJOk1SkehBh0PyF5f41NMsgC24MiWRmFtzkFTVIGxwSuM7gl5mZUovi1c/aGBn/OyeCMn7cumR+
 MbcNGESdv3kXVJTNbg4zB+fEnaMpLdfCkQzzng9X1TEc9jGPMo3fS/nMyMbGr75cBd05POlSQJk
 0SJVuppmJr6ZRJT2Zg4GsWOrYyCSCXIdLI8pVhuD3VU1gGZonfRyeGbutiOUddyfTgeQiNU3WD1
 DiZy8DxEAJgnSIvrPPtgxAq3F1H71eDkpD4fXKqmoQ3Uy+yrlfSupuD4DxmIsb0kteQIU+cCL4G
 +bN30ChfMnzCOhEm8cfMTAwq/0GM71PtnB9RSBZOIrXdSF8FiJnolCZgZGu0DuJDyXEHEbeOmdB
 fg99kJ3WOg2N44Q==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

CRTC initialization call drm_mode_crtc_set_gamma_size without the proper
checks, introduce this check to avoid issues.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 40b4d084e3ce..e4f93dfbd071 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -287,7 +287,12 @@ int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
 
 	drm_crtc_helper_add(crtc, &vkms_crtc_helper_funcs);
 
-	drm_mode_crtc_set_gamma_size(crtc, VKMS_LUT_SIZE);
+	ret = drm_mode_crtc_set_gamma_size(crtc, VKMS_LUT_SIZE);
+	if (ret) {
+		DRM_ERROR("Failed to set gamma size\n");
+		return ret;
+	}
+
 	drm_crtc_enable_color_mgmt(crtc, 0, false, VKMS_LUT_SIZE);
 
 	spin_lock_init(&vkms_out->lock);

---
base-commit: a6bb1f77a94335de67dba12e7f52651c115b82d2
change-id: 20240906-vkms-add-missing-check-e1b6ee8d1b39

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

