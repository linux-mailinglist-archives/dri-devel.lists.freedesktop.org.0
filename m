Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B9CB1C833
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 17:05:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 140CF10E791;
	Wed,  6 Aug 2025 15:05:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DzcJzSMb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011030.outbound.protection.outlook.com [52.101.70.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F7010E1DB
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 15:05:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xW2uje3dem/9lEgeRhJeCc69C58af8GdtHDGuiPFGIhLbtF5zZQlaFrbPgxc4jB5ksf08rd9tvkK9vLgaZ2EDqPEys+j14vO1uAbzbcyUK4+Ucn2yryUcQdZYNA5MjNTiY5+l8tf0KtgEAPp5kngBfMfdOQGu+QKVuHJAg/pmnsvRWzb4jEHSV9kVVMpTTnvVzxgEucUTOvxOaVM7asAoc6Hew4DrYvwwS7I6QbvXX3wLd8FB0iNW18ftl++ALu8N+RS4QjhyxtRV49yVKJ0N/meViM0ZOLhlbb2fSGvSFlmGi3D6qYjX/QJK3qpnCNi0Kbh7hYCsivL3TzaIAuZFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pPt4MLYCAEQPYANek9L1QQlfFcs2JxPa21INawyIleQ=;
 b=NWaBHN9DgAXmLSsjUNGT47tCVy5V4m7Jr0eTmFZDMyaAzzIKpc0Y/FNl5gblRTGMDRgS46gKXr01QxGq1lBEAQwHtGYCoPx+Od2ksyfxcgBGnyulGvnv1/Kqmrm76/IRTcc7dSfL0Iq0Ip0qTYTW5QT8Pvc9BBiHhpJ6BN2ubaXO/w3/u6im6BoUW11OyGjf+fFZzYttLOQDJw1tz7ZxUqYYEaf2TRQGd077TLvzeXU7HoI0QLkttR5JxtAO/vV7NyzUeoqP1JzOnwOicuA8ZpbSnvyoNnmri9r0VxxyoLc5LO26erK1ayPT1i0f9wbGe5d2PD/ZqCjtn3ptQV8dVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pPt4MLYCAEQPYANek9L1QQlfFcs2JxPa21INawyIleQ=;
 b=DzcJzSMbxh6HuDTVVkGkr7el8SSDh2meTdYAEZuMhWVNGHZSKQYTDPtmSKb9RkuKKYEknyxNKkpTTi2zJRC8HZ01JFanjMOLIYMKY0ArbQbMwGBX9ntZrT4LrihbpoxYB1GM5PUkGeyVzZfW+6M5bJSdby3cKP9nbijfydfmrdc7xIMX47brFcA9Vamtt8nqVgILVFwf5KqJDNtiB1A/v9AKGkAXakIN8DGcb0WckNJZHSXU9I6Rp2zhEK+myQQeNahS2jSN77mwChSgen4e9RbUNwspCAOUXPX5e726j/hpYqo2CD01PUN0P1Qko2ZAANU2I7hNtl98M2yqjCPT8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by PA3PR04MB11203.eurprd04.prod.outlook.com (2603:10a6:102:4ab::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Wed, 6 Aug
 2025 15:05:38 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442%5]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 15:05:37 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>
Cc: Frank Li <frank.li@nxp.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/9] dt-bindings: display: fsl,ldb: Add i.MX94 LDB
Date: Wed,  6 Aug 2025 18:05:08 +0300
Message-Id: <20250806150521.2174797-2-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250806150521.2174797-1-laurentiu.palcu@oss.nxp.com>
References: <20250806150521.2174797-1-laurentiu.palcu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM8P190CA0013.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::18) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|PA3PR04MB11203:EE_
X-MS-Office365-Filtering-Correlation-Id: fbffa66f-9686-4da9-ba8a-08ddd4fab391
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lQcOxMalDSQ1cUwnFNfJntiX4T/305lX9XmriopIYAK/3MNbLl/oZEkKcB8p?=
 =?us-ascii?Q?bHmQYnkHXajJh5R7RLQQh2Md07EgLWxAa2pAgYEWjVIddrGrAFGdoFZoG3Zw?=
 =?us-ascii?Q?0KF2UPwxF9LKqxwcYRR4o87gtvnpVwKBUUxbshNrEoCJ2uu+rks9ZEYChd9m?=
 =?us-ascii?Q?BSztOXwozYSjyiwjKWQ2ZkkrfmqGEe0XIJiNKSbuOJxDnJHwajoCTo/h8Gfb?=
 =?us-ascii?Q?dWU3WYgBCU87Wc3WLh+wy9n3j6HsRkEwanh8I9ginpabSjkA8PKWbQMAsz7h?=
 =?us-ascii?Q?0AbvXVBzIdAkevARx+x7zl7kuc05uIrKcO0BBgJ0G6xWcMXINFzmQbkWm+Yh?=
 =?us-ascii?Q?E9EFZcZ38OkjgkcNX9bRSaOPjbm7Sa5102C6j6b+ZKg1eBanKkjsBFJWgqrB?=
 =?us-ascii?Q?oueIXaMAgu3f3yU/tczS+YnAvJDPjx7Iz9M1QDpMLu6JtbEiirg5GK8aD7Gl?=
 =?us-ascii?Q?qrsK7VFr0/HtCrNP7+g7gSJP5o182N53RZQYNQsT8WXbeFI5qnDOMIuDJ1LB?=
 =?us-ascii?Q?XaGWOEKTuOmbj5E2ZiLnzEyV6/5GqNCLD6v0NV3MPKryCP1Er9L7XD0mzw0J?=
 =?us-ascii?Q?JRZPeZYEV+qZmOowmFbTLPxxBusdQSPUvy6gnsD+7dnyfc3vIN8ziIUz2RZb?=
 =?us-ascii?Q?yZjuiF4ZyEtpunvuGPipPZdtW8S0EGwWAG7RYsNxrk7oh+CRxqm4ioqxu/Uy?=
 =?us-ascii?Q?suyYw2uqLxLduJ1Y4WzoTjxVBXqbyjE7+nO1eXiAvFRBI3yEvjX+oawPTNKc?=
 =?us-ascii?Q?tmDJKRnH5ZPhX3zamdlDxSJ2Hx3x0nOnltNjtU6xYUI9PpMVTWGvagJ01NEX?=
 =?us-ascii?Q?5eBO5mM2+0tOHWOaN/SnydHZnpdX1S05G3p7WYrpBJph10VkbE9XFl1bCyLr?=
 =?us-ascii?Q?AkzmCjSrqXVOUU0hx1qHeu4dvKuvWDHIMobBKhNSvvePuTpM2I8hv6sXw0qv?=
 =?us-ascii?Q?KbWSJO8CiANhayHQ3HlwejJc+HgQcgQWnxh86MzjDG1wPUuHOTPzpt27/VV0?=
 =?us-ascii?Q?ZWVM4/DLMqxeYn2qKQcGogEbJPsA0xdm1IaSviqiUQE26G9eGIiDlPvvH9IJ?=
 =?us-ascii?Q?XjnMFcWcSeelJeFoJwli37F+H/B2v3hnNpBMPJM+Qb1i2bHgJy5Igl1PDo7I?=
 =?us-ascii?Q?MEYAwoT65yj0wRlyDqSjc8pEAIQaHGGn3KBhN85Cs58c0Zw7xtuHA73uvHl8?=
 =?us-ascii?Q?KI5XYciSsFVFa7e75ywAIOrSjJ6bgYZN8RC/gjJ4FBLdZojifNoFBGwodJOC?=
 =?us-ascii?Q?0qu61xRar5RTGbQVTOtd7iB2qkt0bhbNynQfYcQHi4CNQSPopGykMtnO1oCb?=
 =?us-ascii?Q?53C4TAtQsJFBLRS2tdrrMiN51itiZXyKWhGEpW3dltHdCPuxFoomETyU3Gdl?=
 =?us-ascii?Q?u7FQiRvNNcubN7PFwx6gbrc+Kqd5DgMTlIRdyF1yX7Hg6MQlBvA9qLaSlfrS?=
 =?us-ascii?Q?UG2tZ8PjBIP8Xbc/kfRNZAtmfEMDbof6Rux2HouTUN3pkziw5ohdig=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?94Xnj+ztm3CHoAkQT7kvwQ434bkAiMX76TDWE3q+JmlORKTVUp1ji6KKmD/V?=
 =?us-ascii?Q?dwf3a1Q+QfVtJphAnqeJDwP0L8VIdHxQbT0dRJsvrXE5izCXkLDtLgyIAmhZ?=
 =?us-ascii?Q?geGLR83Tf8AiQ4jNCUdENYhR345lnaZeCy4JwL+jvZa3IYknVSGkH6kVt6YK?=
 =?us-ascii?Q?HsZ9uWwCWI3XzBwuQ+p29TTSV0fRNY6N7gql9/sfOyrP07ktKg28/F0BsCP+?=
 =?us-ascii?Q?ytOC6S8s6GOap90lyD6flR8xwjqsgXdl1hWqyFLnEKMqTz4i1b/on4GhZVio?=
 =?us-ascii?Q?LhANCJx+7tGZi6aI4S1AEzxrJuVD7QE4ltLn+Os//QtgazWY0guW5iB2T7Gh?=
 =?us-ascii?Q?eo2PDIkyClHyy8uZ9td7DxaOMhh4IficE1thQb+wnA3y6FqBCeN2Jr+BtVFw?=
 =?us-ascii?Q?IZ5E/edy1xo6GgcSkuM9Z2PEpGUHNFQ/TkYTvjzlTaLNwWipJj1gZq8BlH0u?=
 =?us-ascii?Q?NzCd/rpZ5CxWjGwgR2JcIiwDDDL72EENTg5sPjIrSQZSSgB05lPEEtAD8sMd?=
 =?us-ascii?Q?Ny7J4K9N6YIgKcqW/rx0+TJk2YGkodLJGK+dpaC51CUB4IWuMRs3+R6SoIFG?=
 =?us-ascii?Q?1LTyXMG6haB/nB3SivWvny677YFJ5WSJW1lATLUA2Zxxx81jwk0vs8TLb/CC?=
 =?us-ascii?Q?UV78KIYIPcvjbnjSWhsdQXqfSd36MXXhIMmT5Pf8r3VUjJCT9mXqS1R0bPrn?=
 =?us-ascii?Q?7vv8PVvWXEaaXIbNmPIRuXvVBCSQ9PwzeKAnScRC0c5lScCKKMoMqnoSMuHp?=
 =?us-ascii?Q?NTpHj8Ti6GwNRsvw6IMQL1be2RCBieDwTxObNuPzh3S8+pLH8Rr2rAFBRnoN?=
 =?us-ascii?Q?0kLBt1M1/xhYsQiy9GfusaI5cYJayxMQ7nNRs26Jx2p/eGHMefPqngo5bSLq?=
 =?us-ascii?Q?k5IrQTFbaGChFYQn54YvtTDcCTou5upnkGlIvRRnP/YYXEz02RDQKZkm/veI?=
 =?us-ascii?Q?zpBcFPXPC1kNDv6idlaRYVcp41I6f1Bg30Jn9FS4bfXqO0z/zBLEaGbhFWXr?=
 =?us-ascii?Q?yGfVSuif2OLMfqeMghgoxvoN72+vNisfEGv+1yjWxmyuBmK5OV0WAyrCkEUz?=
 =?us-ascii?Q?KzKR7rRwjYReqeuCzpI/B7OgSdUimxlb5mCjOe8VNT0At/7MK0e63+lgSZds?=
 =?us-ascii?Q?wg6F7NglXEGG5aSRmKiE8D+U4Al+v8TgGkNbaYDIY1vIbmZ8qo+O6ZpuDIHh?=
 =?us-ascii?Q?sAYy6aWlU9kymUpbPP8Zaq+mgs0Im9Yozw3+1HVBM4GzSNo9BsEToLnZvOy7?=
 =?us-ascii?Q?oOlrfrekei9c5fvld0rM/93s4MGg7EF9gBKcNfKf4bXL7bxzSV7WovQWFjQN?=
 =?us-ascii?Q?F04/qG8Ad22mdGpRoR97JHg0zT6kP3rtxzkoPxDukfaIDoR0ylvlAvZmJAQR?=
 =?us-ascii?Q?7wso06eNhCoTv92hpHYsb3hMDw8SACvEErwho0MGKiDGj8iKyNVG7OPyANmh?=
 =?us-ascii?Q?dcY03/BpJkezrDNSLSzjsgFjV9k3jAeOzto0FSdEBCQUB9IFrDjzmrh2lBGX?=
 =?us-ascii?Q?mIj3adCgzzDa/cGfOJW08EBFkeNTxhWNwOaw48nTfECDO/Kbo//4DMp9qDK0?=
 =?us-ascii?Q?OuSkQiaq3YMKk10Zivrroy1hUQHFxmHDwQ+fYVVVVAxIOF5OSaWy8LM4dE5Q?=
 =?us-ascii?Q?3w=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbffa66f-9686-4da9-ba8a-08ddd4fab391
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 15:05:37.8523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ORVzAVuQ3hrH8l2gvzKFQXoocj77i2UxUfFXYcDip+ZU5fsYxbjcgz6yhua+M1fiXqoaC8o+R/H+uAVUD8oxHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR04MB11203
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

i.MX94 has a single LVDS port and share similar LDB and LVDS control
registers as i.MX8MP and i.MX93.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
index 07388bf2b90df..a54b8f1478049 100644
--- a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
@@ -20,6 +20,7 @@ properties:
       - fsl,imx6sx-ldb
       - fsl,imx8mp-ldb
       - fsl,imx93-ldb
+      - fsl,imx94-ldb
 
   clocks:
     maxItems: 1
@@ -68,6 +69,7 @@ allOf:
             enum:
               - fsl,imx6sx-ldb
               - fsl,imx93-ldb
+              - fsl,imx94-ldb
     then:
       properties:
         ports:
-- 
2.49.0

