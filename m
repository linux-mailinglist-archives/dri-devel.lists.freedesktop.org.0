Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BE98FB363
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 15:20:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A92E10E47D;
	Tue,  4 Jun 2024 13:20:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="b3/2MSNl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1512410E482
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 13:20:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 64D11612CE;
 Tue,  4 Jun 2024 13:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 94F3EC4AF14;
 Tue,  4 Jun 2024 13:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717507239;
 bh=DC5EZsEx+rBT/MPOOSxJY0nl4J0fot6cQcgzpc29Qek=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=b3/2MSNllqyZt/ndR9uLIfWcxQ8T0TOWCiiRcdfxwn5B8TRzecc3bGGUcrOHw1Q1P
 gQg9WfEQqHxJ5leWGZ52rFz3OVyOwe3095J7ohU0QqJZs6Ec08wiHctp1KnAH/3OCa
 EA0Z9Nhy5DaeDq5cMV3qNTNDa/nHs177Augg+MMbvpM/tac/rY54O2S1qePc+tPx7V
 UE7zdbelk1KpcFgVbQiRzVIdVlqXAFJiozPP72eHbn/wxjoWENwPmcBFc4C7MVJBWa
 OmVUv2JsodaRlVg0lCus039+SCBYmWV95TVSiCDm1JyuY7kXZo2RMa3S0DJHMqNNUn
 cRNTezlxMchcg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 8C89EC25B78;
 Tue,  4 Jun 2024 13:20:39 +0000 (UTC)
From: =?utf-8?q?Noralf_Tr=C3=B8nnes_via_B4_Relay?=
 <devnull+noralf.tronnes.org@kernel.org>
Date: Tue, 04 Jun 2024 15:20:32 +0200
Subject: [PATCH v4 5/5] drm/tiny: panel-mipi-dbi: Support the pixel format
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240604-panel-mipi-dbi-rgb666-v4-5-d7c2bcb9b78d@tronnes.org>
References: <20240604-panel-mipi-dbi-rgb666-v4-0-d7c2bcb9b78d@tronnes.org>
In-Reply-To: <20240604-panel-mipi-dbi-rgb666-v4-0-d7c2bcb9b78d@tronnes.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Lechner <david@lechnology.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>, 
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>, 
 =?utf-8?q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717507238; l=2983;
 i=noralf@tronnes.org; s=20221122; h=from:subject:message-id;
 bh=NSd8WCcz3mEyAmd3gnS4mEuzeD9kKvKEnfrPdQSMiME=;
 b=QvW48LB0GjDH9HPC/0Wul41Y4uUWFArhOzcr2VcGbC9AKxHRLwJohaihMp/Uj0HpB3kw71GIh
 b+h1Tzn7380CdwyT3RcIDhiVoGjvR+At1vUxRDodcKEtokdw7R/1GiT
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

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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
2.45.1


