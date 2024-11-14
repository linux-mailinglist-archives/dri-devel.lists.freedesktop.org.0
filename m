Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 857519C8378
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 07:58:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E4E10E7A4;
	Thu, 14 Nov 2024 06:58:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="HDKNROPT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2075.outbound.protection.outlook.com [40.107.22.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B9D10E7A4
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 06:58:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VVng/VFXovRW7fRR+Oo+ijBBb/flLaOlCGs07u8KvhoO2z6U6+XOyDkl+5+a0W834Fuf4YKhV+sv2PwI73XSYkFTeq4++YxfIkuSxP1hfwO++4GwEflM64odkkBQV6vjTxzA8S+3GdPJCivsiuEklYGxQd3tQrZ/QA1Sa6nKrKhLQj/DUhpacjmZNXU/UIxqKKPdzI8RpnwIrLe/AfHQQoiNToJMDftE3F+czgIkNrPUi0p6y8Z5eTEOWgikwtTESfSTY5+ozVcliTfOCSEL6i95y1nYl6bEwApqXm7bLYcFSxXtQD9Fz75RwAVOGioEr23gZ5eJtDdkgJ90rSHzqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQZlTSOnck7v/jliz5eiEp/DzHQdtT+j8KFoxuJa2kE=;
 b=xSzvXsfDIu3TlZKTeBHy37PsfhBmvDjC0oM5uzgFT7Xjs0NEzF67yV4ZxIlnYFRmW5lhS6OzeTzC5p0F+Dj1q2lo+M77yIBmUut41mF5UZp7bAAoY+G1EdHu7/XpDbF6t+E4qfqZaUOY8gu21LLLZK8BbjJGiu8s5a2xy1cUHZLnN7jv4C4CX0/WWsleH0QQqCNHsBn1VDhWzIgfj61jIs7nTQ1xYguOJGrpk3y2Ppv7rLILCWcD7qYM4EMz3WO3k4EI11B/+gqEt8mhi5PwB9b2Ul5JmO19HWAQroVNbw20TzhLBcZymu3W2msRuVQnBWSKwv2M9ROoX9hmOcTukg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQZlTSOnck7v/jliz5eiEp/DzHQdtT+j8KFoxuJa2kE=;
 b=HDKNROPTd0Z0cadHECEGUoJGC2lGXEt6ecBTFTCVcAMA3ue65WPGWlGp9t+5gBK3OCZOYkarpW8cgAdOMak/I2RDk3JfYyOmLD9cSYK7Uep8NliO1oqPpJufQrAZ2LKqBACKguFunOvbfbr2Z4EA0QcZDIMIrzuzY2DKi4bXAXtWxsJTASNrMaVSWStXlUPEvXTjB3oBdXkQGnTKAAjPKfLzvzPCcCk8GWtKY+8ga8l8tn+nA57V1nqQK606vbTGk1Qi5sCL3eFd4E594srtDlgJdBjizTqA0PRlKt/+S64E1VCFssmSDznxkv0Sk4tQ01OeZP5EH+dBFbv489U66A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA2PR04MB10278.eurprd04.prod.outlook.com (2603:10a6:102:408::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 06:58:43 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8137.027; Thu, 14 Nov 2024
 06:58:43 +0000
From: Liu Ying <victor.liu@nxp.com>
To: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
 sboyd@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 marex@denx.de
Subject: [PATCH v7 5/7] drm/bridge: fsl-ldb: Use clk_round_rate() to validate
 "pix" clock rate
Date: Thu, 14 Nov 2024 14:57:57 +0800
Message-Id: <20241114065759.3341908-6-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114065759.3341908-1-victor.liu@nxp.com>
References: <20241114065759.3341908-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0048.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::17)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA2PR04MB10278:EE_
X-MS-Office365-Filtering-Correlation-Id: ad99850b-4a72-49e9-65ad-08dd0479c6bd
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xeFhgQ4PynevnX3vm4bnjNFLfeU2g+7yXM0ZVULQHMFnL/9cKWHfv0xzecwP?=
 =?us-ascii?Q?WBvzVOkEV6vsj+yn6CHcszEN8qQN6LSYgXD2NUgvbJvBIhos9hpT9PI1/tKB?=
 =?us-ascii?Q?RO38JnmymfGHH4+jw8lg7A7eU8e3rQbsfjAS4LYo/MEyugcuFwdiNvtwS7iE?=
 =?us-ascii?Q?oIlwFcuCvT8Dgj5s32F3It7T9r4AyOjrNBx+KYtMMK3ReG6sumx8xdttqesq?=
 =?us-ascii?Q?lzy7MChqDy9x/+LIpGtiTROf+PyGiy0MBb41cZgxlSafgWrvxwV1wfGwp4+L?=
 =?us-ascii?Q?pbGtvaEAt9j+5Lve6XXgfYCv6a21kfs4Ej57E//hWy9yFJjzU0riy7KCtVvJ?=
 =?us-ascii?Q?Y8u2OCfYcEgHBQbsbREh6Ul8BEdSWdnwE/NTqZaJT2e66CQsC2L841XOalc1?=
 =?us-ascii?Q?CsSJRy/8QxNAoyYdfqh3DNexkUupUgcKO2LhSJbGkCy016Sx/gPQg/BvDdB7?=
 =?us-ascii?Q?PIW1fDtaZ+RM01JgsRzraI9QqGwm7PC+sn6HUSsFz9YvUEAsXN1m53s2Exaz?=
 =?us-ascii?Q?s5Wv5wliRJkBYzpjB2jZLGrQMjZ2/BwVsiCx3c2wlGqldOMf0c0O9Q+5rmCQ?=
 =?us-ascii?Q?frHo18M4tXcAT8nDLuuZFaXqhJ0xIlfLJQAgU8qkC0xTILAktRWddLvljDkC?=
 =?us-ascii?Q?u71bvWDqXLGAl9DmVZSyN9pH7OTeCUmhrXQC4RTeCVqJMtvmGhlFcOUotTfX?=
 =?us-ascii?Q?fNzdreCc1aeBTgDOF4AxZq8AoA35KKM/GGOO1UameJI+2jSAwxSTBqSAmmoQ?=
 =?us-ascii?Q?8lpxNpKdX57WI0KenQN2v65pZdE++1hlq7zTaPFYldVJ1Z97lA0Zf11wb3Ma?=
 =?us-ascii?Q?AUGKdKMcqcV39c4CuukYOYVs+IaS95s74yN2pFqzjkCQVYBA0ogZ+5tdmyXi?=
 =?us-ascii?Q?AvgZnvE0+2ztodfnVH+lrxIZ8E/A2rJ2Xb7Um9Zy52xb5zJCZxxOHxA5rl0Z?=
 =?us-ascii?Q?44FqTJq3zfNVpms4c/50obUpSpBk3ynXHYsNQc+042eUUNzgCzrP9NiU7zF1?=
 =?us-ascii?Q?KXuMhtaUzHFlTcz3DjN7wQ9UG75qVKT4HzIJnoEgg0TfYDPaOEJx/vwftxK6?=
 =?us-ascii?Q?4SpggW/0QtoelUNqZo+A/uUlYR5flfgfnfQuiAngh1r4d/EKc+BOVMkZ0MbC?=
 =?us-ascii?Q?JIbi8Jcz8/WFuaveT1Jybolb1jTiAV9aFW0j5ki33XZkq84xSa0pTfGwgRCM?=
 =?us-ascii?Q?YP/HTaHlAtVbb3Mnse297yuDkyb3xv74YFyUfnqNQoKxe2HZLp8fa7y7yUWM?=
 =?us-ascii?Q?IpngpJUhkmXA3IR5Fw91p813e3JPMWvPUDLoBYo5q6p+XTQx7WyW2eXq0NFs?=
 =?us-ascii?Q?iQjn8G2KtKP9p93S5cK+KlfrMKbDuP6tmno6NqsmBB0JacHBqUcopTCuaTkF?=
 =?us-ascii?Q?nMCkgqfK/lxIwGOs9MGfwB/+eDoC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VFqWt3C3GiMwn0ienLzXw+WIm/jth3sm6Zkj6QwY6hoZ+VNFyamGnz3FZJPG?=
 =?us-ascii?Q?Q5D1svZ2aYqpAFf/R/VIxKmKRThSAcqd/82a1d+d3VOiL5DE+YyDvp3gSxg/?=
 =?us-ascii?Q?J0HuaJ0Ltk+l3LFYkzeTHeer2MayjZCtAc04A38czXBxOcchQ+F/pedexaK0?=
 =?us-ascii?Q?9Vn0bpqUowkoGkNoiUYa0H2eqkwHOTLv0323JDmdwhxl3LmDWinkvglxl4Sr?=
 =?us-ascii?Q?ORYM37BBpy7BWVKez3F/3LmT87gwIwn5sSisxP6oOc15Ofi4VJ7t5IVQ5xfs?=
 =?us-ascii?Q?/P7bfvEv6BCpqxmgwhIODQQe457T1dm/E6E8bg5BljfqucJ8So1SVhFVkLrU?=
 =?us-ascii?Q?pujY120p6spEWr+r5pyFAxEpNxyShaka5mICuwZdmQU9j69ARfx5MmS2MIX/?=
 =?us-ascii?Q?FmG5isVqiATHQJVMjrhA1DQOJHiF58VtMWMDRpnlho+uHYaSAEhjE+ChOV8d?=
 =?us-ascii?Q?Lord6V80Qke5fEgtpkmypkZMYU++797uh1QxmDFKaW5uJkaRPbXTI+YJ3Kl1?=
 =?us-ascii?Q?0uBZ+gn3tXqjLj6/+vLLrN+eDCjz/aY/Xa/t7raXfAPtaDsObzAC6ZVEC7+P?=
 =?us-ascii?Q?lW2xTUAM9S2laU2yzbBYbTBwiSZhx7qf24qkap3Mct1BRyHhnl3Y5ZAXBJLc?=
 =?us-ascii?Q?E6JK/3VbBLH+GNAXAOY3JJb7Rl+C/O9QD0xkUIItISeBjc7P+DdYoLunCKTH?=
 =?us-ascii?Q?VEJ55YvxYZAa6hm3gSTpJV3QwM3fQPKLxeI1GbTppGaOK4iIT83C8M6HfITU?=
 =?us-ascii?Q?uAT+s7+nzsPPZLMOs4PfzC6sYMLBSLBBafXt7k5M5oOyOi5/S9oMmp6WILnn?=
 =?us-ascii?Q?96Tago5SbyA+FXDIokE7sMU4NEU3se+X13oltNFT6K2AUclmzuayo9g3gv3C?=
 =?us-ascii?Q?fUljgik9Xlvf9s/Zwf26eTkYlqydEjjUaPBbnr0bCBRmKhr1x7ljFo15t0eg?=
 =?us-ascii?Q?imylkN3xnu9a4oV4rVtfAebdu4rTxHhHafgoGW/LsBmyNi037x7TRwb23uJO?=
 =?us-ascii?Q?+rsA1CROY58pig9nesoZWQfg9ttFDEsl3viybPBiyAfzI+xpFSeEaI0Fft6D?=
 =?us-ascii?Q?aRY2fCW8tO3Lvbkb5I6jDw7JGJVWzyvLgaElniVYn8YPrfVspDZv1xl/OtNX?=
 =?us-ascii?Q?LXZQKfdJ5jaBJwK+n1w3IpMCpnLW+rTmHZJ+JLT/RDcw9kr0Fo2t+QaGhny2?=
 =?us-ascii?Q?K7/esFTZ92hwe6+x3clPr63ODxgPY5U1QWHUoC5piaxBmK5Q8BoWfupY24wf?=
 =?us-ascii?Q?x6DasWbJPAR7AxUWtOhv6vj34xkMBoAUO4oBRphsyn6A2U9DBogO3Ak2D5X6?=
 =?us-ascii?Q?0wwzoO2ArisCSE5jdo/Y1n2FpdTBPlFv0Sed616FfUKFn8pyTpARpE0R/UXQ?=
 =?us-ascii?Q?vSJm6QEF/Zyk6NYIuck1BOzbuUPog87/h0Az0ehcs5WKDdcISs3PLJatb2uN?=
 =?us-ascii?Q?Va9EuyznhUD50kKtzUHAvNfLJqk1ljy4jUX7tsijU/CLPtlavyBktLXnmrxa?=
 =?us-ascii?Q?aevRoasGy/DIJHG/d/jqlCbDonAjuJiTla2KRp9xe5h8symBJ7UgOL1qXDCW?=
 =?us-ascii?Q?ndMbTlefzBN6bKao9FBICeLmIbuLTzeKYVYqARJj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad99850b-4a72-49e9-65ad-08dd0479c6bd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 06:58:43.1440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dne4Kxmm1d0adU1G7io9LLLFZLUkENIfXCsHMPdBJf9Qgpen5MNbli2reYLCimDIGIffKvxSorWSpRwMkdw9fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10278
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

