Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AB6BCF8B0
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 19:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E40C10E311;
	Sat, 11 Oct 2025 17:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="c60H68j8";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="IoylzJtJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE3810E311
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 17:03:07 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ckVL25NMQz9svm;
 Sat, 11 Oct 2025 19:03:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pmtF7sr5VKHGaQnCr/8RpPbC8MxI/zKFym2ctoTYmv8=;
 b=c60H68j8CLPjRm3JNtqEGHAzSm9WDeguj+ZdNECw+wst96nsyREzM75mfRZvdfrv4eSmVI
 eZcfx48rza3WuO+7iGsmI8uhlvLY/jRRZm2tX368TQxMJ+HgoHEH9Uy1UioL+IrM3sks57
 AluBtY5NGYcDLoHhnHbFiqBeRkJkEA3R4mpddZNaHN+ZnrStWW2y3PNZKp6kV219zCdDfy
 jHzYxg4ESwtbkUBIktOtLYUcCqK3oEF6OlCBGoqksh/XD0wzhhsVD4F6Ds5d76OlloVSbm
 qkaDu9DeTGd38q5EX/xUST8JdlVFG9mzr3JKrQUdh5YD8lCZuNZJ9ZYByh2ihw==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pmtF7sr5VKHGaQnCr/8RpPbC8MxI/zKFym2ctoTYmv8=;
 b=IoylzJtJtbMJkBc/HlYKP5IEzrSZTySyIYZmsSYwJ7ALSM/1FY3x29CsJMmaNahHHwktP0
 9hxrHePDaVE+CE9aENXvrcjK3XjjxGXn3NHmLnlYsqwQQwoA9NxPO+uHheBGUi+0I+wyZs
 c+Iltd18UdSnZEGOIFBdsPvjg21NHu5Vr76OWGMLOTIUs8DBwmrDKvSvHuOz3+1X5Ant/p
 XacxT0eYbEeHWBgo3HPAgw43/3US3Fp1dDG/Ac+zxrKurnDxeS7csk9Q8sUsMSHz4QuoRa
 W0kD5OFsPirsFrkSzEIpAZBaUlOfzh4DuyYAFkd0gWFiidKJspOqqTF9GuJSnQ==
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
Subject: [PATCH 05/39] drm/imx: dc: Rework dc_subdev_get_id() to drop
 ARRAY_SIZE() use
Date: Sat, 11 Oct 2025 18:51:20 +0200
Message-ID: <20251011170213.128907-6-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 13b9dfbe60165ab100e
X-MBO-RS-META: jxz5ib93m94j66tt7d7149g53wu7jamq
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

Rework dc_subdev_get_id() to drop ARRAY_SIZE() use and use empty trailing
entry in each ID look up array instead. This allows passing of those arrays
around as OF match data, which will be useful when using this pipeline on
i.MX95, which has different address-to-ID mapping.

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
 drivers/gpu/drm/imx/dc/dc-cf.c  | 3 ++-
 drivers/gpu/drm/imx/dc/dc-db.c  | 3 ++-
 drivers/gpu/drm/imx/dc/dc-de.c  | 3 ++-
 drivers/gpu/drm/imx/dc/dc-drv.h | 8 +++++---
 drivers/gpu/drm/imx/dc/dc-ed.c  | 3 ++-
 drivers/gpu/drm/imx/dc/dc-fg.c  | 3 ++-
 drivers/gpu/drm/imx/dc/dc-fl.c  | 3 ++-
 drivers/gpu/drm/imx/dc/dc-fw.c  | 3 ++-
 drivers/gpu/drm/imx/dc/dc-lb.c  | 3 ++-
 drivers/gpu/drm/imx/dc/dc-tc.c  | 3 ++-
 10 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-cf.c b/drivers/gpu/drm/imx/dc/dc-cf.c
