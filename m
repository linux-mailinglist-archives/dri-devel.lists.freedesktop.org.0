Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D32C1B8C5
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 16:07:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 750E110E7FA;
	Wed, 29 Oct 2025 15:07:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="UWG7eyBj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazhn15010017.outbound.protection.outlook.com [52.102.139.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48EB610E7F9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 15:07:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gqwGO5KuSGkMqpgp3MHo0xtPpe1a5AuEALjDVYsnPcQU57K2RM5WA1gOAQw4VnYtAbIuQ3EhCtjwc7Yz0LgjS7rw30XxKBCBEQBCfHDb+2tlRazfuLqDlNdoGVMGlG8MCeazQTgM6i2pf3wn6UjFSt7s8YYPWIsFQjGyb3dRg3bTCTOH8A11okKIAXd42GbC4/OvYpNkQZR9lcylzS+Z55CBdxkzekuZRhyMuaXZR9BEhuaQ0JlxfaKfW0dAZ7WKcL4EkaAjEaxKBmcTqjenT++421yl8fA2+SMulKLGc7u+HB1PQnqeDYfx5QSv0pLwMtgDou0zjmnQnv09cpknxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rMZ44PNrUrDuN8LhBFHa+4JMsZv6tiOKplJ+9mP0wGc=;
 b=HSYlpLEgRRTEERfbmA8U3FUITeV0oJfiCt95l/aDCNiAcO15P7JYNJqAAlBYfcuKirogyB3aOqJyeIN7BHrRSWZVQYaazcLuH1cEDZPO6kGW8Xpsss2pPBjUPIhae3gWdcGDKeNAEIwtKOM5cKZyn9P2ZWXvL1fTMP1oJNE1iP5Mid61jLvmKN5w5aseiWGsi+TG2UuNJN7HlBFsshGgqVsUtmNsfCeQ28mH8ybOe37nBhGXk8LDFvmmeAVRsJFQ3emMJGTcfCKysVsu4V6ieXe7kAnFS5y7nfo8adYERIDMi2rsdrVhgMIS/H6ZblqQDe1O94va4N/1l09rFl+x7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rMZ44PNrUrDuN8LhBFHa+4JMsZv6tiOKplJ+9mP0wGc=;
 b=UWG7eyBjh4hI2q22yU7cIey1lrdLUP5WShyFcNUDjoVx+j67JOPbMG6cXxp3TSb9MpVIVgzFh6lfpYbHiDBmkvYoowj2kkceRB/Uymj8SFCeJ15qay9xh34BmRIOWNJWk+dNGJtZwcA8qWhuWeuw3sC1LDfDcrF+CqHzpTRaQhQ=
