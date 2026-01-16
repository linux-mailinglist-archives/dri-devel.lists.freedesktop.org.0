Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 506D1D2F175
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 10:54:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F2710E844;
	Fri, 16 Jan 2026 09:54:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="g2IP/2ZZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazhn15010019.outbound.protection.outlook.com [52.102.128.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D348410E844
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 09:54:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GI38j+3kqCiiuM8aegvw2QDmEdAvMGaUD4+Q/pQLiez+8JbMJr//rX7Mg0K4pbVD1efrfDGmWTk1yxkS8AIkoZrbnGmfLWmHNKrFngkQWW+GIdn3g7rhgKMIr//9AniXYs/yWgyLgkwMBOK1u4kU26oFbuvhI6lVZoxj5g35zYjQZS6QTj16ZVJlw/6FZBo0bnhavkZF9mX4382i+6iT99P1v0vkRMa65SqmKiatVY6g1n2bgyPoYlYw5e9AY6251BmLPfVZCqbV1ZjFnsUy8PA1zQR+0ni/BP41+gZZUHtqT7I1r0+Ui5rf64M7RQqiF9nvAO7knjkBs6oIFmth7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iVvVSiFrfAAmEsUxuwxRcanO2orX1Z94MHewCgwr1Xo=;
 b=BuI8K5V+iIMd97W4bwRaOYF5LYaWcFza3e/bRlRwuEg410bHJH/z5fmMfSZNGfoHhkJ7XrTYDUXlK5Vm5pfbPjS9xRjtUQgwTetJpRAjgxapXEitykJ05lP2ZZBn0UVIe+Ga6DmgwbuRfg7Ko8rmGcYbkAMYNxU2ZnOexGimg90kB+AjTDd7NmBCRDQ8bVbkGOvU1jhuqul22sqVCoGjd/YPlbcvFnbiC0TWq/iARFvbW2ALvKwXjt1R051E9qPWJjMyKo5yWDEbrB9erF+g9nSHL4HhGsBboFHH03VXmTgWXh+xxm1B4tZC+wh/FwWUGg7FBPxqZfPB5siQAnBFmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVvVSiFrfAAmEsUxuwxRcanO2orX1Z94MHewCgwr1Xo=;
 b=g2IP/2ZZK8M/JANDyi0au257/sqDTbRa31ITe63CJJokFMhAZA0OtQ5ypsZi5T61PBY7Fn+e4+FY7pF/zkKpZCJ2Ig7J0mj3HiFwifPAccyir9cXxELTuZM1ye6r//I5U/iOl28XNcvS7Wx8GBXdJMYn0YQWZ4SKZmvqcuySRdQ=
