Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A00B2EFB5
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 09:33:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C6710E88C;
	Thu, 21 Aug 2025 07:33:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="A0TaKZEw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010040.outbound.protection.outlook.com [52.101.84.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1939010E88C
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 07:33:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ujizYiDeT/qASaIKdmeyPPheBYHs06dvwVb4qadMknUtURR9GRULtrDTbPw8nn4GSofr80tP6rQRau0nj4io2IBds0B1m+YBNABzz6qtWGMRfqeK1b4fuYSitaPonUq8nU0pMEVxrYH8GpRUdb0jkzQ5E1KBxVrZ+lm0k46bWXB+LNMSV27bVWKwl0LupcANSyG2eYfcOdODzuCGvUgAZX1ouf1Zl5w5B1OZ3hCq/tKpRlUfdxF60HYaa6zMGyR6n6SWtCsTLBXxugn5+E0u7tgtWh99AtT7R6JvGc+4S0l+PvW1hQiAqPh6kLcDIoLM7wZ1PsMgKI9GZEVa7RbvSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pkqAn79cxFCsxx7DGR0ECu7k0oZKV8nB8gzpx7KVQFM=;
 b=BkSAUMH4VXpODWDNCEIvga8WrjDW/1GtcQcppxXhDtuSd7Sz98MzdFsXx/jFL85L2q+3Z94nIjQDmpF5TcSgmXOJRXefApj97DMtyHnWSjt3+/j5NPE7MYK/0HotvIH1qOftcaC08JALMrF+EBj/QhEIp8yexg2dwYFNKt1x42hNbGBODs+DSdlUxtT1seHXj+YE+Gppqsabk5Ve3GbhyGiQSy4ioI6CZ2UbyT68+dLjbgxB8UBN0qRH6FKTGv7Ps1sLFfc1QyvKIYTL6rI8hz2UP+ZIQ6qXQGQFeihyYvCu9pbLJ0W4qEnhw/tfcoKbaFK80E6gdP+BbFNO4wIRDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkqAn79cxFCsxx7DGR0ECu7k0oZKV8nB8gzpx7KVQFM=;
 b=A0TaKZEwj8/Cf5F8Yykhe91zwPQUazJ6JPiFjYKxatLWcfNMifzmnJWo7U8Kzfjd3Otb73btGpvuJUk2M9ofZ4NnGzHEG3KKekyevJSgqWk6XEgNs39cPEnHHCM2x7o/22ilVHhc7+Hk5C80HFAARHssnft+PQB+WKvXTeH5zljFzRd2zrbdgeoonKpSwcpLwL0GdgdGRm9VMygO6PqopQbbuUcyQIshRqt0rMHAQBY4sCvekckNiicapw4pg6vb4/QVM3+y2OM2IMY77asudkddUlO/m7fW2DuVw21tOZxw44VcpCjOYzrQIO3ETZEikoLZicosoRIKTWkCFOxKuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DU2PR04MB8887.eurprd04.prod.outlook.com (2603:10a6:10:2e2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Thu, 21 Aug
 2025 07:33:00 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%5]) with mapi id 15.20.9052.014; Thu, 21 Aug 2025
 07:33:00 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, shengjiu.wang@gmail.com, perex@perex.cz,
 tiwai@suse.com, linux-sound@vger.kernel.org
Subject: [PATCH v5 3/7] drm/bridge: dw-hdmi: Add API dw_hdmi_to_plat_data() to
 get plat_data
