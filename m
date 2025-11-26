Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB60C88F44
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 10:30:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62CA10E53C;
	Wed, 26 Nov 2025 09:30:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="fCPmO2Au";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011038.outbound.protection.outlook.com [40.107.208.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD3E10E53C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 09:30:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AoMGZPZJ/TGt5XYwFc2qGdUAcBEmcNwwQLyfY7prXUlg4CBvDaUF9fx87dliMHLaLwm1HkphMf8dozsDY6MvsyOo7d0y6rphA5kKdWLz/zwKIbutFZoITpHDRk3bYO6fWjpZ9Jjs28v1wrYwHD/MKNEYsO+pZqsrqkQFUy7wCu7/+1ir07NAUHF9JHPKMgusktICan1Li44bPKC/Ox3WngDHKaFrho2K/sish2OljWfdtTcc0i0WudpktvXJZUjmqFEL7dgUORPHOR2uv5KoWVFf8m9IQ4Xmlc6Rihj2HGdMMglqTyX10lEFA1fS4NLTELOLVBQuZaZDsMC7NR1oUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o940KvoexCxoDZzI18kL9E8vcYJFhppyG5ZJedfAtr8=;
 b=iJHT2rVxqiQCbSPSBf0hiaYnX0pHGCKegcnNzEmyHMANGykqGCsNowwEdCVI+78jfPjLBBbcszsGD+f6+/38T5M4PuySlMANFTH3hEgmv0LYLJjoHtHPaoBrrrtS86eIv0xpckv+BkyHgbZzoe42zcCMl4dtmuUEmqBvC4h9JJIGxA9TQMdD4CAl7dW90QHbZ+5x+n14KGHrWQC2nds0ItWgCepWoLBu1oZVCJzjrAEFWVcKob/aU75pQzzTIsKoBsRaS5bAfhHnyfaRkl+5Zo6zryK9fU4eGWjMq7eGEILG1ibqumXhmuQ6J3pnUpV6mtcPoS2vtAAWxaTwmp3ylw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=cadence.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o940KvoexCxoDZzI18kL9E8vcYJFhppyG5ZJedfAtr8=;
 b=fCPmO2AuYPdvGAAQJp8eQYZ2x7CA+tUWSxXgRNen5M4hwlsTJYhln75SEn7ILdwmmnYvQvZ78+i8Rj1dPoDzVS+qy9VenwaneuxZtrh/uzBB/JflPSa3UCU++aMhRgp9M//MCfDS3EcRLed5d8y1TLxRUYbsMvntg05TwdvhxdM=
Received: from CH2PR08CA0018.namprd08.prod.outlook.com (2603:10b6:610:5a::28)
 by SA3PR10MB7022.namprd10.prod.outlook.com (2603:10b6:806:317::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Wed, 26 Nov
 2025 09:30:00 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::fe) by CH2PR08CA0018.outlook.office365.com
 (2603:10b6:610:5a::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.12 via Frontend Transport; Wed,
 26 Nov 2025 09:29:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Wed, 26 Nov 2025 09:29:59 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 26 Nov
 2025 03:29:56 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 26 Nov
 2025 03:29:56 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 26 Nov 2025 03:29:56 -0600
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AQ9TnVs1000034;
 Wed, 26 Nov 2025 03:29:50 -0600
From: Harikrishna Shenoy <h-shenoy@ti.com>
To: <robh@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
 <airlied@gmail.com>, <andrzej.hajda@intel.com>, <conor+dt@kernel.org>,
 <devarsht@ti.com>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <h-shenoy@ti.com>,
 <jernej.skrabec@gmail.com>, <jonas@kwiboo.se>, <krzk+dt@kernel.org>,
 <linux-kernel@vger.kernel.org>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <s-jain1@ti.com>, <simona@ffwll.ch>, <sjakhade@cadence.com>,
 <tzimmermann@suse.de>, <u-kumar1@ti.com>, <yamonkar@cadence.com>,
 <pthombar@cadence.com>, <nm@ti.com>
Subject: [PATCH v4] dt-bindings: drm/bridge: Update reg-name and reg
Date: Wed, 26 Nov 2025 14:59:49 +0530
Message-ID: <20251126092949.298530-1-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|SA3PR10MB7022:EE_
X-MS-Office365-Filtering-Correlation-Id: ff6dc82d-50e4-4e70-4c28-08de2cce5eb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|82310400026|36860700013|921020|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1D5BhIzapJHWLri7/CZJWh7esTE9lWGjU3dpWh3vFdJ1CWoN7W3LZkAeTbor?=
 =?us-ascii?Q?JOPbq7blucohuRB8MqmS2SrEg7+rf50TkRRZX/4ZWuZeffxxCSp9aAG8Trt8?=
 =?us-ascii?Q?Jj3ZPwd0AtWXe6mYNOeXcoj090y27bEvhVtwmHmv9asm/Nj35QsLU02lpsI8?=
 =?us-ascii?Q?XoTJ5IuPL17cpUo1YVQbWjPu/HN8xYcWqZVNWPyrCHof7DJQ8cboRu57uG0g?=
 =?us-ascii?Q?LBMeWhamcWaVI0et/z2r1OzlmwTr3RK9TyN11VExP+EEalZO/Dqsgrz3/80b?=
 =?us-ascii?Q?hBmF2LXvLlvQ2xG58+iNu8D4qMfaK9pnT8kQvp0uhvQ6QzvBhrgYJTpSk+PL?=
 =?us-ascii?Q?TVHfgOQitVt3mFHaqFoMbxc++Q/VUSbZoxCqZImQnSaA09t2jH/VjF4ZShNP?=
 =?us-ascii?Q?C3apgqnUju6AoPrJBIxfHWyTSSGXBfNO+aoa6RAOJCpR0zAzwzuHGVtHm+57?=
 =?us-ascii?Q?PJ7XueMTF7LnmEjnlC4cRFWMFtk/tTIYh6tQgijqvGiTIktZBkTIqmw3WNcE?=
 =?us-ascii?Q?7CPhmBvawpmq5wHyhNE6fdoscyPsoS1JRo8dge8D0NSaVAW+/eg2lNysqVs3?=
 =?us-ascii?Q?uwGTlsnk7KKeHhDwsaxQwR2n6eH6RdyqeZQrYUIlqibOvNBKivWTmVBdfHUi?=
 =?us-ascii?Q?gTuy8IgS0KvasBch+Rbf8Ld0g0pdgXcRxRy0f+/d3PcDJofcvRYtlksr6dkm?=
 =?us-ascii?Q?9r8gLZNcpWZvSV8XSr0ePDBTqyFcv5Ag3lNrJeA/PSY1l7QFpz1YzVpg/xp+?=
 =?us-ascii?Q?HSTdaAb7sc1GFfG5/kS+g6wV2/hGoUx6ZUKInS5TK9T5Lr8i+8vd727hz/QH?=
 =?us-ascii?Q?Lw9BaggKQ9NnwOAH/4Vm37BiwC+D1ewmWiCLY233v8vBLm0ZP0wB43SOcRzK?=
 =?us-ascii?Q?sK6YU4feaOWse0KFDYpKixjJqTjHTAyxcAfqC1eEtA7wlcGIMzwuFGpzg1Ml?=
 =?us-ascii?Q?aWEfFrB6sXcLVgd+8cG+979V3nletavLRgdw6Ci9zL9Br3QsjBaeCv0Tjtwj?=
 =?us-ascii?Q?RhSILzXNLMe/Y7BOlj+pfdNYmkg1Hj0PodG21p6V3xfxDkK0+X/sYgYBBmAH?=
 =?us-ascii?Q?OW0vYkcqY1PBr9xGrc3wuefwWpokKWK0+V2+RftjrJ1o2/qXym/iwTOzKWp4?=
 =?us-ascii?Q?QNyPNQUCwNXWQnVtyhSQm4wjo0gQkzIlml59jpVjU5iBaLtLVKHHPEXyVxw4?=
 =?us-ascii?Q?dYGSucRxRYk6qFqRK8zLy11lA04W1g5EQHdlm37/dmjRqJ5B7O6TzkYO3yiH?=
 =?us-ascii?Q?ajEIYouBfWGOk8NVb/d0+vQPNFmdyrRmy22M3DV8b1uQ9ogjssncE2y5RZH1?=
 =?us-ascii?Q?/Y4d7GBQRYhamFys50erCf3Xo08suAG2d7JHw2xTJW3KU/tcrG6Ygu3vcPwK?=
 =?us-ascii?Q?5AaPrXhYh51K/LGkdXfrZVifUqs8jj7I7qo9FMfNw52tCePR1CJ3P/rU1VZi?=
 =?us-ascii?Q?LoElEYEqse43MVCpAzp0SlZgc3FDEauJeGWbm6fmcDAWiTM6iZyHTq0736ZY?=
 =?us-ascii?Q?nIxhK7+r1KYeRn/BYrBapk6v/c7G0jIgTW4t3D5t0ZpCf5dK+1VsglEsrLuV?=
 =?us-ascii?Q?RB0w/sMCgGf+Pqwe7jHUwT3+iGMiNol2ZYo7KYTk?=
X-Forefront-Antispam-Report: CIP:198.47.23.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet201.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013)(921020)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 09:29:59.6273 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff6dc82d-50e4-4e70-4c28-08de2cce5eb8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.195];
 Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB7022
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

