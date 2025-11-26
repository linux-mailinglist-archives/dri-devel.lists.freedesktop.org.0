Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0DCC8A2B7
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:09:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F202C10E610;
	Wed, 26 Nov 2025 14:09:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="UTxhFNa4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011039.outbound.protection.outlook.com [40.107.74.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2289E10E61F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 14:09:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TzUDTibmn8VMhxGR2AryUK77eLRCCB3kix0+2r1IrZV1tHCdVKWXfTxhCoRXIRwBZT3IJNZsxVi5xPWHGLGelCFJRviMZdwwbOxlPlk6rI/zoL5qqsOOOjCJ4WmUybClTRZ5SzzqdXPfHB+OsECAC0ZL67+Mt3Qpx+HgjudZwhTRxiKhz4Dv++IBbprHCQxpmkBcSoeapmzO9u99L6lWktiZErkIq+iuJ4tppMd+XOBkGMP5CzUeDGxefRzzFSeYUDYnMJel47Gn/kwjdA4I3vo0KcWDThxImOwZFmaHZaxq9E9YSSB8fUc+2WUA1oMUgF0fBNmCpFF+yS7OKlaJZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g8kb7DNuzk4n35lKTxt60OCGowV3g0DWSTKAwG86Mxs=;
 b=SN1xi5E8JHd2JwqI1aAUb9NCRGeOrLx4p0FzFJ00D70R6RRv41hlYK9m1OlEhJs0Aw1EE5rM4Q3MLUM/5uo66Tu8fXkES84XRPRqRiDNNZeig99FEcqDB4T58qw6LSXNEVO+dbtItTRIDfSEWBWBkMEbOsPrMTwQaYIZuIlshCvhgLKVj1gUDehDmNlQpfS7OmFIZ2jgYIxUajv/WL64UK2F8XXPZqQthSgaUKHSicmnkmp9Ohu6jcG9wQNev4Wbq1jASOCmpMoeszMFgS13BVkIWWEnf9rEeND1Hc3KnRECGHaJdQLax5OJwpDifYOeSsjDaUSW7/l/dc3BzQws2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8kb7DNuzk4n35lKTxt60OCGowV3g0DWSTKAwG86Mxs=;
 b=UTxhFNa4QPLyB4KihcAwAiVd+xBL4zD/0E5Cgq66v/utDtocbe2/EUXF5DcyU+eFJLvroCZwYouLDHJm9mjA0SXmrGm8LecTGAoTM+FDfWjCriReF4hR6xl3Y8JY2jrt2SLWR2V0b9aGN+jsjtgDuPEagObzTAaR5/zQAICIzws=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB6804.jpnprd01.prod.outlook.com (2603:1096:400:b3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 14:09:11 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 14:09:11 +0000
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
Subject: [PATCH 06/22] clk: renesas: r9a09g047: Add support for SMUX2_DSI{0,
 1}_CLK
Date: Wed, 26 Nov 2025 15:07:18 +0100
Message-ID: <cdd044968c1d199ad41ec84ed71162725cb2ec66.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 80a9b758-83e7-4f7f-b736-08de2cf55f07
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gbUyTG8y8Wio0haRVZKotZfvPh6ZfSkdLUHS9xvHdZ4n8MDw65Mdqe3USL4M?=
 =?us-ascii?Q?LjCDcfnKtqhOLOHMosfcho3c9IPQTh6syW0GymXMQymSci/hK4Z1W0nEvK4z?=
 =?us-ascii?Q?FIvCH6YxXd3xTIDbmVo3GohbWy95MMs4McSH5j1fSQoN8F/9wgASzCxl1Iql?=
 =?us-ascii?Q?8OVSc5M1ITq0lhbFqqlNNr28ez4f8fVjfhko31oD+91DNQITfPVK+KKahLup?=
 =?us-ascii?Q?4I70GCq4jIjZRKDO5i3jZlrcTXs7s+Sc6t6TnauJgtZ6ODVU7M8nzcdj7dMH?=
 =?us-ascii?Q?8vhilhIVrHekjAK3sKHOSLkB9IBRsGn7DQnwoWGMPr4NZrps73lBN61d7GOc?=
 =?us-ascii?Q?1W8pTk67Kd3/3DGvCRF8wOm6lxMhBQ6AdMTKaCHA1rkgw8JPHHIKFe/Dw2qN?=
 =?us-ascii?Q?hvOq+RsfuJ9bgI9L93pBl1/oi0rsrVc+TEk8mwGnkdXZoKQJffoCyGxrqUap?=
 =?us-ascii?Q?oihgmejho4Mr4oEPz0Asu+TM8dzLiYYgVFsmp1/XjVI7gT20Gqa+UipWTVfS?=
 =?us-ascii?Q?0uS8Odtvnr/fZKjjqIGj0hSPTJ7EVpyMkXw7LAg5fVcHb0NbL0G5glXutQzx?=
 =?us-ascii?Q?dC9Tr2XHUh++vCw9Jo10aSRJ8ngcwhgRGmFO+rpidJdz0aYb4ww+vTyjspvQ?=
 =?us-ascii?Q?Qg+vUYEeNf16zxre+0noLqzffB8SzfXvUsuXDh6xsNsuIcdM62uvKSGIKvaF?=
 =?us-ascii?Q?zxMK8oxdj6VMJhTahEDrD3Oe9QGeMFJFvLgY0yW8G6I1cNWdq1azIiynXCSf?=
 =?us-ascii?Q?HKjSD4+G5ZvzngZ1IfoRwbktDZ8RzJtFSx07tRcBghndz7NQUQQ6YEtFEDhA?=
 =?us-ascii?Q?EixsD5Newsvsw5zDCnwz0Ifz7sAuSzoT1zWIJl1mgaNQUFtDRxxefdaJNCF2?=
 =?us-ascii?Q?SomLSQC5ma4BWdEBsknaRy2iCVU5QVGwf6XCTmDe3UUaXXEYv8BAhzQWRf3K?=
 =?us-ascii?Q?MPbA68iRqumoLpoXPyXEoRI1W86MLM9PvQv1L1H/cZY5CvGdKV1YZLHok1Fi?=
 =?us-ascii?Q?j3X61mh2z1af/Fien3eZzEJwKE+AvAxWEGL9C/NioLYCFS7RDwj6rZbkXId8?=
 =?us-ascii?Q?oIhGoN+p984UoAqlqdnmTcAXQG6vuqWmP/URi89FU4wsBKvVsBbfjCB8EFPU?=
 =?us-ascii?Q?BZyVYH6cjjD6uoem8zFGdjpmHS8aIPjfA2PMuL0X33gW2q87SaGhCSOAyd2l?=
 =?us-ascii?Q?NGPSKiwFtDmf15QKqZZqdaVfypvyWlz/mVGj/7VNBNH1CX1JaAZdHUXlJNNM?=
 =?us-ascii?Q?aUEbbMhEWW0WAKz9lSghDSIbpdIourIQxvNpRYWyOr4PPx5CQ35LAGyZplj1?=
 =?us-ascii?Q?iWIKUEz1COWaPrzKkjp+cQ76LdJhRNgPAN3Rh8o4qLtbNZ7z+nI0x3LdrHDn?=
 =?us-ascii?Q?SpBUdlmnKkjmA9xOWGvOFO927bM/puO3ENkyKh8Ck5cX2nqYWPOsNPKtVMyS?=
 =?us-ascii?Q?OeYIzmb8l/m77Jc2Jfe4kiysstbo4vzWun3pCBlrKaQxL+26RFQedwQRjsZ6?=
 =?us-ascii?Q?sIdP8OkhWbsktC8TD7/jteZ4Dh0le2s7GivI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nxdoy4WhJkwjAphoWJOowAsB0ocsRopYZ0F4/YbIEobfaKejusV+v0VD0JZF?=
 =?us-ascii?Q?Nj4BnR6sHGooCEV3inUSHfgqMKDmTLVsgJ5Y/hmpJQv6qvfRf+T741ygZCq3?=
 =?us-ascii?Q?pUIsQ+jBstPqw9kqpWVtEOzPHQAtyjduwLdYjg9XW+3GLTNSuqsJLRt21vKb?=
 =?us-ascii?Q?bolI5z7Ys808NGnl5PzHAGtDVrFadPPP+6PJpJnVkf86CBx27uuyyUOJicvJ?=
 =?us-ascii?Q?32tfWj/F1grwnJEYx8wG5R9p3GLaptWqcRhLta3Nfp/6U03UKOZPRppQLmWa?=
 =?us-ascii?Q?jtkjjLraQhvQthWMuS8TnhpoVpvs2nZewi+b1ZkU5jEqq4FSv3CMz3Tkkp5u?=
 =?us-ascii?Q?1/tO/C8Orw/zpJJKPhZRoZY/5KPC1p9N9PqqtPRZ8IsjO3vT4e9t2Vsv12Kg?=
 =?us-ascii?Q?RdlNEeRoMVAuAY/Ja3UFxvWlr/YyaN4j+2yYpViucplpMLemGgGfQg360Kjz?=
 =?us-ascii?Q?skoxGRbbpMyI7nHfSmoUHCJJQOu+w4Z6Iv55CB06bkXwtw5jTQo/Pg3qK9/6?=
 =?us-ascii?Q?J90pbkXsdrjodK6QSc96fyheOM4XA3/XPorQiU+IsGPhCVLSdG0xKPdZ/sBV?=
 =?us-ascii?Q?tvnTt5QfDwj5kveXC7PxQ33VI9zUkFBrDYb+Go2MdUfvrDVWofkpp/TSWuGW?=
 =?us-ascii?Q?Atv6jCchyc39IuIKqXbhaoncO2xWmugBuGbxU0Jt4SSj+vQBVBh9ZtmKahk9?=
 =?us-ascii?Q?DGhN+qSvy90T2zfCth2mILzSMTiNXjG/Yq0QfP7gvvMGxjpOJO78wy7D1FtT?=
 =?us-ascii?Q?q2eQyRjExKsZ0+dIVMfn8mlc/+ZYrabIbzO5Uc+oLl/MFOblvq4ArXRaLaT8?=
 =?us-ascii?Q?S9vP2doONOTr2XOVWnMGsvlQXOmAX2Q6pGnct1RCkNoUZHyiFHZFwvKvS3IR?=
 =?us-ascii?Q?8ddcv4XBNKUBmBg86iBk74LDfi7OmB/U8IkzKueWMkKul5lyTj2HY0dmRjpF?=
 =?us-ascii?Q?Qm5ZY9L8teEa5zG+kYsqJIthIdlpV6o4WMOFHKm720tZik2mmHjbqH7940g0?=
 =?us-ascii?Q?MgUYTkb5xH9cbuSQekdseXAXpHkwtQchLduVu47JyE0QvcQ/BlISEO4wdQTB?=
 =?us-ascii?Q?XiZ+URYLmxMyHy5MMsUiJNQx6pUQR4o0t+TkhbV9xDZyzDd9nuMeHj1/UMAt?=
 =?us-ascii?Q?cs1zFIvJ2/PJEi4ldDfIvHzHIXvWFVirr3q4pqNc9mxlXAcmaPF/SJu6Utjy?=
 =?us-ascii?Q?XiRGXK6fzZuD+TpEQzhGDzrcwpRYqeC0U8Da3dSLyUu3iguL7cio6VkNaErs?=
 =?us-ascii?Q?tyPQq11p8NRh6yEZNQkwAye4EA2B6650qm7pg7TanN2nPNHo0X4/5/UgdzPM?=
 =?us-ascii?Q?89rQ32FulxEm8yPFuM4BPxw+QsrOBdOvsqNQuyR9FYq5LDt0EM8hoCPdA6V8?=
 =?us-ascii?Q?w2PU1ZgsQB6XwedxEFMq6AfDCNwnBTNKnz2M+5CA1F9wQa3hINfC4bTghdqj?=
 =?us-ascii?Q?4VVQ8eYy0+pmSch7MptZpgDcS6axZNI0Letj0Xsc2fkSaFCo7CXlLxovp3ck?=
 =?us-ascii?Q?Pv2Qc8ZxVcuz+xM3ZhedrQKCm8sLCfz9SUozr75glFejJMuui+IjNTgRSz/d?=
 =?us-ascii?Q?BlN0aZ7exFvuhA7IebEqyxG//rxZWe4DRhEcbAf/mnpYaO2HQaPcljKRTgSA?=
 =?us-ascii?Q?Enbk6fl4pD2VguEEcL8kL2E=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80a9b758-83e7-4f7f-b736-08de2cf55f07
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 14:09:10.9735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: biGUpMIZvOlL6vVwegSMAumaq2PQBgvTGDXAnuvo0T3SvUL9uYpeC8gTRnfgr0qJmBsQH4RuBjj5hW3GwVyudtS4+CSQ5m9Y3vH4FirKPr+3HsGxnszhT/3z77hUquFW
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

Add support for the SMUX2_DSI0_CLK and SMUX2_DSI1_CLK clock muxes
present on the r9a09g047 SoC.

These muxes select between CDIV7_DSI{0,1}_CLK and CSDIV_2to16_PLLDSI{0,1}
using the CPG_SSEL3 register (SELCTL0 and SELCTL1 bits).

According to the hardware manual, when LVDS0 or LVDS1 outputs are used,
SELCTL0 or SELCTL1 must be set accordingly.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g047-cpg.c | 8 ++++++++
 drivers/clk/renesas/rzv2h-cpg.h     | 3 +++
 2 files changed, 11 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index aa6528b72cef..c8863eded44d 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -64,6 +64,8 @@ enum clk_ids {
 	CLK_SMUX2_GBE0_RXCLK,
 	CLK_SMUX2_GBE1_TXCLK,
 	CLK_SMUX2_GBE1_RXCLK,
+	CLK_SMUX2_DSI0_CLK,
+	CLK_SMUX2_DSI1_CLK,
 	CLK_PLLDTY_DIV16,
 	CLK_PLLVDO_CRU0,
 	CLK_PLLVDO_GPU,
@@ -143,6 +145,8 @@ RZG3E_CPG_PLL_DSI1_LIMITS(rzg3e_cpg_pll_dsi1_limits);
 #define PLLDSI1		PLL_PACK_LIMITS(0x160, 1, 1, &rzg3e_cpg_pll_dsi1_limits)
 
 /* Mux clock tables */
+static const char * const smux2_dsi0_clk[] = { ".plldsi0_div7", ".plldsi0_csdiv" };
+static const char * const smux2_dsi1_clk[] = { ".plldsi1_div7", ".plldsi1_csdiv" };
 static const char * const smux2_gbe0_rxclk[] = { ".plleth_gbe0", "et0_rxclk" };
 static const char * const smux2_gbe0_txclk[] = { ".plleth_gbe0", "et0_txclk" };
 static const char * const smux2_gbe1_rxclk[] = { ".plleth_gbe1", "et1_rxclk" };
@@ -218,6 +222,10 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 		       CSDIV1_DIVCTL3, dtable_2_16_plldsi),
 	DEF_FIXED(".plldsi0_div7", CLK_PLLDSI0_DIV7, CLK_PLLDSI0, 1, 7),
 	DEF_FIXED(".plldsi1_div7", CLK_PLLDSI1_DIV7, CLK_PLLDSI1, 1, 7),
+	DEF_PLLDSI_SMUX(".smux2_dsi0_clk", CLK_SMUX2_DSI0_CLK,
+			SSEL3_SELCTL0, smux2_dsi0_clk),
+	DEF_PLLDSI_SMUX(".smux2_dsi1_clk", CLK_SMUX2_DSI1_CLK,
+			SSEL3_SELCTL1, smux2_dsi1_clk),
 
 	/* Core Clocks */
 	DEF_FIXED("sys_0_pclk", R9A09G047_SYS_0_PCLK, CLK_QEXTAL, 1, 1),
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index af881ff98b31..4492f4e7b9ae 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -121,6 +121,7 @@ struct fixed_mod_conf {
 
 #define CPG_SSEL0		(0x300)
 #define CPG_SSEL1		(0x304)
+#define CPG_SSEL3		(0x30C)
 #define CPG_CDDIV0		(0x400)
 #define CPG_CDDIV1		(0x404)
 #define CPG_CDDIV2		(0x408)
@@ -156,6 +157,8 @@ struct fixed_mod_conf {
 #define SSEL1_SELCTL1	SMUX_PACK(CPG_SSEL1, 4, 1)
 #define SSEL1_SELCTL2	SMUX_PACK(CPG_SSEL1, 8, 1)
 #define SSEL1_SELCTL3	SMUX_PACK(CPG_SSEL1, 12, 1)
+#define SSEL3_SELCTL0	SMUX_PACK(CPG_SSEL3, 0, 1)
+#define SSEL3_SELCTL1	SMUX_PACK(CPG_SSEL3, 4, 1)
 
 #define BUS_MSTOP_IDX_MASK	GENMASK(31, 16)
 #define BUS_MSTOP_BITS_MASK	GENMASK(15, 0)
-- 
2.43.0

