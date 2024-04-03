Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 757A8896B4B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 12:01:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED88112980;
	Wed,  3 Apr 2024 10:01:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Qh0crMYB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68594112980
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 10:01:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g377J5evBlik6HGxbVMjoQFZW6jAZVuyVBKxor19M+h1KY3tSmwDPadxANnSPaKjGJeT9Ml5BpyidWWtz8JiqJmeyNPuXsTRPboc2i/psru13Ld/XZqOI4f1xXjmDbbUUvMWr9iaBZovd+REhDIM7fYmAHgyeAuaBTi6luOmbWYz63Yhu2gLMz/ENxgGeVkDCwSph4dj6uPDhl+094mp65STm4ZjOUfgbnBfdYAW0oPMbvkQ/hfR3n23+5uvWrsUQ0M4jdceM7RCW5pbX26VZVXgunwYWkrK0iKlk3TzvO3Q35EAAgqIbK67+v3Rcu8f9R+r3+zppi6qvlzhPnpS4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9N3mW+FL+AqU1bU3hDFK552Pqhd1weQ7TdV4VrlQEc=;
 b=ljuwxA83jikB3hT7Ou0MzekxLRPxlZ0FWmTnpc70PII+WeBBSn77cFcwQriMqlHyoMXKBKR77rh2d7/YiPaOP/YAx+LyjGsWYQiEdQyxp6lUlZTGY2LcdmNnpCQZJAGEf/NiE/XEGwM7ONiVFcrsKNd7oUVEO312s51SQCBkC8WlTocw3bSJ6r5nrFdTcokeajoB7HicMUdHP4Zy868UGbZAzQTfEmqMio235dSOJqTB8LYTBoZCQ5QCx5ASdWwufi7Ms0i59sziDoEF1KUQFyM+cmZk1Xr12Tcy9KIbNYcPH1zjLHKpGDDs/CJxXRMltfgti/Zn/WMjqWZRJJyMYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=gondor.apana.org.au
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9N3mW+FL+AqU1bU3hDFK552Pqhd1weQ7TdV4VrlQEc=;
 b=Qh0crMYBKcA4K1qDbp+5D/AwG5UYu8cOwl2YUaO5+edYLR99Of/3dPwsgJ0R3FZRdP02fUeQ42lDHQVZnnfsuT3VnEhqX7TXNLEeWTC7ov8OIjjgD7OJ6cKwdInOVQfUInTAhUEYy5/bkfGTxnCFF1Rw9GQ0k2TgBWcAL9G/6l+T7gtu9fA9ksSyPP6+EUUWG/cvT1bUzoOtC5qJC6TXgKk6jaoS0gv2RIH/yaeDHHptCFWkB8jygzlZv2ltDrB2nC+aDhR8+2wKXAaTQGVAVpOUC9045Bhsoj5Z+AVxONBeBDUhaYfDwPJxs+jv6Vrcv0UlYT3iybszp7hn/6Hjyw==
Received: from BN7PR06CA0042.namprd06.prod.outlook.com (2603:10b6:408:34::19)
 by BY5PR12MB4244.namprd12.prod.outlook.com (2603:10b6:a03:204::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 3 Apr
 2024 10:01:37 +0000
Received: from BN1PEPF00004680.namprd03.prod.outlook.com
 (2603:10b6:408:34:cafe::53) by BN7PR06CA0042.outlook.office365.com
 (2603:10b6:408:34::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46 via Frontend
 Transport; Wed, 3 Apr 2024 10:01:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN1PEPF00004680.mail.protection.outlook.com (10.167.243.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Wed, 3 Apr 2024 10:01:35 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 3 Apr 2024
 03:01:17 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.12; Wed, 3 Apr 2024 03:01:16 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1258.12 via
 Frontend Transport; Wed, 3 Apr 2024 03:01:11 -0700
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
Subject: [PATCH v7 1/5] dt-bindings: crypto: Add Tegra Security Engine
Date: Wed, 3 Apr 2024 15:30:35 +0530
Message-ID: <20240403100039.33146-2-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004680:EE_|BY5PR12MB4244:EE_
X-MS-Office365-Filtering-Correlation-Id: 67c430aa-4604-4321-00c4-08dc53c50c3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: incwwLBkYdsW+rOQ3KuQ9W8Wy9nXRQlyvgCZLA+RhJn70cigKVxNcweUaPuMxo5k5dLOQGHINaRNSzUMWHALWxI1umhYK40sA9dm7jxnLsTBQqV6ymjw9uFjlBXMCqLRGq+RdBFK2O3xmBGoQ/5e29z4Y31szV86kwvuhKzUBqhHLj8nYtb2slDMO9ilgaXpccnMO0p7jAwykHcyolh66rga3ZFo6bYy3CIAR6iO6zetZ751YX8vSTZh7RS/my+3YIsGORrxKCYUUioVVdxFxiEytHqsL4YyWw5Flg8LtJmitBSNCvhE9yTuJKAAY4RCul/HnbOCvc40oq1XqkDbxpA468x1fvezN90fjC0IPR4kj9xigxl49V4ui93fTV5UYLYZiGPt+vQBOfspNB/nB6FBLf1yX2BvX/7FobM9kEb4vr2wXRZgLa3fRR2n5Wj6R0StTRLtALH68F7WVim1ec7GmpdVGlTHRJAUocUYKsAquk69Huaxo/lAgLo+86Qque4oQzN/MUnk279UBUVPaefr0Qbm+ccp+euSz29UPV4AFZHu3cjiHFMjospVUdrbcutQJ5zdhxaT5Tl65nLvW+uISfnUBIND2l9EgAIeY04b3xrTUliFnEn5amI1gNKnIv96nN7hN13tHp7krD1uuuvQlypRg1MAfOJKg4PFawuLWplZB9SIOa4uxVfsH/LT7PtBgX5M3KDC4TooUSMLUF+XwGn4gRDp01UhSSGsuIH7Pj3oHixhRCof1CQsWZxBusvDaL0fB+bIdtia+htdbw==
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(1800799015)(36860700004)(376005)(82310400014)(7416005)(921011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 10:01:35.6633 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67c430aa-4604-4321-00c4-08dc53c50c3e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004680.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4244
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

