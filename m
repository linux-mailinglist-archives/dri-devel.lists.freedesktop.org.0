Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01321790412
	for <lists+dri-devel@lfdr.de>; Sat,  2 Sep 2023 01:41:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E0110E7E3;
	Fri,  1 Sep 2023 23:40:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC4E710E062
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 23:40:52 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-56c250ff3d3so317927a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Sep 2023 16:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693611652; x=1694216452;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LKWxQuC7a5C4d2AKwn1t60gJwzJJHgeo8QDTwz52tgk=;
 b=kDHhKpqZfWZG/X7MqFH81u+jglFZRjw7MkJ7d6Oed3acDulC3mtzyQw6OnJ6L6+NC/
 sYDGRFKUAfMTJ7cbWYYHWOoRzlTgp3VFQHrPUwidtxSSIwAWjTXk2gY071kN9XpFWanQ
 fVrzvcOKLkj7A0I6XwmkblgBev5/T1Ur1YknM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693611652; x=1694216452;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LKWxQuC7a5C4d2AKwn1t60gJwzJJHgeo8QDTwz52tgk=;
 b=I9OFkPsruLdTeDz1g3ny+p8u4QCweIRwzLUW4K53Vt+l3tf/e+PVQNeq5E/vAJi31J
 uiP3H7sbIqQo9LeqP0SFgGXfcvNpGO6kk/KqhsH4FD1EWYtuTfbhuOdyXyRUsnu2jUZL
 aLArjZHlNdVQay7UGm9A1xZngU5/g6F2MuzJ/L1XbQRYBVEfNgry54TbZsFNHUx6Dgci
 khde4KxqaSp/ztiOnunsgZnVyTg1Jii3DboUYXYSmwy1+L+loQ+ETXHJ0VMg3gtjUswh
 FuF3UyXorU+QmUVaTsSo+W/Sb4coOG4bTRxbnJhUuv+mubynFVF8aE4Plisqk8ZW6+ss
 CpQg==
X-Gm-Message-State: AOJu0Ywmr5/EFEDCCJ1BiNwpZnEk4T5kg3zGfTln8fl6XhNnFhBBQ0W/
 1Itp5wZyPO+vC19cW8Ig48YlNOtJAeG7qSTGl7fSo4Bv
X-Google-Smtp-Source: AGHT+IF7NMfrOZ6DTNlV36hEFwRQk2U4n0bYWcDnUFLW/Uc5W3neZ+LQyo3ZfA6voNcZiUuygY4RqA==
X-Received: by 2002:a17:90a:f487:b0:268:5aaf:fbe with SMTP id
 bx7-20020a17090af48700b002685aaf0fbemr5397171pjb.10.1693611651768; 
 Fri, 01 Sep 2023 16:40:51 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:8d94:1fc5:803c:41cc])
 by smtp.gmail.com with ESMTPSA id
 5-20020a17090a1a4500b0026b4ca7f62csm3773488pjl.39.2023.09.01.16.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Sep 2023 16:40:51 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [RFT PATCH 3/6] drm/vc4: Call drm_atomic_helper_shutdown() at
 shutdown time
Date: Fri,  1 Sep 2023 16:39:54 -0700
Message-ID: <20230901163944.RFT.3.I10dbe099fb1059d304ba847d19fc45054f7ffe9f@changeid>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
In-Reply-To: <20230901234015.566018-1-dianders@chromium.org>
References: <20230901234015.566018-1-dianders@chromium.org>
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
Cc: linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 emma@anholt.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Based on grepping through the source code these drivers appear to be
missing a call to drm_atomic_helper_shutdown() at system shutdown
time. Among other things, this means that if a panel is in use that it
won't be cleanly powered off at system shutdown time.

The fact that we should call drm_atomic_helper_shutdown() in the case
of OS shutdown/restart comes straight out of the kernel doc "driver
instance overview" in drm_drv.c.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This commit is only compile-time tested.

