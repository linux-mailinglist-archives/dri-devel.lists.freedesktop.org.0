Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15967C8A2BA
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:09:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6418A10E617;
	Wed, 26 Nov 2025 14:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ROaMly7b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010031.outbound.protection.outlook.com [52.101.229.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7FAE10E61B
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 14:09:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NudDnZ+ipmx2zOQiizhnVxySTbTd7DFr/LJff5AUKl/v2J3Z3uM10b3alyhxVuZ+uVK8BLUNwKT7g89KVN30YhDjy/q5Gn9qZjx5WyL6VbVqEN+YGkeAth76VG5DCutZvc/3L6q5zqK4NfgDCF20kgHU+2eeXpmQVcOa8rnb2LAHD70iJ+0JVDBhZ1reSJ3sp/WJKPPOHWIFzaCWP6bqA6J9dMCYciGNenr+sk2wRC9tbPBAIsBbx+RoSllg8Aym7spqgTGOHHLAQhnAIvBSXpXLiVfbBYzQtgkAVXiFgBmBiXxUeqCRa9OXnKX/CBVLJrCsC41DeGOBehBs2X89Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7n3JIWqkfTeFWjocAnOypje6GBfJSMtHY2ylXhflpAM=;
 b=CTpggWGn1nuiCmCthBEmAPASEHtjlnsrJkA19wRDJWBuJ9byDzCIEpA/L687yg2hukQkWfJ9v3keX7rJDRKL+oAvdaIQWrSYlESz6erarnQ1rFkZxK5SjcrMmcNng4MzMS0XIlzvtRCVdusyBmV2N6Gkc5r3jXqCDwRXtvzXfskaR1bV4TUa64aJ6Inm0DbCst/xESljcT+l0tBkwPBJgfBrE1dkEF7MuwsLRHLRm3PVHEb4B7j17GtIFcKZTJZJFkjnCtOGcxYUw8RoBuABPXjlTzcJfkAtb2UbkKtWGQpc/+HQVnVbVnJT/fWcyiaOltg4dyfHe1bR5yB9JtksHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7n3JIWqkfTeFWjocAnOypje6GBfJSMtHY2ylXhflpAM=;
 b=ROaMly7b5gjAPjhWEYy2QJWcQEevh7OJT0NPll+PAbXgED8RDW5CoL1K50JsoAHRQe9HOGEORPryDpClNOkuZYZl4aKOpn8lECKidy8cVCarOBxPLwOOQahWWFqpcfbCe/F3a9UbQl5TG//1FUYHEs28LjxDG0R1gbVTk4Kwnvs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB6804.jpnprd01.prod.outlook.com (2603:1096:400:b3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 14:09:19 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 14:09:19 +0000
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
Subject: [PATCH 07/22] clk: renesas: r9a09g047: Add support for DSI clocks and
 resets
Date: Wed, 26 Nov 2025 15:07:19 +0100
Message-ID: <a7ed87270fd084f2b3f1ad6ee9238b2fb5bcc426.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: e751a436-684b-46ef-9671-08de2cf5644c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uSlN3uapcDVVQnR4tynwr7l/GFkzObc51aJXaZb1bqkD5tr4ws+f1IgtSjYB?=
 =?us-ascii?Q?UkQBUzi35GjLakNyxjbwf0Byd9BJ8/tz/gtgj1Vtg6UPg6uUPtH7Z9NKcs5K?=
 =?us-ascii?Q?za6ysAbjbUAFo3D7OZMI+rTEGDlhlw03ULWnViaTysEZ+UAabnDb+2f1Zw5D?=
 =?us-ascii?Q?PhZO+/cZVRt5/jei1afSSsL+JUmUhE+2bH/G9VE/q1slZbbFowiwUlig5G4c?=
 =?us-ascii?Q?Hxj6qo8eTlbswV6Nb+GpISXVacWwY/8uVRW0xPm1FBQAeI6Evn4T7ZkMQ29k?=
 =?us-ascii?Q?C4s5vTKI2wSyMjBg8sGysLKErHNXuutW1aEtIIneFPDf1HkvZ4d6sqdEbrYG?=
 =?us-ascii?Q?qJQBtNDQsFDkwfRER+nes16TuPyf239wStEdr8qt6NxPpyNUUijzNxbNH2bw?=
 =?us-ascii?Q?TZeI4UJY4DUjgThC7Dzn1FYMyJslxQOuUgqefgfF1+QDAQDqqcHfKLMKqDHA?=
 =?us-ascii?Q?fd2WISfbNtFFmz3LtwzJ6+Q82TglBhllV2NNwMvy0ciBQVaCaWQZ8h9nN8/n?=
 =?us-ascii?Q?olOwTRUUZ4E0qWzSOMMElRxC2GxDmK6mWzATXQJUEIatm00RULDM6JHfIb5V?=
 =?us-ascii?Q?Ej62wXP/wL3wMNbcROpctLFQfSu75mi6dELJL4KAr2kh0elYgTm/gorb3KPk?=
 =?us-ascii?Q?0vBbdiWLuN+rY/7PMdixUs+LEXcMkBLcna8JEAqlPjMGXfX69JjmYvNCdvKs?=
 =?us-ascii?Q?xUJkYFB6cM+q27z8AhlMzCHlvDGLWiHbSgtX7T5Q1MSiKmChU3iJeikz4aP3?=
 =?us-ascii?Q?S4uc7plJvj2JQ7dBGgP5YZZCwFox2BUwnMBI9bHQBg8v6txJ+9lfsFDg3Tgq?=
 =?us-ascii?Q?vf3cMuwzpXbWmPW2KiZWTxZFrUtvzD4k4tHKK6uCOQ/mDfYxJ9pfpKuxPf8W?=
 =?us-ascii?Q?UM+r2uXRjSUNkoV8+jB9L2l+M0/ll2Jw8wbLzantTYhi0Fm7qmvQjM/p8ujf?=
 =?us-ascii?Q?AY9L9/eJVdtsDvf3o1YmUi5fQ9LbJ0KKMA2YlN8dtPbyd38dNPxTQ624Tvjy?=
 =?us-ascii?Q?LOtQYV0EtcgAC3dkZ3KJ35WvqD9GFjg8OxG7WFYKzQIFOht/+a1UzT2lwQPe?=
 =?us-ascii?Q?TcYlXIVXvxHt62pDUWlXXRdFiO9jq3tV0twtbjlHF9C5I5VO7DgW3bSYQsFt?=
 =?us-ascii?Q?GvFEPCoWNDU8CIs9ONgqFft7W/mWH1BL5Vle9NvoTcEq60+K73bP/KWB2SQX?=
 =?us-ascii?Q?9FB5onlidPYXlVblcPJ/4JIyPb7h3uq3gX6YPXAF1IvdZ44l+ZY6o6RUV22G?=
 =?us-ascii?Q?E+MDRJXGt4djukQgblDp5yJm73O+UdCebIx/eHtL6iXp/s4XU4GHEQPas+p8?=
 =?us-ascii?Q?b9EWQka5BqG+gb4TPL4hKAJZDbxD2FEwwfnklcMRRSmRByIXpUFrh7WXKZqJ?=
 =?us-ascii?Q?zr12EU9TvtfuTX1YBhpzsCnMFl9XZIydrM7XQHnyq9Tv4/PYCgPi9TfKDXxO?=
 =?us-ascii?Q?r9xoeWJ4x0jdDtNbpLXbYEE74UHR5tPjcARwzHSAe5eKC4C6DwIsah2jrLvV?=
 =?us-ascii?Q?CI53z6L33WydC42oZSjQNjwHW8MrHpPxASrE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZStq4LYeAzBpJXlcjEtZ2bQMV2tYdSUTT3OsMe1HIhq9Shuwj0VPaJjbpkX8?=
 =?us-ascii?Q?Q2mH0mPjRqWgapBd+AwVZLuQNuDH42NWlAh8vm3qA9YlTXK9fzzO6ToklJkz?=
 =?us-ascii?Q?XpYc36WwmSkbRoef/tOUt2H88NA3D6bNQzhbwDOssoy3l0j45+StgP8SG4jN?=
 =?us-ascii?Q?+i8UMbqfCSRkkRQyMYRDUb/BPmJNWYS0iOe6NNXK7Z9paESPO9RF7FIYOyPI?=
 =?us-ascii?Q?UIDxCcj+j3WJAAZgZzZ5pNYxPCOTJn3mW4hZQQXB4EYYy1z/0BM5eiidtadu?=
 =?us-ascii?Q?RiYY21sCICbtsrBS23PlNcRaqupeUJjRdHiELqeyCCwM2Atz3C6gDMQlOuq6?=
 =?us-ascii?Q?nCjl3UBUtIoogCSj00/0zKYLMwm8EnyKner9gR3lcP/o1+sOFxYRuH7GEMKf?=
 =?us-ascii?Q?nuOOhbu3XhiSNEV5WCYSxTMy5OhOVv3x7GoIjFCFSejco7HdxaPWSS2h4WyQ?=
 =?us-ascii?Q?PcD4GA2ZOb96Jud8+F5MZpNKJ7P8ozUgs0MtUQ6JTt0KD1SbxUKXNY7h3YCD?=
 =?us-ascii?Q?F9auiTRbOQxOxv5O8qo/ELcKYOtQZiFWw06J8NxfW6IQtLRUW/yA3pGHz6h5?=
 =?us-ascii?Q?saRMq4soXu/IUe9M+hBq1B/toFDWcDZOP62SUC9n3GD9hNeEjgHFppuPFbt1?=
 =?us-ascii?Q?opdaYsb0fmBrB5IMgMowr5EPL1Kch3xwR++2bmhlrRmG0ew06WEOaYIlUrlV?=
 =?us-ascii?Q?FxrPmzAtNtLhvmZ4YUdk2kz3vSrlDqzVoz4CZh+yd3EnsPxVUTfkyd0GjKJI?=
 =?us-ascii?Q?4Fb4+WaXWvp7ZN/mDXRvXOPWqiEjF4Jjw9RdSlY1Q5a2wEft6WaVW1UwtLPB?=
 =?us-ascii?Q?ZU0XCbV1kEvly16ynrwLObx/b6sMe5QY4p9oKwKkTQy1TpkfATsHqQPRlK18?=
 =?us-ascii?Q?iiaNyEq8X/cw6g4xGxmnwSWhy4yBI1jXW84lnRX77HhEZx3IBgfYQmCZEfw0?=
 =?us-ascii?Q?y6o8eKyZ1cVMSWgNW75sqIn8XbbfaV+L3XgOQCOYixKQzlyqV4scFuZG1nwJ?=
 =?us-ascii?Q?mknsEiO9n0yJoyXzgL1nwDvHW6QbfeaypF4wwsHD2I2fFuUf8xL0cVopkY+G?=
 =?us-ascii?Q?v237EpftVUYS7Rb+8DPRfMayQ2CDibu+Fpcslulfuvlct29p9xE01Zf/x1sL?=
 =?us-ascii?Q?qUorKqWL2oNoMVet+vVXcgm4Ie7Re+xFnAmv9GdPLE1978j7Aw/6J/1ArxGL?=
 =?us-ascii?Q?e0iOHeD3Aqd2222XtYLDE7n9i5iKg1WqyLqHtmGIK/nrPk7qD8L2gqNvGMYw?=
 =?us-ascii?Q?wDbQgZ3fAn1lE+hV+1d7tf+u+MHlrhfbjvbwtOKN9u1IR4TyB7MY9ubY4lO7?=
 =?us-ascii?Q?q4/yvu0hAHJcvGsB6VLkCOAjudIVhJhkvgV7ozAb3uxnMqWxVfr5OPvLnMNA?=
 =?us-ascii?Q?vUim0C461qLcqzDPcSYbSGgLZKb7x/v4b4Jyj8AgU7tPSCA0ufLt6iEgdFV7?=
 =?us-ascii?Q?HT7YqkMZzvPQL2+G/yyBoGcmLlRz1SmT6WoluJTxAGBxGMke1i8C6R8Ah7KT?=
 =?us-ascii?Q?Lhz0r+0njS3pJjY6zzbGnFv/hRR7II+mw8vlH1mzl0Jx+mUC0/MrUb4fetxg?=
 =?us-ascii?Q?9VuYi+47wbJb5L+kRxtmkRc1/ZwMxLggH3ekpXfqoeJUR5eIp/ncEkexlcy2?=
 =?us-ascii?Q?ma3sxNf6YHJI8LenrV3gUO4=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e751a436-684b-46ef-9671-08de2cf5644c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 14:09:19.7484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N+QeGrfUCWeoOnl6k8oddQMqlxI041GxoDw4nRVDV/+AFubmoMll+Aazab5GKd6D/mvNI5y4wQmRdnbByy9jQGFvqjXNDLH1tdvwAU9dTpiO4Y3tCuiDW1+AsKsj91rk
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

Add definitions for DSI clocks and resets on the R9A09G047 cpg driver
to enable proper initialization and control of the DSI hardware.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g047-cpg.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index c8863eded44d..236598d83c7f 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -486,6 +486,18 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
 						BUS_MSTOP(9, BIT(4))),
 	DEF_MOD("cru_0_pclk",			CLK_PLLDTY_DIV16, 13, 4, 6, 20,
 						BUS_MSTOP(9, BIT(4))),
