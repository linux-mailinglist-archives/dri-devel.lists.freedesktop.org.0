Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C42A2C8A2F4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:10:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F8E110E625;
	Wed, 26 Nov 2025 14:10:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Hkm3NSmq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011052.outbound.protection.outlook.com [40.107.74.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8EF310E625
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 14:10:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GkPnGM03XeEJXDHAVSwWC97VdtKdVS2sYWjxpEL305md5FUq60AT15lD95AAx/VyIEbkhAk7OiT8PpxoF2fonW3IExpMCHcN9w+nFE2W5vdwM2SOOLPaOzuuoTwwKs/gcZJO5KQpcOcAyHnxOwlnBUONLcmR1wP/bc4j/aMl1SwIIGTpbn9kyZBGICU2wiUcyWsBl+qzmvDnzsJSKDbwhMWQYsWnuNCm19uQdTUYJi20Qv8inZGD50EZHMcCCTDNyOuu40QA4e5zU/CazqdZ1KJ3lGrkZXBaWgKjDErfH6t8yVtG73OPuKl8kilWZrLXg2WD0Cp9+yoavZW2V+MAKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bqZjTxEWFa8T8TSYpwKvwTGqP6ldiSNLMcI0+t8vLx8=;
 b=o9GTeExOhawcOtN8wIYYePZSUuJbkOAvJLpu8OAVhkkmTDSP8vNFjNSy34WOOhpAO2dET+JC88JHgyR5lsPkTIdccEoBRZflMiHFPJOd0AogPYQoocpJevbfSXjVmc44y70MGdT2qYtfiyHJ2B9wHUOBg4PtGFqryiWHraRcvxBUJojF+agMnuH9hQu4uEPxCshMqkTZTAJMeaUnYgBTJAZ8Ur+mak8Oe9PjJQjIVDdWMpZaY81EufHulD4m57nb/WDIFlEXhlprBMH0wV11kC5HA9YW1aUsuft6M5EzwdQkO80ZSBfpYDLH3D890aDEwVBK+MWKPJX3lio7/f8npA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bqZjTxEWFa8T8TSYpwKvwTGqP6ldiSNLMcI0+t8vLx8=;
 b=Hkm3NSmqpuo262aeXqz+vCd+n8/CRf5EPCcUyRrWp8Fhp7NhPM0JlsljEe50fo29k2rMmkckYlvjeryQWksLeLTiAleNQPs3ifhJERVBZNj00e3LEH7aPCfPpLWJPcixCvjXRrYprsF7sOLyXutq0kpjICzccHHTi9rc5KdEJuI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB6804.jpnprd01.prod.outlook.com (2603:1096:400:b3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 14:10:03 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 14:10:03 +0000
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
Subject: [PATCH 12/22] drm: renesas: rz-du: mipi_dsi: Add
 RZ_MIPI_DSI_FEATURE_GPO0R feature
Date: Wed, 26 Nov 2025 15:07:24 +0100
Message-ID: <7633cf627b701b121f97473c373f02925101e7d0.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: a18335ed-f3de-4b73-4ad7-08de2cf57e7c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SrGFiFLd8yXv6VVrcTcNFVsDMTOrqxs6yzneGFKKD52OI2VNjzHOquImY+FB?=
 =?us-ascii?Q?gEFx1nRwnIHhM1T5InFrL+hry/0ti8DleB/ZiqT7rJZyTmSDrRZhUQnhWNgt?=
 =?us-ascii?Q?YXe2nKpfHyIa/kXtBh23hcCd2aGEHukSlMJtb48Xl5h/+HZek9vRmg8XlUKe?=
 =?us-ascii?Q?OX7tkhmlVb5mrlLcKSgEbwhImmaxVJv1IM033IqMHxuSKFXo9sN1eCf3smOj?=
 =?us-ascii?Q?9AT75zwPCAVYmVWh6WPSG2PWyCUJqIxWNzmufp0E5F1y6XzVRfmIZAb/SRmA?=
 =?us-ascii?Q?Rd7qTVYJ9SI/lJOjXxwTYVXCzooDhfe477fGw36ZT0DF+KSBvfdKJn03nC9X?=
 =?us-ascii?Q?RZL35CzzJvxTCivff2qLKuFT+cCLgtMEfAQI+JX6VCVAnJJddynOX/8jZVOb?=
 =?us-ascii?Q?0honu/Pvwz8O9ZAEIIUdp14lOyqfSr2S+8iydQ0hGlQDzZxeK2V/sOIFpP18?=
 =?us-ascii?Q?IHtw3dcMpP5FUwjPTks4GrQmHOzCl0hpSGIshH24ySBXEQVykU3yzkKG+6Ud?=
 =?us-ascii?Q?DakHKAo6yOFLaZCVQUo42faotRHE3B5pn/uawobooM7qZjgh3CHqB5dh6Sn5?=
 =?us-ascii?Q?x9b7/ARYblm1hVuL3diUv/WKDhFJJ30KjqcxyyhSXhePEhpphy6aSaxYt/ty?=
 =?us-ascii?Q?FWYjwnnxwFHcCE3Xwj11fdMDYYOayqfQORG/Q91ZN1GYd+VNdnRh4mK9XmEV?=
 =?us-ascii?Q?Q1+9BzUU7lL/yjO7r28SfkpTZew9hEU2G83nOJ+41M2ceS//AVbqtDQXoOnV?=
 =?us-ascii?Q?29MSpCAPg+9M5MdU3GH4TSnbHRROVToLSn4Pm5zcAbgbKwjtlsXVzsSswKSh?=
 =?us-ascii?Q?ltY/dynyk7qRb12VEhGIoD249GVNAilchWBbXrEsI4k//CAtm78LKJoiIsHe?=
 =?us-ascii?Q?JB69Y596d8kpoW2FMgqST3XrzkGCUx0Lyj6mScwZtM7bXaHNgxAWwAOLtgLQ?=
 =?us-ascii?Q?BOyL4+dbTA2X0UxLY4zQLqfIh+5It2Shw0IDOBdXMZfBDiJ9oTyZuTZoguFe?=
 =?us-ascii?Q?zcXL12pN1XPheUaqbgW6pONAKDxvknsZUbXOgg2WTXa0Jn0WZMSPF4OcDNmZ?=
 =?us-ascii?Q?tZ6r+whZWQvLsxB8zkuLZLsRgXS4RlSUeJ7LHyloCupHT2WzyZ5D0nIalaLw?=
 =?us-ascii?Q?ntA98dAQ1NSyR+0wwanFU/At9TPTpoKjnHfDMwDgZHguMDoTMMUuKT0WatZy?=
 =?us-ascii?Q?10mi9bPcY0jZfAOzIh533yFAw1/LxrZ+KDbexpi0l7TaqaBchjVg4UScCd/M?=
 =?us-ascii?Q?BzdQ5/Q8xA80DbqjB36/T2y5z7zYcvgPzwLrnQ5I1jMuaPL+EGZb5fnutaFA?=
 =?us-ascii?Q?GR+s+pZP3iN3oh/eG97Ld+2Ldszr/R2hTDFqum6zDwtjElCeeDK9yH9To2FQ?=
 =?us-ascii?Q?upDhhqfDUgV1EhK0hGnn8dV3srX7vp9lGbt6GDW7PFV2WaR/dzF1VwygHfEK?=
 =?us-ascii?Q?4vZpDYFu9nOBTJvfGUZltZqK7CLgw4ztoJ+bTNv8PO+IP7p0XrUI4sfI82Wd?=
 =?us-ascii?Q?h9hKdQtFuz9BYaAfwFB6napYzFbQG3Zok0D8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w1wZ62SqhdB1NjUrnUmjYPnUajgOK8/pL6MCix3ejE9RTK0dyGqNM7ZJxHNC?=
 =?us-ascii?Q?jarTgujBLijjX1MEmvWflfFxtQNdULb40Y358bksN1try/BJWwB72/dgreCs?=
 =?us-ascii?Q?pGfI4kHXxQBvR0BNj2lPkYcMmuNhsSUIOgz4elaPotoUBcpDlX1fZ8Wj5lS+?=
 =?us-ascii?Q?vp5tv/fziJuH/8AHRl9RwRvlI7WXVOUgn3EHt5Oslhsq+iGY9CT1nGGf+06a?=
 =?us-ascii?Q?Xi94QoLDXrgc4O8MQsaTddWpamg9yOnKGQUWGOmiHGp8xhaD5VOobokEukED?=
 =?us-ascii?Q?w07wAk4nqJ8WyqUYBSOBR6lYX7K3vVJB5g1/PV74QY4VA4NAqo6hzaNe30bf?=
 =?us-ascii?Q?m/bsi63n6ITFKHlnPxnwVKP5KnDytq4ZS65y3QjYI8eaoJQMOS0IIjZX4EPl?=
 =?us-ascii?Q?PG3TneK/7vACJUSqqLmvxqNjqmn10QxDYCVZH1iPPyvZSgLuL3bz93fOV3jq?=
 =?us-ascii?Q?wGzq2lw3ZLhOPgRIHPyCnkm4ndkBpzli7yRxHHsQuDKH0HE/fH/rCaEtSOie?=
 =?us-ascii?Q?HnRDo9l6e8r6FMystcNMkHR2uac8pKHO+y8SuuNRPiKQMYiZh5RWK9G75SWd?=
 =?us-ascii?Q?2A3pspdQrxdzvLXYsSk8VEc/SsB2ChXax71G7Way8m61wnFyRUshBeq55rIx?=
 =?us-ascii?Q?vHU3S8yuDUBpLVJ7UitB2G7WgH30LDkidMt1lBnSkRjsa0AGDmMV3wOWJYO1?=
 =?us-ascii?Q?0L6bdIhOr3c92PKZpFPQm3YPVOSX2xgShg6BvodxBhZj0jFK3vqSh3RjOEgH?=
 =?us-ascii?Q?OMRhUs9e99J9trC2wD5J5zcPrHtp+wEooYocneqW9qI2HTlqxnY1IFazjb+C?=
 =?us-ascii?Q?zkC5faXDPh1ggPQnwsPOUr1T/GjYsrjD4pArPkdxMjqVO0GYH5OFjTWJLIyb?=
 =?us-ascii?Q?npTLnB2p4754S2OkzUQSSfaYwusZx2DK9vstMA3LExFn8dR5mHzMo2oABUcF?=
 =?us-ascii?Q?qVZjBjIEi2q29gDk/sCWmjzq+B2OJ/QakQxYqIWvF1jWZX+Xa0lWhrwAr/F6?=
 =?us-ascii?Q?nwmnH8xTQAEIOeAza5mnDhiZefsVGleJ79dofjDvvJZUEK/V0uZihzpvOWej?=
 =?us-ascii?Q?KJB9kWKlQiGNSXezm1NcCdPIIsdBXiyddz8RSSNnNKYGdh5VWC4Ryxid7YU7?=
 =?us-ascii?Q?Oq5iPmOn1TQEFMWyXeqO253psBu4yR2BzKq1vmb/NWlNsLzublTLzVPnkoEJ?=
 =?us-ascii?Q?3fWz6ZxbFaDoV+f+7SCe1rRuomj+IPNHR0iKkI/GkHwb5fqFCOv/d6IPozWG?=
 =?us-ascii?Q?ZixoFjCqWsjW1nK/43bus4wl58vl1jSRzCJZ/yqTZFgDlWzgfZp1iCkZ5o2U?=
 =?us-ascii?Q?br+YOmUfH8B5noeMQ9ZWfIIDoFF+lNu+y01Lyc2bI5QCGMXGrt1fQ443LCFd?=
 =?us-ascii?Q?vqnU9rD42iSHNIUnLCnxQjG6ZoTRFq7NF98KJP3i2ZOAKRfsKfL9nSNSnZek?=
 =?us-ascii?Q?09chcCnZ8aghhBL52eFxPc1KSbRlk3IZgL6WOxkl1ZSbW0y0aIjIVlWZ7K4s?=
 =?us-ascii?Q?r/KAm4N1zlc9DccA5Ql3lNmixconzjCxNB5w3RK/GKtG3x11LCT1+Vr3NPdW?=
 =?us-ascii?Q?8aqFZfZflTOYgglrJU7d903ts2Y+MThW0oHCz0tf5vTEa9xi4xLN2K0asUyx?=
 =?us-ascii?Q?npUjeAVCERM2eMe4l+QDHq8=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a18335ed-f3de-4b73-4ad7-08de2cf57e7c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 14:10:03.7329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Md0VJIdrFj6lWkQ6w6+FBVyjE8EeLzpCRVHq8/014YQHd9LAKOODdKw8cc5jol4pIx032dLfWIR2uzhA5xPNJS3W6E/d1Pp0Km3aP5dkRg3K5U2Mq2t1759c035OzNIt
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

The MIPI DSI ip found in the RZ/G3E SoC select the video input clock
based on the DU instance actually connected using the GPO0R register.

Add this feature to the driver using `RZ_MIPI_DSI_FEATURE_GPO0R`, update
the code accordingly to manage the vclk selection with the introduction
of `rzg2l_mipi_dsi_get_input_port()`.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 67 +++++++++++++++++--
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  3 +
 2 files changed, 64 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index ccc2758bafb0..59125460cf57 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -37,7 +37,9 @@ MODULE_IMPORT_NS("RZV2H_CPG");
 
 #define RZG2L_DCS_BUF_SIZE	128 /* Maximum DCS buffer size in external memory. */
 
+#define RZ_MIPI_DSI_MAX_INPUT	2
 #define RZ_MIPI_DSI_FEATURE_16BPP	BIT(0)
+#define RZ_MIPI_DSI_FEATURE_GPO0R	BIT(1)
 
 struct rzg2l_mipi_dsi;
 
@@ -81,13 +83,14 @@ struct rzg2l_mipi_dsi {
 	struct drm_bridge bridge;
 	struct drm_bridge *next_bridge;
 
-	struct clk *vclk;
+	struct clk *vclk[RZ_MIPI_DSI_MAX_INPUT];
 	struct clk *lpclk;
 
 	enum mipi_dsi_pixel_format format;
 	unsigned int num_data_lanes;
 	unsigned int lanes;
 	unsigned long mode_flags;
+	u8 vclk_idx;
 
 	struct rzv2h_dsi_mode_calc mode_calc;
 
@@ -552,8 +555,8 @@ static int rzg2l_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_f
 	unsigned long vclk_rate;
 	unsigned int bpp;
 
-	clk_set_rate(dsi->vclk, mode_freq * KILO);
-	vclk_rate = clk_get_rate(dsi->vclk);
+	clk_set_rate(dsi->vclk[dsi->vclk_idx], mode_freq * KILO);
+	vclk_rate = clk_get_rate(dsi->vclk[dsi->vclk_idx]);
 	if (vclk_rate != mode_freq * KILO)
 		dev_dbg(dsi->dev, "Requested vclk rate %lu, actual %lu mismatch\n",
 			mode_freq * KILO, vclk_rate);
@@ -764,6 +767,11 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	if (ret < 0)
 		goto err_phy;
 
+	if (dsi->info->features & RZ_MIPI_DSI_FEATURE_GPO0R)
+		rzg2l_mipi_dsi_link_write(dsi, GPO0R, dsi->vclk_idx);
+
+	dev_dbg(dsi->dev, "selected du%d input channel\n", dsi->vclk_idx);
+
 	/* Enable Data lanes and Clock lanes */
 	txsetr = TXSETR_DLEN | TXSETR_NUMLANEUSE(dsi->lanes - 1) | TXSETR_CLEN;
 	rzg2l_mipi_dsi_link_write(dsi, TXSETR, txsetr);
@@ -1006,6 +1014,37 @@ static int rzg2l_mipi_dsi_stop_video(struct rzg2l_mipi_dsi *dsi)
 	return ret;
 }
 
+static int rzg2l_mipi_dsi_get_input_port(struct rzg2l_mipi_dsi *dsi)
+{
+	struct device_node *np = dsi->dev->of_node;
+	struct device_node *remote_ep, *ep_node;
+	struct of_endpoint ep;
+	bool ep_enabled;
+	int in_port;
+
+	/* DSI can have only one port enabled */
+	for_each_endpoint_of_node(np, ep_node) {
+		of_graph_parse_endpoint(ep_node, &ep);
+		if (ep.port >= RZ_MIPI_DSI_MAX_INPUT)
+			break;
+
+		remote_ep = of_graph_get_remote_endpoint(ep_node);
+		ep_enabled = of_device_is_available(remote_ep);
+		of_node_put(remote_ep);
+
+		if (ep_enabled) {
+			in_port = ep.port;
+			break;
+		}
+	}
+
+	if (!ep_enabled)
+		return -EINVAL;
+
+	dev_dbg(dsi->dev, "input port@%d\n", in_port);
+	return in_port;
+}
+
 /* -----------------------------------------------------------------------------
  * Bridge
  */
@@ -1400,9 +1439,25 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->mmio))
 		return PTR_ERR(dsi->mmio);
 
