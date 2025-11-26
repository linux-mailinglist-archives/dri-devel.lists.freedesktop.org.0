Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 493F9C8A2BD
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:09:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AE4F10E620;
	Wed, 26 Nov 2025 14:09:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ajyFWbob";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011060.outbound.protection.outlook.com [52.101.125.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AFBB10E61B
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 14:09:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qkENpNoVN4cP150Bmg1E1SrojAlRKd0Wg14clJnabjOFfmxUhO0pJlO2LKsIOapPrbiV6YPNmEByGvf+awesVrzFPgauxatnJlFX/MsO0Let5UzB2/RaVMx/He3kX9L25VjcOHj03pLrMOCzbE7dxMKPorCzl1YHdC/x0ndXgBPYotad1+adyP1S1gtCCi3roxXCKBXL+78yGn54zsMfm61MeQa/LxsdUI4Vqrqld1ncJqpzhIfmCZQ+864yaQP1UqXu5PJpI/26w6zEvRSmNIjFVe1DSokshOcU5RfOjnbTaKNuHbF0kqhCgoY/S2TmO0oNAZrFTk01/xc85iAQyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n/VwJXlces0rPqCqQCDBVLsYTa34re4eScJu3yeayQ0=;
 b=CWLRa2pbGlNER78SzcF5bkdwMa1UsDgmoGUJBWS8075B2bE8HlPuCb9diJ4Q5zj5r8Kd+I+nyWvp8J4pXkFWsigQkJJv6zhRZ1gp5JX5mOuqoQMcQkPh527ciLT+/VzDriI9E4TRigKriL+1KcplxGKZGkE/Zo4RZEbkx+Nq0P23e6jrk+cUvjnvRwSar9b58R9jqsdBue88UcIgBLO6GgqA+BW20vRK0+pFht/bva7vD3nx5lJ+kgnor2bL5nJxAn3AIlVddbb+B3PJqzGW8mk6p5AN4glrH+0PtQplR0+9cmew6TEq+0EcfW5V+IXzNoq5184d8tFn1ZM0ITGIMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/VwJXlces0rPqCqQCDBVLsYTa34re4eScJu3yeayQ0=;
 b=ajyFWbobB8Go9UXhgd8X429R4kJwpNc/eg4pt0kiA8fBGTv6eNSEMl5+iKddb1ELTzXroyLuGhG5ueYenKtsRfARdYfEM0c5GNQWOFNqnt7U9vJbD0khaXYW3WwovH7zDvLNJGXmcXxLcJQJyhtnMgeF9pSg+AHVU2obQS3j2So=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB6804.jpnprd01.prod.outlook.com (2603:1096:400:b3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 14:09:28 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 14:09:28 +0000
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
Subject: [PATCH 08/22] clk: renesas: r9a09g047: Add support for LCDC{0,
 1} clocks and resets
Date: Wed, 26 Nov 2025 15:07:20 +0100
Message-ID: <679042b205b9596b79463b89c31d9e3f74cd0e63.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8eb425fc-52ae-464d-e265-08de2cf56990
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yYckayH+v5NEeHFmBdfQapMeK8t0RGpnlDUAElqu3gJqE4WOt4/45JApXgnh?=
 =?us-ascii?Q?5+4653tNjZhFXUcWp6TIPef1zFWnoFac3D6XkusbJbVFtp21Q7ocEYB5kfNh?=
 =?us-ascii?Q?eyub2ykqdutREDJjggBFrQ5WyGolE4n6Up9B/hbsaeicFBeyeLpKlbC779t4?=
 =?us-ascii?Q?PDk+bEcWg18IfCupUc+jcLIiSYqh0fMTTm0FUMdOesClzmomEjDx5k7n8AXV?=
 =?us-ascii?Q?/4FRRbxHxFNKaXAZVNgya7zCFtZdPz5ijfYnG0JJ2+/SKQ3BMDWlCJGDuo0n?=
 =?us-ascii?Q?5wDiUGkAy69Aarlq10bXV9RIn1cOSOaTENhKRCFbwJQetRlCWoCVfLZrFFW9?=
 =?us-ascii?Q?htMxcUfjRXhxQS+Bv/oYPdW/CyyE4M/wJfx1wKM1opeLDDLswsEfVYvszwV2?=
 =?us-ascii?Q?y3H4MCEQTbePjTB2G9+f9324YnRCVDna9dGK+trRtjVp5wQgYtZb/vBdhxAE?=
 =?us-ascii?Q?mGS5gvi8TpxhgysvtdYCXzSfQeZezi9AEmKTj9KavX1Hth6ZlqlVOzyMsBXs?=
 =?us-ascii?Q?xbaSzfEAm+PumE3vd8a1ffQcAQzSdl3M+c7z9DHFsUPhj5vbVCnSWCTBZhHX?=
 =?us-ascii?Q?wsmVZGIDEKnJt6KWJxb/m9Hrma9tkJOEPrEm7dfYuHH3peU6WaVgTgZbUAuc?=
 =?us-ascii?Q?BEOk7DoNs50QlmVAzjEsQYc6UMss88FrJZhCeRX7/pHeUPufbq9TCM2hid0O?=
 =?us-ascii?Q?dgjQ0sAkx2ROCNUaMrAcbak7pbO2BVBk1VWf9JybIcbus/GcYmC/FEG6/ZB5?=
 =?us-ascii?Q?jFg8qs0i7tbvebBApirVd1NTJY2DGuKyvhl8flAafnoROfwTtO7FW/Dbe9dY?=
 =?us-ascii?Q?zpA8BNfYkKQkoprcZdE8PzTJhHSwkX8JqX8XR44aK6ZO3nNeuL3L33FjTkhQ?=
 =?us-ascii?Q?dEEV/VrLQc7m/pjEJzBqBtj2mfwAfLMF5E2NTO94Oe3jfwiNyD/xzsd9HPmj?=
 =?us-ascii?Q?IfC6OZImhbF1vsVglc1dFWjRZqr80FOsnyU2k5NzHLxqgU6jHVeymwmec7jJ?=
 =?us-ascii?Q?XKH3xvGny4FpDuTtLbO10BWum5bo1hPxVW9+5u1GzEpWvs0/LMmxa1kOZS4/?=
 =?us-ascii?Q?9OVkechOeJ+BE9JYTaTGHPiwI1nvZbF4hFsAWz1jFVhk82I5aZH1MDiURkn6?=
 =?us-ascii?Q?ftHxo1VAhpDqZ6F+MaOCGHet7usUdgIwZ7IVkX2keRTzYHuT6+Nx1ZV3+xO7?=
 =?us-ascii?Q?b09NQP+1Abvqj0VSWNV/3NKQLxUORjJ/zfjrnekeIaVPGKehRyQF+rzrrsqi?=
 =?us-ascii?Q?vGBSQaQpWAFTyfBTO1HJjC65G4pvRKUO0mjpYCZ1/eWk5HRney+3djZKfIy9?=
 =?us-ascii?Q?nC0a0/uH80y7wAzG0PcN+kk9O9nkXS1bSHcXWyBBQ954+HLhzOw0/wMDIDSo?=
 =?us-ascii?Q?hOLPS/WA2Qwp0h7l/dDaYDxTjEUf/SlrV7skiAMwc+NDbRlyEAXr+fnjxl3f?=
 =?us-ascii?Q?hxAyS0v+avTlH2PsmmBRrG4DTkp7vgaLhvsJmAeB3nbsWqtPMltMDrt0EwUh?=
 =?us-ascii?Q?lBtWhhy68Iuug7MUq9eD3CNQjmXZW5or5Jg2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z03/IGzO71hV9yCCFw2BWaMjUraDUFYcKGhc1hknMksKXte70tX5MVgE4XPf?=
 =?us-ascii?Q?hQ2bBbe8vExUyXuRsVy2cn0Wg/TU230qbA8YUs7YWT40Oq5a8GTEVftyfy3K?=
 =?us-ascii?Q?0FMtx7DmvzDKN/xx8/n7LBaMEwxhw+vDtyXwI9GLVdHRY7TSse6H/Fnb5QlJ?=
 =?us-ascii?Q?SdSpcjgzuHPMAhtGFI55NZrLlK+iQsT4uubSU0dud3opeB2hEKuadiR8V0qe?=
 =?us-ascii?Q?tV1VlNwm7yMOcZPglG0tC2ayaJ888bI7uHAWU2X4Z04UyDgkXHIbgjvOGptG?=
 =?us-ascii?Q?8XaKrOlFL/Wg+q+oR4GoPOpigCq9/6r36AfdyzANDu2gDglYXhalEHzE1Ay8?=
 =?us-ascii?Q?0dy/da6ghGSDXlc56m3t7Qyz54LFu6eghxIndMV3Auf39jbhs0daVo/ZWFCF?=
 =?us-ascii?Q?c9z+d64CFTMnGuqz3+pwZz3tWhlb+VIr5rDD1rrtJBC2AQ7/sNopPmsUWy5S?=
 =?us-ascii?Q?yNw783QDuphlQL6UqT4HrV4NVWNK1aV+ZBar4PV+B4iYmUleQMooBTwC7Xel?=
 =?us-ascii?Q?IJQBt7f5o7SjEtp3BF5lEU90G5tDTdo7AQ8jvWQK9LnZeJqOnYCWPTtBxe0J?=
 =?us-ascii?Q?Q51XMgC7iTFx0H1c+R+MSbH/dUQFEZfKtDnGg8jENsZXB6nPinNmhvxNZPLj?=
 =?us-ascii?Q?rY7gtGRLwePYeEiHPPslPd1bxq2mEOze3rrCEyCqxA9ZIl724Xl0bN9pNrla?=
 =?us-ascii?Q?WR8d+r5Ad4wpKMAbgbW1r8QD7jrijQ7a89WsKJ4cRixCqyHNquV4gNNkmwrU?=
 =?us-ascii?Q?+L1gbbf0D4pYWhR5bPoM2u4OSvlu5WsfuSjEMGA/MFcMqfVaeJx6iU5wABim?=
 =?us-ascii?Q?7hlksVtrf7mTCwovtwhZRXSMnd66Giq0H0HhX0ln3ZflR0DcQC+GDxmBBEuE?=
 =?us-ascii?Q?htxnMTaq5fF+AKvqYrOo0NbGa3Mo27YT4yBvDW/RP5byhyYkvTYF2VUJ0GEX?=
 =?us-ascii?Q?s8HIHhx1ZnflUXB2lwaor0NM+3Ky+guIMP+aIAhzxHMt90vneBau7cvSJTqO?=
 =?us-ascii?Q?2Y3xQPH7WFZ24liRqj3ah7wvk4cRHI/o5prnAZRDQx9KdO/x3fcPt7Gg9tv6?=
 =?us-ascii?Q?pb+xUEgzOSCwhEuoTwnr3h+mpA4NLolOv79cQVXZ79XtPfLoujOd/KVYusnx?=
 =?us-ascii?Q?sKCQEh4fU4c96soQVO/w3TCVwcas/X6sqAEPaCYrdLXWyooMFJE6PGo4J3Xi?=
 =?us-ascii?Q?ISe0Dq9/rtV8A82lbpIGrASDAx+pdLR8JZCeCWMWpbCXJDvqctSzpyaP34+L?=
 =?us-ascii?Q?NhviqoFbQE46gmliJlZa3Dg0zYn+fAczbDX/HfhaZvXWYL6yWl83EpMpIhc5?=
 =?us-ascii?Q?R8cvfiOEr5DQgqdNSOsZnuCsM2DMBh511ODo4QCTv3p71onkrlmzMEcoJz/2?=
 =?us-ascii?Q?ttewZbp0mmozGzxTTOZzjAzznFe5XCdZssmyR+wnwybP0Zx9gk0/ZGQ/hHOD?=
 =?us-ascii?Q?mNNB4FgZbF1W5QjV0L1F/MH4yMf3k5RwQM/xlGlYUkVOnegGL0n4z4dUCSj7?=
 =?us-ascii?Q?o3n6n0iyBnpO9EZnncy61/UA1+lrJqOGABaUDhclBKp3Z0HeT5oQlHj4nv9r?=
 =?us-ascii?Q?bZv7kZJRaUagTij2b2gffKkf6KjZZ8uCHLIMQ+Ea/U33tyR190v/w3x8j3ZK?=
 =?us-ascii?Q?cLzlgNQcREkrBBxY09JjILs=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eb425fc-52ae-464d-e265-08de2cf56990
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 14:09:28.5998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AQNipLd/X31gMaWNQw5DAP/b/XY6XMZXxXHPmqX7wpCDeFF3WDBLEGkm2c1rZ3RZbt/48OfLCbLJucYF7ZcQVywhjKxLFe2dAUP1p8yOjMA7Q10QBGC8JrFCJTxriG6R
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

Add LCDC{0,1} clocks and resets entries to the r9a09g047 CPG driver.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g047-cpg.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index 236598d83c7f..739c1ec9ad76 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -498,6 +498,12 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
 						BUS_MSTOP(9, BIT(15) | BIT(14))),
 	DEF_MOD("dsi_0_pllref_clk",		CLK_QEXTAL, 14, 12, 7, 12,
 						BUS_MSTOP(9, BIT(15) | BIT(14))),