Same to "ldb" clock rate validation, call clk_round_rate() to validate
"pix"(pixel clock) rate too.  This may filter modes out whose pixel
clock rates cannot be supported by the pixel clock tree.  For example,
when the pixel clock is derived from the i.MX8MP video_pll1_out clock
and video_pll1_out clock rate is 1.0395GHz, mode 720x576p@50Hz with
27MHz pixel clock rate will be filtered out in LDB split mode because
the PLL clock rate does satisfy the "ldb" clock rate(27MHz * 3.5 = 94.5MHz)
with 11 division ratio while it cannot satisfy the "pix" clock rate
with 38.5 division ratio(only integer division ratio is supported).

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Note that this patch depends on a patch in shawnguo/imx/fixes:
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20241017031146.157996-1-marex@denx.de/
Also, this patch depends on patch 2.

v7:
* Put pixel clock properly by adding a dev managed action in fsl_ldb_probe().

v6:
* New patch.

 drivers/gpu/drm/bridge/fsl-ldb.c | 53 +++++++++++++++++++++++++-------
 1 file changed, 42 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index d9436ff9ccc3..9afd91c30c88 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/device.h>
 #include <linux/media-bus-format.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
@@ -11,6 +12,7 @@
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/units.h>
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
@@ -86,7 +88,8 @@ struct fsl_ldb {
 	struct device *dev;
 	struct drm_bridge bridge;
 	struct drm_bridge *next_bridge;
-	struct clk *clk;
+	struct clk *clk_ldb;
+	struct clk *clk_pixel;
 	struct regmap *regmap;
 	const struct fsl_ldb_devdata *devdata;
 	bool ch0_enabled;
@@ -176,15 +179,15 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
 	mode = &crtc_state->adjusted_mode;
 
 	requested_link_freq = fsl_ldb_link_frequency(fsl_ldb, mode->clock);
-	clk_set_rate(fsl_ldb->clk, requested_link_freq);
+	clk_set_rate(fsl_ldb->clk_ldb, requested_link_freq);
 
-	configured_link_freq = clk_get_rate(fsl_ldb->clk);
+	configured_link_freq = clk_get_rate(fsl_ldb->clk_ldb);
 	if (configured_link_freq != requested_link_freq)
 		dev_warn(fsl_ldb->dev, "Configured LDB clock (%lu Hz) does not match requested LVDS clock: %lu Hz\n",
 			 configured_link_freq,
 			 requested_link_freq);
 
-	clk_prepare_enable(fsl_ldb->clk);
+	clk_prepare_enable(fsl_ldb->clk_ldb);
 
 	/* Program LDB_CTRL */
 	reg =	(fsl_ldb->ch0_enabled ? LDB_CTRL_CH0_ENABLE : 0) |
@@ -237,7 +240,7 @@ static void fsl_ldb_atomic_disable(struct drm_bridge *bridge,
 			regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl, 0);
 	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->ldb_ctrl, 0);
 
