Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C942896B5F
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 12:03:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE5CD112983;
	Wed,  3 Apr 2024 10:03:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fJiylB/V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBBE0112983
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 10:03:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=llp3cq1fdI7kVXEKYhQhPoixlVf6BONaW9qF+1y1VmQhsg1EivJlGtWqxsXptTd5/ntZjLtOrbWQAk/PpflpbgImonYmRFeRRwnChzmK7qXlPbt4RTrQITN4rDnpbJd/eYuIidu5Z/ehXffyzBYfhvKuyMz0MQ2rxI6P64PLSBmynNj5T48977KvWE98F7huMW3Rp0mUwXh1hauHimUom1Sr744JkuoN4mHy0yyNkGpXr00uoqEPi0/n0dXjuAXv35l8KFg3moinEARuymoM9ANLbIcr5l6e/GCjGSUZHQxt343e3Zl2W6qHyKIGGKRm+v5P+jzhSTZiJRyvU6HT3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9u7gXRvUv+gVV93rB1g9dDr3bPDesAfv6yvoR32J1Cs=;
 b=KMSOf8ehaBYpc9f1eKbqI5YSDceDeyD70w0JqdclHjr7kSePgtTAnlciVsWSeeTKDWoP85ekco/lm4ee/dYGDOh+T5RBTEfJ/QY/pw+CLRc6+CjbfoAUMYloLFhEifme0RyTRh2VzhyOoYzb0W0fQSAI/rp7VrkYNdDENRsv2tyxbNfoSQgaYxdsaxsj0opSVzZv+q2OiCC+Vm6JLhSSdWyxrjem7kszM/9TkXVy2BHRc0+QwqwaYcta60AJVX4vKyAV2gkwCiiVS7f8B81wth0koETxO9HukYPvBasYRD6Vql0/wt/PBo5dd2Ri6nc74+hbya7N4rZ1/WEIz1f92Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gondor.apana.org.au
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9u7gXRvUv+gVV93rB1g9dDr3bPDesAfv6yvoR32J1Cs=;
 b=fJiylB/VpY/Wo6vOjI5exUprC9tse0/KDG5fmd6+YPZjoPV7VCbhxtLopJOfFhkROSOP4JaBxLLAKf9OSwQD/AX80jrmeFyvmAm+U2YXQJ7vAUDHXVJVKaNZn5XuhyIKUCVRz6ab2tfSVYPeTXqDozLLcHeadnCKZoh8fmBMuvH5D/9Dka1KC8SGsXyIYURqAg0GnMtP+rJ3EjMjW3omzNpRtSqbPiksQLCZhPDoYmx+JbTDQcqLXH+v3y2JMZH7f+EKGi+8CkC54NNpE1UsU4Bu16Ad+kGGfPvdeGrPAFbtqATZwxxYfrvN1xMCdQCR/RaphkeoAIoHvUuADMPZTg==
Received: from BL1PR13CA0006.namprd13.prod.outlook.com (2603:10b6:208:256::11)
 by MW4PR12MB7190.namprd12.prod.outlook.com (2603:10b6:303:225::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Wed, 3 Apr
 2024 10:03:16 +0000
Received: from BL6PEPF0001AB72.namprd02.prod.outlook.com
 (2603:10b6:208:256:cafe::aa) by BL1PR13CA0006.outlook.office365.com
 (2603:10b6:208:256::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26 via Frontend
 Transport; Wed, 3 Apr 2024 10:03:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL6PEPF0001AB72.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Wed, 3 Apr 2024 10:03:14 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 3 Apr 2024
 03:02:53 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.12; Wed, 3 Apr 2024 03:02:53 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1258.12 via
 Frontend Transport; Wed, 3 Apr 2024 03:02:48 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
 <catalin.marinas@arm.com>, <will@kernel.org>, <mperttunen@nvidia.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <linux-crypto@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <dri-devel@lists.freedesktop.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH v7 5/5] arm64: tegra: Add Tegra Security Engine DT nodes
Date: Wed, 3 Apr 2024 15:30:39 +0530
Message-ID: <20240403100039.33146-6-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240403100039.33146-1-akhilrajeev@nvidia.com>
References: <20240403100039.33146-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB72:EE_|MW4PR12MB7190:EE_
X-MS-Office365-Filtering-Correlation-Id: f9e78310-11b8-477e-4148-08dc53c54737
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /TyIAzzAAOSHcv0qjxF+QicSBLrYnrTUtV3z0qgmMGnDFmI5neO/Bc6xii1jj5Etp8oOvcMk1SPyHmlvvczVuljCBqNX3qts0ulVGSGPWflGUVLtQcAk3mPfbwFNusDBHHvOJkpwlLgzNcfGtCnJCxkSbFczWbltmytGUk2wRwXP+L/17hETgddg4k9Vsv8VfBnN0Qf0gOFOMCqm3nG04JRXYnzw2bSFMjVh6NVpVUNSjeJ7uQ/y1J1s978rlqQqxqvEK6bNIpgxC6LgB9kOh0eQMiNRQwMdGKJRk4scV61XyiIcX/EF9Tl9j4hsInsSQjH9yR+cjD+QwgpSS9eq6pp/r+5UTfAFTF+W3ZeGlG8vMKCAD+wMdhZXdb2XRJKwfRbsv9Tm8A25wlIbjrNbNuFc0C05FDCP73HRBVoN9CIjYA35D7ohvY2NqrPMtIwo5y9idolLtvMfg2VIQ3MGIdeHKCOaTIUCUstFr6Y9jEtW4kfl0zvofUxcQfFdFFA+73uIRKRN7GTrN4r+lre4QLluj/0bjthSjZE1AViPSaD95O8Cy7NVLgf3DeAH040Qid/AhJNz+O4ledL7Ob6CE1tXawU24++W/InV7vq+sO1rqZHY5FCIbvlbzKy85wHV2rfmPjB135LENwX6OSYNQaG+Q4x14mTz8Lp/zt7eVavZR4xKXjEBCVhH2qURz9QiZUPiNr0wce4S6M5uPwA47E3CY7TVwFAsEQK4P45SKwVQUuHo/fU1vQL5JbnOtNguITw98aWiJCK6E1LEeuTBoQ==
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(7416005)(376005)(1800799015)(82310400014)(36860700004)(921011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 10:03:14.6202 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e78310-11b8-477e-4148-08dc53c54737
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB72.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7190
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

Add device tree nodes for Tegra AES and HASH engines.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 78cbfdd98dd1..f2e2d8d6845b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -4406,6 +4406,22 @@ nvdec@15480000 {
 				 */
 				status = "disabled";
 			};
+
+			crypto@15820000 {
+				compatible = "nvidia,tegra234-se-aes";
+				reg = <0x00 0x15820000 0x00 0x10000>;
+				clocks = <&bpmp TEGRA234_CLK_SE>;
+				iommus = <&smmu_niso1 TEGRA234_SID_SES_SE1>;
+				dma-coherent;
+			};
+
+			crypto@15840000 {
+				compatible = "nvidia,tegra234-se-hash";
+				reg = <0x00 0x15840000 0x00 0x10000>;
+				clocks = <&bpmp TEGRA234_CLK_SE>;
+				iommus = <&smmu_niso1 TEGRA234_SID_SES_SE2>;
+				dma-coherent;
+			};
 		};
 
 		pcie@140a0000 {
-- 
2.43.2

