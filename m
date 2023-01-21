Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E76676734
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 16:36:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EBBB10E14C;
	Sat, 21 Jan 2023 15:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2.migadu.com (out2.migadu.com [188.165.223.204])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A19F10E2D5
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 15:36:26 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ansari.sh; s=key1;
 t=1674315383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A4c8WkU35Mq5MDZit6NsQwryhg7/hXEwGbhE/MTvXvA=;
 b=EvhIzhnmrTwhMfdhF5oPG9UJeknkJw+xNAd4IY2QbS2p6vOSWTo3Vd/O8w2WbFbFBsWluL
 1QeQXbrSZBOvaoXPV5eekY9OktKC0xJhhPNkva+47XL9au1Xw07raV6gnfCKtVlzQtfjT/
 yAyoQ+DKnhhzoIun8OK5dz6sLBQl/x0=
From: Rayyan Ansari <rayyan@ansari.sh>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/simpledrm: Allow physical width and height
 configuration via DT
Date: Sat, 21 Jan 2023 15:35:43 +0000
Message-Id: <20230121153544.467126-2-rayyan@ansari.sh>
In-Reply-To: <20230121153544.467126-1-rayyan@ansari.sh>
References: <20230121153544.467126-1-rayyan@ansari.sh>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, janne@jannau.net,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rayyan Ansari <rayyan@ansari.sh>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, asahi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Rayyan Ansari <rayyan@ansari.sh>
---
 drivers/gpu/drm/tiny/simpledrm.c | 60 +++++++++++++++++++++++++++-----
 1 file changed, 51 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 162eb44dcba8..7aab7fa572f0 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -128,6 +128,23 @@ simplefb_read_u32_of(struct drm_device *dev, struct device_node *of_node,
 	return ret;
 }
 
+static int
+simplefb_read_u32_of_opt(struct drm_device *dev, struct device_node *of_node,
+			 const char *name, u32 *value)
+{
+	int ret = of_property_read_u32(of_node, name, value);
+
+	if (ret == -EINVAL) {
+		*value = 0;
+		ret = 0;
+	} else if (ret) {
+		drm_err(dev, "simplefb: cannot parse framebuffer %s: error %d\n",
+			name, ret);
+	}
+
+	return ret;
+}
+
 static int
 simplefb_read_string_of(struct drm_device *dev, struct device_node *of_node,
 			const char *name, const char **value)
@@ -184,6 +201,19 @@ simplefb_get_format_of(struct drm_device *dev, struct device_node *of_node)
 	return simplefb_get_validated_format(dev, format);
 }
 
+static int
+simplefb_get_mm_of(struct drm_device *dev, struct device_node *of_node,
+		   const char *name)
+{
+	int mm;
+	int ret = simplefb_read_u32_of_opt(dev, of_node, name, &mm);
+
+	if (ret)
+		return ret;
+	return simplefb_get_validated_int(dev, name, mm);
+}
+
+
 /*
  * Simple Framebuffer device
  */
@@ -599,16 +629,12 @@ static const struct drm_mode_config_funcs simpledrm_mode_config_funcs = {
  */
 
 static struct drm_display_mode simpledrm_mode(unsigned int width,
-					      unsigned int height)
+					      unsigned int height,
+					      unsigned int width_mm,
+					      unsigned int height_mm)
 {
-	/*
-	 * Assume a monitor resolution of 96 dpi to
-	 * get a somewhat reasonable screen size.
-	 */
 	const struct drm_display_mode mode = {
-		DRM_MODE_INIT(60, width, height,
-			      DRM_MODE_RES_MM(width, 96ul),
-			      DRM_MODE_RES_MM(height, 96ul))
+		DRM_MODE_INIT(60, width, height, width_mm, height_mm)
 	};
 
 	return mode;
@@ -622,6 +648,7 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 	struct simpledrm_device *sdev;
 	struct drm_device *dev;
 	int width, height, stride;
+	int width_mm = 0, height_mm = 0;
 	const struct drm_format_info *format;
 	struct resource *res, *mem;
 	void __iomem *screen_base;
@@ -676,6 +703,12 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 		format = simplefb_get_format_of(dev, of_node);
 		if (IS_ERR(format))
 			return ERR_CAST(format);
+		width_mm = simplefb_get_mm_of(dev, of_node, "width-mm");
+		if (width_mm < 0)
+			return ERR_PTR(width_mm);
+		height_mm = simplefb_get_mm_of(dev, of_node, "height-mm");
+		if (height_mm < 0)
+			return ERR_PTR(height_mm);
 	} else {
 		drm_err(dev, "no simplefb configuration found\n");
 		return ERR_PTR(-ENODEV);
@@ -686,7 +719,16 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 			return ERR_PTR(-EINVAL);
 	}
 
-	sdev->mode = simpledrm_mode(width, height);
+	/*
+	 * Assume a monitor resolution of 96 dpi if physical dimensions
+	 * are not specified to get a somewhat reasonable screen size.
+	 */
+	if (!width_mm)
+		width_mm = DRM_MODE_RES_MM(width, 96ul);
+	if (!height_mm)
+		height_mm = DRM_MODE_RES_MM(height, 96ul);
+
+	sdev->mode = simpledrm_mode(width, height, width_mm, height_mm);
 	sdev->format = format;
 	sdev->pitch = stride;
 
-- 
2.39.0

