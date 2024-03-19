Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE6F87F989
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 09:24:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9204610F6DE;
	Tue, 19 Mar 2024 08:24:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="obMgB1UQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2058.outbound.protection.outlook.com [40.107.95.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30D3E10F6DE
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 08:24:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BD6vRBaLHO/nGAwdA8srAU7H6xHYvOE8bMSbIY6XsZx/LQ/zlgVUoKkTVkMaI5/12RT3Tn8WBwlDbF1vRZlzr2f3lijaZtteIqdPdF0pixmSQ6PL1CHghyp/klXx7DX5iW7jk2wTttKOx6cSwkrarpJQrNWW8G8jlCIEzgFMv31cx5aDpHXLJ8BJvCrReJUeDZfLA4rs2hnu5Zo9wNtfbOgQPcYUgVWD9YwAFG58HhssKR8x9N2Mr3VQEdifZB0sZV48FDmYWxXPHmo2qneLHkeXikgp91ZwOFojwNX27GWyXBBCxI/CqGq8SAUoIKRfzJTFtXcdELRLWamsnyp2+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9N3mW+FL+AqU1bU3hDFK552Pqhd1weQ7TdV4VrlQEc=;
 b=hL55v+3y5wwLnhpglIrG0rpZIG7NUtrZrv8EFYbx38b4Eg0ns+hlOiqnGOkxHxRMGNmF494kMTDPNs2atwVWSgVak2pOKyE6qd9F9HeklQ0nbbWMWBKlyxfppJ8pmNn9duuGBnnTLarN4C/tEibpwatVGlb9bYCXk8bgx2tEvPBKyq07Fw2M72H5X9x/DJmBKZm+ArTK4yQoPimV5Ritl7TJbycUzy89cvIFAl63srUMbYNUs2/Yj7xCVCjQnZbndX2Qn9rHdLUjZLm1onYNtEK4BFoOX0s4nsYmH34E8C24LsNqVklF5DB+m2HGkBD6iMBBB9xq9OR64ASmmLlfcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gondor.apana.org.au
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9N3mW+FL+AqU1bU3hDFK552Pqhd1weQ7TdV4VrlQEc=;
 b=obMgB1UQP3AMbGIbQmOu8nVIysqu7OeUgJkNXxwR9u9zDAhy4qPVgA9KX+gCp0ArF1obKkC6z4cmkN89+P+a4PX4mRxQQIX2inVqSDk2v2MM9PNXhGdWLXqVZr3NjDF+vPZMqJaYHB243Kw5hGS548bZgoXEGPbirxjIrYOhULHCDXOXgQNFI0KLhDaoFdUzymjyAObPmStI1KFZHHqbwnR5ZlPSOqxdkxgGaLhkyZk4ol1YP4Ms7ltQPyWEs/F8QHqA1yWnPpUOKE8k3lfWxs8irMp8ehWOiYxiKSZq3U+7XWm2+jgYr16YdCphtzo4suNuGmO8tsTSgieSq93Ngw==