+	DEF_MOD("lcdc_0_clk_a",			CLK_PLLDTY_ACPU_DIV2, 14, 13, 7, 13,
+						BUS_MSTOP(10, BIT(3) | BIT(2) | BIT(1))),
+	DEF_MOD("lcdc_0_clk_p",			CLK_PLLDTY_DIV16, 14, 14, 7, 14,
+						BUS_MSTOP(10, BIT(3) | BIT(2) | BIT(1))),
+	DEF_MOD("lcdc_0_clk_d",			CLK_SMUX2_DSI0_CLK, 14, 15, 7, 15,
+						BUS_MSTOP(10, BIT(3) | BIT(2) | BIT(1))),
 	DEF_MOD("ge3d_clk",			CLK_PLLVDO_GPU, 15, 0, 7, 16,
 						BUS_MSTOP(3, BIT(4))),
 	DEF_MOD("ge3d_axi_clk",			CLK_PLLDTY_ACPU_DIV2, 15, 1, 7, 17,
@@ -506,6 +512,12 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
 						BUS_MSTOP(3, BIT(4))),
 	DEF_MOD("tsu_1_pclk",			CLK_QEXTAL, 16, 10, 8, 10,
 						BUS_MSTOP(2, BIT(15))),
+	DEF_MOD("lcdc_1_clk_a",			CLK_PLLDTY_ACPU_DIV2, 26, 8, 10, 30,
+						BUS_MSTOP(13, BIT(5) | BIT(4) | BIT(3))),
+	DEF_MOD("lcdc_1_clk_p",			CLK_PLLDTY_DIV16, 26, 9, 10, 31,
+						BUS_MSTOP(13, BIT(5) | BIT(4) | BIT(3))),
+	DEF_MOD("lcdc_1_clk_d",			CLK_SMUX2_DSI1_CLK, 26, 10, 11, 0,
+						BUS_MSTOP(13, BIT(5) | BIT(4) | BIT(3))),
 };
 
 static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
@@ -576,10 +588,12 @@ static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
 	DEF_RST(12, 7, 5, 24),		/* CRU_0_S_RESETN */
 	DEF_RST(13, 7, 6, 8),		/* DSI_0_PRESETN */
 	DEF_RST(13, 8, 6, 9),		/* DSI_0_ARESETN */
+	DEF_RST(13, 12, 6, 13),		/* LCDC_0_RESET_N */
 	DEF_RST(13, 13, 6, 14),		/* GE3D_RESETN */
 	DEF_RST(13, 14, 6, 15),		/* GE3D_AXI_RESETN */
 	DEF_RST(13, 15, 6, 16),		/* GE3D_ACE_RESETN */
 	DEF_RST(15, 8, 7, 9),		/* TSU_1_PRESETN */
+	DEF_RST(17, 14, 8, 15),		/* LCDC_1_RESET_N */
 };
 
 const struct rzv2h_cpg_info r9a09g047_cpg_info __initconst = {
-- 
2.43.0

