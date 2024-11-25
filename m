Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFF29D8256
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 10:33:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87EE710E3C1;
	Mon, 25 Nov 2024 09:33:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="JnYxOfkH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2080.outbound.protection.outlook.com [40.107.249.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 882B110E3C3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 09:33:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HBvZ4rVzvv2WFCBb+aufUSU8diMsfixHw+3k6Q2Ji3qmmhG90proOPNbo2bi8H8wXf/G11uSk72bi1Kv6eVnVFu5RMFnIyaUfsXStK7JhfoiAPr/bC9rbVaVzjTjSNuPqgQ643gL/RljvRW4ZCozSzstL0BpNEq+/wMwbFbhd0n++ppXujCJ9zVa7gjwnOX2JNdW7al7YxLq2qBIQWc42L+ni7wZ5M07DGU8gk3pcjcxMsf5QzVdeupzwIgv+S1XganxUCj4lunY6NhU2fNYYU+N3meXY5N52H02WJziHuUd5mA85JkDE/tdLWzhMrnhhSavaa9kwjYsIwMCGMyp/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HWG03yrViWf4FsOOXxx6SxJsBkutdcLvr3s2QyQx8Kc=;
 b=ohBxZ/38+IeufoHDbMQ1j831dOg+EHqDk+etE+6wPGNsanhH5ZmUqyeGWA8u0XloIQjjyDJZZjp5sfb4HwcLmZhPLDGW7rB8djChAKNObtOeK1AxOF3T5kFza87HZq6Paod85H2gk7zMSoA7FcqaH/osY9svmtKYNrHTf23osekFZSgLyQbERgh4RM9UsZkqoG/SeYJtChKzUi8b5HNzHHfqwVFD8uwpQ+uQyD4wiqUCUFOdMpyUPmo7E3j+ZCKuuMhJO/54cRQ7I+dyAuS2m0icQSxEH5iEmPaS40ZHxmFu6z1ifJHEkCTh61D/9t9LYHj+YlgZ7WPjTHWKDqHoWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HWG03yrViWf4FsOOXxx6SxJsBkutdcLvr3s2QyQx8Kc=;
 b=JnYxOfkHpcejeRgRGDntM8H+qW8IJjFCIMgPL1W1FAyg/AGi5OOuoVVsWrHO6EhKQsVoCCaPF6B0UZ7SFlaCFiWekl4bjx13de+UDHUlNjvX834d0CRWkFd9e4NiY9AIAz9/9SAqYrUAumhy/rUVB93DmtO7uPfBd8+9E3VLFv2N8izWla7sUX8MwiWr0vm67NlMqXK3TM838rhtyqUu7F0xPU0r4Oi3BoZI2qWfxxUqgkIfxZzlviCvHC9WoKl2v26SW4B8LwjJ9t8y44JGSYXogjw3Gm2T9ckuf9EywrLa+ZfIF8YHc1r2SCxuQ+5UR+QOPJvOWAcV7J87FHCvaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB8PR04MB6825.eurprd04.prod.outlook.com (2603:10a6:10:112::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 09:33:43 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 09:33:43 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, glx@linutronix.de, vkoul@kernel.org, kishon@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it,
 frank.li@nxp.com, dmitry.baryshkov@linaro.org
Subject: [PATCH v4 05/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller AXI performance counter
Date: Mon, 25 Nov 2024 17:33:02 +0800
Message-Id: <20241125093316.2357162-6-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125093316.2357162-1-victor.liu@nxp.com>
References: <20241125093316.2357162-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0131.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::35) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB8PR04MB6825:EE_
X-MS-Office365-Filtering-Correlation-Id: 54b585d1-1b3e-4d9f-8c2f-08dd0d3440fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|7416014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?niRtE8H++1s2NX/gWFdbRu/ervj4GCudAeHQrOIwdvZDYW2bOihD+5hYXxlK?=
 =?us-ascii?Q?tYuPtlckxWTUzAJW+BPVRshUc6YD8rm688AZRtcegVzgoXOy0Kk7uw9KpiJz?=
 =?us-ascii?Q?vOgR/A6WElgwPcsfaU02md5bRMOUiB+1ZkMEO8ZkmyFzHWjVxAy9/weXFJgj?=
 =?us-ascii?Q?7FBGcTlr7vcbzprvbvhBG47aCmCprpnqx9j+T1SXYTQiRlh36yaeXeVUzx5u?=
 =?us-ascii?Q?Y1NbhhwV5aoWelF2tSHkuetLrT/tYd0lJKPPoKEmnp+yiaKl6tKOJxtVvsUm?=
 =?us-ascii?Q?ye7ti+CmgJc4gQEc3vlUAp+YyW1kJAih7f9UIuYURzASgLvW4htev2pVB0f3?=
 =?us-ascii?Q?uBtXvh0ydqslPf8iwsISQKju33PU4vy6Itv7W2qsFbBf16oORcXZgaGUpODz?=
 =?us-ascii?Q?8EG4sT+79aStH2vynCQ9bxC7NywFVB8vQEe/MNIUo9aqmFRJsB+SSk1WrBpG?=
 =?us-ascii?Q?LQDG112dS+bsNSVgSg9T0UN0n8P0SJ54AQAwkojWs9nz0xBp1VmvtSwL8XXM?=
 =?us-ascii?Q?oi3kNrUPOQMktBzEee/dYyez83sU7vcitJEYGH3z2vmX2fxTAn9uH/bxm0qB?=
 =?us-ascii?Q?obyucloX8lFWQF8g5lcjTztNjBcbWNnZxnMD4r/l6GOe1utTAAae3k6ydjzs?=
 =?us-ascii?Q?r4D7TUV6z8rEOO2W3QtDHl2bUX3SbMrZ7IwZqw+TqSPm6vm52WtN+6TGs19y?=
 =?us-ascii?Q?Ek5FVcK4Ii7rUkSUJ/pwrXRyGH5LPrGfVx2ngRY8CHZa0K7tOX2hE/DuYwqo?=
 =?us-ascii?Q?WwTf010bHBpCuAItCi/MbZu9OM3RUn2Ffem24V0mZGTMdYMW+Sc5fnp1jUDF?=
 =?us-ascii?Q?7R1LnYfmtc92dh0VbO9ojCyv8rrzMxxq3ZX9QfA/iV+ZWgT28zXT5506vpfF?=
 =?us-ascii?Q?FRVu39MvSknw6tHA/+UIHa0e3fRRlGhC5PnvWPFb8Lfaaqv7HDL0TM9etlZV?=
 =?us-ascii?Q?AIj3l4MK7j6xPR9w0LjrOxNBDga12aiOZ0Q1lw8SatkM8Y0C+kd5DZUZFXWK?=
 =?us-ascii?Q?bOxua/47yRsqt/0gHBOkYsLhQG5euc9b6UhRyghsYb/jPH/FShosPsVbQHbt?=
 =?us-ascii?Q?t0QigemXyURTAPSZMY8F0hb4E1N4id8GRrTaABW8yoMYccp3iEwqK3Ai1kpS?=
 =?us-ascii?Q?A/r9vqRw8ekrUReizVG1UcELaU/FE+icaHT2EcEKF97OmvjNzd6lr6Gue3V+?=
 =?us-ascii?Q?dzSD6tqPmI68RyHGTeXiByUaBvSvqr/2i1rXrtbwtFOrf0vsAXcwi3hcqpbJ?=
 =?us-ascii?Q?BezvW4JcC9sku/sD0VwtnjDbZmJuQqS0YwcVFoVlCmgerOujgwowp9GfuWBr?=
 =?us-ascii?Q?hpxBVEJ020ZXwdFRONwCBSoixltwPJpQ5RlJZ4rmPgVWow=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?azN0Sr2IsIIARdlu055yBr4HN0ALL6oy89ECQFYP9x4Q9UOW6gZwp0pS7s0F?=
 =?us-ascii?Q?YQUbu58vhSLikSsy8cKgpAhNVoj5a2zUnjfhFZrCo0y+l7VZlfmT4JMB+MCf?=
 =?us-ascii?Q?C6l15hguzE+Cc0mOZFqmowasifzAmE5hfS0WtybjxDXEnJs/sPs79nhv2H12?=
 =?us-ascii?Q?nWggMJ34xJiSMuvOshwXPVNNwk5Aw06qFbgxqai8rP7GVDXV3bOwiA8v8buB?=
 =?us-ascii?Q?ED7O5+mNq7+Y/v46+yT6SCvn9KHDRROm9KEIUFsyQl/XGMBsr9dj0aBrSBUv?=
 =?us-ascii?Q?1ALNaB7mYm+Jy9RL44zH22iVivVmk7rdFlfeRbhCRQJ2vJTfnB+Mw0fSwMLL?=
 =?us-ascii?Q?K8/DThKZXMu5AE8QtbFtvL6CJmm9qzvah7OaS215VSBChODVgMQb4LzOU1tT?=
 =?us-ascii?Q?BtCAud54eopFs8SpLQj9j4EWAT5jQ4LsDKMven0OV/WIPFsV95fX2QIsQMmn?=
 =?us-ascii?Q?fwua7sXgQ++PQ9NdJRS1Pqx18NQBcFGujsPLvgAi2bXpGI2o7x6dPNYn3J2E?=
 =?us-ascii?Q?cCVbVjCnIUFiGCVO/aeaqUsLp6WuzLmkSZiWdTm/3U+wIKLBkRKdkxYs1TKu?=
 =?us-ascii?Q?v2uaT3r1BBX2o0C3LTCrm1w9k1ovWWHfqfckjY47224Ko8uCTba0zMb6j8Ip?=
 =?us-ascii?Q?DtCKOTVM2ptZGnEWTuxA5zNyr8fhteBYIerQZGbr9ZMKB9uKWw0ODpcxvjpZ?=
 =?us-ascii?Q?tlXqYJ7m0E6oQgYTfglykYOjOxhSdSojB4wdFYwX11w+c9i1/kAejTahIpva?=
 =?us-ascii?Q?ufI0TwWr/sDqNU0ropVoLJrTzXL4KYD7kw1g3Y4Q08RXpB5UMaRfxscFOjiE?=
 =?us-ascii?Q?CuXnYTMblzySqFm6QQlhlXnq8msF/DLrmJNo5hzjEyPfoAH5Q5FK4zwOL/MA?=
 =?us-ascii?Q?wu9YCXnRkft2Dr+7SzhqhwL9BoFCHOVoGpnNomncyrfLoAc1P1Hb4qsZ3sh8?=
 =?us-ascii?Q?mDZDwjMA50ys6Q0hpo9nwqckvFnVks5LqeSgSReZUnPxSnNzlNQQtn5qQqrg?=
 =?us-ascii?Q?zv5kBhNAwAxbV0lTcuSBTRstRsYCYd4kjEoyKZkzdU3mYoQhnHrN9mHIB7zU?=
 =?us-ascii?Q?X7K2KjyWH+Ua21i8SuRM6pIuIWAVYi/hlMdOlmeAp/rJegvHw8+NdhZ0Ja5G?=
 =?us-ascii?Q?owxzqVYanN4F7bpu1x2BguPpq0gtMnSMq79wOeess7pZ2IBIVTguEkMhZqbe?=
 =?us-ascii?Q?o7D58fkhQv0QcKrrWh8ccIkJOKOhoPW7ulgVO4Jxp7K22YTIiarTlutIch3b?=
 =?us-ascii?Q?ugGsxlcPw7/DSZfR9Dg5PG8GPxTvtrI/NzIpwzs2cqcR9rcbHqPp5f7z2Fly?=
 =?us-ascii?Q?rBRgZjY5pPUfep/jjuXbiTpo03mSZSc/gQ3szEw64B/B5pmQeFWttywMQ4sU?=
 =?us-ascii?Q?MWIEQ2S2GwLNZZJ3Yry56w8FAeaww5UlX9Shvi7vwH/Bp8GS9+LTAuwvYI25?=
 =?us-ascii?Q?ncMde7nXUX1aArIxf9occcO4dzdGLEfFHKfrzGeYvBB23groCb9uUCVN5xYh?=
 =?us-ascii?Q?EqLZYH+uEhGE1DaazZz5elLMmtvoz47W7ZY5VccZHLkimi8VZpYABQEef9t7?=
 =?us-ascii?Q?Lwx34ubdDADecbTRF0KpK+hqI3hFLFz+P1zwjh7u?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54b585d1-1b3e-4d9f-8c2f-08dd0d3440fe
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 09:33:43.8272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LjIFNXkjQ4mUCMSJvZs0cGoyB/W5XQJPQHvtDZS0Trx05SRPQKN3IGeU6kB3GlQXUpD0+NSO0z3FmYinIhVNuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6825
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

i.MX8qxp Display Controller contains a AXI performance counter which allows
measurement of average bandwidth and latency during operation.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v4:
* Collect Rob's R-b tag.

v3:
* New patch. (Rob)

 ...sl,imx8qxp-dc-axi-performance-counter.yaml | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-axi-performance-counter.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-axi-performance-counter.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-axi-performance-counter.yaml
new file mode 100644
index 000000000000..1d6501afc7f2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-axi-performance-counter.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-axi-performance-counter.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller AXI Performance Counter
+
+description: |
+  Performance counters are provided to allow measurement of average bandwidth
+  and latency during operation. The following features are supported:
+
+  * Manual and timer controlled measurement mode.
+
+  * Measurement counters:
+    - GLOBAL_COUNTER for overall measurement time
+    - BUSY_COUNTER for number of data bus busy cycles
+    - DATA_COUNTER for number of data transfer cycles
+    - TRANSFER_COUNTER for number of transfers
+    - ADDRBUSY_COUNTER for number of address bus busy cycles
+    - LATENCY_COUNTER for average latency
+
+  * Counter overflow detection.
+
+  * Outstanding Transfer Counters (OTC) which are used for latency measurement
+    have to run immediately after reset, but can be disabled by software when
+    there is no need for latency measurement.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-axi-performance-counter
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+
+    pmu@5618f000 {
+        compatible = "fsl,imx8qxp-dc-axi-performance-counter";
+        reg = <0x5618f000 0x90>;
+        clocks = <&dc0_lpcg IMX_LPCG_CLK_5>;
+    };
-- 
2.34.1