index 2f077161e9126..846705534546a 100644
--- a/drivers/gpu/drm/imx/dc/dc-cf.c
+++ b/drivers/gpu/drm/imx/dc/dc-cf.c
@@ -29,6 +29,7 @@ static const struct dc_subdev_info dc_cf_info[] = {
 	{ .reg_start = 0x561809e0, .id = 1, },
 	{ .reg_start = 0x561809a0, .id = 4, },
 	{ .reg_start = 0x56180a20, .id = 5, },
+	{ /* sentinel */ },
 };
 
 static const struct regmap_range dc_cf_regmap_ranges[] = {
@@ -106,7 +107,7 @@ static int dc_cf_bind(struct device *dev, struct device *master, void *data)
 	if (IS_ERR(cf->reg_cfg))
 		return PTR_ERR(cf->reg_cfg);
 
-	id = dc_subdev_get_id(dc_cf_info, ARRAY_SIZE(dc_cf_info), res_pec);
+	id = dc_subdev_get_id(dc_cf_info, res_pec);
 	if (id < 0) {
 		dev_err(dev, "failed to get instance number: %d\n", id);
 		return id;
diff --git a/drivers/gpu/drm/imx/dc/dc-db.c b/drivers/gpu/drm/imx/dc/dc-db.c
index 789942d1c446d..3958a2c4ec934 100644
--- a/drivers/gpu/drm/imx/dc/dc-db.c
+++ b/drivers/gpu/drm/imx/dc/dc-db.c
@@ -74,6 +74,7 @@ enum dc_db_shadow_sel {
 static const struct dc_subdev_info dc_db_info[] = {
 	{ .reg_start = 0x4b6a0000, .id = 0, },
 	{ .reg_start = 0x4b720000, .id = 1, },
+	{ /* sentinel */ },
 };
 
 static const struct regmap_range dc_db_regmap_ranges[] = {
@@ -176,7 +177,7 @@ static int dc_db_bind(struct device *dev, struct device *master, void *data)
 	if (IS_ERR(db->reg_cfg))
 		return PTR_ERR(db->reg_cfg);
 
-	db->id = dc_subdev_get_id(dc_db_info, ARRAY_SIZE(dc_db_info), res_cfg);
+	db->id = dc_subdev_get_id(dc_db_info, res_cfg);
 	if (db->id < 0) {
 		dev_err(dev, "failed to get instance number: %d\n", db->id);
 		return db->id;
diff --git a/drivers/gpu/drm/imx/dc/dc-de.c b/drivers/gpu/drm/imx/dc/dc-de.c
index 23b0cea68d325..81334c0088219 100644
--- a/drivers/gpu/drm/imx/dc/dc-de.c
+++ b/drivers/gpu/drm/imx/dc/dc-de.c
@@ -21,6 +21,7 @@
 static const struct dc_subdev_info dc_de_info[] = {
 	{ .reg_start = 0x5618b400, .id = 0, },
 	{ .reg_start = 0x5618b420, .id = 1, },
+	{ /* sentinel */ },
 };
 
 static const struct regmap_range dc_de_regmap_ranges[] = {
@@ -90,7 +91,7 @@ static int dc_de_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	id = dc_subdev_get_id(dc_de_info, ARRAY_SIZE(dc_de_info), res_top);
+	id = dc_subdev_get_id(dc_de_info, res_top);
 	if (id < 0) {
 		dev_err(dev, "failed to get instance number: %d\n", id);
 		return id;
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.h b/drivers/gpu/drm/imx/dc/dc-drv.h
index 17ce2d748262b..a7ad17680a9b2 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.h
+++ b/drivers/gpu/drm/imx/dc/dc-drv.h
@@ -85,16 +85,18 @@ extern struct platform_driver dc_pe_driver;
 extern struct platform_driver dc_tc_driver;
 
 static inline int dc_subdev_get_id(const struct dc_subdev_info *info,
-				   int info_cnt, struct resource *res)
+				   struct resource *res)
 {
-	int i;
+	int i = 0;
 
 	if (!res)
 		return -EINVAL;
 
-	for (i = 0; i < info_cnt; i++)
+	while (info[i].reg_start) {
 		if (info[i].reg_start == res->start)
 			return info[i].id;
+		i++;
+	}
 
 	return -EINVAL;
 }
diff --git a/drivers/gpu/drm/imx/dc/dc-ed.c b/drivers/gpu/drm/imx/dc/dc-ed.c
index 86ecc22d0a554..a63c387a4c023 100644
--- a/drivers/gpu/drm/imx/dc/dc-ed.c
+++ b/drivers/gpu/drm/imx/dc/dc-ed.c
@@ -40,6 +40,7 @@ static const struct dc_subdev_info dc_ed_info[] = {
 	{ .reg_start = 0x56180a00, .id = 1, },
 	{ .reg_start = 0x561809c0, .id = 4, },
 	{ .reg_start = 0x56180a40, .id = 5, },
+	{ /* sentinel */ },
 };
 
 static const struct regmap_range dc_ed_pec_regmap_write_ranges[] = {
@@ -226,7 +227,7 @@ static int dc_ed_bind(struct device *dev, struct device *master, void *data)
 
 	ed->dev = dev;
 
-	id = dc_subdev_get_id(dc_ed_info, ARRAY_SIZE(dc_ed_info), res_pec);
+	id = dc_subdev_get_id(dc_ed_info, res_pec);
 	if (id < 0) {
 		dev_err(dev, "failed to get instance number: %d\n", id);
 		return id;
diff --git a/drivers/gpu/drm/imx/dc/dc-fg.c b/drivers/gpu/drm/imx/dc/dc-fg.c
index 7f6c1852bf724..5fadd67aa911b 100644
--- a/drivers/gpu/drm/imx/dc/dc-fg.c
+++ b/drivers/gpu/drm/imx/dc/dc-fg.c
@@ -92,6 +92,7 @@ enum dc_fg_dm {
 static const struct dc_subdev_info dc_fg_info[] = {
 	{ .reg_start = 0x5618b800, .id = 0, },
 	{ .reg_start = 0x5618d400, .id = 1, },
+	{ /* sentinel */ },
 };
 
 static const struct regmap_range dc_fg_regmap_write_ranges[] = {
@@ -326,7 +327,7 @@ static int dc_fg_bind(struct device *dev, struct device *master, void *data)
 		return dev_err_probe(dev, PTR_ERR(fg->clk_disp),
 				     "failed to get display clock\n");
 
-	id = dc_subdev_get_id(dc_fg_info, ARRAY_SIZE(dc_fg_info), res);
+	id = dc_subdev_get_id(dc_fg_info, res);
 	if (id < 0) {
 		dev_err(dev, "failed to get instance number: %d\n", id);
 		return id;
diff --git a/drivers/gpu/drm/imx/dc/dc-fl.c b/drivers/gpu/drm/imx/dc/dc-fl.c
index 3ce24c72aa13e..d4e746f8c4297 100644
--- a/drivers/gpu/drm/imx/dc/dc-fl.c
+++ b/drivers/gpu/drm/imx/dc/dc-fl.c
@@ -33,6 +33,7 @@ struct dc_fl {
 
 static const struct dc_subdev_info dc_fl_info[] = {
 	{ .reg_start = 0x56180ac0, .id = 0, },
+	{ /* sentinel */ },
 };
 
 static const struct regmap_range dc_fl_regmap_ranges[] = {
@@ -120,7 +121,7 @@ static int dc_fl_bind(struct device *dev, struct device *master, void *data)
 	if (IS_ERR(fu->reg_cfg))
 		return PTR_ERR(fu->reg_cfg);
 
-	id = dc_subdev_get_id(dc_fl_info, ARRAY_SIZE(dc_fl_info), res_pec);
+	id = dc_subdev_get_id(dc_fl_info, res_pec);
 	if (id < 0) {
 		dev_err(dev, "failed to get instance number: %d\n", id);
 		return id;
diff --git a/drivers/gpu/drm/imx/dc/dc-fw.c b/drivers/gpu/drm/imx/dc/dc-fw.c
index acb2d4d9e2ecd..c1131b7b17c2f 100644
--- a/drivers/gpu/drm/imx/dc/dc-fw.c
+++ b/drivers/gpu/drm/imx/dc/dc-fw.c
@@ -35,6 +35,7 @@ struct dc_fw {
 
 static const struct dc_subdev_info dc_fw_info[] = {
 	{ .reg_start = 0x56180a60, .id = 2, },
+	{ /* sentinel */ },
 };
 
 static const struct regmap_range dc_fw_pec_regmap_access_ranges[] = {
@@ -157,7 +158,7 @@ static int dc_fw_bind(struct device *dev, struct device *master, void *data)
 	if (IS_ERR(fu->reg_cfg))
 		return PTR_ERR(fu->reg_cfg);
 
-	id = dc_subdev_get_id(dc_fw_info, ARRAY_SIZE(dc_fw_info), res_pec);
+	id = dc_subdev_get_id(dc_fw_info, res_pec);
 	if (id < 0) {
 		dev_err(dev, "failed to get instance number: %d\n", id);
 		return id;
diff --git a/drivers/gpu/drm/imx/dc/dc-lb.c b/drivers/gpu/drm/imx/dc/dc-lb.c
index 38f966625d382..34ea61c2de87d 100644
--- a/drivers/gpu/drm/imx/dc/dc-lb.c
+++ b/drivers/gpu/drm/imx/dc/dc-lb.c
@@ -76,6 +76,7 @@ static const struct dc_subdev_info dc_lb_info[] = {
 	{ .reg_start = 0x56180bc0, .id = 1, },
 	{ .reg_start = 0x56180be0, .id = 2, },
 	{ .reg_start = 0x56180c00, .id = 3, },
+	{ /* sentinel */ },
 };
 
 static const struct regmap_range dc_lb_pec_regmap_access_ranges[] = {
@@ -273,7 +274,7 @@ static int dc_lb_bind(struct device *dev, struct device *master, void *data)
 	if (IS_ERR(lb->reg_cfg))
 		return PTR_ERR(lb->reg_cfg);
 
-	lb->id = dc_subdev_get_id(dc_lb_info, ARRAY_SIZE(dc_lb_info), res_pec);
+	lb->id = dc_subdev_get_id(dc_lb_info, res_pec);
 	if (lb->id < 0) {
 		dev_err(dev, "failed to get instance number: %d\n", lb->id);
 		return lb->id;
diff --git a/drivers/gpu/drm/imx/dc/dc-tc.c b/drivers/gpu/drm/imx/dc/dc-tc.c
index 0bfd381b2cea1..f44b68c0a5e6d 100644
--- a/drivers/gpu/drm/imx/dc/dc-tc.c
+++ b/drivers/gpu/drm/imx/dc/dc-tc.c
@@ -28,6 +28,7 @@
 static const struct dc_subdev_info dc_tc_info[] = {
 	{ .reg_start = 0x5618c800, .id = 0, },
 	{ .reg_start = 0x5618e400, .id = 1, },
+	{ /* sentinel */ },
 };
 
 static const struct regmap_range dc_tc_regmap_ranges[] = {
@@ -91,7 +92,7 @@ static int dc_tc_bind(struct device *dev, struct device *master, void *data)
 	if (IS_ERR(tc->reg))
 		return PTR_ERR(tc->reg);
 
-	id = dc_subdev_get_id(dc_tc_info, ARRAY_SIZE(dc_tc_info), res);
+	id = dc_subdev_get_id(dc_tc_info, res);
 	if (id < 0) {
 		dev_err(dev, "failed to get instance number: %d\n", id);
 		return id;
-- 
2.51.0

