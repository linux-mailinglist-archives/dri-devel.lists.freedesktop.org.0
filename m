Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E744C1B8BC
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 16:07:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18CE110E7F8;
	Wed, 29 Oct 2025 15:07:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="J/xg7zGA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azhn15010008.outbound.protection.outlook.com [52.102.149.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B8210E7D8
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 15:07:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OWc64bmGkXLmN6LMu1O+psHbusGRkhmuMXRWuDktOnHBXH0kbLbzIdtP36Xg0W+hqOTtswRHHvx/0e33yV5xEyIDiSfy+XLzthLGn6OxjJkvL1uFGFXdI7yh8nvBHJX3LsGQHXDFuMCG3DqIJQCZTEk8moOcPOKie7IT1wGkqqieO8atKR4bPcNI93Zvyb7BjY3o0juxLYnsC3x82pNaWAevYF9r1mmus+5U0y/5EcjlP+BbnenWxLMv8BxOJ5biWEgyScTf0mn+QMlDf+MXZNYE9RvjTT/YX+Tumo3C68aF3nrXqyuhZSA+O6MaS7LaILBKjm9LDwfBAikrXIE9jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hFcdTfIJXR1LiHNcAzitgUpEo6NDTFHA6yY1n266yq4=;
 b=o39iLACt2DPZp4NgEqZyWETvEgRUSrOc61QdQ0JzFIEg246NTLDyR/oyg7spChOUy0LMcCSTK5IVs+tkuT37zbHN/kO+nNzfjBy9eWUPUJpPokgfPXEuzHTZQWoqd0fnWzcQ4X0Hl6p8/M+bDGY4OTnPVOv5LCgh3Z0A2dVCLvdxKGV32lVNAHWPQhy4XdlUJpOR8iGey0XhZe0Wg9ctHy0hWi0Cjb2xRMfqjkuLtvYw4nWFiLwYWVJoqhTpFBunRaLDoj4lj2G9S/QiY+xTC2opr/URETtREGOSoUS2BGer2npgISp9k0teikImRUsBM2R9mY8cpz6vm2N0sFLBig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hFcdTfIJXR1LiHNcAzitgUpEo6NDTFHA6yY1n266yq4=;
 b=J/xg7zGAgnwjiDg5o8Lx9jziktrvVpvtcIPQWfTXPj5BiavPrlm20qg/Gumjyq1MrOvDIXo4smbqK4nemGMLmtQhCBLdoaRyBpcxOt3ZFcFjHoatOsldqyFC6sVGiWSBMI5AFJKjfpnUNCnrWWKGxa/VWZHmL9asKyq1kCbPGnI=
