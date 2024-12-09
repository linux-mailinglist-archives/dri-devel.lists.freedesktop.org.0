Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6189EAFD2
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 12:26:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B8F10E89A;
	Tue, 10 Dec 2024 11:26:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lR1dVDRn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0332B10E2B5
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 17:26:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C53NJZXTEXziMzwLduYzrES2+7Spamyz1BWgC6Fgl/iFez7luLrV85NuyOop/7Q4uI0wZ5kU9zrL1gPZPJilxCbHYkAM3WD8m5gpyRfoa/588fEUjeqAQ8UN8KY72Ija2E6nHF1mzFWVvSEwTtEN/ZaqhUO+faI2QJ4eBUUs24s3TpPNJQS0RqPIjaVHQ+9EfHd8X+L4CeXEhXUkBTpjqt3taPmYz3vTrgmj28227G9HqDVv7NINCP/bvHRWArs2HOGfoVyOrONLSOKfua++CNI2DShlmlSegD96/oOXjleJDU0Bl9xIz1+MhPi+ngd9kEmzSb6AKal613jE6xrM6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DIHpgc503MwlsXlWBMNYsvDAJnlykYQzOYEUtHQHp/4=;
 b=BDSgcOZkbCEmBiWxWyGOLLCpb4Eds7+qDbezBLA+9o/KnkkQpOwEiKuqkD19+PDA4ip6d9C3hkcv+URTj8AIrrbUENqUBKMIap4GqTFlLnpl4zpH7u1zaKj7HQ53cygRYRbLFesJcmhTtLg96yBYCbrLbpez6u2bjjUXrDtN7KRsCMGtwMtbBsMcsDykdld8Yc75rg07EJAOsg3OEcvVGy9HG00aIKBbtf3CCrFNpHO8kw10PPL/6eF+5hUg+cxEHscv5K82DK9YKAe3LHu/D74gF3yKkZh5KQ76+1wrLuqbaSTZvEuOzg8Sp6TbRBjLaEtrJV1Vt9Y60AIOXdDfYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DIHpgc503MwlsXlWBMNYsvDAJnlykYQzOYEUtHQHp/4=;
 b=lR1dVDRn+ef8BMzTVS/2FXFasetqCwI8chJ0rsJPq5udoUewy0PA4wFFtKev8CkumAgsSYnh6r4ADB0qtYwaD4mZ+pbjqbTV+4bGdWf+nlkXcd3CNes5+o9Ek1lBmURPzld10ayXpNGAmxzculggnTMl1AEYd/IO2tc2NDOfPqzRlP74D2IkvnJ+LLhafl8myPFfy6Ibs6hk3uAg3FFJ1T57GPaMFbBTT6RSP3SE6Wjfc4+2HmIR+izVomyoTiOtUkduwiIy9zETxtSPoAB6YOQ4zf13sQqEMNepqUBfTMfvhix2uQhsYcT/COxtsqisjsbWQXkWj+lqpFk1hipEPQ==
