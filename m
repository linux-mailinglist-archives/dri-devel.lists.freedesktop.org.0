Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 485B5A920FA
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 17:11:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 832BC10E2C7;
	Thu, 17 Apr 2025 15:11:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="NXKL/xlE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2072.outbound.protection.outlook.com [40.107.20.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 263D610E2C7
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 15:11:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hjAT+3a2SC3ccwOxK+cVrpYRhqDfEMPSJgajLTx5LNvHMCvcb1nOhLGV1aznSOE9m8sQ3nCqmFEdD89Rd71byeEdpRf0nLU85ZaR5Lz3QbbhN8+QdZ9NJqqHi7pGq+3ODb75pp+7GNC2SeLghxoqZ5EldSjx008d24IpLZdn6gt2zwzC5gvSg90/VYZoHwR3nyMgc15HLg9k4f26kMJ8gFD3QCQnM6UGWlL+nYItV49AiVdWDcgBVOAn0fZMND8+f8kwgSTg+CVed0lYVWQ84LHIik5oCOxTNlWUe67b9GDAm7THcu99BZlXdgcY3d1GMJ/Rbwl4C+UYXHsjwD8HIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+o+zCxwIw6UMCsufBRupWRGf8L2PqK05u07d0P+OUs=;
 b=EIX5xxBLR1er3d/T7BKCBaiSxgb5GFaqQku312tnv5hKjW9jSSvWQfTXQjY9jd0efP3BHEHhOxVaPcuVzQ7/2cvdVY3G/SgSWv73icBRVnYlXLP513UKzZt/JH7VfNz1LwyQ30hOul1USi5YoHPpDLlkNRGQBEULI6mG4jo+chqBJetn8ZFncHKtdurvQ63JgnbVmsAel3DcflsUU99JmyQbcjV72EFPdQikr6rwyI+JmxEDbLjKRnZgfneFhnslt5uS8cAA1o4Uk9JN7UuVOJLvRLyubQSI90l1x2xtwenY2YOZfU4bvzIgu4WKQeVCidCB9EJBWlSlX8FYqMNmnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+o+zCxwIw6UMCsufBRupWRGf8L2PqK05u07d0P+OUs=;
 b=NXKL/xlE68HOJsLdYL1Siw2RVHfVy4C/CbhNWlf0SV/PowOwY5+AOKB5CAgeaJrs1ZMhjN4huncTYdDgtH0WkKknN0m5sBgGyEBGeuSZybqQNa1JjBwOkpPOUKeLriZMp4snesNUjZo/YSXtJw1ifRxZFBInr2et42jF3cyh3ll5V5o8vnrGjTI9n/RIuf2ox00zAQVK664D/1H5puHAHGo4TMFAqO76g1+5DpChMYY3Up7n66tG+jjX8jNqA03by7ri6nKBzV0pxgYmeLwnno5ECHJ+5XFqegBvYXEdSQ+yRJb+HjIu87XvrwHU1/Z3FU4j++1mJFpyYK1CLWAgwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM0PR04MB6817.eurprd04.prod.outlook.com (2603:10a6:208:17e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Thu, 17 Apr
 2025 15:11:47 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.035; Thu, 17 Apr 2025
 15:11:47 +0000
From: Frank Li <Frank.Li@nxp.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>,
 Alison Wang <alison.wang@nxp.com>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: display: imx: convert fsl,
 tcon.txt to yaml format
Date: Thu, 17 Apr 2025 11:11:33 -0400
Message-Id: <20250417151134.3569837-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0025.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::35) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM0PR04MB6817:EE_
X-MS-Office365-Filtering-Correlation-Id: b3fddc83-f398-4b3b-cd2a-08dd7dc22c1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|52116014|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mo3AQMXk72Z/pJUEIuVkzFNXKC5cpOCIdSKeUjGnJOctWgdXWC+VkPVUZuvm?=
 =?us-ascii?Q?EFHLuDlMrn2wKp0lZ3sSmvybvpRF3+Mcv+9G5XMS8uqQrWvwlncmTSOCUNSw?=
 =?us-ascii?Q?GtrfBn80G1udAOpel74MP5QWG7tj5wJ2AAp33B2KgEWAz6YtZI96QEcMrDSj?=
 =?us-ascii?Q?L8uDaWzsJRdK7XGWXbiZVLh8KfysrgnNFs6+5PkOsyhcPTSh4YZlE96ljrc8?=
 =?us-ascii?Q?dC+Q5oo9Ku/yrwg5f15WiqcUZQhodTV5PIHS+A4IwZwXKZpVwpl6IWsrEUjM?=
 =?us-ascii?Q?oGOm0Q33L9z2eBIjRNni+YGMHmPOsSF+0/n1+iXgb/yCL2lBsUZ4WWstAp2P?=
 =?us-ascii?Q?yY0fiUevSP01DjYWy+Hco5LZoV6LlE/H95FfGpcfvk8mPILaWAFBn2LEbQqY?=
 =?us-ascii?Q?o/uK2kIU7v1Os3EGHOMlgIMMOsa8kM9ZZaS4NRPjME0Q4bABJaQnqhLFyWDx?=
 =?us-ascii?Q?5E1a6PGfs2GkdI/5/oOzN0l+Pcmhspn0uVdZJuUxjnwth92WQs/+Cy3cwAt6?=
 =?us-ascii?Q?6I9fjOndCfrlFauryoO+dZNASpY1tkVeb0xKidXMY9YtkRywGoJyMmROjYk2?=
 =?us-ascii?Q?PGoKMoJfkfm3ax5CIKddDFUGP4j99MQOIxQii3w4FsGCo2CEJaUDYAKOuZw+?=
 =?us-ascii?Q?9xMXJfYAhSDV7X5BzfhafkrZgkBlkV7Xhxzl1lLN3wfxP7MJYm5R1ln0H8ly?=
 =?us-ascii?Q?X4Pi5EjNBPpU+FLnbpr+tikJCOdSoNIQQjSTzn50YESKrDfycNs648EgTo7A?=
 =?us-ascii?Q?+PAZomHZBUv3LFNn+QTOp3NHXq4MHWOsIX6IYDE+7XPZ9X7jclsjgwWmR/Zp?=
 =?us-ascii?Q?7KuIMkOG5gTMKgJfcqXTUqPHYRaeENXJl8kzEtgtI3PTV/qL7Zk5w0yt5mg3?=
 =?us-ascii?Q?mWp07f/IlUG2pWEPY+stgCeMmHGP1rwa+Vp2Uqj5LW8JOELTUgybsxkmbnL6?=
 =?us-ascii?Q?8lrk9KxePQZ+hSOehE3mjOu1R8Y/uUqsNLTTzcXwH7B4BWH5TsgZIhcmJKAC?=
 =?us-ascii?Q?S9DaTxD5Ym07mlbhKV0Tcdj1RblW+F6oQBXsnOyLvZ3Wq575XoZ3ZfM9vkjb?=
 =?us-ascii?Q?ss5r6t9UT4s3pRcLW3U0o+BHeXddEUVSo+50Vu7b3apNJm3oQ7DO+LHmtmxX?=
 =?us-ascii?Q?tf/DIgcd4RfhJ4e5bDjSQbTHI99dgBR9qpJmoyucj4b0aCxSvfVfLXU8ovyp?=
 =?us-ascii?Q?2jITIPkQkaecAX9HGahio1yAOy92LYYkYwPKIA2CU2jRBku3qQ/zk67LV3/j?=
 =?us-ascii?Q?EIdeGt/hmz9ElHZeZr5xii+teQK4A9yfHd6ut1W/IhbPn6LmRiXrseg1g8vZ?=
 =?us-ascii?Q?WB2ZTw97ZKXiKVv964tQIdDd9288m8nRsBsSyzoTJJSkpJOl1yHgYF2RdBCU?=
 =?us-ascii?Q?SJQgv6qyrAhn3nYCzXkW86ZQTAsWEpaq82/ufOl+QgSJiY0DJn5R9sHPvdwO?=
 =?us-ascii?Q?f60S6vhCw1DwExQ6pEqL9yK+2f663tw/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(52116014)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DJIivl7+Hf51dDpiNdx9cmZyA9L/MNsIr0uGbBvML7UspQbl+YOQQ21bQvHb?=
 =?us-ascii?Q?vVbUcwRlVqoJHEgRo5rXBA2paBiciK+gjzwgE5kfWIKMVYBs7ccoEzeERr/i?=
 =?us-ascii?Q?m2c/LkKht1D6bUFzuygNFSqEDLSTSHdhi7fJAzFFOXbkmLvgO7qmCY68U2GP?=
 =?us-ascii?Q?PFnPUzP/DqXb6TovBucs+dobxqZPvZwe6QSUyTZmm1jMHtwEcbOtISTPrxZU?=
 =?us-ascii?Q?eOfe2A0tuHU5Arvq0iw8cAXvirMezulMnGBFFTQD/SOyIhyyqJ7zFh5tcxFs?=
 =?us-ascii?Q?c6bwWRDCg4SJSBobMmSgnBLwqRMVME2mDzkcTgVz7SO8v69vHq9ZYb212YZK?=
 =?us-ascii?Q?+A2DPXsY/S99I4x3cEE2z2I37hSc0+lJk/bbaR0vFFv4uXtHdieeC8cBJqTa?=
 =?us-ascii?Q?DiHH5XV0WMre/xTFzlt5v42rGq+AXfLJ0i79dA4HCVVYdzOk4jb3pZi0fGsM?=
 =?us-ascii?Q?KoBthyfBlR4q89jXMsJSrayYdnfgZbMEH/hls5qoxE1p+yiiwTcsjkKk8SwY?=
 =?us-ascii?Q?Dq9odRChg3j+p3NvJfYE34d7c21c1C6sNubgooPBl0quE5Sqgm7etTrJWrFF?=
 =?us-ascii?Q?H4hnSoElfrqDu9/g1ngmuh2/PQBNKTrGW/YYpehBfFT0YyV2aiAXQGoOy5sv?=
 =?us-ascii?Q?gyYIHF8DGffDxgCEdeGDW0m1uMa/2zsUGBjhcbD52P69h/YKJS96d766oDH4?=
 =?us-ascii?Q?dK/+txRveY7XTYsyuNKDzZra35SuFP1Y89RPUy6k/RSRu+S9MDnfbl9Tyato?=
 =?us-ascii?Q?+ijdlifPoPOqqZHx0Tl9Q//dzJdyDI4cjWHoAkjyfPycEvsiA8kZiRyOp3AD?=
 =?us-ascii?Q?w2SzAVpVyjakDzZcxpeh2e8Wg7AGjkR1ry+aT/1D8ixie8wNDSYqZC92hebR?=
 =?us-ascii?Q?djX7muONoh5XALa/bD9Su89JUDIgr2z9qXu+MS8KbE/1q+v2ryYFrFK55quU?=
 =?us-ascii?Q?jSnaaTgYdpg+iMiBo4M7+2OKMulhO8u+8DsUoOpP7dlbX1BLhvGH0BeG0AZr?=
 =?us-ascii?Q?FamU6JlrdTKccKuIJLih02sivkGRKfaWRQSKvju4Ji2ImwsVFZI+jvzLOkDv?=
 =?us-ascii?Q?Hsf34+q8CZZw2CkXDp/kcvKR0Cdf/36utbgxM8VbXtRFkaOSwtD77D+nSwTL?=
 =?us-ascii?Q?VOti0hoL13QieVrC15de/OGSHmnk3i26oRGhrRjUrV3ZrziPNkaCcuPFNq6V?=
 =?us-ascii?Q?RNtCcVK9Nn0xUOcppd0u/IFez878mDoSsgA/YtvWRnxm14ydtqQ9aQ99kJIN?=
 =?us-ascii?Q?h7jWFhJPffx0BUFMP6fzW2T3K51f9N52QDr7DvZU2Xyt4DBCWiHwozLTvtX2?=
 =?us-ascii?Q?ohjCA5NQZTUTJ1NNVHSewdPGXIok/7ZPj1NMz1yEAMlNGz+W78LpdQ5WBh0z?=
 =?us-ascii?Q?+bEVf2NX+PVkXzfNY2/JGsBk+r5Ag/tIb0pzSypFmfuoQRtp+AVUk/3dzpM0?=
 =?us-ascii?Q?NYbfjkKm2hipu3SQ34P2FaKRGTLm0sa1HSq3MVgXhrGN+Zmw9nucPgG2lVFf?=
 =?us-ascii?Q?znj1+zk0xZSy1mhDimyDarJ1r5fKUGu0aSBqCq2l/imlRfQiAfgXzUIspxuC?=
 =?us-ascii?Q?9m7f3g5f6DMcWcp9LdM=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3fddc83-f398-4b3b-cd2a-08dd7dc22c1e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 15:11:47.5929 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S8dOXfcy8+11DpSYtW8L0s6itudnRfB4kjtvVcVAchUYO3gwE6rzyzB4zeBRBSchJHFFNCVMiUTmAAA1kELnSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6817
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