Received: from BL1PR13CA0448.namprd13.prod.outlook.com (2603:10b6:208:2c3::33)
 by SJ0PR10MB4767.namprd10.prod.outlook.com (2603:10b6:a03:2d1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 09:54:20 +0000
Received: from BL6PEPF00022570.namprd02.prod.outlook.com
 (2603:10b6:208:2c3:cafe::21) by BL1PR13CA0448.outlook.office365.com
 (2603:10b6:208:2c3::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.2 via Frontend Transport; Fri,
 16 Jan 2026 09:54:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF00022570.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 09:54:19 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 03:54:19 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 03:54:19 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 03:54:19 -0600
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60G9s6SU2958972;
 Fri, 16 Jan 2026 03:54:13 -0600
From: Swamil Jain <s-jain1@ti.com>
To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aradhya.bhatia@linux.dev>,
 <mwalle@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <praneeth@ti.com>,
 <u-kumar1@ti.com>, <s-jain1@ti.com>
Subject: [PATCH v4 1/3] dt-bindings: display: ti,
 am65x-dss: Add am62p dss compatible
Date: Fri, 16 Jan 2026 15:24:04 +0530
Message-ID: <20260116095406.2544565-2-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116095406.2544565-1-s-jain1@ti.com>
References: <20260116095406.2544565-1-s-jain1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022570:EE_|SJ0PR10MB4767:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fa4bc70-ae6a-4cd4-c245-08de54e5382f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|7416014|34020700016|36860700013|1800799024|921020|12100799066;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pfJZgHNmm3sMND2eCFRiaR1E2KQPD1YQT6TBA+k3o8XSqH7LB9006L1nF4VB?=
 =?us-ascii?Q?vqBJOsKLJ0eMtgpchtEpPIXvDibErXikAgxhLsrzr69o68b4MOJtyYs1ncF5?=
 =?us-ascii?Q?ZvkEy/C7Ca4E+eXc7SWa5pyuYOGrV22YFW+4swa4e0qTjj7ru2Z8+dzxm+kV?=
 =?us-ascii?Q?RXFiOvBL9DRJs54I0zooQ6tpamUASTP+hr+KAmGCyYSl1QoEoKplF88R82cd?=
 =?us-ascii?Q?/So2+ijO65ZjJBSgnEqK5hir4kJptX94DG9hhan8SzHb4xCVStaDrNT+s/kf?=
 =?us-ascii?Q?+nJ7bE5tEZxEpiqLyBrzvZf5AL1iLqgFGmDD429/WrwluKPnLo/56xi+Tb2w?=
 =?us-ascii?Q?gFWA/UsGP139UtvRKUBLTQsiQNi7TJipCKD0NWwdLLxp8FlAwoOfDkRD4WHE?=
 =?us-ascii?Q?jd+EjI77Bi6vDh9CLyY78LKdNhqNuenWg0OVXP/cFdhUEgmOkCeU3D2eLaOn?=
 =?us-ascii?Q?xNKriAHRIPO8kVilZvyWcOshgDQXaZeB8LuhbPQwF19hl+CdAEUnY0XBbOSC?=
 =?us-ascii?Q?+mTfcHN4iOkD5fvde4JWpP+MCrlORTG/Y6egOIEcvlKNADgOv0k3KizWiyWD?=
 =?us-ascii?Q?3BMTqv4a7zINFXvAlFQsfuS/o2r2an8YRRt9rDPAT6NhjcIrDGeB4FZr+MyO?=
 =?us-ascii?Q?NlzVcXNplA/FfhIFU2Rw8GO8SXsPWzj9cXZOJt6AS693qfIHuMGQSfBiUI22?=
 =?us-ascii?Q?Nem7EtapFZ8pT+NLnvDDmiaevfidfaVOO1Ky8Fr0eTO2mXuteXZydZwv+llJ?=
 =?us-ascii?Q?N6156ncAoBeS3E9YVBCUHmwQntXtS2aA2nV82MICn5mNgMYp5z+D85mF5YZT?=
 =?us-ascii?Q?85X1VSraoWumt5ve6Wig5azooCpF167SmSGVE6ow+t/HVkYG3Oy0MP6lnpgf?=
 =?us-ascii?Q?Ox2vv6Q/otvCRvU/Zh/8AzvLGqvqTS4l9PbhiQEmgpuZE54icrhCAn89eytD?=
 =?us-ascii?Q?OvisfYy9CoyHT72QaVGtSF4RBlzil6DIj4nry6IpM6/LbSHXhUqIvxtMrQqm?=
 =?us-ascii?Q?bfug6uyuefyZPmm7CoZqkIj0S4G4cnNyERSTG7zaMJ2ycxAWkrJ8b801YsRw?=
 =?us-ascii?Q?1rKf8N2KUKOEAP1HBAl7BgzUH0Zu9PheOBgLgXi2VFCclqBFrrSL0eK8ViGA?=
 =?us-ascii?Q?AvyY65b9U161xZACqRzEmkQ+q0Z/c4QsPyk/A8j+AI3FwgsBpsZ1pILbxEG3?=
 =?us-ascii?Q?3gQF9IbsN3T22WeGFhwxVGYZ7hVk/+eamBrr4NXkyqiEjVTUb7Bwht5juKtm?=
 =?us-ascii?Q?bM0QmqMisHtN3nrw7ulhJQEIfcRKOPAgsYHIPBxkhjE9xKnpToxvkIwCKeLb?=
 =?us-ascii?Q?8blmOQXN+VKjPTZMEgpa8T9B4Yf8EYvJTv0isCi+KDWi23xXRDJu1iYNQHhX?=
 =?us-ascii?Q?c0t4mK4yS/r6+1IJHcJPFxaj2gcygSFs43T3L/mp9z2HeMGxx9QgLDlOgTCl?=
 =?us-ascii?Q?tZhqJ4kpDSqaxylW0t6JR43Hlqgv4WypHtClS8lTuD2ZZNE+8Fnkrd34Zq7S?=
 =?us-ascii?Q?t+5CktFHKbe/R0Z1zWJgPr3LZ6LFdU7lDNEBpVsHZDZ/Pep0W+cxH/C0rP7G?=
 =?us-ascii?Q?KmwJ1L/F2TRqUk+7chwTiKCkvS98f0N2Ecj9wryHmTfXWzkfIDh4A4wgSAnM?=
 =?us-ascii?Q?ewECVK58WM97zkwCS862ZzRkFraS7Smbp2tv266ta7fJBu0L/AnVe0XgUSV0?=
 =?us-ascii?Q?x7Fw+w=3D=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet200.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(7416014)(34020700016)(36860700013)(1800799024)(921020)(12100799066);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 09:54:19.8807 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fa4bc70-ae6a-4cd4-c245-08de54e5382f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.194];
 Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022570.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4767
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

TI's AM62P SoC contains two instances of the TI Keystone Display
SubSystem (DSS), each with two video ports and two video planes. These
instances support up to three independent video streams through OLDI,
DPI, and DSI interfaces. The OLDI interfaces utilizes two OLDI
transmitters OLDI0 and OLDI1.

DSS0 (first instance) supports:
 - With respect to OLDI Tx interfaces, DSS0 instance can either drive
   both OLDI0 Tx and OLDI1 Tx together (e.g. dual link mode or clone
   mode) or can only drive OLDI0 Tx in single link mode with OLDI1 being
   utilized by DSS1 or left unused.
 - DPI output from video port 2.

DSS1 (second instance) supports:
 - With respect to OLDI Tx interfaces, DSS1 instance can only drive
   OLDI1 Tx given DSS0 is not utilizing that as described above.
 - DSI controller output from video port 2.

The two OLDI transmitters can be configured in clone mode to drive a
pair of identical OLDI single-link displays. DPI outputs from
DSS0 VP2, DSS1 VP1, and DSS1 VP2 are multiplexed, allowing only one
DPI output at a time.

Add the compatible string "ti,am62p-dss" and update related
description accordingly.

AM62P has different power domains for DSS and OLDI compared to other
Keystone SoCs. DSS0 can have up to 3 power-domains for DSS0, OLDI0 and
OLDI1, and DSS1 can have up to 2 power-domains for DSS1 and OLDI1.

Signed-off-by: Swamil Jain <s-jain1@ti.com>
---
 .../bindings/display/ti/ti,am65x-dss.yaml     | 37 ++++++++++++++++++-
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
index 38fcee91211e..b1cec5383160 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
@@ -24,6 +24,19 @@ description: |
   DPI signals are also routed internally to DSI Tx controller present within the
   SoC. Due to clocking limitations only one of the interface i.e. either DSI or
   DPI can be used at once.
+  The AM62P has two instances of TI Keystone Display SubSystem, each with two
+  video ports and two video planes. These instances can support up to 3
+  independent video streams through OLDI, DPI, and DSI interfaces.
+  DSS0 (first instance) supports:
+    - Two OLDI TXes on video port 1, configurable in dual-link or
+      single link clone mode
+    - DPI output on video port 2
+  DSS1 (second instance) supports:
+    - One OLDI TX on video port 1 (single-link mode only)
+    - DSI controller output on video port 2
+  The two OLDI TXes can be configured in clone mode to drive a pair of
+  identical OLDI single-link displays. DPI outputs from DSS0 VP2, DSS1 VP1,
+  and DSS1 VP2 are muxed, allowing only one DPI output at a time.
 
 properties:
   compatible:
@@ -31,6 +44,7 @@ properties:
       - ti,am625-dss
       - ti,am62a7-dss
       - ti,am62l-dss
+      - ti,am62p-dss
       - ti,am65x-dss
 
   reg:
@@ -81,8 +95,13 @@ properties:
     maxItems: 1
 
   power-domains:
-    maxItems: 1
-    description: phandle to the associated power domain
+    minItems: 1
+    description:
+      phandle to the associated power domain(s).
+    items:
+      - description: DSS controller power domain
+      - description: OLDI0 power domain
+      - description: OLDI1 power domain
 
   dma-coherent: true
 
@@ -196,6 +215,20 @@ allOf:
               properties:
                 endpoint@1: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,am62p-dss
+    then:
+      properties:
+        power-domains:
+          maxItems: 3
+    else:
+      properties:
+        power-domains:
+          maxItems: 1
+
 required:
   - compatible
   - reg
