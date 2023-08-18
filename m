Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E05D780667
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 09:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7560710E484;
	Fri, 18 Aug 2023 07:35:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB5C10E482
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 07:35:32 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-6887ccba675so514377b3a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 00:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692344132; x=1692948932;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UibU+Wd31ET9DKxhDYToQOnKhMNxhV0MyhlXlmFI9GI=;
 b=Gjswt26WNMaxr1avjyXISiQtjp8xzZ3pnVS8SSCFdA+Nr6BUw97AdR1k4Pcyld+QWq
 vWzjwAh8ZKgdCN38ytpXwYkk2ElvhpDdeWcGojuQGcFLeSKQw2xsFBWWzgeNoewzbRea
 E7PN0DzvkagwCTaR/o2vBqeNrx9REcmcLnN70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692344132; x=1692948932;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UibU+Wd31ET9DKxhDYToQOnKhMNxhV0MyhlXlmFI9GI=;
 b=W8iiJiLiSVKEaowJktdEsSgbhv3/uabHbTgXrE5xfstjiZm2QpN6Ic0Xbbdb7z0TmG
 namOw4jqb79yTshjZq8e4+N35gUsvrsn4g/Pq0miDxiw0Wd9v0M+grpHF0L5QvyVpIXE
 ulGsmAzz5H/q3KxUm0dnnNFYT4OnLuNeL8a0uw5I0Cr1yetVrkGUKKXfriz/oFPlYoOX
 GbyjxnkexMXWj9ewunMcJo/wxhL2uZvp/U5AvigE5cCrdgNNImaEcdPB3NLT8ywYjGZu
 fjzLuVbQaGhj1ovAvQtf4YLshyEYQtStBaQ5LxPyiCY84CfRQcgBynQt74r7F5yc/vWs
 4yjw==
X-Gm-Message-State: AOJu0YwtyFOcWFGZ7y0qQQaYqZT89QLWh5+BcPaTKQUIbPwTxOjZ5qEu
 SPJgHITtgQa1A4Q/BXKswLvTdw==
X-Google-Smtp-Source: AGHT+IG5jUpbp+gXt//v5GB0UcPACPsbz++4Npd2tDm+yADxxW75dZJvl0jWX+OfKlKz0MlKcr/XNg==
X-Received: by 2002:a05:6a00:22cc:b0:687:6184:deed with SMTP id
 f12-20020a056a0022cc00b006876184deedmr2120718pfj.22.1692344132202; 
 Fri, 18 Aug 2023 00:35:32 -0700 (PDT)
Received: from datalore.c.googlers.com.com
 (148.175.199.104.bc.googleusercontent.com. [104.199.175.148])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a62e802000000b00686fe7b7b48sm906041pfi.121.2023.08.18.00.35.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Aug 2023 00:35:31 -0700 (PDT)
From: Brandon Pollack <brpol@chromium.org>
To: marius.vlad@collabora.com,
	jshargo@chromium.org
Subject: [PATCH v3 6/7] drm/vkms: Add a module param to enable/disable the
 default device
Date: Fri, 18 Aug 2023 07:29:31 +0000
Message-ID: <20230818073411.3414628-8-brpol@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230818073411.3414628-2-brpol@chromium.org>
References: <20230818073411.3414628-2-brpol@chromium.org>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com,
 linux-doc@vger.kernel.org, hirono@chromium.org, mduggan@chromium.org,
 corbet@lwn.net, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 melissa.srw@gmail.com, mairacanal@riseup.net, mripard@kernel.org,
 tzimmermann@suse.de, Brandon Pollack <brpol@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jim Shargo <jshargo@chromium.org>

In many testing circumstances, we will want to just create a new device
and test against that. If we create a default device, it can be annoying
to have to manually select the new device instead of choosing the only
one that exists.

The param, enable_default, is defaulted to true to maintain backwards
compatibility.

Signed-off-by: Jim Shargo <jshargo@chromium.org>
Signed-off-by: Brandon Pollack <brpol@chromium.org>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 45 ++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 6e7f20681890..293bebf8e8ce 100644
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
 
@@ -99,6 +108,7 @@ static int vkms_config_show(struct seq_file *m, void *data)
 	struct drm_device *dev = entry->dev;
 	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
 
+	seq_printf(m, "default_device=%d\n", enable_default_device);
 	seq_printf(m, "writeback=%d\n", vkmsdev->config.writeback);
 	seq_printf(m, "cursor=%d\n", vkmsdev->config.cursor);
 	seq_printf(m, "overlay=%d\n", vkmsdev->config.overlay);
@@ -297,10 +307,7 @@ void vkms_remove_device(struct vkms_device *vkms_device)
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
@@ -308,19 +315,27 @@ static int __init vkms_init(void)
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
2.42.0.rc1.204.g551eb34607-goog