Date: Thu, 21 Aug 2025 15:31:27 +0800
Message-Id: <20250821073131.2550798-4-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250821073131.2550798-1-shengjiu.wang@nxp.com>
References: <20250821073131.2550798-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0021.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::19) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DU2PR04MB8887:EE_
X-MS-Office365-Filtering-Correlation-Id: 0374b93c-7a36-4d90-67e7-08dde084f47f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|19092799006|376014|7416014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RWrmTk/qwznoMW76ajBubTBnYbHGXwlCUG3yVZcRW/ZNHIEfJv/6eQZLrDk6?=
 =?us-ascii?Q?xjNTCrk95KfJ6uQZsRRnjITseIwJMwV9lGbNyA6/3QB5Xsrm+31yZYDW4Hbr?=
 =?us-ascii?Q?k2ym2fGEZce1Yvy422LP6wgAP2+Qnfa/ajbUwfIwkmu/O9hhii9S+d8lVegR?=
 =?us-ascii?Q?ccfBB/sLsH4mCp95VgmKmbLLw/Sq7x6msM9SguCDseiaQ9bGQKdKw9O2EEcH?=
 =?us-ascii?Q?medOCzBTGym3VCSeRsYiXkAoFN6cczHkQholdIh4eUVnr3SYMfnA7NYlKuMs?=
 =?us-ascii?Q?wEZlpK39287ycgrKT1GkgEBy7elHlCqbKspBYP4qCISobvcKHTAQBo40EYZY?=
 =?us-ascii?Q?vkjmsz6giyDm2z6gcFWl+lQOlT8yDSj0i5i7uxcxq63DI1IyCgYIDGavbuOA?=
 =?us-ascii?Q?r7QwaegiOow0WEIp4WtQcKvzWQhBo1RschRbnQWf8ncTRdDJd/UaYltlFCZJ?=
 =?us-ascii?Q?MgI3xT7GpaWFlGjplrtw/ASK4tObsYJ+r1b/f6WQh426K1etoYgs02YLzY01?=
 =?us-ascii?Q?tVzwk6faWeWkxgvGjF2qRjZVWzUi3m16f/tuSExDw1OKpi4Sdf/WiIc3mDb+?=
 =?us-ascii?Q?hjdhaFVyT/CSO0Xk+6XhkBr76GzuKywuUXJAwgVBtHnIES96hh3W0jyRnyh0?=
 =?us-ascii?Q?uoWJ4orFyj6mG2VXHd6FqD4Cx13ey5KEApXMHT3J46dM+Hc93UVpv39VRDoE?=
 =?us-ascii?Q?ykqBZ6Xcv58bF3iTH3KDMgSrgrVNEXtvp446gjXNDvK62ep0fzCAH+Qyday3?=
 =?us-ascii?Q?sDFWFFGA16ViFmZxY9Hj40ZUGuF4f5zl4qJJvNii6phhlOi5aLVMbN70krV5?=
 =?us-ascii?Q?N8AX9RDrXTO3q23lcG+wbDUgp1kdlDymSMFIWhaaD94jw/HcRcNDl31+OHjg?=
 =?us-ascii?Q?4Yp4ygPPY1WVjkUFBKmP6+cTJkx0ssTBqme96FkonHOGSaZpsIIInnhsZPmC?=
 =?us-ascii?Q?ks3DCHjF7CagRwTjEhkt3SuMjEow/uzW40hE/BmzOB1JIZCuGaIiXZwrXvbw?=
 =?us-ascii?Q?yiQfmfk1rzLx03IE5RrxtxNeq4Ra1a57sRLAU3hQftKOA/2o1FGT8/K55fxW?=
 =?us-ascii?Q?TuzO/Pb67jEBPmsiSAtmY4YhPq3dP+9a43rDYPHwaJFS+LSIItcTDYCcTg4I?=
 =?us-ascii?Q?v1MP7M9OtJIQ+OjD4y6HHEdVBSXi8TOxSNPe0tMOgk5o8mIZ+o66pWTiYQI6?=
 =?us-ascii?Q?ofjhQsZoKc4ibA39MNvug/bh54VSeOnQQuLapS21yuzA4W+/8vDGJX1BZXzn?=
 =?us-ascii?Q?7SN3qeHCdj5qnocR5ELe1oJsGxEwMvNwnqFGSh3kWVdGqpX3saPHqncce6aB?=
 =?us-ascii?Q?+wWdeeXB2RE+APOq85WBxoZ2dny/t8l6Zmr1WHvCYzjbOLKnoeByWmMSglLD?=
 =?us-ascii?Q?1lH9+9FQYyKCuXiMWobF770sKb9dpyw8+AjtdLGF5X8XRnxmpefOzq22YwCa?=
 =?us-ascii?Q?mGzlyJFJC3AVOueS9WQ/ZM5PNE72WoAz1H2t0t4cblWfvEiuZ/QQ+ni7FxE1?=
 =?us-ascii?Q?w6DltRq1P1dS5O4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(19092799006)(376014)(7416014)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+h+rPo/21qpCbHOOT4/SWl0Izmq39YbOsjQKQygAZAM0x0WDVvMUqQQIBh5n?=
 =?us-ascii?Q?NeJGMSdqJcTlTzbPz27enoGooXPlMYmcYu1VLhRi/Q0tuCkGXfrF+Bs+2AF6?=
 =?us-ascii?Q?S7azX9ijT6D0UGGZoWsWwJJ53Szp36Al12SAKwpvrPALvkKm5xtWiHicw7ew?=
 =?us-ascii?Q?1EBsfWd6bMrVp7N3rTTAX+Rgxaw5/vhNOwZFxqu3RMAI47bX/DpSsPKjiyU/?=
 =?us-ascii?Q?NZeWKYB2IR5zHaiPWimS6iIhK2tDbXe+/NFGlyaWKdVHJkASURKECxwzzE+J?=
 =?us-ascii?Q?q4zPXkC1VwVKNcZ2G7cPUINe/8+GxBGQ2fBnynqARr0ylgvPGkQH0YLk+YKu?=
 =?us-ascii?Q?ra2FfgorQnavUsobO7BPiOmnXNVX/++wy7HmPfWBnUwlFnA5zHFopgHo4PYl?=
 =?us-ascii?Q?rdbEgu5QsRFdXobem6JhtwLpbGSfYs4eR7tSZA7zIrCsXwFLO0C/hZbITIEi?=
 =?us-ascii?Q?P5yBhM5LHE3bwcRjj0xJgAZeKupd0+hz6W8zvm5+ITrOc/6826F7978hLhru?=
 =?us-ascii?Q?6otBT7URqEzWzDIM6DMUF36W/IQ2XQ9cyEaBBBsZi52ukWbGmK3un0dBobHJ?=
 =?us-ascii?Q?70TsdCXxuauX1dtjp4RubOvtsYjdUYs191X1cdd+psUSaGwW8E5yHRZ952vf?=
 =?us-ascii?Q?XZQUuseSGgciJHsCYBZ1YZ8iwkaJDvvlfbqESON+C2e4ZfbVLYYuD3BBVQ56?=
 =?us-ascii?Q?K1PPsYhjTb4Zia2lF3/xvH2hvDErHq6L0RdAl7ONxfnN3gU1zEbo4kJ2o+37?=
 =?us-ascii?Q?LJoPPKponJSqRO28qlwpjcMqSyR/9YmsXa5WBJzuzWBvkKTp4e14Mp7BG1Uq?=
 =?us-ascii?Q?uFnrXKrkTSjv5RBrXAK7QnVyAbDQj1NUAOAILswSqpdrhhuItv8nYV6jvRkO?=
 =?us-ascii?Q?2/hqUZSUhbQJT2YZPtMjWbS6qyXFrG3xBteffTRmetpDb7RnxRm63C/c/DLX?=
 =?us-ascii?Q?5S/k9CUunsOwUANpLcF8pD/XpPI32R3tK/eW7ZI1I2Q+4nOS8Nb5tkMl1H0n?=
 =?us-ascii?Q?FW5qp6I1nIkhkepkWvDok0tMaCHFZiwwTavnkx7g0c4gDu62YmvK+35K4n5m?=
 =?us-ascii?Q?brU5chH0bacU/5JQM1hZe43X6ANeaVSPXthECV07UYNX5JfiNTXlX3Kc0ZNI?=
 =?us-ascii?Q?V8qz8JgCsQmKIZ8ts8fFEwDsAGjnS7K8Tc3w4VyQjVeMqxQjK28PZ2WC2m9c?=
 =?us-ascii?Q?WxuTDgg+hMyeyU779jz2Zc088FaiWoyShoXmcRdT3aOC8GJodDyLNCJNGKyv?=
 =?us-ascii?Q?ORY/5MRyn8AMM5VEujD+o9/4VOrMNxSsO771oGnMKjdd9zszP5eB/oA+W2gj?=
 =?us-ascii?Q?Bd1KwzrMWYZAXugR73NHTy3q8/yrMPexWmte5JkdDyt8uDub10ZqTNm7NKcb?=
 =?us-ascii?Q?QERGWevWN0bUkK7qAp8yx5ofmEd1IMId6PLBe4ElKVDvIEUp7rsjQL5yCpR7?=
 =?us-ascii?Q?81Kk+swkbv4X2FscSU6Q1EIm1d13zCjbe6l1SZqan+pENQRjjIdjzLLBH8Qw?=
 =?us-ascii?Q?/9tQ0C2amC0xwv4Z7o/bIuyq9lPzLTiV3FKO1mxuFrcMx9T2wMrNa0jv6fNE?=
 =?us-ascii?Q?YOkaipaDcRQoUHk2ufrg2G+39ueRf7RQD1R1m1lj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0374b93c-7a36-4d90-67e7-08dde084f47f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 07:33:00.0959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oS5AuNO6YWg8OG34QCoL0hMq+qJaD/CLIjyKXOtGIAiCppnWoWRjQnKYyqYoFbOqWpHoiQjrIobEU+XahLEXDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8887
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

