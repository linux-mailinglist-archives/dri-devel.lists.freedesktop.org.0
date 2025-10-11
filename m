Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57641BCF91C
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 19:03:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3E810E329;
	Sat, 11 Oct 2025 17:03:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="VIriWbjX";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="eFh54Wsz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E77CD10E329
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 17:03:39 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ckVLf5Wypz9swL;
 Sat, 11 Oct 2025 19:03:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jLp6T6L2zW99BHei23N4qQleo9dYVs5bzxJ9QTg60a8=;
 b=VIriWbjXu75+yG7PH3NUkt0J/DC+6Q3+WS7ftmR7QhMkg69Kj/BiirDdNuag1tTpITlpvq
 vZj0cGVx086GG9QGHWv4JWm8a5RJ6gKJ1TrqRtyfddZfDmQ6CZR4yso0bI8VOGQIATTsAE
 zZac5dqsXG2eW7/inMjSHsxAvjBGhLKgwa1VJxBCOZMKyTBtS5ZnGskqYhncyb46dWnpv7
 frxTKWBNOS6Bgp0ugHHnxYt89apiOVXnEVHa9r+k6r/Iw/6GLCN3ObV6CZb5xhWqa+tnJf
 QNHzSfn8wtTGl5wFN496GJH0sbtics8bgh2LrULcW44k5RFa03jPXXeQTeCWcQ==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jLp6T6L2zW99BHei23N4qQleo9dYVs5bzxJ9QTg60a8=;
 b=eFh54WszjmQkSrkL5WCM21UxHE8vB0tuOQa0YkxQoOH5W9GDLwJ7ZzLpkkwOvXssgfhFKe
 Pyh2xfc3LDeGe9SfgggEtRSRXRN0W79FAwd1FA5GkHODsEG3/B6xnYCva/npFeGhbsY2f5
 xBcjCAFB9A+IXelQmfoOX4Lf99qSdoopQI2/K/ThSgmOT0rzUlpg5sLCVPABKhVRkqCP8o
 3nrwyKpJIlIv6r2J1hoOjXBiDJ3I47Wg+Q0B5hpKT3R+bcQDmlnDfao09dqqAPQkqDle6H
 3x8Dq59zlFsRtbT7oJic5Kc3E/LqcvTC1GFetOsSU0P2ig5CHIBS9YFwRvlF+Q==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: [PATCH 16/39] drm/imx: dc: lb: Pass struct dc_lb_subdev_match_data
 via OF match data
Date: Sat, 11 Oct 2025 18:51:31 +0200
Message-ID: <20251011170213.128907-17-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 5j1qpo8ip6h94zo5na7oeqg8o57hh4n8
X-MBO-RS-ID: f7a1561dbebab1b85e0
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

Introduce struct dc_lb_subdev_match_data which describes the differences
between i.MX8QXP and i.MX95, which in this case link ID mapping as well
as address space offsets, and pass it as OF match data into the driver, so
the driver can use the match data to correctly select pixel data routing.
This is a preparatory patch for i.MX95 addition. No functional change.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
 drivers/gpu/drm/imx/dc/dc-lb.c | 42 ++++++++++++++++++++++++++--------
 drivers/gpu/drm/imx/dc/dc-pe.h |  3 +++
 2 files changed, 35 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-lb.c b/drivers/gpu/drm/imx/dc/dc-lb.c
index 619353456743c..ba9183b244ab3 100644
--- a/drivers/gpu/drm/imx/dc/dc-lb.c
+++ b/drivers/gpu/drm/imx/dc/dc-lb.c
@@ -56,6 +56,14 @@
 #define  YPOS_MASK				GENMASK(31, 16)
 #define  YPOS(x)				FIELD_PREP(YPOS_MASK, (x))
 
