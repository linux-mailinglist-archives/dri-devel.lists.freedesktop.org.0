Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF8DC8A29C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:08:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B011110E61C;
	Wed, 26 Nov 2025 14:08:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="deh4VRbB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011002.outbound.protection.outlook.com [40.107.74.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 291E110E61B
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 14:08:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LwNBGkN2m8WpOq9P2I3XJ6RyS5WuikeujsUGYzTwiFKgfM2jpAhfHGaAXd4RORSGzkqLSQjlZ0yJVgOv56vBCj3x/m5nlhmQ7kiiF/PYhw4hF7MPC444cKGkAOkLqqSZ+Avb7TFVsWfdqcQrlPcJrliyhSFHQBNZxXwPiXR6J4E0Cs2Ct0A4o3af+cHR064sUBfNDkW/ebZ5EEOTLtcE4OJFxxoU01EItGqR+9+oRCEPv8A9CHO6npimJsIXtOQx9lnAtNMRAqLc0x/o0K2RCeLvBbOZZfH01e88cYR6+Wc7xgQ4yqOmtx0z7rco6L2gjpMks0Tan4fhcLReNevcew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EKzO0dqT0u0Cn3U4qqXMEHLpA09vGi9V5Rlb/FsixXA=;
 b=U6hEiGensAgCARiyZjo6uD+uyOYUPYnRDbPXIvOg/DVZufkWCsIIhR/dTRKEXUqtax6/RwJgqGg7e8eamf+CcrYeBea5CcJAwbhZJj7IBdp32iS85R2ze7fR+oAmW221riUdOJqCVUtZ5+jbdqlFk0ybmTZkfrc77oOZdB0WaRnjPl25z2oNIXomnc5RKgNxD+L3YWFn2gEuPocDHKAphJH0gPB6oQ/E59qpy3oFzJXv0a+MybX2zh1gHsZsrF+RVd9/4GbQhlzrvZTJ7PqOdPQbjlDI+B+nI7BAcZIK+snvp5bi7dhWgHnbv/lc9q+IQT20NzO+GYhs0VUNMHnNdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EKzO0dqT0u0Cn3U4qqXMEHLpA09vGi9V5Rlb/FsixXA=;
 b=deh4VRbBN/9F+OrZoWg5LyxyF+EnSnzZwDe5kXL+vOHUvMhsZg0LzxAa5WwVOcttFr72VM//4vq8HzoXPbjMteJXKd/igV+7yYFJwHySeGxnlv9jigL/IblslCvMxnYHS95/3YNfJ51WKBNw3vlMHmTP6xxC3dqhoQkecj9gEKQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB6804.jpnprd01.prod.outlook.com (2603:1096:400:b3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 14:08:44 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 14:08:44 +0000
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
Subject: [PATCH 03/22] clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1} clocks
Date: Wed, 26 Nov 2025 15:07:15 +0100
Message-ID: <1d7a6c1380a80d82680e606a8523c76e0000390a.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: da4a3769-1ea2-450d-9535-08de2cf54f42
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7jHO7sAVuVqf8YCnocHID0w6rpT/MCWkibF5swN4M61s/Di1b3JvgwElfkIt?=
 =?us-ascii?Q?y0O/bm+Z/vqpCYchjQ/j/ahGPP54WwkXcK2cE9p3b2uSsclOifL44b1nL0tg?=
 =?us-ascii?Q?SBstn/6hLAqkKn0XVH9KL4zmu9Vb91qes/dvnH4oNcDBWgzuNUqSi2GbJRX8?=
 =?us-ascii?Q?W/jBR1UPbbekIX06huvkhz9H4HA6Sd8GxtdSjuDcWZS2Hy7U6ql3sd4MEaHV?=
 =?us-ascii?Q?i+2kh43GkLDGyFoqpnHmFuBjl6DS1LDDYue2oxAsuWqShP2rK8f74/eRnOMB?=
 =?us-ascii?Q?ZZT/WD9+RRF37RZRQ0ybsIkHnUhY2LbgjNb8hp9C2Y8bSlrBYQEb5pQyTAot?=
 =?us-ascii?Q?bniEUj9/tWrWn733pCN8fqNwT9Jjbjr5khbJvt7gcRl3LC+3ZDAYspsdkRNz?=
 =?us-ascii?Q?byfNtx8JiRFjtsK6SWqukRNAKHuUm5NPBZ8LdIPGiESMzrutRoISEXnkiDBL?=
 =?us-ascii?Q?kLRHj0eXPaYjrB4uwAe5pEDkviFsAMNBJ4z1GGygsYvYwoCYhCJCN68wO5Sk?=
 =?us-ascii?Q?F6Edr9GB2KPUf9PJlZ1oaRzX+IlCe7kd+F7ReQiJlEkPfpMW0NomTWVnZAbu?=
 =?us-ascii?Q?0Sjh3Rx2OWgGq6bifQx3uGVZZ/ji96ACzbOP2u+2m8RQTdfmdqGSSvE1Dexx?=
 =?us-ascii?Q?q+s6HA+kZLAmaptKbEBPhNzlVDVsCLrgk4feMb/GW+G8fMFwFAqs4SRyVmxl?=
 =?us-ascii?Q?4KR+5sgUl2Nj2EvFGDtpmCA6vTeaZPY1gcBaxkbDjuIixAuKwY6TwJMePWmf?=
 =?us-ascii?Q?3n+ZVbwOhgAUMKRKEHjNscrsuS+HFdSHueClz5v0C3ybc6du+BakiT9C7CgC?=
 =?us-ascii?Q?vmpnk5EhgHzHk4x9bAa19ON+UczFP2O6Ma+0YT3JIZFq3DIbTu8+9n+tQ737?=
 =?us-ascii?Q?gJEy2yOiSdPdYqwL3sGwRNphtg2hdis+MpZHjJ5DXsi73zVJAzQwNCRwPlAG?=
 =?us-ascii?Q?mEGF9Hd3g1LJiF0DXEXuDNIGYAWlU4kqkh7g5NoJ8fpOtYGV8hJZDsxHhGE3?=
 =?us-ascii?Q?goMliPiIdxwvQS09ob1CNQHzxo31O1QBipLZNpZxw0pEGgfCTdgLbU5EUH6I?=
 =?us-ascii?Q?OsAQy3e3ksgQtAN+Sm7BF4ziFXKX+M+cNx1kaapklcw9v1gyauXz08AcoInY?=
 =?us-ascii?Q?WZJm1R2H2wN1RJl1Sl3JqEP1kgZ8qAjPLe47OcMEBAZzcB+bQ46dpKdDXeOr?=
 =?us-ascii?Q?ok72mFrrKSuUCFUJ6jJ6pNfGVnIy8eS2dFLbwaSQYHC0bQVQ1/ipjGT12iO3?=
 =?us-ascii?Q?Qae6uHStXmXOBaN/Wj/ODOzBIYHV2llPYbX3X/I1SaU21o17ns2W6RSczKPu?=
 =?us-ascii?Q?/XUrcdNqz1QZtk/gKoYA6VQ8DyAgx3eP8Cn/40N0iG1Zh8p5LqcOgRdwTTrc?=
 =?us-ascii?Q?b7puWhdEAGzxqB3w0K/7Hf6GrGofSIVh1sULR9hSNiEA4MZONVU8hJOCk2EW?=
 =?us-ascii?Q?PAFEICZ6avOV7qpJqXfc1/nIVzDLpbQ8cwDfuiC4qqTYOB8zbTqcpbDsRuqc?=
 =?us-ascii?Q?CNOOyP1eRz/BxH/Iuzngk3DeaOU6YL/uEPxk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NI0Zslld/WG2l4q/TQ1YJQmHKTTt0MFjFb3hKpm1ZATnAg14/9MvZGub2DY8?=
 =?us-ascii?Q?p+7Gb46u9JHHsqN23LdweosS12K9zj3qHQnP65bwQfbckj9Eufli8ugpGnpl?=
 =?us-ascii?Q?d8S2lGZ5TBmzZ2zRi6lJnDa2UmWxyNYj74uAlLka3FUtGL4IkfD1SrTr9wkO?=
 =?us-ascii?Q?jQZLnZLaW3dUxMt9iy7lVUgn9niMBVDdgAnYKtwMQcy3RQZkAtVHQp3ObVut?=
 =?us-ascii?Q?0sYbM0Jn7uHo2oUzfAsfHDe6lBAf6w07ZqvjG8B35c/kEcdish6gvbMCc4qR?=
 =?us-ascii?Q?XGJkvLU5vDfAO8rgrIIG9H1SN1dQ9H1gtZKM9w+h6ZOzdGNJMN/THTidoqex?=
 =?us-ascii?Q?Wjw1TJGCp8Zw/Gmww8ck7wieSgyKRNUtq4r6EPhLNjG6vosYarr65fXHCEXE?=
 =?us-ascii?Q?S6KXrOslhXAe3A5tXBbunwlmX4Sv1Oyb08p1ppTHSgYWUYE8NpcEBzYw+oKr?=
 =?us-ascii?Q?+HpUAggNNyqn89S5QJUrPdMg8XUe2pgWJQM/d4JgsyekuV0ehNGC9eSdx1dT?=
 =?us-ascii?Q?svg3Mq1t5KqvR6SQrDCVMTi8f4VAyeI72qW677T1pXquu53XVSS6UcmascHr?=
 =?us-ascii?Q?l7vp47nfDqn1wH24c8cHV/3JYAMlSACK5Y7ZhJ/2bKGxifPlYeABfzcIa2tv?=
 =?us-ascii?Q?BJx9QHMo49lhkp6SpGb0iCdDbLjaCMzgbnTpe7/D/Ht6RtkFAvvITBri5qwQ?=
 =?us-ascii?Q?Yn3f2X9h/DIpq/zs9uswffXi+sel4pnJZWEtQh9MZ6odKuf97790cOQomtj2?=
 =?us-ascii?Q?r8AmXQao9wCMbe4ZDt5yx9lhiNT8QxGRga7/DMC/Yg6iraGgjVBSJabBp0pP?=
 =?us-ascii?Q?HdcPdhqawE41YrwlCAdin3uQrocjpwHCVgDM7xApSVfxcr1Tck8VhxcUz/E1?=
 =?us-ascii?Q?ROWWpcja4Q782w5emmp1ghj4Io3nHkMv+CSIeU+A38WPDW0EirIpTkLVzf9H?=
 =?us-ascii?Q?EkiGiM6ERfSXdUeM+63GOJ5uojUtE9vUssdPDGJiRMdbupn3BvV+qRWWAvnF?=
 =?us-ascii?Q?JEaiVu8E7zQ1a9H04ICUPi0LGqBSC6queeS+nKZpqxsGA69q4uTYUyxrfSEg?=
 =?us-ascii?Q?nMKCE2nDvI9n01bvPUK57CzjyKgAJar0GofLYNwZFdbOMPRnn950Kwr5kfvC?=
 =?us-ascii?Q?iBceeEFT4ziv/iiYPgc9CXQhcSOzcIh19wWj6Iz3MlUsDt9ZzeYAP2Uwiag6?=
 =?us-ascii?Q?K4N+rfhQh9F28RyC5ydgXhI60vXsvKzZssU6uEOzizz6C2capaTQNzmbwvVa?=
 =?us-ascii?Q?BWnJPEke4JFTfVTef12yw9TOIxGKoPCHMAJ25QimUEXSdN6StsYDL59QrI/7?=
 =?us-ascii?Q?ljQdUp80OvoZB+EdtLmvQhrZAig+BDR6/3OKeg/pWIMARQhUY8MVoK8rNhb1?=
 =?us-ascii?Q?+8X8qCodQtjtnrzQrOKS+R5J8E1EQR4A+mEkZKOBOzCsabJo2H4I60cyc8pn?=
 =?us-ascii?Q?TXA8YgR/r+h2Prb+nPnPco1CMVms6JGdsK95+YTumHhXqJqOUuFjkq2sOg+s?=
 =?us-ascii?Q?nzxklttgY3H18ganGNLkiWvoMKWTo1w3XWSjNBLRuiAjR6AGaeqYIA/GrDP1?=
 =?us-ascii?Q?LtTPYzA9Q0kFsvOzgyi70382GEvS2BkhAWH8W1me3dvCvsoYzRvVOimRqltl?=
 =?us-ascii?Q?83eDNeIWR5Dqxu9noiVVlPE=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da4a3769-1ea2-450d-9535-08de2cf54f42
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 14:08:44.2616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d7mbL0ZOTccYD8KhsJodeOvH2dDCtS9WfH/vObiZipavnpc74M7yiBIlgRFwWIzOIQdlib3IN48gmgLVZKXl0Ty3UouJFLd6o92+Nyu2WXLPIsxSqJDP9PrgRuuR+/RZ
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

