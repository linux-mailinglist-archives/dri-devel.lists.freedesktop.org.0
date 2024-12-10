Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7149EC522
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 07:58:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE0310E06B;
	Wed, 11 Dec 2024 06:58:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IRHAbj5l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CDD010E140
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 17:46:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nHHJ8D+KZu/fuTRLFH01Fii+9nPZWojaKxt59El4lD/ZINbUyQj82s3xRMXOriNaIuDH4izRwbO13pYduJorjUfYwwWL8WozekzI6eF0KPxTGyMxbeINepCvML2r0XL7462q+LNpVlrSa6eGO8YHx8D7YQAY+A0LTjZ/5cH8tK7y0luNfUpWS1auOQKQAU1OOu1rK9CpXwqSptoizEZFZ17A+zCFVGijlCumdIeumd16+1dJ4LWGhuEt0jBEAwyM14Ibg+sEFyxDgqMcrkYhvs0fwm/7ZjoVeQRRDPhXIZbmAb2+KYhMUqSapmYbgE6SYQVw2pDUhocaRtuC80+vLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DIHpgc503MwlsXlWBMNYsvDAJnlykYQzOYEUtHQHp/4=;
 b=vC8iLPzGRBjyg/tr+6/cjKOCiowAWEvpOPw0O6v7KRBi8q6SgWYMHpwpDygWwpG5Gr5oNdeuoYIyWUqGQkm171Js1G9IPJbE+iU2M19q7sObWweHjNI8l99hCK3qMekdhH6YTmugyo9eGTqZy/MCMpOrr5fDNDpxTQ2/FwFnFvUdabkuPjuQWe95tSKPfRFkGzlSi/eibZ6AZOsZIh1JGMm6x9PJsIYvvQ24a5KB6aSn9xpDnFBbz0/XCEYoHowt8IridHV5juqLiXqcM4W7u+l9E7yKnQnbGHTLMaXfLO4VqrlRWo2zFZujMQGJ7SmvcTqTed+02SHWmy+pPgCFzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DIHpgc503MwlsXlWBMNYsvDAJnlykYQzOYEUtHQHp/4=;
 b=IRHAbj5lgdyT87s67AUGBvah7pbbY07TwEbwYFTj4IdoCsvDYxuxyo1nV7GlQrCcYpWEgZfO5X4ZkFThUYpGcQ/dBARkOqTcYmRKEjX3ij2O5/J+zlhz3Bj1KS+zqeVVshDAGKLQw4vfIa2m7J39WqSFzWJxDtM5bIyxdj3uWvqaqFAl53JJv4ZKFLISdoRHVhxmzNk52CxbpL9VAtLfHIq35k+7l87gFlUnjf1r49wQKU3cJlFpHPWgJsLaVWx7H/U84zKBZGpfId7BE1YT9j42aWIDQptYpOLhMWdBzHr3coHS25oIh2elqIgsDLIG4nWGWaIOPinUCuRk/8mdRw==
