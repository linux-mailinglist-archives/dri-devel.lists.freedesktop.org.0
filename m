Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AED14C8A287
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:08:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0674410E624;
	Wed, 26 Nov 2025 14:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="LJho59Um";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010050.outbound.protection.outlook.com [52.101.229.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC0110E61A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 14:08:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PMrWr3dQkwHUercvvQuKojDksPz5rVHmpGQJY1HmaLPF70I2mDUe2KvcvUnVm8wDbpktVUHrZJtsL/BzUS0m+GDzOU+2UlxaMA8vMoLZ1se5a2InxXBxLpjNhis3pXAbAYVRk4rnEkexD12AsJbpLD2y81vRc52RWbm+Z0FRLdJ3WejAXLASqHt40v8jeBJZghDItqGgxR6oGMkv7OX1F4J+Z0hXOsohmVzGJ4BKMAj+qHpd7nIKpyfap6x34KQQv5bakuswr3wailws3EsVU9N3fwMhPSoAy244YF6F8kUYRwUnbn05fS+/2sz+uKkA+JKFlTTGhr6oXaegh2Qlfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZHoOdB0dMxfiAqZmeOhFF++PYK/tAlPT5spqZB52HpM=;
 b=e+R+8zF5vXB4692uAaHeJasG9fe182L1wigfYXKAOQVtZV0LxBtRV53rPd0VLcy9y4fl6TpNk3rSayzGjkdpG7TF6uhnTxGoDKyjMg8Xfp7zXGO9wPD2mdzeuY22eFOFyMn7mxBDfpHtT6bEiVEcadxdUMzPXPoCxswm61YKObC7AInUGk7FnBAn12DEEWlyXZInTRWckyA4JextaWuYBAPKxUU0kuZjYftp4jPX/qvcOpOUd1Sa/pWhKz5MOFovbq9e6AGXs9ddRbQ8YpzCIhK2m8fdd8jQbRXwqoU9JeWWJGOq1phcXdmhwH6mb5hqNE7PzlGYFny4VFD2pOKmJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHoOdB0dMxfiAqZmeOhFF++PYK/tAlPT5spqZB52HpM=;
 b=LJho59Um24xURgGMKSkc8s5qbfKRshXCQLNtCRONyE3yYQD8iQnjsMZLGEnGjbT7uf+7oh3s8Rw+vfLgpMowMrSFYYZ/AfBiT8W7N6GG0pIrwEbRCckaP2PnsnERwtO2lL7tvVKPevDvZxWrEbmhwAOe5zRfPruZV8EYIjJSmgY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB6804.jpnprd01.prod.outlook.com (2603:1096:400:b3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 14:08:27 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 14:08:27 +0000
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
Subject: [PATCH 01/22] clk: renesas: rzv2h: Add PLLDSI clk mux support
Date: Wed, 26 Nov 2025 15:07:13 +0100
Message-ID: <3ab81490b7bdbd2dafd7a940ae242f07d30aaa17.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0655bfca-332d-4800-81da-08de2cf5450b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aXIQjYZ4CMFOGmw88tB/hB0JVQbbJSliEwzBHIVvNplQI2+nOL0HdZbp/exn?=
 =?us-ascii?Q?HVmzFDzOIu3l3TAqx0uMrt8p2gTiSQcUc2xaUEfk2q+1451kPw1BsNyvLHtR?=
 =?us-ascii?Q?xO+H1cjWzMZvErf0VECWUp3W7ZXgThz6Enssf4JH4KepzXPr0CI4n+WlWXHi?=
 =?us-ascii?Q?XFPVeFa7JKXoKWBuPvDjah2K+I0k13TvwqOD34foPa1Jci2bTROPegshuo6A?=
 =?us-ascii?Q?/xAmGQPUTiai2PkdYlciy8Yq6Bhk73Nr7xJXJcaoTOIHcnwULcGer79ylTkB?=
 =?us-ascii?Q?wX7DlWHuczSzNg20VvaKlM0VpF71K/kcR7mAsQPKVOOYovoOUG9DnBz7g4yw?=
 =?us-ascii?Q?6ob5+bJjc94ZgCsHneyXC7OMHSwT/nbmgXM8Jii9uY2H/+8vZcJnI1XYUaUT?=
 =?us-ascii?Q?e4/Athuv61/e0AjdUzZKEkLRxogsaDaAxHTH5Wpd1T00iKlMAR6/5INktX4F?=
 =?us-ascii?Q?bBadmVgNT2RH+ZK64/5q0MLcB/gJ4BuKXWxKQISzBENF3NpEq1OrWjd8E0r4?=
 =?us-ascii?Q?SUb+VytQNAdqWOkuf3xuLj0AjcNOG/GfzqupnZn8KrE8K0OjuXOqV0AzYxSp?=
 =?us-ascii?Q?VGnpb7xbhRcqGQYxBVfP0L4m8ki3kJ8yzOSOAbZJXKrngwITtQ/iy/VsNA5H?=
 =?us-ascii?Q?uUcGLUexy0nBF2YlxTw4ljIwabZfjsiqoim7HOM4agU1EMKq82c0hnIcAzho?=
 =?us-ascii?Q?P1jWH3IvlimKtYtmva32IFR8EvcsrncavrcMAf3zAisR/9CBVuG+vP0OLU7c?=
 =?us-ascii?Q?NGHSoOzJ5JxOLvSZl6rLLiHjF2kX+vImeQF0xwFqeY6HHFmI79etBrjJypvk?=
 =?us-ascii?Q?EwPna1CHbj5VKjkrsH553sMTvDgTcIIPDR4m17YCAwV56BI4nmgTL+kidtoW?=
 =?us-ascii?Q?WZzhFjras4IlTGbSVt4Ka2AbtLby3kBwekzkFb+DywFycqBGZfHv3fzeucDo?=
 =?us-ascii?Q?BvM+wkQ3McTgLiwl7OS+Vu3orwOp5eXWmk2DT/xgDBJBMGoF5uDwFl1NNdCf?=
 =?us-ascii?Q?rTTd8qVym+s0hrnFmjTdfpbHi81Q8NaF9q1oOmlRbY5LheozMUVXds5M2QU5?=
 =?us-ascii?Q?xaoSBXlEuA39w4nLzPQtKLmNlEDZQhvq0dIiG89aihASaVH0Jqc4KDJDpbQl?=
 =?us-ascii?Q?E9vy5nnE+pGJez3L2P5Pghv8ZytIy3Df5agjrD/1pYQvFF+/q0ewG5SbWD+b?=
 =?us-ascii?Q?fXS5MiHkWtta+ypwjG3JsGqZG0FgNAWXYESplgkioNS0MBxFK9YkezLBfF3P?=
 =?us-ascii?Q?Kb9IYJ8jgY3BWjdOM+PfktBo0KexWHw9zBhxwbWE2qEG/VYrSCtjra7CW7eE?=
 =?us-ascii?Q?TYvDddIsMxyGP7BfWE2N1yrb4O6cbIQvCKiqKCeD9o94dhipjB/AILVvhQ6g?=
 =?us-ascii?Q?BiAiauibJv0DnvgrkNTFrrj7QWj1jT9yV6VsRWzNLM5JN5rUMNsVdqlZDG81?=
 =?us-ascii?Q?W0mmRikam3DTaV2sdbSF6DfBvdqbDs0kLaxOribUBDePpiKSfP8xhpWcPtAL?=
 =?us-ascii?Q?N+9/IEXWaI1y8/oMmnAMfXqiboc9DrFptgjc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HkG1YqHgxnINbzPwWSdVYszTKfBGABKqzNwebt2Shr8j/XUdoXBTRIA26y5z?=
 =?us-ascii?Q?OVFzSVrSx0JV+viK3lZjDVKoaBiniGs0UHEMD52I2KgxFZMoj0Sv4DE+xDxm?=
 =?us-ascii?Q?8cfqgXMI3nRt6BKUIKqYj5LjXiArYjgqJs2+8HBzBY9K5uuG6DGA5+j16cFu?=
 =?us-ascii?Q?vmHBjJLsXl4TUUa9XIxKqlhtRbY2kIUizua44z257wJCpnGPYS6zQJnFPWIy?=
 =?us-ascii?Q?I+k73OWRrVomKKOMWqvWvw9ls6YgJkCPNd6zSeDhJSMZUDvokpl+Q3uYT/gT?=
 =?us-ascii?Q?Qxoq+f5MaLJHzlKrLxQof5uVhQFEPOry5R63hjbY+lw54gkXeFDK2UcxrG9Z?=
 =?us-ascii?Q?A43GAU0ttx/3bR8BNpWUGcmkU6PTKvdgvEIxF4bJKqoohAoiug//YjHhOKAS?=
 =?us-ascii?Q?/NhbzFPuaGcuuGkms4s6VdN4hU1jwesQOLeFbby2Iy6f3Kri4T8mgTnLSqUP?=
 =?us-ascii?Q?gXo54Tkg4oXjKZdInVdmEPjAPmQQH/NtV23WfqBFqswkUR/tZrdqYvmaGZFR?=
 =?us-ascii?Q?+J0ESFM48PHqZ/bkYvj9gnHRDF+qlIdY8LGnFP51ifdXC4jw1hDX5tW11EXe?=
 =?us-ascii?Q?IEujUpOV+tm3CzqYVPcHnJgaIKlv51YUaCz97d+MZt4WPTWO6fUtw5hVD3mz?=
 =?us-ascii?Q?2SXbaoQYl8WJp3IAvCsVoJArmNRZDwbbBPh7uHGT1KjdkaFDGkf/fkIE7HXF?=
 =?us-ascii?Q?ulUg22bkvOn0OkIRovZbUQSE0439qPZWE4Zpzs5jnjYZIpSfg1irP8i+tguT?=
 =?us-ascii?Q?QkymnzQbxj0OJ6i/b6UoOm/xR/yGWisukZCdGKUck70Sr7wKSfim8BsyJvwt?=
 =?us-ascii?Q?x4VhZRCryyC9SWiRwJyR6LgDnCE65iQulB8qxQ012pNQnZOJc1BRn7lrpbA4?=
 =?us-ascii?Q?vn2yXgIs1iMK2hT+ptBAoT5X/PHuwa2SH/MXHUfWdXoUKZ1IIWJECqzskw52?=
 =?us-ascii?Q?9FlxTdPfxUT43832kEOhT7Ue9lPfunytB3nG65Im8F/eIic7h1VRkizmN5Rz?=
 =?us-ascii?Q?8AwC7FFhsoDPxeR7wu1FYHJ9piVjxiB77skUMZUEz6HuRqQoos38rW7Beh9V?=
 =?us-ascii?Q?eMXK9c4PklbLNqyzFLVnqIx3KwfRBZvaOi+sVd7AbJPmodGDs7IQ/1yvvhTi?=
 =?us-ascii?Q?ROve1YoNsU7UHKzLaoWL/snMvWFcgLHAMkcHtAKivZ9xu/2XFWlVruS75UrO?=
 =?us-ascii?Q?OB5go7noNllG6GT7yvXX4/g3/G6DGfXBctTQjL9F9OZic56FfMEsaRSXFdiv?=
 =?us-ascii?Q?4DKRVZzX/RoElSnoVlyVLUk6ukJ/leyLyRPRWiCXH7XJ725m7eFyTSra5RzO?=
 =?us-ascii?Q?XSFpN7Cc9PZ04tQdSAKW0cERNd+jQrG+fxI3vREAab62rUJIK/hfN/b/9AGW?=
 =?us-ascii?Q?7XjbHfGqbee+VP+ozKtiJ45Adjy8/zmU4GSS/hy8eVNVTsqST1yag3kq5KbJ?=
 =?us-ascii?Q?BrWhkOFsTQLYxYd5mvtLN7c4YPM6Lc1OhmBNc3KgaLjoMhcEQ/Z1CM5QWBP1?=
 =?us-ascii?Q?nA2OrhbasfmOMWLwPTDkb/4BDgGovBOOyWVE4hFcLVG+K3+52hfSR1DAA9lI?=
 =?us-ascii?Q?ohJ8WricqtzqRs9EI2FMd8o+lMRM+zDsfnmZf+eAyxj1MMEfvwHGVkMG+pmi?=
 =?us-ascii?Q?VIQQGAlNpAKn9uIuU8Kz1yg=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0655bfca-332d-4800-81da-08de2cf5450b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 14:08:27.1073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 750fqepFe9nQYko3z1kUHVIh7RUjfDEaE2dFx+PJUC4QDpZqxDiBvjMsiAyMqR0kyQl5RPOUras60LzpZ7/pUX8qOmttram7uL5sAkCGFGxnfSbFIPkaQaJoGrlYCyPc
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

Add PLLDSI clk mux support to select PLLDSI clock from different clock
sources.

Introduce the DEF_PLLDSI_SMUX() macro to define these muxes and register
them in the clock driver.

Extend the determine_rate callback to calculate and propagate PLL
parameters via rzv2h_get_pll_dtable_pars() when LVDS output is selected,
using a new helper function rzv2h_cpg_plldsi_smux_lvds_determine_rate().

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/clk/renesas/rzv2h-cpg.c | 131 ++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h |   8 ++
 2 files changed, 139 insertions(+)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 3f6299b9fec0..dd782fa269d7 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -418,6 +418,20 @@ bool rzv2h_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
 }
 EXPORT_SYMBOL_NS_GPL(rzv2h_get_pll_divs_pars, "RZV2H_CPG");
 
+/**
+ * struct rzv2h_plldsi_mux_clk - PLL DSI MUX clock
+ *
+ * @priv: CPG private data
+ * @mux: mux clk
+ */
+struct rzv2h_plldsi_mux_clk {
+	struct rzv2h_cpg_priv *priv;
+	struct clk_mux mux;
+};
+
+#define to_plldsi_clk_mux(_mux) \
+	container_of(_mux, struct rzv2h_plldsi_mux_clk, mux)
+
 static unsigned long rzv2h_cpg_plldsi_div_recalc_rate(struct clk_hw *hw,
 						      unsigned long parent_rate)
 {
@@ -649,6 +663,120 @@ static int rzv2h_cpg_plldsi_set_rate(struct clk_hw *hw, unsigned long rate,
 	return rzv2h_cpg_pll_set_rate(pll_clk, &dsi_info->pll_dsi_parameters.pll, true);
 }
 
+static u8 rzv2h_cpg_plldsi_smux_get_parent(struct clk_hw *hw)
+{
+	return clk_mux_ops.get_parent(hw);
+}
+
+static int rzv2h_cpg_plldsi_smux_set_parent(struct clk_hw *hw, u8 index)
+{
+	return clk_mux_ops.set_parent(hw, index);
+}
+
+static int rzv2h_cpg_plldsi_smux_lvds_determine_rate(struct rzv2h_cpg_priv *priv,
+						     struct pll_clk *pll_clk,
+						     struct clk_rate_request *req)
+{
+	struct rzv2h_pll_div_pars *dsi_params;
+	struct rzv2h_pll_dsi_info *dsi_info;
+	u8 lvds_table[] = { 7 };
+	u64 rate_millihz;
+
+	dsi_info = &priv->pll_dsi_info[pll_clk->pll.instance];
+	dsi_params = &dsi_info->pll_dsi_parameters;
+
+	rate_millihz = mul_u32_u32(req->rate, MILLI);
+	if (!rzv2h_get_pll_divs_pars(dsi_info->pll_dsi_limits, dsi_params,
+				     lvds_table, 1, rate_millihz)) {
+		dev_err(priv->dev, "failed to determine rate for req->rate: %lu\n",
+			req->rate);
+		return -EINVAL;
+	}
+
+	req->rate = DIV_ROUND_CLOSEST_ULL(dsi_params->div.freq_millihz, MILLI);
+	req->best_parent_rate = req->rate;
+	dsi_info->req_pll_dsi_rate = req->best_parent_rate * dsi_params->div.divider_value;
+
+	return 0;
+}
+
+static int rzv2h_cpg_plldsi_smux_determine_rate(struct clk_hw *hw,
+						struct clk_rate_request *req)
+{
+	struct clk_mux *mux = to_clk_mux(hw);
+	struct rzv2h_plldsi_mux_clk *dsi_mux = to_plldsi_clk_mux(mux);
+	struct pll_clk *pll_clk = to_pll(clk_hw_get_parent(hw));
+	struct rzv2h_cpg_priv *priv = dsi_mux->priv;
+	int ret;
+
+	/*
+	 * For LVDS output (parent_idx == 0), calculate PLL parameters with
+	 * fixed divider value of 7. For DSI/RGB output (parent_idx == 1) skip
+	 * PLL calculation here as it's handled by determine_rate of the
+	 * divider (up one level).
+	 */
+	if (!clk_mux_ops.get_parent(hw))
+		ret = rzv2h_cpg_plldsi_smux_lvds_determine_rate(priv, pll_clk, req);
+	else
+		ret = clk_mux_determine_rate_flags(hw, req, mux->flags);
+
+	return ret;
+}
+
+static const struct clk_ops rzv2h_cpg_plldsi_smux_ops = {
+	.determine_rate = rzv2h_cpg_plldsi_smux_determine_rate,
+	.get_parent = rzv2h_cpg_plldsi_smux_get_parent,
+	.set_parent = rzv2h_cpg_plldsi_smux_set_parent,
+};
+
+static struct clk * __init
+rzv2h_cpg_plldsi_smux_clk_register(const struct cpg_core_clk *core,
+				   struct rzv2h_cpg_priv *priv)
+{
+	struct rzv2h_plldsi_mux_clk *clk_hw_data;
+	struct clk_init_data init;
+	struct clk_hw *clk_hw;
+	struct smuxed smux;
+	u8 width;
+	int ret;
+
+	smux = core->cfg.smux;
+	width = fls(smux.width) - ffs(smux.width) + 1;
+
+	if (width + smux.width > 16) {
+		dev_err(priv->dev, "mux value exceeds LOWORD field\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	clk_hw_data = devm_kzalloc(priv->dev, sizeof(*clk_hw_data), GFP_KERNEL);
+	if (!clk_hw_data)
+		return ERR_PTR(-ENOMEM);
+
+	clk_hw_data->priv = priv;
+
+	init.name = core->name;
+	init.ops = &rzv2h_cpg_plldsi_smux_ops;
+	init.flags = core->flag;
+	init.parent_names = core->parent_names;
+	init.num_parents = core->num_parents;
+
+	clk_hw_data->mux.reg = priv->base + smux.offset;
+
+	clk_hw_data->mux.shift = smux.shift;
+	clk_hw_data->mux.mask = smux.width;
+	clk_hw_data->mux.flags = core->mux_flags;
+	clk_hw_data->mux.lock = &priv->rmw_lock;
+
+	clk_hw = &clk_hw_data->mux.hw;
+	clk_hw->init = &init;
+
+	ret = devm_clk_hw_register(priv->dev, clk_hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return clk_hw->clk;
+}
+
 static int rzv2h_cpg_pll_clk_is_enabled(struct clk_hw *hw)
 {
 	struct pll_clk *pll_clk = to_pll(hw);
@@ -1085,6 +1213,9 @@ rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
 	case CLK_TYPE_PLLDSI_DIV:
 		clk = rzv2h_cpg_plldsi_div_clk_register(core, priv);
 		break;
+	case CLK_TYPE_PLLDSI_SMUX:
+		clk = rzv2h_cpg_plldsi_smux_clk_register(core, priv);
+		break;
 	default:
 		goto fail;
 	}
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index dc957bdaf5e9..5f6e775612e7 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -203,6 +203,7 @@ enum clk_types {
 	CLK_TYPE_SMUX,		/* Static Mux */
 	CLK_TYPE_PLLDSI,	/* PLLDSI */
 	CLK_TYPE_PLLDSI_DIV,	/* PLLDSI divider */
+	CLK_TYPE_PLLDSI_SMUX,	/* PLLDSI Static Mux */
 };
 
 #define DEF_TYPE(_name, _id, _type...) \
@@ -241,6 +242,13 @@ enum clk_types {
 		 .dtable = _dtable, \
 		 .parent = _parent, \
 		 .flag = CLK_SET_RATE_PARENT)
+#define DEF_PLLDSI_SMUX(_name, _id, _smux_packed, _parent_names) \
+	DEF_TYPE(_name, _id, CLK_TYPE_PLLDSI_SMUX, \
+		 .cfg.smux = _smux_packed, \
+		 .parent_names = _parent_names, \
+		 .num_parents = ARRAY_SIZE(_parent_names), \
+		 .flag = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT, \
+		 .mux_flags = CLK_MUX_HIWORD_MASK)
 
 /**
  * struct rzv2h_mod_clk - Module Clocks definitions
-- 
2.43.0