+	DEF_MOD("dsi_0_pclk",			CLK_PLLDTY_DIV16, 14, 8, 7, 8,
+						BUS_MSTOP(9, BIT(15) | BIT(14))),
+	DEF_MOD("dsi_0_aclk",			CLK_PLLDTY_ACPU_DIV2, 14, 9, 7, 9,
+						BUS_MSTOP(9, BIT(15) | BIT(14))),
+	DEF_MOD("dsi_0_vclk1",			CLK_SMUX2_DSI0_CLK, 14, 10, 7, 10,
+						BUS_MSTOP(9, BIT(15) | BIT(14))),
+	DEF_MOD("dsi_0_vclk2",			CLK_SMUX2_DSI1_CLK, 25, 0, 10, 21,
+						BUS_MSTOP(9, BIT(15) | BIT(14))),
+	DEF_MOD("dsi_0_lpclk",			CLK_PLLETH_LPCLK, 14, 11, 7, 11,
+						BUS_MSTOP(9, BIT(15) | BIT(14))),
+	DEF_MOD("dsi_0_pllref_clk",		CLK_QEXTAL, 14, 12, 7, 12,
+						BUS_MSTOP(9, BIT(15) | BIT(14))),
 	DEF_MOD("ge3d_clk",			CLK_PLLVDO_GPU, 15, 0, 7, 16,
 						BUS_MSTOP(3, BIT(4))),
 	DEF_MOD("ge3d_axi_clk",			CLK_PLLDTY_ACPU_DIV2, 15, 1, 7, 17,
@@ -562,6 +574,8 @@ static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
 	DEF_RST(12, 5, 5, 22),		/* CRU_0_PRESETN */
 	DEF_RST(12, 6, 5, 23),		/* CRU_0_ARESETN */
 	DEF_RST(12, 7, 5, 24),		/* CRU_0_S_RESETN */
+	DEF_RST(13, 7, 6, 8),		/* DSI_0_PRESETN */
+	DEF_RST(13, 8, 6, 9),		/* DSI_0_ARESETN */
 	DEF_RST(13, 13, 6, 14),		/* GE3D_RESETN */
 	DEF_RST(13, 14, 6, 15),		/* GE3D_AXI_RESETN */
 	DEF_RST(13, 15, 6, 16),		/* GE3D_ACE_RESETN */
-- 
2.43.0