Received: from SN7P220CA0029.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::34)
 by CH2PR12MB4309.namprd12.prod.outlook.com (2603:10b6:610:a4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.14; Tue, 10 Dec
 2024 17:46:13 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:806:123:cafe::83) by SN7P220CA0029.outlook.office365.com
 (2603:10b6:806:123::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.18 via Frontend Transport; Tue,
 10 Dec 2024 17:46:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.7 via Frontend Transport; Tue, 10 Dec 2024 17:46:12 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 10 Dec
 2024 09:45:57 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 10 Dec 2024 09:45:57 -0800
Received: from thinkpad-t480.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 10 Dec 2024 09:45:56 -0800
From: Johnny Liu <johnliu@nvidia.com>
To: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
 <skomatineni@nvidia.com>, <luca.ceresoli@bootlin.com>,
 <mperttunen@nvidia.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Johnny Liu <johnliu@nvidia.com>
Subject: [PATCH v1 1/5] dt-bindings: display: tegra: Add actmon information
Date: Tue, 10 Dec 2024 09:45:50 -0800
Message-ID: <20241210174554.18869-2-johnliu@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241210174554.18869-1-johnliu@nvidia.com>
References: <20241210174554.18869-1-johnliu@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|CH2PR12MB4309:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b4cb8b2-85cb-469c-c05e-08dd194289f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|7416014|1800799024|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SguUD1MUf5DL2o1ckSkhVeErXnHj22RZ0RfjLNVf26n16/+6//B4Zg8P+uNb?=
 =?us-ascii?Q?nklLtuPy5+W2SgpPl5jIoyRpOw/7VNTeO2ywg5Zh9GD8vW7x6uEaefgHkV7B?=
 =?us-ascii?Q?jxL2iXpR40hhieIla7RXVU79AhIXe/p8h0qxdu/mYAWp8J/5t4F3Lu3d9VcH?=
 =?us-ascii?Q?wlXSTA1w7M9xIWDIbnbqYXbkiA7e/Qo/JiVwK/OYyXMn++r0F26IkC7SYR+0?=
 =?us-ascii?Q?naeWtHCGqqRoWxnBiTpnH1hYbg+z+pXF9JJ9kngcGTUG8T3IfyRiKStYvmQI?=
 =?us-ascii?Q?qatQhbhUVUVyIMa9USl1vIMtUg2As+ZQH9VMDy4266oTmA2uWe6TfU+nNEnN?=
 =?us-ascii?Q?2LBnfdBYPmNSsl3inHOWkUUnptzo7uk/1TXu2QsU1vfMfCHyjDST6q+2/zEb?=
 =?us-ascii?Q?GkpzGYfIxo96i8+yJYPok/rtzaGiib75aL7E9Ez5x8NHC1ZSn/HetU8Bh2p0?=
 =?us-ascii?Q?wGNc5I6N8V9QlVNH9MibiVywKjsj5OZVvqmYNFDSJfSVwnCBfCXjUVUGz/qX?=
 =?us-ascii?Q?/Kzgu0Txq0yZjrBDtjkRMz11T0/OV9R0KQHWc3aNaYWBswJe0xQZH9HGGm2S?=
 =?us-ascii?Q?y4wOQYkeY8jOTUZlz/ID1NdKD9Rjg+6s2Muk5To+YkyVns9WHr8IDJ9C28mB?=
 =?us-ascii?Q?QvPFiLW0QD8OPeoaOS2LyncaR5ihjrj2xNyNL0K92Xkl8Z7aNYWu7Xn98lxy?=
 =?us-ascii?Q?uOrBZQHCRH43Vp9rO2n1yxhTOSPKgXfDchqZucLFub6dLjm1uRbACGDQb+VS?=
 =?us-ascii?Q?EifCdv4islLtnIKPl7O4gkcfpgkkDa4q0JhYw4JBDmKE2bpFF0h6+B7lLKmt?=
 =?us-ascii?Q?XUctwHHoqCuX/GyFX/URfyTVlFJJzqZXlOpULLLHRlvmvzB6CPplpIJnAmY5?=
 =?us-ascii?Q?+z+kUGIWG6vckQgPYDsw+03yjPwW3q4Jh1UX1uLqbJW45G+3p7IOmpEqMqMU?=
 =?us-ascii?Q?WxmxcWWfCjQ497rSTlf5GvszejI6znTm96u/wtguFQzrwspdH8tbkEb+8+MT?=
 =?us-ascii?Q?86LHkyEn8XRKCUzIGnuKxt7zEatHo+VaNhkegA5gDhOIEHEyC9RIS/wqlI2p?=
 =?us-ascii?Q?lmwcCE/UfYmoeXQaLAGnpwBkllW/UTPTdXML3IAYD6N5e0iOBhqRIRr8AD3m?=
 =?us-ascii?Q?4BgJSvu9wZsvh1Fv5VACsDuVMogPRJwo/6hsdOQqNOyJQQB5gmTz4XEutb7u?=
 =?us-ascii?Q?8gvFw3H6BlgSljOEtgknXhEYo4tZZlsic7vUaL1YtNZ1E/oEjauzwNWZ6rDQ?=
 =?us-ascii?Q?l3l/mcONK9dKhM55n6B0dHyP22/MR3WN3cicLfB02UDeWfUTUXmXYj6NGoH3?=
 =?us-ascii?Q?pEy5XwLyk/970fIaM3PDod2b17Qpf9yZdxNeeHYzOp8/rwQIvNRwREN92Ht4?=
 =?us-ascii?Q?EibmEZ+MkU3N/jVYxjuGX8JQiGEg0fcsezS/q9i5x5fOC3qmZg/nnU+tlZAF?=
 =?us-ascii?Q?Y41K6zQpSxW7vuzc2KNUYYsrCumM83CJwcdozftxkrp96ah/GD9Okw=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(7416014)(1800799024)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 17:46:12.7930 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b4cb8b2-85cb-469c-c05e-08dd194289f1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4309
X-Mailman-Approved-At: Wed, 11 Dec 2024 06:58:14 +0000
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

