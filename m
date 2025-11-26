Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B48EC8A35C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:11:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 890BC10E62F;
	Wed, 26 Nov 2025 14:11:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="G9FhHsQ0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011027.outbound.protection.outlook.com [40.107.74.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1414210E62F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 14:11:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yL0WqfSvjmFSrLklh1CUWXzI8tq76kRSca9Mn5qFXWK4QUjy7a68Eb0/cjUmUIhuerSbsnCtGlR+dkj8qFOS0wHAq1YhvxBc5d/4+cUqO147YQHou1xZK8XJQL+QgukgYfYLm1qCWlQM+NMouXVKuSbXHXwB7S5TSm2IxRdDH/jeZfk4Wbfr2t/Mce0aXGHgTPUUD6V7nMytUr2G98/T6K+m85JL2ao47lg/rtY09Lv5YM8BXcg1a58WuouYNs5bgHBprvwp+vkwwoBPS7br3dzbBtMK5aocEB0oUhranpo879R1vElRA07HXLgYH58k6eH0c/jNQ1jXrdi1wHw9iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lFK32P1yVcWiVCpQD8MQ65tI//8xmFbQlbX/VJNlLbs=;
 b=dxjN3uAT7la7pTqr6BlOiB28eRWBiEotC8HaLToLNsymGsr/RyVSBAQnZtPw3jx3zQ2tuVpWHq2OlE/quZ1I2spAhz5cb6kTGN3p4LwtGVr29wl99WqxRH+fXq81PA2dwEBZR0DAtF8FXNsgYWAhi1y7EmMmJ7/H0Yq8UxVpvAjwao4u5tq+jblarxRj8v3jftdm+qCZmgCF8JuTml8kk1VdhzYrSxbFzr03GYQctErn9CJoXVC0Ehiz2pyPSFIQJzu+f5LPAbUKzUOUuaPSElLJyE1Nne14yFE+3bf1abPLDa9STrllc/sn24QEeXcsKR8rfVkQQOOefT+s1pdq0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFK32P1yVcWiVCpQD8MQ65tI//8xmFbQlbX/VJNlLbs=;
 b=G9FhHsQ0Ww8ou6qH7YV/CCZJSdGTYEQ6b3Dij0dZptRlO8hRx8NAYb4d7jgutuT662UK+qLlhklNSEmf5gGi5Z5dmJ5dGxhx2kfIjH+wKYrjqIwe6ZsaBZZQa9nfkgqG9Cw3kVLci9PJVeGVpwMhMif3FoOUKcS1UIn6T0yIryU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYRPR01MB12821.jpnprd01.prod.outlook.com (2603:1096:405:1b6::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 14:11:31 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 14:11:31 +0000
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
Subject: [PATCH 22/22] arm64: dts: renesas: r9a09g047e57-smarc: Enable DU1 and
 DSI support
Date: Wed, 26 Nov 2025 15:07:34 +0100
Message-ID: <7754d2726e365353fe5761f8094a9ea336d159d5.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: f8024183-4d84-4ee7-5d3b-08de2cf5b2c7
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XpRBAVLLqLIr70oEGKGJo+zAUMQHj4Iw8/bga5mE6XVIFE4Dj23kGp0RAukX?=
 =?us-ascii?Q?lQrtyO/gnQjexmQ4GxxIOV1A12ChOMZa8/xqFGTNOQGynlJEiB8qaV5j8AZ6?=
 =?us-ascii?Q?J9UicYsMSMpXVpXo6hpnHvMuU92aZV/rKDVBZLVJ4LnCcqPyZrHsBJ77dFhT?=
 =?us-ascii?Q?r2VqtLAocreBmTByKV5n6agGLVcRbmTZlUZNakxR+MGgVNw0Y217r6dgX9h8?=
 =?us-ascii?Q?v31sV2wbmtvrWoSNZ5A2XWJnE7mWwwhHwt+8qOufh2OvZzffukmpGgu5ghPL?=
 =?us-ascii?Q?XJYavxyq4A6xPFfAZPzFkzudPqb37V8BJXBbAIgA/TuBsG72EQOluicREx+X?=
 =?us-ascii?Q?wP5cGxJYsY1hObLdNzIAH7kvBU0q9aVBfgYP88svIhfvsHxqoigszM5iCEhq?=
 =?us-ascii?Q?oeLdukLyN/3UhQELE6VygI/uWRDeIf8xNV3jR0NVCTmTl9lNGYY5qskrCBON?=
 =?us-ascii?Q?tYjUZatQYsdi3KGwKECBHPN9Cc+FQWbQURHgvmgeRcjVxZ8Pj4WIP80/zKP7?=
 =?us-ascii?Q?hgwywMed6Pzz6CnmBMPY/hwKqlcacI7NDPAmeXOJHNCjskiFisIAz4YCAIir?=
 =?us-ascii?Q?/HxwaCJDJjdNkqkrlGuwp2MqtHjtve9y12xy2KEJOqPoPzcka+x26CkyKk6J?=
 =?us-ascii?Q?t3RJMgCIg5N8xqC6mathsFXunKdRgjzgwGicfhwul1ewd3Yp7uHSuPzpAqyl?=
 =?us-ascii?Q?OCeFL9hft+Mu7IA8eZxkkdoML8bBEo6GIolYEW+Jwpqc1BpxabK81iJk/wxJ?=
 =?us-ascii?Q?3P9Hw20TPAV+cnb7I+2y3eY+71TsX8JDTmExaV1ndFiC+2tetasUOTXyljd8?=
 =?us-ascii?Q?k3+95AchYK23SqqtHXZfzTguFPXHImibcg2EFN8FHtugb4C+SS2GNn0xI77f?=
 =?us-ascii?Q?ilwBgtfcBAiPCe18C6Z+QKvc2UbqwQED7vYiQqrAcQI25g7VLes2FyBvSoOu?=
 =?us-ascii?Q?WhmkmQ0ydKE6rYlMaVAaB3aNgjB85ufe/m3nAHLPFEMkwlRvEEtYnuj73PaS?=
 =?us-ascii?Q?UsWuuMTD59lyOmgA3MD3HZtjFrX/2X0e7DxltJ8SVL0hjmAqydEXNRxlaoBC?=
 =?us-ascii?Q?TPh2Fd3bfUQ57WEW5fkrs7wGFU9r7iKcoFF6l0/fsAKFQRT/t8appi4THKI+?=
 =?us-ascii?Q?oUhVpPtSAoa1XcQOAtpg/Ae5cMQ4z1wcQFXF1HKCUe3gT1OoOnz5JpajIl/x?=
 =?us-ascii?Q?u7Xv5OkKf++VGUBAJF+VKude7MjD3WVrJ95nfSTlxZ56hSDuP3cj05cYoQp9?=
 =?us-ascii?Q?X+HYLLxvFW4wi5X7+QidxOZOyBBymqti5YtENNMRYF/bCVOYxFoQD9ceONhR?=
 =?us-ascii?Q?V+dGuwgEPBSdhzR+d4aZPKFkD9+CgNehyzOeMT9Ue3okNV36Ggn2SwvNY3wX?=
 =?us-ascii?Q?qmY9NzzljrsI8Dy+NjQBuTU9EnVojqxLIjnbWYHd+j0i+ODvazWymL1HptR5?=
 =?us-ascii?Q?T1wlbD3ngqdm4QkVxUaiTgAwFTkQQb4whx1EIvdjeFF+oLjq9pwl0FucT6b8?=
 =?us-ascii?Q?hZeSrCTzLFb+6ipePHrXlmD8khJvufQudv31?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TXg3OnMMGpIdXycw8fR1FM8S29KozvNGKgoF7lOap/UdIYBYnyPtHTaPHWlC?=
 =?us-ascii?Q?TTScQCZXLlDy0x8vflvPCgIKv+QmTI7jnYba7OIJ0JsA1AyFr9TC6TucWZAH?=
 =?us-ascii?Q?nkn4hN4EIRtta2qQMhxR/alhGvXjdKLllbDrjPEedQnX6bNQO7YRVC8iu1+3?=
 =?us-ascii?Q?4x7JR/rUUu11f2rp3y5SqvYyNYlI0kptZxUiMKXN4mfsIy8NjyRuIxANS2VI?=
 =?us-ascii?Q?AeL7nc8XuVBaL4pkK8YgWcfq7N/3P/lDeFejpGJHxBfEgrHHRFsfyrWh1v2M?=
 =?us-ascii?Q?eUfnjjH5XMZODyE2KnjgOv3tsUObes7PrH3Ie9Dq3/USnoXdzlIs+of/+nr0?=
 =?us-ascii?Q?R8rL/ev7enM0MSLyWkJVHNAyev+hxqtwCXglkXQoXJQbA2mhVpx4ALdyNTZN?=
 =?us-ascii?Q?sE61RTCTEDllggHjann5Jftv9nX5qDZRecJA/TgByxnYX6/3aAvraRm4jewv?=
 =?us-ascii?Q?ihLib0i1ftATrU3Qy5BDAu3Ek3wvQHkF4Ldh7cx5JTJiDCOD3l9mHKhH1cIZ?=
 =?us-ascii?Q?ZphHYZaIuzjU4iWmU/FykghdO6TYq9tjxh3E/0J2FUrMKW1v8iPwWWf++NoW?=
 =?us-ascii?Q?+dgZm8dYTDdQ7nZK8JsPccULkJmVjC+6iej66YETFcn5azcH/6OzFN0KBtzq?=
 =?us-ascii?Q?PmMzn2k4emW2QblETDysFxaciW0OZkA3d4ckHRKFm70fmKkG5ff9S1WQLQuM?=
 =?us-ascii?Q?9s3GUjBxBZ89fc5FlFmw9JbwlL7yXo79eKsyEVlvQeM65jepD7gNxjUQBwUu?=
 =?us-ascii?Q?7220SfbfixiNJhNnLFC5EkRCQGSbSAMNt+FreeuFX9r/OVCV7V0W1AuFbHIw?=
 =?us-ascii?Q?6KjwB6H7khjLDbcOBQDe8ruY0kdTh+x2ahGr1x5wrai4fNZvXCr71aS+/teg?=
 =?us-ascii?Q?uFiTU2wVUwNAMv72BRa6Aaf3WIRQDsruD773Lh0tZRFLs/GaAbjz7rhibZZC?=
 =?us-ascii?Q?ZFveTxt0wbmpzDiT+BjPx7LF+eDCYyQE15FpiZRXcqSOJVK83i1NjRe3Oexb?=
 =?us-ascii?Q?bdoCPJoUV86Dc+O8xAQ0KINVPg25u3pbNBNacAh0ERihXfS8ecLziBmMMpKT?=
 =?us-ascii?Q?+5Z+MlZooxRTwVb5BCZx93nYHxdLM1RLIUVXEUGIg2S5wEQ6tXUEHEIzFwGl?=
 =?us-ascii?Q?StrtVvQdln/K6qE7N2lPcc8WGxCPqrHhmQjWI7DJCXu0FsgdTHWXzeNA9Dx+?=
 =?us-ascii?Q?Fs92aYp3HQeyrKZREPcCVQNPLiS8UhL0i8Ha3w3t7LPciQ5yjS65d4cKYT4P?=
 =?us-ascii?Q?XiekWATuzhrHbfDyEJAGhZ+z732Br5PI0M1mPoi3d/U5xcnt8SoTtswla4l2?=
 =?us-ascii?Q?OZBM6kXnJ0ay3YYbtAbpf5pBwsdqCbG9aNBjGIgzxftnI6HR0mVzroeR5M3t?=
 =?us-ascii?Q?7U+Ju7yrqoqohZZp8UrUv29qyxP2VlWA7XHowV37XIgnR0GLMSN+n57+wOnx?=
 =?us-ascii?Q?FH80NBgVbTVWA+nJx2UwxKrpJg8nmn5bXUsMMD2M9tAX7jYJFuN41cuQZTtu?=
 =?us-ascii?Q?35/fl3dOmxLuevLAYg8H00FtLrTuN2qOrTKl7XxlXzGFFqzi/YDgLrHFdjJu?=
 =?us-ascii?Q?s2uV/W8Re7/U5omP3fHqge62+IcQi2uWfudVBbYEVxh106i4wKEl9FcwbbfU?=
 =?us-ascii?Q?SFdOPp43LieQnDQ4Nls3Y1o=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8024183-4d84-4ee7-5d3b-08de2cf5b2c7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 14:11:31.4438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oRfBru3m/5zLJ9a4xtmkSIHou8Mwb+65cKU/jSF843g3WNwZwTR5fYmKtQDPwj2cG7WmcGiEiIu54M65D7bBU3L45zl5VQOijhDVI4einW0Uoxuyz/UInaqnCNcqt0tk
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

Enable DU1, DSI and ADV7535 on RZ/G3E SMARC EVK including the newly
added r9a09g047e57-smarc-du1-adv7535.dtsi

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 .../r9a09g047e57-smarc-du1-adv7535.dtsi       | 124 ++++++++++++++++++
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   |   1 +
 2 files changed, 125 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc-du1-adv7535.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc-du1-adv7535.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc-du1-adv7535.dtsi
new file mode 100644
index 000000000000..4444c9634d3e
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc-du1-adv7535.dtsi
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the R9A09G047E57 SMARC SoM board with
+ * ADV7535 MIPI DSI to HDMI transmitter connected to DU1 enabled.
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+/ {
+	osc1: cec-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <12000000>;
+	};
+
+	reg_1p8v_adv: regulator-1p8v-adv {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_3p3v_adv: regulator-3p3v-adv {
+		compatible = "regulator-fixed";
+
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	dsi-to-hdmi-out {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		port {
+			dsi_to_hdmi_out: endpoint {
+				remote-endpoint = <&adv7535_out>;
+			};
+		};
+	};
+};
+
+&dsi {
+	status = "okay";
+
+	ports {
+		port@1 {
+			dsi_in1: endpoint {
+				remote-endpoint = <&du1_out_dsi0>;
+			};
+		};
+
+		port@2 {
+			dsi_out: endpoint {
+				remote-endpoint = <&adv7535_in>;
+				data-lanes = <1 2 3 4>;
+			};
+		};
+	};
+};
+
+&du1 {
+	status = "okay";
+
+	ports {
+		port@0 {
+			du1_out_dsi0: endpoint {
+				remote-endpoint = <&dsi_in1>;
+			};
+		};
+	};
+};
+
+&i2c7 {
+	pinctrl-0 = <&i2c7_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+	clock-frequency = <400000>;
+
+	adv7535: hdmi1@3d {
+		compatible = "adi,adv7535";
+		reg = <0x3d>, <0x4d>, <0x2d>, <0x5d>;
+		reg-names = "main", "edid", "cec", "packet";
+		clocks = <&osc1>;
+		clock-names = "cec";
+		avdd-supply = <&reg_1p8v_adv>;
+		dvdd-supply = <&reg_1p8v_adv>;
+		pvdd-supply = <&reg_1p8v_adv>;
+		a2vdd-supply = <&reg_1p8v_adv>;
+		v3p3-supply = <&reg_3p3v_adv>;
+		v1p2-supply = <&reg_1p8v_adv>;
+		adi,dsi-lanes = <4>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				adv7535_in: endpoint {
+					remote-endpoint = <&dsi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				adv7535_out: endpoint {
+					remote-endpoint = <&dsi_to_hdmi_out>;
+				};
+			};
+		};
+	};
+};
+
+&pinctrl {
+	i2c7_pins: i2c7 {
+		pinmux = <RZG3E_PORT_PINMUX(A, 4, 4)>, /* SCL */
+			 <RZG3E_PORT_PINMUX(A, 5, 4)>; /* SDA */
+	};
+};
diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 08e814c03fa8..74cf36586636 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -28,6 +28,7 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/pinctrl/renesas,r9a09g047-pinctrl.h>
 #include "r9a09g047e57.dtsi"
+#include "r9a09g047e57-smarc-du1-adv7535.dtsi"
 #include "rzg3e-smarc-som.dtsi"
 #include "renesas-smarc2.dtsi"
 
-- 
2.43.0

