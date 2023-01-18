Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D50DF672778
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 19:48:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C57D010E1F8;
	Wed, 18 Jan 2023 18:48:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2.migadu.com (out2.migadu.com [188.165.223.204])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB55210E1F8
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 18:48:33 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ansari.sh; s=key1;
 t=1674067710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=z83rSeniNFHS7zJ60IN7wkL4BhzNsSKsud/i88hiibE=;
 b=jGtjR3tDpDLgkIXwpbeUAb575h46pQ2z5e51T7U93HFtA6L/t2gJ2lEBRdAqeOVJQTtATY
 t5Ali9Zl4oCiQmBNUc75O84Z5iNt5+6K8kZ+gnfCVCCHNC0aIxn762x8w/eHnr4DPZE1Ap
 qjOKSvk2XeqZssdaMBtfsweGGbT1bPg=
From: Rayyan Ansari <rayyan@ansari.sh>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH] drm/simpledrm: Allow physical width and height
 configuration via DT
Date: Wed, 18 Jan 2023 18:48:17 +0000
Message-Id: <20230118184817.608551-1-rayyan@ansari.sh>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Rayyan Ansari <rayyan@ansari.sh>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,
The following draft patch adds support for configuring the
height-mm and width-mm DRM properties in the simpledrm driver
via devicetree.
This is useful to get proper scaling in UIs such as Phosh.
An example of using this property is this, taken from my local tree:

		framebuffer0: framebuffer@3200000 {
			compatible = "simple-framebuffer";
			reg = <0x3200000 0x800000>;
			format = "a8r8g8b8";
			width = <720>;
			height = <1280>;
			stride = <(720 * 4)>;
			width-mm = /bits/ 16 <58>;
			height-mm = /bits/ 16 <103>;

			clocks = <&mmcc MDSS_AHB_CLK>,
				 <&mmcc MDSS_AXI_CLK>,
				 <&mmcc MDSS_BYTE0_CLK>,
				 <&mmcc MDSS_MDP_CLK>,
				 <&mmcc MDSS_PCLK0_CLK>,
				 <&mmcc MDSS_VSYNC_CLK>;
			power-domains = <&mmcc MDSS_GDSC>;
		};

I have tested this on my Lumia 735, and it does indeed
allow Phosh to scale correctly on the screen.

However, I would like to get some feedback before I write the
documentation.
- What data type should be used?
	The width_mm and height_mm properties of the drm_display_mode
	struct are defined as u16. I have also made the devicetree
	properties as the u16 type, but this requires specifying
	"/bits/ 16" before the value. Should u32 be used instead to get
	rid of this? If so, how could the conversion from u32->u16 be
	handled?
- Style?
	I have split the arguments to the DRM_MODE_INIT macro across
	multiple lines to increase readability. I'm not sure if this
	is the correct style though.
- Anything else?
	This is my first time writing code for a Linux driver, so I
	would be grateful if you have any suggestions for improvements.
 
Thanks,
Rayyan.
---
 drivers/gpu/drm/tiny/simpledrm.c | 49 +++++++++++++++++++++++++++-----
 1 file changed, 42 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 162eb44dcba8..92109f870b35 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -116,6 +116,15 @@ simplefb_get_format_pd(struct drm_device *dev,
 	return simplefb_get_validated_format(dev, pd->format);
 }
 
+static void
+simplefb_read_u16_of_optional(struct drm_device *dev, struct device_node *of_node,
+		     const char *name, u16 *value)
+{
+	int ret = of_property_read_u16(of_node, name, value);
+	if (ret)
+		value = 0;
+}
+
 static int
 simplefb_read_u32_of(struct drm_device *dev, struct device_node *of_node,
 		     const char *name, u32 *value)
@@ -184,6 +193,21 @@ simplefb_get_format_of(struct drm_device *dev, struct device_node *of_node)
 	return simplefb_get_validated_format(dev, format);
 }
 
+static u16
+simplefb_get_width_mm_of(struct drm_device *dev, struct device_node *of_node)
+{
+	u16 width_mm;
+	simplefb_read_u16_of_optional(dev, of_node, "width-mm", &width_mm);
+	return width_mm;
+}
+
+static u16
+simplefb_get_height_mm_of(struct drm_device *dev, struct device_node *of_node)
+{
+	u16 height_mm;
+	simplefb_read_u16_of_optional(dev, of_node, "height-mm", &height_mm);
+	return height_mm;
+}
 /*
  * Simple Framebuffer device
  */
@@ -599,16 +623,24 @@ static const struct drm_mode_config_funcs simpledrm_mode_config_funcs = {
  */
 
 static struct drm_display_mode simpledrm_mode(unsigned int width,
-					      unsigned int height)
+					      unsigned int height,
+					      u16 width_mm,
+					      u16 height_mm)
 {
 	/*
-	 * Assume a monitor resolution of 96 dpi to
-	 * get a somewhat reasonable screen size.
+	 * Assume a monitor resolution of 96 dpi if physical
+	 * dimensions are not specified to get a somewhat reasonable
+	 * screen size.
 	 */
+
 	const struct drm_display_mode mode = {
-		DRM_MODE_INIT(60, width, height,
-			      DRM_MODE_RES_MM(width, 96ul),
-			      DRM_MODE_RES_MM(height, 96ul))
+		DRM_MODE_INIT(
+			60,
+			width,
+			height,
+			(width_mm ? width_mm : DRM_MODE_RES_MM(width, 96ul)),
+			(height_mm ? height_mm : DRM_MODE_RES_MM(height, 96ul))
+			)
 	};
 
 	return mode;
@@ -622,6 +654,7 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 	struct simpledrm_device *sdev;
 	struct drm_device *dev;
 	int width, height, stride;
+	u16 width_mm, height_mm;
 	const struct drm_format_info *format;
 	struct resource *res, *mem;
 	void __iomem *screen_base;
@@ -676,6 +709,8 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 		format = simplefb_get_format_of(dev, of_node);
 		if (IS_ERR(format))
 			return ERR_CAST(format);
+		width_mm = simplefb_get_width_mm_of(dev, of_node);
+		height_mm = simplefb_get_height_mm_of(dev, of_node);
 	} else {
 		drm_err(dev, "no simplefb configuration found\n");
 		return ERR_PTR(-ENODEV);
@@ -686,7 +721,7 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 			return ERR_PTR(-EINVAL);
 	}
 
-	sdev->mode = simpledrm_mode(width, height);
+	sdev->mode = simpledrm_mode(width, height, width_mm, height_mm);
 	sdev->format = format;
 	sdev->pitch = stride;
 
-- 
2.39.0