Move register name constraints and reg description lists to appropriate
compatibility sections to ensure correct register names are used with each
compatible value. The j721e-integ registers are specific to TI SoCs and not
required for other compatibles.

Add DSC register descriptions to align bindings with hardware capabilities.
Structure the reg and reg-names constraints as lists according to
compatibles using oneOf schema construct.

Fixes: 7169d082e7e6 ("dt-bindings: drm/bridge: MHDP8546 bridge binding changes for HDCP")
Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
---

Links to some discussions pointing to need for a fixes patch: 
https://lore.kernel.org/all/20250903220312.GA2903503-robh@kernel.org/
https://lore.kernel.org/all/d2367789-6b54-4fc2-bb7c-609c0fe084d3@ti.com/

Link to v3:
<https://lore.kernel.org/all/20251121123437.860390-1-h-shenoy@ti.com/>

Changelog v3 --> v4:
- Update top level constraints and commit message.
- Update logs with processed schema- https://gist.github.com/h-shenoy/a422f7278859cd95447e674963caabd9

Link to v2:
<https://lore.kernel.org/all/20251119122447.514729-1-h-shenoy@ti.com/>

Changelog v2 --> v3:
-Add the reg description list and reg-name list in top level constraints
using oneOf for either of compatible.
Logs after testing some cases: https://gist.github.com/h-shenoy/a422f7278859cd95447e674963caabd9

