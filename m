Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB54AB280B4
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 15:37:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6103F10E955;
	Fri, 15 Aug 2025 13:37:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="RlM+X+hS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SEYPR02CU001.outbound.protection.outlook.com
 (mail-koreacentralazon11013061.outbound.protection.outlook.com
 [40.107.44.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 277F510E955
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 13:37:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KPIFYPA3TzEY0mDM3Engg4k9NCrqz36meoDCbKB02echUN0KjNmhbo5mVpgwcaTSGXt0TCQkPudZnn3E9oFStJXQWyW5RV5IJxvt5SgytzcCpUzou00bksrT7APU+ZhXrW4dYMoBbG/UxS2MXqJykoS0RXxi503bqu9GrTr1T+FNW5EtqAnkPSMH93k5xFNbyChkFDR1x5P92vmoZikiKRVOZisAtL8JPT9FUeYNiuVG4Z11rsWQCC2/japOy2Qh27f0Mn/AYJBmQqg/d8pbwXM1ToTwaS5zBPrOeN/igdkaW8YLXui5LEy8B0swrx4yq/HxvX2m6O3ZRbzz/LU41Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yPjVaJkUdi5nIK4gBnvJPhcqMh/96ajKzmEPzZ1O3KA=;
 b=EkVAxb3pCn3DGa2y7gkALDrMutDl3CjpVyk5ZC1Y8ymdaR7QxHxVLzXMkZQNt96HNxhBdE38VbM+QsbtSOhFPpiVJRZCSAackBiEkVUZqb0TlmEeLw9uQr4ywlXlBEoOLHBMCBsElDjmDRKZXOyeiPzPWb4mu4AaVEhyQngIn59WUcqT2N7UxrrmNW720jUCyJ0w1MwEJYwEYxrYo7eQWo6NaEXvFJgp+/Ocm4hxwUVLDLCHjTkTMivAB6J8OFSt3pEa6hBez523gcnqmRMI2GKaZ7qaNFv2FD/p4PEA7azQv3CAXAMgCZ72zO5Dgx5H5tVwgg5vQ8YtuR/mAyYkoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yPjVaJkUdi5nIK4gBnvJPhcqMh/96ajKzmEPzZ1O3KA=;
 b=RlM+X+hSOKTpRdkddOs+RMU2jp055vXaH/ZDrOL0v2rzFzjmISXmq2Pia9vQ4LoTW6zDyitrMmbaKfRgzWkq66gFtZUU/S7dXtIKmoFGFDsDSteilKZGA/BQc5sdstya91SDk8bHbiohPXuBDXF5G4agpXJLezDnSef1VVUUVJuD66Kddra1ya6r8SbPCHHU65BemOlM13oLYNIAT6USvCYoW5FsMpTW8FAULNtBlIoqyg7djKsCJ2WtYRupM8U103e1UZK8z/R7o+nXxK3b24SJZMtl+4j2NxPsqXV5vJoZ0GEhB+gFx6qgeh2tlGGbPTQBgQqR3AsfgUJHcxtVkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by OSQPR06MB7277.apcprd06.prod.outlook.com (2603:1096:604:29a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 13:37:38 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%5]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 13:37:38 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR ALLWINNER A10),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC
 support), 
 linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support),
 linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH] drm/sun4i: Replace redundant return value judgment with
 PTR_ERR_OR_ZERO()
Date: Fri, 15 Aug 2025 21:37:27 +0800
Message-Id: <20250815133727.418204-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR03CA0017.apcprd03.prod.outlook.com
 (2603:1096:404:14::29) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|OSQPR06MB7277:EE_