Received: from SJ0PR13CA0191.namprd13.prod.outlook.com (2603:10b6:a03:2c3::16)
 by MW6PR12MB7087.namprd12.prod.outlook.com (2603:10b6:303:238::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 17:26:19 +0000
Received: from CO1PEPF000042AB.namprd03.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::d6) by SJ0PR13CA0191.outlook.office365.com
 (2603:10b6:a03:2c3::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.10 via Frontend Transport; Mon,
 9 Dec 2024 17:26:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000042AB.mail.protection.outlook.com (10.167.243.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.7 via Frontend Transport; Mon, 9 Dec 2024 17:26:19 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 9 Dec 2024
 09:26:02 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 9 Dec 2024
 09:26:01 -0800
Received: from thinkpad-t480.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 9 Dec 2024 09:26:01 -0800
From: Johnny Liu <johnliu@nvidia.com>
To: <thierry.reding@gmail.com>, <mperttunen@nvidia.com>, <airlied@gmail.com>, 
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-tegra@vger.kernel.org>
CC: <jonathanh@nvidia.com>, <rkasirajan@nvidia.com>, <bbasu@nvidia.com>,
 <johnliu@nvidia.com>
Subject: [PATCH 1/5] dt-bindings: display: tegra: Add actmon information
Date: Mon, 9 Dec 2024 09:25:45 -0800
Message-ID: <20241209172549.5624-2-johnliu@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241209172549.5624-1-johnliu@nvidia.com>
References: <20241209172549.5624-1-johnliu@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AB:EE_|MW6PR12MB7087:EE_
X-MS-Office365-Filtering-Correlation-Id: aecbd4f9-803c-4564-360e-08dd18769809
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4+KNFGXSHAIz686SOJO6DZnEXBLv8b011mBFv/8wC+zh9IYzKVQXep6mfFmo?=
 =?us-ascii?Q?KakHkuDip4WtKLhkipGQqlLwhS3i2vwoiqvbYhXPIWXDB/eavSKv88Fv5hjr?=
 =?us-ascii?Q?UKIb5LWf9UEoSGlclkwzBE3s3niN6FuWo+EptiwV65QvXFktDejs37dFnWfs?=
 =?us-ascii?Q?7W+Pmk95f6hRZOOFaUfMjkRai0zaEQoIgaYOEsvB6LSRuho4gqA1ltkFdOMV?=
 =?us-ascii?Q?nFN8ksB3Z33Rlu5kiKWEc0Gjb0MMWNou64DS1nu1wQMyewjIMQfJ3f74xA3v?=
 =?us-ascii?Q?cUjzqNQaQUy3WxKLuti+ZMwLH1ukV/qEWWVeK0WzZcWxRlYQodMNFTFHWCWq?=
 =?us-ascii?Q?ndaZ5SDunkBIchdDYywiBY3K/1ILcbYb3SszxKy3I8qi2AuF+l61Li6PpNcx?=
 =?us-ascii?Q?ZB0wPUHg3XBM7yhdYrnSbK78t0E/ua0x0lqyxgJF/pDwVtqELY/sgvVUa544?=
 =?us-ascii?Q?pl8ziW1NUajRfBlm0QwkgZkt4nZ6pwsbpWhWV7gmKedXI675QSGhGlswkCMM?=
 =?us-ascii?Q?UYoPJg5nFBFcgvmbbdh3iGe7EXW/ifLRrz4KYTT2bPVsFv6BMa8G5s1w7rm4?=
 =?us-ascii?Q?/6bOjPAjKjA0jGzGG69eyfOiB+zU/XYbhEFcYRdBWx3RuHCzHaQRTn/DESq0?=
 =?us-ascii?Q?CPamtIWisTKC8MFkOIcs/P43ot1BBPaoVF8cimJdBIxmpnoqi7w/ICZJUOUf?=
 =?us-ascii?Q?exgG+8ao+xU6OiOOasO0eHfc67TXZ3wOs2JX+rfs7A2Ajq68DNgV4gI98L87?=
 =?us-ascii?Q?+Br4Ijs88LYOvi55wIlIlz3APezNLnAjyPC4v62HhIhHoAhim4540cVKy+lc?=
 =?us-ascii?Q?QPJWpPyTyt3csfr+Wx7bhX9DInmDrzj/CWyU8EEln7msxI4YB+8dgband7zI?=
 =?us-ascii?Q?Lrf18M/AFbtdxLO1bJ6ZdaFTz+tp5nBd3WgKVhDBsop4jumdEHoN5IUNPva6?=
 =?us-ascii?Q?gumfbZ0lACnsFLB3t5h41Kmakpolv3zxlkdZy5Zc6oWKCYaabexT3pw/1z0s?=
 =?us-ascii?Q?sUmwx4+24D7GWBcP/W2aAH7SHMHOn3dFxGr6dRXxkSDwy5Qfw3X9xuSPTotG?=
 =?us-ascii?Q?bx09TF7HBoLD/x9sHUN+r4vmbj2yMMvhMjJ0Fb78xXEWajE+Z+1RzdezeQ3w?=
 =?us-ascii?Q?HgoLXlwLF6zoTlCJDf0qopBXMgnzwe7dCb447YxVoosbsUVNLE9le57Vr7lA?=
 =?us-ascii?Q?A1y6+9foTpftaIyqzmBp23meoXLaTvJVMkd+xH2AP7lITrzJMeiNnHVJIOk9?=
 =?us-ascii?Q?E88F9/g2gOKKrL/GZ3PoyvUlzmdYfFMoEGyflV6CM20sZj1wY9nk5G/lnvN6?=
 =?us-ascii?Q?PNR+PlLgJ8a9PTnJE9hFUFnikL4sIefm+qHy39Zy6Dk3ObJk5b1baNjt0kuB?=
 =?us-ascii?Q?BoRllocBWMiW60WPv6tsd5hTLJ+lfjtbL3CAhWU53nBnlp9EMQSpGNCx/FAX?=
 =?us-ascii?Q?WXb2Vc8+8SQBVQ1ttQtfNeBrJPHH0QKf?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 17:26:19.0863 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aecbd4f9-803c-4564-360e-08dd18769809
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7087
X-Mailman-Approved-At: Tue, 10 Dec 2024 11:26:10 +0000
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

An activity monitor (actmon) is used to measure the device runtime
utilization to help drive software power management policies.

Extend the reg space to include actmon aperture for actmon configuration
through host1x.

Extend the number of clocks to include actmon clock, which is shared
between unit actmons for different host1x clients.

Signed-off-by: Johnny Liu <johnliu@nvidia.com>
---
 .../display/tegra/nvidia,tegra20-host1x.yaml  | 45 ++++++++++++++++---
 1 file changed, 39 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
index 3563378a01af4..46e1d27ddef8b 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
@@ -32,11 +32,11 @@ properties:
 
   reg:
     minItems: 1
-    maxItems: 3
+    maxItems: 4
 
   reg-names:
     minItems: 1
-    maxItems: 3
+    maxItems: 4
 
   interrupts:
     minItems: 1
@@ -60,12 +60,12 @@ properties:
     maxItems: 1
 
   clocks:
-    description: Must contain one entry, for the module clock. See
-      ../clocks/clock-bindings.txt for details.
+    minItems: 1
+    maxItems: 2
 
   clock-names:
-    items:
-      - const: host1x
+    minItems: 1
+    maxItems: 2
 
   resets:
     minItems: 1 # MC reset is optional on Tegra186 and later
@@ -132,6 +132,15 @@ allOf:
           items:
             - const: syncpt
             - const: host1x
+
+        clocks:
+          items:
+            - description: host1x clock
+
+        clock-names:
+          items:
+            - const: host1x
+
       required:
         - resets
         - reset-names
@@ -170,6 +179,14 @@ allOf:
             - const: syncpt
             - const: host1x
 
+        clocks:
+          items:
+            - description: host1x clock
+
+        clock-names:
+          items:
+            - const: host1x
+
         iommu-map:
           description: Specification of stream IDs available for memory context device
             use. Should be a mapping of IDs 0..n to IOMMU entries corresponding to
@@ -195,16 +212,20 @@ allOf:
     then:
       properties:
         reg-names:
+          minItems: 3
           items:
             - const: common
             - const: hypervisor
             - const: vm
+            - const: actmon
 
         reg:
+          minItems: 3
           items:
             - description: region used by host1x server
             - description: region used by the hypervisor
             - description: region assigned to the virtual machine
+            - description: region used for configuring actmon for host1x clients
 
         interrupts:
           items:
@@ -230,6 +251,18 @@ allOf:
             - const: syncpt7
             - const: host1x
 
+        clocks:
+          minItems: 1
+          items:
+            - description: host1x clock
+            - description: actmon clock
+
+        clock-names:
+          minItems: 1
+          items:
+            - const: host1x
+            - const: actmon
+
         iommu-map:
           description: Specification of stream IDs available for memory context device
             use. Should be a mapping of IDs 0..n to IOMMU entries corresponding to
-- 
2.34.1

