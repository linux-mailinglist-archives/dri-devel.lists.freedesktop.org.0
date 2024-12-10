Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C1B9EC526
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 07:58:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6250110EA6B;
	Wed, 11 Dec 2024 06:58:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="N/5d2JMY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3BF910E140
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 17:46:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VsMCYIuIk3FejPmfrlvq8C9OYsVCwgCeSk4hSfiPL8DxMGoEaaZ+eUwww2Yp9BcBxbzbabvWwS8uQ8uRct/Z6IIKr+EXzOpQr/dFeoEjBIy3cUXv3n+sVMZQD62NPtXOMLqOVLeLxjVQeIsvbbVM2Ed1csZ8RbLKY7oUQElvSrAwdGzWpLTsU5AD6muHykKjrrqYTZifpPPMjhXGhnp9ZSomzkpR4bXcR5CFOezvwhrFJvWwsYoBDXzpxCpjDTLAjxvgV6n9S2R2ATAERttVIg6VzlKOJqZZfHyIIuoUQTB0wvL7EevGtQZ83hqqPjCyd4hDW3gdzpcSc4BMOxc4/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1Zpx32ZpJHlEx2zxr8ljF0cJYu/fUivypFZUIlSJ7Q=;
 b=m808g15L9limCYVMjauOTpbS8cB2R86tlVrHHhH5f4eGWxqnIj5DD7eb4Rtf6oNSqVlRN88+4Oy83nPi1axealIJ1NwnoivforXnEs0Zh0eOObj5JSGStlqjOQB3a5tH03yNCe7K+T9CgXroxsTS0cH48JrkqGLRQ5VMuVy5QBig6z438P72Cdmx2RlzFgeW4PB/3H/8S6pQUP59mturkgkFoAfw38wl9smwC7FovdtHS2aTSkDIdTTW2A/34K0DIVLGuX0YSj0th0XRjoSL4NckcoINheQ0bcBbDQOJraudf2fD60nXzYEEK+2GmzFqnaQ+pBuzPmZ+hVDU9IBqUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i1Zpx32ZpJHlEx2zxr8ljF0cJYu/fUivypFZUIlSJ7Q=;
 b=N/5d2JMYvNExuFiJSkBzjgnIdAK7EWlEt8jNNUkiaRBABb/tJ81pz1lnWPRSlh3UtFs8NpCAdFw7FbJwYFBhgr7eVHaVi5CBwF/5KMSnFwBSXGENN27rOH2lXwd+eSrqpN1ITJZ5uBubqTIRqezjQ2R0BdxEC4CwjToMjdNZHdrfeeOnLykirENs7BSr71FY4S3k8an2AlQbo9HtYRiGefL5mloicOxoR7fzMs/ZaweBQZtasqSPG2iz11grnhscXVyXeggPkMM0jzgLGA1UTRIHjc9ZGhZ6BObaBXsNL8LZUnXvhmPlStNmVf8fETOv8f8GQKuqkfZn3+azF/yiYQ==
