Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F18C8A293
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:08:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD5610E618;
	Wed, 26 Nov 2025 14:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="FipNyMf7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011060.outbound.protection.outlook.com [40.107.74.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E3E10E618
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 14:08:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OLiuksfu1iWINOcMQaz80vQNH+acAXU9mDdKxWfYEQ2mYwvmoQqUS2dGBORMkI9MsSAoJa0MR7bp7EtZytNYTn7+06vIHGGLZs6zqWoo5vLikOIX5kfBFCzIH5wA/v9xFRXuS7cH7bOPK27NcFDH/Ul3/HlRUvHP7hkPr5uHesoxWv3m/St4Yxon4WDVVHcDvT4q8IN29KsveSsG4zIPC8o9oukHnxiFi06G4gaknIDjifkKXeu+HnIzJhnBOsaVZRRqbW64xtDm+zdnf8eid8YPRfRy+zAHrkGQATFFeVzoy3hofgcVu94F3OOCo/o5lSNdtmebeuEidIPGcPEsFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pnl0HZ4KQMRSJk1sdWNigyzqpa71Zg4h3K3KxhL+38I=;
 b=UFutXFBnOzc04ukwCJg6rtbdSAdeOAJ6+G58hSRfDEVq53tr5fREdvXqO5JoGvU1Z5me1TP2J2OLR253o8iJm/OsC5zMA6DPsVUp+HhiyOd8Y6e5XXT9qDH7pDMg7S4IayV6d9rHdfm1q7gARjNDjSlL07IwE3gZpL6vvtYFBxB5xwF+egit7JnDteZ0P+W+4GiXu32b7Rj8ZbE7BLCGwU9/+ovhU5nvEbqALDEnjxRd1r4y9D+ak1oc6xGtoms/mPyK88D225dVSdeU8bv0lg488KmlJ7myBjPE0RwLRa4A8WegABfRS9IpbM/sek8tA6+Z/PoasJJfwifgAhgWuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pnl0HZ4KQMRSJk1sdWNigyzqpa71Zg4h3K3KxhL+38I=;
 b=FipNyMf7Skhgherh8Pa+d3XNZ/OGL9jIXTEPUj+dQ41ZxF00M+buG/Lc+m9qtoomybTgU+QyB2R+rFlT8MtR7CpwFwKpAU4u7F9eEJ1Fj2uX8tAjvTFEqRw4kI56LrNGZJ8nW6HEY/lI6JAxNG7GLdiiGC/QWrdmby4VhvtOKTs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB6804.jpnprd01.prod.outlook.com (2603:1096:400:b3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 14:08:35 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 14:08:35 +0000
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
Subject: [PATCH 02/22] clk: renesas: r9a09g047: Add CLK_PLLETH_LPCLK support
Date: Wed, 26 Nov 2025 15:07:14 +0100
Message-ID: <371314eb59c84965e73c4c225db386456d82b1d3.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: f42f90aa-7d8a-44c0-70c3-08de2cf54a29
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lFcWU06ht82Q9NkywqomTIBgOl9x3h4A8YwBcjFX7WADcD/mxXtyVjSlizeF?=
 =?us-ascii?Q?uHZn7Md4BJBc1w3xrBZlMmro2nRrnv6qmqj1tEHT+ipRxItp9Nxzl1IGqGkf?=
 =?us-ascii?Q?HvgOikufXu76UC+Mw8lTvfwcYTuqCyuwhgZfztdvsfLFYXuKxGaqOPFfhAHt?=
 =?us-ascii?Q?Kj4JwlNsC6BN/U1lhmbbJC3eT5jczZuHb13f5P0B6kYf0WgydG9DzSrzEkDf?=
 =?us-ascii?Q?eDdXlKjqICU+cInda1uvB01A1nnJaUahV+zVaf919jlItLwWdtoKYpLaLB5E?=
 =?us-ascii?Q?lHyf48cvmAyJELaV0Mc63G5D3qEZzYn2Hz2fZb7i7DZ0ZeBlhXBlEDkVqSJk?=
 =?us-ascii?Q?lseRQ+FBhNFoH1JMFTVVez+Tf/PFmIYkpm2wPR1bSwlPp9GWf5ZOARQ+jufa?=
 =?us-ascii?Q?gERqDX5AIrIYU9zzkLmD73ygu2iNBxjQiDu0dImdWSgNq1u+M+gwQY82MVd3?=
 =?us-ascii?Q?z1SjlwXhEvSd2ASt6kyvTldt6s9TQU0WPwJoLM+44rxvekU3XqSPeqmLpPud?=
 =?us-ascii?Q?ZBLvDoR+/tr+hRV8d1XHWemG0L9ZqrPUPdk2botE9qeSn4s6S6DEZ/ofJLXx?=
 =?us-ascii?Q?BMPlunHsTByb71J2QttvGR9znXCbzS8JIZf9q2jmgoAhxGNszgCeQsK/+LjW?=
 =?us-ascii?Q?1ulLQKseFi1Q9kFoSouScYREZbKjDQTa1Yd0wZvtpkxfbmrNrV/tpsrHL65p?=
 =?us-ascii?Q?RhzfTbf5uuResWbJvCCJBcMNA7CQ+N39cbor9FDWazKEzLXROvAWJkGk3mIf?=
 =?us-ascii?Q?E+F+liGkuaH8MuWC0QohOp3Kus2rvmzy1CzmKVjzR9OaTrcBv1rFZXpFNSeb?=
 =?us-ascii?Q?RxvfPhjTKZcOx/jjgdtXuP8xEfjr95PyQKsn1f3fEK+Hi+kE2zAueWsMj/hJ?=
 =?us-ascii?Q?1pdCuNtAlOVhCljiG+6kTXoeG8Sryu+C7quIMgNmy0qiec21wwJfKR6M3CHJ?=
 =?us-ascii?Q?fGGNdUlsrtopnHiSmYcmlt1OJqgq+LVpgYS7Nrtf6V//+ccZrqTmVab1z9Xw?=
 =?us-ascii?Q?2gkDpDPEYh0HBfoIMO/CaChV6/TZdyk/LPm92g4Q0eBPfwaK1Dbz4CX/L20b?=
 =?us-ascii?Q?ZWSoR+NuZED5RkqyM54RDy8caYGakNLhINrl3AEQSt5HLjdO3QaqO476f5pH?=
 =?us-ascii?Q?lisTFvjVuzc8nrsShmv1fEijlHIHHFamGfTCCMwcXYyXZomzSUYkzgOCVFuQ?=
 =?us-ascii?Q?QPhMlV+22pstAtXnm0NYdoFfm6nuJnvCL2HvunjVCTcSFnQ2jyHLsHCOTBFu?=
 =?us-ascii?Q?Zqlzf/z2edoHZlaF7UgWV4xmgLfD7O4Q4LCYJBlcCbKb/QlVaX83IP1ZvLSw?=
 =?us-ascii?Q?0zbyxFKI0HsRoFNOZqQVr9Y/R/Q8Wk9Dqok3E9vcK1zWv1AAq4g40YvvYcgW?=
 =?us-ascii?Q?zXLKgC1DpNYB9ZgOvgn1DKFJfq3XbqnbOuLa9rAbcpI26+1PxlWDl7wiU5Bh?=
 =?us-ascii?Q?0L8NzM/vFROpzWbsgGATQN4o3o0d//Ejg9WUQSSCM16GKqb/GYvm7OHCptdD?=
 =?us-ascii?Q?UQDVoJEQjjXnia5xMDLMWm4YgrpxnN0SoQGU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FQqhMMqmT9Jcq+xRsqm8m0vZ54avY1BuyWomPp88D14kTPKEMNuiAa74xtZb?=
 =?us-ascii?Q?GNLo0Kuip7o6VKbLHAbDFJuKLCA6ZiAq5iCToCs4pJ6MtMo9NrhaOoCECDMr?=
 =?us-ascii?Q?zP+lVOr1QLMm0KC2ZrY6d2NN9I9R1DBMlYCuJjnnxgRgJHxLU5l6dxjKTtwN?=
 =?us-ascii?Q?EmA5LW6bY3qqFpvnuQzFkFvcgRtf9l78AqgGeoQeF5x/BbyKY++sfl55T7un?=
 =?us-ascii?Q?fKBq/Pn8eM96KrgTMs9U3MaTlHTj/Z6FN+FEM0dVZDOb/kwQKJwZhMXo+6FC?=
 =?us-ascii?Q?sOq//cwhozQnWrTnYDMWCy3zjNqVZ8aCwWEEN4rXJKBqisBUQvF8IB4P7DPy?=
 =?us-ascii?Q?eIDbD0qoVwQk7PDAweZEEcXYrHJYotarvYsFV8tWf8b339JRn3GowLsoWVf8?=
 =?us-ascii?Q?+0QXcPbpYkHDZlYItcwrcMLwuiXGS4cm/5S3fNQpCWnOa1RxCYdM+ZGyA1H+?=
 =?us-ascii?Q?KTbT0eqCDxDhyidTKpZFqLVbnup7l+dPlIiHC6+WVVTjI2c7nhVCzbuhilvl?=
 =?us-ascii?Q?cCxxCgfqaSLPro0XQ+wv6jyPtMpnCrI45KasYIcQEAozoptovTObcIJmszq9?=
 =?us-ascii?Q?BsZmdlqCkPuTLDqKbQQGwDxG0fRjMaDNWFg1h1jZpa90l+tn0SDU4glhn9Rv?=
 =?us-ascii?Q?gGE7c+9iwkUDrngT/W3JUinY5P4Fik0pyvfsHlUT2EdYZZnqye2bc1XRhNCY?=
 =?us-ascii?Q?ZA2vNtSNkpJYRycYVpV7LKb3mss+K6/F5+RfJZRycwz0G7jE44mfOi8rOsMC?=
 =?us-ascii?Q?cj6DmGJn13Kd00GjYZTILBbCSfsBkH/tiywl+fNQr2uiQQ1ZQG8+mm0idTr5?=
 =?us-ascii?Q?WjT90JA8gUx5O4Cdt3qZoVU1EfoFCz+8kxLnrEV0l2ruM27o4ylGujMgckpj?=
 =?us-ascii?Q?b/e51Gw3+PR1Gor3VacjRVcmiPSHxMMEqSP/yC4XROJ1awZOE351CjpPQd3D?=
 =?us-ascii?Q?eYe/s2WzZJ4YKfkEPRJ8OfLyaGmju8hMIe6syVkpICR+Mp/lP136nnE3Rehc?=
 =?us-ascii?Q?By+YOZ42lMOLCj42h5v3j36wP6utCl3W6Ny5InfOBQ3ePn5bYRsEEtaFLB36?=
 =?us-ascii?Q?NwvbFMo4DbOz4jMMitF2+h59OW9X8I2E56WL1yDLRIIk6wWNT5ggLCG91JEq?=
 =?us-ascii?Q?LmP4g13Mj8OvJzKnIIvSVfDIWsu+v6dsQC32Gj+T+lV8fEBxiXqGtOUdGBv0?=
 =?us-ascii?Q?lEaKy0ZY+zY0NziEYRbIDFovr0yeT++fpY2miI8rie+2MfJOotPsDnHfaCjJ?=
 =?us-ascii?Q?dYOVbyvAnhH8O86LlhWnBbwsc54V80pCHH1+cAYqXt7GIWRSrn7kTUGgaf+s?=
 =?us-ascii?Q?MblPkfiaqvVdoEyZNzHEyHQYdFXk91/dtZ7FlOjPpOeG5OC++6IWNzqJGDOm?=
 =?us-ascii?Q?GlHS5BGFOh7LDu2vBWu/H/JgvFXfwm1Oq+SdL7uXUaEsGg2Ekw65kOnB+7Fx?=
 =?us-ascii?Q?7M/Ri8edSfgR6Eg7a9thUEUbnEuUuM4y1LxjRnrwUbCE2fgJcbByixXv/qzs?=
 =?us-ascii?Q?rsP8OBTfEC97qN47qpdfaVdpiN4Hp6VaQ4cC1Pz9j9cBrmMhlPeCp4SjUaz9?=
 =?us-ascii?Q?+G/MsCpcaaKwHfHYGO1//PGqmVZNKPn4c0rajH2N9G+WkCqb7ErfN6ZILJTg?=
 =?us-ascii?Q?mavm82AHChnNS++IqbYJ60M=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f42f90aa-7d8a-44c0-70c3-08de2cf54a29
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 14:08:35.6815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7INqJEBntVrOENzaT+irKIjjvDi6fqxphr6W5yQQZXEQ975szrdJEqkILOb//fHCnsIcu3EkJuAkomhsepEP6LHrPctGtE9LQgOKIS/pWjy3dC2EL5kWLodNl96Knv46
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

Add CLK_PLLETH_LPCLK clock support.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g047-cpg.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index 1e9896742a06..a73d12d4964a 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -64,6 +64,8 @@ enum clk_ids {
 	CLK_PLLDTY_DIV16,
 	CLK_PLLVDO_CRU0,
 	CLK_PLLVDO_GPU,
+	CLK_PLLETH_DIV4_LPCLK,
+	CLK_PLLETH_LPCLK,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -107,6 +109,14 @@ static const struct clk_div_table dtable_2_100[] = {
 	{0, 0},
 };
 
+static const struct clk_div_table dtable_16_128[] = {
+	{0, 16},
+	{1, 32},
+	{2, 64},
+	{3, 128},
+	{0, 0},
+};
+
 /* Mux clock tables */
 static const char * const smux2_gbe0_rxclk[] = { ".plleth_gbe0", "et0_rxclk" };
 static const char * const smux2_gbe0_txclk[] = { ".plleth_gbe0", "et0_txclk" };
@@ -171,6 +181,10 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 	DEF_DDIV(".pllvdo_cru0", CLK_PLLVDO_CRU0, CLK_PLLVDO, CDDIV3_DIVCTL3, dtable_2_4),
 	DEF_DDIV(".pllvdo_gpu", CLK_PLLVDO_GPU, CLK_PLLVDO, CDDIV3_DIVCTL1, dtable_2_64),
 
+	DEF_FIXED(".plleth_div4_lpclk", CLK_PLLETH_DIV4_LPCLK, CLK_PLLETH, 1, 4),
+	DEF_CSDIV(".plleth_lpclk", CLK_PLLETH_LPCLK, CLK_PLLETH_DIV4_LPCLK,
+		  CSDIV0_DIVCTL2, dtable_16_128),
+
 	/* Core Clocks */
 	DEF_FIXED("sys_0_pclk", R9A09G047_SYS_0_PCLK, CLK_QEXTAL, 1, 1),
 	DEF_DDIV("ca55_0_coreclk0", R9A09G047_CA55_0_CORECLK0, CLK_PLLCA55,
-- 
2.43.0