+struct dc_lb_subdev_match_data {
+	const enum dc_link_id		*pri_sels;
+	const enum dc_link_id		*sec_sels;
+	const enum dc_link_id		first_lb;
+	unsigned int			last_cf;
+	const struct dc_subdev_info	*info;
+};
+
 enum dc_lb_blend_func {
 	DC_LAYERBLEND_BLEND_ZERO,
 	DC_LAYERBLEND_BLEND_ONE,
@@ -119,7 +127,7 @@ static const struct regmap_config dc_lb_cfg_regmap_config = {
 	.max_register = POSITION,
 };
 
-static const enum dc_link_id prim_sels[] = {
+static const enum dc_link_id prim_sels_imx8qxp[] = {
 	/* common options */
 	LINK_ID_NONE,
 	LINK_ID_CONSTFRAME0,
@@ -137,12 +145,22 @@ static const enum dc_link_id prim_sels[] = {
 	LINK_ID_LAYERBLEND1_MX8QXP,
 	LINK_ID_LAYERBLEND2_MX8QXP,
 	LINK_ID_LAYERBLEND3_MX8QXP,
+	LINK_ID_LAST
 };
 
-static const enum dc_link_id sec_sels[] = {
+static const enum dc_link_id sec_sels_imx8qxp[] = {
 	LINK_ID_NONE,
 	LINK_ID_FETCHWARP2,
 	LINK_ID_FETCHLAYER0,
+	LINK_ID_LAST
+};
+
+static const struct dc_lb_subdev_match_data dc_lb_match_data_imx8qxp = {
+	.pri_sels = prim_sels_imx8qxp,
+	.sec_sels = sec_sels_imx8qxp,
+	.first_lb = LINK_ID_LAYERBLEND0_MX8QXP,
+	.last_cf = 5,
+	.info = dc_lb_info_imx8qxp,
 };
 
 enum dc_link_id dc_lb_get_link_id(struct dc_lb *lb)
@@ -152,11 +170,10 @@ enum dc_link_id dc_lb_get_link_id(struct dc_lb *lb)
 
 void dc_lb_pec_dynamic_prim_sel(struct dc_lb *lb, enum dc_link_id prim)
 {
-	int fixed_sels_num = ARRAY_SIZE(prim_sels) - 4;
 	int i;
 
-	for (i = 0; i < fixed_sels_num + lb->id; i++) {
-		if (prim_sels[i] == prim) {
+	for (i = 0; i < lb->last_cf + lb->id; i++) {
+		if (lb->pri_sels[i] == prim) {
 			regmap_write_bits(lb->reg_pec, PIXENGCFG_DYNAMIC,
 					  PIXENGCFG_DYNAMIC_PRIM_SEL_MASK,
 					  PIXENGCFG_DYNAMIC_PRIM_SEL(prim));
@@ -169,10 +186,10 @@ void dc_lb_pec_dynamic_prim_sel(struct dc_lb *lb, enum dc_link_id prim)
 
 void dc_lb_pec_dynamic_sec_sel(struct dc_lb *lb, enum dc_link_id sec)
 {
-	int i;
+	int i = 0;
 
-	for (i = 0; i < ARRAY_SIZE(sec_sels); i++) {
-		if (sec_sels[i] == sec) {
+	while (lb->sec_sels[i] != LINK_ID_LAST) {
+		if (lb->sec_sels[i++] == sec) {
 			regmap_write_bits(lb->reg_pec, PIXENGCFG_DYNAMIC,
 					  PIXENGCFG_DYNAMIC_SEC_SEL_MASK,
 					  PIXENGCFG_DYNAMIC_SEC_SEL(sec));
@@ -245,6 +262,8 @@ void dc_lb_init(struct dc_lb *lb)
 
 static int dc_lb_bind(struct device *dev, struct device *master, void *data)
 {
+	const struct dc_lb_subdev_match_data *dc_lb_match_data = device_get_match_data(dev);
+	const struct dc_subdev_info *dc_lb_info = dc_lb_match_data->info;
 	struct platform_device *pdev = to_platform_device(dev);
 	struct dc_drm_device *dc_drm = data;
 	struct resource *res_pec;
@@ -281,7 +300,10 @@ static int dc_lb_bind(struct device *dev, struct device *master, void *data)
 	}
 
 	lb->dev = dev;
-	lb->link = LINK_ID_LAYERBLEND0_MX8QXP + lb->id;
+	lb->link = dc_lb_match_data->first_lb + lb->id;
+	lb->pri_sels = dc_lb_match_data->pri_sels;
+	lb->sec_sels = dc_lb_match_data->sec_sels;
+	lb->last_cf = dc_lb_match_data->last_cf;
 
 	dc_drm->lb[lb->id] = lb;
 
@@ -310,7 +332,7 @@ static void dc_lb_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id dc_lb_dt_ids[] = {
-	{ .compatible = "fsl,imx8qxp-dc-layerblend" },
+	{ .compatible = "fsl,imx8qxp-dc-layerblend", .data = &dc_lb_match_data_imx8qxp },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dc_lb_dt_ids);
diff --git a/drivers/gpu/drm/imx/dc/dc-pe.h b/drivers/gpu/drm/imx/dc/dc-pe.h
index 7928f947b0cef..492d193127bc1 100644
--- a/drivers/gpu/drm/imx/dc/dc-pe.h
+++ b/drivers/gpu/drm/imx/dc/dc-pe.h
@@ -65,6 +65,9 @@ struct dc_lb {
 	struct regmap *reg_cfg;
 	int id;
 	enum dc_link_id link;
+	const enum dc_link_id *pri_sels;
+	const enum dc_link_id *sec_sels;
+	unsigned int last_cf;
 };
 
 struct dc_pe {
-- 
2.51.0