Received: from BN9PR03CA0976.namprd03.prod.outlook.com (2603:10b6:408:109::21)
 by CH2PR12MB9494.namprd12.prod.outlook.com (2603:10b6:610:27f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Tue, 10 Dec
 2024 17:46:16 +0000
Received: from MN1PEPF0000ECD5.namprd02.prod.outlook.com
 (2603:10b6:408:109:cafe::87) by BN9PR03CA0976.outlook.office365.com
 (2603:10b6:408:109::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.13 via Frontend Transport; Tue,
 10 Dec 2024 17:46:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 MN1PEPF0000ECD5.mail.protection.outlook.com (10.167.242.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.15 via Frontend Transport; Tue, 10 Dec 2024 17:46:16 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 10 Dec
 2024 09:45:58 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 10 Dec 2024 09:45:58 -0800
Received: from thinkpad-t480.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 10 Dec 2024 09:45:57 -0800
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
Subject: [PATCH v1 2/5] arm64: tegra: Add actmon information
Date: Tue, 10 Dec 2024 09:45:51 -0800
Message-ID: <20241210174554.18869-3-johnliu@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241210174554.18869-1-johnliu@nvidia.com>
References: <20241210174554.18869-1-johnliu@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|CH2PR12MB9494:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b2bf168-be13-4cef-b6e2-08dd19428c21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|36860700013|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?n3JyMH1mvnXEl27H8rSIi0CF3VcaWE6GauCrnuP0zR0zfKwcW8txMMUKfMRm?=
 =?us-ascii?Q?hvntyO3NdXaO6SNa48FRXgPi/jWhZvOiPLk+zPy6YhIIeGurvOWvPqxMgh5S?=
 =?us-ascii?Q?Lf96aX9b4Wg1aLbc9IstXDl2mpN9ObdH3arxwSC8//tyrHYvxivDmXZkZYVP?=
 =?us-ascii?Q?N8juQcsx1J0D7LevcoQ40j9pxbrURjqtQZDvx0mHTRDsfkKXohIIXV40tCj+?=
 =?us-ascii?Q?KiSLSGzMLGpAjTsNAJH/1XSe8vLU6uMVfkX5fRVzL3tIbvssezTakJkTYWLD?=
 =?us-ascii?Q?jYIgwVp0aB17ou84nzjectdtDQM/6uT0dm5LnWZu2aHN8vscqHU89bd6dTGR?=
 =?us-ascii?Q?0Glv9WXn4hyYfsetvo4NnkG4mpw6wTVopeotJJzhu+x2ltDfm6n1xyyWkK3k?=
 =?us-ascii?Q?HdqUrn28XQed+SJ2JtjeO/VohH7pPD8H9KZ16AaB28O2K3wlhgA2cFopHs0M?=
 =?us-ascii?Q?3Kz2B0go0eagziMF80w+c+0UFou8/BjsVdRxKKwrQ1WHLZ0Fq7rIttn6YOSL?=
 =?us-ascii?Q?nYtOZ6V7+HKptHF1cl+bd7csfFEOzPNDhVa1+J83A7c6p6ibtrLxhtjZo2Ye?=
 =?us-ascii?Q?JZmkHsS7bpaRf1OQFKpybbYszFSOUnyeMx6f1GSI5rgzE1pvmhZ6q7FfBuLt?=
 =?us-ascii?Q?onJc5eYxxKjMsP3HAWkLWfgbClWLy+nxhGDgwxloRjkMCu049pXjE5XiU0O8?=
 =?us-ascii?Q?kNmScyrq3R/sf5QyerXLXQR5yZXcDQdSpENfzdLPyGYCBODXT7GoAaQIZcQa?=
 =?us-ascii?Q?A2iG3mO0HxatJlUggZ270N1zsKaEpc5oxVX40vhwfG+PSHaV3Prb+4Lkt7B8?=
 =?us-ascii?Q?pIHOW3lEn75SGuG8QtXUwJ+KPQ2kg93m+535Ia1fNYjwGDOKqX5w8nnRYXiJ?=
 =?us-ascii?Q?BowQ+DcpRxMmA5quwGEnuKU0HYBSyLckXukS7SESW4UgBi11gn/FbxZzbTvf?=
 =?us-ascii?Q?4XKZZbe03ZIpvCUGml8MczW792kIkxoZTOGzbQaTW0O0SmwWq5325w4rWcMF?=
 =?us-ascii?Q?SB4Za5i1GwYUiWPo0aamHzkQFbuFlfsR3VfiQE41ZYOJRaRsu9sDzKvxFhN5?=
 =?us-ascii?Q?Q2Oa8ShX522CWpCb3rb8S4Ufg8VvgWY9vjx++bUIZZPZ+GtG6ZlkHls5QYa+?=
 =?us-ascii?Q?kceh+AxgWKlT+oR/oJu2yRHgpzRMvQ8kizSD7iFYpGqqAjngy+WfjrdrYl3M?=
 =?us-ascii?Q?bxu5UP18guTLD0FK6Xjnz5nqegUHj+iesR3ev8T47c2GGvs3FV4JwI2+WbIY?=
 =?us-ascii?Q?rYxT1xcUwbQoiI8hUbZDRGAVsqmhxWzsTiwOInr7p2HG+C03lXG9r2Ag3ARD?=
 =?us-ascii?Q?P2BVGfHETryNYY/551+GWchtK85LFvCiizkTls7oO2asROwaWjg3GOLHDxMe?=
 =?us-ascii?Q?80YkklQuJXfdewSrnqBXDddrWeOB/e45BPtMyt6tnWSr0Emsov5PibIdFZdt?=
 =?us-ascii?Q?7zLtD2jYc6wIGuGAEZHhKu8v3NhINYLAiS9bOakrHRdTHczVazL1uw=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(36860700013)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 17:46:16.4002 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b2bf168-be13-4cef-b6e2-08dd19428c21
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9494
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

Configuration of actmon is under the host1x address space. Therefore,
add the actmon aperture under the host1x.

All unit actmons for host1x clients share the same actmon clock source
from host1x. Therefore, add the clock phandle in host1x.

Signed-off-by: Johnny Liu <johnliu@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 984c85eab41af..8faeef83d7596 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -4313,8 +4313,9 @@ host1x@13e00000 {
 			compatible = "nvidia,tegra234-host1x";
 			reg = <0x0 0x13e00000 0x0 0x10000>,
 			      <0x0 0x13e10000 0x0 0x10000>,
-			      <0x0 0x13e40000 0x0 0x10000>;
-			reg-names = "common", "hypervisor", "vm";
+			      <0x0 0x13e40000 0x0 0x10000>,
+			      <0x0 0x13ef0000 0x0 0x60000>;
+			reg-names = "common", "hypervisor", "vm", "actmon";
 			interrupts = <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>,
@@ -4326,8 +4327,9 @@ host1x@13e00000 {
 				     <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "syncpt0", "syncpt1", "syncpt2", "syncpt3", "syncpt4",
 					  "syncpt5", "syncpt6", "syncpt7", "host1x";
-			clocks = <&bpmp TEGRA234_CLK_HOST1X>;
-			clock-names = "host1x";
+			clocks = <&bpmp TEGRA234_CLK_HOST1X>,
+				 <&bpmp TEGRA234_CLK_ACTMON>;
+			clock-names = "host1x", "actmon";
 
 			#address-cells = <2>;
 			#size-cells = <2>;
-- 
2.34.1

