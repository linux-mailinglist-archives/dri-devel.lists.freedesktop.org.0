Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A20C78B4A9D
	for <lists+dri-devel@lfdr.de>; Sun, 28 Apr 2024 10:07:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE62D10F7DA;
	Sun, 28 Apr 2024 08:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dYCk4c0r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 971DA10F527
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Apr 2024 13:40:49 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-41b7a26326eso13120715e9.3
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Apr 2024 06:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714225248; x=1714830048; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yFM/BIbGMgi9bKV+Fk+cm/HhgYfloz9kI9XIMn+A5SI=;
 b=dYCk4c0rwaRggt7pYjFynSp623xrnUBCQMfbxQ3dqzf9TnAQNbLBVw9uHX+jjEqFI3
 DJJwX6GWiMxZpecT8bKeLViJK6l+4dbSCdnrZjzJ/wefkWrNvfr9xIwHWDwgvUCdEzEG
 RFrUdRmJRhAoX15ZEt2d9PTo+o6LpU292JcbfWO/Tb6vfoZ8eXmgHDP3mJPQKeGX1Xal
 LOMPvui8QmYKkzzuDaBfDDZr4+iIDiYFDrsrfvGzgeq4AI6USo5RUxZPyScDTQiBlcR6
 M4KVV2bXfnQxkQsGtMxji1/Yyoc52rtKPMFR+Uz5D2OBhiFPnUBJP62WOG2UQBbPX1C1
 Sx2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714225248; x=1714830048;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yFM/BIbGMgi9bKV+Fk+cm/HhgYfloz9kI9XIMn+A5SI=;
 b=ayryp6/DGP1+klQrALveqmPPewTWEAqGF7Xhcr1o96jPqlud41CZZyTc/So/FvUr/4
 ONRmXllcp9thztr/vDRGts2Mn2aWnMjlpleFxjQGIVYy4wdBAjBDCKHESS6MXT4LJenh
 Hi6CMgJgoa3OOLMgRqgOqj6UNiW3YEALLj6ChYjwNkNFbByna4k8KlL1wv1DltulfCGv
 aARUitKNztYWL7QvinyPKJtfFJ5T6+mV7p2gbJ2PxcpPPrZFSzWjTaKlWQ2nPOdbX2zt
 FzzKqwOwfdMGroi5h9NGRPrGe3p+bohpZ8I+I4lol+/rx908/jraGJSQoC+PsPYFG1Ai
 nW8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU53Z3JWIIW6Jwo0HnfPRoIhJ409XJSe5rkYgYsk1hOuNvHGr/0ncJHtioOmU5WzK8dGiVdGOBnJXkk/fSzmrdueVtQfi+2QFmQN3pQUnLv
X-Gm-Message-State: AOJu0YzIZARsmUt5bGwbTcspl2IxaGnpHv01DOa31s7KwbkMdC7KNh2n
 r3t1P2vgg88rAbZUU7SkAusIB6ez3XrI3WGU6rBiGUDwFIl34pBR
X-Google-Smtp-Source: AGHT+IGasWr0k0KEN5sP+v9RER4xfDUZYpeJMU8PqWe5qEU+lkJZ7i0M6DKAroSovgmgzTmPCbMgcg==
X-Received: by 2002:a5d:6d09:0:b0:34a:b682:7978 with SMTP id
 e9-20020a5d6d09000000b0034ab6827978mr4506308wrq.42.1714225247471; 
 Sat, 27 Apr 2024 06:40:47 -0700 (PDT)
Received: from localhost ([185.77.198.11]) by smtp.gmail.com with ESMTPSA id
 d9-20020adfe2c9000000b00349a5b8eba6sm25028151wrj.34.2024.04.27.06.40.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Apr 2024 06:40:47 -0700 (PDT)
From: Amer Al Shanawany <amer.shanawany@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Julia Lawall <julia.lawall@inria.fr>, Shuah Khan <shuah@kernel.org>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH] drm/vc4: remove all usages of of_node_put()
Date: Sat, 27 Apr 2024 15:40:44 +0200
Message-Id: <20240427134044.38910-1-amer.shanawany@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 28 Apr 2024 08:07:30 +0000
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