-	dsi->vclk = devm_clk_get(dsi->dev, "vclk");
-	if (IS_ERR(dsi->vclk))
-		return PTR_ERR(dsi->vclk);
+	if (dsi->info->features & RZ_MIPI_DSI_FEATURE_GPO0R) {
+		dsi->vclk[0] = devm_clk_get(dsi->dev, "vclk1");
+		if (IS_ERR(dsi->vclk[0]))
+			return PTR_ERR(dsi->vclk[0]);
+
+		dsi->vclk[1] = devm_clk_get(dsi->dev, "vclk2");
+		if (IS_ERR(dsi->vclk[1]))
+			return PTR_ERR(dsi->vclk[1]);
+
+		ret = rzg2l_mipi_dsi_get_input_port(dsi);
+		if (ret < 0)
+			return dev_err_probe(dsi->dev, -EINVAL,
+					     "No available input port\n");
+		dsi->vclk_idx = ret;
+	} else {
+		dsi->vclk[0] = devm_clk_get(dsi->dev, "vclk");
+		if (IS_ERR(dsi->vclk[0]))
+			return PTR_ERR(dsi->vclk[0]);
+	}
 
 	dsi->lpclk = devm_clk_get(dsi->dev, "lpclk");
 	if (IS_ERR(dsi->lpclk))
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
index 2bef20566648..cee2e0bc5dc5 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
@@ -83,6 +83,9 @@
 #define LINKSR_SQCHRUN1			BIT(4)
 #define LINKSR_SQCHRUN0			BIT(0)
 
+/* RZ/G3E General Purpose Output 0 Register */
+#define GPO0R				0xc0
+
 /* Tx Set Register */
 #define TXSETR				0x100
 #define TXSETR_NUMLANECAP		(0x3 << 16)
-- 
2.43.0

