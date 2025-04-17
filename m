Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EB0A92136
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 17:19:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA3510E1A2;
	Thu, 17 Apr 2025 15:19:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="GBG0rMaN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11012057.outbound.protection.outlook.com [52.101.66.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8CE10E1A2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 15:19:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AhoBi9ORYI82nq6evyiM1k8ny/MVUqeE3GZOy10tzDCgUL6Phx01X50ve6uJy1jThVlQO37654ksM9RLFwu5zaSJlAvXHXB0wf53oOHMKnNe/zD6vkCVSAxsLk2r7EPnxYJ30CTfVmlJKQLUE/BAABuFwl5jSW/vf6tS8/4kRelEGFw6bsTzEVnJZJUl3cl9JELofRowtlY0JB3tFfsYQgpq8I91sNFZdN3gHp8/Y9u4+ewt+VWLq6BbpUJC4y9PiySzVwCfaLpUHPRdOYED2HuS39yi6mHeMfghp14lG93mMOt+G3xzwqGlyCSxRAc4IdLOhDHIbGtXL3pI/ZCNnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ddy6oeQ7LY7f/zJVMwgRq9adocUsCevCMk7YKSiUMrA=;
 b=iYrdwATkpD/RSvvZZw3CXigsCHvKyrTZoR8kmOtGKN0sXrHY1HtU3lkymx+eyVfDJr3Dw8YQe1P/oLRyospXENcLhMOoxumYms8Guy6yotc9nq42uvFds+afdWNAFk1lPiiJ9hIsOaSsLYbkzs+jTDZKMbfl3vtYDJfZo5roTdLp8g4jNBSfdZRFQ9OnqBpkMF9bbsbIflmXqZkonaD5awTmQEa0foXxCDPzJKFLQQ6hFYtgFerIfygsd1noZOy+2CesMkMO8gW8KWC7yKE0iYJFVq9uzL6QPONMbi0Bu5+WmrD5Z99PBMCdkcv/Uy9X5VzxE5zwvM2Zycy4mmF/GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ddy6oeQ7LY7f/zJVMwgRq9adocUsCevCMk7YKSiUMrA=;
 b=GBG0rMaN/Ts7MAkJIx9Hzqnc2s3KDc1yALjKXbJO3wp7VYy3GYovRZfxVqFKQtaO1RDaZ49c5RmH7j5n6QCM6ODIqNa5E0u5Bm/RInp6uahn+guMBrcX+B9FhtOLo9dZuGRwVOR23wzc6Wtd4IYCGFi6Wc0+UMNUrsKV2H/iipHYQnvlEkB6A1bPgWa5t/tKZRhNdnGcd1mJ1HpDDqBnJLQj6cprn9YcjWy25a4KoVobIh6AsASpMmZVpWxEp3/YnnG1LO35nhPZOSJg/X8n6cMuGju/FWY4+7KJ0Mt/QjkBYeqZ2+sGvGFhfPgHjkGiQ1CYDGlUn1sIwAcWm43Kgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB10957.eurprd04.prod.outlook.com (2603:10a6:10:584::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 15:19:45 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.035; Thu, 17 Apr 2025
 15:19:44 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>,
 Alison Wang <alison.wang@nxp.com>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: display: imx: convert fsl,
 dcu.txt to yaml format
Date: Thu, 17 Apr 2025 11:19:33 -0400
Message-Id: <20250417151934.3570681-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR03CA0009.eurprd03.prod.outlook.com
 (2603:10a6:208:14::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB10957:EE_
X-MS-Office365-Filtering-Correlation-Id: 5687ec63-36c0-4cad-3186-08dd7dc34882
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|7416014|1800799024|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rH7JqfDHcS8+KdR3FSowBUuqWJGH771TbS6LE0waysme/ERyrGawe32Vfr0j?=
 =?us-ascii?Q?FIN4RxLAwGWhM+LtHx/jU2hM/zZPIStvqCEMzgZWlIzoEo/fKwWhzaQrJXR0?=
 =?us-ascii?Q?FHKy6hPjzuFOGh//LLjc8FbvF4fVA4ghw5zVYPYvNndKSOGgB6f8+kdhTuJZ?=
 =?us-ascii?Q?l70azB2U1Zx9ZuYtNDAHjawWyNnDJfGXbz7UO8lJ6JJ0nL3wsa05SfMNshyt?=
 =?us-ascii?Q?ov6mWbp3fmy6EYJhDhujWwCPlZduNi1ifWVDVpZvGZZJBQ0fvzrVnitXr7y+?=
 =?us-ascii?Q?aoH35BnttMAl25nZN2s/4ZAfVxF13OzE3jqkeneut3O1/qfeAIX7BTLZ7Z3n?=
 =?us-ascii?Q?DGCCW4zAoQz57xhR/iwzG50SmhVbh/3KJHNuci4TAvfnW+MIPHSNBVn6P0Ms?=
 =?us-ascii?Q?nvi0s7FXFf8Q91U2h/RFFrURco/3o6j5veex1YlSywdm76OljX0drWH76qNz?=
 =?us-ascii?Q?8w5jGZb2KxnpfUSTHB3FTTiSONt+h/S6VfIbZLJGkxbNVJxysVTN8nwo5VFc?=
 =?us-ascii?Q?XzPbnXFluw8nLW4vQ3fqqysCH86urK20xi1R6pPMFhVhKHViP+PLmCV2Xskz?=
 =?us-ascii?Q?MSfXEAPzJk9fnOWTQI+WOi49A/EOki0HUXiJhUvJ0SDf2ZK9KLyhPF31CYIP?=
 =?us-ascii?Q?MJfXzdrl5ceZvn/kzFYngF0Rq7RZo2h877Yn56XgY/dh3a+z2tKMwmdqaqVY?=
 =?us-ascii?Q?NSyF+6ve9aJgYjXLSy1IhX1izgKNaf1Rh8ZkpOHh7siGvSD4e8fr9VYkv8Yl?=
 =?us-ascii?Q?89QWtn8hz5LVx8rpd4rHMNurXSn2bt2JDku20C8Nwhet1V3sAFn8+fiyhd4/?=
 =?us-ascii?Q?0CIM9a4zR9KgKgfG4xamOaB2TOaYE4grrN2Mf+ZtqeY5n7MoIM5LxDdP/fEy?=
 =?us-ascii?Q?kO1gR0x3iS1A24aDrlKIL6eDNr4BIsgytUeo+90N4s3NqMLM5HyKqxJkCyYK?=
 =?us-ascii?Q?I2LWzgFXXU/O8AELqUuT8JxlFStLj1tf4VEFZ17P5pNLta8w8Z9byDSVHQ+w?=
 =?us-ascii?Q?47ciSyz/TAxwVXDBCPK1hC4eWp/nVEYm3HFgeAtiJZ8vhAvTX1S2vgT1eNsN?=
 =?us-ascii?Q?e32S/fpCPSF/mOHREhhEpPCg/574cI+NPz2xctLgwWjKu21Fj8IKRT2Xciy5?=
 =?us-ascii?Q?VKQJ5Pqpczqa45jgrTPpdkJjC6OHTnrsFTCGDejNHs0MC4wzAZ1S+AXQ+z1t?=
 =?us-ascii?Q?1OFVY4jiM7Hbfyp7ZxezVri7MrN3AP9CT+ua8wr4siJu/IZHbZZSxKF6b8U9?=
 =?us-ascii?Q?bVcAzTsqr+4vwvrQ7deWTyjjlytrV409w25KEhte3+/WDrMriNh9XE6TU2oG?=
 =?us-ascii?Q?6lxvKQcwCwV3BJHD88OTCQU/fHoz83Lq+6b7q0N0zVCkqSvOMGIk5KLAQKlo?=
 =?us-ascii?Q?/ov4r2R4GDkwYklYrt3Unb8Klhe/T7PU9lGew+QCa3WvCDON9H6eRzG7/yWw?=
 =?us-ascii?Q?4bIS2PaUof0qJYL27/PNuuoyFMHRwwwT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?60/3GlTeGjj15pTxUzJj0jA77T4V63vMi5jxRsuBrkTSecXRjQngUizv9oFB?=
 =?us-ascii?Q?zkMSLDvxMI+9NgWg3+2V08rzuSKylVpBI19rFAd1jCT7gwd93HcJ+ik3FiFl?=
 =?us-ascii?Q?mKPjFsRAOY1WcHmlOSpdZMPh2VYQ4R5ie2YTq8JNTkCOvjnc3KR1UqNPhJ8z?=
 =?us-ascii?Q?GIgwXn7KEscf8V9t4LgPchLBWXx0ADrfVIwxHFj43xpfuUgbdAwdkUCOrA03?=
 =?us-ascii?Q?SCfQwPhWnQ4Fzzg1bqNyG+1934PsA7OyjJbexn/MaWJ4crE/Yb8KvpjAHqD8?=
 =?us-ascii?Q?LDSFUp2PN393RKXChAAXMy7DW8nAnS4bMT9MhDZR/0soWEuXlxlCvU2fwLUp?=
 =?us-ascii?Q?OtBbEKpJoR8fiRLwc+5VenKWjtasJR5AXr5B6xvFn9ZZPn1iFFjpAJw3qD4O?=
 =?us-ascii?Q?wWj+5JIX4wQQmEQZLS0OOjAkbJIviN6Qkf0p4xNnp1y2/qD7MWR1a4LNJMOU?=
 =?us-ascii?Q?GjReOjaufJKQ00v78qsNQQbI7qi+SkqNBq22SQ22N3KM6Z5j2bqirjljmHC/?=
 =?us-ascii?Q?LPGU9foFi6zAVJfDRwv8kKJIZAoZz1iqWs4K0FPj9d2OQQKeNunXzEufdRPo?=
 =?us-ascii?Q?IGNdFVYw+rtR3Rhh9UWOY5htue7B4LhpVqgebF3rAycSe0V3peToV1hWHcCc?=
 =?us-ascii?Q?YxCTJ0LGMwSpXGgaZ8zIrdENQZJcJM5XpVY7aRKGOa+csWk34AMDwaMgm+Qg?=
 =?us-ascii?Q?UfHBUT4ZVsIZ/CAeVckay8gd0LklQ895bz6TgK+CIREbk/MRU3KM7AzqcfhE?=
 =?us-ascii?Q?NZbUKgAh1yWKEvhHS3eZot1lBSdlImLKwcXDqIvbCSE9QQPdsAbQGkuH2VnZ?=
 =?us-ascii?Q?XerGxy/HRtmDImVCp0jlGsOfeqmu1KF80xU2K/E/pprCsx7mBa/0PysrTept?=
 =?us-ascii?Q?QiDHZrn0hLuSlGGBJ5ClV0MWR2On+HoHqzbyaEwGeoD5dratbhlT6l4pX7EE?=
 =?us-ascii?Q?wRB5LUEg6dej0cWvkjqHgjNes+eKWyF+LVnmKv9O2M0B9Ao5QcB4reaApMyP?=
 =?us-ascii?Q?QUmmcdp5YDEugt9ZqMuh7wvLrxi1XuI/TpbkG6BKwgwoHQWG1Y3kXtP4vs3P?=
 =?us-ascii?Q?Y0fCpmnckWEGmsh23vE7VET8u7CGLQzDesfh35H06Mu9Ws6fGcLO/sx3+OtV?=
 =?us-ascii?Q?iego8Vb164bH6La+4s5Z+qvjQ/Dv3uwKk3xJhAVny/c/QZ5mJivUVSS74SjW?=
 =?us-ascii?Q?HpVvVpU27BgdVdNkj0EYDHCgnzGp7ITXgazquKn9xDjDkD2e+r+Zzr4JXRPY?=
 =?us-ascii?Q?CyST/yPI9Hdaoe9pimljIMu1Pnt6VHwHpWmBeo3KE2ak/gpStA+1plh/fSSM?=
 =?us-ascii?Q?XNaMgGteW4Z1e9CUVcynHeEhjBC4w2LLWLS4S2GkGmzKR7yfcYoHa8fcAa6t?=
 =?us-ascii?Q?hlhPD8fLTVlgb1hbT1K5Bx7GEni256zL1JFwwxqlCBv7DjvmPLmcs4RVtWkd?=
 =?us-ascii?Q?+W3VQZNbKQvhhkPjG+Z2XD6dWNwZAvtlXBVlyBKssgBpk/QSlZGGLyQRTiSg?=
 =?us-ascii?Q?fE+ZNspy/cLtr26kPWZfC8a45/o5JEcLBPyqjxhncTipeDyY+ugvcGje9PrF?=
 =?us-ascii?Q?bc1tDMunJptoD2EWN3U=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5687ec63-36c0-4cad-3186-08dd7dc34882
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 15:19:44.8644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TF4jxES/9UP2gsqR1KdSSGnyx5N2UzYXTz4xpKdHuya9oxbxVBcaV2LfAiFHHXWGmNVaYKgQsC3wYQCP7acLcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10957
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

Convert fsl,dcu.txt to yaml format.

Additional changes:
- remove label in example.
- change node to display-controller in example.
- use 32bit address in example.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/display/fsl,dcu.txt   | 34 ----------
 .../bindings/display/fsl,ls1021a-dcu.yaml     | 68 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 69 insertions(+), 35 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/fsl,dcu.txt
 create mode 100644 Documentation/devicetree/bindings/display/fsl,ls1021a-dcu.yaml

diff --git a/Documentation/devicetree/bindings/display/fsl,dcu.txt b/Documentation/devicetree/bindings/display/fsl,dcu.txt
deleted file mode 100644
index 63ec2a624aa94..0000000000000
--- a/Documentation/devicetree/bindings/display/fsl,dcu.txt
+++ /dev/null
@@ -1,34 +0,0 @@
-Device Tree bindings for Freescale DCU DRM Driver
-
-Required properties:
-- compatible:		Should be one of
-	* "fsl,ls1021a-dcu".
-	* "fsl,vf610-dcu".
-
-- reg:			Address and length of the register set for dcu.
-- clocks:		Handle to "dcu" and "pix" clock (in the order below)
-			This can be the same clock (e.g. LS1021a)
-			See ../clocks/clock-bindings.txt for details.
-- clock-names:		Should be "dcu" and "pix"
-			See ../clocks/clock-bindings.txt for details.
-- big-endian		Boolean property, LS1021A DCU registers are big-endian.
-- port			Video port for the panel output
-
-Optional properties:
-- fsl,tcon:		The phandle to the timing controller node.
-
-Examples:
-dcu: dcu@2ce0000 {
-	compatible = "fsl,ls1021a-dcu";
-	reg = <0x0 0x2ce0000 0x0 0x10000>;
-	clocks = <&platform_clk 0>, <&platform_clk 0>;
-	clock-names = "dcu", "pix";
-	big-endian;
-	fsl,tcon = <&tcon>;
-
-	port {
-		dcu_out: endpoint {
-			remote-endpoint = <&panel_out>;
-	     };
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/fsl,ls1021a-dcu.yaml b/Documentation/devicetree/bindings/display/fsl,ls1021a-dcu.yaml
new file mode 100644
index 0000000000000..7246c89271a8d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/fsl,ls1021a-dcu.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/fsl,ls1021a-dcu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale DCU DRM Driver
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - fsl,ls1021a-dcu
+      - fsl,vf610-dcu
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: dcu
+      - const: pix
+
+  big-endian: true
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+    description: Video port for the panel output
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+  fsl,tcon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle to the timing controller node.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    display-controller@2ce0000 {
+        compatible = "fsl,ls1021a-dcu";
+        reg = <0x2ce0000 0x10000>;
+        clocks = <&platform_clk 0>, <&platform_clk 0>;
+        clock-names = "dcu", "pix";
+        big-endian;
+        fsl,tcon = <&tcon>;
+
+        port {
+            endpoint {
+                remote-endpoint = <&panel_out>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 65e0716554203..02504134e1f5d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7894,7 +7894,7 @@ M:	Alison Wang <alison.wang@nxp.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
-F:	Documentation/devicetree/bindings/display/fsl,dcu.txt
+F:	Documentation/devicetree/bindings/display/fsl,ls1021a-dcu.yaml
 F:	Documentation/devicetree/bindings/display/fsl,tcon.txt
 F:	drivers/gpu/drm/fsl-dcu/
 
-- 
2.34.1