Received: from MW4P223CA0007.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::12)
 by DS7PR10MB7132.namprd10.prod.outlook.com (2603:10b6:8:ef::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Wed, 29 Oct
 2025 15:06:51 +0000
Received: from SJ1PEPF00002317.namprd03.prod.outlook.com
 (2603:10b6:303:80:cafe::d3) by MW4P223CA0007.outlook.office365.com
 (2603:10b6:303:80::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.12 via Frontend Transport; Wed,
 29 Oct 2025 15:06:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00002317.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 15:06:49 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 10:06:44 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 10:06:44 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Oct 2025 10:06:44 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59TF6inF4187716;
 Wed, 29 Oct 2025 10:06:44 -0500
From: Nishanth Menon <nm@ti.com>
To: Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Robert Foss <rfoss@kernel.org>, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Phong LE <ple@baylibre.com>, Dmitry <dmitry.baryshkov@oss.qualcomm.com>
CC: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Robert Nelson <robertcnelson@gmail.com>,
 Jason Kridner <jkridner@beagleboard.org>, Andrew Davis <afd@ti.com>, Tomi V
 <tomi.valkeinen@ideasonboard.com>, Devarsh <devarsht@ti.com>, Nishanth Menon
 <nm@ti.com>
Subject: [PATCH V6 4/5] drm/bridge: it66121: Use vid/pid to detect the type of
 chip
Date: Wed, 29 Oct 2025 10:06:35 -0500
Message-ID: <20251029150636.3118628-5-nm@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20251029150636.3118628-1-nm@ti.com>
References: <20251029150636.3118628-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002317:EE_|DS7PR10MB7132:EE_
X-MS-Office365-Filtering-Correlation-Id: c768166c-0a0a-4a8a-1cb3-08de16fcc97b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|34020700016|36860700013|1800799024|82310400026|921020|7053199007|12100799066;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?m7SF4OA2AwXyC2cAcROKm4iz8e9Geq+3RTtEBnMg3SVuxpq5nVXRziCzVZVV?=
 =?us-ascii?Q?ZjcnWgZejfDcseoBwVtn91wJvBD9s8Y97RTNcuE2zTn0O+8b2ohRA5POyxUk?=
 =?us-ascii?Q?Eo+17iGGovWvGz4UE54JgCCH58xmRyYC/7U4gl4dZFmi7y1BSFAIV4J8Nvzf?=
 =?us-ascii?Q?nspjWIQ1EeSg6C+QQSE3wWMXFfbeyxf6UW90cGA83yKDO5aJHUYePwIpiY+c?=
 =?us-ascii?Q?eIysd+e4Z3fWMKxGrvQ6B3YyUZSZiHNRb+GvVqP5TSigVYgEE2igKtugjUvu?=
 =?us-ascii?Q?FV4Debq9agP4h3TICB+/8ZOLc2FQHe5tWi+zCy+zX9cys2Je69EAV7Uw9kfQ?=
 =?us-ascii?Q?RB1M5snBAa95G8rvp9To41Flo742AbUCT7we3hCrwv8TcCz4QRKVWQkG8LGP?=
 =?us-ascii?Q?D9/OYse8UCXLutrz3fjjnN9ftRnATzactm+ELZaJWd7PPJfRRb6EQHZuVLae?=
 =?us-ascii?Q?Vjt78fWQ8l9ln45gbky1Xap9rwYGsFHDf8WkgN94hcZvxqNi+K8uGJ7qC81b?=
 =?us-ascii?Q?/kGPKsTQG8mk4bpWbYZFVrFJZdlgGrYVd1vxERYB0ieU0iH16mXt+IRyejBt?=
 =?us-ascii?Q?1T+G0ZsqXnWBkrJb/koR3olmK4OpaAEEsiPVmN9Qe5LCKod8PUjZR15Sbhjt?=
 =?us-ascii?Q?ZaJC4GE4umA35wuRbhutwc6U0LPTf4EGb4HoKTijTj1yN5t2W/YPL9VkI4YY?=
 =?us-ascii?Q?MDipKOxW8EW9nq8WVZQOmDXrk5IGFEfJzZf4o++E060QJUos5VqypQ0YsoFf?=
 =?us-ascii?Q?R05AK9lISFHySiMYF9MZQwmNWjwaMjCX/6giAhgRvRiju9APetmJqINRinO8?=
 =?us-ascii?Q?HLPG6+jTPjQMBQku/apZCTTosng/LnlK60XbunuT0HtxP/djmqTSsqM0uW0c?=
 =?us-ascii?Q?FBu8L9C11ol7q0cjGPL84LrZ5A+pRpCkOlKXBMJdLuXqpEYS64Pg6sfnNbBo?=
 =?us-ascii?Q?n5NFHz1kI82aPrxT4PwY18DFsWqpBh4ZcF8xP6Gw96kTl66E9wuZbJa+zmkb?=
 =?us-ascii?Q?Rrzyb2bZIH396KKQfc/BYyWvk5n2nGs6ZU6OPOuHcf/Ns7nk9kJhDsb49iYl?=
 =?us-ascii?Q?7MvXnC5V74O1dHwUHu9cSqaJiEjI60zIVEGtIiHZo4RW5KXqOqb/zYlq6pzO?=
 =?us-ascii?Q?CKzk1oqEuKV8dSuNVhMf7z5Hz1h0WefSCQ5kH2fSyvaRhs1Wz7bECewktGAi?=
 =?us-ascii?Q?8hIk2IOPJUv9ZxH+MjPDMY5V6a/DJToYBbWswdT6hsMNSPIVrKQKUCSefZ7v?=
 =?us-ascii?Q?40SCumhd7APBcCB/B3pLNC6HMKoae0aYPVaEjOyCwLBwwmXuExPoa5XZAgoU?=
 =?us-ascii?Q?xxPahWvd9QCXiIXmvElJPOOPd7R48/PfY9oJkH8opEpXCm5AZA9DpijBkK2h?=
 =?us-ascii?Q?4oZR5j+FUaYIH2AMeCUhUU39pAwaECUzpc2kxKkdzgAx93s9trK4nkREPiLj?=
 =?us-ascii?Q?ifLIKeoC3IMJwVAJPg8Eh9qiwNKuVZD63HwDWvvLmoMJ+8ZwhEQVivLyaG+R?=
 =?us-ascii?Q?m5Y8+dNy26JGei+FgXhKECSx4RE4epA2n3ota+y9CXlA7NAvmcUkWv3+T7Ba?=
 =?us-ascii?Q?HE5BTrAmcVCPUE+g0/Rq/WBQ5zOrWlQv4yTEA+H8?=
X-Forefront-Antispam-Report: CIP:198.47.23.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet200.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(7416014)(376014)(34020700016)(36860700013)(1800799024)(82310400026)(921020)(7053199007)(12100799066);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 15:06:49.9959 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c768166c-0a0a-4a8a-1cb3-08de16fcc97b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.194];
 Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002317.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7132
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

The driver knows exactly which version of the chip is present since
the vid/pid is used to enforce a compatibility. Given that some
devices like IT66121 has potentially been replaced with IT66122 mid
production for many platforms, it makes no sense to use the vid/pid
as an enforcement for compatibility. Instead, detect the ID of the
actual chip in use by matching the corresponding vid/pid and drop the
compatible specific lookup table.

Signed-off-by: Nishanth Menon <nm@ti.com>
Reviewed-by: Andrew Davis <afd@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Changes since V5:
* Picked Tomi's Ack

V5: https://lore.kernel.org/all/20250827202354.2017972-5-nm@ti.com/
V4: https://lore.kernel.org/all/20250819130807.3322536-5-nm@ti.com/
V3: https://lore.kernel.org/all/20250815034105.1276548-4-nm@ti.com/
V2: https://lore.kernel.org/all/20250813204106.580141-3-nm@ti.com/

 drivers/gpu/drm/bridge/ite-it66121.c | 58 ++++++++++++++--------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index cd74f3966560..1b2ef774c770 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -312,7 +312,7 @@ struct it66121_ctx {
 		u8 swl;
 		bool auto_cts;
 	} audio;
-	const struct it66121_chip_info *info;
+	enum chip_id id;
 };
 
 static const struct regmap_range_cfg it66121_regmap_banks[] = {
@@ -402,7 +402,7 @@ static int it66121_configure_afe(struct it66121_ctx *ctx,
 		if (ret)
 			return ret;
 
-		if (ctx->info->id == ID_IT66121) {
+		if (ctx->id == ID_IT66121) {
 			ret = regmap_write_bits(ctx->regmap, IT66121_AFE_IP_REG,
 						IT66121_AFE_IP_EC1, 0);
 			if (ret)
@@ -428,7 +428,7 @@ static int it66121_configure_afe(struct it66121_ctx *ctx,
 		if (ret)
 			return ret;
 
-		if (ctx->info->id == ID_IT66121) {
+		if (ctx->id == ID_IT66121) {
 			ret = regmap_write_bits(ctx->regmap, IT66121_AFE_IP_REG,
 						IT66121_AFE_IP_EC1,
 						IT66121_AFE_IP_EC1);
@@ -449,7 +449,7 @@ static int it66121_configure_afe(struct it66121_ctx *ctx,
 	if (ret)
 		return ret;
 
-	if (ctx->info->id == ID_IT6610) {
+	if (ctx->id == ID_IT6610) {
 		ret = regmap_write_bits(ctx->regmap, IT66121_AFE_XP_REG,
 					IT6610_AFE_XP_BYPASS,
 					IT6610_AFE_XP_BYPASS);
@@ -599,7 +599,7 @@ static int it66121_bridge_attach(struct drm_bridge *bridge,
 	if (ret)
 		return ret;
 
-	if (ctx->info->id == ID_IT66121) {
+	if (ctx->id == ID_IT66121) {
 		ret = regmap_write_bits(ctx->regmap, IT66121_CLK_BANK_REG,
 					IT66121_CLK_BANK_PWROFF_RCLK, 0);
 		if (ret)
@@ -748,7 +748,7 @@ static int it66121_bridge_check(struct drm_bridge *bridge,
 {
 	struct it66121_ctx *ctx = container_of(bridge, struct it66121_ctx, bridge);
 
-	if (ctx->info->id == ID_IT6610) {
+	if (ctx->id == ID_IT6610) {
 		/* The IT6610 only supports these settings */
 		bridge_state->input_bus_cfg.flags |= DRM_BUS_FLAG_DE_HIGH |
 			DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE;
@@ -802,7 +802,7 @@ void it66121_bridge_mode_set(struct drm_bridge *bridge,
 	if (regmap_write(ctx->regmap, IT66121_HDMI_MODE_REG, IT66121_HDMI_MODE_HDMI))
 		goto unlock;
 
-	if (ctx->info->id == ID_IT66121 &&
+	if (ctx->id == ID_IT66121 &&
 	    regmap_write_bits(ctx->regmap, IT66121_CLK_BANK_REG,
 			      IT66121_CLK_BANK_PWROFF_TXCLK,
 			      IT66121_CLK_BANK_PWROFF_TXCLK)) {
@@ -815,7 +815,7 @@ void it66121_bridge_mode_set(struct drm_bridge *bridge,
 	if (it66121_configure_afe(ctx, adjusted_mode))
 		goto unlock;
 
-	if (ctx->info->id == ID_IT66121 &&
+	if (ctx->id == ID_IT66121 &&
 	    regmap_write_bits(ctx->regmap, IT66121_CLK_BANK_REG,
 			      IT66121_CLK_BANK_PWROFF_TXCLK, 0)) {
 		goto unlock;
@@ -1498,13 +1498,19 @@ static const char * const it66121_supplies[] = {
 	"vcn33", "vcn18", "vrf12"
 };
 
+static const struct it66121_chip_info it66xx_chip_info[] = {
+	{.id = ID_IT6610, .vid = 0xca00, .pid = 0x0611 },
+	{.id = ID_IT66121, .vid = 0x4954, .pid = 0x0612 },
+};
+
 static int it66121_probe(struct i2c_client *client)
 {
 	u32 revision_id, vendor_ids[2] = { 0 }, device_ids[2] = { 0 };
 	struct device_node *ep;
-	int ret;
+	int ret, i;
 	struct it66121_ctx *ctx;
 	struct device *dev = &client->dev;
+	const struct it66121_chip_info *chip_info;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
 		dev_err(dev, "I2C check functionality failed.\n");
@@ -1522,7 +1528,6 @@ static int it66121_probe(struct i2c_client *client)
 
 	ctx->dev = dev;
 	ctx->client = client;
-	ctx->info = i2c_get_match_data(client);
 
 	of_property_read_u32(ep, "bus-width", &ctx->bus_width);
 	of_node_put(ep);
@@ -1568,11 +1573,18 @@ static int it66121_probe(struct i2c_client *client)
 	revision_id = FIELD_GET(IT66121_REVISION_MASK, device_ids[1]);
 	device_ids[1] &= IT66121_DEVICE_ID1_MASK;
 
-	if ((vendor_ids[1] << 8 | vendor_ids[0]) != ctx->info->vid ||
-	    (device_ids[1] << 8 | device_ids[0]) != ctx->info->pid) {
-		return -ENODEV;
+	for (i = 0; i < ARRAY_SIZE(it66xx_chip_info); i++) {
+		chip_info = &it66xx_chip_info[i];
+		if ((vendor_ids[1] << 8 | vendor_ids[0]) == chip_info->vid &&
+		    (device_ids[1] << 8 | device_ids[0]) == chip_info->pid) {
+			ctx->id = chip_info->id;
+			break;
+		}
 	}
 
+	if (i == ARRAY_SIZE(it66xx_chip_info))
+		return -ENODEV;
+
 	ctx->bridge.of_node = dev->of_node;
 	ctx->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	ctx->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
@@ -1606,28 +1618,16 @@ static void it66121_remove(struct i2c_client *client)
 	mutex_destroy(&ctx->lock);
 }
 
-static const struct it66121_chip_info it66121_chip_info = {
-	.id = ID_IT66121,
-	.vid = 0x4954,
-	.pid = 0x0612,
-};
-
-static const struct it66121_chip_info it6610_chip_info = {
-	.id = ID_IT6610,
-	.vid = 0xca00,
-	.pid = 0x0611,
-};
-
 static const struct of_device_id it66121_dt_match[] = {
-	{ .compatible = "ite,it6610", &it6610_chip_info },
-	{ .compatible = "ite,it66121", &it66121_chip_info },
+	{ .compatible = "ite,it6610" },
+	{ .compatible = "ite,it66121" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, it66121_dt_match);
 
 static const struct i2c_device_id it66121_id[] = {
-	{ "it6610", (kernel_ulong_t)&it6610_chip_info },
-	{ "it66121", (kernel_ulong_t)&it66121_chip_info },
+	{ .name = "it6610" },
+	{ .name = "it66121" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, it66121_id);
-- 
2.47.0

