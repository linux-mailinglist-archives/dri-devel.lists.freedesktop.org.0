Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4504F8BDF23
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 11:58:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 345E410F476;
	Tue,  7 May 2024 09:57:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="R/rD0RZp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FCC810F443
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 09:57:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AB2DF61646;
 Tue,  7 May 2024 09:57:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F2A1FC4DDE1;
 Tue,  7 May 2024 09:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715075868;
 bh=VxXd1pVTHgFPYpuyHPxoomX3P5xw2HYOOi9eD32Pv50=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=R/rD0RZpzX60V6mKu6LHwlotXtVKIc0qG5leuoiKU8hHsS4eNft4MnkCIm7mvacgq
 XsLYauJ+Ajg4W9+Ajm7IGE2f5v8wQpY9WF2vCDGTLa+kE9ZbYiIzI1A8fRo6jyC6xq
 kzXvRwJ/NfhgnaX7vtOUMgy8eGV5IdUpELduEEzxkN+bZOIuP+iY760uFe5HnHVscI
 ry2xlKgv4EuxQmfvnSiKwJy1OrtuyNu9vIHimEgqe2QNRLv75UwF45cC3n4HD2K9+S
 O9urKOHWVrA+GlkQwcye/DKyXc3o2xkgGx99Ion3Z7JD2dXzo5yhi8j6JkpB0DbTSl
 Bi+d9VKDxHubA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id E6C3EC25B78;
 Tue,  7 May 2024 09:57:47 +0000 (UTC)
From: =?utf-8?q?Noralf_Tr=C3=B8nnes_via_B4_Relay?=
 <devnull+noralf.tronnes.org@kernel.org>
Date: Tue, 07 May 2024 11:57:30 +0200
Subject: [PATCH 5/5] drm/tiny: panel-mipi-dbi: Support the pixel format
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240507-panel-mipi-dbi-rgb666-v1-5-6799234afa3e@tronnes.org>
References: <20240507-panel-mipi-dbi-rgb666-v1-0-6799234afa3e@tronnes.org>
In-Reply-To: <20240507-panel-mipi-dbi-rgb666-v1-0-6799234afa3e@tronnes.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>, 
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>, 
 =?utf-8?q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715075866; l=2926;
 i=noralf@tronnes.org; s=20221122; h=from:subject:message-id;
 bh=VkhLn8bg4+tzwHP3nVSjku8IqF1KyX0WKDV/6VouitQ=;
 b=bFYvp+sDnQMW8JJzoM3HGr82mP1zBTTSlRLZyXFf66wZVKC4zboe/8gY/RmUDjx662lLgoh5A
 NqkP6in6eQxCj0jVHXhcQLFjg9uTxVfRuq5AgQHbKTIm7arpKb5w/D2
X-Developer-Key: i=noralf@tronnes.org; a=ed25519;
 pk=0o9is4iddvvlrY3yON5SVtAbgPnVs0LfQsjfqR2Hvz8=
X-Endpoint-Received: by B4 Relay for noralf@tronnes.org/20221122 with auth_id=8
X-Original-From: =?utf-8?q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
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
Reply-To: noralf@tronnes.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Noralf Trønnes <noralf@tronnes.org>

Add support for these pixel format property values:
- r5g6b5, RGB565
- b6x2g6x2r6x2, BGR666

BGR666 is presented to userspace as RGB888. The 2 LSB in each color
are discarded by the controller. The pixel is sent on the wire using
8 bits per word (little endian) so the controller sees it as BGR.

RGB565 is the default if the property is not present.

Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/tiny/panel-mipi-dbi.c | 55 ++++++++++++++++++++++++++++++++++-
 1 file changed, 54 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/panel-mipi-dbi.c b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
index f80a141fcf36..f3aa2abce314 100644
--- a/drivers/gpu/drm/tiny/panel-mipi-dbi.c
+++ b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
@@ -26,6 +26,49 @@
 
 #include <video/mipi_display.h>
 
+struct panel_mipi_dbi_format {
+	const char *name;
+	u32 fourcc;
+	unsigned int bpp;
+};
+
+static const struct panel_mipi_dbi_format panel_mipi_dbi_formats[] = {
+	{ "r5g6b5", DRM_FORMAT_RGB565, 16 },
+	{ "b6x2g6x2r6x2", DRM_FORMAT_RGB888, 24 },
+};
+
+static int panel_mipi_dbi_get_format(struct device *dev, u32 *formats, unsigned int *bpp)
+{
+	const char *format_name;
+	unsigned int i;
+	int ret;
+
+	formats[1] = DRM_FORMAT_XRGB8888;
+
+	ret = device_property_read_string(dev, "format", &format_name);
+	if (ret) {
+		/* Old Device Trees don't have this property */
+		formats[0] = DRM_FORMAT_RGB565;
+		*bpp = 16;
+		return 0;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(panel_mipi_dbi_formats); i++) {
+		const struct panel_mipi_dbi_format *format = &panel_mipi_dbi_formats[i];
+
+		if (strcmp(format_name, format->name))
+			continue;
+
+		formats[0] = format->fourcc;
+		*bpp = format->bpp;
+		return 0;
+	}
+
+	dev_err(dev, "Pixel format is not supported: '%s'\n", format_name);
+
+	return -EINVAL;
+}
+
 static const u8 panel_mipi_dbi_magic[15] = { 'M', 'I', 'P', 'I', ' ', 'D', 'B', 'I',
 					     0, 0, 0, 0, 0, 0, 0 };
 
@@ -276,6 +319,9 @@ static int panel_mipi_dbi_spi_probe(struct spi_device *spi)
 	struct drm_device *drm;
 	struct mipi_dbi *dbi;
 	struct gpio_desc *dc;
+	unsigned int bpp;
+	size_t buf_size;
+	u32 formats[2];
 	int ret;
 
 	dbidev = devm_drm_dev_alloc(dev, &panel_mipi_dbi_driver, struct mipi_dbi_dev, drm);
@@ -323,7 +369,14 @@ static int panel_mipi_dbi_spi_probe(struct spi_device *spi)
 	if (IS_ERR(dbidev->driver_private))
 		return PTR_ERR(dbidev->driver_private);
 
-	ret = mipi_dbi_dev_init(dbidev, &panel_mipi_dbi_pipe_funcs, &mode, 0);
+	ret = panel_mipi_dbi_get_format(dev, formats, &bpp);
+	if (ret)
+		return ret;
+
+	buf_size = DIV_ROUND_UP(mode.hdisplay * mode.vdisplay * bpp, 8);
+	ret = mipi_dbi_dev_init_with_formats(dbidev, &panel_mipi_dbi_pipe_funcs,
+					     formats, ARRAY_SIZE(formats),
+					     &mode, 0, buf_size);
 	if (ret)
 		return ret;
 

-- 
2.45.0


