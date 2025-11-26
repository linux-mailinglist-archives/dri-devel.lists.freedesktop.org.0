Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD50C8A2FF
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:10:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2108B10E626;
	Wed, 26 Nov 2025 14:10:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="d7tQ08Li";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010006.outbound.protection.outlook.com [52.101.229.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B7F010E626
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 14:10:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rttm9u9U5aNHv3nbmbYqb/7T++A6QRmUiDHQWVdZykZXg18cTTt+oEbK/CwFsbrXCe/x0yiVcEa7/q9lQXxyS2TaWJOmp/oGUpvAJ/eGGw6S87Qdn+cj/XAJE0/E3whpaTalxz/ExLSlnsKeJpqzspWu6IQPgE4U1QUBruKnVzcwAuBmUUwxxG7EWJvou6hQAnP4MEDphgMip1SGLMikPAzWUocT/TESReBQu4ha9qCZzj44VafsdOhTlf1bJh3wiDb+Ur6sg/0gWIcQfPQXHlvhZ23xa44ornmc1pdc7O+8i1gUVuokojNVldD+av8P6opsAFDmkRCJzdHFVTkSZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lOVT8JcVhywIun/ufQo23wkM/6jwfTIcZ5NZycCPH9I=;
 b=vVOJLqFZgFV0POznclcVcKOVKDDbXiO4xCd+dKmTNtS7dfuXyoxfPGRWHncsKvuB+Lp/NABfMRn5BcnQtAOs0WrwJMMApeYELvTGcUOfzdP9AbJER7XoFONASSxsxXcwj28SQZPCNHyUeegXTcKzwWlsczEx7sHQnqKUtkSedF9NeURPtyyrCxSFfBOOJQa/A6MuXgR69C9xruo2iI1C0VK22jw3O2pE33qGr6hACe1ioeGGJCr30znL1wXenzgc45I9pJ9gK6KUe6N+4IVp1+BYd7bEGb8blIzGtetQlDd/NqBfCfhoKBgVRwM2Ndhw43B1FjFGN49Z81ILpBZBAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lOVT8JcVhywIun/ufQo23wkM/6jwfTIcZ5NZycCPH9I=;
 b=d7tQ08LiDC1pAWKxlJg0PlsDI7b/7HTqJOPD1gtK7SgeMKLzuuy5Rwv/U/qSURyQhB5nBS9GOf3Jc50AGxeCr9NZiXp9+++0PsruwV2uvyHC0zMcsLIhjq4w6NLIKenY8NtkEUJjpf28fMLK5aGU7N08hqBLKixYWnuEmqAG1nY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB6804.jpnprd01.prod.outlook.com (2603:1096:400:b3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 14:10:12 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 14:10:12 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 13/22] drm: renesas: rz-du: mipi_dsi: Add support for RZ/G3E
Date: Wed, 26 Nov 2025 15:07:25 +0100
Message-ID: <668681c33d472d02c2ea0879c034bff522c290ee.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::14) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB6804:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dac45d4-7c08-4d1d-f6df-08de2cf583be
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?L2gzWzVg/2nVQp2e9VdfgmdcU+PCpm3bAMjR2BgUbbCfcB/+D5MQLxaF7D4W?=
 =?us-ascii?Q?4GqGPLKefv9YB0RG58mt8EbDyQqNqv6DPnhy/vy0WQrOAnZv1MD8ViIFAjQ6?=
 =?us-ascii?Q?jrHQT44+YY0+42cvDBTusq1hb/A9kr11i76rzCtqsCPXFCsZv56tfGnfJx4a?=
 =?us-ascii?Q?mZKM1X+uF3Y3am187hozdAuRofZS8ptN1dEyz4XTeoPqpRKyYVO5jGVhHtjh?=
 =?us-ascii?Q?owyX10YlJKPCt7OgwvyAmbz6fZan7GJhvcKKE7Z3esxdqHtZKoTu0+qjaIvR?=
 =?us-ascii?Q?Pna1I9J/hwbE2GAgNBM1Bi2voy7ziUOT6Ez/9w/U+bkwX/NZ0bRGnr0T42i8?=
 =?us-ascii?Q?inhHFT6YiA0GV1cLyVITdfGzu/clSPqahLcZTNUDqzFH45faapMEK3hFvYp0?=
 =?us-ascii?Q?crAHn98RIGJMyVL6EId+8MKmU2NpcrPC7SFE/EFXs10E+keOW0ku//bLq8fG?=
 =?us-ascii?Q?dHKgpt+reKznZzSddAvMWLrnEdyl1w9aBZzpZg5GaGdRh92YqIDGx14vcRFF?=
 =?us-ascii?Q?HnhIkrtVZnfuYD4y2ad4HzxfE0mj+9V/w9ET7pdL3h3zNyeqpgiIzsOJSuFP?=
 =?us-ascii?Q?1uBMA5XUZ9td9g0HfUE06nO/eYHNcmt5kgmonXc38G7DKxcEsjiyLQcsNbvP?=
 =?us-ascii?Q?rvz+69bnCvGcGDjb4F5o+SZOtgQciyPijgvuFnSY99z3uJgwrn6hFiTPw1ji?=
 =?us-ascii?Q?Fs6ZqK9gEIcSjpF7qYDDp45QDR4fHarFwr4pmWGbxmnG/fPvXzknyNrcW3ZR?=
 =?us-ascii?Q?hi3o8EXFK0CmBAYUTl8u9xuDdnKHXjSaLTWIV7nn1nlwsaoM9YsNDI/EINAN?=
 =?us-ascii?Q?m1koX0HLgum+bmVDW5ALkD2wd3KV/MCmFV3I8gvSIGaOfHJrZCPAu6bjkDli?=
 =?us-ascii?Q?/yWhxztlcvm7QoKoLJSFPCUZMQurJdzo1K6CnScu4FvmkmuYMdL8/U1WJAeH?=
 =?us-ascii?Q?Bj9UZJjhUjZIOIb7QPCXlz6UdZ1UaM2cfkX/yGzebFrDEShFvink5e0GUl3v?=
 =?us-ascii?Q?Shuk3Ktr9CIUTs/aJfdLiWX8urEfbQ9sQX97E2fEzlOzcU26sOwG4ubPUl2K?=
 =?us-ascii?Q?K6RjGlEOaFtt+68bb2LJz4FvPdnGOPhliv3yiGZvlB/KPcy2hdBT8TQBDK33?=
 =?us-ascii?Q?fVlnjQtJXRf2lEeR1WuoaXT9NJHTBs3PNtLLvXy//30YOueH41lCMM3J/CnY?=
 =?us-ascii?Q?HhD/y0r9wrptCdXas+rVUvTph37EUGAEKohwROsNoWlwr4CUh/o46Im0z2YH?=
 =?us-ascii?Q?XxKzhpI1839aMovS3xX8WQbVCBQaCXE0RH/tOn6mhyAPzOsNJD9Rgkyk8Iaw?=
 =?us-ascii?Q?SOTpCnwzxi6xi+sJPpF0sNs8oTrW6tzV1Meu0ugoiAjU5q/qeYaTyS1LSfkV?=
 =?us-ascii?Q?LVeaVDdWxwP+lJcdMmw1w64X86q5h97U/xAamO3PqCfgi1fwtanH+txkEF4j?=
 =?us-ascii?Q?YXfeZY+8DC3SlXsmDu3Fk1s0U1tOq9MRw6mx2Llbo5/r+PYq4PXPT9VN/+RV?=
 =?us-ascii?Q?oknhbZtbTC8VWAUGl6A6APW+fVU9oHJJ6tDv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BYxVc7MHCMCeA+vV+v4pipnVQ4viDGuDeYtammZ9JF7Y0d548PGMHvyytYYw?=
 =?us-ascii?Q?rN3jBIQjfup4LuFcgT5ZIgSG7EH9KxcupRVkryZKSVytX562m05ayijce//x?=
 =?us-ascii?Q?+imtFAUluunmsBHxIpquNZgpy/8sXPeWYGClTHPMUz3eFcqr/U5/PRAP58Z5?=
 =?us-ascii?Q?bvDCphn4JYBPT4BlmhFw72Si13bJwkNc1fA0kNVfdPXl967NLYik1+z2M9tg?=
 =?us-ascii?Q?UM8utUWdEOyfsveTz5GPVcqAgiTfWt6u8CdWouncQza+DvmQsw6PfqcvRVCv?=
 =?us-ascii?Q?uBGWedkzPZ6wmGvufgu9jeplg8p79PpbbMjfavOTYtWeSv4ZLfFro40XD+aI?=
 =?us-ascii?Q?6CR2nLv2RrWZGGcIEWM8Ny7pvRfkBhBEpMlV20SF07jt52H5tSnSPryR8PMI?=
 =?us-ascii?Q?BTLKInjj3DwVWUusbFVe/SVvCUGCdJM2Zig6eq1Yn+vtp5+ntPk++j3EtD+I?=
 =?us-ascii?Q?vcACmYo7oA9tWkr6MhJTHKXzNiHD0fpeyxKiWtY6yzkdcXhNH1fI9kXwameB?=
 =?us-ascii?Q?hmUTiZeKRl9CG3vfHjOK3dK2zm8sWf7zdYDHa2FYitjL8jOoOnn1q7RI0Kzj?=
 =?us-ascii?Q?0njkKE6563MuRSBxcbibFmBkkagB9B48BR+dnYaL0SOGkkJhYNlSo5ks2zLX?=
 =?us-ascii?Q?46rd0xLiUyZP9PcsiY7VPcC59BF2eU5WK1GMeHFq6jRpF73so0LqT2q8VQbV?=
 =?us-ascii?Q?rmyxZDxbB4aV17xrlKtYwLtCD8m3QdnMw1312kMuntzwxfldlHAgFyRQ+Dcx?=
 =?us-ascii?Q?qhpyohT8nWnhEXl7kORre5BF/w4vNRpPC4evIsyhkj/EDVod6jE0Qdro4PFU?=
 =?us-ascii?Q?MzB0Upr1rHS0Sosfx+ahAbqj27MtNCxoB8oh83jN9Nx/ykrPQe5J1TUi4+8X?=
 =?us-ascii?Q?FsXErHVQhNQ/EXhCYzS/JbEgbObJqqi8Wyv4SLTzMKh3vfZMIhrUipuXCJy9?=
 =?us-ascii?Q?oIkZ709S+HsvbOW2//6j05zyJladD/QJJ26apYu97yPK2aykNEE26iiqdUEO?=
 =?us-ascii?Q?mgFnaLLprDurQ70hovxG+mTM+UDgfOulqWkauRlIJPhodg3uv94Dxn7GdY2P?=
 =?us-ascii?Q?AgZI4YrUO/A2t7P/1nONBRwpzkpZzmRZemNpjYaZjhiN2K7BRQfHDYB6n4mz?=
 =?us-ascii?Q?Uk0fC+Q2Kq5aMh+53niKbtfOqf3/Ps8sVUzHYL1YETywl+zexT6Bm2YTn9Qf?=
 =?us-ascii?Q?Etr5alxY0iuKY3WsbFKQ+zKPpB1OrJ48HsEvLOe3a56vkwsBznZ3/lEyMjYL?=
 =?us-ascii?Q?dO5yZ+pvS5mXMPuyWBG1w6582GF1sPGEVO3dA8sNxaU6O2A0aNvOM5RfY2Cv?=
 =?us-ascii?Q?D0b3977ySKRBP95GYLU1ZAwJd8JtDBV4BkYlQeKJegSb7YPOGHdvHBbW2vdc?=
 =?us-ascii?Q?wD3usz1j1OEjWGSa18X76Z8Djfaj1nkYlkvCIaduCyGjdX+o5nyW9sOG9Vuk?=
 =?us-ascii?Q?I88ZMhHtg+cwfoD47JYvi5cKUcgfzsv4S/FgEp9tGROwFLAwTQaCvNBYLagr?=
 =?us-ascii?Q?ANjJmZjYg5U/2LvrIvH6x64d+K41v1Zwwox1iXHxCDQhY5O5Wh8CNZXRMSZL?=
 =?us-ascii?Q?FnCzke5sLjYVXhwZ88tFtVhyz1tk9jwwZCTUYEABSH6czZUIB/Qobr/NHJTF?=
 =?us-ascii?Q?zRhQzU1ZtywMwrRWZJyjwKQ=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dac45d4-7c08-4d1d-f6df-08de2cf583be
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 14:10:12.5523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SGVBQy14WwbjwXAHfPIRZkHtkzWbQfdVJbqRQguoOrzaeiltWrrl9OTYij3yTxOe/AwuvYXZcelBHAWqBCUe+qBD3TaX28w9wf9LazFLJ6U254cIldzKJxRmP1wjspyk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6804
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

