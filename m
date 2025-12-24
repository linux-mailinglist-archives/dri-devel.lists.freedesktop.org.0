Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68493CDC5BB
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 14:32:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C993210F332;
	Wed, 24 Dec 2025 13:32:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="KHOnq5Y+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010050.outbound.protection.outlook.com [52.101.56.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F66910F332
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 13:32:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SH9B6DfsN8Uj2W3kdYMC8nPhrlezUnzMi8q8wPIxxsHMrklM5pPDzjHHifFelHKqrjikHU7rnT8HsjoAOxOSqkeIK5YGljuLbpKDuJOpf+y/X98707DJVBPInbcKyKkuUQ469/6uP1oD0qs1l84dANHAl8YZUD8Tat/yFhFqduBJMt78nMo/ZEPDsNt0J8xkeNnvfZL3/c7VCoAvklEhaiP7q/4JLR5l9cYwQKkQRWuBLehiKkbrck5qdA4MCCoa6j+DfLlEU+Yzch0tt0xOgGFHWz5ckRqQ0MgINCj7o+hrxBQ7LrQ6JOfGJrEWJdQmQxbB0TTpbMoQFmuDnZ8uSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=otUxOZJBl2z8hk6NsStmq+YCaDcrjzt6igVsVR89yo0=;
 b=udodNp8oyL70RWFHcOKsqxLF+phCsJwLr5ouIKam7gN6GBep+MzOMZ3J01/1vtHtA/kzv8sIX0OKRZNWHSWFBFSaRCChsV181ukzyTsPasBgTY3hbIU07tWjPb5S6EMAd5aIUneuVyTRZ32VCSTRCPQsqu4638KiIgNjmMf7m4Oa5HUO2sKD1oc89VAgONLzOct21WrIuC/RE32DNXbQFx+3dTxmLsBMD8bNnhIDeDRPtqL2Ppx4NeIv1B74oF5jMfFfoIa0MIMo5ePgjDf9NJrdD00oeRFKy9V3WBw2JupYzf+SwGVKbG/5RHUeOpn6D1rYYOBM1zQYFgrKy0Y6ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=otUxOZJBl2z8hk6NsStmq+YCaDcrjzt6igVsVR89yo0=;
 b=KHOnq5Y+JL2/K6y0uC1o5O60VTdrKcnmw6vtgomG+GTkZjAFe+4UQU4+wVbnjgwDjdjUNBJrqf70SDtM+23hgsR8NPxlTjhpFVObCHdTp0okyrJOJLS6c0rvmMtOf56MmlNNtUc3rbvigDjIDjg3+kQ4YPvm6uQPDeOSv2frmPE=
