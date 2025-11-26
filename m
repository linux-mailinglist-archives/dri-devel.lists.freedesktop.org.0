Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16866C8A320
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:10:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A21F10E628;
	Wed, 26 Nov 2025 14:10:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="O8+h/3IO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011060.outbound.protection.outlook.com [52.101.125.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD3C010E628
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 14:10:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ol2ebqiao++PAP9znJ977Nko6RdSWKPYo76MCerhzJX1Qvh5rOkS/g+Ls51NIaMrkSK6WPi3ASTLBOCAmSs8bVOO0IH/eTrbmHM2MmuFqOF54X7u5JYz2KlBiLJQrHjdXfh1bBjiMnKO6P9dsD8pWtRvBslemIqwH2nq8F/j+rLlPJ4XRcfDuUVqUr2VQXMuxy8KPGQbJTYnP3UOXArbS1uAcbbYxQZokGyottW0gkyGh2JB1SWCdNvlcWTeHXK9HsGGTbChOiDaoWtoRLUCz4Vht9O4k5XddC2bIoPRNgeEBFx9Z8JGuVz8cHrbASTZVjIvgSYACtzUjGgZyeETrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xbuA+p6r4AYfUV4fw8nYFPuJiJSqE343oaxev5p+TEE=;
 b=IbsJMOvnyrrrd0KruYr2+FVbmnw2JYIDDLCH7sw48jqFlDeonD/VaHo6OlNlKtYVoQ8fxd45ntURQPFL+oGO2frWwxumfmCWjSng2Zsry8BqvooABp/ZfUTXwVo5uHd0IOLCRKYdk9nTAdqmhCEVti1ngRLhdmsn3nqj4qsVCOU1W1Vkv1+BZMl8V1Dnfi1Y8gmXIv5lbnCTPv9nrmM2AqsANoUlxo3WYGxKECziJl7hZ3gBzR4WT63H1SvFwhoqaFvT3O6xZ6cybK0qUveWadnHp1nVMDvdfjQkVh0r3vUUovIt5IQWgej4YiUuYhRvjosCX7BQPZXmfobHHQ1eqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xbuA+p6r4AYfUV4fw8nYFPuJiJSqE343oaxev5p+TEE=;
 b=O8+h/3IOtdV3VeeB9TajgViBA8zfTMhIyBUqaS32zdns+KkNk3YDgGYTJtYdRkcTYpmQX1d/nmEIDykijjBKs0JPIXTuwjcvhCrjf1zVJ6vm+Sm7HTDKKfvFrvxsYnAu/7O1Vl0NVDcl0HZ3+a0jB2JBu3LAjhxiKojvwLeaMJw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYRPR01MB12821.jpnprd01.prod.outlook.com (2603:1096:405:1b6::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 14:10:47 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 14:10:47 +0000
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
Subject: [PATCH 17/22] arm64: dts: renesas: r9a09g047: Add fcpvd0 node
Date: Wed, 26 Nov 2025 15:07:29 +0100
Message-ID: <b77b95de299de70ca78f62274d2bfbbff8bfa0ac.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8d638d55-383f-4c02-fdce-08de2cf5987f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ir0BKb3IEuIC/P6Nbq8qOCgT1/c8xFlMU6BIdyJxqqoklAlteugLvzhUKTk5?=
 =?us-ascii?Q?iiqIKS0BrPY2m6xeQzK0RZs0bAV9+V2s5A/OQz/D2YwJ+hxPS471Z+wMfqu/?=
 =?us-ascii?Q?/+yzHDZIu6TfGnw7k0YbwPqkYDe1nDohICqZLvXEyxzMmODpj55WW+D93E+z?=
 =?us-ascii?Q?NNQ3bQzlsS2PxdB3Az6/dDqIc8wwyPUOW4RznvNEDcBKcvWOz979CBtoUEb2?=
 =?us-ascii?Q?6cY0BGc4LpjM8l5dUb5wm1FekXmTYW/bVrcQ8bTPyF4WKZ2cV0G1c3rXhfCH?=
 =?us-ascii?Q?AMEMGUirNNcJ+iDz4US7P0D6kHdqLd2dcuzCF18cdIVHEpQkwwLfWsJ3ARs0?=
 =?us-ascii?Q?44+dUyqdMrgXoaMF/o9fUAGgXOiTw1HN4NgrsvnX2uNRm0nhSfCLkIboQi6O?=
 =?us-ascii?Q?bzG+rTRxMzwiOvtW63H9+xv48sPjFnD/5JYs69gGuYCXYgN/iBQIlmpyaG1u?=
 =?us-ascii?Q?AQXGHTNZ7wcw5b8f73400u0N4oLOoTDO1VLhMdKMvA2HRiVwMAHYT5qK4FtC?=
 =?us-ascii?Q?LnEx/oDow74PU8Hz3qDnhyW4V663doa7Wc2hORlQzU5RHWss1B8E1gVE6n6f?=
 =?us-ascii?Q?vOz0eKG0MsBm51CHx1LSPjYMkjj1Yke/eqUKJrBK4hryhIsOGaISPclJjELO?=
 =?us-ascii?Q?33OrShOtMAM/rj9kSMv9jsqxdf6VlcKib/KWT/f6SegMvh8kQRYFgQ/J2V3S?=
 =?us-ascii?Q?niiy0t7mPj6cwTZQxvaL4fPlG/E5LKmxRL637zTmm64J7FrFrVrSMptmzaGy?=
 =?us-ascii?Q?tR79AOvrDU8R0pXtrfKy5lPDgD91SxilZwAdZa4h4V2UJ6sr94Alq/1/+XVv?=
 =?us-ascii?Q?w/rzUmu8YeIRUsT5ye3V00xfbAgzKE9PQYiJWnaDKJIaZF8mcM8EPVqMIiUQ?=
 =?us-ascii?Q?XiPyPKoo0h2Op4yG9SgxlCxHcDULQ/IsX1Bt3i1cEHhho1g7UiNMSoOUrAAr?=
 =?us-ascii?Q?QBVrae7IzE2BSiA8/ZS2GMIg3RbcdVBSppXvPP9bLx4sDR+AZWtp4vGTX7Al?=
 =?us-ascii?Q?5EtXOYgWwCbFMps6EMzlrlyjCAyZVXxgOvvuIYmWLiP2mZ5+tMPV6i/MSlWh?=
 =?us-ascii?Q?xW2AkHMQR4QZtA90S5vr/8SjwrjH24OO7+DVs0eP0vZNakNw3d+aXaT/eq9O?=
 =?us-ascii?Q?apqC8XVibbG43iCedfZsvaRyvKy0b7/SDZ3VQhKy1YZoWvdoLF8X9Of0E18K?=
 =?us-ascii?Q?lLUcfBofZrrRbxxsLk5Ti6VDl0/zWf6dSs8xRsQisXHM2qT2fR0CyVGfktVE?=
 =?us-ascii?Q?h7WpdtAdtAj1vvOKqBwaCopSI9WdFhMYAgA8xytWZtrEW9wJRdCJQ1tMtf9t?=
 =?us-ascii?Q?lx2F+JGp/z06C7/gVILk9nEn7jvVqSnY9bPJjPuJLYwUrTPWmY0nFyqd+s2l?=
 =?us-ascii?Q?NsE9OT2fLnVhFL5ecAzQwkF8ZbzIfoUSf2Oess/Dw8AtbYsitHvNwEV8tA9T?=
 =?us-ascii?Q?AzjKm8BlocFmxvVDW2GQ++v9jlN3z6Pfo2sBZ6/eNhZIuT78aijFbSk9pN81?=
 =?us-ascii?Q?2KtX8VWNhF22Yq6fJFU5ob/PXIRktn5SUqz+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E4KC7RB4omcv0TXy6DTB+T/WaiV/BCcVfd+xDJwezOZAKZJVUcnGjjCkYnXq?=
 =?us-ascii?Q?6CrlRomGxilqSioJAtIwa0I3Po6zbyx7KxH8AzrUmRU1Z4TUPctYwlxBPS7u?=
 =?us-ascii?Q?gVsm/Y9IXcik4Et74+SjS0vjr6SjNSZwO8amx8ZDV26OExtkebGcr/c5os+t?=
 =?us-ascii?Q?oNJOGmnz5M4XcRJFFtNO15nrVCnG52qcLR2WDfzUL7OPRoau3EkMPMVK75Ch?=
 =?us-ascii?Q?SQElA6prCM5L3bpzAh8DZISfF/CTieSMvnusMmg4M5nx+sdv1514pFC6s88x?=
 =?us-ascii?Q?m9dgqgeyNQbMSoody5If81MZpgcsyUwuI7pj6/D5ktjCE75Jtaz3AO3ecqvP?=
 =?us-ascii?Q?R+CkHij+DkQBqy626++zaxEFSwSgSeq2WYe5tTY+UQZhQC6FXG2ZIUbha/Lj?=
 =?us-ascii?Q?c+9p+JCTV1PwzntXSkNxZz+PPMI4bCrVT8GBnIo8O8innjVgenCYunNut4hB?=
 =?us-ascii?Q?gPGp2tuAwZsUaKXFZE8RQpIJPdu+An3yAVW4spRi4ugAKukg3aJ4oY+B5Uu+?=
 =?us-ascii?Q?oewPcZW0vchnDqWg3feTh4jIwZ+xyNEEQo4Rg8LyWOYIVl0SSJjQe/obFXA/?=
 =?us-ascii?Q?zlLsG4JCmXiIDrqUtIsGkseV/RbBWuutJxxkq2Gt7IuXOKoLYMYGguWe0m3F?=
 =?us-ascii?Q?xAfkUhxGjIDId20bVd+G5xzEcHP1O5LYj1AB1ibR/l6HFS61Pg6hPpyIc/uN?=
 =?us-ascii?Q?ZJj27NbXGVLzw0QkTLy1WlVRloYBLxiDf/Y57WL3c1aWdK5BqL61gOPgeSIM?=
 =?us-ascii?Q?KmHYXlJwpcHrBOAUnOcRbUaIREYhBvUwQPlwnb1urePdCnONvZryvzN23NQ1?=
 =?us-ascii?Q?My3zBLvDIcIeqMe2ThevKfXVGqJfzD/McUZJ5lkracxYwtLRyVUbf1bmop5S?=
 =?us-ascii?Q?SbG9Duz2qnW+ONeh0olL7Z+Zc+n4vVp5FUhjG/47rDgP4VUcia8l4eTcFq7h?=
 =?us-ascii?Q?MRY8w7VgyteBOLFJiRSDGAWkCPIQUMViKjyTwOA1WtBftH+wJMwIJjmGJI7G?=
 =?us-ascii?Q?K8Ljip5t7S2x9rlmhRdGhVcG6KIXTxtzoqj6RGWGSMdU4t5DKBAeY92Dl9ca?=
 =?us-ascii?Q?Qdf4NnxcgO4vf2+CBrkcvfdhsZ5EVmuIK0qU9FsMAOn3oBOfFtw54+fKHg82?=
 =?us-ascii?Q?eWzHfylqiY4Ya8gplqeP21vZD16vbHbrXzRcKT8GuNSHFxPQNl/2uDG0glgS?=
 =?us-ascii?Q?pEeoZtkoJJiS5Q3gtVvNVbxmOKupBbj5lMa10tTJKtIX0Pv+Sy2lQ/XoXF7m?=
 =?us-ascii?Q?sOW6QmrQ20OOuuMy6s7wu4Q/kwdsNTSyfkmOZr8H0l4ZMZND+wFS5ZzfqLra?=
 =?us-ascii?Q?BNv8DfoIEeX49SpfbJsBoWqyxPvIQzcHdePvTHzQfNSZCBSlswZvq6xIPoyN?=
 =?us-ascii?Q?NQBRbqGmPlflv3c5ck2kUdEObK3H/1KcESGQLTlEWJaANU+nA1tF4rPtqLFv?=
 =?us-ascii?Q?6x/4eDfjbdd7cAHPOWTUAryK09fWfLpyNqOelDdmAL2ZVWVHwmPDjGQfZtZ9?=
 =?us-ascii?Q?Ywc5UMzwtYxWC3iq53DxmigzgFZWB2P6sfcS5Aq+y+mQAANHAkTmdTVEN9wE?=
 =?us-ascii?Q?+F+0XdOVTkkICq5zdrbgORF6cv2Zxolk0qxxAI554r9KED6OIQhoTO4as24d?=
 =?us-ascii?Q?bfXMXTOMns1K7JKqe9gDZy8=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d638d55-383f-4c02-fdce-08de2cf5987f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 14:10:47.3207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1mzHyXiNvgAm6t+ORYZX+4rddKhCUL2TJ8PKbAHL0bTA94QW8XRWBvNN0kcml3zU54L1SQhsWfxD5mEahM9sWd9Zr63FTE7lNFuWklYMGQCMiusbV3px2/WhkKCKMCkY
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

Add fcpvd0 node to RZ/G3E SoC DTSI.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 7a469de3bb62..9db3428fe810 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -1181,6 +1181,18 @@ csi2cru: endpoint@0 {
 				};
 			};
 		};
+
+		fcpvd0: fcp@16470000 {
+			compatible = "renesas,r9a09g047-fcpvd",
+				     "renesas,fcpv";
+			reg = <0 0x16470000 0 0x10000>;
+			clocks = <&cpg CPG_MOD 0xed>,
+				 <&cpg CPG_MOD 0xee>,
+				 <&cpg CPG_MOD 0xef>;
+			clock-names = "aclk", "pclk", "vclk";
+			resets = <&cpg 0xdc>;
+			power-domains = <&cpg>;
+		};
 	};
 
 	stmmac_axi_setup: stmmac-axi-config {
-- 
2.43.0