Add support for the PLLDSI{0,1} clocks in the r9a09g047 CPG driver.

Introduce CLK_PLLDSI{0,1} also, introduce the
rzg3e_cpg_pll_dsi{0,1}_limits structures to describe the frequency
constraints specific to the RZ/G3E SoC.

On Renesas RZ/G3E:

 - PLLDSI0 maximum output frequency: 1218 MHz
 - PLLDSI1 maximum output frequency: 609 MHz

These limits are enforced through the newly added
RZG3E_CPG_PLL_DSI{0,1}_LIMITS().

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g047-cpg.c | 11 +++++++++++
 include/linux/clk/renesas.h         | 20 ++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index a73d12d4964a..8d4c70533a79 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/clk/renesas.h>
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -30,6 +31,8 @@ enum clk_ids {
 	CLK_PLLCA55,
 	CLK_PLLVDO,
 	CLK_PLLETH,
+	CLK_PLLDSI0,
+	CLK_PLLDSI1,
 
 	/* Internal Core Clocks */
 	CLK_PLLCM33_DIV3,
@@ -117,6 +120,12 @@ static const struct clk_div_table dtable_16_128[] = {
 	{0, 0},
 };
 
+RZG3E_CPG_PLL_DSI0_LIMITS(rzg3e_cpg_pll_dsi0_limits);
+RZG3E_CPG_PLL_DSI1_LIMITS(rzg3e_cpg_pll_dsi1_limits);
+
+#define PLLDSI0		PLL_PACK_LIMITS(0xc0, 1, 0, &rzg3e_cpg_pll_dsi0_limits)
+#define PLLDSI1		PLL_PACK_LIMITS(0x160, 1, 1, &rzg3e_cpg_pll_dsi1_limits)
+
 /* Mux clock tables */
 static const char * const smux2_gbe0_rxclk[] = { ".plleth_gbe0", "et0_rxclk" };
 static const char * const smux2_gbe0_txclk[] = { ".plleth_gbe0", "et0_txclk" };
@@ -138,6 +147,8 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 	DEF_PLL(".pllca55", CLK_PLLCA55, CLK_QEXTAL, PLLCA55),
 	DEF_FIXED(".plleth", CLK_PLLETH, CLK_QEXTAL, 125, 3),
 	DEF_FIXED(".pllvdo", CLK_PLLVDO, CLK_QEXTAL, 105, 2),
+	DEF_PLLDSI(".plldsi0", CLK_PLLDSI0, CLK_QEXTAL, PLLDSI0),
+	DEF_PLLDSI(".plldsi1", CLK_PLLDSI1, CLK_QEXTAL, PLLDSI1),
 
 	/* Internal Core Clocks */
 	DEF_FIXED(".pllcm33_div3", CLK_PLLCM33_DIV3, CLK_PLLCM33, 1, 3),
diff --git a/include/linux/clk/renesas.h b/include/linux/clk/renesas.h
index 69d8159deee3..ec52ce5a958f 100644
--- a/include/linux/clk/renesas.h
+++ b/include/linux/clk/renesas.h
@@ -153,6 +153,26 @@ struct rzv2h_pll_div_pars {
 		.k = { .min = -32768, .max = 32767 },			\
 	}								\
 
+#define RZG3E_CPG_PLL_DSI0_LIMITS(name)					\
+	static const struct rzv2h_pll_limits (name) = {			\
+		.fout = { .min = 25 * MEGA, .max = 1218 * MEGA },	\
+		.fvco = { .min = 1600 * MEGA, .max = 3200 * MEGA },	\
+		.m = { .min = 64, .max = 533 },				\
+		.p = { .min = 1, .max = 4 },				\
+		.s = { .min = 0, .max = 6 },				\
+		.k = { .min = -32768, .max = 32767 },			\
+	}								\
+
+#define RZG3E_CPG_PLL_DSI1_LIMITS(name)					\
+	static const struct rzv2h_pll_limits (name) = {			\
+		.fout = { .min = 25 * MEGA, .max = 609 * MEGA },	\
+		.fvco = { .min = 1600 * MEGA, .max = 3200 * MEGA },	\
+		.m = { .min = 64, .max = 533 },				\
+		.p = { .min = 1, .max = 4 },				\
+		.s = { .min = 0, .max = 6 },				\
+		.k = { .min = -32768, .max = 32767 },			\
+	}								\
+
 #ifdef CONFIG_CLK_RZV2H
 bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
 			struct rzv2h_pll_pars *pars, u64 freq_millihz);
-- 
2.43.0