Received: from BYAPR03CA0009.namprd03.prod.outlook.com (2603:10b6:a02:a8::22)
 by CH3PR10MB7564.namprd10.prod.outlook.com (2603:10b6:610:17d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Wed, 24 Dec
 2025 13:32:05 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:a02:a8:cafe::23) by BYAPR03CA0009.outlook.office365.com
 (2603:10b6:a02:a8::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.11 via Frontend Transport; Wed,
 24 Dec 2025 13:32:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.9 via Frontend Transport; Wed, 24 Dec 2025 13:32:05 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Dec
 2025 07:31:56 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Dec
 2025 07:31:55 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 24 Dec 2025 07:31:55 -0600
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BODVomT614815;
 Wed, 24 Dec 2025 07:31:51 -0600
From: Swamil Jain <s-jain1@ti.com>
To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devarsht@ti.com>,
 <praneeth@ti.com>, <bb@ti.com>, <vigneshr@ti.com>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <s-jain1@ti.com>
Subject: [PATCH] dt-bindings: display: ti,am65x-dss: Add AM62L DSS support
Date: Wed, 24 Dec 2025 19:01:50 +0530
Message-ID: <20251224133150.2266524-1-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|CH3PR10MB7564:EE_
X-MS-Office365-Filtering-Correlation-Id: cc161d93-a5a9-4411-56bd-08de42f0d43f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|82310400026|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?npZefD/KMRiL+aLJwszYcJt2nPQvR5bzOcPdf2VwYmqKiemRDOjC440ZgRFz?=
 =?us-ascii?Q?XFLPQ6uuKgOJdTbJgrym6FGRfLHN+cEGRESe+fgbi/9nE0jryWv/XIX2HebF?=
 =?us-ascii?Q?qskQ5gQ0QcBKF7lpBy/iAK2r+Ua1xEA9x1NtAy+H7z/jtwP/eOJDfTTL6lzB?=
 =?us-ascii?Q?bt4KkCh5TOL7Z1mlXQnvYSsS3ffu5y2XNZkVbcBAw4Co/8p1HwB/ZAwMnyVf?=
 =?us-ascii?Q?/CM68oj9iqVxqfKztfk6Ltf9Za4nPHnzo/3stGvs82sDCVZ0YoCbakJJIMX4?=
 =?us-ascii?Q?QqqGJaYECidpKe0TLO5LRTM44VOaUU/nIrJY0g6ep6EoK+jj/wFpeH/67Ro1?=
 =?us-ascii?Q?q/BS7usWH77i/seHalAv5Gaoy+IUtxxmwqCz92s4C/lU53ZXvbiKdt/loVE5?=
 =?us-ascii?Q?bnQpUxoX3Hhm9YALFovdwBP7blOAXOiLO07qzgI9EXKew+N+ag6EKe5dM+dr?=
 =?us-ascii?Q?aANU3pkSn9OS72UGpZMsFt/ePx879dF5pI1d0FIKRXYk60qCjmBZyVVWkiYY?=
 =?us-ascii?Q?4/idv4TuzymWE8BlKUXhGwAUFRnjIW/z7nqqXXJutDGE7zGHodf5GX0F5gXf?=
 =?us-ascii?Q?tDHBAE8AHrVbANKE+vnoFDK4VKp/z3jmk/n4DpUKIU1yg5gb3axKTXyl2m0p?=
 =?us-ascii?Q?oYc4/T3bDwaPzvnoEU4V13V0cXXxAfmLVs6IuaBDQ/kSxB1toh8g1NhwS9vq?=
 =?us-ascii?Q?b01HojAa1T8WlH8QICojSvIXWm/NHNcdaIhANG54RzMcWhyA5kI7FpCRP0j9?=
 =?us-ascii?Q?CLfUg3GuYaw8TMipUVtR4fU5JFUeVMCCEC+p28qmoWSVgWma45V1nmVJ/3ab?=
 =?us-ascii?Q?W+WMig4ih9vbApzZ5Fy5RwQv3MEfqdOkBXjJQFXEMNDK+UvOwmWfjuK5ZIun?=
 =?us-ascii?Q?fKg7CfECjUWM515nRNP3gA2I4LVxw0tZDiJ5tocFBnSnMU7dRK9/Vr8rooj9?=
 =?us-ascii?Q?uPyOchp7CP7gnyow/tPUih7nE4501am18qRVx/NGBYzTqqZTOuT+CIazY4Ir?=
 =?us-ascii?Q?WCr6mqSGEcAsPuExL2u5LaTL8pLCzGyA3Ss+oND9DeasXJ9LLySOnpHNkwt+?=
 =?us-ascii?Q?+VByvOw4BzfDDdmKmO1f1LCMcWHzQrJRkjqHpraAJSItfjV8HNFQ7giYhHDU?=
 =?us-ascii?Q?cuM9JIVA0lBXM5RLCHbYOla3dtyeLCTeQJtCls8TQpqprqg/mEtmwi1HGGCt?=
 =?us-ascii?Q?hboi71iXvhuiHI9fBpfDvkC0r8uRsRACKRxLf9s0v+bBtRn3vHG8RbsFK/Vm?=
 =?us-ascii?Q?P5PA9H1ZCMvfQprabq2/4rBZ6xycWIFdI7R9Jn55DFnberr4bEEN7s49XIpL?=
 =?us-ascii?Q?s/gUKuik3uYYawcoKa3eX0g2XKBWnoytN09yj/TY40UKQWlPgYzTnD7fuLwi?=
 =?us-ascii?Q?PgLIB5zv9upGyWcdEO/H5dV3AVATPfNkrRC8k1mAzmvidZYXzHsjDiP+8hOG?=
 =?us-ascii?Q?KhFivrtC4mdJE4+8O69eyIsv4g9rKqbfrHmJh2ilc67bmDFv/Drih28Qh1YV?=
 =?us-ascii?Q?Guey2oJCah8VjjGjzA+uFwi5c7y8t3M4Toa3BZy6K3LHi3CApxRvv8qQyJiY?=
 =?us-ascii?Q?z/rsrKK2n/3QrNfnAphISWguttwunwTbXqSI8qjt?=
X-Forefront-Antispam-Report: CIP:198.47.23.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet200.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2025 13:32:05.2688 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc161d93-a5a9-4411-56bd-08de42f0d43f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.194];
 Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7564
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

