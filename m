Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6A173C411
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jun 2023 00:25:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58FDC10E6D6;
	Fri, 23 Jun 2023 22:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7A5F10E6D5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 22:25:43 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3fa79605a3bso11268775e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 15:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1687559142; x=1690151142;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XVDfyQp1D2UHXpL1ZVItWp64PNlbA4FYgRcewIHu8Ww=;
 b=PRuOCVqjhaiUIaUxHpcOBEuD6ZfRhG69YI9VhpRhJBg/QRW8qHokII2mDUDfTkEvKb
 j5XmH5Dnv+539X4Yu3HnU2WPe9mnfR6Lm4OVBFbS3IvhFBzZ6KHFOqoGVuXxWBd+BoMw
 LNLpD2UixobZWhUHVRCICdr09zBrDVUX/tFNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687559142; x=1690151142;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XVDfyQp1D2UHXpL1ZVItWp64PNlbA4FYgRcewIHu8Ww=;
 b=IbRZvOfFqRwR1UwTPH+Zj9hSeWOuXphSkwhhpEhP2ajFnwQz/ygFDaDA5+wdRKiR5U
 RBS7PC/amlVJ5aFMh5O0v/4/43aJgrHNZ4U02JUYtZi4ULxga85tjTPxSLdas1yek1Ge
 /uLcoiaMh521eVlOvJ+hxra3iEzgksQBW3/UzIdPzqqPJov0QhH5AquxJTCRrzAjX+Sl
 6NF0M1ABnK9uvsZanz4uVtIkWE5b2VpT+LloTH0VRqmidw57rYGzWK+JnvsmNNUvMPE4
 TVjxkVTjVAH1yVt8/dNLZLCpURAi7QaLJuykZR6F1HJ+2ytngqePWblQzEsp8KMJ6kYx
 KeJQ==
X-Gm-Message-State: AC+VfDyQZMdQH7c8of5bpOWJVG32Au/qHohIHdLsBxyt7qCnx9SoEA5w
 mGCcyBm5Vays0o+y0NvDWzucZQ==
X-Google-Smtp-Source: ACHHUZ7pe50hzgM5iLC2579qWnSeqdzLoUZ3+Orq7sbVqA9W1K1hggz4Fbs/PlyG3wmdZULYjOJhjA==
X-Received: by 2002:a05:600c:138c:b0:3fa:7bf0:7a81 with SMTP id
 u12-20020a05600c138c00b003fa7bf07a81mr2995293wmf.0.1687559141956; 
 Fri, 23 Jun 2023 15:25:41 -0700 (PDT)
Received: from big-boopo.mynetworksettings.com
 (pool-108-46-233-209.nycmny.fios.verizon.net. [108.46.233.209])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a5d4106000000b0030c2e3c7fb3sm453223wrp.101.2023.06.23.15.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 15:25:41 -0700 (PDT)
From: Jim Shargo <jshargo@chromium.org>
To: mairacanal@riseup.net, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <melissa.srw@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 6/6] drm/vkms: Add a module param to enable/disable the
 default device
Date: Fri, 23 Jun 2023 18:23:48 -0400
Message-ID: <20230623222353.97283-7-jshargo@chromium.org>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
In-Reply-To: <20230623222353.97283-1-jshargo@chromium.org>
References: <20230623222353.97283-1-jshargo@chromium.org>
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
Cc: Jim Shargo <jshargo@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In many testing circumstances, we will want to just create a new device
and test against that. If we create a default device, it can be annoying
to have to manually select the new device instead of choosing the only
one that exists.

The param, enable_default, is defaulted to true to maintain backwards
compatibility.

Signed-off-by: Jim Shargo <jshargo@chromium.org>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 44 ++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 314a04659c5f..1cb56c090a65 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -42,17 +42,26 @@
 #define DRIVER_MAJOR	1
 #define DRIVER_MINOR	0
 
+static bool enable_default_device = true;
+module_param_named(enable_default_device, enable_default_device, bool, 0444);
+MODULE_PARM_DESC(enable_default_device,
+		 "Enable/Disable creating the default device");
+
 static bool enable_cursor = true;
 module_param_named(enable_cursor, enable_cursor, bool, 0444);
-MODULE_PARM_DESC(enable_cursor, "Enable/Disable cursor support");
+MODULE_PARM_DESC(enable_cursor,
+		 "Enable/Disable cursor support for the default device");
 
 static bool enable_writeback = true;
 module_param_named(enable_writeback, enable_writeback, bool, 0444);
-MODULE_PARM_DESC(enable_writeback, "Enable/Disable writeback connector support");
+MODULE_PARM_DESC(
+	enable_writeback,
+	"Enable/Disable writeback connector support for the default device");
 
 static bool enable_overlay;
 module_param_named(enable_overlay, enable_overlay, bool, 0444);
-MODULE_PARM_DESC(enable_overlay, "Enable/Disable overlay support");
+MODULE_PARM_DESC(enable_overlay,
+		 "Enable/Disable overlay support for the default device");
 
 DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
 
@@ -278,10 +287,7 @@ void vkms_remove_device(struct vkms_device *vkms_device)
 static int __init vkms_init(void)
 {
 	int ret;
-	struct platform_device *pdev;
-	struct vkms_device_setup vkms_device_setup = {
-		.configfs = NULL,
-	};
+	struct platform_device *default_pdev = NULL;
 
 	ret = platform_driver_register(&vkms_platform_driver);
 	if (ret) {
@@ -289,19 +295,27 @@ static int __init vkms_init(void)
 		return ret;
 	}
 
-	pdev = platform_device_register_data(NULL, DRIVER_NAME, 0,
-					     &vkms_device_setup,
-					     sizeof(vkms_device_setup));
-	if (IS_ERR(pdev)) {
-		DRM_ERROR("Unable to register default vkms device\n");
-		platform_driver_unregister(&vkms_platform_driver);
-		return PTR_ERR(pdev);
+	if (enable_default_device) {
+		struct vkms_device_setup vkms_device_setup = {
+			.configfs = NULL,
+		};
+
+		default_pdev = platform_device_register_data(
+			NULL, DRIVER_NAME, 0, &vkms_device_setup,
+			sizeof(vkms_device_setup));
+		if (IS_ERR(default_pdev)) {
+			DRM_ERROR("Unable to register default vkms device\n");
+			platform_driver_unregister(&vkms_platform_driver);
+			return PTR_ERR(default_pdev);
+		}
 	}
 
 	ret = vkms_init_configfs();
 	if (ret) {
 		DRM_ERROR("Unable to initialize configfs\n");
-		platform_device_unregister(pdev);
+		if (default_pdev)
+			platform_device_unregister(default_pdev);
+
 		platform_driver_unregister(&vkms_platform_driver);
 	}
 
-- 
2.41.0.162.gfafddb0af9-goog

