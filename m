Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEA36547E8
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 22:35:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 179DC10E58A;
	Thu, 22 Dec 2022 21:34:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2040.outbound.protection.outlook.com [40.107.7.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE44B10E58A
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 21:34:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D7UXk2DlRNTB886XnznrqjWgeoWJi9ZaA8MqsVvSk8berbGPVv9ijk4nnYopTPBQFUiFTgqNqfcueCr6GRMgVAunJk1fDZ/PS6by3BEeHqcfKlCA5NM3P7fkLI++5GCUBirIyPe41awz6NxXOmQifMJE16zhqjMK3/eYnNWH9XXQvPRMr6My3sMT7VOYNev0rHcbKpHO2MF1zEm12AQtQ+plQq7f6ZDMBDT18S83c+VkNdzXo7IaLoe30JXJRKGvlhZ9VZ6ZefWbV55uhxHlHrWjb6NL0yf2PgsEO1HloPxz/DjQ8c6HqlXElVMr4ONoxJTChsJGVHGi7tvL5b17jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qUV/ePQN2zXJPIM4M4btJBr5zqwo9T3VabUNoeDEDY=;
 b=L+bnynOAVDitdHMe6cNeFnytFWh3zIebZ+Fu8YA8HFvj+t89bJLhIrI9x1sFYc6ngw9NOwNXSDPHWzMnnfLKVY6a3+Y+Mp99KA4Dl26ePOcRs32pA5gIuk8+mEnQhRQv9N9CsGjgN+ojpGe8bG/qkwkrQZppC0L+tOIAX1PvEfsn6ZCTGErmM5vmRzywEtPtbTdJQPHyHNy8Ctu6C8prdpB0NpuECbtEUqCrZcGWhQp8MRHWUQp+WviuXAy4H0q/e1IKR4q1s/0oZVW3177BlrQxkNM1fjuYZ2Q17o/HxM/L38rudTxb/6Kap6utql/jO5ML7vjracKLxEu0JeQHlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qUV/ePQN2zXJPIM4M4btJBr5zqwo9T3VabUNoeDEDY=;
 b=Scb0paf/SnaQIg4QH0ChI8btk0JyzVq1LCjQDcSgy5ZheqUMrkm0ZVlhwZw/NLnxbYWqlkYro9Ubll/7tOoGZe0K8ALpycsdfc/bUfCvZD5+PQlnVvBGQsi4x4IqTIvwyKbElHNmODX/APRsugGd4tXPZEei8jdAMb7QXDDYb6lXgVdnulrUJaOePSPdwPG0/NNxKl7jda+JXQMJrlyfjy/vR6VEkiBZi4BfQh7pLpBM+lu4CiXOhvjUKQ1GsOe5ilDRleSEjSta/5otJeHfFKKVNapILd5EUl52wfTmM4SZlGCAYsxkKkOuI3D9poVZk/oUFGYlE1dtwjx7T/xQzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from AS8PR03MB8832.eurprd03.prod.outlook.com (2603:10a6:20b:56e::11)
 by AS8PR03MB7587.eurprd03.prod.outlook.com (2603:10a6:20b:34d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.6; Thu, 22 Dec
 2022 21:34:48 +0000
Received: from AS8PR03MB8832.eurprd03.prod.outlook.com
 ([fe80::264c:4825:bcb5:e4ac]) by AS8PR03MB8832.eurprd03.prod.outlook.com
 ([fe80::264c:4825:bcb5:e4ac%9]) with mapi id 15.20.5924.016; Thu, 22 Dec 2022
 21:34:47 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: kirin: Enable COMPILE_TEST
Date: Thu, 22 Dec 2022 16:34:26 -0500
Message-Id: <20221222213426.1858941-1-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR13CA0011.namprd13.prod.outlook.com
 (2603:10b6:208:160::24) To AS8PR03MB8832.eurprd03.prod.outlook.com
 (2603:10a6:20b:56e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB8832:EE_|AS8PR03MB7587:EE_
X-MS-Office365-Filtering-Correlation-Id: 499c05fa-5abc-4255-44a0-08dae4645983
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M+/50+M5ZrY2PMdVa6PksLffhVW9WP9TnAGy+nPyn0x0bNKBcStKaAyoLGyaHjXltq4IYY9zfobrQxDzRGycYTBiircxmxgUH/UaEVcUR0YfhpbRH6Ro38qYemRtWpeLYgqZo7yBF6Yz5AeJgI42v8iLY1EofEyWHC4kON3+cTGAn+rhBbaRR/PXxYRiJYtwhbLumucNGGy7jvropkUZaGS0zqzK/CudhN4AiN1LHIVyfbPPLEXpdnfQ/EuqrnyhUCYdtRs0fa/JLI9QHOAnI+JOBz22jT6TJZjy4zyXhpgiW2XeiltGNRAukxTXSteEwuUzqGxZOGpsogHjWlk5R2KgoKLpOPiwJYXzeT7xXjS4ffRRwflxv/F2d/E7QTaagzh/hhetCe0G0CewUChhPfWpQhFxy8hb7zD5cIXCypypsjuHjQ7+NaCEcNs4Gv5X3/PhSrMg+UuGP47rtmEzsl7BadG8GQQDm7YUdulaHuzQRU5wqUNJnWVXfj3uIObaLaIgx+sa33mXthfAMOrkoZpwqGkjF5wxAxTSI4rlxElLswQ30gDHhF7iUjSleFg5+79+JuOeeLHD5hUXjP6jquM5dS1UmMnWCeq1KabzFToSEmWE9UI75guOd3CHPhPp4/x7zbfdcDq5UHBiFHppSRHN0ZG0tySF8qnfn0IaFMDh4c8nMovMmD81doOrXJwRbLYFUymnXGPIivSxFVVGzQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR03MB8832.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(376002)(346002)(136003)(39850400004)(366004)(451199015)(36756003)(44832011)(110136005)(2906002)(54906003)(316002)(1076003)(83380400001)(2616005)(6486002)(52116002)(478600001)(86362001)(186003)(6512007)(26005)(6666004)(38100700002)(38350700002)(107886003)(6506007)(41300700001)(4326008)(8676002)(5660300002)(8936002)(66946007)(66476007)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ft1FvPM11QnO970QRasv6Vp+L+DFPgYfmaGwfU/ngcguxOlgQQyef48Nyj1X?=
 =?us-ascii?Q?XDDmB7mgnW0lUM23KeIpLgbn1NJt63ADDbMgn9qb1hsrFOWTsQbsqRGd+ZhH?=
 =?us-ascii?Q?D3EAQRQeBzL24zvSDwHnUi7Ma3WaW5Toyk+7XqNOGlTIXspfmmK5Rz3czj0Z?=
 =?us-ascii?Q?lPeeNZKRSa6uI6zj/EJIOc6gGGoAbbmSl6qiGykegJrg5hZuOg90zbw1dOFK?=
 =?us-ascii?Q?RSE4LPadOQBgGLBbfeNKX0JaCte61sTXypD3Rynli2grk2Or92/KXPUub7Zj?=
 =?us-ascii?Q?3XFphtmVkSYNTdP0hbW2093H8ZiHIKfrL7ShcXVWy8IFlvNJf2lTd4luSvOl?=
 =?us-ascii?Q?3eLvW04A2yHmWhQr4UxYFg31TyhlHBXZ1BDidkEyHF3tK8a/lY77bDPevQH7?=
 =?us-ascii?Q?/jrHKvfYwk360mnPfPLWiR1GRkRwc7+kmnQY8aNoUMR7MqXTXOKePnAgbBFO?=
 =?us-ascii?Q?/mdNOL+nyNDBMq0fAQun6yIAoTnzgj7pSPswDRlqiIXcEM/yPFGjJ0h6Z1O7?=
 =?us-ascii?Q?OFHHEJwNHy14+IPSfHJfv6+0I/OnVmv3CQ9rf6CMPqvLbdgKueS7jnG3YMo3?=
 =?us-ascii?Q?4gCiepv3VWF3ZNYko5PvtTVqhhaxqIXy95Ez5VWs6po1HhsierAVnVj8MM2G?=
 =?us-ascii?Q?gQOoT5aaS2Dr/Y8nElLifQCpI0c8KyxlVy+jrmVAZ87baX4cLDqdguBSNGhk?=
 =?us-ascii?Q?uO5LjwnSP3TRDwe0TSfxeDjcwg6p5I6egXyultrgl1wcNShn3uRsvnvLco/R?=
 =?us-ascii?Q?aGZBh50ThMcs8rJapCPzqrS2dTlWsCkBgh4xL0pCfH/FNblScU6gMQW4/QvY?=
 =?us-ascii?Q?Kd9Bvs8BkS+jMP7Y3+0eI8fZ6c5dLf+1NG9p1JWFQw+su1VXp+6jy9bb/uBn?=
 =?us-ascii?Q?Lo3ZnAUMvaXkgH51X18DKm8BxjNQnaMdnjgx1l3YgNyz553vtv/ZJEEyPeN+?=
 =?us-ascii?Q?ebCklvUAhp+YZp+zInNxz/4c5b4ANa8sVU+Mdfl/Ad9eB1MqwcfW+K1UYR4V?=
 =?us-ascii?Q?MfMzhoKzT/bk4Hu8AcsNd5XWtO8ONSGtvNzF/94OuZcFYv01PpSVHIZtoAwF?=
 =?us-ascii?Q?zhwVyHcbNjvkEFxI9ffjm/os4WsW/X8kGGBFZbwljTJ9FHtIPwIt/yEFUh3q?=
 =?us-ascii?Q?j9KF20alnGfzxPMmUwNlB543Whp0RvLk4hNFkbKm2KsKenXZDcweQfulpxs8?=
 =?us-ascii?Q?0FLpGv+1HFP/MxjcnsdW0Q6RVYGdLaQJqncgBq0Soq7sRT/+k+ykCEyxnQsQ?=
 =?us-ascii?Q?ijKr3LUO0kXTV8J4D2k1tiv3Nz8QX/tut9AEsqT3y+GChkBUKTMRtIeuraow?=
 =?us-ascii?Q?heyCoy6D7O1tOsjzE2U+oIIqHHjIAIYUZzuDHIGucsAt3KGs032kZ0y8mv4o?=
 =?us-ascii?Q?zX+cSIzV98DUV6153nhIvg+kaefc9Po1Nj0X0C9p2p0G0RcDR8PGN/qbC8v0?=
 =?us-ascii?Q?FrXbgjOOTZEolCPWieDpP2jEJ3uXW9inwmcglqNlFFmsvrv3698/UF0tzWxz?=
 =?us-ascii?Q?nqIwzT5NG8LUDVZgPKib95HnQRe8w7NvGzUifXpWzUy7oxkrXzVGLvWvyceC?=
 =?us-ascii?Q?BHopSugifJO7x2z5GiLeU9VhAcHYGL0R/N/oGEeDAVdqVAAPxCNi9Hce4Llx?=
 =?us-ascii?Q?Qg=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 499c05fa-5abc-4255-44a0-08dae4645983
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB8832.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2022 21:34:47.6608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pLT33stOMkYsEGesqfOCz32YF4LAieA4fYm2xeHxQK6L1ZylTZ2/iPPJwMsw6ED5R0/zS2s34nQbW1XC6l0+TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7587
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
Cc: Xinliang Liu <xinliang.liu@linaro.org>, Chen Feng <puck.chen@hisilicon.com>,
 linux-kernel@vger.kernel.org, Sean Anderson <sean.anderson@seco.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, John Stultz <jstultz@google.com>,
 Tian Tao <tiantao6@hisilicon.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use macros for 64-bit operations. This allows compile-testing this
driver on 32-bit arches, so enable it.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

 drivers/gpu/drm/hisilicon/kirin/Kconfig      |  2 +-
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/kirin/Kconfig b/drivers/gpu/drm/hisilicon/kirin/Kconfig
index c5265675bf0c..0772f79567ef 100644
--- a/drivers/gpu/drm/hisilicon/kirin/Kconfig
+++ b/drivers/gpu/drm/hisilicon/kirin/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_HISI_KIRIN
 	tristate "DRM Support for Hisilicon Kirin series SoCs Platform"
-	depends on DRM && OF && ARM64
+	depends on DRM && OF && (ARM64 || COMPILE_TEST)
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
 	select DRM_MIPI_DSI
diff --git a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
index d9978b79828c..1cfeffefd4b4 100644
--- a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
+++ b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
@@ -157,8 +157,8 @@ static u32 dsi_calc_phy_rate(u32 req_kHz, struct mipi_phy_params *phy)
 			q_pll = 0x10 >> (7 - phy->hstx_ckg_sel);
 
 		temp = f_kHz * (u64)q_pll * (u64)ref_clk_ps;
-		m_n_int = temp / (u64)1000000000;
-		m_n = (temp % (u64)1000000000) / (u64)100000000;
+		m_n_int = div_u64_rem(temp, 1000000000, &m_n);
+		m_n /= 100000000;
 
 		if (m_n_int % 2 == 0) {
 			if (m_n * 6 >= 50) {
@@ -229,8 +229,8 @@ static u32 dsi_calc_phy_rate(u32 req_kHz, struct mipi_phy_params *phy)
 			phy->pll_fbd_div5f = 1;
 		}
 
-		f_kHz = (u64)1000000000 * (u64)m_pll /
-			((u64)ref_clk_ps * (u64)n_pll * (u64)q_pll);
+		f_kHz = div64_u64((u64)1000000000 * (u64)m_pll,
+				  (u64)ref_clk_ps * (u64)n_pll * (u64)q_pll);
 
 		if (f_kHz >= req_kHz)
 			break;
@@ -490,7 +490,7 @@ static void dsi_set_mode_timing(void __iomem *base,
 	hsa_time = (hsw * lane_byte_clk_kHz) / pixel_clk_kHz;
 	hbp_time = (hbp * lane_byte_clk_kHz) / pixel_clk_kHz;
 	tmp = (u64)htot * (u64)lane_byte_clk_kHz;
-	hline_time = DIV_ROUND_UP(tmp, pixel_clk_kHz);
+	hline_time = DIV64_U64_ROUND_UP(tmp, pixel_clk_kHz);
 
 	/* all specified in byte-lane clocks */
 	writel(hsa_time, base + VID_HSA_TIME);
-- 
2.35.1.1320.gc452695387.dirty