Link to v1:
<https://lore.kernel.org/all/20251107131535.1841393-1-h-shenoy@ti.com/>

Changelog v1 --> v2:
-Update the reg description list for each compatible and add register space
for dsc to make the bindings reflect what hardware supports although 
the driver doesn't support dsc yet.

Note: j721e-integ are not optional registers for ti-compatible.

 .../display/bridge/cdns,mhdp8546.yaml         | 85 ++++++++++++++-----
 1 file changed, 66 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
index c2b369456e4e2..4cec0f4c22a2b 100644
--- a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
@@ -17,23 +17,45 @@ properties:
       - ti,j721e-mhdp8546
 
   reg:
-    minItems: 1
-    items:
-      - description:
-          Register block of mhdptx apb registers up to PHY mapped area (AUX_CONFIG_P).
-          The AUX and PMA registers are not part of this range, they are instead
-          included in the associated PHY.
-      - description:
-          Register block for DSS_EDP0_INTG_CFG_VP registers in case of TI J7 SoCs.
-      - description:
-          Register block of mhdptx sapb registers.
+    oneOf:
+      - items:
+          - description:
+              Register block of mhdptx apb registers up to PHY mapped area (AUX_CONFIG_P).
+              The AUX and PMA registers are not part of this range, they are instead
+              included in the associated PHY.
+          - description:
+              Register block for DSS_EDP0_INTG_CFG_VP registers in case of TI J7 SoCs.
+          - description:
+              Register block of mhdptx sapb registers.
+          - description:
+              Register block for mhdptx DSC encoder registers.
+        minItems: 2
+
+      - items:
+          - description:
+              Register block of mhdptx apb registers up to PHY mapped area (AUX_CONFIG_P).
+              The AUX and PMA registers are not part of this range, they are instead
+              included in the associated PHY.
+          - description:
+              Register block of mhdptx sapb registers.
+          - description:
+              Register block for mhdptx DSC encoder registers.
+        minItems: 1
 
   reg-names:
-    minItems: 1
-    items:
-      - const: mhdptx
-      - const: j721e-intg
-      - const: mhdptx-sapb
+    oneOf:
+      - items:
+          - const: mhdptx
+          - const: j721e-intg
+          - const: mhdptx-sapb
+          - const: dsc
+        minItems: 2
+
+      - items:
+          - const: mhdptx
+          - const: mhdptx-sapb
+          - const: dsc
+        minItems: 1
 
   clocks:
     maxItems: 1
@@ -100,18 +122,43 @@ allOf:
       properties:
         reg:
           minItems: 2
-          maxItems: 3
+          items:
+            - description:
+                Register block of mhdptx apb registers up to PHY mapped area (AUX_CONFIG_P).
+                The AUX and PMA registers are not part of this range, they are instead
+                included in the associated PHY.
+            - description:
+                Register block for DSS_EDP0_INTG_CFG_VP registers in case of TI J7 SoCs.
+            - description:
+                Register block of mhdptx sapb registers.
+            - description:
+                Register block for mhdptx DSC encoder registers.
         reg-names:
           minItems: 2
-          maxItems: 3
+          items:
+            - const: mhdptx
+            - const: j721e-intg
+            - const: mhdptx-sapb
+            - const: dsc
     else:
       properties:
         reg:
           minItems: 1
-          maxItems: 2
+          items:
+            - description:
+                Register block of mhdptx apb registers up to PHY mapped area (AUX_CONFIG_P).
+                The AUX and PMA registers are not part of this range, they are instead
+                included in the associated PHY.
+            - description:
+                Register block of mhdptx sapb registers.
+            - description:
+                Register block for mhdptx DSC encoder registers.
         reg-names:
           minItems: 1
-          maxItems: 2
+          items:
+            - const: mhdptx
+            - const: mhdptx-sapb
+            - const: dsc
 
 required:
   - compatible
-- 
2.34.1