Add API dw_hdmi_to_plat_data() to fetch plat_data because audio device
driver needs it to enable(disable)_audio().

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 6 ++++++
 include/drm/bridge/dw_hdmi.h              | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 206b099a35e9..8d096b569cf1 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -198,6 +198,12 @@ struct dw_hdmi {
 	enum drm_connector_status last_connector_result;
 };
 
+const struct dw_hdmi_plat_data *dw_hdmi_to_plat_data(struct dw_hdmi *hdmi)
+{
+	return hdmi->plat_data;
+}
+EXPORT_SYMBOL_GPL(dw_hdmi_to_plat_data);
+
 #define HDMI_IH_PHY_STAT0_RX_SENSE \
 	(HDMI_IH_PHY_STAT0_RX_SENSE0 | HDMI_IH_PHY_STAT0_RX_SENSE1 | \
 	 HDMI_IH_PHY_STAT0_RX_SENSE2 | HDMI_IH_PHY_STAT0_RX_SENSE3)
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index 6a46baa0737c..b8fc4fdf5a21 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -208,4 +208,6 @@ void dw_hdmi_phy_setup_hpd(struct dw_hdmi *hdmi, void *data);
 
 bool dw_hdmi_bus_fmt_is_420(struct dw_hdmi *hdmi);
 
+const struct dw_hdmi_plat_data *dw_hdmi_to_plat_data(struct dw_hdmi *hdmi);
+
 #endif /* __IMX_HDMI_H__ */
-- 
2.34.1