X-MS-Office365-Filtering-Correlation-Id: 63798f0d-ea38-46d4-6276-08dddc00e6aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|376014|7416014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BwrZUanwmcPmooAQTiDde+krs5JY13+ZXrE57L92tdmdETjrEnntbwF+A96T?=
 =?us-ascii?Q?xBGGmEN3HaIhVGn2jMJfr82P+ZHFnTbUavXVj52JTYTEdQN/TCVJnxAge3sW?=
 =?us-ascii?Q?25SSlJEEoS0ai7g0lCG3pd7h5ZPXx8J9cn0tzWt3YKMOPf2luaOYZzuqY0gR?=
 =?us-ascii?Q?pNAZSOf4u/45laKWxwp9Wn0Xdy7WC8WlmvPoB+/SEaCnKYH41QFmTqPU1RQ1?=
 =?us-ascii?Q?6tENvvRj6wMzCRW+p68T7Qw38XSMtuA15zYVUAjfEJW1H0fzuIaQkCbQLVmu?=
 =?us-ascii?Q?0JaRZSdjxhD1a8OqukTfLuUkWTE9f6rn3BzwVb5qbdhjzrClR6gw4nZs4H1V?=
 =?us-ascii?Q?yOMcMcOGCS78BIfE/cWRI4GfAn1aGPMzfV8RNeJsrjxMIW+SGl802AkQtqKb?=
 =?us-ascii?Q?v6j0vANFUMQH3RTZGee/XTpbksOIolgpDr4I27Ck8yxcK0ScniP+jeMrKtfr?=
 =?us-ascii?Q?VLmgaqLzyOzSHiCBwpNzIQDkOdWtHVrxq0hurN28arYYmxrXGufAJZ5/shca?=
 =?us-ascii?Q?WaAFbzrWEgS36h6hI2loHqjttSlrJ7PCNMVC5xIHPfiHqT848bbM6Z+xOxeE?=
 =?us-ascii?Q?ue7FnDqssmePc4NVdYclHkT6sAjiw28ezxpMltyB6UlA/CaLyxg3uifRifv+?=
 =?us-ascii?Q?m/JO+rYbVTklL9s/iqHvzQxS99bRYT4nHUD2LV+Iyh0wCCodwUVMi+h+v4R7?=
 =?us-ascii?Q?P4ZeQ5IczDkjhZgx6+MsswwQjTsOzyvTq1wZqS6bqrqt1RRekv8AYb7WkElP?=
 =?us-ascii?Q?V9G8ruzZ1oCUl9hH1KcID+PB6MxWgwmCLLtWRDuqAupuDvDnwMZTyU+0Ooh7?=
 =?us-ascii?Q?PsXlN64xAImvzJ1Mk66vZkwPA5Yy2M/9uIBa931jxKJWLLAPEH6qML7nBaT8?=
 =?us-ascii?Q?8nEJeVCeVMZepnvdBJ/Je5XLQlWeWPlWzK1FE4JYcu4o/bRpSk5OyJKQ9k2R?=
 =?us-ascii?Q?Uf/qc5yFxEtJMQJqXV0+enRKI1eLvCq8PgougfCp1DLDwf29ykvUM4VeoJXa?=
 =?us-ascii?Q?EY5QXKqYzlMjg4PJ+dkCyfWfH8ZAJ0LayBc1xVLLd4ZL49BBnCM5/ygDqBO7?=
 =?us-ascii?Q?G/m9o6bxBLA72sQiZdI74/iesRdUniuME0hfO3UyPEljTuRHRTKsWzwSo0WW?=
 =?us-ascii?Q?SG+FBZDwLYSaisNKstSzYcyOLEPlmVvtjOIoNU0hl9ifNKkVi8Hp8phHOXwf?=
 =?us-ascii?Q?HPJM60n3LYvFHSS9cXncibU8S6vZt3+yL0o7ESLJu3UsV3cYLB/meCr/QE0m?=
 =?us-ascii?Q?6Iw1XcDEOtCKoFrBUoDRfyaA8K37SjEYofIU8MAHwiNsgTZgsJIlQJ+tA8O0?=
 =?us-ascii?Q?p9MuCsTGwVyIcParGEBTVPg7mkgEprhCwiT/cAO5SjiTS74hPx29azUlB6ux?=
 =?us-ascii?Q?EF0Av+xI3t24NMspx0qdPAkHSWqAfEbA8BdT+ArjtAZGiDM7wbc5bQ/UAD+k?=
 =?us-ascii?Q?04kO8F/vWFV7A4WRc1ZqFWnmJQJODkJVbo9HmdyGADy/C7crAUoV+FmQlE6K?=
 =?us-ascii?Q?36OQyJJtEI13b2E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CBztGzt+xABm3aMzOcZo9VnjQfGjO1wZff2lCpvYkVb6vdp8GT+AGIp9kObA?=
 =?us-ascii?Q?eJIgr50Ly+yeG1uexRhdAcb7aXt1bBse0O1JsiZhTfgsY6hgq+zMKj0Oghbf?=
 =?us-ascii?Q?HvhkqO4O2Q8swpW3MZ5VdFxDpK9YzwyRqhYshJcyiN92EUBcb3/YC32eZN08?=
 =?us-ascii?Q?wtsnL6H5X5pXF5aByIvBPQKi3QhI2VSrM7k6FXxr0oRSszXk2zCKHiDhvJiS?=
 =?us-ascii?Q?UNC507BsrjRhaESskZ8EXGhBV168MgeUsIqx/IJUnd7Wllw647dIZ6CyRvwz?=
 =?us-ascii?Q?K0fXLt9tUK7HJO1FPE/X0buFVEljx81IVOVmsG5jDAyNyhZy/DkEr/aUUn+9?=
 =?us-ascii?Q?fthbI77rRG2xm+UQMeK7tQRJikK4ck34D49oS/fMDiiiXtYnMQ/6xiJjrcC2?=
 =?us-ascii?Q?I8jEdsvtwgMD0orbVzzgEHmt4ay/bCS4Utf5ENKVtc1bGUbkzmNyBEh9sEpj?=
 =?us-ascii?Q?TQB5Qy8bfbuAKOB6+z5SrM/zWIBPaoCzyVW2v87+zyorSRvWnLVPb5cfRZPj?=
 =?us-ascii?Q?jWg8aP2UT5y+SBl6lM2ochuqrRMj6mzSh19c/0iycP540/HeECcy7VL3OgV0?=
 =?us-ascii?Q?/RBMiI7JO6AitTkDpmGZLuMIAl7E8QyMxi0mkW0Oty4clDIpCEIWTgPdpokr?=
 =?us-ascii?Q?ZkHodDEtYv/2MWJbQzNL4WP+W4lRxV0R/X1X4n+Rlmkfc9cjVuTNxjNhXY+y?=
 =?us-ascii?Q?LA4Mh/Vxe96zRYn/PauKnD8SoymUr5tZ8C+eznWqA35Dbd7/8rtWX8k3A5bq?=
 =?us-ascii?Q?FOdn1lGoudap9lMdQhT0RB/FOoxAhZHGXBWn75iiv+mSTp6YMLNKJTcfF1DO?=
 =?us-ascii?Q?K4tfugVT/bg3r7oC9u+IaZfMXxNypTUh4Qy0uVvEhUx0OL2MSED/jx0xh300?=
 =?us-ascii?Q?7V6hmYppvEx1rpwraGKYcf4+CHpkKkZJh8+SIBgcEzTh6pZksQ5y6+D+e1u5?=
 =?us-ascii?Q?liqiM8+FCZfYb65BvIrHvdJOfo2OOjxhatV7UibV/Um7lShguu7zSjzUpR97?=
 =?us-ascii?Q?4dewyjyHe5yGrY6mkHCpZ6OqLUcwx80uXmrxPGtlAz7a+GhKThuJiORVyuW2?=
 =?us-ascii?Q?Jq4AAgsFBI1d+07oPneeG+Qgmi6xzGP2g+FGZRtZyuXd4jRGzhPVDrEtaU9X?=
 =?us-ascii?Q?x7d9d+G8JeEw7YmljFjmF9PCI0gKtsZfdIHTtdgMVZdE8QfHbDUdXR3+AxG5?=
 =?us-ascii?Q?HeVz9aAKtADaHy9WUS2ehRLE+tSosUm1nnaMSLd40Yr5p0EAKJIXOF6LeulR?=
 =?us-ascii?Q?69Qysj/uYEXEFleEUonX9yfVtpUjo3CY453/7ncxbexhtiEo+rSqilZtTvOo?=
 =?us-ascii?Q?C6w6T5tufqQ37K+PxF+dfMKDyDON3gx+tTLkI5xnRaWvfhwIeS4j1IrltQOc?=
 =?us-ascii?Q?PbdkJjmOIIGk8j9kKBCuQYdVSEIIdcYyeKN+fsCL0Rug5goeQ75foSkcnsKf?=
 =?us-ascii?Q?zyYwXR/FOrxZHP4SuLrw5YLcM5EDFb5W3Pa+fDhpVypMKof+1mJAuxxqs5FO?=
 =?us-ascii?Q?x27vlUjSY+3sEiolzhDWLhq4/ISV8tMlhsjQ6oWNMEr0hoAlaGrGjQTUlrP/?=
 =?us-ascii?Q?EHBO8oM0OH87XSCZTFyFgaRWeXCPCjkelYG3myOb?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63798f0d-ea38-46d4-6276-08dddc00e6aa
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 13:37:38.6867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Mc3mEu8pW+o1ZA4QG64VG+73TbHZREa88g3WkVanaESIhJ5uV4EQTCPnaduF8ZS61822/3frh2soIeyy2v7Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR06MB7277
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