Use the scope-based cleanup feature to clean up 'struct device_node *'
when they go out of scope, and remove all instances of of_node_put()
within the same scope, to simplify function exit and avoid potential
memory leaks.

Suggested-by: Julia Lawall <julia.lawall@inria.fr>
Signed-off-by: Amer Al Shanawany <amer.shanawany@gmail.com>
---
 drivers/gpu/drm/vc4/vc4_drv.c  | 14 ++++++--------
 drivers/gpu/drm/vc4/vc4_hdmi.c |  4 +---
 drivers/gpu/drm/vc4/vc4_hvs.c  |  4 +---
 3 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index c133e96b8aca..bb0bb052e595 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -289,7 +289,6 @@ static int vc4_drm_bind(struct device *dev)
 	struct rpi_firmware *firmware = NULL;
 	struct drm_device *drm;
 	struct vc4_dev *vc4;
-	struct device_node *node;
 	struct drm_crtc *crtc;
 	bool is_vc5;
 	int ret = 0;
@@ -302,11 +301,10 @@ static int vc4_drm_bind(struct device *dev)
 	else
 		driver = &vc4_drm_driver;
 
-	node = of_find_matching_node_and_match(NULL, vc4_dma_range_matches,
-					       NULL);
+	struct device_node *node __free(device_node) =
+		of_find_matching_node_and_match(NULL, vc4_dma_range_matches, NULL);
 	if (node) {
 		ret = of_dma_configure(dev, node, true);
-		of_node_put(node);
 
 		if (ret)
 			return ret;
@@ -341,10 +339,10 @@ static int vc4_drm_bind(struct device *dev)
 			goto err;
 	}
 
-	node = of_find_compatible_node(NULL, NULL, "raspberrypi,bcm2835-firmware");
-	if (node) {
-		firmware = rpi_firmware_get(node);
-		of_node_put(node);
+	struct device_node *np __free(device_node) =
+		of_find_compatible_node(NULL, NULL, "raspberrypi,bcm2835-firmware");
+	if (np) {
+		firmware = rpi_firmware_get(np);
 
 		if (!firmware) {
 			ret = -EPROBE_DEFER;
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index d30f8e8e8967..915e8da3f41a 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -3661,7 +3661,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	struct drm_device *drm = dev_get_drvdata(master);
 	struct vc4_hdmi *vc4_hdmi;
 	struct drm_encoder *encoder;
-	struct device_node *ddc_node;
 	int ret;
 
 	vc4_hdmi = drmm_kzalloc(drm, sizeof(*vc4_hdmi), GFP_KERNEL);
@@ -3699,14 +3698,13 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	ddc_node = of_parse_phandle(dev->of_node, "ddc", 0);
+	struct device_node *ddc_node __free(device_node) = of_parse_phandle(dev->of_node, "ddc", 0);
 	if (!ddc_node) {
 		DRM_ERROR("Failed to find ddc node in device tree\n");
 		return -ENODEV;
 	}
 
 	vc4_hdmi->ddc = of_find_i2c_adapter_by_node(ddc_node);
-	of_node_put(ddc_node);
 	if (!vc4_hdmi->ddc) {
 		DRM_DEBUG("Failed to get ddc i2c adapter by node\n");
 		return -EPROBE_DEFER;
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 04af672caacb..6e3613e06e09 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -845,15 +845,13 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 
 	if (vc4->is_vc5) {
 		struct rpi_firmware *firmware;
-		struct device_node *node;
+		struct device_node *node __free(device_node) = rpi_firmware_find_node();
 		unsigned int max_rate;
 
-		node = rpi_firmware_find_node();
 		if (!node)
 			return -EINVAL;
 
 		firmware = rpi_firmware_get(node);
-		of_node_put(node);
 		if (!firmware)
 			return -EPROBE_DEFER;
 
-- 
2.34.1

