Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B02BD36418A
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 14:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DEEC6E2ED;
	Mon, 19 Apr 2021 12:21:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA0B6E2ED
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 12:21:09 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id l4so52548654ejc.10
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 05:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UviPckuLeSravMJQV4Rt2Fal6QuCweBGlvoxm1zfPVE=;
 b=ty4sxTB9H3zw0YaUn6F/T9qIvzUW95Ten158eMMyXgRGg98PTvZN4z2z2tjJzLdf4+
 oLVuz1d14MYU5CZHv8iHttlBw/tBMywxPU4V77D7FOO2ZmmW1xmNpY88UBA+cNjJoBsQ
 7adu5Xpsdz4HFnHZzfbFTEcbKmm/aV9ZNkBKrgNtBgYvhi+YWIvyDtFRvQgckvi5ONeB
 Ma3sbqZ5ACrf/cAGRngrQt0JG1ZXZUkwJ6XU4LpGTy7Tbu9LmUpp39T5G/ehM8rOng9i
 y2dr2R8TB/062Nq3WmyWuZAtQZgxpe6XH74pvUWEVyEtcNvcTuY/HCgC0b30VNsMOp2P
 zu9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UviPckuLeSravMJQV4Rt2Fal6QuCweBGlvoxm1zfPVE=;
 b=hIy1s8UotTzn91+tSGQpQur5pG/XCdoDtVLp+NWSvsTHqS3D7T1JskBw+oEBeDFoRk
 8Rt7QACotMpkGUyEdCwu5TuzdGVuPJuPdVvbFoyqa9DsgOsre7nPZ5usIgWZ/TFzOGrK
 4JWaS1Qc/cCDhl7hons4lFvU2MmNCKYWKIdHpvMQJ45gAnuK8ocHcrAuVzQYR7noy02y
 NH1QnA7I8TlpK0ADehOvR7SHtyTDdA8J7JoL+2E4EZQVPJP78rcYpKVWlyzlZ6hBWsfM
 IfYmVhlFGrzYyCUGCUoqn37yG2DCQdqUTQyxPNFf95pEKv5DJVvlqDNcbDelTy5saR11
 YWlg==
X-Gm-Message-State: AOAM530dXuL2bynObTxnS3DNHfRZEXDUHtZXp4dCiWI3WGhluHqGNTiq
 sip5jvVgn+f/hzkl5RCrSqU=
X-Google-Smtp-Source: ABdhPJzN4yofLegK5R7Lz2iDgi1lyapH3EzE8b9qqQZw5w5qnGlc/BoMNTxMh7f/ZWb1RFBjBguaQw==
X-Received: by 2002:a17:906:1b54:: with SMTP id
 p20mr22128945ejg.477.1618834867802; 
 Mon, 19 Apr 2021 05:21:07 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it.
 [79.52.107.152])
 by smtp.gmail.com with ESMTPSA id c19sm12576152edu.20.2021.04.19.05.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 05:21:07 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: outreachy-kernel@googlegroups.com, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>
Subject: [PATCH 1/2] drm/amd/amdgpu/amdgpu_device.c: Replace drm_modeset_*_all
 with DRM_MODESET_LOCK_ALL_*
Date: Mon, 19 Apr 2021 14:20:58 +0200
Message-Id: <20210419122059.738-2-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210419122059.738-1-fmdefrancesco@gmail.com>
References: <20210419122059.738-1-fmdefrancesco@gmail.com>
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
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the deprecated API with new helpers, according to the TODO list
of the DRM subsystem.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 6447cd6ca5a8..e1a71579f8e6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -32,6 +32,7 @@
 #include <linux/slab.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/amdgpu_drm.h>
 #include <linux/vgaarb.h>
@@ -3694,14 +3695,17 @@ int amdgpu_device_suspend(struct drm_device *dev, bool fbcon)
 
 	if (!amdgpu_device_has_dc_support(adev)) {
 		/* turn off display hw */
-		drm_modeset_lock_all(dev);
+		struct drm_modeset_acquire_ctx ctx;
+		int ret;
+
+		DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 		drm_connector_list_iter_begin(dev, &iter);
 		drm_for_each_connector_iter(connector, &iter)
 			drm_helper_connector_dpms(connector,
 						  DRM_MODE_DPMS_OFF);
 		drm_connector_list_iter_end(&iter);
-		drm_modeset_unlock_all(dev);
-			/* unpin the front buffers and cursors */
+		DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+		/* unpin the front buffers and cursors */
 		list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
 			struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 			struct drm_framebuffer *fb = crtc->primary->fb;
@@ -3830,19 +3834,21 @@ int amdgpu_device_resume(struct drm_device *dev, bool fbcon)
 	/* blat the mode back in */
 	if (fbcon) {
 		if (!amdgpu_device_has_dc_support(adev)) {
+			struct drm_modeset_acquire_ctx ctx;
+			int ret;
+
 			/* pre DCE11 */
 			drm_helper_resume_force_mode(dev);
 
 			/* turn on display hw */
-			drm_modeset_lock_all(dev);
+			DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 
 			drm_connector_list_iter_begin(dev, &iter);
 			drm_for_each_connector_iter(connector, &iter)
 				drm_helper_connector_dpms(connector,
 							  DRM_MODE_DPMS_ON);
 			drm_connector_list_iter_end(&iter);
-
-			drm_modeset_unlock_all(dev);
+			DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 		}
 		amdgpu_fbdev_set_suspend(adev, 0);
 	}
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