Replace redundant return value judgment with PTR_ERR_OR_ZERO() to
enhance code readability.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c | 5 +----
 drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c     | 5 +----
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c  | 5 +----
 3 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c
index fbf7da9d9592..c90dd0ad040f 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c
@@ -229,8 +229,5 @@ int sun4i_tmds_create(struct sun4i_hdmi *hdmi)
 	tmds->div_offset = hdmi->variant->tmds_clk_div_offset;
 
 	hdmi->tmds_clk = devm_clk_register(hdmi->dev, &tmds->hw);
-	if (IS_ERR(hdmi->tmds_clk))
-		return PTR_ERR(hdmi->tmds_clk);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(hdmi->tmds_clk);
 }
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c b/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
index 03d7de1911cd..49fde4418820 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
@@ -191,10 +191,7 @@ int sun4i_dclk_create(struct device *dev, struct sun4i_tcon *tcon)
 	dclk->hw.init = &init;
 
 	tcon->dclk = clk_register(dev, &dclk->hw);
-	if (IS_ERR(tcon->dclk))
-		return PTR_ERR(tcon->dclk);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(tcon->dclk);
 }
 EXPORT_SYMBOL(sun4i_dclk_create);
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c
index a4d31fe3abff..fb0d77db8b84 100644
--- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c
+++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c
@@ -171,8 +171,5 @@ int sun8i_phy_clk_create(struct sun8i_hdmi_phy *phy, struct device *dev,
 	priv->hw.init = &init;
 
 	phy->clk_phy = devm_clk_register(dev, &priv->hw);
-	if (IS_ERR(phy->clk_phy))
-		return PTR_ERR(phy->clk_phy);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(phy->clk_phy);
 }
-- 
2.34.1