Update the AM65x DSS bindings to support AM62L which has a single video
port. Add conditional constraints for AM62L.

Signed-off-by: Swamil Jain <s-jain1@ti.com>
---
 .../bindings/display/ti/ti,am65x-dss.yaml     | 95 +++++++++++++++----
 1 file changed, 76 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
index 38fcee91211e..ce39690df4e5 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
@@ -36,34 +36,50 @@ properties:
   reg:
     description:
       Addresses to each DSS memory region described in the SoC's TRM.
-    items:
-      - description: common DSS register area
-      - description: VIDL1 light video plane
-      - description: VID video plane
-      - description: OVR1 overlay manager for vp1
-      - description: OVR2 overlay manager for vp2
-      - description: VP1 video port 1
-      - description: VP2 video port 2
-      - description: common1 DSS register area
+    oneOf:
+      - items:
+          - description: common DSS register area
+          - description: VIDL1 light video plane
+          - description: VID video plane
+          - description: OVR1 overlay manager for vp1
+          - description: OVR2 overlay manager for vp2
+          - description: VP1 video port 1
+          - description: VP2 video port 2
+          - description: common1 DSS register area
+      - items:
+          - description: common DSS register area
+          - description: VIDL1 light video plane
+          - description: OVR1 overlay manager for vp1
+          - description: VP1 video port 1
+          - description: common1 DSS register area
 
   reg-names:
-    items:
-      - const: common
-      - const: vidl1
-      - const: vid
-      - const: ovr1
-      - const: ovr2
-      - const: vp1
-      - const: vp2
-      - const: common1
+    oneOf:
+      - items:
+          - const: common
+          - const: vidl1
+          - const: vid
+          - const: ovr1
+          - const: ovr2
+          - const: vp1
+          - const: vp2
+          - const: common1
+      - items:
+          - const: common
+          - const: vidl1
+          - const: ovr1
+          - const: vp1
+          - const: common1
 
   clocks:
+    minItems: 2
     items:
       - description: fck DSS functional clock
       - description: vp1 Video Port 1 pixel clock
       - description: vp2 Video Port 2 pixel clock
 
   clock-names:
+    minItems: 2
     items:
       - const: fck
       - const: vp1
@@ -84,7 +100,8 @@ properties:
     maxItems: 1
     description: phandle to the associated power domain
 
-  dma-coherent: true
+  dma-coherent:
+    type: boolean
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
@@ -195,6 +212,46 @@ allOf:
             port@0:
               properties:
                 endpoint@1: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,am62l-dss
+    then:
+      properties:
+        clock-names:
+          maxItems: 2
+        clocks:
+          maxItems: 2
+        reg:
+          maxItems: 5
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,am62l-dss
+    then:
+      properties:
+        reg-names:
+          items:
+            - const: common
+            - const: vidl1
+            - const: ovr1
+            - const: vp1
+            - const: common1
+    else:
+      properties:
+        reg-names:
+          items:
+            - const: common
+            - const: vidl1
+            - const: vid
+            - const: ovr1
+            - const: ovr2
+            - const: vp1
+            - const: vp2
+            - const: common1
 
 required:
   - compatible
