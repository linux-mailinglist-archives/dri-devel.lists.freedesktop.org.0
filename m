Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B1287F9A6
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 09:26:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACAEB10F745;
	Tue, 19 Mar 2024 08:26:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nxW7vnoV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8112D10F745
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 08:26:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jtlx1XEKazELo0CTzgfpD0IizoDBHzwfZdcy2ec6bp5gZYPMB8BshaVCV4D8XsiGaQVOslnOUP9G+jh1qgUXdpfHRwsDfrcWK4sY0cYl44Xy6Snn9Xy7GNuoQWJesIeIp5Q7Ftz48AIHuh8qXodKw5bz2P2b3OTGhujQewv7Py4rlKcNedFQ/Aga9gWVTNmP/71p0Ko5RlDLARLz9r6cMq9XAdoWX/U7CQLl7jeGJnWN9lPMYSO1cbymX9rjwH0tAqHJXaogszwfUxR2ZXdbGpk4TAgVzxUJQVV0pMLilZw0Xno9zOgxo30pqlvGOLeOoFWkR6tRfyOpByrIguve+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9u7gXRvUv+gVV93rB1g9dDr3bPDesAfv6yvoR32J1Cs=;
 b=nYx2g13BQZFNwM1Q3XqYF/+I78wYTMUrLpVGXV9QEpqoAHjkEtkH2Pl8qi5IBjFRKN8H5UXH+1Ze3lOSyIoEXTxcb3scb8v+ywdHJgVGmHItjQfSY9ckV2KvVMjvxipHW584BCI3BFqou40WmrZqkpRZuEsP8mspduvKv8s2IicIXwMSWE3eTK/I6C/K52j4qEJknABhN8IJFlQlvOV/askiVvimAF5deMisP3euD91bNJMA3z191M4yWAygygNG0NIkMe7vdJm5Dm7K7EZCFQ7LWsRAnuk3F0U7azRKRUKYsPL6SqINoCFnGYtUduXOgrngDiOh1kWQYYjwmJcD+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gondor.apana.org.au
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9u7gXRvUv+gVV93rB1g9dDr3bPDesAfv6yvoR32J1Cs=;
 b=nxW7vnoVnw0IYXPI3hxvWcF9qLYgOtme2BC0XuwE5E8EZGdr2/pdtgmWd5G2fafe6iyzUsvDqpojGyiU1XA5/8UcT8M72PtMwqJSFgqC1MYH9WcXYX/5elH9qD/QY0HwPS4mb3p/F4P58qDUFk/tjt9VQVUFOkF2smEo5CSoxunW1f4sz3UKHse4EDV3yyIevP5EoqBg9JfXvJ9qAzwtrL7j31mO0e0OZiuM8rAXzMY0BTZUPaudz1frvbq1em1wzv4Dlyn1+/We1Y3VmpWR+K09FuV3RJIaAlcq8cYuJ2Re0OYNcCu23nQoNSIhKqoxwCq8HnA5CwTOGMnf/Vmk5w==
Received: from PR0P264CA0178.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::22)
 by LV2PR12MB6013.namprd12.prod.outlook.com (2603:10b6:408:171::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26; Tue, 19 Mar
 2024 08:26:06 +0000
Received: from SA2PEPF00001504.namprd04.prod.outlook.com
 (2603:10a6:100:1c:cafe::90) by PR0P264CA0178.outlook.office365.com
 (2603:10a6:100:1c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26 via Frontend
 Transport; Tue, 19 Mar 2024 08:26:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SA2PEPF00001504.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.10 via Frontend Transport; Tue, 19 Mar 2024 08:26:04 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 19 Mar
 2024 01:25:44 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 19 Mar
 2024 01:25:44 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 19 Mar 2024 01:25:39 -0700
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
Subject: [PATCH v6 5/5] arm64: tegra: Add Tegra Security Engine DT nodes
Date: Tue, 19 Mar 2024 13:53:06 +0530
Message-ID: <20240319082306.34716-6-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240319082306.34716-1-akhilrajeev@nvidia.com>
References: <20240319082306.34716-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001504:EE_|LV2PR12MB6013:EE_
X-MS-Office365-Filtering-Correlation-Id: 74dc497e-b727-4b0d-cbda-08dc47ee3806
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oHKVZmiGoS9RYNWqa8WQBd2diwLfoS40WvEFnrrOCTRRCX4zp/z95z4iVaN36LCz8uyF6sXE3L2BU81ghM5dN3g9/f446gwejvQpprrfugphZ/CtNTn0mz7alpOvnXomuRBeMOFDCAUBoFN4KERIHT1luFV9AWg6qDnl8MRL1jJaGzwIRwaIGNkfI3WbjC/hijuWPKjNGyljKd0Q0ee89/QeL/5e43utIgaG91hihHk1NKflksUDcwmwyLoLXts5Exjj3ljZjwsqOFRneXDoXHNcHvqbwOqk5x1zB64BbH1Rsvb1QRqkmYu6tPA+r/NB2F7uLqPXsiBthO700TceCobtRqJialrZucpS3RlcnNBwvZvjNQjzoiU1/5G6lrqo+CmCHPHYLDjCWMFDIOZMqot9k9VBYrk/fTCUBnpH4+/DsqiyCyOWlK8Dg2f+Uiefk/xMAzBkig+ZOvCUkIq3U2PLW37YCAcJmJuBwLYsA7wwn1qDaIUj0BpKV2zEXRiBvMoi+9Y1vnc7jNMshOVy2XhfkRUMdBeCq2CFF6rPNPaufpnDEzxAk+g/6KiMNe6V/r0Yh0hrC4Io/6OHyIONlNpYyG30yG565Gpw0M+1WIFb4OUbSAlSiWwSmPESC9bcZrW/Krf6tJt5qbJMynvlt5y0qSO7xDQekeYTCd0LrIVKz76Vy3+42NVTmNOSMYxRQO4dhjspIPwR+NiHUPPCrPT4YRRS/4SjGUZ7u3o++VIEG+BgV1qGpGhEc+4NlkNeXE5FZx8OfLKCNzLzbUyHXw==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(1800799015)(7416005)(82310400014)(376005)(36860700004)(921011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 08:26:04.6119 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74dc497e-b727-4b0d-cbda-08dc47ee3806
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001504.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB6013
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