Add MIPI DSI support for the Renesas RZ/G3E SoC.

RZ/V2H(P) and RZ/G3E share identical PLLDSI divider constraints from the
DSI PHY perspective, so both can reuse the existing
rzv2h_plldsi_div_limits structure. However, at the CPG level the limits
differ:

 - PLLDSI0 limits apply when vclk1 is used.
 - PLLDSI1 limits apply when vclk2 is used.

To support this introduce rzg3e_plldsis_limits for RZ/G3E SoC.

During rzv2h_dphy_mode_clk_check(), the appropriate limits are selected
dynamically based on vclk_idx, which reflects the currently selected
vclk.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 33 ++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 59125460cf57..f37c081f7642 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -590,7 +590,7 @@ static unsigned int rzv2h_dphy_mode_clk_check(struct rzg2l_mipi_dsi *dsi,
 	mode_freq_hz = mul_u32_u32(mode_freq, KILO);
 	mode_freq_millihz = mode_freq_hz * MILLI;
 	parameters_found =
-		rzv2h_get_pll_divs_pars(dsi->info->cpg_plldsi.limits[0],
+		rzv2h_get_pll_divs_pars(dsi->info->cpg_plldsi.limits[dsi->vclk_idx],
 					&cpg_dsi_parameters,
 					dsi->info->cpg_plldsi.table,
 					dsi->info->cpg_plldsi.table_size,
@@ -1535,6 +1535,36 @@ static void rzg2l_mipi_dsi_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
+RZG3E_CPG_PLL_DSI0_LIMITS(rzg3e_cpg_pll_dsi0_limits);
+RZG3E_CPG_PLL_DSI1_LIMITS(rzg3e_cpg_pll_dsi1_limits);
+
+static const struct rzv2h_pll_limits *rzg3e_plldsis_limits[] = {
+	&rzg3e_cpg_pll_dsi0_limits,
+	&rzg3e_cpg_pll_dsi1_limits,
+};
+
+static const u8 rzg3e_cpg_div_table[] = {
+	2, 4, 6, 8, 10, 12, 14, 16,
+};
+
+static struct rzg2l_mipi_dsi_hw_info rzg3e_mipi_dsi_info = {
+	.dphy_init = rzv2h_mipi_dsi_dphy_init,
+	.dphy_startup_late_init = rzv2h_mipi_dsi_dphy_startup_late_init,
+	.dphy_exit = rzv2h_mipi_dsi_dphy_exit,
+	.dphy_mode_clk_check = rzv2h_dphy_mode_clk_check,
+	.dphy_conf_clks = rzv2h_dphy_conf_clks,
+	.cpg_plldsi.limits = rzg3e_plldsis_limits,
+	.cpg_plldsi.table = rzg3e_cpg_div_table,
+	.cpg_plldsi.table_size = ARRAY_SIZE(rzg3e_cpg_div_table),
+	.phy_reg_offset = 0x10000,
+	.link_reg_offset = 0,
+	.min_dclk = 5440,
+	.max_dclk = 187500,
+	.out_port = 2,
+	.features = RZ_MIPI_DSI_FEATURE_16BPP |
+		    RZ_MIPI_DSI_FEATURE_GPO0R,
+};
+
 RZV2H_CPG_PLL_DSI_LIMITS(rzv2h_cpg_pll_dsi_limits);
 
 static const struct rzv2h_pll_limits *rzv2h_plldsi_limits[] = {
@@ -1573,6 +1603,7 @@ static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 };
 
 static const struct of_device_id rzg2l_mipi_dsi_of_table[] = {
+	{ .compatible = "renesas,r9a09g047-mipi-dsi", .data = &rzg3e_mipi_dsi_info, },
 	{ .compatible = "renesas,r9a09g057-mipi-dsi", .data = &rzv2h_mipi_dsi_info, },
 	{ .compatible = "renesas,rzg2l-mipi-dsi", .data = &rzg2l_mipi_dsi_info, },
 	{ /* sentinel */ }
-- 
2.43.0