-	clk_disable_unprepare(fsl_ldb->clk);
+	clk_disable_unprepare(fsl_ldb->clk_ldb);
 }
 
 #define MAX_INPUT_SEL_FORMATS 1
@@ -269,15 +272,21 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
 		   const struct drm_display_info *info,
 		   const struct drm_display_mode *mode)
 {
+	unsigned long link_freq, pclk_rate, rounded_pclk_rate;
 	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
-	unsigned long link_freq;
 
 	if (mode->clock > (fsl_ldb_is_dual(fsl_ldb) ? 160000 : 80000))
 		return MODE_CLOCK_HIGH;
 
 	/* Validate "ldb" clock rate. */
 	link_freq = fsl_ldb_link_frequency(fsl_ldb, mode->clock);
-	if (link_freq != clk_round_rate(fsl_ldb->clk, link_freq))
+	if (link_freq != clk_round_rate(fsl_ldb->clk_ldb, link_freq))
+		return MODE_NOCLOCK;
+
+	/* Validate pixel clock rate. */
+	pclk_rate = mode->clock * HZ_PER_KHZ;
+	rounded_pclk_rate = clk_round_rate(fsl_ldb->clk_pixel, pclk_rate);
+	if (rounded_pclk_rate != pclk_rate)
 		return MODE_NOCLOCK;
 
 	return MODE_OK;
@@ -294,12 +303,20 @@ static const struct drm_bridge_funcs funcs = {
 	.mode_valid = fsl_ldb_mode_valid,
 };
 
+static void fsl_ldb_clk_pixel_put(void *data)
+{
+	struct fsl_ldb *fsl_ldb = data;
+
+	clk_put(fsl_ldb->clk_pixel);
+}
+
 static int fsl_ldb_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *remote1, *remote2;
+	struct device_node *remote0, *remote1, *remote2;
 	struct fsl_ldb *fsl_ldb;
 	int dual_link;
+	int ret;
 
 	fsl_ldb = devm_kzalloc(dev, sizeof(*fsl_ldb), GFP_KERNEL);
 	if (!fsl_ldb)
@@ -313,9 +330,23 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 	fsl_ldb->bridge.funcs = &funcs;
 	fsl_ldb->bridge.of_node = dev->of_node;
 
-	fsl_ldb->clk = devm_clk_get(dev, "ldb");
-	if (IS_ERR(fsl_ldb->clk))
-		return PTR_ERR(fsl_ldb->clk);
+	fsl_ldb->clk_ldb = devm_clk_get(dev, "ldb");
+	if (IS_ERR(fsl_ldb->clk_ldb))
+		return PTR_ERR(fsl_ldb->clk_ldb);
+
+	/* Get pixel clock from display controller's OF node. */
+	remote0 = of_graph_get_remote_node(dev->of_node, 0, 0);
+	fsl_ldb->clk_pixel = of_clk_get_by_name(remote0, "pix");
+	of_node_put(remote0);
+	if (IS_ERR(fsl_ldb->clk_pixel))
+		return PTR_ERR(fsl_ldb->clk_pixel);
+
+	ret = devm_add_action_or_reset(dev, fsl_ldb_clk_pixel_put, fsl_ldb);
+	if (ret) {
+		dev_err(dev, "Failed to add pixel clock put devm action: %d\n",
+			ret);
+		return ret;
+	}
 
 	fsl_ldb->regmap = syscon_node_to_regmap(dev->of_node->parent);
 	if (IS_ERR(fsl_ldb->regmap))
-- 
2.34.1

