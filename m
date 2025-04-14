Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A696A87677
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 05:51:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A8110E463;
	Mon, 14 Apr 2025 03:51:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Y11R7UxS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2042.outbound.protection.outlook.com [40.107.21.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4173D10E463
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 03:51:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c/dV33hhSULfDKQ4ZHuWBL0SVuuee//O7yXBfrGiI4A9/wtCvk/2X6qEvFMVO7KithYfYoPKDS5LBa8hLWyzuXNvoer8qRtEhIb38Jrs+rl/ZpKaRC+JFgf8bD9UpJFTpBPJJnSUAL2Pp/xvc8DFdMwiUNeugMMV9GLRb7AuEQxOEMdgMeH+wSd6+vDBuMNQsPM733TGf2ulPE2Y9B2iTuvoLZSw7S9fefmJd9SYRhdyeKs3en6IQ40lCOtc8kSbVgFcpwc4HK9TTO9p6MHVVOoAi6Zdizq4eLa+RMxRbrcJq47O8JxHsrVzfs8YZLA7BR9fRZ2Aou9bah+z5r1oUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7f4UIskGOoXmN1fOontVyePTa89nneiSddr4bnyfNk=;
 b=p8PeGpwVr3wSjNY6gnZi0GZ8WBGF+4wl8KobbOL/EF+xUzmcScEJ4/SaGn1O7AZYQGoHvgDg5o5MMowDoDBhgtJi/G74G70lavmelkRkVyZNA8GpTkSXbaEr8aTYnhsIsHEjv//5ZiNshiW0MHbfacBlawrj0FGqAuimyzBwZBH9kLNahHvaSluJqZd4+Ya82ZJGRZWQSTZd/ulkxC7Lhf3pF0Qls4OGAzsYvAvZAsDQOajbppq3QNgQlON48WxXx4pwxIb9xFQjxFCdJebzWs6JALk7CsipfuKqRo7nHdUleDvhxHg84YdzWlNxAuXI+OWEdn9Y3pyjeP85XAVRuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7f4UIskGOoXmN1fOontVyePTa89nneiSddr4bnyfNk=;
 b=Y11R7UxSCH4Dmpsxs2OqKb0hDJ5XQ133Uz9oHctKyuGOxunvRPsKjCuVI2SRKa5LEYaNBfE+xwVHRUmh6pGvxvU5vJB2Vy/LBu8u3GXUvVv890KSoZcIRJozAiUwC4jyZ+o/SVOPNJoAk8JAtyKIX7qKouIvqPwdnu1TvdDka0w9DSfsMyOnPh2jxgI9lNRVd/w7a/jvBrkDVsP5WTvVUIqRe3TdpzX3fVZtOWBRQqHjtQiHHmSVxuJpkv+ucfgS+cncpwxAlWKhy130AvNJd/hy0WR/fPuNq0lZyHPefD7u8PFg+NNmR+2DRs1HQGtbdRqgr3OqKnDeUJCKUv0FMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB9205.eurprd04.prod.outlook.com (2603:10a6:20b:44c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 03:51:23 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 03:51:22 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, Frank.Li@nxp.com, lumag@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, u.kleine-koenig@baylibre.com,
 francesco@dolcini.it, dmitry.baryshkov@linaro.org
Subject: [DO NOT MERGE PATCH v9 15/19] dt-bindings: firmware: imx: Add SCU
 controlled display pixel link nodes
Date: Mon, 14 Apr 2025 11:50:24 +0800
Message-Id: <20250414035028.1561475-16-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250414035028.1561475-1-victor.liu@nxp.com>
References: <20250414035028.1561475-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::29)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB9205:EE_
X-MS-Office365-Filtering-Correlation-Id: 54f27291-062e-471a-7a87-08dd7b079f7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Xx7Rbt6l2s+5MIcuYEbAOETp1afGkOFNRV2ZHPxAD4Dtb+sm1W0kaoFkUCD0?=
 =?us-ascii?Q?81oLiQe2xrgtiIZE9ahTTFzGaVzkECjD/0Xg+7FI7g79cJ0hD2Y6nSvbZCUK?=
 =?us-ascii?Q?2VuyuomMkKQtBWeDs1sxq2xJPL0gz1i949ncOOLYg4ibA7iRiU4eVD3vOCOi?=
 =?us-ascii?Q?owC20H5TMOE3S4EbDxy6trOqcO8phginTg+HlFgxGTYtL3m0lwrK7JIxVvby?=
 =?us-ascii?Q?jjpAhjzN4SVKpn29UH2jEfev4J5EI6JqGB8FYQU8gBS2N0a3wwruave/zOqu?=
 =?us-ascii?Q?RvR/ihmDWzk2OVhHOcbR3qHXGdm0ZiEJZcaXH574HwOSV+ihlEWpI0ui5jqa?=
 =?us-ascii?Q?OW67IJ//gUFu1448bFtv5IAi0hSWe+xoUThaNKPkXh9+RSY9eQwNfD9DPhED?=
 =?us-ascii?Q?fkfS4gmtQccxJOBETGMsNy2eQ3ChYJkWnzFcWc1ne7QQ9mzTTkDTOt2KOaJF?=
 =?us-ascii?Q?7YAUFGHe127leVTsBoObwITbzYrNilmwjALfZrsPxwaRP2eO0RN9J4tVP+d7?=
 =?us-ascii?Q?wTiAXoiGXz0h/Iaq10R3qwuck281j3vrNDTmqLqb/xnzbaZuYqKiPgQMNcp3?=
 =?us-ascii?Q?HfTt05H7bnGS7/izVR5OPMKIp459LjC9NIz3yoSWtOe+hnEj0WYBnw9cxl6x?=
 =?us-ascii?Q?AXCrN6Lg0u7ojH0YcnQAJuLKdU0LSN320Sj9Kc7MOvfNzb32XAndJMqeeNY/?=
 =?us-ascii?Q?j0huA/D07oqkTZUSbBitXrG5QF258I1ld9sqV2GLXmL69C+VYcsX7EATO2mL?=
 =?us-ascii?Q?PbxefRB6BAT2b0/OfEAplujoND3Yoq5mJRtQddGufyfa2UqW2rJj052bgKv4?=
 =?us-ascii?Q?FPuhDEPnpT3S5QJacXGGaFl5fnDHSX6slNAVP+CzYW3a1NEBhBlt8D07EAai?=
 =?us-ascii?Q?drflm/1eZ9a50yxCQc14RDydaQE+oViSCPiNtlkkgSyjXvgE5hnNSA7B8VML?=
 =?us-ascii?Q?3VRXObc9gRF+TDKKaiou4cA0qVn/n+I6xgGOfbRzXAFLKxCzQiBJUkZms9pg?=
 =?us-ascii?Q?IbHVJv9Oeouk2pJLcJLmv+6+kKHtgeHTq/dtuM+aIf069Wps6IzA5Tp9IZj3?=
 =?us-ascii?Q?FodXqy5794gpuXwnYkGGwv0vQIASI8/b2WVklAM06q/WD8r3t5DJU4i1IsAT?=
 =?us-ascii?Q?Y/ycOTfDDG63gqrbELvDEkUFAFvT650JGF9ZxZmOzwXx3smiV9PtM71sMO91?=
 =?us-ascii?Q?Cms2lsmLbBLLFaBDNEOJ9gVK0thHCjx7cM5q206kxeilHDpyIGWt3+dmnzU8?=
 =?us-ascii?Q?OeQGxxjBf9itywHHRUx+zMwm+u+7fhGgk1DhXtoVzacPLQVQ+8xjNK3hSPPr?=
 =?us-ascii?Q?EAym9btAJ6JJWobDC9ktR0+725l2/9d8MGTKiJWkXOefZRedhPoN7unAzJAT?=
 =?us-ascii?Q?nB/7Jt/sc6bXqxcuYPpt41iPu1Obacfr/zXGI1mmeg3kjhiJMxy8+c6zHj8q?=
 =?us-ascii?Q?BYz6b9pxBnmEbkORVbGMbaUYhm/b3g4MJMEyCPeLSP8HOcPsWUxglA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O9hmmCgCjqPOlo63MCI6fxl+Ywag1ngC/rKPDZImE4Xa8Etk/K2dxrygvSCE?=
 =?us-ascii?Q?qIJ4B6bQYPpzTDzrz1Jk56/d+6myXrUdPPJmbTxDP+uCXUaThibZBqn9vaha?=
 =?us-ascii?Q?jnRq6miY8gTWhzngupwDa98kNXRKkOE+plri0R+XJoL05P1X/D/ju03qymlE?=
 =?us-ascii?Q?6t3t3YyvjvQ9ZkbkrC2fqiOuIlYqkfY4LTlGQm0tCYVJ65vBWYWoMYyVqYyO?=
 =?us-ascii?Q?fdW+h9lmkMtIVzaGqvVKuhsuoZmCyq2ikIHSbCqjWonSux7y5e0RUd4q6fgE?=
 =?us-ascii?Q?zMG3rqE/NlHaTTaN41MicNdtuTToH2c0XCe5M0RLcbQUwRkMVSMfaTM2E/Zc?=
 =?us-ascii?Q?/Dlyit4wkYAajtABhe3J9/Ezneh564Hh5HQjXMG43jp9NMWeJUajSpCis1C9?=
 =?us-ascii?Q?ERSqNm6Qv9lgrcaCWfq1E3V9IXCnZpTel9e86HUazhlZpsbRuDcSuQQE0hsI?=
 =?us-ascii?Q?IzgA9tyGwSrBLdCf3GbndgD8YEkDOD2HwwwJh8SypuDScXOSsvb0TbW417rU?=
 =?us-ascii?Q?eCbMj/xwVTvcRRzws/q9YnzIdJcyBfj2aE5htRoC5KwTGnT61QoVf055eYP4?=
 =?us-ascii?Q?F/hEHMlmQLYaWqySCRM4fU5t8B/Zd/s1YW3KhjY5IB6V5PhsPsp4zp8Pt0G2?=
 =?us-ascii?Q?MVw4ilLdRH/o6JQfHpWmXPbzONJYwSjAxmIQk58/RSRcn4pTu7JZAenIV/3X?=
 =?us-ascii?Q?Bh+6M/nuDwE5onp0+TJiM7KAQ60+hFrbsr/5AbsJe3Ud1lBRbN3DuMA3m5qh?=
 =?us-ascii?Q?Navn4pwlpL0fQwGiblnLCkb3be+suMkv5btDjoVBgT9GaTbvspDgbyzmCN8i?=
 =?us-ascii?Q?73Gs/CaIVp+tmzShzA9sFv30tOdiUmUQPLWiC83/ZcvmZvWYuMUAVCoxjtyJ?=
 =?us-ascii?Q?dLySWE01e+bru8ddaCkzJGksOkwHlN4W/g/A8JCA+Q+Cfls7C8F0jNHtC4ty?=
 =?us-ascii?Q?gpCQHb1d2non9VDO9hCihBU37nqGUGsIkBDU+zD8t3xRAhbp6Uz4QEUmC3GG?=
 =?us-ascii?Q?aF8/dYiO+FZ1WcCSW+a+i0gtUnzUAvfUHyZ26eF7HjKnse6oTZ+T6dh/eEPC?=
 =?us-ascii?Q?NUedDjf2sj/kaZgl5kAnemrMKeinSTz99/gU8HzVDze+9Ge+F3iXLJPphnVz?=
 =?us-ascii?Q?NqHHMk5SkOm6lk7w4HCkFTKoucD0aDbxT3a8EX7h6tZesywnPqfL1iPRraOC?=
 =?us-ascii?Q?G2It3X1+zw3kuzIhZUPG2OFtc6QT7iqBM0OgM/Bb/kxWlbMOB97p8550A7H7?=
 =?us-ascii?Q?t+/Q9EB8Qk/MCs4mw+pM4Jfb6FL/WTkJ407SUSnF8f6nEPEtXDljHVu7qkx8?=
 =?us-ascii?Q?MRGicZEguP/GFdvLHiLXIg+5ZFtIqh87Ks7TQsSEy/CXuklBg7ckfsXsvcT2?=
 =?us-ascii?Q?hraq6SvHbSS4/ZuEod+slzmtzvbX6ECxqP7mslE8o4+LzyJTHAp+qf3qYIc3?=
 =?us-ascii?Q?fauAE3htx0l7v2EFpeRUqZroXV/hFoiM+W4LfujXq0mo6hb3Iq0vPmZdiASc?=
 =?us-ascii?Q?IUrm1s+qzSEifvJt7QlEknT6KWsghS2JCoUVSFyP/pwltLFQcHKrUKnS7ta/?=
 =?us-ascii?Q?/uEVIUq4qoO8sNmjjgEMV9XTWTlS61oi7zASq+E1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f27291-062e-471a-7a87-08dd7b079f7a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 03:51:22.8938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rWUpcAkf6SjJt030zj1hOS8LsfXpCDurKX+3F7NkBwNxwYegBR17qCPV8a3F5Pc6CSEvp7nBMQ0rGBeTF6PZxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9205
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

Document SCU controlled display pixel link child nodes.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v9:
* No change.

v8:
* No change.

v7:
* No change.

v6:
* No change.

v5:
* No change.

v4:
* No change.

v3:
* No change.

v2:
* New patch as needed by display controller subsystem device tree.

 .../devicetree/bindings/firmware/fsl,scu.yaml | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/fsl,scu.yaml b/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
index f9ba18f06369..e3b9e7e2d040 100644
--- a/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
+++ b/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
@@ -30,6 +30,26 @@ properties:
       Clock controller node that provides the clocks controlled by the SCU
     $ref: /schemas/clock/fsl,scu-clk.yaml
 
+  dc0-pixel-link0:
+    description:
+      Display pixel link0 in display controller subsystem0 controlled by the SCU
+    $ref: /schemas/display/bridge/fsl,imx8qxp-pixel-link.yaml
+
+  dc0-pixel-link1:
+    description:
+      Display pixel link1 in display controller subsystem0 controlled by the SCU
+    $ref: /schemas/display/bridge/fsl,imx8qxp-pixel-link.yaml
+
+  dc1-pixel-link0:
+    description:
+      Display pixel link0 in display controller subsystem1 controlled by the SCU
+    $ref: /schemas/display/bridge/fsl,imx8qxp-pixel-link.yaml
+
+  dc1-pixel-link1:
+    description:
+      Display pixel link1 in display controller subsystem1 controlled by the SCU
+    $ref: /schemas/display/bridge/fsl,imx8qxp-pixel-link.yaml
+
   gpio:
     description:
       Control the GPIO PINs on SCU domain over the firmware APIs
-- 
2.34.1

