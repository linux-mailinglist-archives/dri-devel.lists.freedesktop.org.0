Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A733BC8A2A5
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:09:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC6B210E623;
	Wed, 26 Nov 2025 14:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="V8oTayID";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010049.outbound.protection.outlook.com [52.101.228.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17DCD10E610
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 14:09:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ja4X1faGuQjUd50oChJXJAAocTgAnCq9vps8fNHp3cjVbnvA/Ov2QhwOJJ+skTNXsgtzFFQDe184a8Ob4cNTRAMid73+PJ1yY2si0jXhM4FqtmkReo12f1/OIbYWiftjmjvW4+Lj7G71XQg6BXHMBhvwBHNLLByj1esawX/qLYGsns7fOU6FeXjHtGFxIm/AgR+Q/DJtk9p33/u7vdjc27m3PJR5V6TVlD7LRPpGNTDnkVu1Fus6AUOz+EkmkKHmku0aeWDD3ydYrzxzNYDXaW7WoZwOjdrhVeQ3Ig6iGaNBjkspYIdKpujguhyEmHVWm8puYAOiG6rjnbeMUe17pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x2Olw202oWwBzQ4Lrx5vZykMT4ctFC/WZrIukJxaWeQ=;
 b=efOII/pTl8XmkSO+bEBfHdfr7alOm5z6VH2xdC0j9xrEFuOJ1YtmmbOJOkbwWRIKesWbzfmmftxf3du7pxTMD/e/SkmgwKVAIVK2GzAe5etqCZ3zNZ2rW9LvdHNViBdEhX8h/hTdEbSfe+tfldQWF1Fmd6OyBbsblFbrpdjOxYhK2Wr9ABnvob88EA9XYYSZsJyZpNhiLTWolYeiJI0ys9mFsRBvnb+5VzJ0j9ImaBt000w3tWff3P/BMjyvtFL7L6RI/F5kEIbfZyA9upWJg0HKf65N1w7cRshCCXfofn9bvt8S97SzlhHOG2Fv6rHXWypSCX2WBAOgFaUpSgGZGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x2Olw202oWwBzQ4Lrx5vZykMT4ctFC/WZrIukJxaWeQ=;
 b=V8oTayID+zIKs5POYAPlMNyLTPZbhQVHxf7wsqxSlpc812T6vD0lgwseilloCXaASVhs6OFojBDE3I8EjxHKYe056JuTRu4NaK4X+4U6/EiPUqN0Vy0GsR0AMfuHZsvq3Oa3IFwSN97d/2Omti9w3gASv+768TAC1+vr3XYFBBU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB6804.jpnprd01.prod.outlook.com (2603:1096:400:b3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 14:09:02 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 14:09:02 +0000
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
Subject: [PATCH 05/22] clk: renesas: r9a09g047: Add CLK_PLLDSI{0,
 1}_CSDIV clocks
Date: Wed, 26 Nov 2025 15:07:17 +0100
Message-ID: <f7130b18f20fe80f4187cf0b024dc10438f2820e.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: ba183604-8d38-4c9b-3a46-08de2cf559b7
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1NsvJX9npiif2Ql17y0pQwLsHThiUOm1xxC+QFgDZ7ZRzUbp4Za6w51/8fPk?=
 =?us-ascii?Q?UpIS9hRi8Xb9m8cQSu+3JiURLbQ2muLEHLwY13o2CB1J6xM4ibHAsIST3TPZ?=
 =?us-ascii?Q?YQFiaNl3Uq9MLBMQ7ONntdVJzKbKCw3sz0yAnQNt8tkTQLiL0AEHpFtjbZ8o?=
 =?us-ascii?Q?98bYw4WplVL1Vtw9JEA/QyzomEc/onFCE6t01oZIiU8UbjD2r32rcU+O0tWQ?=
 =?us-ascii?Q?0kKGDlsWYodUOVDnf4w8/xh2Pe2wnMsGQV4rUPrSHKduPV0gLKnpSJuRu3sF?=
 =?us-ascii?Q?2bRcQmRZ9h9qcRF/HCWtKz5b00xiqI0Mek95+QfjP0mVDce5gIe/mzAIh9cv?=
 =?us-ascii?Q?Xng4DAq7qOVMfxuQHuiGI/OW/nnBe230QxBwH8qs43oQElkO571V4V7RLKrv?=
 =?us-ascii?Q?TFdCCIMYx+EZiQIr5bDxv/f3Ymgju+E+12lWZACKToxo/qYLsJ7jJ3YlM14w?=
 =?us-ascii?Q?p5gEjQwJMwL0pC4LS3cYrWMZdDmKm6IqXexSO9Q8wmPgU7m6y4qJWpSF1lnU?=
 =?us-ascii?Q?VaFG2uGA5oApOYBlww/z2Fam75NVyCuk1U+HVJqgYJS5GhzBcVhEwkwfZJbk?=
 =?us-ascii?Q?N4hmG+GiWtRpzb5v2g4RaQBSJikL6r7TH4OWznHmqcOhVAMucrLUSs5A9C2R?=
 =?us-ascii?Q?QMqSBOCZFahAjwfb8B8+qkcHA9qAeL8Zx/PRnw8/J5sWtyNve1EalEL0ArU/?=
 =?us-ascii?Q?2RWdJ1td+kJ3fZ+T1kbxQiCg9IQ3Skp+75Fq1BJ2Db8Q4/c5Ptf7FcF+Db1n?=
 =?us-ascii?Q?waMmqugwefh/FdWUa8ubr1C28ZVfciCmW1i5hzgvkiM9+IxX0HbLiA4l+ZDU?=
 =?us-ascii?Q?WUuA/iMx8TkUZYE2K/l/R2ymvj9vu5Z0+WYYjazw5cO+wei3XYomiFDxuUQ+?=
 =?us-ascii?Q?s8lc8XRHuKDRAUYq+BU320MPtXwFLEsKr88KZHeBShwK7qJhUMniF0ayQu6L?=
 =?us-ascii?Q?AQl3ZE8XsiSS/nup0xcZV0Ioy+O02FhpGGP/hf00bFUs/YLXvlD1sHUnmi/D?=
 =?us-ascii?Q?6C57wfTh67MaA13Pq/8ljwSzYY/fVnieEFZsuDQuyV9Xa1sHq6ad4uM0Y1tt?=
 =?us-ascii?Q?etdX+d/lNhKXs7y5Mg5ZWCEVjzht5MRPOE2Es5yGDPPl0TlFfYJsUT2PwTy9?=
 =?us-ascii?Q?uygoIEh6cQGF1GUvzkkPmFkfGzUBVh2FTViiM5d/olBiW7l5ZMA6yUKLnxzz?=
 =?us-ascii?Q?FDsqGgrHBx5hBKUOUJ42jBxgSpe0aO+gJqkoN4QDMerqKE0ZUs1qH15HH8+s?=
 =?us-ascii?Q?fKMM3LiOvMrXe787MMWaoJHRp78fre5i/MxA8cmcF4/+js8tHu/opEDl8fB2?=
 =?us-ascii?Q?Ieh+z6rkoWWOPtnkmz4M6konWz6MilzBOyQNQQQOkG5tT9YQMGV4Umt9TerE?=
 =?us-ascii?Q?dNtZST9Vc/EStG06JU6XrbHzbXk4LOEEnEzm8LmeBy8c6HmS+1PDjZaVvPfG?=
 =?us-ascii?Q?9Z67tjWoCjqorsnM0g7vuzP6/ab8guzl4yAGtmL18ubeI3AqjfsS7WnA2u5H?=
 =?us-ascii?Q?h8jhS9ynXeAuGMGqvt1rww5//1trz3lgX1zB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v4i/bTfZj9HlsuqLMCI2tjpyDH0dM5RLPdSnjqOSWoRVO/yUvRrnsTswfbvK?=
 =?us-ascii?Q?yGz9Tzb3y6/WeqXYDxiAw/2+cTdmajElEKjccwm/eyTcjE9RJOFNHJZTMF98?=
 =?us-ascii?Q?1i3OQoN497vy3OW8VSFNQGl68tRYQg2zjPEethhmZGcZl8281RxjTvEi1+zN?=
 =?us-ascii?Q?8AfsHFJqC/gb61j0/n9zk8laIoqi3rrlvawb+zfjqv5U46CDWQfEGVAqPhAO?=
 =?us-ascii?Q?hYT/V8q67Fg7ST0pE7DmRBH/r2znG/4rSX4VZ9k0qEDEbWa6sytM3chOTeIm?=
 =?us-ascii?Q?j2+YLyKFj8GVSTzZhps3IsYQ2P2JBaw+A+XY4k3BqCcNeRq5LmKI2tztk8Qy?=
 =?us-ascii?Q?6KHovpKea/n6r1o7TulbIxKyBsYvfanfK0sw4RC5u11Upp2xiwPuQiF/H886?=
 =?us-ascii?Q?/NWJ/jYFdY6LdHCeS0cH7QQq/G5/6QACSEj6OoLRW09rScAdM9ZNGbFSq4TS?=
 =?us-ascii?Q?APMG3EsEDz21IOdzWPpKIN585kftO4JtafbVWqm5rr3LR1WHywQqVPuDIEtT?=
 =?us-ascii?Q?DQYZ+USCdeITwl+8e+XJT+BGKmtelMgjcAfZon1gUsjXaG/ksQlGlY5xA5gd?=
 =?us-ascii?Q?RxULSuSIlFspvy/qPWTIhpoGZsam+KjOtTIx22vR9cbmH/wET5gKwJuL5C2A?=
 =?us-ascii?Q?lzu1ClB5EqrGG42yPGj3KSRvl5kPAioeY1/h9fuzi+bTelScbsh2gfVX2NZs?=
 =?us-ascii?Q?waPm+TTGoFKcNh3d3Bj7lhWVV4M/erfgO7B9OStq0io/6eQRQB3ch+KJ28wO?=
 =?us-ascii?Q?0aLkSCGWKcSOYxVbvcgZgGSi+2Xwl3T2EQPSSTluLJKOhYNMeG4kFpxjMsqm?=
 =?us-ascii?Q?du3NINC8sB9/iPWhk9g3VmN/OjinU+ncaiwzblWfBONsNJEmAn+DzI0sGRra?=
 =?us-ascii?Q?0W9EkGqCdGAHqLUwfwVynvzTcYW//GcU0o1lpvf8YaT+Pw2HLdiaGr26LruB?=
 =?us-ascii?Q?BfFQHanNljVHO2dAtKDdvKfw7vJ6cQfQk9w6dwW5OGCT8PKwT3wPhq3OhMcZ?=
 =?us-ascii?Q?rXPk8F47Eecw8Vn0faR3G9NM6RdA6zC2LuV/mSUPsav65ikX5SmfhOtA2XUG?=
 =?us-ascii?Q?g/04gYz0OlmCuVRKArRl9UCEhUeDSeoXsud2cpQ8xLUPfORuLijCM6FWZaBy?=
 =?us-ascii?Q?31OKAP86tERtF672tAr1uWvbdV7q4OEntz7rI6I0XhcGPLbr5mp3ondN4pDX?=
 =?us-ascii?Q?HDTBw2uWqtsoJ0phCLdc9dgYuGyc892x09R+T9n1hrKp6R5zxNW3fmToH+/J?=
 =?us-ascii?Q?95BYSuAXa3ihRwu4d61P2I+QSQ7EVKSJUwwWgCunrEdIz9XgsiLVM4joQtom?=
 =?us-ascii?Q?hAr/q9tSKlbTsulivOWpI12SDmnwMiPhPwrwD5FvEBbE4Iy+T1aI2fdOw1LY?=
 =?us-ascii?Q?M5ySFhS85hJt5lGEARaJyB08QlAhhvjnRNj+WiK7+0WCyUN9RAU9D7LB+Pfu?=
 =?us-ascii?Q?WfIJjEs4sonqUsBeT0SABE1oeEkLJYlwnVlH20hFTS/KC5ZN48BWMqNTAk1o?=
 =?us-ascii?Q?iR/gaIDqsDmshqTKGUQJzK1Ovm7kHElH9Hp4hLoiVtLQ7ibtT9/aFMrPOwBQ?=
 =?us-ascii?Q?g9BIeZ1bfSo7irQK4h6tE8ua9xERUz4l3eAWOSMdasl2ouxuGAmEvewTdV6R?=
 =?us-ascii?Q?WJB7C18rRSuEdMcfdPYX4OY=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba183604-8d38-4c9b-3a46-08de2cf559b7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 14:09:02.0735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jJhIWjs7dbAPnl9ffeGUs5elmgD5U8YQhp5u8qxV/40ZIv9zxLJ46z893028urVvKCK8tg/Qzwjem+00ArqQh1NdS2IXMSMbLpMTHhkVH8AOD9m98tlcQve31Z2Hl6to
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

Add the CLK_PLLDSI0_CSDIV and CLK_PLLDSI1_CSDIV fixed-factor clocks to
the r9a09g047 SoC clock driver.

These clocks are required to enable DSI and RGB output support.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g047-cpg.c | 18 ++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h     |  1 +
 2 files changed, 19 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index 0e707391283f..aa6528b72cef 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -71,6 +71,8 @@ enum clk_ids {
 	CLK_PLLETH_LPCLK,
 	CLK_PLLDSI0_DIV7,
 	CLK_PLLDSI1_DIV7,
+	CLK_PLLDSI0_CSDIV,
+	CLK_PLLDSI1_CSDIV,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -98,6 +100,18 @@ static const struct clk_div_table dtable_2_16[] = {
 	{0, 0},
 };
 
+static const struct clk_div_table dtable_2_16_plldsi[] = {
+	{0, 2},
+	{1, 4},
+	{2, 6},
+	{3, 8},
+	{4, 10},
+	{5, 12},
+	{6, 14},
+	{7, 16},
+	{0, 0},
+};
+
 static const struct clk_div_table dtable_2_64[] = {
 	{0, 2},
 	{1, 4},
@@ -198,6 +212,10 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 	DEF_CSDIV(".plleth_lpclk", CLK_PLLETH_LPCLK, CLK_PLLETH_DIV4_LPCLK,
 		  CSDIV0_DIVCTL2, dtable_16_128),
 
+	DEF_PLLDSI_DIV(".plldsi0_csdiv", CLK_PLLDSI0_CSDIV, CLK_PLLDSI0,
+		       CSDIV1_DIVCTL2, dtable_2_16_plldsi),
+	DEF_PLLDSI_DIV(".plldsi1_csdiv", CLK_PLLDSI1_CSDIV, CLK_PLLDSI1,
+		       CSDIV1_DIVCTL3, dtable_2_16_plldsi),
 	DEF_FIXED(".plldsi0_div7", CLK_PLLDSI0_DIV7, CLK_PLLDSI0, 1, 7),
 	DEF_FIXED(".plldsi1_div7", CLK_PLLDSI1_DIV7, CLK_PLLDSI1, 1, 7),
 
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 5f6e775612e7..af881ff98b31 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -148,6 +148,7 @@ struct fixed_mod_conf {
 #define CSDIV0_DIVCTL2	DDIV_PACK(CPG_CSDIV0, 8, 2, CSDIV_NO_MON)
 #define CSDIV0_DIVCTL3	DDIV_PACK_NO_RMW(CPG_CSDIV0, 12, 2, CSDIV_NO_MON)
 #define CSDIV1_DIVCTL2	DDIV_PACK(CPG_CSDIV1, 8, 4, CSDIV_NO_MON)
+#define CSDIV1_DIVCTL3	DDIV_PACK(CPG_CSDIV1, 12, 4, CSDIV_NO_MON)
 
 #define SSEL0_SELCTL2	SMUX_PACK(CPG_SSEL0, 8, 1)
 #define SSEL0_SELCTL3	SMUX_PACK(CPG_SSEL0, 12, 1)
-- 
2.43.0