Received: from MW4PR04CA0081.namprd04.prod.outlook.com (2603:10b6:303:6b::26)
 by BLAPR10MB4945.namprd10.prod.outlook.com (2603:10b6:208:324::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Wed, 29 Oct
 2025 15:06:56 +0000
Received: from SJ5PEPF000001ED.namprd05.prod.outlook.com
 (2603:10b6:303:6b:cafe::1c) by MW4PR04CA0081.outlook.office365.com
 (2603:10b6:303:6b::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Wed,
 29 Oct 2025 15:06:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001ED.mail.protection.outlook.com (10.167.242.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Wed, 29 Oct 2025 15:06:54 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 10:06:44 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 10:06:44 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Oct 2025 10:06:44 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59TF6i7I022439;
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
Subject: [PATCH V6 5/5] drm/bridge: it66121: Add minimal it66122 support
Date: Wed, 29 Oct 2025 10:06:36 -0500
Message-ID: <20251029150636.3118628-6-nm@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20251029150636.3118628-1-nm@ti.com>
References: <20251029150636.3118628-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001ED:EE_|BLAPR10MB4945:EE_
X-MS-Office365-Filtering-Correlation-Id: 65a0ba76-dd5c-41e3-df4b-08de16fccc56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|7416014|34020700016|82310400026|376014|921020|7053199007|12100799066;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HLeMV32h/SrsCUnKqlRe1rwQwE3rso7YMGNhO9hYLqygrtSN/HJ04ObFuypq?=
 =?us-ascii?Q?yDu6LKdbOPgJqIyRBvIfUK6XVyRIk/SAgB1UPiu74Tqcx1RjYDTyh8g4qakm?=
 =?us-ascii?Q?KMA5s68PjgF+kR76ZyrAc2Gf3Z7gIrHgnvZZvcS9UZzZWYJeLa/1KH+rrLU7?=
 =?us-ascii?Q?UTfwRxGp2Xe7fY5MFtymMzI46hhGvefbF+HugliBf/6Rg/n5OzFettW4EghJ?=
 =?us-ascii?Q?fkF9fNujNrvXcJR22w0xZYN/cPzpXrnjbCvEpvZ9AQ4idM2hz10nbwAtL8yz?=
 =?us-ascii?Q?HH57fynF6GOyN8QTmg4m2GjSWcwMiBZTEnMGpXsM3cm95QuO6l5hm839yC1E?=
 =?us-ascii?Q?MxHRdcexOpVYwyu3CtJ/hpw5yEChmgKXpOMkHhsvl7Kh9SuTfUt38DA6LbRg?=
 =?us-ascii?Q?uq9zOUiuWlARKa+xEj9cDyPIewP0GpvDwjlHpEcChoOp4rbUm0jwnW8Xh8U9?=
 =?us-ascii?Q?wRcnMYxFgEEdJE31o2H05aL1Czhx0Z/fEyL0XYLw8kBoVMXFoojT1IfAQtpX?=
 =?us-ascii?Q?pToTIIhJzi3OsIawy79G9NAgI4QMkD8XSDUWBgiZL5RbxdIBl/Qga9CI/xBR?=
 =?us-ascii?Q?+5yGiXt24ii7m+l9el+4BXGurEVb6cJMpkqrGRb7vVMnicMUjienfRpl3oky?=
 =?us-ascii?Q?50NqKp8AyZo542uPJ0xU6EcF11isLQed5HMK4YtiGzUIVW92m2fkLrexxC3F?=
 =?us-ascii?Q?2bhEv7Vb4Bs0X0zHGPJ/Cpjp5lWFmrpynExYI/Xx//WBY8YWKPUYtcm2RStI?=
 =?us-ascii?Q?sir8M+rJftNpgDRDOY2qJ/2Rx3L8GeoW1VECrtQDGr8VqaaSwGJ9I2u7ShhQ?=
 =?us-ascii?Q?Y5InVmgGeQXloajAgFcBK2MTb3ENhmYVDebJMAKo2rUJhbogIO8avad1anM7?=
 =?us-ascii?Q?I4G1clbMPjTNJVUHjDUYt6DHvRErndnpGZXjhEKF3g3+oPxvYQ0Wpy0au+No?=
 =?us-ascii?Q?8+kFBqz2KOsq4ZRNBMYBLFojRBM25hdGPqGodJUaOJ58QnYhQWy2UXv8DZDU?=
 =?us-ascii?Q?s/aSGtDRX/kbo1ody2udDXzKKmkcQTwVpIMW8I0UPgjkKNJ4HhHR/+dOYAnt?=
 =?us-ascii?Q?kc11NpRt9zPCkkau+1c5UYsiN/4Z9ZYpaNP9AT9LwfZDkP+lgiiLVOQ6CAS4?=
 =?us-ascii?Q?P+VBmdXqWSW/oVWXwdNQKN+SI4uz0NtYp/79koF0iiHOp5YMyxnAkowyFZwx?=
 =?us-ascii?Q?3D5tkBiNVdCg5sKl9fsMRA2vqCPvyCG2br8PYbLSXCGbirHV0Y9SyF72aP0f?=
 =?us-ascii?Q?9WcXIoLtRZ9+V7oTywivJg+mTEe+6FBloLl3EX7rWPOlir9TFZ4mj9dLCeaN?=
 =?us-ascii?Q?OybVDi3HtsVySrpPrK31BmPcN+Awlh7sO7WsLuo2O0ltbpzHjAMoMILyASWv?=
 =?us-ascii?Q?8oP2FPfJPP15h9WAX+BU+eHliPi5zCTc9zk2IB3quQoFR8hjlogBNvtP9vEV?=
 =?us-ascii?Q?E9mtmT78lF0GTD7nIJCHu2lfhr+2QbIJW3F+Eqx1W1FtWEwdC4YGmMsxIo1O?=
 =?us-ascii?Q?NzHLp0mGa3VxadWmHt3elAHhidNrOZxg7oCmVpBoHZBQrswQyzEzpo2leKbk?=
 =?us-ascii?Q?UU6K7Nt3lSUxu3HWPP3aHnf5K5ANrl/OnAT/ykVP?=
X-Forefront-Antispam-Report: CIP:198.47.21.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet201.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(7416014)(34020700016)(82310400026)(376014)(921020)(7053199007)(12100799066);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 15:06:54.8266 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65a0ba76-dd5c-41e3-df4b-08de16fccc56
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.195];
 Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4945
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

The IT66122 is a pin compatible replacement for the IT66122. Based on
empirical testing, the new device looks to be compatible with IT66121.
However due to a lack of public data sheet at this time beyond overall
feature list[1] (which seems to add additional features vs ITT66121),
it is hard to determine that additional register operations required
to enable additional features.

So, introduce the device as a new compatible that we will detect based
on vid/pid match, with explicit id that can be used to extend the
driver capability as information becomes available later on.

[1] https://www.ite.com.tw/en/product/cate1/IT66122

Signed-off-by: Nishanth Menon <nm@ti.com>
Reviewed-by: Andrew Davis <afd@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Changes since V5:
* Picked Tomi's Ack

V5: https://lore.kernel.org/all/20250827202354.2017972-6-nm@ti.com/
V4: https://lore.kernel.org/all/20250819130807.3322536-6-nm@ti.com/
V3: https://lore.kernel.org/all/20250815034105.1276548-5-nm@ti.com/
V2: https://lore.kernel.org/all/20250813204106.580141-4-nm@ti.com/

 drivers/gpu/drm/bridge/ite-it66121.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 1b2ef774c770..0185f61e6e59 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -287,6 +287,7 @@
 enum chip_id {
 	ID_IT6610,
 	ID_IT66121,
+	ID_IT66122,
 };
 
 struct it66121_chip_info {
@@ -402,7 +403,7 @@ static int it66121_configure_afe(struct it66121_ctx *ctx,
 		if (ret)
 			return ret;
 
-		if (ctx->id == ID_IT66121) {
+		if (ctx->id == ID_IT66121 || ctx->id == ID_IT66122) {
 			ret = regmap_write_bits(ctx->regmap, IT66121_AFE_IP_REG,
 						IT66121_AFE_IP_EC1, 0);
 			if (ret)
@@ -428,7 +429,7 @@ static int it66121_configure_afe(struct it66121_ctx *ctx,
 		if (ret)
 			return ret;
 
-		if (ctx->id == ID_IT66121) {
+		if (ctx->id == ID_IT66121 || ctx->id == ID_IT66122) {
 			ret = regmap_write_bits(ctx->regmap, IT66121_AFE_IP_REG,
 						IT66121_AFE_IP_EC1,
 						IT66121_AFE_IP_EC1);
@@ -599,7 +600,7 @@ static int it66121_bridge_attach(struct drm_bridge *bridge,
 	if (ret)
 		return ret;
 
-	if (ctx->id == ID_IT66121) {
+	if (ctx->id == ID_IT66121 || ctx->id == ID_IT66122) {
 		ret = regmap_write_bits(ctx->regmap, IT66121_CLK_BANK_REG,
 					IT66121_CLK_BANK_PWROFF_RCLK, 0);
 		if (ret)
@@ -802,7 +803,7 @@ void it66121_bridge_mode_set(struct drm_bridge *bridge,
 	if (regmap_write(ctx->regmap, IT66121_HDMI_MODE_REG, IT66121_HDMI_MODE_HDMI))
 		goto unlock;
 
-	if (ctx->id == ID_IT66121 &&
+	if ((ctx->id == ID_IT66121 || ctx->id == ID_IT66122) &&
 	    regmap_write_bits(ctx->regmap, IT66121_CLK_BANK_REG,
 			      IT66121_CLK_BANK_PWROFF_TXCLK,
 			      IT66121_CLK_BANK_PWROFF_TXCLK)) {
@@ -815,7 +816,7 @@ void it66121_bridge_mode_set(struct drm_bridge *bridge,
 	if (it66121_configure_afe(ctx, adjusted_mode))
 		goto unlock;
 
-	if (ctx->id == ID_IT66121 &&
+	if ((ctx->id == ID_IT66121 || ctx->id == ID_IT66122) &&
 	    regmap_write_bits(ctx->regmap, IT66121_CLK_BANK_REG,
 			      IT66121_CLK_BANK_PWROFF_TXCLK, 0)) {
 		goto unlock;
@@ -1501,6 +1502,7 @@ static const char * const it66121_supplies[] = {
 static const struct it66121_chip_info it66xx_chip_info[] = {
 	{.id = ID_IT6610, .vid = 0xca00, .pid = 0x0611 },
 	{.id = ID_IT66121, .vid = 0x4954, .pid = 0x0612 },
+	{.id = ID_IT66122, .vid = 0x4954, .pid = 0x0622 },
 };
 
 static int it66121_probe(struct i2c_client *client)
@@ -1621,6 +1623,7 @@ static void it66121_remove(struct i2c_client *client)
 static const struct of_device_id it66121_dt_match[] = {
 	{ .compatible = "ite,it6610" },
 	{ .compatible = "ite,it66121" },
+	{ .compatible = "ite,it66122" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, it66121_dt_match);
@@ -1628,6 +1631,7 @@ MODULE_DEVICE_TABLE(of, it66121_dt_match);
 static const struct i2c_device_id it66121_id[] = {
 	{ .name = "it6610" },
 	{ .name = "it66121" },
+	{ .name = "it66122" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, it66121_id);
-- 
2.47.0

