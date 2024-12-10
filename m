Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD7B9EB839
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 18:28:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7B9810E07A;
	Tue, 10 Dec 2024 17:28:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="JODId8yg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1FA10E07A
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 17:28:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 97D481C0008;
 Tue, 10 Dec 2024 17:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1733851703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sppw2oR439agUMdzcxsUIW3PHbZCDRpDXz1PWFEDZqg=;
 b=JODId8ygzBFYH024S/pNXn2rUaT8mzt5tAybIlLQbhqr1gB22kOZzjiWpPWZVFQpqzsj38
 DbzZfLvlN9hpDyxtIEx5gShUKCbVTnm+gXpkfL+pZY0gIlyA3PilqwSKnMsX/BFAAUsUng
 AIUikuKqJ/wWvI3m1Y2032Vctsr8+MEXEJ/hH6exVnnesJQy2Xe5myx+u88eetEZMTx8nD
 PKXFN8usE6kIdelNqSHJsYz3KomKVxxBwWjr0CRGte8L5P5mamKXKCeETdJ4QL81r5To/l
 JN2SK+8ZkRveONqQxjagoT09OuNc+e+xRMSMW5/UrGk4fHligNUVoVPFsIo7ng==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 10 Dec 2024 18:28:04 +0100
Subject: [PATCH 2/2] drm/panel: simple: Add Tianma TM070JDHG34-00 panel support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-tianma_tm070jdhg34-v1-2-9fb7fe6b6cf0@bootlin.com>
References: <20241210-tianma_tm070jdhg34-v1-0-9fb7fe6b6cf0@bootlin.com>
In-Reply-To: <20241210-tianma_tm070jdhg34-v1-0-9fb7fe6b6cf0@bootlin.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: luca.ceresoli@bootlin.com
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

Add Tianma TM070JDHG34-00 7.0" 1280x800 LVDS RGB TFT LCD panel.

Panel info and datasheet: https://fortec.us/products/tm070jdhg34-00/

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 42 ++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 1562f122724137dec37eb11443eafc896ef2f2e8..b3c931a4e46a2568b3678d664f11b189873fa1e2 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -4286,6 +4286,45 @@ static const struct panel_desc tianma_tm070jvhg33 = {
 	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
 };
 
+/*
+ * The datasheet computes total blanking as back porch + front porch, not
+ * including sync pulse width. This is for both H and V. To make the total
+ * blanking and period correct, subtract the pulse width from the front
+ * porch.
+ *
+ * This works well for the Min and Typ values, but for Max values the sync
+ * pulse width is higher than back porch + front porch, so work around that
+ * by reducing the Max sync length value to 1 and then treating the Max
+ * porches as in the Min and Typ cases.
+ *
+ * Exact datasheet values are added as a comment where they differ from the
+ * ones implemented for the above reason.
+ */
+static const struct display_timing tianma_tm070jdhg34_00_timing = {
+	.pixelclock = { 68400000, 71900000, 78100000 },
+	.hactive = { 1280, 1280, 1280 },
+	.hfront_porch = { 130, 138, 158 }, /* 131, 139, 159 */
+	.hback_porch = { 5, 5, 5 },
+	.hsync_len = { 1, 1, 1 }, /* 1, 1, 256 */
+	.vactive = { 800, 800, 800 },
+	.vfront_porch = { 2, 39, 98 }, /* 3, 40, 99 */
+	.vback_porch = { 2, 2, 2 },
+	.vsync_len = { 1, 1, 1 }, /* 1, 1, 128 */
+	.flags = DISPLAY_FLAGS_DE_HIGH,
+};
+
+static const struct panel_desc tianma_tm070jdhg34_00 = {
+	.timings = &tianma_tm070jdhg34_00_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 150, /* 149.76 */
+		.height = 94, /* 93.60 */
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct display_timing tianma_tm070rvhg71_timing = {
 	.pixelclock = { 27700000, 29200000, 39600000 },
 	.hactive = { 800, 800, 800 },
@@ -5028,6 +5067,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "tianma,tm070jdhg30",
 		.data = &tianma_tm070jdhg30,
+	}, {
+		.compatible = "tianma,tm070jdhg34-00",
+		.data = &tianma_tm070jdhg34_00,
 	}, {
 		.compatible = "tianma,tm070jvhg33",
 		.data = &tianma_tm070jvhg33,

-- 
2.34.1

