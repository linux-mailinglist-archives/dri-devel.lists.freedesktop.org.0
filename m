Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 593659EAFD9
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 12:26:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BFE210E8AB;
	Tue, 10 Dec 2024 11:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sMTW0PJq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D066410E2B5
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 17:26:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nD0r3HGrKTLNs++Uo+LWaIbWPG6+S9Tc1kXc33P+28JSHiV5kQoEr/GbWsLQ27iX6yYjlY+pPm01syJ9YcdoB+XBUT7iKjUp/8CHCcrVBcjA0hsXQdlk6VSGxU13NqoH4o7YE4PfVRd5SGG6PsYnJF5mFnTOKPlituneU9Z8pKoFrl4SKwKh2WntXD5Wiecgni0tlkVxJ5a65kUr37xnEVAnZJ4Xul0in0/Aqj+8tzr/q+yOKkLxWRwv7zoAEY9vIQpiCch8VgQ3BORE9Kbn31JB54Hqjh3OGtCCcaRGJuotV/Xua6k4zBlNGyj7+P27G1NCA82fVLDxYf+qZ4Olvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G3kUmzrLMkWUfB48YLCeARgGAa30xPwEHQK4fsnxpts=;
 b=g9hRXXpkNIbtK7MJr2oTlONlnIBiuWCbzujbIRsMM85Las+52Gq9f12ayB0Ab1s1L9cZsqhKI006yH+33PmBU1p2CTUhCOz4sjBswlR+3WtkO274cgtWsASRj1hz4WizABRANXzo2gTjsUkF+qL7426qBdswlFGQxbrb/4nyryqa4k8Y8QD7bUqKw+DL6mLrioiqdd3FkHXD/ep76nsxMFvAet6bhrjthw2VBVm5tWh7TZ/wkduVJjlh5K3ql4+jTxPxTRVv6/dXxW0dvWhiHz/SZaA9dlOktbsQvCpxiI+i8Vo8r3gly+Xy3SpGSG6bjZpSuON8NZtZX/L5scmsPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3kUmzrLMkWUfB48YLCeARgGAa30xPwEHQK4fsnxpts=;
 b=sMTW0PJqTUH/7vHr2ijMYw8+Mpv9K7b8zo+ChwXHezS6qGP5sMHjbD3FjTd3LNIBLM+CVrZhHM/vGJuSXdIEeJTI8H3bClpCcKA4LAMGFGJUuYYsOL3Pjy5bRTct7YJOQ09Qv4C5hNQTwttiQ248oGTeKvk/NK7LwKf+1WyJ4QdWWjdKW6MXZM2G0say+VVjLdPCV71/D660uS3fHITKbhUCx3zbpDfPdhEQmVrjsqfyk21FWuWQhUBowZ/e2h8APH5aa4NdReLQNiMrBg7ELD0NRkdTFkIwqDuGL2ihr8Qf34+7/nzHGrIgQS5lW2L9Y7lEaNrVhmEzRW+jQjEPpg==