Convert fsl,tcon.txt to yaml format.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/display/fsl,tcon.txt  | 17 --------
 .../bindings/display/fsl,vf610-tcon.yaml      | 43 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 44 insertions(+), 18 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/fsl,tcon.txt
 create mode 100644 Documentation/devicetree/bindings/display/fsl,vf610-tcon.yaml

diff --git a/Documentation/devicetree/bindings/display/fsl,tcon.txt b/Documentation/devicetree/bindings/display/fsl,tcon.txt
deleted file mode 100644
index 475008747801e..0000000000000
--- a/Documentation/devicetree/bindings/display/fsl,tcon.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Device Tree bindings for Freescale TCON Driver
-
-Required properties:
-- compatible:		Should be one of
-	* "fsl,vf610-tcon".
-
-- reg:			Address and length of the register set for tcon.
-- clocks:		From common clock binding: handle to tcon ipg clock.
-- clock-names:		From common clock binding: Shall be "ipg".
-
-Examples:
-timing-controller@4003d000 {
-	compatible = "fsl,vf610-tcon";
-	reg = <0x4003d000 0x1000>;
-	clocks = <&clks VF610_CLK_TCON0>;
-	clock-names = "ipg";
-};
diff --git a/Documentation/devicetree/bindings/display/fsl,vf610-tcon.yaml b/Documentation/devicetree/bindings/display/fsl,vf610-tcon.yaml
new file mode 100644
index 0000000000000..06bd680524a56
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/fsl,vf610-tcon.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/fsl,vf610-tcon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale TCON
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,vf610-tcon
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: ipg
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
+    #include <dt-bindings/clock/vf610-clock.h>
+
+    timing-controller@4003d000 {
+        compatible = "fsl,vf610-tcon";
+        reg = <0x4003d000 0x1000>;
+        clocks = <&clks VF610_CLK_TCON0>;
+        clock-names = "ipg";
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 65e0716554203..a1e4c9a6038cb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7895,7 +7895,7 @@ L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/fsl,dcu.txt
-F:	Documentation/devicetree/bindings/display/fsl,tcon.txt
+F:	Documentation/devicetree/bindings/display/fsl,vf610-tcon.yaml
 F:	drivers/gpu/drm/fsl-dcu/
 
 DRM DRIVERS FOR FREESCALE IMX 5/6
-- 
2.34.1

