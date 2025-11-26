Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D06C8A329
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:11:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6111B10E62A;
	Wed, 26 Nov 2025 14:11:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="U0B/9JeT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011018.outbound.protection.outlook.com [52.101.125.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C451E10E62A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 14:10:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W0VxvpP4FxSHWGgTsHBpljxBG2ACQQDJnLpSfihYmkUlpQnxphUgtvRtQOIwjuKbfZiWzvNlyG8ZP0pQKQIbRU/uo8SxBX/daGG24b4sEYmjuzKCvRaCWtFfzSMR20qSXAf/9lLiVCkgj5SYBaWZODJu2A+zmQBNQUUB4MUZ8RdlepXnrTIX3AnPg5jyfflHb+AuVzCa2OuDMes95IRGlmx9ouRhw/0hFQg8n995+VTv1AfYkYXhWgM8M+Ybz1ylFGAmqCIYHf9Y5/1HbPZrxbigPgpZnGnscXPl+oivS09LEYpxc1niYSo5hz5ks5dqeMDrgQkUhAUSF31iSX9vDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XhL0MoFqs0MPZgTvXyFHvq0EiF5HDTGkWdOpFvbcQw=;
 b=B9E5/eZucur0Itmkmlt7xCMTUs2Seg2xZAoazml/4f5Isc//FCmAGT1OxzZDiVTp9mmhTrkXL6b4nI3UxiT/1J+MtjOxox6juBH9M7hnB11xQVPQ6lzG+D0Osssb3JylnoKe5S4GuVG8P9RRSEauMHTVD+Tl3PUdrnEkjuV2he8LvWQTvCasjCghVl7HOthjlVZEaZA3Zw64zAuNfb9WXWGrx5UefUhPfEh0mnPQGnZzTI4JxQdar29jHqFrqlrAajc8SoHbinGYWaR7At3Z6rGOWFdVvPWKbSroTHH1OUiLl6Qh+YViQuAIgLpIUdw7jNUdFkALG00MI+jKSgh8BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1XhL0MoFqs0MPZgTvXyFHvq0EiF5HDTGkWdOpFvbcQw=;
 b=U0B/9JeTszac+afhGfLnG+YP+JTZKBTt6Wzn3QMtvJPn19XEF/IBlkXhWnqtAlgW1cWwIldEnseodiEeyvKrcF/eXk2z2aeZ5PxkO+23tzB+rdrkbISZNkhBZorUpz1E39+lj+/gvuoO4ZGI4qed/PLYfgKyuwo60WEx8qe+xDk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYRPR01MB12821.jpnprd01.prod.outlook.com (2603:1096:405:1b6::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 14:10:56 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 14:10:56 +0000
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
Subject: [PATCH 18/22] arm64: dts: renesas: r9a09g047: Add vspd0 node
Date: Wed, 26 Nov 2025 15:07:30 +0100
Message-ID: <8a2f65d0888a6ce6de94e9df0bc4593b9dde107a.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYRPR01MB12821:EE_
X-MS-Office365-Filtering-Correlation-Id: d53e4a80-ed9b-431c-aac7-08de2cf59daf
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p9kQjGOCNO5yhIx1jQggYBSItS2X0fm0nutLeKbn6eFZ4kkg1IQbKY1mIqVg?=
 =?us-ascii?Q?gVyIhmPdWjpfL6xM1LSb0MwFlbO7wDBX9ATJa+ARXe6K9fIcyP1qfQ+Q23Z4?=
 =?us-ascii?Q?7Ym56KmI0sZKu965RU+S51C63njHuRyC00VB9QAE5OxllWUDrXMflwqhz/gK?=
 =?us-ascii?Q?1oFHbWQaL1UConiSuLFElMtmlS5v6ehDAeYJeqyLyB4E5+pBZQ5hjSF0FBx3?=
 =?us-ascii?Q?Tf6ErwRy8hv1XUQ26NcQp3EFRTr7RofIca/jo6QYk9kLm6ZgCtRAesIasyzw?=
 =?us-ascii?Q?puV5A7vacgqfT+y/0qKwYHF3NwFQjlGxLCBxSO4s0f61K9FKA0AIXdJ7tBcb?=
 =?us-ascii?Q?k0NcllncaVH5sqFWQKUAESgfXgvJYAfrkjp+xS32GEk+SrS66qwTh+OAblzT?=
 =?us-ascii?Q?UuFdSEBRUyxY1ipmm6bNCyrJtaAbp1UEPa17Hs7iPbaOTCv0TWJDvI+6hhUs?=
 =?us-ascii?Q?P60DF2Qf1HH4RhwbvH9x5VPGnkaOIrNsWqX6RtHtdQdq5aIfe1d+7ETQAufE?=
 =?us-ascii?Q?jGhTfXNN8DDo1QG3C16ZVY+1H7ii8GAkanBjUQ2TDWvgRTczijMutz76SlvC?=
 =?us-ascii?Q?ILvZJPUAzw4lkKVS/YsjzHas66zY517XLJYg7C8zkWQAxezEiRxK0C+OdI1F?=
 =?us-ascii?Q?tbDAuRResV8J5aQbhprjJEN/EJoHV1jEt7rvg0Jzb/y9X85+uKhjgBQWA1Te?=
 =?us-ascii?Q?mbMvlBzNHdN0Q1FIqkNZ1Q0cyHIOFL1tAjSJilX3DgBSp6XEz4u+Z7UusUcx?=
 =?us-ascii?Q?KcdpB5ACbsy1xVYSWKPjSb8xhxlHC+RsMI+Q1WOlzRQrWKgGLOpeYY2HDqyK?=
 =?us-ascii?Q?oXpjpoJLKlZDjoGLinHob5WUiAInBRTp76spCENASgb3DZBBfdVEH5E98TyE?=
 =?us-ascii?Q?OJeRDJquTL3AtFUmSrukpeR3AlWhhrlDlDBfnSu6RADhSMYLb6X2sLCtMdIc?=
 =?us-ascii?Q?1Ay6XOZa03shfpIWPh3XGv4vBOtvt3Mo0cZ5LI439lgJG6Q642n2nQwDI4k4?=
 =?us-ascii?Q?R8WltPin+rgi80iv31qf5EZVgPabiIVzSLTXUvpJ/PCrKCcI3FAjrsAKWBk6?=
 =?us-ascii?Q?JU1y86DwW7yHCRKbRNKSufgWotiW+bg5LIwc2UBvijXmlA9ETgrV4EREDbw7?=
 =?us-ascii?Q?dluzw+kBbKrwfnbWVgmO+jujdnqGheiZa3LcikhZAI2nkvcxiw7UTUNzvyOo?=
 =?us-ascii?Q?KC1gCeMKOS0UqIvzx9KTt8EL6+94p5u9fORyQBQc7Qb5rUOLs/zSGXJBqqpq?=
 =?us-ascii?Q?4fWeFIls6I5+F0ElV8qg4oOLpOLhBn5OYJIu8Qm8VOKQSUMe2PLPmhyUOmoq?=
 =?us-ascii?Q?DzOAzr/Thkio/BqxyiHTChthtvgaUDc15wLnShK3RwiulD6WM6fDf5tTemyq?=
 =?us-ascii?Q?BD2qoOXTxaV2Pk0LB1lqvxL04lkXprWuWDqrKIWKA+q3tBFCHVxLp/lB5+0e?=
 =?us-ascii?Q?NAYqTZZI8+J/bA1FXHPg+YzipheH9Qy0Jh6myBop5FKPtrO+K3YCGigyzmoL?=
 =?us-ascii?Q?52vVtuSjETNktA8EYC4M2ZYN112SvvSy1Hgp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SA4fDkY0bc4s05apwjTGSlg25rjMPrtNJHmGBZ7F+9iDY95+w7SIU7oZDGtV?=
 =?us-ascii?Q?ig3PTQGjdldP0KoWcf/b8ufz4iE1LbHRvPkghSsbeBrDzl5EcwUD9x/mQpbU?=
 =?us-ascii?Q?EwGSBWdsBBLsz//6Em/LuFwrVxBAz2zwWlRJeFLYL+CMktCQj5vVvg0DoQIU?=
 =?us-ascii?Q?yCXE8Ne/hUAp20es/6RHVRu5VTj7rHDPPNGiuRPfC0BPyJYqSZ0CfAAOIyZU?=
 =?us-ascii?Q?Rrq7niAX2Tf291Vd0MBTmuQkXdY5Y6Q1SVWi31t5vVxUrLVe+ko0qhvRrTMD?=
 =?us-ascii?Q?+WPeeB/koseMf+x5KTAqKJV5cqWztrLaQJz79o56kWSwdH1sa3UFAZNzHUhC?=
 =?us-ascii?Q?Ae5Ihi4aolNrJfyeDLW3iuPmSKR4SfZqyjT/+qi8U8CO2npTOPH6FyzcwWCR?=
 =?us-ascii?Q?WKDBiUCJosRvsd28rkeOe7y0BXpd39KuGxK3qVr54sW7IahhdwmykOqlw6c7?=
 =?us-ascii?Q?ljKzalHWkhC8t8sXFIxqc7Y0nEnEMdJRYEfcy8PTCFT7OSC575ugN46qs3gs?=
 =?us-ascii?Q?afF4u5JY8kyAYL+P4vLt2k4SkaSmSSF38gbXR92nnu45m5bnhYlg9mOQT6Fj?=
 =?us-ascii?Q?2OXEVu8Tik91l5M7DdowDzdrhLBZcaJJs9WnmH4fECyDYeyR2bFERunu8N8a?=
 =?us-ascii?Q?YXBrldFHNXXGEp8ujaoNXOED0OYM8D7cnD7mFbkzdrdR27oipaxPBl2CBt0R?=
 =?us-ascii?Q?f3marwRO837k/d8u5Dmb9oKLOn8l+jFBYlvuzCBktNG3+s9UsOp3AqxQes0B?=
 =?us-ascii?Q?e0qXUAIQgN+iAzhJlhyhXjRFsXruYRgFCUrDLNZleJE677okW10rBRkpcFIu?=
 =?us-ascii?Q?hB3kHh4CFaGFX9YW6GrquAotv1uRVbOMdeV8ivIFmlJfZzT3cXG4lxsrOoMj?=
 =?us-ascii?Q?yqHetWicHCxIqMZXBzGdBXJUFaTkNAc5TxgNTuc/WGd51rRwkZcpmIY5Dgbq?=
 =?us-ascii?Q?YMcWFx/ThWoDY5gE3BjmYnhqGKrRLrYgkwPPAnQAqIlnSawakREIa53A6Nyd?=
 =?us-ascii?Q?1eGju4Vf8Qg/4viunUuUTGCXplCqcVYdmN7dVXtC6oSmh8VtpR74gv4QtO9M?=
 =?us-ascii?Q?Y1Wr8MI3qSJBD/XYqRJI83z0WpkwdtQxkrxzVd3XnHxCXyWZxB30MI5j3HJ8?=
 =?us-ascii?Q?FS/W2YTyN2pEIQIBDf1sWxab/rnIIn0tqX/JoY/SWvURYhcwz3A74DJCZsEp?=
 =?us-ascii?Q?qUl7vGS4fMgawVu71wdbajm9OE/RbyTcxF7yIA9GoosUM1Yu2ohFVkIIQq/x?=
 =?us-ascii?Q?KYrR9dJ87ZZYr/sfi0fNmEoMrNLn2gF0+EIj3eydf5zl3fDHgIyOisk3UwnX?=
 =?us-ascii?Q?zMwLRU+yp/brpow/3GqtpxcAfoIoAYNX7m1nMZ+FFLmctiGn/vPdrxS8lRPc?=
 =?us-ascii?Q?H+96dqii1pgRWgxE4+iAIPSouaoO1GXlQmUY01Kwv0vCGmWljc587BkUnNPk?=
 =?us-ascii?Q?APNh6O44S4cXk4paYdhpUF7BZ07huRI25w7z2o/0rcMtr7u8//gAJagdmrxE?=
 =?us-ascii?Q?E5t4xBdXwZlX8PuB8ft8VJFHzp5ChAPG2UClVLl299BLpFdbFLVbQq4nX6Da?=
 =?us-ascii?Q?w5fazDOgPwH6MD5Y9QQFzH9tWDjxvTmhTvxrNgYesmjI1tagGak7ceoOkJBX?=
 =?us-ascii?Q?Fb6XPfhXymYYqPCTtPj36NI=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d53e4a80-ed9b-431c-aac7-08de2cf59daf
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 14:10:56.0430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: piq3GMfQvlPdLaBI34y/2NfSsS2YIDMLNDB5HZiUNuPGiD6O2lluqc00bANp3yPBRGWLDMKNcH0DPPJ1azRDCvdVex7Ye2bOdXmY9OJA8fSEY6FGdWuy7UAzNulwvnqB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12821
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

Add vspd0 node to RZ/G3E SoC DTSI.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 9db3428fe810..876d8e3903a2 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -1193,6 +1193,20 @@ fcpvd0: fcp@16470000 {
 			resets = <&cpg 0xdc>;
 			power-domains = <&cpg>;
 		};
+
+		vspd0: vsp@16480000 {
+			compatible = "renesas,r9a09g047-vsp2",
+				     "renesas,r9a07g044-vsp2";
+			reg = <0 0x16480000 0 0x10000>;
+			interrupts = <GIC_SPI 881 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xed>,
+				 <&cpg CPG_MOD 0xee>,
+				 <&cpg CPG_MOD 0xef>;
+			clock-names = "aclk", "pclk", "vclk";
+			resets = <&cpg 0xdc>;
+			power-domains = <&cpg>;
+			renesas,fcp = <&fcpvd0>;
+		};
 	};
 
 	stmmac_axi_setup: stmmac-axi-config {
-- 
2.43.0