Received: from BN9PR03CA0482.namprd03.prod.outlook.com (2603:10b6:408:130::7)
 by IA1PR12MB7544.namprd12.prod.outlook.com (2603:10b6:208:42c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 17:26:21 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:408:130:cafe::95) by BN9PR03CA0482.outlook.office365.com
 (2603:10b6:408:130::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.12 via Frontend Transport; Mon,
 9 Dec 2024 17:26:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.7 via Frontend Transport; Mon, 9 Dec 2024 17:26:21 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 9 Dec 2024
 09:26:02 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 9 Dec 2024
 09:26:02 -0800
Received: from thinkpad-t480.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 9 Dec 2024 09:26:02 -0800
From: Johnny Liu <johnliu@nvidia.com>
To: <thierry.reding@gmail.com>, <mperttunen@nvidia.com>, <airlied@gmail.com>, 
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-tegra@vger.kernel.org>
CC: <jonathanh@nvidia.com>, <rkasirajan@nvidia.com>, <bbasu@nvidia.com>,
 <johnliu@nvidia.com>
Subject: [PATCH 2/5] arm64: tegra: Add actmon information
Date: Mon, 9 Dec 2024 09:25:46 -0800
Message-ID: <20241209172549.5624-3-johnliu@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241209172549.5624-1-johnliu@nvidia.com>
References: <20241209172549.5624-1-johnliu@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|IA1PR12MB7544:EE_
X-MS-Office365-Filtering-Correlation-Id: 71a63d03-389a-408c-d261-08dd18769954
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WjlnlSgotYWkA3i8pfsqRHK6j6XfZv3vfVSS07T8molGOxMu+6UxToqmjmSi?=
 =?us-ascii?Q?yX19MzYx+ZyzgUGwsE4EnjDCmRVg8JTh9NGeWnS2dIP9K1fCF+dnrqpSROwK?=
 =?us-ascii?Q?8owfGBpDfudD5Lw4sN4yHnzmmS1XrF/s0hCqEge70IDsUWK0EmBxefH0H2fz?=
 =?us-ascii?Q?YoRGddMEyH2ArAFkqf4zsSA50FJQI+0qRT7beR1cBrczjTXXOn84nuhK5Flr?=
 =?us-ascii?Q?kmqQKmp/+YvO9V5tJ+XSZbvbS3kcenxF12fj0h5cRvMI/IakRkSgMofaud2D?=
 =?us-ascii?Q?M0zN9K+d/unHg47VOnGmbB8hTnMVOto0Lz/0fx1ABUla7EWvtNlzpuzzmY5P?=
 =?us-ascii?Q?AytRRwYYEmdL01C/BV1VmxAj5M473d6aI/cOqhohx/C7W+C4TuFRqjCOPtl7?=
 =?us-ascii?Q?SiaTTdpi0mNR8/AbN6BA1gEvbhtEg8JfT1IlzWE8iDAQB0cqFz6UNFc8tsKi?=
 =?us-ascii?Q?TawL/0bCnQcjijyCOt7G0cQnMDCtr3FuDOm8lrpGhmQzladsWRO1fF0ekill?=
 =?us-ascii?Q?rl1BHr/t2W94UZPDOQw3av6AlBWEPyfkn5vr8pc3F2PMvh2JxZTuctBr4p9B?=
 =?us-ascii?Q?fbjNt2uP8jEwvSr6jMyyNXCxdTMP6wt+M2nlYbsRCGZpaepMngMERG5+TiM/?=
 =?us-ascii?Q?y7GziwejlQ3xU5aMG1VaCTltEGSnaZaWjltiHKTnbKwoGJTvTunPsZO0qar1?=
 =?us-ascii?Q?4XPT4RwJCGA/gou/rkn7+2mCOCUmia2r6x902vpvtoKIGhhcrVdziazMQg7h?=
 =?us-ascii?Q?SQ2Qeu46BGqb2nIfkxbAlB7V+VvO19N/kxQDuOlgF6Nl+5h1jRfK0BAcUQIR?=
 =?us-ascii?Q?V40bhbClvHgz7wW2gJUFTXk8ITz8vANN9iUIEHayIwUPaiUK7D8xycpch8h/?=
 =?us-ascii?Q?OhjvOGg7DLPBJIXcWO3+lxZAss6dtWOCCp+LEXfyynF0x+YgYQrpsn3YPAVK?=
 =?us-ascii?Q?tONBteA/r65vKmdBOR0e6lUeYT837s4annZuASesUUslinJ1vzpNNVXSw/+t?=
 =?us-ascii?Q?DRpFQ7oc/UEC40dZVnLNBlRJSl4/swcn7GpBvKEeKjIKRMXh42nzteT25qSE?=
 =?us-ascii?Q?Y7w196jBsmS5hU1jw+sSpFWxezt9HiXxurFtO7dwjfnBYLtFmxkXOiBDBRUY?=
 =?us-ascii?Q?i14NEnOq/weO7GRijneK8Mqg2ngeUE+ZGZiohd6b8S4BmDFajluzAlKKy8Y5?=
 =?us-ascii?Q?psOZG2A5O4k9RCIFO+lE7yUR9GsJqTS1/awJ4F9Sr6UMEre+JqOGjy1ga7t5?=
 =?us-ascii?Q?GM9yjC1wdXXN4avs62ZeGfiqNg+27pd5RkfBGCKZW28zFEPGfur8Qn6jw2+J?=
 =?us-ascii?Q?AZqJmt0xFGVkge2/5P0q9792FAjDT9OqSyJxcWE8468VneEBmu7eYDQBic8H?=
 =?us-ascii?Q?5QLFU+JDwmiEZg+MQ8PiTERl5mQr1B2NTA5iJVQvZYw0GvPWsTeJyY00DcO/?=
 =?us-ascii?Q?H/tgbISpDxgeX5yTbQ/XRKenPFO18rbH?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 17:26:21.2127 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71a63d03-389a-408c-d261-08dd18769954
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7544
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

Configuration of actmon is under the host1x address space. Therefore,
add the actmon aperture under the host1x.

All unit actmons for host1x clients share the same actmon clock source
from host1x. Therefore, add the clock phandle in host1x.

Signed-off-by: Johnny Liu <johnliu@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index f2e2d8d6845bf..dee12754b97de 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -4311,8 +4311,9 @@ host1x@13e00000 {
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
@@ -4324,8 +4325,9 @@ host1x@13e00000 {
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