Though this patch could be squashed into the patch ("drm: Call
drm_atomic_helper_shutdown() at shutdown time for misc drivers"), I
kept it separate to call attention to this driver. While writing this
patch, I noticed that the bind() function is using "devm" and thus
assumes it doesn't need to do much explicit error handling. That's
actually a bug. As per kernel docs [1] "the lifetime of the aggregate
driver does not align with any of the underlying struct device
instances. Therefore devm cannot be used and all resources acquired or
allocated in this callback must be explicitly released in the unbind
callback". Fixing that is outside the scope of this commit.

[1] https://docs.kernel.org/driver-api/component.html

 drivers/gpu/drm/vc4/vc4_drv.c | 36 ++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 1b3531374967..c133e96b8aca 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -324,21 +324,21 @@ static int vc4_drm_bind(struct device *dev)
 	if (!is_vc5) {
 		ret = drmm_mutex_init(drm, &vc4->bin_bo_lock);
 		if (ret)
-			return ret;
+			goto err;
 
 		ret = vc4_bo_cache_init(drm);
 		if (ret)
-			return ret;
+			goto err;
 	}
 
 	ret = drmm_mode_config_init(drm);
 	if (ret)
-		return ret;
+		goto err;
 
 	if (!is_vc5) {
 		ret = vc4_gem_init(drm);
 		if (ret)
-			return ret;
+			goto err;
 	}
 
 	node = of_find_compatible_node(NULL, NULL, "raspberrypi,bcm2835-firmware");
@@ -346,13 +346,15 @@ static int vc4_drm_bind(struct device *dev)
 		firmware = rpi_firmware_get(node);
 		of_node_put(node);
 
-		if (!firmware)
-			return -EPROBE_DEFER;
+		if (!firmware) {
+			ret = -EPROBE_DEFER;
+			goto err;
+		}
 	}
 
 	ret = drm_aperture_remove_framebuffers(driver);
 	if (ret)
-		return ret;
+		goto err;
 
 	if (firmware) {
 		ret = rpi_firmware_property(firmware,
@@ -366,32 +368,33 @@ static int vc4_drm_bind(struct device *dev)
 
 	ret = component_bind_all(dev, drm);
 	if (ret)
-		return ret;
+		goto err;
 
 	ret = devm_add_action_or_reset(dev, vc4_component_unbind_all, vc4);
 	if (ret)
-		return ret;
+		goto err;
 
 	ret = vc4_plane_create_additional_planes(drm);
 	if (ret)
-		goto unbind_all;
+		goto err;
 
 	ret = vc4_kms_load(drm);
 	if (ret < 0)
-		goto unbind_all;
+		goto err;
 
 	drm_for_each_crtc(crtc, drm)
 		vc4_crtc_disable_at_boot(crtc);
 
 	ret = drm_dev_register(drm, 0);
 	if (ret < 0)
-		goto unbind_all;
+		goto err;
 
 	drm_fbdev_dma_setup(drm, 16);
 
 	return 0;
 
-unbind_all:
+err:
+	platform_set_drvdata(pdev, NULL);
 	return ret;
 }
 
@@ -401,6 +404,7 @@ static void vc4_drm_unbind(struct device *dev)
 
 	drm_dev_unplug(drm);
 	drm_atomic_helper_shutdown(drm);
+	dev_set_drvdata(dev, NULL);
 }
 
 static const struct component_master_ops vc4_drm_ops = {
@@ -444,6 +448,11 @@ static void vc4_platform_drm_remove(struct platform_device *pdev)
 	component_master_del(&pdev->dev, &vc4_drm_ops);
 }
 
+static void vc4_platform_drm_shutdown(struct platform_device *pdev)
+{
+	drm_atomic_helper_shutdown(platform_get_drvdata(pdev));
+}
+
 static const struct of_device_id vc4_of_match[] = {
 	{ .compatible = "brcm,bcm2711-vc5", },
 	{ .compatible = "brcm,bcm2835-vc4", },
@@ -455,6 +464,7 @@ MODULE_DEVICE_TABLE(of, vc4_of_match);
 static struct platform_driver vc4_platform_driver = {
 	.probe		= vc4_platform_drm_probe,
 	.remove_new	= vc4_platform_drm_remove,
+	.shutdown	= vc4_platform_drm_shutdown,
 	.driver		= {
 		.name	= "vc4-drm",
 		.of_match_table = vc4_of_match,
-- 
2.42.0.283.g2d96d420d3-goog