Received: from DM6PR02CA0091.namprd02.prod.outlook.com (2603:10b6:5:1f4::32)
 by PH0PR12MB8174.namprd12.prod.outlook.com (2603:10b6:510:298::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27; Tue, 19 Mar
 2024 08:24:21 +0000
Received: from DS3PEPF000099D4.namprd04.prod.outlook.com
 (2603:10b6:5:1f4:cafe::65) by DM6PR02CA0091.outlook.office365.com
 (2603:10b6:5:1f4::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27 via Frontend
 Transport; Tue, 19 Mar 2024 08:24:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS3PEPF000099D4.mail.protection.outlook.com (10.167.17.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.10 via Frontend Transport; Tue, 19 Mar 2024 08:24:19 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 19 Mar
 2024 01:24:07 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 19 Mar
 2024 01:24:07 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 19 Mar 2024 01:24:02 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
 <catalin.marinas@arm.com>, <will@kernel.org>, <mperttunen@nvidia.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <linux-crypto@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <dri-devel@lists.freedesktop.org>
CC: Akhil R <akhilrajeev@nvidia.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 1/5] dt-bindings: crypto: Add Tegra Security Engine
Date: Tue, 19 Mar 2024 13:53:02 +0530
Message-ID: <20240319082306.34716-2-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D4:EE_|PH0PR12MB8174:EE_
X-MS-Office365-Filtering-Correlation-Id: d4370fc3-e441-4a35-0b3a-08dc47edf97b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IUC/6yNCfOS1ZJm6c5R9SR+5AoFeKfVmA2Rq7e0QY5N4tjMBiPOBDCXBEVXxEWPvAVJ6OBSHGY3F3txFHRAhg51Rab7fvHBReNl8qaKraOZG4jivTwVvJLh87auZMjhdPEE0Ss4rOhFFjgmSjf9E1P14/fEIO2ReFzHZLNsfOilxvdEInHAR/iVZ3/KbjNgw5vWuQb6pBhQ6+G18A3xELpUusAB8U7ulAs7yx6e8VumZRkCKMHLqsOF0G72n1PuDWLHhzSqoE6dwSDp6+mf4riPeFfb+oUYWHkEjH0fYgI174toYnxgp2kJq10Gme9aOVL1OnN/Ay8eOBfmA3EjkZNrQKwWzVeCx0tust1Xi96opm4QKgeYwWHyURa6MUgVddxnvzV86KS9gKp4crccTjsbGVToie8ctpz6QYg39iw7RlvLc2IKj3qXQtM97v8m4oRj4EpQFQ9a+XyrwqLu+eh3v6crB5JXiS4aV0Bvjht9wJgZwI0/4ka62qho29XWZPNjnmswWYKfmNRzNRjUhjf1wOlwP1Ox4Q2kCPrzYR5SS3nWZ6804evZG/Dy96P1zEIrb7P1uHM9y1Lr52QJZ086Lfz8OuKbrlyNbD6vV5GGy4xlg2k06mZJlAPjltEwLZW3VpblV4a3/d/GRud1dY0mVm+K43cZjd7OY3/nkaootibRP0htUDCamkX/fcRDGzb3atnkE9bFAKobGiGe4PSuo57eOlplH9lGF95t6t2JY2CbVbMNLVOEjIRwGbtwfknnaGD+/wH+WE77mIXgBuw==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(376005)(82310400014)(36860700004)(7416005)(1800799015)(921011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 08:24:19.6304 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4370fc3-e441-4a35-0b3a-08dc47edf97b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8174
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

Add DT binding document for Tegra Security Engine.
The AES and HASH algorithms are handled independently by separate
engines within the Security Engine. These engines are registered
as two separate crypto engine drivers.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../crypto/nvidia,tegra234-se-aes.yaml        | 52 +++++++++++++++++++
 .../crypto/nvidia,tegra234-se-hash.yaml       | 52 +++++++++++++++++++
 2 files changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/nvidia,tegra234-se-aes.yaml
 create mode 100644 Documentation/devicetree/bindings/crypto/nvidia,tegra234-se-hash.yaml

diff --git a/Documentation/devicetree/bindings/crypto/nvidia,tegra234-se-aes.yaml b/Documentation/devicetree/bindings/crypto/nvidia,tegra234-se-aes.yaml
new file mode 100644
index 000000000000..cb47ae2889b6
--- /dev/null
+++ b/Documentation/devicetree/bindings/crypto/nvidia,tegra234-se-aes.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/crypto/nvidia,tegra234-se-aes.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra Security Engine for AES algorithms
+
+description:
+  The Tegra Security Engine accelerates the following AES encryption/decryption
+  algorithms - AES-ECB, AES-CBC, AES-OFB, AES-XTS, AES-CTR, AES-GCM, AES-CCM,
+  AES-CMAC
+
+maintainers:
+  - Akhil R <akhilrajeev@nvidia.com>
+
+properties:
+  compatible:
+    const: nvidia,tegra234-se-aes
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  dma-coherent: true
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - iommus
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/memory/tegra234-mc.h>
+    #include <dt-bindings/clock/tegra234-clock.h>
+
+    crypto@15820000 {
+        compatible = "nvidia,tegra234-se-aes";
+        reg = <0x15820000 0x10000>;
+        clocks = <&bpmp TEGRA234_CLK_SE>;
+        iommus = <&smmu TEGRA234_SID_SES_SE1>;
+        dma-coherent;
+    };
+...
diff --git a/Documentation/devicetree/bindings/crypto/nvidia,tegra234-se-hash.yaml b/Documentation/devicetree/bindings/crypto/nvidia,tegra234-se-hash.yaml
new file mode 100644
index 000000000000..f57ef10645e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/crypto/nvidia,tegra234-se-hash.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/crypto/nvidia,tegra234-se-hash.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra Security Engine for HASH algorithms
+
+description:
+  The Tegra Security HASH Engine accelerates the following HASH functions -
+  SHA1, SHA224, SHA256, SHA384, SHA512, SHA3-224, SHA3-256, SHA3-384, SHA3-512
+  HMAC(SHA224), HMAC(SHA256), HMAC(SHA384), HMAC(SHA512)
+
+maintainers:
+  - Akhil R <akhilrajeev@nvidia.com>
+
+properties:
+  compatible:
+    const: nvidia,tegra234-se-hash
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  dma-coherent: true
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - iommus
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/memory/tegra234-mc.h>
+    #include <dt-bindings/clock/tegra234-clock.h>
+
+    crypto@15840000 {
+        compatible = "nvidia,tegra234-se-hash";
+        reg = <0x15840000 0x10000>;
+        clocks = <&bpmp TEGRA234_CLK_SE>;
+        iommus = <&smmu TEGRA234_SID_SES_SE2>;
+        dma-coherent;
+    };
+...
-- 
2.43.2

