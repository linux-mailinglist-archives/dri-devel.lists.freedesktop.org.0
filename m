Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 542DC3646AB
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 17:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3416C89FEC;
	Mon, 19 Apr 2021 15:03:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0680289FA5
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 15:03:52 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id j12so16080844edy.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 08:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mME7QStyZ5BrwM08xDu1fxRf1Oo+GkwgOIUtA6qwi38=;
 b=GYahGRFxoCkDkptsI0M+C6r0P4ziaDFqoRsOf1IW+3wx7+GhA+uCZZ5M9xi6uqDPx6
 EjYB29JxJlIpiFTDPPUh9QpUb5cRcn3ovDJIgpSyqHSyp4XIKJ1DJoJH7LOO93A7Qjfa
 UYysMxAh9wXFnkbsuZuLcTD7IOastl6LvKt9VUOy/TtM+enEYzlJHnVtSXHfJgiAqlm4
 S58f+WKpFZigkxmDL/nYYjCvOPTCSnJB4dKGqk23u4rvPs8jDbQhAQB7+/NmzL/ZOBHA
 1lSLAR/AHdz1ahdjMmS6cU3t4tX8utrZwG1ePFCYpOvz/qXbhibpW4uYreypUoP+VVBi
 Y4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mME7QStyZ5BrwM08xDu1fxRf1Oo+GkwgOIUtA6qwi38=;
 b=mqGtW+iHGVSgVkCJrKC61IOKMFAI6IIv44tzbD0jfnfBi6UuR4ilAVpk6j8cY2jkv4
 sSohVLjpUlagLAUffz/PTLy5qjFAeQWjk5ZWP3jfjfVl6JgIJeoxJ6HMGMSC0K0hAJYJ
 7xyttF2/bDQbcu8V9No37YpXiRDjoIJSKpCev3/z3x1pPyDKh3BfSKLZ+N2BP+xqsuUy
 CCoizEGLJpBCyolv3o5GHxC6gSgSmqkQZRpbI+6GtXjCzBam0Us/bJqckAN5IPITGq2I
 ZQ4mZZdv0Pab6MUvPZ2SGWWdMoj5nFmnjH8f1KFaeEEZQ/4TUlu2rdPi43hP8VtfNf4F
 m4hw==
X-Gm-Message-State: AOAM533mRqdTZMVtX3160V+1gsvfjlc/EHIRfD7ZDnISIEJZv8+bsbq5
 C3Bda5Pp1Rx3dlHbvAJr+2k=
X-Google-Smtp-Source: ABdhPJwfDg2gN576kNgMBrEg2oQZYZMTXzSBVVF0XBYyhZb9OxPHr13eErniL/uVKLGrCjmCk+88CQ==
X-Received: by 2002:a05:6402:278c:: with SMTP id
 b12mr26387242ede.145.1618844630674; 
 Mon, 19 Apr 2021 08:03:50 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it.
 [79.52.107.152])
 by smtp.gmail.com with ESMTPSA id o5sm1965954edc.8.2021.04.19.08.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 08:03:50 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: outreachy-kernel@googlegroups.com, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>
Subject: [PATCH v2 1/2] drm/amd/amdgpu/amdgpu_device.c: Replace
 drm_modeset_*_all with DRM_MODESET_LOCK_ALL_*
Date: Mon, 19 Apr 2021 17:03:40 +0200
Message-Id: <20210419150341.24959-2-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210419150341.24959-1-fmdefrancesco@gmail.com>
References: <20210419150341.24959-1-fmdefrancesco@gmail.com>
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
of the DRM subsystem. The new API has been introduced with commit
b7ea04d299c7: DRM_MODESET_LOCK_ALL_BEGIN() simplifies grabbing all modeset
locks using a local context and has the advantage of reducing boilerplate.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

Changes from v1: Added further information in the commit message.

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
