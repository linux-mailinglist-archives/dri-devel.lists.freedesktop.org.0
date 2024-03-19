Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B7F87F994
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 09:25:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B4C610F718;
	Tue, 19 Mar 2024 08:25:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EVotYLGa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C12910F718
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 08:25:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZdlQQYk12mA80lGzSHIBX2w8qJPrVMzx0lQim9ArwhBbEm65McphOeVEmmHzCn82pyy0ZCJhkuzhQ/JSFdNz6dojx4mQerOOzIiVU/VIX2LbnuvqmA5Ue002ArRapxxKF0mqMCsJ77YNxr2ocZ1bcEBvmZqpzpMMuj/mNSLm+M74pQ5PjedOzxYrleQ0auHKczSBmXYng7A/H00P28LWjgnc5Wf2FVWIGALGDYPBsJ7nQS9qgqzN60Tw/1CwmcD9jPFwhvoSHigcD9D3CL7NQAxorTDETDDfChv3RsQZulfGdZi3FCOQ5n/2VCDGaYxM+JF7g53czgLvCNSbc0skEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o2gA8VUd+ojlvwZ4ZPXYvEymyH80lOJzxUk1fcFXHIY=;
 b=KxqaOVxr9kHiBEJe4KElvFZs2Rlo8VHfduXcKxM7e+CHcsT5fymnFQnrfX+Nz9kXxrHBjw1aTnexhaypfegB7WipHzAHDSQh6T6AZ5FCzcJnvoN5d6b5MZTUIM88xoR01uzwp379g0o5xWwKc15i/ix5YCI0T1G2tATLjaqltqOz7gf2kUT7WgTMsmJOgOl2baeAJ6/L/2Ulpmo8DpIVKBp8snUlGwoNwlXP01pZCKjk3HgxEZ0SYnb76A16vXikHetSuZ1BuLuASAm6O1R18bXuj+ObE4Efl7gvfX2UcxUP4saHLMiUZPVI1L3ZdY80AF5hkTLrugoZ91gH3OTGfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gondor.apana.org.au
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o2gA8VUd+ojlvwZ4ZPXYvEymyH80lOJzxUk1fcFXHIY=;
 b=EVotYLGaqqM9fdN7TMs4t18wt90TlcBzbj6l9CACCZKasi6yufCCcoRGTciCWfnaNdhR+Jk/K2ZhssjLWrPnF91mHZtBrwUDgEESZGBv+nWWnji47R67KAUU7jJyvVKADZ9V2KqfcZN7aIG/p4AZivS4Xs4An3cy7RaUkRf3CTNs9h0vGTu7oAHmMZfmMpJpceRq6v+kLDuxE6NWdNJmkPwBt15T/iBopo0nGxDVCMBsZMY2O2j8/EZqkgpb2+rKlV3ctXKjvRobnBr4AbE5E6HxRy3/0mmrWxOfd+PQE54w3C7P0cQqV4pl4lGA+2TtrBBnLZkoK4a0nvMa1yGwAA==
Received: from BL1PR13CA0068.namprd13.prod.outlook.com (2603:10b6:208:2b8::13)
 by SN7PR12MB7936.namprd12.prod.outlook.com (2603:10b6:806:347::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27; Tue, 19 Mar
 2024 08:25:04 +0000
Received: from BL02EPF0001A100.namprd03.prod.outlook.com
 (2603:10b6:208:2b8:cafe::1c) by BL1PR13CA0068.outlook.office365.com
 (2603:10b6:208:2b8::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12 via Frontend
 Transport; Tue, 19 Mar 2024 08:25:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0001A100.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.10 via Frontend Transport; Tue, 19 Mar 2024 08:25:02 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 19 Mar
 2024 01:24:46 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 19 Mar
 2024 01:24:45 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 19 Mar 2024 01:24:40 -0700
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
Subject: [PATCH v6 3/5] crypto: tegra: Add Tegra Security Engine driver
Date: Tue, 19 Mar 2024 13:53:04 +0530
Message-ID: <20240319082306.34716-4-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A100:EE_|SN7PR12MB7936:EE_
X-MS-Office365-Filtering-Correlation-Id: 44fdbd62-7cc4-4c86-17da-08dc47ee133c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JqIVD3VJCbpTgelSiKUG15kMfU1GYvd01ddpWF/1ghdOOISTk4Fo5G1xuaHTCVwU0smhG+CP9dN7Z2ioRx3C6dOYSOwCRgPjAtFyNC9IUzL9CIjbMKFlJAN7Hy7FbDnUFMthgodDSYru2hC5pSqHlesqU2vlqNTk45mEv7OFsfwraNLHRe020a+t5F2uiuWBN17C7mU6+b7KeQKMtD5fzU6GcWari1OiIzb9bwrj/3qKoZjclO8XbPv1gygw52GSADbIi/5nNR05zA9ORyHyY6noVp1cOkDPxH7qeD41jOkVBryVfb7T1tu0vl00FyDMPVD/2p1O5PyhTecd86xX4j7RqokLZo3TOcZ8CNbZQ1vnfKVI5jXC8uQcjv7GOplCdGhD/DpyXYdWNjNB9OyH4wcGiyO8Ot9c5JDt3iBOpELsFtzjVkRr1qr7UeUfQyhs+z2vkWos6FWlLl4mcpqoPJzP7/x5NzPufyKIiiiIEY3xCBofwImpKRB0B1QyUCG1hUcPq89yej4N0p15idsPiHHkxiXg/Xs3R7xyyjAZok3f+3B2EDd1E6mJdMLUMKHDFN63MGH+MpEc0B18sPsEqkiqTmj5TZBUnZa/zpevVaA45rn8p9ZhQIyXYFIG23sYo+sXWQLXT/jrDbZy3zsMM6/pWxTIF4/ldXVgvGDLGLxjOixQKa//RDiORFu0TDYbpm/D+cYDFXktdPppkYdiDbjib/6Wh0/cQOnFD+4kONmQO1r0Wsibg+GuOHutEVg/WywShLgg5H2Lw3Mw4c83oQ==
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(1800799015)(7416005)(36860700004)(82310400014)(376005)(921011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 08:25:02.8074 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44fdbd62-7cc4-4c86-17da-08dc47ee133c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A100.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7936
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

Add support for Tegra Security Engine which can accelerate various
crypto algorithms. The Engine has two separate instances within for
AES and HASH algorithms respectively.

The driver registers two crypto engines - one for AES and another for
HASH algorithms and these operate independently and both uses the host1x
bus. Additionally, it provides  hardware-assisted key protection for up
to 15 symmetric keys which it can use for the cipher operations.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 MAINTAINERS                          |    5 +
 drivers/crypto/Kconfig               |    8 +
 drivers/crypto/Makefile              |    1 +
 drivers/crypto/tegra/Makefile        |    9 +
 drivers/crypto/tegra/tegra-se-aes.c  | 1960 ++++++++++++++++++++++++++
 drivers/crypto/tegra/tegra-se-hash.c | 1055 ++++++++++++++
 drivers/crypto/tegra/tegra-se-key.c  |  156 ++
 drivers/crypto/tegra/tegra-se-main.c |  439 ++++++
 drivers/crypto/tegra/tegra-se.h      |  569 ++++++++
 9 files changed, 4202 insertions(+)
 create mode 100644 drivers/crypto/tegra/Makefile
 create mode 100644 drivers/crypto/tegra/tegra-se-aes.c
 create mode 100644 drivers/crypto/tegra/tegra-se-hash.c
 create mode 100644 drivers/crypto/tegra/tegra-se-key.c
 create mode 100644 drivers/crypto/tegra/tegra-se-main.c
 create mode 100644 drivers/crypto/tegra/tegra-se.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 82896c3e0559..68f3a6f002ec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21702,6 +21702,11 @@ M:	Prashant Gaikwad <pgaikwad@nvidia.com>
 S:	Supported
 F:	drivers/clk/tegra/
 
+TEGRA CRYPTO DRIVERS
+M:	Akhil R <akhilrajeev@nvidia.com>
+S:	Supported
+F:	drivers/crypto/tegra/*
+
 TEGRA DMA DRIVERS
 M:	Laxman Dewangan <ldewangan@nvidia.com>
 M:	Jon Hunter <jonathanh@nvidia.com>
diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 3d02702456a5..bb27690f8f7c 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -660,6 +660,14 @@ config CRYPTO_DEV_ROCKCHIP_DEBUG
 	  This will create /sys/kernel/debug/rk3288_crypto/stats for displaying
 	  the number of requests per algorithm and other internal stats.
 
+config CRYPTO_DEV_TEGRA
+	tristate "Enable Tegra Security Engine"
+	depends on TEGRA_HOST1X
+	select CRYPTO_ENGINE
+
+	help
+	  Select this to enable Tegra Security Engine which accelerates various
+	  AES encryption/decryption and HASH algorithms.
 
 config CRYPTO_DEV_ZYNQMP_AES
 	tristate "Support for Xilinx ZynqMP AES hw accelerator"
diff --git a/drivers/crypto/Makefile b/drivers/crypto/Makefile
index 95331bc6456b..ad4ccef67d12 100644
--- a/drivers/crypto/Makefile
+++ b/drivers/crypto/Makefile
@@ -41,6 +41,7 @@ obj-$(CONFIG_CRYPTO_DEV_SAHARA) += sahara.o
 obj-$(CONFIG_CRYPTO_DEV_SL3516) += gemini/
 obj-y += stm32/
 obj-$(CONFIG_CRYPTO_DEV_TALITOS) += talitos.o
+obj-$(CONFIG_CRYPTO_DEV_TEGRA) += tegra/
 obj-$(CONFIG_CRYPTO_DEV_VIRTIO) += virtio/
 #obj-$(CONFIG_CRYPTO_DEV_VMX) += vmx/
 obj-$(CONFIG_CRYPTO_DEV_BCM_SPU) += bcm/
diff --git a/drivers/crypto/tegra/Makefile b/drivers/crypto/tegra/Makefile
new file mode 100644
index 000000000000..a32001e58eb2
--- /dev/null
+++ b/drivers/crypto/tegra/Makefile
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// SPDX-FileCopyrightText: Copyright (c) 2023 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+tegra-se-objs := tegra-se-key.o tegra-se-main.o
+
+tegra-se-y += tegra-se-aes.o
+tegra-se-y += tegra-se-hash.o
+
+obj-$(CONFIG_CRYPTO_DEV_TEGRA) += tegra-se.o
diff --git a/drivers/crypto/tegra/tegra-se-aes.c b/drivers/crypto/tegra/tegra-se-aes.c
new file mode 100644
index 000000000000..a3962989dc5e
--- /dev/null
+++ b/drivers/crypto/tegra/tegra-se-aes.c
@@ -0,0 +1,1960 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// SPDX-FileCopyrightText: Copyright (c) 2023 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+/*
+ * Crypto driver to handle block cipher algorithms using NVIDIA Security Engine.
+ */
+
+#include <linux/clk.h>
+#include <linux/dma-mapping.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+
+#include <crypto/aead.h>
+#include <crypto/aes.h>
+#include <crypto/engine.h>
+#include <crypto/gcm.h>
+#include <crypto/scatterwalk.h>
+#include <crypto/xts.h>
+#include <crypto/internal/aead.h>
+#include <crypto/internal/hash.h>
+#include <crypto/internal/skcipher.h>
+
+#include "tegra-se.h"
+
+struct tegra_aes_ctx {
+	struct tegra_se *se;
+	u32 alg;
+	u32 ivsize;
+	u32 key1_id;
+	u32 key2_id;
+};
+
+struct tegra_aes_reqctx {
+	struct tegra_se_datbuf datbuf;
+	bool encrypt;
+	u32 config;
+	u32 crypto_config;
+	u32 len;
+	u32 *iv;
+};
+
+struct tegra_aead_ctx {
+	struct tegra_se *se;
+	unsigned int authsize;
+	u32 alg;
+	u32 keylen;
+	u32 key_id;
+};
+
+struct tegra_aead_reqctx {
+	struct tegra_se_datbuf inbuf;
+	struct tegra_se_datbuf outbuf;
+	struct scatterlist *src_sg;
+	struct scatterlist *dst_sg;
+	unsigned int assoclen;
+	unsigned int cryptlen;
+	unsigned int authsize;
+	bool encrypt;
+	u32 config;
+	u32 crypto_config;
+	u32 key_id;
+	u32 iv[4];
+	u8 authdata[16];
+};
+
+struct tegra_cmac_ctx {
+	struct tegra_se *se;
+	struct crypto_shash *fallback_tfm;
+	unsigned int alg;
+	u32 key_id;
+};
+
+struct tegra_cmac_reqctx {
+	struct scatterlist *src_sg;
+	struct tegra_se_datbuf datbuf;
+	struct tegra_se_datbuf residue;
+	unsigned int total_len;
+	unsigned int blk_size;
+	unsigned int task;
+	u32 crypto_config;
+	u32 config;
+	u32 key_id;
+	u32 *iv;
+	u32 result[CMAC_RESULT_REG_COUNT];
+};
+
+/* increment counter (128-bit int) */
+static void ctr_iv_inc(__u8 *counter, __u8 bits, __u32 nums)
+{
+	do {
+		--bits;
+		nums += counter[bits];
+		counter[bits] = nums & 0xff;
+		nums >>= 8;
+	} while (bits && nums);
+}
+
+static void tegra_cbc_iv_copyback(struct skcipher_request *req, struct tegra_aes_ctx *ctx)
+{
+	struct tegra_aes_reqctx *rctx = skcipher_request_ctx(req);
+	unsigned int offset;
+
+	offset = req->cryptlen - ctx->ivsize;
+
+	if (rctx->encrypt)
+		memcpy(req->iv, rctx->datbuf.buf + offset, ctx->ivsize);
+	else
+		scatterwalk_map_and_copy(req->iv, req->src, offset, ctx->ivsize, 0);
+}
+
+static void tegra_aes_update_iv(struct skcipher_request *req, struct tegra_aes_ctx *ctx)
+{
+	int num;
+
+	if (ctx->alg == SE_ALG_CBC) {
+		tegra_cbc_iv_copyback(req, ctx);
+	} else if (ctx->alg == SE_ALG_CTR) {
+		num = req->cryptlen / ctx->ivsize;
+		if (req->cryptlen % ctx->ivsize)
+			num++;
+
+		ctr_iv_inc(req->iv, ctx->ivsize, num);
+	}
+}
+
+static int tegra234_aes_crypto_cfg(u32 alg, bool encrypt)
+{
+	switch (alg) {
+	case SE_ALG_CMAC:
+	case SE_ALG_GMAC:
+	case SE_ALG_GCM:
+	case SE_ALG_GCM_FINAL:
+		return 0;
+	case SE_ALG_CBC:
+		if (encrypt)
+			return SE_CRYPTO_CFG_CBC_ENCRYPT;
+		else
+			return SE_CRYPTO_CFG_CBC_DECRYPT;
+	case SE_ALG_ECB:
+		if (encrypt)
+			return SE_CRYPTO_CFG_ECB_ENCRYPT;
+		else
+			return SE_CRYPTO_CFG_ECB_DECRYPT;
+	case SE_ALG_XTS:
+		if (encrypt)
+			return SE_CRYPTO_CFG_XTS_ENCRYPT;
+		else
+			return SE_CRYPTO_CFG_XTS_DECRYPT;
+
+	case SE_ALG_CTR:
+		return SE_CRYPTO_CFG_CTR;
+	case SE_ALG_OFB:
+		return SE_CRYPTO_CFG_OFB;
+	case SE_ALG_CBC_MAC:
+		return SE_CRYPTO_CFG_CBC_MAC;
+
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
+static int tegra234_aes_cfg(u32 alg, bool encrypt)
+{
+	switch (alg) {
+	case SE_ALG_CBC:
+	case SE_ALG_ECB:
+	case SE_ALG_XTS:
+	case SE_ALG_CTR:
+	case SE_ALG_OFB:
+		if (encrypt)
+			return SE_CFG_AES_ENCRYPT;
+		else
+			return SE_CFG_AES_DECRYPT;
+
+	case SE_ALG_GMAC:
+		if (encrypt)
+			return SE_CFG_GMAC_ENCRYPT;
+		else
+			return SE_CFG_GMAC_DECRYPT;
+
+	case SE_ALG_GCM:
+		if (encrypt)
+			return SE_CFG_GCM_ENCRYPT;
+		else
+			return SE_CFG_GCM_DECRYPT;
+
+	case SE_ALG_GCM_FINAL:
+		if (encrypt)
+			return SE_CFG_GCM_FINAL_ENCRYPT;
+		else
+			return SE_CFG_GCM_FINAL_DECRYPT;
+
+	case SE_ALG_CMAC:
+		return SE_CFG_CMAC;
+
+	case SE_ALG_CBC_MAC:
+		return SE_AES_ENC_ALG_AES_ENC |
+		       SE_AES_DST_HASH_REG;
+	}
+	return -EINVAL;
+}
+
+static unsigned int tegra_aes_prep_cmd(struct tegra_aes_ctx *ctx,
+				       struct tegra_aes_reqctx *rctx)
+{
+	unsigned int data_count, res_bits, i = 0, j;
+	struct tegra_se *se = ctx->se;
+	u32 *cpuvaddr = se->cmdbuf->addr;
+	dma_addr_t addr = rctx->datbuf.addr;
+
+	data_count = rctx->len / AES_BLOCK_SIZE;
+	res_bits = (rctx->len % AES_BLOCK_SIZE) * 8;
+
+	/*
+	 * Hardware processes data_count + 1 blocks.
+	 * Reduce 1 block if there is no residue
+	 */
+	if (!res_bits)
+		data_count--;
+
+	if (rctx->iv) {
+		cpuvaddr[i++] = host1x_opcode_setpayload(SE_CRYPTO_CTR_REG_COUNT);
+		cpuvaddr[i++] = se_host1x_opcode_incr_w(se->hw->regs->linear_ctr);
+		for (j = 0; j < SE_CRYPTO_CTR_REG_COUNT; j++)
+			cpuvaddr[i++] = rctx->iv[j];
+	}
+
+	cpuvaddr[i++] = se_host1x_opcode_nonincr(se->hw->regs->last_blk, 1);
+	cpuvaddr[i++] = SE_LAST_BLOCK_VAL(data_count) |
+			SE_LAST_BLOCK_RES_BITS(res_bits);
+
+	cpuvaddr[i++] = se_host1x_opcode_incr(se->hw->regs->config, 6);
+	cpuvaddr[i++] = rctx->config;
+	cpuvaddr[i++] = rctx->crypto_config;
+
+	/* Source address setting */
+	cpuvaddr[i++] = lower_32_bits(addr);
+	cpuvaddr[i++] = SE_ADDR_HI_MSB(upper_32_bits(addr)) | SE_ADDR_HI_SZ(rctx->len);
+
+	/* Destination address setting */
+	cpuvaddr[i++] = lower_32_bits(addr);
+	cpuvaddr[i++] = SE_ADDR_HI_MSB(upper_32_bits(addr)) |
+			SE_ADDR_HI_SZ(rctx->len);
+
+	cpuvaddr[i++] = se_host1x_opcode_nonincr(se->hw->regs->op, 1);
+	cpuvaddr[i++] = SE_AES_OP_WRSTALL | SE_AES_OP_LASTBUF |
+			SE_AES_OP_START;
+
+	cpuvaddr[i++] = se_host1x_opcode_nonincr(host1x_uclass_incr_syncpt_r(), 1);
+	cpuvaddr[i++] = host1x_uclass_incr_syncpt_cond_f(1) |
+			host1x_uclass_incr_syncpt_indx_f(se->syncpt_id);
+
+	dev_dbg(se->dev, "cfg %#x crypto cfg %#x\n", rctx->config, rctx->crypto_config);
+
+	return i;
+}
+
+static int tegra_aes_do_one_req(struct crypto_engine *engine, void *areq)
+{
+	struct skcipher_request *req = container_of(areq, struct skcipher_request, base);
+	struct tegra_aes_ctx *ctx = crypto_skcipher_ctx(crypto_skcipher_reqtfm(req));
+	struct tegra_aes_reqctx *rctx = skcipher_request_ctx(req);
+	struct tegra_se *se = ctx->se;
+	unsigned int cmdlen;
+	int ret;
+
+	rctx->datbuf.buf = dma_alloc_coherent(se->dev, SE_AES_BUFLEN,
+					      &rctx->datbuf.addr, GFP_KERNEL);
+	if (!rctx->datbuf.buf)
+		return -ENOMEM;
+
+	rctx->datbuf.size = SE_AES_BUFLEN;
+	rctx->iv = (u32 *)req->iv;
+	rctx->len = req->cryptlen;
+
+	/* Pad input to AES Block size */
+	if (ctx->alg != SE_ALG_XTS) {
+		if (rctx->len % AES_BLOCK_SIZE)
+			rctx->len += AES_BLOCK_SIZE - (rctx->len % AES_BLOCK_SIZE);
+	}
+
+	scatterwalk_map_and_copy(rctx->datbuf.buf, req->src, 0, req->cryptlen, 0);
+
+	/* Prepare the command and submit for execution */
+	cmdlen = tegra_aes_prep_cmd(ctx, rctx);
+	ret = tegra_se_host1x_submit(se, cmdlen);
+
+	/* Copy the result */
+	tegra_aes_update_iv(req, ctx);
+	scatterwalk_map_and_copy(rctx->datbuf.buf, req->dst, 0, req->cryptlen, 1);
+
+	/* Free the buffer */
+	dma_free_coherent(ctx->se->dev, SE_AES_BUFLEN,
+			  rctx->datbuf.buf, rctx->datbuf.addr);
+
+	crypto_finalize_skcipher_request(se->engine, req, ret);
+
+	return 0;
+}
+
+static int tegra_aes_cra_init(struct crypto_skcipher *tfm)
+{
+	struct tegra_aes_ctx *ctx = crypto_skcipher_ctx(tfm);
+	struct skcipher_alg *alg = crypto_skcipher_alg(tfm);
+	struct tegra_se_alg *se_alg;
+	const char *algname;
+	int ret;
+
+	se_alg = container_of(alg, struct tegra_se_alg, alg.skcipher.base);
+
+	crypto_skcipher_set_reqsize(tfm, sizeof(struct tegra_aes_reqctx));
+
+	ctx->ivsize = crypto_skcipher_ivsize(tfm);
+	ctx->se = se_alg->se_dev;
+	ctx->key1_id = 0;
+	ctx->key2_id = 0;
+
+	algname = crypto_tfm_alg_name(&tfm->base);
+	ret = se_algname_to_algid(algname);
+	if (ret < 0) {
+		dev_err(ctx->se->dev, "invalid algorithm\n");
+		return ret;
+	}
+
+	ctx->alg = ret;
+
+	return 0;
+}
+
+static void tegra_aes_cra_exit(struct crypto_skcipher *tfm)
+{
+	struct tegra_aes_ctx *ctx = crypto_tfm_ctx(&tfm->base);
+
+	if (ctx->key1_id)
+		tegra_key_invalidate(ctx->se, ctx->key1_id, ctx->alg);
+
+	if (ctx->key2_id)
+		tegra_key_invalidate(ctx->se, ctx->key2_id, ctx->alg);
+}
+
+static int tegra_aes_setkey(struct crypto_skcipher *tfm,
+			    const u8 *key, u32 keylen)
+{
+	struct tegra_aes_ctx *ctx = crypto_skcipher_ctx(tfm);
+
+	if (aes_check_keylen(keylen)) {
+		dev_dbg(ctx->se->dev, "invalid key length (%d)\n", keylen);
+		return -EINVAL;
+	}
+
+	return tegra_key_submit(ctx->se, key, keylen, ctx->alg, &ctx->key1_id);
+}
+
+static int tegra_xts_setkey(struct crypto_skcipher *tfm,
+			    const u8 *key, u32 keylen)
+{
+	struct tegra_aes_ctx *ctx = crypto_skcipher_ctx(tfm);
+	u32 len = keylen / 2;
+	int ret;
+
+	ret = xts_verify_key(tfm, key, keylen);
+	if (ret || aes_check_keylen(len)) {
+		dev_dbg(ctx->se->dev, "invalid key length (%d)\n", keylen);
+		return -EINVAL;
+	}
+
+	ret = tegra_key_submit(ctx->se, key, len,
+			       ctx->alg, &ctx->key1_id);
+	if (ret)
+		return ret;
+
+	return tegra_key_submit(ctx->se, key + len, len,
+			       ctx->alg, &ctx->key2_id);
+
+	return 0;
+}
+
+static int tegra_aes_kac_manifest(u32 user, u32 alg, u32 keylen)
+{
+	int manifest;
+
+	manifest = SE_KAC_USER_NS;
+
+	switch (alg) {
+	case SE_ALG_CBC:
+	case SE_ALG_ECB:
+	case SE_ALG_CTR:
+	case SE_ALG_OFB:
+		manifest |= SE_KAC_ENC;
+		break;
+	case SE_ALG_XTS:
+		manifest |= SE_KAC_XTS;
+		break;
+	case SE_ALG_GCM:
+		manifest |= SE_KAC_GCM;
+		break;
+	case SE_ALG_CMAC:
+		manifest |= SE_KAC_CMAC;
+		break;
+	case SE_ALG_CBC_MAC:
+		manifest |= SE_KAC_ENC;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (keylen) {
+	case AES_KEYSIZE_128:
+		manifest |= SE_KAC_SIZE_128;
+		break;
+	case AES_KEYSIZE_192:
+		manifest |= SE_KAC_SIZE_192;
+		break;
+	case AES_KEYSIZE_256:
+		manifest |= SE_KAC_SIZE_256;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return manifest;
+}
+
+static int tegra_aes_crypt(struct skcipher_request *req, bool encrypt)
+
+{
+	struct crypto_skcipher *tfm;
+	struct tegra_aes_ctx *ctx;
+	struct tegra_aes_reqctx *rctx;
+
+	tfm = crypto_skcipher_reqtfm(req);
+	ctx  = crypto_skcipher_ctx(tfm);
+	rctx = skcipher_request_ctx(req);
+
+	if (ctx->alg != SE_ALG_XTS) {
+		if (!IS_ALIGNED(req->cryptlen, crypto_skcipher_blocksize(tfm))) {
+			dev_dbg(ctx->se->dev, "invalid length (%d)", req->cryptlen);
+			return -EINVAL;
+		}
+	} else if (req->cryptlen < XTS_BLOCK_SIZE) {
+		dev_dbg(ctx->se->dev, "invalid length (%d)", req->cryptlen);
+		return -EINVAL;
+	}
+
+	if (!req->cryptlen)
+		return 0;
+
+	rctx->encrypt = encrypt;
+	rctx->config = tegra234_aes_cfg(ctx->alg, encrypt);
+	rctx->crypto_config = tegra234_aes_crypto_cfg(ctx->alg, encrypt);
+	rctx->crypto_config |= SE_AES_KEY_INDEX(ctx->key1_id);
+
+	if (ctx->key2_id)
+		rctx->crypto_config |= SE_AES_KEY2_INDEX(ctx->key2_id);
+
+	return crypto_transfer_skcipher_request_to_engine(ctx->se->engine, req);
+}
+
+static int tegra_aes_encrypt(struct skcipher_request *req)
+{
+	return tegra_aes_crypt(req, true);
+}
+
+static int tegra_aes_decrypt(struct skcipher_request *req)
+{
+	return tegra_aes_crypt(req, false);
+}
+
+static struct tegra_se_alg tegra_aes_algs[] = {
+	{
+		.alg.skcipher.op.do_one_request	= tegra_aes_do_one_req,
+		.alg.skcipher.base = {
+			.init = tegra_aes_cra_init,
+			.exit = tegra_aes_cra_exit,
+			.setkey	= tegra_aes_setkey,
+			.encrypt = tegra_aes_encrypt,
+			.decrypt = tegra_aes_decrypt,
+			.min_keysize = AES_MIN_KEY_SIZE,
+			.max_keysize = AES_MAX_KEY_SIZE,
+			.ivsize	= AES_BLOCK_SIZE,
+			.base = {
+				.cra_name = "cbc(aes)",
+				.cra_driver_name = "cbc-aes-tegra",
+				.cra_priority = 500,
+				.cra_flags = CRYPTO_ALG_TYPE_SKCIPHER | CRYPTO_ALG_ASYNC,
+				.cra_blocksize = AES_BLOCK_SIZE,
+				.cra_ctxsize = sizeof(struct tegra_aes_ctx),
+				.cra_alignmask = 0xf,
+				.cra_module = THIS_MODULE,
+			},
+		}
+	}, {
+		.alg.skcipher.op.do_one_request	= tegra_aes_do_one_req,
+		.alg.skcipher.base = {
+			.init = tegra_aes_cra_init,
+			.exit = tegra_aes_cra_exit,
+			.setkey	= tegra_aes_setkey,
+			.encrypt = tegra_aes_encrypt,
+			.decrypt = tegra_aes_decrypt,
+			.min_keysize = AES_MIN_KEY_SIZE,
+			.max_keysize = AES_MAX_KEY_SIZE,
+			.base = {
+				.cra_name = "ecb(aes)",
+				.cra_driver_name = "ecb-aes-tegra",
+				.cra_priority = 500,
+				.cra_flags = CRYPTO_ALG_TYPE_SKCIPHER | CRYPTO_ALG_ASYNC,
+				.cra_blocksize = AES_BLOCK_SIZE,
+				.cra_ctxsize = sizeof(struct tegra_aes_ctx),
+				.cra_alignmask = 0xf,
+				.cra_module = THIS_MODULE,
+			},
+		}
+	}, {
+		.alg.skcipher.op.do_one_request	= tegra_aes_do_one_req,
+		.alg.skcipher.base = {
+			.init = tegra_aes_cra_init,
+			.exit = tegra_aes_cra_exit,
+			.setkey = tegra_aes_setkey,
+			.encrypt = tegra_aes_encrypt,
+			.decrypt = tegra_aes_decrypt,
+			.min_keysize = AES_MIN_KEY_SIZE,
+			.max_keysize = AES_MAX_KEY_SIZE,
+			.ivsize	= AES_BLOCK_SIZE,
+			.base = {
+				.cra_name = "ctr(aes)",
+				.cra_driver_name = "ctr-aes-tegra",
+				.cra_priority = 500,
+				.cra_flags = CRYPTO_ALG_TYPE_SKCIPHER | CRYPTO_ALG_ASYNC,
+				.cra_blocksize = 1,
+				.cra_ctxsize = sizeof(struct tegra_aes_ctx),
+				.cra_alignmask = 0xf,
+				.cra_module = THIS_MODULE,
+			},
+		}
+	}, {
+		.alg.skcipher.op.do_one_request	= tegra_aes_do_one_req,
+		.alg.skcipher.base = {
+			.init = tegra_aes_cra_init,
+			.exit = tegra_aes_cra_exit,
+			.setkey = tegra_aes_setkey,
+			.encrypt = tegra_aes_encrypt,
+			.decrypt = tegra_aes_decrypt,
+			.min_keysize = AES_MIN_KEY_SIZE,
+			.max_keysize = AES_MAX_KEY_SIZE,
+			.ivsize	= AES_BLOCK_SIZE,
+			.base = {
+				.cra_name = "ofb(aes)",
+				.cra_driver_name = "ofb-aes-tegra",
+				.cra_priority = 500,
+				.cra_flags = CRYPTO_ALG_TYPE_SKCIPHER | CRYPTO_ALG_ASYNC,
+				.cra_blocksize = AES_BLOCK_SIZE,
+				.cra_ctxsize = sizeof(struct tegra_aes_ctx),
+				.cra_alignmask = 0xf,
+				.cra_module = THIS_MODULE,
+			},
+		}
+	}, {
+		.alg.skcipher.op.do_one_request	= tegra_aes_do_one_req,
+		.alg.skcipher.base = {
+			.init = tegra_aes_cra_init,
+			.exit = tegra_aes_cra_exit,
+			.setkey	= tegra_xts_setkey,
+			.encrypt = tegra_aes_encrypt,
+			.decrypt = tegra_aes_decrypt,
+			.min_keysize = 2 * AES_MIN_KEY_SIZE,
+			.max_keysize = 2 * AES_MAX_KEY_SIZE,
+			.ivsize	= AES_BLOCK_SIZE,
+			.base = {
+				.cra_name = "xts(aes)",
+				.cra_driver_name = "xts-aes-tegra",
+				.cra_priority = 500,
+				.cra_blocksize = AES_BLOCK_SIZE,
+				.cra_ctxsize	   = sizeof(struct tegra_aes_ctx),
+				.cra_alignmask	   = (__alignof__(u64) - 1),
+				.cra_module	   = THIS_MODULE,
+			},
+		}
+	},
+};
+
+static unsigned int tegra_gmac_prep_cmd(struct tegra_aead_ctx *ctx,
+					struct tegra_aead_reqctx *rctx)
+{
+	unsigned int data_count, res_bits, i = 0;
+	struct tegra_se *se = ctx->se;
+	u32 *cpuvaddr = se->cmdbuf->addr;
+
+	data_count = (rctx->assoclen / AES_BLOCK_SIZE);
+	res_bits = (rctx->assoclen % AES_BLOCK_SIZE) * 8;
+
+	/*
+	 * Hardware processes data_count + 1 blocks.
+	 * Reduce 1 block if there is no residue
+	 */
+	if (!res_bits)
+		data_count--;
+
+	cpuvaddr[i++] = se_host1x_opcode_nonincr(se->hw->regs->last_blk, 1);
+	cpuvaddr[i++] = SE_LAST_BLOCK_VAL(data_count) |
+			SE_LAST_BLOCK_RES_BITS(res_bits);
+
+	cpuvaddr[i++] = se_host1x_opcode_incr(se->hw->regs->config, 4);
+	cpuvaddr[i++] = rctx->config;
+	cpuvaddr[i++] = rctx->crypto_config;
+	cpuvaddr[i++] = lower_32_bits(rctx->inbuf.addr);
+	cpuvaddr[i++] = SE_ADDR_HI_MSB(upper_32_bits(rctx->inbuf.addr)) |
+			SE_ADDR_HI_SZ(rctx->assoclen);
+
+	cpuvaddr[i++] = se_host1x_opcode_nonincr(se->hw->regs->op, 1);
+	cpuvaddr[i++] = SE_AES_OP_WRSTALL | SE_AES_OP_FINAL |
+			SE_AES_OP_INIT | SE_AES_OP_LASTBUF |
+			SE_AES_OP_START;
+
+	cpuvaddr[i++] = se_host1x_opcode_nonincr(host1x_uclass_incr_syncpt_r(), 1);
+	cpuvaddr[i++] = host1x_uclass_incr_syncpt_cond_f(1) |
+			host1x_uclass_incr_syncpt_indx_f(se->syncpt_id);
+
+	return i;
+}
+
+static unsigned int tegra_gcm_crypt_prep_cmd(struct tegra_aead_ctx *ctx,
+					     struct tegra_aead_reqctx *rctx)
+{
+	unsigned int data_count, res_bits, i = 0, j;
+	struct tegra_se *se = ctx->se;
+	u32 *cpuvaddr = se->cmdbuf->addr, op;
+
+	data_count = (rctx->cryptlen / AES_BLOCK_SIZE);
+	res_bits = (rctx->cryptlen % AES_BLOCK_SIZE) * 8;
+	op = SE_AES_OP_WRSTALL | SE_AES_OP_FINAL |
+	     SE_AES_OP_LASTBUF | SE_AES_OP_START;
+
+	/*
+	 * If there is no assoc data,
+	 * this will be the init command
+	 */
+	if (!rctx->assoclen)
+		op |= SE_AES_OP_INIT;
+
+	/*
+	 * Hardware processes data_count + 1 blocks.
+	 * Reduce 1 block if there is no residue
+	 */
+	if (!res_bits)
+		data_count--;
+
+	cpuvaddr[i++] = host1x_opcode_setpayload(SE_CRYPTO_CTR_REG_COUNT);
+	cpuvaddr[i++] = se_host1x_opcode_incr_w(se->hw->regs->linear_ctr);
+	for (j = 0; j < SE_CRYPTO_CTR_REG_COUNT; j++)
+		cpuvaddr[i++] = rctx->iv[j];
+
+	cpuvaddr[i++] = se_host1x_opcode_nonincr(se->hw->regs->last_blk, 1);
+	cpuvaddr[i++] = SE_LAST_BLOCK_VAL(data_count) |
+			SE_LAST_BLOCK_RES_BITS(res_bits);
+
+	cpuvaddr[i++] = se_host1x_opcode_incr(se->hw->regs->config, 6);
+	cpuvaddr[i++] = rctx->config;
+	cpuvaddr[i++] = rctx->crypto_config;
+
+	/* Source Address */
+	cpuvaddr[i++] = lower_32_bits(rctx->inbuf.addr);
+	cpuvaddr[i++] = SE_ADDR_HI_MSB(upper_32_bits(rctx->inbuf.addr)) |
+			SE_ADDR_HI_SZ(rctx->cryptlen);
+
+	/* Destination Address */
+	cpuvaddr[i++] = lower_32_bits(rctx->outbuf.addr);
+	cpuvaddr[i++] = SE_ADDR_HI_MSB(upper_32_bits(rctx->outbuf.addr)) |
+			SE_ADDR_HI_SZ(rctx->cryptlen);
+
+	cpuvaddr[i++] = se_host1x_opcode_nonincr(se->hw->regs->op, 1);
+	cpuvaddr[i++] = op;
+
+	cpuvaddr[i++] = se_host1x_opcode_nonincr(host1x_uclass_incr_syncpt_r(), 1);
+	cpuvaddr[i++] = host1x_uclass_incr_syncpt_cond_f(1) |
+			host1x_uclass_incr_syncpt_indx_f(se->syncpt_id);
+
+	dev_dbg(se->dev, "cfg %#x crypto cfg %#x\n", rctx->config, rctx->crypto_config);
+	return i;
+}
+
+static int tegra_gcm_prep_final_cmd(struct tegra_se *se, u32 *cpuvaddr,
+				    struct tegra_aead_reqctx *rctx)
+{
+	unsigned int i = 0, j;
+	u32 op;
+
+	op = SE_AES_OP_WRSTALL | SE_AES_OP_FINAL |
+	     SE_AES_OP_LASTBUF | SE_AES_OP_START;
+
+	/*
+	 * Set init for zero sized vector
+	 */
+	if (!rctx->assoclen && !rctx->cryptlen)
+		op |= SE_AES_OP_INIT;
+
+	cpuvaddr[i++] = se_host1x_opcode_incr(se->hw->regs->aad_len, 2);
+	cpuvaddr[i++] = rctx->assoclen * 8;
+	cpuvaddr[i++] = 0;
+
+	cpuvaddr[i++] = se_host1x_opcode_incr(se->hw->regs->cryp_msg_len, 2);
+	cpuvaddr[i++] = rctx->cryptlen * 8;
+	cpuvaddr[i++] = 0;
+
+	cpuvaddr[i++] = host1x_opcode_setpayload(SE_CRYPTO_CTR_REG_COUNT);
+	cpuvaddr[i++] = se_host1x_opcode_incr_w(se->hw->regs->linear_ctr);
+	for (j = 0; j < SE_CRYPTO_CTR_REG_COUNT; j++)
+		cpuvaddr[i++] = rctx->iv[j];
+
+	cpuvaddr[i++] = se_host1x_opcode_incr(se->hw->regs->config, 6);
+	cpuvaddr[i++] = rctx->config;
+	cpuvaddr[i++] = rctx->crypto_config;
+	cpuvaddr[i++] = 0;
+	cpuvaddr[i++] = 0;
+
+	/* Destination Address */
+	cpuvaddr[i++] = lower_32_bits(rctx->outbuf.addr);
+	cpuvaddr[i++] = SE_ADDR_HI_MSB(upper_32_bits(rctx->outbuf.addr)) |
+			SE_ADDR_HI_SZ(0x10); /* HW always generates 128-bit tag */
+
+	cpuvaddr[i++] = se_host1x_opcode_nonincr(se->hw->regs->op, 1);
+	cpuvaddr[i++] = op;
+
+	cpuvaddr[i++] = se_host1x_opcode_nonincr(host1x_uclass_incr_syncpt_r(), 1);
+	cpuvaddr[i++] = host1x_uclass_incr_syncpt_cond_f(1) |
+			host1x_uclass_incr_syncpt_indx_f(se->syncpt_id);
+
+	dev_dbg(se->dev, "cfg %#x crypto cfg %#x\n", rctx->config, rctx->crypto_config);
+
+	return i;
+}
+
+static int tegra_gcm_do_gmac(struct tegra_aead_ctx *ctx, struct tegra_aead_reqctx *rctx)
+{
+	struct tegra_se *se = ctx->se;
+	unsigned int cmdlen;
+
+	scatterwalk_map_and_copy(rctx->inbuf.buf,
+				 rctx->src_sg, 0, rctx->assoclen, 0);
+
+	rctx->config = tegra234_aes_cfg(SE_ALG_GMAC, rctx->encrypt);
+	rctx->crypto_config = tegra234_aes_crypto_cfg(SE_ALG_GMAC, rctx->encrypt) |
+			      SE_AES_KEY_INDEX(ctx->key_id);
+
+	cmdlen = tegra_gmac_prep_cmd(ctx, rctx);
+
+	return tegra_se_host1x_submit(se, cmdlen);
+}
+
+static int tegra_gcm_do_crypt(struct tegra_aead_ctx *ctx, struct tegra_aead_reqctx *rctx)
+{
+	struct tegra_se *se = ctx->se;
+	int cmdlen, ret;
+
+	scatterwalk_map_and_copy(rctx->inbuf.buf, rctx->src_sg,
+				 rctx->assoclen, rctx->cryptlen, 0);
+
+	rctx->config = tegra234_aes_cfg(SE_ALG_GCM, rctx->encrypt);
+	rctx->crypto_config = tegra234_aes_crypto_cfg(SE_ALG_GCM, rctx->encrypt) |
+			      SE_AES_KEY_INDEX(ctx->key_id);
+
+	/* Prepare command and submit */
+	cmdlen = tegra_gcm_crypt_prep_cmd(ctx, rctx);
+	ret = tegra_se_host1x_submit(se, cmdlen);
+	if (ret)
+		return ret;
+
+	/* Copy the result */
+	scatterwalk_map_and_copy(rctx->outbuf.buf, rctx->dst_sg,
+				 rctx->assoclen, rctx->cryptlen, 1);
+
+	return 0;
+}
+
+static int tegra_gcm_do_final(struct tegra_aead_ctx *ctx, struct tegra_aead_reqctx *rctx)
+{
+	struct tegra_se *se = ctx->se;
+	u32 *cpuvaddr = se->cmdbuf->addr;
+	int cmdlen, ret, offset;
+
+	rctx->config = tegra234_aes_cfg(SE_ALG_GCM_FINAL, rctx->encrypt);
+	rctx->crypto_config = tegra234_aes_crypto_cfg(SE_ALG_GCM_FINAL, rctx->encrypt) |
+			      SE_AES_KEY_INDEX(ctx->key_id);
+
+	/* Prepare command and submit */
+	cmdlen = tegra_gcm_prep_final_cmd(se, cpuvaddr, rctx);
+	ret = tegra_se_host1x_submit(se, cmdlen);
+	if (ret)
+		return ret;
+
+	if (rctx->encrypt) {
+		/* Copy the result */
+		offset = rctx->assoclen + rctx->cryptlen;
+		scatterwalk_map_and_copy(rctx->outbuf.buf, rctx->dst_sg,
+					 offset, rctx->authsize, 1);
+	}
+
+	return 0;
+}
+
+static int tegra_gcm_do_verify(struct tegra_se *se, struct tegra_aead_reqctx *rctx)
+{
+	unsigned int offset;
+	u8 mac[16];
+
+	offset = rctx->assoclen + rctx->cryptlen;
+	scatterwalk_map_and_copy(mac, rctx->src_sg, offset, rctx->authsize, 0);
+
+	if (crypto_memneq(rctx->outbuf.buf, mac, rctx->authsize))
+		return -EBADMSG;
+
+	return 0;
+}
+
+static inline int tegra_ccm_check_iv(const u8 *iv)
+{
+	/* iv[0] gives value of q-1
+	 * 2 <= q <= 8 as per NIST 800-38C notation
+	 * 2 <= L <= 8, so 1 <= L' <= 7. as per rfc 3610 notation
+	 */
+	if (iv[0] < 1 || iv[0] > 7) {
+		pr_debug("ccm_check_iv failed %d\n", iv[0]);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static unsigned int tegra_cbcmac_prep_cmd(struct tegra_aead_ctx *ctx,
+					  struct tegra_aead_reqctx *rctx)
+{
+	unsigned int data_count, i = 0;
+	struct tegra_se *se = ctx->se;
+	u32 *cpuvaddr = se->cmdbuf->addr;
+
+	data_count = (rctx->inbuf.size / AES_BLOCK_SIZE) - 1;
+
+	cpuvaddr[i++] = se_host1x_opcode_nonincr(se->hw->regs->last_blk, 1);
+	cpuvaddr[i++] = SE_LAST_BLOCK_VAL(data_count);
+
+	cpuvaddr[i++] = se_host1x_opcode_incr(se->hw->regs->config, 6);
+	cpuvaddr[i++] = rctx->config;
+	cpuvaddr[i++] = rctx->crypto_config;
+
+	cpuvaddr[i++] = lower_32_bits(rctx->inbuf.addr);
+	cpuvaddr[i++] = SE_ADDR_HI_MSB(upper_32_bits(rctx->inbuf.addr)) |
+			SE_ADDR_HI_SZ(rctx->inbuf.size);
+
+	cpuvaddr[i++] = lower_32_bits(rctx->outbuf.addr);
+	cpuvaddr[i++] = SE_ADDR_HI_MSB(upper_32_bits(rctx->outbuf.addr)) |
+			SE_ADDR_HI_SZ(0x10); /* HW always generates 128 bit tag */
+
+	cpuvaddr[i++] = se_host1x_opcode_nonincr(se->hw->regs->op, 1);
+	cpuvaddr[i++] = SE_AES_OP_WRSTALL |
+			SE_AES_OP_LASTBUF | SE_AES_OP_START;
+
+	cpuvaddr[i++] = se_host1x_opcode_nonincr(host1x_uclass_incr_syncpt_r(), 1);
+	cpuvaddr[i++] = host1x_uclass_incr_syncpt_cond_f(1) |
+			host1x_uclass_incr_syncpt_indx_f(se->syncpt_id);
+
+	return i;
+}
+
+static unsigned int tegra_ctr_prep_cmd(struct tegra_aead_ctx *ctx,
+				       struct tegra_aead_reqctx *rctx)
+{
+	unsigned int i = 0, j;
+	struct tegra_se *se = ctx->se;
+	u32 *cpuvaddr = se->cmdbuf->addr;
+
+	cpuvaddr[i++] = host1x_opcode_setpayload(SE_CRYPTO_CTR_REG_COUNT);
+	cpuvaddr[i++] = se_host1x_opcode_incr_w(se->hw->regs->linear_ctr);
+	for (j = 0; j < SE_CRYPTO_CTR_REG_COUNT; j++)
+		cpuvaddr[i++] = rctx->iv[j];
+
+	cpuvaddr[i++] = se_host1x_opcode_nonincr(se->hw->regs->last_blk, 1);
+	cpuvaddr[i++] = (rctx->inbuf.size / AES_BLOCK_SIZE) - 1;
+	cpuvaddr[i++] = se_host1x_opcode_incr(se->hw->regs->config, 6);
+	cpuvaddr[i++] = rctx->config;
+	cpuvaddr[i++] = rctx->crypto_config;
+
+	/* Source address setting */
+	cpuvaddr[i++] = lower_32_bits(rctx->inbuf.addr);
+	cpuvaddr[i++] = SE_ADDR_HI_MSB(upper_32_bits(rctx->inbuf.addr)) |
+			SE_ADDR_HI_SZ(rctx->inbuf.size);
+
+	/* Destination address setting */
+	cpuvaddr[i++] = lower_32_bits(rctx->outbuf.addr);
+	cpuvaddr[i++] = SE_ADDR_HI_MSB(upper_32_bits(rctx->outbuf.addr)) |
+			SE_ADDR_HI_SZ(rctx->inbuf.size);
+
+	cpuvaddr[i++] = se_host1x_opcode_nonincr(se->hw->regs->op, 1);
+	cpuvaddr[i++] = SE_AES_OP_WRSTALL | SE_AES_OP_LASTBUF |
+			SE_AES_OP_START;
+
+	cpuvaddr[i++] = se_host1x_opcode_nonincr(host1x_uclass_incr_syncpt_r(), 1);
+	cpuvaddr[i++] = host1x_uclass_incr_syncpt_cond_f(1) |
+			host1x_uclass_incr_syncpt_indx_f(se->syncpt_id);
+
+	dev_dbg(se->dev, "cfg %#x crypto cfg %#x\n",
+		rctx->config, rctx->crypto_config);
+
+	return i;
+}
+
+static int tegra_ccm_do_cbcmac(struct tegra_aead_ctx *ctx, struct tegra_aead_reqctx *rctx)
+{
+	struct tegra_se *se = ctx->se;
+	int cmdlen;
+
+	rctx->config = tegra234_aes_cfg(SE_ALG_CBC_MAC, rctx->encrypt);
+	rctx->crypto_config = tegra234_aes_crypto_cfg(SE_ALG_CBC_MAC,
+						      rctx->encrypt) |
+						      SE_AES_KEY_INDEX(ctx->key_id);
+
+	/* Prepare command and submit */
+	cmdlen = tegra_cbcmac_prep_cmd(ctx, rctx);
+
+	return tegra_se_host1x_submit(se, cmdlen);
+}
+
+static int tegra_ccm_set_msg_len(u8 *block, unsigned int msglen, int csize)
+{
+	__be32 data;
+
+	memset(block, 0, csize);
+	block += csize;
+
+	if (csize >= 4)
+		csize = 4;
+	else if (msglen > (1 << (8 * csize)))
+		return -EOVERFLOW;
+
+	data = cpu_to_be32(msglen);
+	memcpy(block - csize, (u8 *)&data + 4 - csize, csize);
+
+	return 0;
+}
+
+static int tegra_ccm_format_nonce(struct tegra_aead_reqctx *rctx, u8 *nonce)
+{
+	unsigned int q, t;
+	u8 *q_ptr, *iv = (u8 *)rctx->iv;
+
+	memcpy(nonce, rctx->iv, 16);
+
+	/*** 1. Prepare Flags Octet ***/
+
+	/* Encode t (mac length) */
+	t = rctx->authsize;
+	nonce[0] |= (((t - 2) / 2) << 3);
+
+	/* Adata */
+	if (rctx->assoclen)
+		nonce[0] |= (1 << 6);
+
+	/*** Encode Q - message length ***/
+	q = iv[0] + 1;
+	q_ptr = nonce + 16 - q;
+
+	return tegra_ccm_set_msg_len(q_ptr, rctx->cryptlen, q);
+}
+
+static int tegra_ccm_format_adata(u8 *adata, unsigned int a)
+{
+	int len = 0;
+
+	/* add control info for associated data
+	 * RFC 3610 and NIST Special Publication 800-38C
+	 */
+	if (a < 65280) {
+		*(__be16 *)adata = cpu_to_be16(a);
+		len = 2;
+	} else	{
+		*(__be16 *)adata = cpu_to_be16(0xfffe);
+		*(__be32 *)&adata[2] = cpu_to_be32(a);
+		len = 6;
+	}
+
+	return len;
+}
+
+static int tegra_ccm_add_padding(u8 *buf, unsigned int len)
+{
+	unsigned int padlen = 16 - (len % 16);
+	u8 padding[16] = {0};
+
+	if (padlen == 16)
+		return 0;
+
+	memcpy(buf, padding, padlen);
+
+	return padlen;
+}
+
+static int tegra_ccm_format_blocks(struct tegra_aead_reqctx *rctx)
+{
+	unsigned int alen = 0, offset = 0;
+	u8 nonce[16], adata[16];
+	int ret;
+
+	ret = tegra_ccm_format_nonce(rctx, nonce);
+	if (ret)
+		return ret;
+
+	memcpy(rctx->inbuf.buf, nonce, 16);
+	offset = 16;
+
+	if (rctx->assoclen) {
+		alen = tegra_ccm_format_adata(adata, rctx->assoclen);
+		memcpy(rctx->inbuf.buf + offset, adata, alen);
+		offset += alen;
+
+		scatterwalk_map_and_copy(rctx->inbuf.buf + offset,
+					 rctx->src_sg, 0, rctx->assoclen, 0);
+
+		offset += rctx->assoclen;
+		offset += tegra_ccm_add_padding(rctx->inbuf.buf + offset,
+					 rctx->assoclen + alen);
+	}
+
+	return offset;
+}
+
+static int tegra_ccm_mac_result(struct tegra_se *se, struct tegra_aead_reqctx *rctx)
+{
+	u32 result[16];
+	int i, ret;
+
+	/* Read and clear Result */
+	for (i = 0; i < CMAC_RESULT_REG_COUNT; i++)
+		result[i] = readl(se->base + se->hw->regs->result + (i * 4));
+
+	for (i = 0; i < CMAC_RESULT_REG_COUNT; i++)
+		writel(0, se->base + se->hw->regs->result + (i * 4));
+
+	if (rctx->encrypt) {
+		memcpy(rctx->authdata, result, rctx->authsize);
+	} else {
+		ret = crypto_memneq(rctx->authdata, result, rctx->authsize);
+		if (ret)
+			return -EBADMSG;
+	}
+
+	return 0;
+}
+
+static int tegra_ccm_ctr_result(struct tegra_se *se, struct tegra_aead_reqctx *rctx)
+{
+	/* Copy result */
+	scatterwalk_map_and_copy(rctx->outbuf.buf + 16, rctx->dst_sg,
+				 rctx->assoclen, rctx->cryptlen, 1);
+
+	if (rctx->encrypt)
+		scatterwalk_map_and_copy(rctx->outbuf.buf, rctx->dst_sg,
+					 rctx->assoclen + rctx->cryptlen,
+					 rctx->authsize, 1);
+	else
+		memcpy(rctx->authdata, rctx->outbuf.buf, rctx->authsize);
+
+	return 0;
+}
+
+static int tegra_ccm_compute_auth(struct tegra_aead_ctx *ctx, struct tegra_aead_reqctx *rctx)
+{
+	struct tegra_se *se = ctx->se;
+	struct scatterlist *sg;
+	int offset, ret;
+
+	offset = tegra_ccm_format_blocks(rctx);
+	if (offset < 0)
+		return -EINVAL;
+
+	/* Copy plain text to the buffer */
+	sg = rctx->encrypt ? rctx->src_sg : rctx->dst_sg;
+
+	scatterwalk_map_and_copy(rctx->inbuf.buf + offset,
+				 sg, rctx->assoclen,
+				 rctx->cryptlen, 0);
+	offset += rctx->cryptlen;
+	offset += tegra_ccm_add_padding(rctx->inbuf.buf + offset, rctx->cryptlen);
+
+	rctx->inbuf.size = offset;
+
+	ret = tegra_ccm_do_cbcmac(ctx, rctx);
+	if (ret)
+		return ret;
+
+	return tegra_ccm_mac_result(se, rctx);
+}
+
+static int tegra_ccm_do_ctr(struct tegra_aead_ctx *ctx, struct tegra_aead_reqctx *rctx)
+{
+	struct tegra_se *se = ctx->se;
+	unsigned int cmdlen, offset = 0;
+	struct scatterlist *sg = rctx->src_sg;
+	int ret;
+
+	rctx->config = tegra234_aes_cfg(SE_ALG_CTR, rctx->encrypt);
+	rctx->crypto_config = tegra234_aes_crypto_cfg(SE_ALG_CTR, rctx->encrypt) |
+			      SE_AES_KEY_INDEX(ctx->key_id);
+
+	/* Copy authdata in the top of buffer for encryption/decryption */
+	if (rctx->encrypt)
+		memcpy(rctx->inbuf.buf, rctx->authdata, rctx->authsize);
+	else
+		scatterwalk_map_and_copy(rctx->inbuf.buf, sg,
+					 rctx->assoclen + rctx->cryptlen,
+					 rctx->authsize, 0);
+
+	offset += rctx->authsize;
+	offset += tegra_ccm_add_padding(rctx->inbuf.buf + offset, rctx->authsize);
+
+	/* If there is no cryptlen, proceed to submit the task */
+	if (rctx->cryptlen) {
+		scatterwalk_map_and_copy(rctx->inbuf.buf + offset, sg,
+					 rctx->assoclen, rctx->cryptlen, 0);
+		offset += rctx->cryptlen;
+		offset += tegra_ccm_add_padding(rctx->inbuf.buf + offset, rctx->cryptlen);
+	}
+
+	rctx->inbuf.size = offset;
+
+	/* Prepare command and submit */
+	cmdlen = tegra_ctr_prep_cmd(ctx, rctx);
+	ret = tegra_se_host1x_submit(se, cmdlen);
+	if (ret)
+		return ret;
+
+	return tegra_ccm_ctr_result(se, rctx);
+}
+
+static int tegra_ccm_crypt_init(struct aead_request *req, struct tegra_se *se,
+				struct tegra_aead_reqctx *rctx)
+{
+	struct crypto_aead *tfm = crypto_aead_reqtfm(req);
+	u8 *iv = (u8 *)rctx->iv;
+	int ret, i;
+
+	rctx->src_sg = req->src;
+	rctx->dst_sg = req->dst;
+	rctx->assoclen = req->assoclen;
+	rctx->authsize = crypto_aead_authsize(tfm);
+
+	memcpy(iv, req->iv, 16);
+
+	ret = tegra_ccm_check_iv(iv);
+	if (ret)
+		return ret;
+
+	/* Note: rfc 3610 and NIST 800-38C require counter (ctr_0) of
+	 * zero to encrypt auth tag.
+	 * req->iv has the formatted ctr_0 (i.e. Flags || N || 0).
+	 */
+	memset(iv + 15 - iv[0], 0, iv[0] + 1);
+
+	/* Clear any previous result */
+	for (i = 0; i < CMAC_RESULT_REG_COUNT; i++)
+		writel(0, se->base + se->hw->regs->result + (i * 4));
+
+	return 0;
+}
+
+static int tegra_ccm_do_one_req(struct crypto_engine *engine, void *areq)
+{
+	struct aead_request *req = container_of(areq, struct aead_request, base);
+	struct tegra_aead_reqctx *rctx = aead_request_ctx(req);
+	struct crypto_aead *tfm = crypto_aead_reqtfm(req);
+	struct tegra_aead_ctx *ctx = crypto_aead_ctx(tfm);
+	struct tegra_se *se = ctx->se;
+	int ret;
+
+	/* Allocate buffers required */
+	rctx->inbuf.buf = dma_alloc_coherent(ctx->se->dev, SE_AES_BUFLEN,
+					     &rctx->inbuf.addr, GFP_KERNEL);
+	if (!rctx->inbuf.buf)
+		return -ENOMEM;
+
+	rctx->inbuf.size = SE_AES_BUFLEN;
+
+	rctx->outbuf.buf = dma_alloc_coherent(ctx->se->dev, SE_AES_BUFLEN,
+					      &rctx->outbuf.addr, GFP_KERNEL);
+	if (!rctx->outbuf.buf) {
+		ret = ENOMEM;
+		goto outbuf_err;
+	}
+
+	rctx->outbuf.size = SE_AES_BUFLEN;
+
+	ret = tegra_ccm_crypt_init(req, se, rctx);
+	if (ret)
+		goto out;
+
+	if (rctx->encrypt) {
+		rctx->cryptlen = req->cryptlen;
+
+		/* CBC MAC Operation */
+		ret = tegra_ccm_compute_auth(ctx, rctx);
+		if (ret)
+			goto out;
+
+		/* CTR operation */
+		ret = tegra_ccm_do_ctr(ctx, rctx);
+		if (ret)
+			goto out;
+	} else {
+		rctx->cryptlen = req->cryptlen - ctx->authsize;
+		if (ret)
+			goto out;
+
+		/* CTR operation */
+		ret = tegra_ccm_do_ctr(ctx, rctx);
+		if (ret)
+			goto out;
+
+		/* CBC MAC Operation */
+		ret = tegra_ccm_compute_auth(ctx, rctx);
+		if (ret)
+			goto out;
+	}
+
+out:
+	dma_free_coherent(ctx->se->dev, SE_AES_BUFLEN,
+			  rctx->outbuf.buf, rctx->outbuf.addr);
+
+outbuf_err:
+	dma_free_coherent(ctx->se->dev, SE_AES_BUFLEN,
+			  rctx->inbuf.buf, rctx->inbuf.addr);
+
+	crypto_finalize_aead_request(ctx->se->engine, req, ret);
+
+	return 0;
+}
+
+static int tegra_gcm_do_one_req(struct crypto_engine *engine, void *areq)
+{
+	struct aead_request *req = container_of(areq, struct aead_request, base);
+	struct crypto_aead *tfm = crypto_aead_reqtfm(req);
+	struct tegra_aead_ctx *ctx = crypto_aead_ctx(tfm);
+	struct tegra_aead_reqctx *rctx = aead_request_ctx(req);
+	int ret;
+
+	/* Allocate buffers required */
+	rctx->inbuf.buf = dma_alloc_coherent(ctx->se->dev, SE_AES_BUFLEN,
+					     &rctx->inbuf.addr, GFP_KERNEL);
+	if (!rctx->inbuf.buf)
+		return -ENOMEM;
+
+	rctx->inbuf.size = SE_AES_BUFLEN;
+
+	rctx->outbuf.buf = dma_alloc_coherent(ctx->se->dev, SE_AES_BUFLEN,
+					      &rctx->outbuf.addr, GFP_KERNEL);
+	if (!rctx->outbuf.buf) {
+		ret = ENOMEM;
+		goto outbuf_err;
+	}
+
+	rctx->outbuf.size = SE_AES_BUFLEN;
+
+	rctx->src_sg = req->src;
+	rctx->dst_sg = req->dst;
+	rctx->assoclen = req->assoclen;
+	rctx->authsize = crypto_aead_authsize(tfm);
+
+	if (rctx->encrypt)
+		rctx->cryptlen = req->cryptlen;
+	else
+		rctx->cryptlen = req->cryptlen - ctx->authsize;
+
+	memcpy(rctx->iv, req->iv, GCM_AES_IV_SIZE);
+	rctx->iv[3] = (1 << 24);
+
+	/* If there is associated data perform GMAC operation */
+	if (rctx->assoclen) {
+		ret = tegra_gcm_do_gmac(ctx, rctx);
+		if (ret)
+			goto out;
+	}
+
+	/* GCM Encryption/Decryption operation */
+	if (rctx->cryptlen) {
+		ret = tegra_gcm_do_crypt(ctx, rctx);
+		if (ret)
+			goto out;
+	}
+
+	/* GCM_FINAL operation */
+	ret = tegra_gcm_do_final(ctx, rctx);
+	if (ret)
+		goto out;
+
+	if (!rctx->encrypt)
+		ret = tegra_gcm_do_verify(ctx->se, rctx);
+
+out:
+	dma_free_coherent(ctx->se->dev, SE_AES_BUFLEN,
+			  rctx->outbuf.buf, rctx->outbuf.addr);
+
+outbuf_err:
+	dma_free_coherent(ctx->se->dev, SE_AES_BUFLEN,
+			  rctx->inbuf.buf, rctx->inbuf.addr);
+
+	/* Finalize the request if there are no errors */
+	crypto_finalize_aead_request(ctx->se->engine, req, ret);
+
+	return 0;
+}
+
+static int tegra_aead_cra_init(struct crypto_aead *tfm)
+{
+	struct tegra_aead_ctx *ctx = crypto_aead_ctx(tfm);
+	struct aead_alg *alg = crypto_aead_alg(tfm);
+	struct tegra_se_alg *se_alg;
+	const char *algname;
+	int ret;
+
+	algname = crypto_tfm_alg_name(&tfm->base);
+
+	se_alg = container_of(alg, struct tegra_se_alg, alg.aead.base);
+
+	crypto_aead_set_reqsize(tfm, sizeof(struct tegra_aead_reqctx));
+
+	ctx->se = se_alg->se_dev;
+	ctx->key_id = 0;
+
+	ret = se_algname_to_algid(algname);
+	if (ret < 0) {
+		dev_err(ctx->se->dev, "invalid algorithm\n");
+		return ret;
+	}
+
+	ctx->alg = ret;
+
+	return 0;
+}
+
+static int tegra_ccm_setauthsize(struct crypto_aead *tfm,  unsigned int authsize)
+{
+	struct tegra_aead_ctx *ctx = crypto_aead_ctx(tfm);
+
+	switch (authsize) {
+	case 4:
+	case 6:
+	case 8:
+	case 10:
+	case 12:
+	case 14:
+	case 16:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	ctx->authsize = authsize;
+
+	return 0;
+}
+
+static int tegra_gcm_setauthsize(struct crypto_aead *tfm,  unsigned int authsize)
+{
+	struct tegra_aead_ctx *ctx = crypto_aead_ctx(tfm);
+	int ret;
+
+	ret = crypto_gcm_check_authsize(authsize);
+	if (ret)
+		return ret;
+
+	ctx->authsize = authsize;
+
+	return 0;
+}
+
+static void tegra_aead_cra_exit(struct crypto_aead *tfm)
+{
+	struct tegra_aead_ctx *ctx = crypto_tfm_ctx(&tfm->base);
+
+	if (ctx->key_id)
+		tegra_key_invalidate(ctx->se, ctx->key_id, ctx->alg);
+}
+
+static int tegra_aead_crypt(struct aead_request *req, bool encrypt)
+{
+	struct crypto_aead *tfm = crypto_aead_reqtfm(req);
+	struct tegra_aead_ctx *ctx = crypto_aead_ctx(tfm);
+	struct tegra_aead_reqctx *rctx = aead_request_ctx(req);
+
+	rctx->encrypt = encrypt;
+
+	return crypto_transfer_aead_request_to_engine(ctx->se->engine, req);
+}
+
+static int tegra_aead_encrypt(struct aead_request *req)
+{
+	return tegra_aead_crypt(req, true);
+}
+
+static int tegra_aead_decrypt(struct aead_request *req)
+{
+	return tegra_aead_crypt(req, false);
+}
+
+static int tegra_aead_setkey(struct crypto_aead *tfm,
+			     const u8 *key, u32 keylen)
+{
+	struct tegra_aead_ctx *ctx = crypto_aead_ctx(tfm);
+
+	if (aes_check_keylen(keylen)) {
+		dev_dbg(ctx->se->dev, "invalid key length (%d)\n", keylen);
+		return -EINVAL;
+	}
+
+	return tegra_key_submit(ctx->se, key, keylen, ctx->alg, &ctx->key_id);
+}
+
+static unsigned int tegra_cmac_prep_cmd(struct tegra_cmac_ctx *ctx,
+					struct tegra_cmac_reqctx *rctx)
+{
+	unsigned int data_count, res_bits = 0, i = 0, j;
+	struct tegra_se *se = ctx->se;
+	u32 *cpuvaddr = se->cmdbuf->addr, op;
+
+	data_count = (rctx->datbuf.size / AES_BLOCK_SIZE);
+
+	op = SE_AES_OP_WRSTALL | SE_AES_OP_START | SE_AES_OP_LASTBUF;
+
+	if (!(rctx->task & SHA_UPDATE)) {
+		op |= SE_AES_OP_FINAL;
+		res_bits = (rctx->datbuf.size % AES_BLOCK_SIZE) * 8;
+	}
+
+	if (!res_bits && data_count)
+		data_count--;
+
+	if (rctx->task & SHA_FIRST) {
+		rctx->task &= ~SHA_FIRST;
+
+		cpuvaddr[i++] = host1x_opcode_setpayload(SE_CRYPTO_CTR_REG_COUNT);
+		cpuvaddr[i++] = se_host1x_opcode_incr_w(se->hw->regs->linear_ctr);
+		/* Load 0 IV */
+		for (j = 0; j < SE_CRYPTO_CTR_REG_COUNT; j++)
+			cpuvaddr[i++] = 0;
+	}
+
+	cpuvaddr[i++] = se_host1x_opcode_nonincr(se->hw->regs->last_blk, 1);
+	cpuvaddr[i++] = SE_LAST_BLOCK_VAL(data_count) |
+			SE_LAST_BLOCK_RES_BITS(res_bits);
+
+	cpuvaddr[i++] = se_host1x_opcode_incr(se->hw->regs->config, 6);
+	cpuvaddr[i++] = rctx->config;
+	cpuvaddr[i++] = rctx->crypto_config;
+
+	/* Source Address */
+	cpuvaddr[i++] = lower_32_bits(rctx->datbuf.addr);
+	cpuvaddr[i++] = SE_ADDR_HI_MSB(upper_32_bits(rctx->datbuf.addr)) |
+			SE_ADDR_HI_SZ(rctx->datbuf.size);
+	cpuvaddr[i++] = 0;
+	cpuvaddr[i++] = SE_ADDR_HI_SZ(AES_BLOCK_SIZE);
+
+	cpuvaddr[i++] = se_host1x_opcode_nonincr(se->hw->regs->op, 1);
+	cpuvaddr[i++] = op;
+
+	cpuvaddr[i++] = se_host1x_opcode_nonincr(host1x_uclass_incr_syncpt_r(), 1);
+	cpuvaddr[i++] = host1x_uclass_incr_syncpt_cond_f(1) |
+			host1x_uclass_incr_syncpt_indx_f(se->syncpt_id);
+
+	return i;
+}
+
+static void tegra_cmac_copy_result(struct tegra_se *se, struct tegra_cmac_reqctx *rctx)
+{
+	int i;
+
+	for (i = 0; i < CMAC_RESULT_REG_COUNT; i++)
+		rctx->result[i] = readl(se->base + se->hw->regs->result + (i * 4));
+}
+
+static void tegra_cmac_paste_result(struct tegra_se *se, struct tegra_cmac_reqctx *rctx)
+{
+	int i;
+
+	for (i = 0; i < CMAC_RESULT_REG_COUNT; i++)
+		writel(rctx->result[i],
+		       se->base + se->hw->regs->result + (i * 4));
+}
+
+static int tegra_cmac_do_update(struct ahash_request *req)
+{
+	struct tegra_cmac_reqctx *rctx = ahash_request_ctx(req);
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+	struct tegra_cmac_ctx *ctx = crypto_ahash_ctx(tfm);
+	struct tegra_se *se = ctx->se;
+	unsigned int nblks, nresidue, cmdlen;
+	int ret;
+
+	if (!req->nbytes)
+		return 0;
+
+	nresidue = (req->nbytes + rctx->residue.size) % rctx->blk_size;
+	nblks = (req->nbytes + rctx->residue.size) / rctx->blk_size;
+
+	/*
+	 * Reserve the last block as residue during final() to process.
+	 */
+	if (!nresidue && nblks) {
+		nresidue += rctx->blk_size;
+		nblks--;
+	}
+
+	rctx->src_sg = req->src;
+	rctx->datbuf.size = (req->nbytes + rctx->residue.size) - nresidue;
+	rctx->total_len += rctx->datbuf.size;
+	rctx->config = tegra234_aes_cfg(SE_ALG_CMAC, 0);
+	rctx->crypto_config = SE_AES_KEY_INDEX(ctx->key_id);
+
+	/*
+	 * Keep one block and residue bytes in residue and
+	 * return. The bytes will be processed in final()
+	 */
+	if (nblks < 1) {
+		scatterwalk_map_and_copy(rctx->residue.buf + rctx->residue.size,
+					 rctx->src_sg, 0, req->nbytes, 0);
+
+		rctx->residue.size += req->nbytes;
+		return 0;
+	}
+
+	/* Copy the previous residue first */
+	if (rctx->residue.size)
+		memcpy(rctx->datbuf.buf, rctx->residue.buf, rctx->residue.size);
+
+	scatterwalk_map_and_copy(rctx->datbuf.buf + rctx->residue.size,
+				 rctx->src_sg, 0, req->nbytes - nresidue, 0);
+
+	scatterwalk_map_and_copy(rctx->residue.buf, rctx->src_sg,
+				 req->nbytes - nresidue, nresidue, 0);
+
+	/* Update residue value with the residue after current block */
+	rctx->residue.size = nresidue;
+
+	/*
+	 * If this is not the first 'update' call, paste the previous copied
+	 * intermediate results to the registers so that it gets picked up.
+	 * This is to support the import/export functionality.
+	 */
+	if (!(rctx->task & SHA_FIRST))
+		tegra_cmac_paste_result(ctx->se, rctx);
+
+	cmdlen = tegra_cmac_prep_cmd(ctx, rctx);
+
+	ret = tegra_se_host1x_submit(se, cmdlen);
+	/*
+	 * If this is not the final update, copy the intermediate results
+	 * from the registers so that it can be used in the next 'update'
+	 * call. This is to support the import/export functionality.
+	 */
+	if (!(rctx->task & SHA_FINAL))
+		tegra_cmac_copy_result(ctx->se, rctx);
+
+	return ret;
+}
+
+static int tegra_cmac_do_final(struct ahash_request *req)
+{
+	struct tegra_cmac_reqctx *rctx = ahash_request_ctx(req);
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+	struct tegra_cmac_ctx *ctx = crypto_ahash_ctx(tfm);
+	struct tegra_se *se = ctx->se;
+	u32 *result = (u32 *)req->result;
+	int ret = 0, i, cmdlen;
+
+	if (!req->nbytes && !rctx->total_len && ctx->fallback_tfm) {
+		return crypto_shash_tfm_digest(ctx->fallback_tfm,
+					rctx->datbuf.buf, 0, req->result);
+	}
+
+	memcpy(rctx->datbuf.buf, rctx->residue.buf, rctx->residue.size);
+	rctx->datbuf.size = rctx->residue.size;
+	rctx->total_len += rctx->residue.size;
+	rctx->config = tegra234_aes_cfg(SE_ALG_CMAC, 0);
+
+	/* Prepare command and submit */
+	cmdlen = tegra_cmac_prep_cmd(ctx, rctx);
+	ret = tegra_se_host1x_submit(se, cmdlen);
+	if (ret)
+		goto out;
+
+	/* Read and clear Result register */
+	for (i = 0; i < CMAC_RESULT_REG_COUNT; i++)
+		result[i] = readl(se->base + se->hw->regs->result + (i * 4));
+
+	for (i = 0; i < CMAC_RESULT_REG_COUNT; i++)
+		writel(0, se->base + se->hw->regs->result + (i * 4));
+
+out:
+	dma_free_coherent(se->dev, SE_SHA_BUFLEN,
+			  rctx->datbuf.buf, rctx->datbuf.addr);
+	dma_free_coherent(se->dev, crypto_ahash_blocksize(tfm) * 2,
+			  rctx->residue.buf, rctx->residue.addr);
+	return ret;
+}
+
+static int tegra_cmac_do_one_req(struct crypto_engine *engine, void *areq)
+{
+	struct ahash_request *req = ahash_request_cast(areq);
+	struct tegra_cmac_reqctx *rctx = ahash_request_ctx(req);
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+	struct tegra_cmac_ctx *ctx = crypto_ahash_ctx(tfm);
+	struct tegra_se *se = ctx->se;
+	int ret;
+
+	if (rctx->task & SHA_UPDATE) {
+		ret = tegra_cmac_do_update(req);
+		rctx->task &= ~SHA_UPDATE;
+	}
+
+	if (rctx->task & SHA_FINAL) {
+		ret = tegra_cmac_do_final(req);
+		rctx->task &= ~SHA_FINAL;
+	}
+
+	crypto_finalize_hash_request(se->engine, req, ret);
+
+	return 0;
+}
+
+static void tegra_cmac_init_fallback(struct crypto_ahash *tfm, struct tegra_cmac_ctx *ctx,
+				     const char *algname)
+{
+	ctx->fallback_tfm = crypto_alloc_shash(algname, 0, CRYPTO_ALG_NEED_FALLBACK);
+
+	if (IS_ERR(ctx->fallback_tfm))
+		goto err_out;
+
+	if (crypto_shash_statesize(ctx->fallback_tfm) > sizeof(struct tegra_cmac_reqctx))
+		goto free_tfm;
+
+	return;
+
+free_tfm:
+	crypto_free_shash(ctx->fallback_tfm);
+err_out:
+	dev_warn(ctx->se->dev, "failed to allocate fallback for %s\n", algname);
+	ctx->fallback_tfm = NULL;
+}
+
+static int tegra_cmac_cra_init(struct crypto_tfm *tfm)
+{
+	struct tegra_cmac_ctx *ctx = crypto_tfm_ctx(tfm);
+	struct crypto_ahash *ahash_tfm = __crypto_ahash_cast(tfm);
+	struct ahash_alg *alg = __crypto_ahash_alg(tfm->__crt_alg);
+	struct tegra_se_alg *se_alg;
+	const char *algname;
+	int ret;
+
+	algname = crypto_tfm_alg_name(tfm);
+	se_alg = container_of(alg, struct tegra_se_alg, alg.ahash.base);
+
+	crypto_ahash_set_reqsize(ahash_tfm, sizeof(struct tegra_cmac_reqctx));
+
+	ctx->se = se_alg->se_dev;
+	ctx->key_id = 0;
+
+	ret = se_algname_to_algid(algname);
+	if (ret < 0) {
+		dev_err(ctx->se->dev, "invalid algorithm\n");
+		return ret;
+	}
+
+	ctx->alg = ret;
+
+	tegra_cmac_init_fallback(ahash_tfm, ctx, algname);
+
+	return 0;
+}
+
+static void tegra_cmac_cra_exit(struct crypto_tfm *tfm)
+{
+	struct tegra_cmac_ctx *ctx = crypto_tfm_ctx(tfm);
+
+	if (ctx->fallback_tfm)
+		crypto_free_shash(ctx->fallback_tfm);
+
+	tegra_key_invalidate(ctx->se, ctx->key_id, ctx->alg);
+}
+
+static int tegra_cmac_init(struct ahash_request *req)
+{
+	struct tegra_cmac_reqctx *rctx = ahash_request_ctx(req);
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+	struct tegra_cmac_ctx *ctx = crypto_ahash_ctx(tfm);
+	struct tegra_se *se = ctx->se;
+	int i;
+
+	rctx->total_len = 0;
+	rctx->datbuf.size = 0;
+	rctx->residue.size = 0;
+	rctx->task = SHA_FIRST;
+	rctx->blk_size = crypto_ahash_blocksize(tfm);
+
+	rctx->residue.buf = dma_alloc_coherent(se->dev, rctx->blk_size * 2,
+					       &rctx->residue.addr, GFP_KERNEL);
+	if (!rctx->residue.buf)
+		goto resbuf_fail;
+
+	rctx->residue.size = 0;
+
+	rctx->datbuf.buf = dma_alloc_coherent(se->dev, SE_SHA_BUFLEN,
+					      &rctx->datbuf.addr, GFP_KERNEL);
+	if (!rctx->datbuf.buf)
+		goto datbuf_fail;
+
+	rctx->datbuf.size = 0;
+
+	/* Clear any previous result */
+	for (i = 0; i < CMAC_RESULT_REG_COUNT; i++)
+		writel(0, se->base + se->hw->regs->result + (i * 4));
+
+	return 0;
+
+datbuf_fail:
+	dma_free_coherent(se->dev, rctx->blk_size, rctx->residue.buf,
+			  rctx->residue.addr);
+resbuf_fail:
+	return -ENOMEM;
+}
+
+static int tegra_cmac_setkey(struct crypto_ahash *tfm, const u8 *key,
+			     unsigned int keylen)
+{
+	struct tegra_cmac_ctx *ctx = crypto_ahash_ctx(tfm);
+
+	if (aes_check_keylen(keylen)) {
+		dev_dbg(ctx->se->dev, "invalid key length (%d)\n", keylen);
+		return -EINVAL;
+	}
+
+	if (ctx->fallback_tfm)
+		crypto_shash_setkey(ctx->fallback_tfm, key, keylen);
+
+	return tegra_key_submit(ctx->se, key, keylen, ctx->alg, &ctx->key_id);
+}
+
+static int tegra_cmac_update(struct ahash_request *req)
+{
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+	struct tegra_cmac_ctx *ctx = crypto_ahash_ctx(tfm);
+	struct tegra_cmac_reqctx *rctx = ahash_request_ctx(req);
+
+	rctx->task |= SHA_UPDATE;
+
+	return crypto_transfer_hash_request_to_engine(ctx->se->engine, req);
+}
+
+static int tegra_cmac_final(struct ahash_request *req)
+{
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+	struct tegra_cmac_ctx *ctx = crypto_ahash_ctx(tfm);
+	struct tegra_cmac_reqctx *rctx = ahash_request_ctx(req);
+
+	rctx->task |= SHA_FINAL;
+
+	return crypto_transfer_hash_request_to_engine(ctx->se->engine, req);
+}
+
+static int tegra_cmac_finup(struct ahash_request *req)
+{
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+	struct tegra_cmac_ctx *ctx = crypto_ahash_ctx(tfm);
+	struct tegra_cmac_reqctx *rctx = ahash_request_ctx(req);
+
+	rctx->task |= SHA_UPDATE | SHA_FINAL;
+
+	return crypto_transfer_hash_request_to_engine(ctx->se->engine, req);
+}
+
+static int tegra_cmac_digest(struct ahash_request *req)
+{
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+	struct tegra_cmac_ctx *ctx = crypto_ahash_ctx(tfm);
+	struct tegra_cmac_reqctx *rctx = ahash_request_ctx(req);
+
+	tegra_cmac_init(req);
+	rctx->task |= SHA_UPDATE | SHA_FINAL;
+
+	return crypto_transfer_hash_request_to_engine(ctx->se->engine, req);
+}
+
+static int tegra_cmac_export(struct ahash_request *req, void *out)
+{
+	struct tegra_cmac_reqctx *rctx = ahash_request_ctx(req);
+
+	memcpy(out, rctx, sizeof(*rctx));
+
+	return 0;
+}
+
+static int tegra_cmac_import(struct ahash_request *req, const void *in)
+{
+	struct tegra_cmac_reqctx *rctx = ahash_request_ctx(req);
+
+	memcpy(rctx, in, sizeof(*rctx));
+
+	return 0;
+}
+
+static struct tegra_se_alg tegra_aead_algs[] = {
+	{
+		.alg.aead.op.do_one_request = tegra_gcm_do_one_req,
+		.alg.aead.base = {
+			.init = tegra_aead_cra_init,
+			.exit = tegra_aead_cra_exit,
+			.setkey = tegra_aead_setkey,
+			.setauthsize = tegra_gcm_setauthsize,
+			.encrypt = tegra_aead_encrypt,
+			.decrypt = tegra_aead_decrypt,
+			.maxauthsize = AES_BLOCK_SIZE,
+			.ivsize	= GCM_AES_IV_SIZE,
+			.base = {
+				.cra_name = "gcm(aes)",
+				.cra_driver_name = "gcm-aes-tegra",
+				.cra_priority = 500,
+				.cra_blocksize = 1,
+				.cra_ctxsize = sizeof(struct tegra_aead_ctx),
+				.cra_alignmask = 0xf,
+				.cra_module = THIS_MODULE,
+			},
+		}
+	}, {
+		.alg.aead.op.do_one_request = tegra_ccm_do_one_req,
+		.alg.aead.base = {
+			.init = tegra_aead_cra_init,
+			.exit = tegra_aead_cra_exit,
+			.setkey	= tegra_aead_setkey,
+			.setauthsize = tegra_ccm_setauthsize,
+			.encrypt = tegra_aead_encrypt,
+			.decrypt = tegra_aead_decrypt,
+			.maxauthsize = AES_BLOCK_SIZE,
+			.ivsize	= AES_BLOCK_SIZE,
+			.chunksize = AES_BLOCK_SIZE,
+			.base = {
+				.cra_name = "ccm(aes)",
+				.cra_driver_name = "ccm-aes-tegra",
+				.cra_priority = 500,
+				.cra_blocksize = 1,
+				.cra_ctxsize = sizeof(struct tegra_aead_ctx),
+				.cra_alignmask = 0xf,
+				.cra_module = THIS_MODULE,
+			},
+		}
+	}
+};
+
+static struct tegra_se_alg tegra_cmac_algs[] = {
+	{
+		.alg.ahash.op.do_one_request = tegra_cmac_do_one_req,
+		.alg.ahash.base = {
+			.init = tegra_cmac_init,
+			.setkey	= tegra_cmac_setkey,
+			.update = tegra_cmac_update,
+			.final = tegra_cmac_final,
+			.finup = tegra_cmac_finup,
+			.digest = tegra_cmac_digest,
+			.export = tegra_cmac_export,
+			.import = tegra_cmac_import,
+			.halg.digestsize = AES_BLOCK_SIZE,
+			.halg.statesize = sizeof(struct tegra_cmac_reqctx),
+			.halg.base = {
+				.cra_name = "cmac(aes)",
+				.cra_driver_name = "tegra-se-cmac",
+				.cra_priority = 300,
+				.cra_flags = CRYPTO_ALG_TYPE_AHASH,
+				.cra_blocksize = AES_BLOCK_SIZE,
+				.cra_ctxsize = sizeof(struct tegra_cmac_ctx),
+				.cra_alignmask = 0,
+				.cra_module = THIS_MODULE,
+				.cra_init = tegra_cmac_cra_init,
+				.cra_exit = tegra_cmac_cra_exit,
+			}
+		}
+	}
+};
+
+int tegra_init_aes(struct tegra_se *se)
+{
+	struct aead_engine_alg *aead_alg;
+	struct ahash_engine_alg *ahash_alg;
+	struct skcipher_engine_alg *sk_alg;
+	int i, ret;
+
+	se->manifest = tegra_aes_kac_manifest;
+
+	for (i = 0; i < ARRAY_SIZE(tegra_aes_algs); i++) {
+		sk_alg = &tegra_aes_algs[i].alg.skcipher;
+		tegra_aes_algs[i].se_dev = se;
+
+		ret = crypto_engine_register_skcipher(sk_alg);
+		if (ret) {
+			dev_err(se->dev, "failed to register %s\n",
+				sk_alg->base.base.cra_name);
+			goto err_aes;
+		}
+	}
+
+	for (i = 0; i < ARRAY_SIZE(tegra_aead_algs); i++) {
+		aead_alg = &tegra_aead_algs[i].alg.aead;
+		tegra_aead_algs[i].se_dev = se;
+
+		ret = crypto_engine_register_aead(aead_alg);
+		if (ret) {
+			dev_err(se->dev, "failed to register %s\n",
+				aead_alg->base.base.cra_name);
+			goto err_aead;
+		}
+	}
+
+	for (i = 0; i < ARRAY_SIZE(tegra_cmac_algs); i++) {
+		ahash_alg = &tegra_cmac_algs[i].alg.ahash;
+		tegra_cmac_algs[i].se_dev = se;
+
+		ret = crypto_engine_register_ahash(ahash_alg);
+		if (ret) {
+			dev_err(se->dev, "failed to register %s\n",
+				ahash_alg->base.halg.base.cra_name);
+			goto err_cmac;
+		}
+	}
+
+	return 0;
+
+err_cmac:
+	while (i--)
+		crypto_engine_unregister_ahash(&tegra_cmac_algs[i].alg.ahash);
+
+	i = ARRAY_SIZE(tegra_aead_algs);
+err_aead:
+	while (i--)
+		crypto_engine_unregister_aead(&tegra_aead_algs[i].alg.aead);
+
+	i = ARRAY_SIZE(tegra_aes_algs);
+err_aes:
+	while (i--)
+		crypto_engine_unregister_skcipher(&tegra_aes_algs[i].alg.skcipher);
+
+	return ret;
+}
+
+void tegra_deinit_aes(struct tegra_se *se)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(tegra_aes_algs); i++)
+		crypto_engine_unregister_skcipher(&tegra_aes_algs[i].alg.skcipher);
+
+	for (i = 0; i < ARRAY_SIZE(tegra_aead_algs); i++)
+		crypto_engine_unregister_aead(&tegra_aead_algs[i].alg.aead);
+
+	for (i = 0; i < ARRAY_SIZE(tegra_cmac_algs); i++)
+		crypto_engine_unregister_ahash(&tegra_cmac_algs[i].alg.ahash);
+}
diff --git a/drivers/crypto/tegra/tegra-se-hash.c b/drivers/crypto/tegra/tegra-se-hash.c
new file mode 100644
index 000000000000..e0a9e368aa88
--- /dev/null
+++ b/drivers/crypto/tegra/tegra-se-hash.c
@@ -0,0 +1,1055 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// SPDX-FileCopyrightText: Copyright (c) 2023 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+/*
+ * Crypto driver to handle HASH algorithms using NVIDIA Security Engine.
+ */
+
+#include <linux/clk.h>
+#include <linux/dma-mapping.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+
+#include <crypto/aes.h>
+#include <crypto/sha1.h>
+#include <crypto/sha2.h>
+#include <crypto/sha3.h>
+#include <crypto/internal/des.h>
+#include <crypto/engine.h>
+#include <crypto/scatterwalk.h>
+#include <crypto/internal/hash.h>
+
+#include "tegra-se.h"
+
+struct tegra_sha_ctx {
+	struct crypto_ahash *fallback_tfm;
+	struct tegra_se *se;
+	unsigned int alg;
+	bool fallback;
+	u32 key_id;
+};
+
+struct tegra_sha_reqctx {
+	struct ahash_request fallback_req;
+	struct scatterlist *src_sg;
+	struct tegra_se_datbuf datbuf;
+	struct tegra_se_datbuf residue;
+	struct tegra_se_datbuf digest;
+	unsigned int alg;
+	unsigned int config;
+	unsigned int total_len;
+	unsigned int blk_size;
+	unsigned int task;
+	u32 key_id;
+	u32 result[HASH_RESULT_REG_COUNT];
+};
+
+static int tegra_sha_get_config(u32 alg)
+{
+	int cfg = 0;
+
+	switch (alg) {
+	case SE_ALG_SHA1:
+		cfg |= SE_SHA_ENC_ALG_SHA;
+		cfg |= SE_SHA_ENC_MODE_SHA1;
+		break;
+
+	case SE_ALG_HMAC_SHA224:
+		cfg |= SE_SHA_ENC_ALG_HMAC;
+		fallthrough;
+	case SE_ALG_SHA224:
+		cfg |= SE_SHA_ENC_ALG_SHA;
+		cfg |= SE_SHA_ENC_MODE_SHA224;
+		break;
+
+	case SE_ALG_HMAC_SHA256:
+		cfg |= SE_SHA_ENC_ALG_HMAC;
+		fallthrough;
+	case SE_ALG_SHA256:
+		cfg |= SE_SHA_ENC_ALG_SHA;
+		cfg |= SE_SHA_ENC_MODE_SHA256;
+		break;
+
+	case SE_ALG_HMAC_SHA384:
+		cfg |= SE_SHA_ENC_ALG_HMAC;
+		fallthrough;
+	case SE_ALG_SHA384:
+		cfg |= SE_SHA_ENC_ALG_SHA;
+		cfg |= SE_SHA_ENC_MODE_SHA384;
+		break;
+
+	case SE_ALG_HMAC_SHA512:
+		cfg |= SE_SHA_ENC_ALG_HMAC;
+		fallthrough;
+	case SE_ALG_SHA512:
+		cfg |= SE_SHA_ENC_ALG_SHA;
+		cfg |= SE_SHA_ENC_MODE_SHA512;
+		break;
+
+	case SE_ALG_SHA3_224:
+		cfg |= SE_SHA_ENC_ALG_SHA;
+		cfg |= SE_SHA_ENC_MODE_SHA3_224;
+		break;
+	case SE_ALG_SHA3_256:
+		cfg |= SE_SHA_ENC_ALG_SHA;
+		cfg |= SE_SHA_ENC_MODE_SHA3_256;
+		break;
+	case SE_ALG_SHA3_384:
+		cfg |= SE_SHA_ENC_ALG_SHA;
+		cfg |= SE_SHA_ENC_MODE_SHA3_384;
+		break;
+	case SE_ALG_SHA3_512:
+		cfg |= SE_SHA_ENC_ALG_SHA;
+		cfg |= SE_SHA_ENC_MODE_SHA3_512;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return cfg;
+}
+
+static int tegra_sha_fallback_init(struct ahash_request *req)
+{
+	struct tegra_sha_reqctx *rctx = ahash_request_ctx(req);
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+	struct tegra_sha_ctx *ctx = crypto_ahash_ctx(tfm);
+
+	ahash_request_set_tfm(&rctx->fallback_req, ctx->fallback_tfm);
+	rctx->fallback_req.base.flags = req->base.flags &
+					CRYPTO_TFM_REQ_MAY_SLEEP;
+
+	return crypto_ahash_init(&rctx->fallback_req);
+}
+
+static int tegra_sha_fallback_update(struct ahash_request *req)
+{
+	struct tegra_sha_reqctx *rctx = ahash_request_ctx(req);
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+	struct tegra_sha_ctx *ctx = crypto_ahash_ctx(tfm);
+
+	ahash_request_set_tfm(&rctx->fallback_req, ctx->fallback_tfm);
+	rctx->fallback_req.base.flags = req->base.flags &
+					CRYPTO_TFM_REQ_MAY_SLEEP;
+	rctx->fallback_req.nbytes = req->nbytes;
+	rctx->fallback_req.src = req->src;
+
+	return crypto_ahash_update(&rctx->fallback_req);
+}
+
+static int tegra_sha_fallback_final(struct ahash_request *req)
+{
+	struct tegra_sha_reqctx *rctx = ahash_request_ctx(req);
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+	struct tegra_sha_ctx *ctx = crypto_ahash_ctx(tfm);
+
+	ahash_request_set_tfm(&rctx->fallback_req, ctx->fallback_tfm);
+	rctx->fallback_req.base.flags = req->base.flags &
+					CRYPTO_TFM_REQ_MAY_SLEEP;
+	rctx->fallback_req.result = req->result;
+
+	return crypto_ahash_final(&rctx->fallback_req);
+}
+
+static int tegra_sha_fallback_finup(struct ahash_request *req)
+{
+	struct tegra_sha_reqctx *rctx = ahash_request_ctx(req);
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+	struct tegra_sha_ctx *ctx = crypto_ahash_ctx(tfm);
+
+	ahash_request_set_tfm(&rctx->fallback_req, ctx->fallback_tfm);
+	rctx->fallback_req.base.flags = req->base.flags &
+					CRYPTO_TFM_REQ_MAY_SLEEP;
+
+	rctx->fallback_req.nbytes = req->nbytes;
+	rctx->fallback_req.src = req->src;
+	rctx->fallback_req.result = req->result;
+
+	return crypto_ahash_finup(&rctx->fallback_req);
+}
+
+static int tegra_sha_fallback_digest(struct ahash_request *req)
+{
+	struct tegra_sha_reqctx *rctx = ahash_request_ctx(req);
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+	struct tegra_sha_ctx *ctx = crypto_ahash_ctx(tfm);
+
+	ahash_request_set_tfm(&rctx->fallback_req, ctx->fallback_tfm);
+	rctx->fallback_req.base.flags = req->base.flags &
+					CRYPTO_TFM_REQ_MAY_SLEEP;
+
+	rctx->fallback_req.nbytes = req->nbytes;
+	rctx->fallback_req.src = req->src;
+	rctx->fallback_req.result = req->result;
+
+	return crypto_ahash_digest(&rctx->fallback_req);
+}
+
+static int tegra_sha_fallback_import(struct ahash_request *req, const void *in)
+{
+	struct tegra_sha_reqctx *rctx = ahash_request_ctx(req);
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+	struct tegra_sha_ctx *ctx = crypto_ahash_ctx(tfm);
+
+	ahash_request_set_tfm(&rctx->fallback_req, ctx->fallback_tfm);
+	rctx->fallback_req.base.flags = req->base.flags &
+					CRYPTO_TFM_REQ_MAY_SLEEP;
+
+	return crypto_ahash_import(&rctx->fallback_req, in);
+}
+
+static int tegra_sha_fallback_export(struct ahash_request *req, void *out)
+{
+	struct tegra_sha_reqctx *rctx = ahash_request_ctx(req);
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+	struct tegra_sha_ctx *ctx = crypto_ahash_ctx(tfm);
+
+	ahash_request_set_tfm(&rctx->fallback_req, ctx->fallback_tfm);
+	rctx->fallback_req.base.flags = req->base.flags &
+					CRYPTO_TFM_REQ_MAY_SLEEP;
+
+	return crypto_ahash_export(&rctx->fallback_req, out);
+}
+
+static int tegra_sha_prep_cmd(struct tegra_se *se, u32 *cpuvaddr,
+			      struct tegra_sha_reqctx *rctx)
+{
+	u64 msg_len, msg_left;
+	int i = 0;
+
+	msg_len = rctx->total_len * 8;
+	msg_left = rctx->datbuf.size * 8;
+
+	/*
+	 * If IN_ADDR_HI_0.SZ > SHA_MSG_LEFT_[0-3] to the HASH engine,
+	 * HW treats it as the last buffer and process the data.
+	 * Therefore, add an extra byte to msg_left if it is not the
+	 * last buffer.
+	 */
+	if (rctx->task & SHA_UPDATE) {
+		msg_left += 8;
+		msg_len += 8;
+	}
+
+	cpuvaddr[i++] = host1x_opcode_setpayload(8);
+	cpuvaddr[i++] = se_host1x_opcode_incr_w(SE_SHA_MSG_LENGTH);
+	cpuvaddr[i++] = lower_32_bits(msg_len);
+	cpuvaddr[i++] = upper_32_bits(msg_len);
+	cpuvaddr[i++] = 0;
+	cpuvaddr[i++] = 0;
+	cpuvaddr[i++] = lower_32_bits(msg_left);
+	cpuvaddr[i++] = upper_32_bits(msg_left);
+	cpuvaddr[i++] = 0;
+	cpuvaddr[i++] = 0;
+	cpuvaddr[i++] = host1x_opcode_setpayload(6);
+	cpuvaddr[i++] = se_host1x_opcode_incr_w(SE_SHA_CFG);
+	cpuvaddr[i++] = rctx->config;
+
+	if (rctx->task & SHA_FIRST) {
+		cpuvaddr[i++] = SE_SHA_TASK_HASH_INIT;
+		rctx->task &= ~SHA_FIRST;
+	} else {
+		cpuvaddr[i++] = 0;
+	}
+
+	cpuvaddr[i++] = rctx->datbuf.addr;
+	cpuvaddr[i++] = (u32)(SE_ADDR_HI_MSB(upper_32_bits(rctx->datbuf.addr)) |
+				SE_ADDR_HI_SZ(rctx->datbuf.size));
+	cpuvaddr[i++] = rctx->digest.addr;
+	cpuvaddr[i++] = (u32)(SE_ADDR_HI_MSB(upper_32_bits(rctx->digest.addr)) |
+				SE_ADDR_HI_SZ(rctx->digest.size));
+	if (rctx->key_id) {
+		cpuvaddr[i++] = host1x_opcode_setpayload(1);
+		cpuvaddr[i++] = se_host1x_opcode_nonincr_w(SE_SHA_CRYPTO_CFG);
+		cpuvaddr[i++] = SE_AES_KEY_INDEX(rctx->key_id);
+	}
+
+	cpuvaddr[i++] = host1x_opcode_setpayload(1);
+	cpuvaddr[i++] = se_host1x_opcode_nonincr_w(SE_SHA_OPERATION);
+	cpuvaddr[i++] = SE_SHA_OP_WRSTALL |
+			SE_SHA_OP_START |
+			SE_SHA_OP_LASTBUF;
+	cpuvaddr[i++] = se_host1x_opcode_nonincr(host1x_uclass_incr_syncpt_r(), 1);
+	cpuvaddr[i++] = host1x_uclass_incr_syncpt_cond_f(1) |
+			host1x_uclass_incr_syncpt_indx_f(se->syncpt_id);
+
+	dev_dbg(se->dev, "msg len %llu msg left %llu cfg %#x",
+		msg_len, msg_left, rctx->config);
+
+	return i;
+}
+
+static void tegra_sha_copy_hash_result(struct tegra_se *se, struct tegra_sha_reqctx *rctx)
+{
+	int i;
+
+	for (i = 0; i < HASH_RESULT_REG_COUNT; i++)
+		rctx->result[i] = readl(se->base + se->hw->regs->result + (i * 4));
+}
+
+static void tegra_sha_paste_hash_result(struct tegra_se *se, struct tegra_sha_reqctx *rctx)
+{
+	int i;
+
+	for (i = 0; i < HASH_RESULT_REG_COUNT; i++)
+		writel(rctx->result[i],
+		       se->base + se->hw->regs->result + (i * 4));
+}
+
+static int tegra_sha_do_update(struct ahash_request *req)
+{
+	struct tegra_sha_ctx *ctx = crypto_ahash_ctx(crypto_ahash_reqtfm(req));
+	struct tegra_sha_reqctx *rctx = ahash_request_ctx(req);
+	unsigned int nblks, nresidue, size, ret;
+	u32 *cpuvaddr = ctx->se->cmdbuf->addr;
+
+	nresidue = (req->nbytes + rctx->residue.size) % rctx->blk_size;
+	nblks = (req->nbytes + rctx->residue.size) / rctx->blk_size;
+
+	/*
+	 * If nbytes is a multiple of block size and there is no residue,
+	 * then reserve the last block as residue during final() to process.
+	 */
+	if (!nresidue && nblks) {
+		nresidue = rctx->blk_size;
+		nblks--;
+	}
+
+	rctx->src_sg = req->src;
+	rctx->datbuf.size = (req->nbytes + rctx->residue.size) - nresidue;
+	rctx->total_len += rctx->datbuf.size;
+
+	/*
+	 * If nbytes are less than a block size, copy it residue and
+	 * return. The bytes will be processed in final()
+	 */
+	if (nblks < 1) {
+		scatterwalk_map_and_copy(rctx->residue.buf + rctx->residue.size,
+					 rctx->src_sg, 0, req->nbytes, 0);
+
+		rctx->residue.size += req->nbytes;
+		return 0;
+	}
+
+	/* Copy the previous residue first */
+	if (rctx->residue.size)
+		memcpy(rctx->datbuf.buf, rctx->residue.buf, rctx->residue.size);
+
+	scatterwalk_map_and_copy(rctx->datbuf.buf + rctx->residue.size,
+				 rctx->src_sg, 0, req->nbytes - nresidue, 0);
+
+	scatterwalk_map_and_copy(rctx->residue.buf, rctx->src_sg,
+				 req->nbytes - nresidue, nresidue, 0);
+
+	/* Update residue value with the residue after current block */
+	rctx->residue.size = nresidue;
+
+	rctx->config = tegra_sha_get_config(rctx->alg) |
+			SE_SHA_DST_HASH_REG;
+
+	/*
+	 * If this is not the first 'update' call, paste the previous copied
+	 * intermediate results to the registers so that it gets picked up.
+	 * This is to support the import/export functionality.
+	 */
+	if (!(rctx->task & SHA_FIRST))
+		tegra_sha_paste_hash_result(ctx->se, rctx);
+
+	size = tegra_sha_prep_cmd(ctx->se, cpuvaddr, rctx);
+
+	ret = tegra_se_host1x_submit(ctx->se, size);
+
+	/*
+	 * If this is not the final update, copy the intermediate results
+	 * from the registers so that it can be used in the next 'update'
+	 * call. This is to support the import/export functionality.
+	 */
+	if (!(rctx->task & SHA_FINAL))
+		tegra_sha_copy_hash_result(ctx->se, rctx);
+
+	return ret;
+}
+
+static int tegra_sha_do_final(struct ahash_request *req)
+{
+	struct tegra_sha_reqctx *rctx = ahash_request_ctx(req);
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+	struct tegra_sha_ctx *ctx = crypto_ahash_ctx(tfm);
+	struct tegra_se *se = ctx->se;
+	u32 *cpuvaddr = se->cmdbuf->addr;
+	int size, ret = 0;
+
+	memcpy(rctx->datbuf.buf, rctx->residue.buf, rctx->residue.size);
+	rctx->datbuf.size = rctx->residue.size;
+	rctx->total_len += rctx->residue.size;
+
+	rctx->config = tegra_sha_get_config(rctx->alg) |
+		       SE_SHA_DST_MEMORY;
+
+	size = tegra_sha_prep_cmd(se, cpuvaddr, rctx);
+
+	ret = tegra_se_host1x_submit(se, size);
+	if (ret)
+		goto out;
+
+	/* Copy result */
+	memcpy(req->result, rctx->digest.buf, rctx->digest.size);
+
+out:
+	dma_free_coherent(se->dev, SE_SHA_BUFLEN,
+			  rctx->datbuf.buf, rctx->datbuf.addr);
+	dma_free_coherent(se->dev, crypto_ahash_blocksize(tfm),
+			  rctx->residue.buf, rctx->residue.addr);
+	dma_free_coherent(se->dev, rctx->digest.size, rctx->digest.buf,
+			  rctx->digest.addr);
+	return ret;
+}
+
+static int tegra_sha_do_one_req(struct crypto_engine *engine, void *areq)
+{
+	struct ahash_request *req = ahash_request_cast(areq);
+	struct tegra_sha_reqctx *rctx = ahash_request_ctx(req);
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+	struct tegra_sha_ctx *ctx = crypto_ahash_ctx(tfm);
+	struct tegra_se *se = ctx->se;
+	int ret = 0;
+
+	if (rctx->task & SHA_UPDATE) {
+		ret = tegra_sha_do_update(req);
+		rctx->task &= ~SHA_UPDATE;
+	}
+
+	if (rctx->task & SHA_FINAL) {
+		ret = tegra_sha_do_final(req);
+		rctx->task &= ~SHA_FINAL;
+	}
+
+	crypto_finalize_hash_request(se->engine, req, ret);
+
+	return 0;
+}
+
+static void tegra_sha_init_fallback(struct crypto_ahash *tfm, struct tegra_sha_ctx *ctx,
+				    const char *algname)
+{
+	ctx->fallback_tfm = crypto_alloc_ahash(algname, 0, CRYPTO_ALG_ASYNC |
+						CRYPTO_ALG_NEED_FALLBACK);
+
+	if (IS_ERR(ctx->fallback_tfm))
+		goto err_out;
+
+	if (crypto_ahash_statesize(ctx->fallback_tfm) > sizeof(struct tegra_sha_reqctx))
+		goto free_tfm;
+
+	return;
+
+free_tfm:
+	crypto_free_ahash(ctx->fallback_tfm);
+err_out:
+	dev_warn(ctx->se->dev, "failed to allocate fallback for %s\n", algname);
+	ctx->fallback_tfm = NULL;
+}
+
+static int tegra_sha_cra_init(struct crypto_tfm *tfm)
+{
+	struct tegra_sha_ctx *ctx = crypto_tfm_ctx(tfm);
+	struct crypto_ahash *ahash_tfm = __crypto_ahash_cast(tfm);
+	struct ahash_alg *alg = __crypto_ahash_alg(tfm->__crt_alg);
+	struct tegra_se_alg *se_alg;
+	const char *algname;
+	int ret;
+
+	algname = crypto_tfm_alg_name(tfm);
+	se_alg = container_of(alg, struct tegra_se_alg, alg.ahash.base);
+
+	crypto_ahash_set_reqsize(ahash_tfm, sizeof(struct tegra_sha_reqctx));
+
+	ctx->se = se_alg->se_dev;
+	ctx->fallback = false;
+	ctx->key_id = 0;
+
+	ret = se_algname_to_algid(algname);
+	if (ret < 0) {
+		dev_err(ctx->se->dev, "invalid algorithm\n");
+		return ret;
+	}
+
+	if (se_alg->alg_base)
+		tegra_sha_init_fallback(ahash_tfm, ctx, algname);
+
+	ctx->alg = ret;
+
+	return 0;
+}
+
+static void tegra_sha_cra_exit(struct crypto_tfm *tfm)
+{
+	struct tegra_sha_ctx *ctx = crypto_tfm_ctx(tfm);
+
+	if (ctx->fallback_tfm)
+		crypto_free_ahash(ctx->fallback_tfm);
+
+	tegra_key_invalidate(ctx->se, ctx->key_id, ctx->alg);
+}
+
+static int tegra_sha_init(struct ahash_request *req)
+{
+	struct tegra_sha_reqctx *rctx = ahash_request_ctx(req);
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+	struct tegra_sha_ctx *ctx = crypto_ahash_ctx(tfm);
+	struct tegra_se *se = ctx->se;
+
+	if (ctx->fallback)
+		return tegra_sha_fallback_init(req);
+
+	rctx->total_len = 0;
+	rctx->datbuf.size = 0;
+	rctx->residue.size = 0;
+	rctx->key_id = ctx->key_id;
+	rctx->task = SHA_FIRST;
+	rctx->alg = ctx->alg;
+	rctx->blk_size = crypto_ahash_blocksize(tfm);
+	rctx->digest.size = crypto_ahash_digestsize(tfm);
+
+	rctx->digest.buf = dma_alloc_coherent(se->dev, rctx->digest.size,
+					      &rctx->digest.addr, GFP_KERNEL);
+	if (!rctx->digest.buf)
+		goto digbuf_fail;
+
+	rctx->residue.buf = dma_alloc_coherent(se->dev, rctx->blk_size,
+					       &rctx->residue.addr, GFP_KERNEL);
+	if (!rctx->residue.buf)
+		goto resbuf_fail;
+
+	rctx->datbuf.buf = dma_alloc_coherent(se->dev, SE_SHA_BUFLEN,
+					      &rctx->datbuf.addr, GFP_KERNEL);
+	if (!rctx->datbuf.buf)
+		goto datbuf_fail;
+
+	return 0;
+
+datbuf_fail:
+	dma_free_coherent(se->dev, rctx->blk_size, rctx->residue.buf,
+			  rctx->residue.addr);
+resbuf_fail:
+	dma_free_coherent(se->dev, SE_SHA_BUFLEN, rctx->datbuf.buf,
+			  rctx->datbuf.addr);
+digbuf_fail:
+	return -ENOMEM;
+}
+
+static int tegra_hmac_fallback_setkey(struct tegra_sha_ctx *ctx, const u8 *key,
+				      unsigned int keylen)
+{
+	if (!ctx->fallback_tfm) {
+		dev_dbg(ctx->se->dev, "invalid key length (%d)\n", keylen);
+		return -EINVAL;
+	}
+
+	ctx->fallback = true;
+	return crypto_ahash_setkey(ctx->fallback_tfm, key, keylen);
+}
+
+static int tegra_hmac_setkey(struct crypto_ahash *tfm, const u8 *key,
+			     unsigned int keylen)
+{
+	struct tegra_sha_ctx *ctx = crypto_ahash_ctx(tfm);
+
+	if (aes_check_keylen(keylen))
+		return tegra_hmac_fallback_setkey(ctx, key, keylen);
+
+	ctx->fallback = false;
+
+	return tegra_key_submit(ctx->se, key, keylen, ctx->alg, &ctx->key_id);
+}
+
+static int tegra_sha_update(struct ahash_request *req)
+{
+	struct tegra_sha_reqctx *rctx = ahash_request_ctx(req);
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+	struct tegra_sha_ctx *ctx = crypto_ahash_ctx(tfm);
+
+	if (ctx->fallback)
+		return tegra_sha_fallback_update(req);
+
+	rctx->task |= SHA_UPDATE;
+
+	return crypto_transfer_hash_request_to_engine(ctx->se->engine, req);
+}
+
+static int tegra_sha_final(struct ahash_request *req)
+{
+	struct tegra_sha_reqctx *rctx = ahash_request_ctx(req);
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+	struct tegra_sha_ctx *ctx = crypto_ahash_ctx(tfm);
+
+	if (ctx->fallback)
+		return tegra_sha_fallback_final(req);
+
+	rctx->task |= SHA_FINAL;
+
+	return crypto_transfer_hash_request_to_engine(ctx->se->engine, req);
+}
+
+static int tegra_sha_finup(struct ahash_request *req)
+{
+	struct tegra_sha_reqctx *rctx = ahash_request_ctx(req);
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+	struct tegra_sha_ctx *ctx = crypto_ahash_ctx(tfm);
+
+	if (ctx->fallback)
+		return tegra_sha_fallback_finup(req);
+
+	rctx->task |= SHA_UPDATE | SHA_FINAL;
+
+	return crypto_transfer_hash_request_to_engine(ctx->se->engine, req);
+}
+
+static int tegra_sha_digest(struct ahash_request *req)
+{
+	struct tegra_sha_reqctx *rctx = ahash_request_ctx(req);
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+	struct tegra_sha_ctx *ctx = crypto_ahash_ctx(tfm);
+
+	if (ctx->fallback)
+		return tegra_sha_fallback_digest(req);
+
+	tegra_sha_init(req);
+	rctx->task |= SHA_UPDATE | SHA_FINAL;
+
+	return crypto_transfer_hash_request_to_engine(ctx->se->engine, req);
+}
+
+static int tegra_sha_export(struct ahash_request *req, void *out)
+{
+	struct tegra_sha_reqctx *rctx = ahash_request_ctx(req);
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+	struct tegra_sha_ctx *ctx = crypto_ahash_ctx(tfm);
+
+	if (ctx->fallback)
+		return tegra_sha_fallback_export(req, out);
+
+	memcpy(out, rctx, sizeof(*rctx));
+
+	return 0;
+}
+
+static int tegra_sha_import(struct ahash_request *req, const void *in)
+{
+	struct tegra_sha_reqctx *rctx = ahash_request_ctx(req);
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+	struct tegra_sha_ctx *ctx = crypto_ahash_ctx(tfm);
+
+	if (ctx->fallback)
+		return tegra_sha_fallback_import(req, in);
+
+	memcpy(rctx, in, sizeof(*rctx));
+
+	return 0;
+}
+
+static struct tegra_se_alg tegra_hash_algs[] = {
+	{
+		.alg.ahash.op.do_one_request = tegra_sha_do_one_req,
+		.alg.ahash.base = {
+			.init = tegra_sha_init,
+			.update = tegra_sha_update,
+			.final = tegra_sha_final,
+			.finup = tegra_sha_finup,
+			.digest = tegra_sha_digest,
+			.export = tegra_sha_export,
+			.import = tegra_sha_import,
+			.halg.digestsize = SHA1_DIGEST_SIZE,
+			.halg.statesize = sizeof(struct tegra_sha_reqctx),
+			.halg.base = {
+				.cra_name = "sha1",
+				.cra_driver_name = "tegra-se-sha1",
+				.cra_priority = 300,
+				.cra_flags = CRYPTO_ALG_TYPE_AHASH,
+				.cra_blocksize = SHA1_BLOCK_SIZE,
+				.cra_ctxsize = sizeof(struct tegra_sha_ctx),
+				.cra_alignmask = 0,
+				.cra_module = THIS_MODULE,
+				.cra_init = tegra_sha_cra_init,
+				.cra_exit = tegra_sha_cra_exit,
+			}
+		}
+	}, {
+		.alg.ahash.op.do_one_request = tegra_sha_do_one_req,
+		.alg.ahash.base = {
+			.init = tegra_sha_init,
+			.update = tegra_sha_update,
+			.final = tegra_sha_final,
+			.finup = tegra_sha_finup,
+			.digest = tegra_sha_digest,
+			.export = tegra_sha_export,
+			.import = tegra_sha_import,
+			.halg.digestsize = SHA224_DIGEST_SIZE,
+			.halg.statesize = sizeof(struct tegra_sha_reqctx),
+			.halg.base = {
+				.cra_name = "sha224",
+				.cra_driver_name = "tegra-se-sha224",
+				.cra_priority = 300,
+				.cra_flags = CRYPTO_ALG_TYPE_AHASH,
+				.cra_blocksize = SHA224_BLOCK_SIZE,
+				.cra_ctxsize = sizeof(struct tegra_sha_ctx),
+				.cra_alignmask = 0,
+				.cra_module = THIS_MODULE,
+				.cra_init = tegra_sha_cra_init,
+				.cra_exit = tegra_sha_cra_exit,
+			}
+		}
+	}, {
+		.alg.ahash.op.do_one_request = tegra_sha_do_one_req,
+		.alg.ahash.base = {
+			.init = tegra_sha_init,
+			.update = tegra_sha_update,
+			.final = tegra_sha_final,
+			.finup = tegra_sha_finup,
+			.digest = tegra_sha_digest,
+			.export = tegra_sha_export,
+			.import = tegra_sha_import,
+			.halg.digestsize = SHA256_DIGEST_SIZE,
+			.halg.statesize = sizeof(struct tegra_sha_reqctx),
+			.halg.base = {
+				.cra_name = "sha256",
+				.cra_driver_name = "tegra-se-sha256",
+				.cra_priority = 300,
+				.cra_flags = CRYPTO_ALG_TYPE_AHASH,
+				.cra_blocksize = SHA256_BLOCK_SIZE,
+				.cra_ctxsize = sizeof(struct tegra_sha_ctx),
+				.cra_alignmask = 0,
+				.cra_module = THIS_MODULE,
+				.cra_init = tegra_sha_cra_init,
+				.cra_exit = tegra_sha_cra_exit,
+			}
+		}
+	}, {
+		.alg.ahash.op.do_one_request = tegra_sha_do_one_req,
+		.alg.ahash.base = {
+			.init = tegra_sha_init,
+			.update = tegra_sha_update,
+			.final = tegra_sha_final,
+			.finup = tegra_sha_finup,
+			.digest = tegra_sha_digest,
+			.export = tegra_sha_export,
+			.import = tegra_sha_import,
+			.halg.digestsize = SHA384_DIGEST_SIZE,
+			.halg.statesize = sizeof(struct tegra_sha_reqctx),
+			.halg.base = {
+				.cra_name = "sha384",
+				.cra_driver_name = "tegra-se-sha384",
+				.cra_priority = 300,
+				.cra_flags = CRYPTO_ALG_TYPE_AHASH,
+				.cra_blocksize = SHA384_BLOCK_SIZE,
+				.cra_ctxsize = sizeof(struct tegra_sha_ctx),
+				.cra_alignmask = 0,
+				.cra_module = THIS_MODULE,
+				.cra_init = tegra_sha_cra_init,
+				.cra_exit = tegra_sha_cra_exit,
+			}
+		}
+	}, {
+		.alg.ahash.op.do_one_request = tegra_sha_do_one_req,
+		.alg.ahash.base = {
+			.init = tegra_sha_init,
+			.update = tegra_sha_update,
+			.final = tegra_sha_final,
+			.finup = tegra_sha_finup,
+			.digest = tegra_sha_digest,
+			.export = tegra_sha_export,
+			.import = tegra_sha_import,
+			.halg.digestsize = SHA512_DIGEST_SIZE,
+			.halg.statesize = sizeof(struct tegra_sha_reqctx),
+			.halg.base = {
+				.cra_name = "sha512",
+				.cra_driver_name = "tegra-se-sha512",
+				.cra_priority = 300,
+				.cra_flags = CRYPTO_ALG_TYPE_AHASH,
+				.cra_blocksize = SHA512_BLOCK_SIZE,
+				.cra_ctxsize = sizeof(struct tegra_sha_ctx),
+				.cra_alignmask = 0,
+				.cra_module = THIS_MODULE,
+				.cra_init = tegra_sha_cra_init,
+				.cra_exit = tegra_sha_cra_exit,
+			}
+		}
+	}, {
+		.alg.ahash.op.do_one_request = tegra_sha_do_one_req,
+		.alg.ahash.base = {
+			.init = tegra_sha_init,
+			.update = tegra_sha_update,
+			.final = tegra_sha_final,
+			.finup = tegra_sha_finup,
+			.digest = tegra_sha_digest,
+			.export = tegra_sha_export,
+			.import = tegra_sha_import,
+			.halg.digestsize = SHA3_224_DIGEST_SIZE,
+			.halg.statesize = sizeof(struct tegra_sha_reqctx),
+			.halg.base = {
+				.cra_name = "sha3-224",
+				.cra_driver_name = "tegra-se-sha3-224",
+				.cra_priority = 300,
+				.cra_flags = CRYPTO_ALG_TYPE_AHASH,
+				.cra_blocksize = SHA3_224_BLOCK_SIZE,
+				.cra_ctxsize = sizeof(struct tegra_sha_ctx),
+				.cra_alignmask = 0,
+				.cra_module = THIS_MODULE,
+				.cra_init = tegra_sha_cra_init,
+				.cra_exit = tegra_sha_cra_exit,
+			}
+		}
+	}, {
+		.alg.ahash.op.do_one_request = tegra_sha_do_one_req,
+		.alg.ahash.base = {
+			.init = tegra_sha_init,
+			.update = tegra_sha_update,
+			.final = tegra_sha_final,
+			.finup = tegra_sha_finup,
+			.digest = tegra_sha_digest,
+			.export = tegra_sha_export,
+			.import = tegra_sha_import,
+			.halg.digestsize = SHA3_256_DIGEST_SIZE,
+			.halg.statesize = sizeof(struct tegra_sha_reqctx),
+			.halg.base = {
+				.cra_name = "sha3-256",
+				.cra_driver_name = "tegra-se-sha3-256",
+				.cra_priority = 300,
+				.cra_flags = CRYPTO_ALG_TYPE_AHASH,
+				.cra_blocksize = SHA3_256_BLOCK_SIZE,
+				.cra_ctxsize = sizeof(struct tegra_sha_ctx),
+				.cra_alignmask = 0,
+				.cra_module = THIS_MODULE,
+				.cra_init = tegra_sha_cra_init,
+				.cra_exit = tegra_sha_cra_exit,
+			}
+		}
+	}, {
+		.alg.ahash.op.do_one_request = tegra_sha_do_one_req,
+		.alg.ahash.base = {
+			.init = tegra_sha_init,
+			.update = tegra_sha_update,
+			.final = tegra_sha_final,
+			.finup = tegra_sha_finup,
+			.digest = tegra_sha_digest,
+			.export = tegra_sha_export,
+			.import = tegra_sha_import,
+			.halg.digestsize = SHA3_384_DIGEST_SIZE,
+			.halg.statesize = sizeof(struct tegra_sha_reqctx),
+			.halg.base = {
+				.cra_name = "sha3-384",
+				.cra_driver_name = "tegra-se-sha3-384",
+				.cra_priority = 300,
+				.cra_flags = CRYPTO_ALG_TYPE_AHASH,
+				.cra_blocksize = SHA3_384_BLOCK_SIZE,
+				.cra_ctxsize = sizeof(struct tegra_sha_ctx),
+				.cra_alignmask = 0,
+				.cra_module = THIS_MODULE,
+				.cra_init = tegra_sha_cra_init,
+				.cra_exit = tegra_sha_cra_exit,
+			}
+		}
+	}, {
+		.alg.ahash.op.do_one_request = tegra_sha_do_one_req,
+		.alg.ahash.base = {
+			.init = tegra_sha_init,
+			.update = tegra_sha_update,
+			.final = tegra_sha_final,
+			.finup = tegra_sha_finup,
+			.digest = tegra_sha_digest,
+			.export = tegra_sha_export,
+			.import = tegra_sha_import,
+			.halg.digestsize = SHA3_512_DIGEST_SIZE,
+			.halg.statesize = sizeof(struct tegra_sha_reqctx),
+			.halg.base = {
+				.cra_name = "sha3-512",
+				.cra_driver_name = "tegra-se-sha3-512",
+				.cra_priority = 300,
+				.cra_flags = CRYPTO_ALG_TYPE_AHASH,
+				.cra_blocksize = SHA3_512_BLOCK_SIZE,
+				.cra_ctxsize = sizeof(struct tegra_sha_ctx),
+				.cra_alignmask = 0,
+				.cra_module = THIS_MODULE,
+				.cra_init = tegra_sha_cra_init,
+				.cra_exit = tegra_sha_cra_exit,
+			}
+		}
+	}, {
+		.alg_base = "sha224",
+		.alg.ahash.op.do_one_request = tegra_sha_do_one_req,
+		.alg.ahash.base = {
+			.init = tegra_sha_init,
+			.update = tegra_sha_update,
+			.final = tegra_sha_final,
+			.finup = tegra_sha_finup,
+			.digest = tegra_sha_digest,
+			.export = tegra_sha_export,
+			.import = tegra_sha_import,
+			.setkey = tegra_hmac_setkey,
+			.halg.digestsize = SHA224_DIGEST_SIZE,
+			.halg.statesize = sizeof(struct tegra_sha_reqctx),
+			.halg.base = {
+				.cra_name = "hmac(sha224)",
+				.cra_driver_name = "tegra-se-hmac-sha224",
+				.cra_priority = 300,
+				.cra_flags = CRYPTO_ALG_TYPE_AHASH | CRYPTO_ALG_NEED_FALLBACK,
+				.cra_blocksize = SHA224_BLOCK_SIZE,
+				.cra_ctxsize = sizeof(struct tegra_sha_ctx),
+				.cra_alignmask = 0,
+				.cra_module = THIS_MODULE,
+				.cra_init = tegra_sha_cra_init,
+				.cra_exit = tegra_sha_cra_exit,
+			}
+		}
+	}, {
+		.alg_base = "sha256",
+		.alg.ahash.op.do_one_request = tegra_sha_do_one_req,
+		.alg.ahash.base = {
+			.init = tegra_sha_init,
+			.update = tegra_sha_update,
+			.final = tegra_sha_final,
+			.finup = tegra_sha_finup,
+			.digest = tegra_sha_digest,
+			.export = tegra_sha_export,
+			.import = tegra_sha_import,
+			.setkey = tegra_hmac_setkey,
+			.halg.digestsize = SHA256_DIGEST_SIZE,
+			.halg.statesize = sizeof(struct tegra_sha_reqctx),
+			.halg.base = {
+				.cra_name = "hmac(sha256)",
+				.cra_driver_name = "tegra-se-hmac-sha256",
+				.cra_priority = 300,
+				.cra_flags = CRYPTO_ALG_TYPE_AHASH | CRYPTO_ALG_NEED_FALLBACK,
+				.cra_blocksize = SHA256_BLOCK_SIZE,
+				.cra_ctxsize = sizeof(struct tegra_sha_ctx),
+				.cra_alignmask = 0,
+				.cra_module = THIS_MODULE,
+				.cra_init = tegra_sha_cra_init,
+				.cra_exit = tegra_sha_cra_exit,
+			}
+		}
+	}, {
+		.alg_base = "sha384",
+		.alg.ahash.op.do_one_request = tegra_sha_do_one_req,
+		.alg.ahash.base = {
+			.init = tegra_sha_init,
+			.update = tegra_sha_update,
+			.final = tegra_sha_final,
+			.finup = tegra_sha_finup,
+			.digest = tegra_sha_digest,
+			.export = tegra_sha_export,
+			.import = tegra_sha_import,
+			.setkey = tegra_hmac_setkey,
+			.halg.digestsize = SHA384_DIGEST_SIZE,
+			.halg.statesize = sizeof(struct tegra_sha_reqctx),
+			.halg.base = {
+				.cra_name = "hmac(sha384)",
+				.cra_driver_name = "tegra-se-hmac-sha384",
+				.cra_priority = 300,
+				.cra_flags = CRYPTO_ALG_TYPE_AHASH | CRYPTO_ALG_NEED_FALLBACK,
+				.cra_blocksize = SHA384_BLOCK_SIZE,
+				.cra_ctxsize = sizeof(struct tegra_sha_ctx),
+				.cra_alignmask = 0,
+				.cra_module = THIS_MODULE,
+				.cra_init = tegra_sha_cra_init,
+				.cra_exit = tegra_sha_cra_exit,
+			}
+		}
+	}, {
+		.alg_base = "sha512",
+		.alg.ahash.op.do_one_request = tegra_sha_do_one_req,
+		.alg.ahash.base = {
+			.init = tegra_sha_init,
+			.update = tegra_sha_update,
+			.final = tegra_sha_final,
+			.finup = tegra_sha_finup,
+			.digest = tegra_sha_digest,
+			.export = tegra_sha_export,
+			.import = tegra_sha_import,
+			.setkey = tegra_hmac_setkey,
+			.halg.digestsize = SHA512_DIGEST_SIZE,
+			.halg.statesize = sizeof(struct tegra_sha_reqctx),
+			.halg.base = {
+				.cra_name = "hmac(sha512)",
+				.cra_driver_name = "tegra-se-hmac-sha512",
+				.cra_priority = 300,
+				.cra_flags = CRYPTO_ALG_TYPE_AHASH | CRYPTO_ALG_NEED_FALLBACK,
+				.cra_blocksize = SHA512_BLOCK_SIZE,
+				.cra_ctxsize = sizeof(struct tegra_sha_ctx),
+				.cra_alignmask = 0,
+				.cra_module = THIS_MODULE,
+				.cra_init = tegra_sha_cra_init,
+				.cra_exit = tegra_sha_cra_exit,
+			}
+		}
+	}
+};
+
+static int tegra_hash_kac_manifest(u32 user, u32 alg, u32 keylen)
+{
+	int manifest;
+
+	manifest = SE_KAC_USER_NS;
+
+	switch (alg) {
+	case SE_ALG_HMAC_SHA224:
+	case SE_ALG_HMAC_SHA256:
+	case SE_ALG_HMAC_SHA384:
+	case SE_ALG_HMAC_SHA512:
+		manifest |= SE_KAC_HMAC;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (keylen) {
+	case AES_KEYSIZE_128:
+		manifest |= SE_KAC_SIZE_128;
+		break;
+	case AES_KEYSIZE_192:
+		manifest |= SE_KAC_SIZE_192;
+		break;
+	case AES_KEYSIZE_256:
+	default:
+		manifest |= SE_KAC_SIZE_256;
+		break;
+	}
+
+	return manifest;
+}
+
+int tegra_init_hash(struct tegra_se *se)
+{
+	struct ahash_engine_alg *alg;
+	int i, ret;
+
+	se->manifest = tegra_hash_kac_manifest;
+
+	for (i = 0; i < ARRAY_SIZE(tegra_hash_algs); i++) {
+		tegra_hash_algs[i].se_dev = se;
+		alg = &tegra_hash_algs[i].alg.ahash;
+
+		ret = crypto_engine_register_ahash(alg);
+		if (ret) {
+			dev_err(se->dev, "failed to register %s\n",
+				alg->base.halg.base.cra_name);
+			goto sha_err;
+		}
+	}
+
+	return 0;
+
+sha_err:
+	while (i--)
+		crypto_engine_unregister_ahash(&tegra_hash_algs[i].alg.ahash);
+
+	return ret;
+}
+
+void tegra_deinit_hash(struct tegra_se *se)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(tegra_hash_algs); i++)
+		crypto_engine_unregister_ahash(&tegra_hash_algs[i].alg.ahash);
+}
diff --git a/drivers/crypto/tegra/tegra-se-key.c b/drivers/crypto/tegra/tegra-se-key.c
new file mode 100644
index 000000000000..ac14678dbd30
--- /dev/null
+++ b/drivers/crypto/tegra/tegra-se-key.c
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// SPDX-FileCopyrightText: Copyright (c) 2023 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+/*
+ * Crypto driver file to manage keys of NVIDIA Security Engine.
+ */
+
+#include <linux/bitops.h>
+#include <linux/module.h>
+#include <crypto/aes.h>
+
+#include "tegra-se.h"
+
+#define SE_KEY_FULL_MASK		GENMASK(SE_MAX_KEYSLOT, 0)
+
+/* Reserve keyslot 0, 14, 15 */
+#define SE_KEY_RSVD_MASK		(BIT(0) | BIT(14) | BIT(15))
+#define SE_KEY_VALID_MASK		(SE_KEY_FULL_MASK & ~SE_KEY_RSVD_MASK)
+
+/* Mutex lock to guard keyslots */
+static DEFINE_MUTEX(kslt_lock);
+
+/* Keyslot bitmask (0 = available, 1 = in use/not available) */
+static u16 tegra_se_keyslots = SE_KEY_RSVD_MASK;
+
+static u16 tegra_keyslot_alloc(void)
+{
+	u16 keyid;
+
+	mutex_lock(&kslt_lock);
+	/* Check if all key slots are full */
+	if (tegra_se_keyslots == GENMASK(SE_MAX_KEYSLOT, 0)) {
+		mutex_unlock(&kslt_lock);
+		return 0;
+	}
+
+	keyid = ffz(tegra_se_keyslots);
+	tegra_se_keyslots |= BIT(keyid);
+
+	mutex_unlock(&kslt_lock);
+
+	return keyid;
+}
+
+static void tegra_keyslot_free(u16 slot)
+{
+	mutex_lock(&kslt_lock);
+	tegra_se_keyslots &= ~(BIT(slot));
+	mutex_unlock(&kslt_lock);
+}
+
+static unsigned int tegra_key_prep_ins_cmd(struct tegra_se *se, u32 *cpuvaddr,
+					   const u32 *key, u32 keylen, u16 slot, u32 alg)
+{
+	int i = 0, j;
+
+	cpuvaddr[i++] = host1x_opcode_setpayload(1);
+	cpuvaddr[i++] = se_host1x_opcode_incr_w(se->hw->regs->op);
+	cpuvaddr[i++] = SE_AES_OP_WRSTALL | SE_AES_OP_DUMMY;
+
+	cpuvaddr[i++] = host1x_opcode_setpayload(1);
+	cpuvaddr[i++] = se_host1x_opcode_incr_w(se->hw->regs->manifest);
+	cpuvaddr[i++] = se->manifest(se->owner, alg, keylen);
+	cpuvaddr[i++] = host1x_opcode_setpayload(1);
+	cpuvaddr[i++] = se_host1x_opcode_incr_w(se->hw->regs->key_dst);
+
+	cpuvaddr[i++] = SE_AES_KEY_DST_INDEX(slot);
+
+	for (j = 0; j < keylen / 4; j++) {
+		/* Set key address */
+		cpuvaddr[i++] = host1x_opcode_setpayload(1);
+		cpuvaddr[i++] = se_host1x_opcode_incr_w(se->hw->regs->key_addr);
+		cpuvaddr[i++] = j;
+
+		/* Set key data */
+		cpuvaddr[i++] = host1x_opcode_setpayload(1);
+		cpuvaddr[i++] = se_host1x_opcode_incr_w(se->hw->regs->key_data);
+		cpuvaddr[i++] = key[j];
+	}
+
+	cpuvaddr[i++] = host1x_opcode_setpayload(1);
+	cpuvaddr[i++] = se_host1x_opcode_incr_w(se->hw->regs->config);
+	cpuvaddr[i++] = SE_CFG_INS;
+
+	cpuvaddr[i++] = host1x_opcode_setpayload(1);
+	cpuvaddr[i++] = se_host1x_opcode_incr_w(se->hw->regs->op);
+	cpuvaddr[i++] = SE_AES_OP_WRSTALL | SE_AES_OP_START |
+			SE_AES_OP_LASTBUF;
+
+	cpuvaddr[i++] = se_host1x_opcode_nonincr(host1x_uclass_incr_syncpt_r(), 1);
+	cpuvaddr[i++] = host1x_uclass_incr_syncpt_cond_f(1) |
+			host1x_uclass_incr_syncpt_indx_f(se->syncpt_id);
+
+	dev_dbg(se->dev, "key-slot %u key-manifest %#x\n",
+		slot, se->manifest(se->owner, alg, keylen));
+
+	return i;
+}
+
+static bool tegra_key_in_kslt(u32 keyid)
+{
+	bool ret;
+
+	if (keyid > SE_MAX_KEYSLOT)
+		return false;
+
+	mutex_lock(&kslt_lock);
+	ret = ((BIT(keyid) & SE_KEY_VALID_MASK) &&
+		(BIT(keyid) & tegra_se_keyslots));
+	mutex_unlock(&kslt_lock);
+
+	return ret;
+}
+
+static int tegra_key_insert(struct tegra_se *se, const u8 *key,
+			    u32 keylen, u16 slot, u32 alg)
+{
+	const u32 *keyval = (u32 *)key;
+	u32 *addr = se->cmdbuf->addr, size;
+
+	size = tegra_key_prep_ins_cmd(se, addr, keyval, keylen, slot, alg);
+
+	return tegra_se_host1x_submit(se, size);
+}
+
+void tegra_key_invalidate(struct tegra_se *se, u32 keyid, u32 alg)
+{
+	u8 zkey[AES_MAX_KEY_SIZE] = {0};
+
+	if (!keyid)
+		return;
+
+	/* Overwrite the key with 0s */
+	tegra_key_insert(se, zkey, AES_MAX_KEY_SIZE, keyid, alg);
+
+	tegra_keyslot_free(keyid);
+}
+
+int tegra_key_submit(struct tegra_se *se, const u8 *key, u32 keylen, u32 alg, u32 *keyid)
+{
+	int ret;
+
+	/* Use the existing slot if it is already allocated */
+	if (!tegra_key_in_kslt(*keyid)) {
+		*keyid = tegra_keyslot_alloc();
+		if (!(*keyid)) {
+			dev_err(se->dev, "failed to allocate key slot\n");
+			return -ENOMEM;
+		}
+	}
+
+	ret = tegra_key_insert(se, key, keylen, *keyid, alg);
+	if (ret)
+		return ret;
+
+	return 0;
+}
diff --git a/drivers/crypto/tegra/tegra-se-main.c b/drivers/crypto/tegra/tegra-se-main.c
new file mode 100644
index 000000000000..f4758e320615
--- /dev/null
+++ b/drivers/crypto/tegra/tegra-se-main.c
@@ -0,0 +1,439 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// SPDX-FileCopyrightText: Copyright (c) 2023 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+/*
+ * Crypto driver for NVIDIA Security Engine in Tegra Chips
+ */
+
+#include <linux/clk.h>
+#include <linux/dma-mapping.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/mod_devicetable.h>
+
+#include <crypto/engine.h>
+
+#include "tegra-se.h"
+
+static struct host1x_bo *tegra_se_cmdbuf_get(struct host1x_bo *host_bo)
+{
+	struct tegra_se_cmdbuf *cmdbuf = container_of(host_bo, struct tegra_se_cmdbuf, bo);
+
+	kref_get(&cmdbuf->ref);
+
+	return host_bo;
+}
+
+static void tegra_se_cmdbuf_release(struct kref *ref)
+{
+	struct tegra_se_cmdbuf *cmdbuf = container_of(ref, struct tegra_se_cmdbuf, ref);
+
+	dma_free_attrs(cmdbuf->dev, cmdbuf->size, cmdbuf->addr,
+		       cmdbuf->iova, 0);
+
+	kfree(cmdbuf);
+}
+
+static void tegra_se_cmdbuf_put(struct host1x_bo *host_bo)
+{
+	struct tegra_se_cmdbuf *cmdbuf = container_of(host_bo, struct tegra_se_cmdbuf, bo);
+
+	kref_put(&cmdbuf->ref, tegra_se_cmdbuf_release);
+}
+
+static struct host1x_bo_mapping *
+tegra_se_cmdbuf_pin(struct device *dev, struct host1x_bo *bo, enum dma_data_direction direction)
+{
+	struct tegra_se_cmdbuf *cmdbuf = container_of(bo, struct tegra_se_cmdbuf, bo);
+	struct host1x_bo_mapping *map;
+	int err;
+
+	map = kzalloc(sizeof(*map), GFP_KERNEL);
+	if (!map)
+		return ERR_PTR(-ENOMEM);
+
+	kref_init(&map->ref);
+	map->bo = host1x_bo_get(bo);
+	map->direction = direction;
+	map->dev = dev;
+
+	map->sgt = kzalloc(sizeof(*map->sgt), GFP_KERNEL);
+	if (!map->sgt) {
+		err = -ENOMEM;
+		goto free;
+	}
+
+	err = dma_get_sgtable(dev, map->sgt, cmdbuf->addr,
+			      cmdbuf->iova, cmdbuf->words * 4);
+	if (err)
+		goto free_sgt;
+
+	err = dma_map_sgtable(dev, map->sgt, direction, 0);
+	if (err)
+		goto free_sgt;
+
+	map->phys = sg_dma_address(map->sgt->sgl);
+	map->size = cmdbuf->words * 4;
+	map->chunks = err;
+
+	return map;
+
+free_sgt:
+	sg_free_table(map->sgt);
+	kfree(map->sgt);
+free:
+	kfree(map);
+	return ERR_PTR(err);
+}
+
+static void tegra_se_cmdbuf_unpin(struct host1x_bo_mapping *map)
+{
+	if (!map)
+		return;
+
+	dma_unmap_sgtable(map->dev, map->sgt, map->direction, 0);
+	sg_free_table(map->sgt);
+	kfree(map->sgt);
+	host1x_bo_put(map->bo);
+
+	kfree(map);
+}
+
+static void *tegra_se_cmdbuf_mmap(struct host1x_bo *host_bo)
+{
+	struct tegra_se_cmdbuf *cmdbuf = container_of(host_bo, struct tegra_se_cmdbuf, bo);
+
+	return cmdbuf->addr;
+}
+
+static void tegra_se_cmdbuf_munmap(struct host1x_bo *host_bo, void *addr)
+{
+}
+
+static const struct host1x_bo_ops tegra_se_cmdbuf_ops = {
+	.get = tegra_se_cmdbuf_get,
+	.put = tegra_se_cmdbuf_put,
+	.pin = tegra_se_cmdbuf_pin,
+	.unpin = tegra_se_cmdbuf_unpin,
+	.mmap = tegra_se_cmdbuf_mmap,
+	.munmap = tegra_se_cmdbuf_munmap,
+};
+
+static struct tegra_se_cmdbuf *tegra_se_host1x_bo_alloc(struct tegra_se *se, ssize_t size)
+{
+	struct tegra_se_cmdbuf *cmdbuf;
+	struct device *dev = se->dev->parent;
+
+	cmdbuf = kzalloc(sizeof(*cmdbuf), GFP_KERNEL);
+	if (!cmdbuf)
+		return NULL;
+
+	cmdbuf->addr = dma_alloc_attrs(dev, size, &cmdbuf->iova,
+				       GFP_KERNEL, 0);
+	if (!cmdbuf->addr)
+		return NULL;
+
+	cmdbuf->size = size;
+	cmdbuf->dev  = dev;
+
+	host1x_bo_init(&cmdbuf->bo, &tegra_se_cmdbuf_ops);
+	kref_init(&cmdbuf->ref);
+
+	return cmdbuf;
+}
+
+int tegra_se_host1x_submit(struct tegra_se *se, u32 size)
+{
+	struct host1x_job *job;
+	int ret;
+
+	job = host1x_job_alloc(se->channel, 1, 0, true);
+	if (!job) {
+		dev_err(se->dev, "failed to allocate host1x job\n");
+		return -ENOMEM;
+	}
+
+	job->syncpt = host1x_syncpt_get(se->syncpt);
+	job->syncpt_incrs = 1;
+	job->client = &se->client;
+	job->class = se->client.class;
+	job->serialize = true;
+	job->engine_fallback_streamid = se->stream_id;
+	job->engine_streamid_offset = SE_STREAM_ID;
+
+	se->cmdbuf->words = size;
+
+	host1x_job_add_gather(job, &se->cmdbuf->bo, size, 0);
+
+	ret = host1x_job_pin(job, se->dev);
+	if (ret) {
+		dev_err(se->dev, "failed to pin host1x job\n");
+		goto job_put;
+	}
+
+	ret = host1x_job_submit(job);
+	if (ret) {
+		dev_err(se->dev, "failed to submit host1x job\n");
+		goto job_unpin;
+	}
+
+	ret = host1x_syncpt_wait(job->syncpt, job->syncpt_end,
+				 MAX_SCHEDULE_TIMEOUT, NULL);
+	if (ret) {
+		dev_err(se->dev, "host1x job timed out\n");
+		return ret;
+	}
+
+	host1x_job_put(job);
+	return 0;
+
+job_unpin:
+	host1x_job_unpin(job);
+job_put:
+	host1x_job_put(job);
+
+	return ret;
+}
+
+static int tegra_se_client_init(struct host1x_client *client)
+{
+	struct tegra_se *se = container_of(client, struct tegra_se, client);
+	int ret;
+
+	se->channel = host1x_channel_request(&se->client);
+	if (!se->channel) {
+		dev_err(se->dev, "host1x channel map failed\n");
+		return -ENODEV;
+	}
+
+	se->syncpt = host1x_syncpt_request(&se->client, 0);
+	if (!se->syncpt) {
+		dev_err(se->dev, "host1x syncpt allocation failed\n");
+		ret = -EINVAL;
+		goto channel_put;
+	}
+
+	se->syncpt_id =  host1x_syncpt_id(se->syncpt);
+
+	se->cmdbuf = tegra_se_host1x_bo_alloc(se, SZ_4K);
+	if (!se->cmdbuf) {
+		ret = -ENOMEM;
+		goto syncpt_put;
+	}
+
+	ret = se->hw->init_alg(se);
+	if (ret) {
+		dev_err(se->dev, "failed to register algorithms\n");
+		goto cmdbuf_put;
+	}
+
+	return 0;
+
+cmdbuf_put:
+	tegra_se_cmdbuf_put(&se->cmdbuf->bo);
+syncpt_put:
+	host1x_syncpt_put(se->syncpt);
+channel_put:
+	host1x_channel_put(se->channel);
+
+	return ret;
+}
+
+static int tegra_se_client_deinit(struct host1x_client *client)
+{
+	struct tegra_se *se = container_of(client, struct tegra_se, client);
+
+	se->hw->deinit_alg(se);
+	tegra_se_cmdbuf_put(&se->cmdbuf->bo);
+	host1x_syncpt_put(se->syncpt);
+	host1x_channel_put(se->channel);
+
+	return 0;
+}
+
+static const struct host1x_client_ops tegra_se_client_ops = {
+	.init = tegra_se_client_init,
+	.exit = tegra_se_client_deinit,
+};
+
+static int tegra_se_host1x_register(struct tegra_se *se)
+{
+	INIT_LIST_HEAD(&se->client.list);
+	se->client.dev = se->dev;
+	se->client.ops = &tegra_se_client_ops;
+	se->client.class = se->hw->host1x_class;
+	se->client.num_syncpts = 1;
+
+	host1x_client_register(&se->client);
+
+	return 0;
+}
+
+static int tegra_se_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct tegra_se *se;
+	int ret;
+
+	se = devm_kzalloc(dev, sizeof(*se), GFP_KERNEL);
+	if (!se)
+		return -ENOMEM;
+
+	se->dev = dev;
+	se->owner = TEGRA_GPSE_ID;
+	se->hw = device_get_match_data(&pdev->dev);
+
+	se->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(se->base))
+		return PTR_ERR(se->base);
+
+	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(39));
+	platform_set_drvdata(pdev, se);
+
+	se->clk = devm_clk_get_enabled(se->dev, NULL);
+	if (IS_ERR(se->clk))
+		return dev_err_probe(dev, PTR_ERR(se->clk),
+				"failed to enable clocks\n");
+
+	if (!tegra_dev_iommu_get_stream_id(dev, &se->stream_id))
+		return dev_err_probe(dev, -ENODEV,
+				"failed to get IOMMU stream ID\n");
+
+	writel(se->stream_id, se->base + SE_STREAM_ID);
+
+	se->engine = crypto_engine_alloc_init(dev, 0);
+	if (!se->engine)
+		return dev_err_probe(dev, -ENOMEM, "failed to init crypto engine\n");
+
+	ret = crypto_engine_start(se->engine);
+	if (ret) {
+		crypto_engine_exit(se->engine);
+		return dev_err_probe(dev, ret, "failed to start crypto engine\n");
+	}
+
+	ret = tegra_se_host1x_register(se);
+	if (ret) {
+		crypto_engine_stop(se->engine);
+		crypto_engine_exit(se->engine);
+		return dev_err_probe(dev, ret, "failed to init host1x params\n");
+	}
+
+	return 0;
+}
+
+static int tegra_se_remove(struct platform_device *pdev)
+{
+	struct tegra_se *se = platform_get_drvdata(pdev);
+
+	crypto_engine_stop(se->engine);
+	crypto_engine_exit(se->engine);
+	iommu_fwspec_free(se->dev);
+	host1x_client_unregister(&se->client);
+
+	return 0;
+}
+
+static const struct tegra_se_regs tegra234_aes1_regs = {
+	.config = SE_AES1_CFG,
+	.op = SE_AES1_OPERATION,
+	.last_blk = SE_AES1_LAST_BLOCK,
+	.linear_ctr = SE_AES1_LINEAR_CTR,
+	.aad_len = SE_AES1_AAD_LEN,
+	.cryp_msg_len = SE_AES1_CRYPTO_MSG_LEN,
+	.manifest = SE_AES1_KEYMANIFEST,
+	.key_addr = SE_AES1_KEY_ADDR,
+	.key_data = SE_AES1_KEY_DATA,
+	.key_dst = SE_AES1_KEY_DST,
+	.result = SE_AES1_CMAC_RESULT,
+};
+
+static const struct tegra_se_regs tegra234_hash_regs = {
+	.config = SE_SHA_CFG,
+	.op = SE_SHA_OPERATION,
+	.manifest = SE_SHA_KEYMANIFEST,
+	.key_addr = SE_SHA_KEY_ADDR,
+	.key_data = SE_SHA_KEY_DATA,
+	.key_dst = SE_SHA_KEY_DST,
+	.result = SE_SHA_HASH_RESULT,
+};
+
+static const struct tegra_se_hw tegra234_aes_hw = {
+	.regs = &tegra234_aes1_regs,
+	.kac_ver = 1,
+	.host1x_class = 0x3b,
+	.init_alg = tegra_init_aes,
+	.deinit_alg = tegra_deinit_aes,
+};
+
+static const struct tegra_se_hw tegra234_hash_hw = {
+	.regs = &tegra234_hash_regs,
+	.kac_ver = 1,
+	.host1x_class = 0x3d,
+	.init_alg = tegra_init_hash,
+	.deinit_alg = tegra_deinit_hash,
+};
+
+static const struct of_device_id tegra_se_of_match[] = {
+	{
+		.compatible = "nvidia,tegra234-se-aes",
+		.data = &tegra234_aes_hw
+	}, {
+		.compatible = "nvidia,tegra234-se-hash",
+		.data = &tegra234_hash_hw,
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, tegra_se_of_match);
+
+static struct platform_driver tegra_se_driver = {
+	.driver = {
+		.name	= "tegra-se",
+		.of_match_table = tegra_se_of_match,
+	},
+	.probe		= tegra_se_probe,
+	.remove		= tegra_se_remove,
+};
+
+static int tegra_se_host1x_probe(struct host1x_device *dev)
+{
+	return host1x_device_init(dev);
+}
+
+static int tegra_se_host1x_remove(struct host1x_device *dev)
+{
+	host1x_device_exit(dev);
+
+	return 0;
+}
+
+static struct host1x_driver tegra_se_host1x_driver = {
+	.driver = {
+		.name = "tegra-se-host1x",
+	},
+	.probe = tegra_se_host1x_probe,
+	.remove = tegra_se_host1x_remove,
+	.subdevs = tegra_se_of_match,
+};
+
+static int __init tegra_se_module_init(void)
+{
+	int ret;
+
+	ret = host1x_driver_register(&tegra_se_host1x_driver);
+	if (ret)
+		return ret;
+
+	return platform_driver_register(&tegra_se_driver);
+}
+
+static void __exit tegra_se_module_exit(void)
+{
+	host1x_driver_unregister(&tegra_se_host1x_driver);
+	platform_driver_unregister(&tegra_se_driver);
+}
+
+module_init(tegra_se_module_init);
+module_exit(tegra_se_module_exit);
+
+MODULE_DESCRIPTION("NVIDIA Tegra Security Engine Driver");
+MODULE_AUTHOR("Akhil R <akhilrajeev@nvidia.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/crypto/tegra/tegra-se.h b/drivers/crypto/tegra/tegra-se.h
new file mode 100644
index 000000000000..75ad7af21c43
--- /dev/null
+++ b/drivers/crypto/tegra/tegra-se.h
@@ -0,0 +1,569 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ * SPDX-FileCopyrightText: Copyright (c) 2023 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ *
+ * Header file for NVIDIA Security Engine driver.
+ */
+
+#ifndef _TEGRA_SE_H
+#define _TEGRA_SE_H
+
+#include <linux/bitfield.h>
+#include <linux/iommu.h>
+#include <linux/host1x.h>
+#include <crypto/aead.h>
+#include <crypto/engine.h>
+#include <crypto/hash.h>
+#include <crypto/sha1.h>
+#include <crypto/sha3.h>
+#include <crypto/skcipher.h>
+
+#define SE_OWNERSHIP					0x14
+#define SE_OWNERSHIP_UID(x)				FIELD_GET(GENMASK(7, 0), x)
+#define TEGRA_GPSE_ID					3
+
+#define SE_STREAM_ID					0x90
+
+#define SE_SHA_CFG					0x4004
+#define SE_SHA_KEY_ADDR					0x4094
+#define SE_SHA_KEY_DATA					0x4098
+#define SE_SHA_KEYMANIFEST				0x409c
+#define SE_SHA_CRYPTO_CFG				0x40a4
+#define SE_SHA_KEY_DST					0x40a8
+#define SE_SHA_SRC_KSLT					0x4180
+#define SE_SHA_TGT_KSLT					0x4184
+#define SE_SHA_MSG_LENGTH				0x401c
+#define SE_SHA_OPERATION				0x407c
+#define SE_SHA_HASH_RESULT				0x40b0
+
+#define SE_SHA_ENC_MODE(x)				FIELD_PREP(GENMASK(31, 24), x)
+#define SE_SHA_ENC_MODE_SHA1				SE_SHA_ENC_MODE(0)
+#define SE_SHA_ENC_MODE_SHA224				SE_SHA_ENC_MODE(4)
+#define SE_SHA_ENC_MODE_SHA256				SE_SHA_ENC_MODE(5)
+#define SE_SHA_ENC_MODE_SHA384				SE_SHA_ENC_MODE(6)
+#define SE_SHA_ENC_MODE_SHA512				SE_SHA_ENC_MODE(7)
+#define SE_SHA_ENC_MODE_SHA_CTX_INTEGRITY		SE_SHA_ENC_MODE(8)
+#define SE_SHA_ENC_MODE_SHA3_224			SE_SHA_ENC_MODE(9)
+#define SE_SHA_ENC_MODE_SHA3_256			SE_SHA_ENC_MODE(10)
+#define SE_SHA_ENC_MODE_SHA3_384			SE_SHA_ENC_MODE(11)
+#define SE_SHA_ENC_MODE_SHA3_512			SE_SHA_ENC_MODE(12)
+#define SE_SHA_ENC_MODE_SHAKE128			SE_SHA_ENC_MODE(13)
+#define SE_SHA_ENC_MODE_SHAKE256			SE_SHA_ENC_MODE(14)
+#define SE_SHA_ENC_MODE_HMAC_SHA256_1KEY		SE_SHA_ENC_MODE(0)
+#define SE_SHA_ENC_MODE_HMAC_SHA256_2KEY		SE_SHA_ENC_MODE(1)
+#define SE_SHA_ENC_MODE_SM3_256				SE_SHA_ENC_MODE(0)
+
+#define SE_SHA_CFG_ENC_ALG(x)				FIELD_PREP(GENMASK(15, 12), x)
+#define SE_SHA_ENC_ALG_NOP				SE_SHA_CFG_ENC_ALG(0)
+#define SE_SHA_ENC_ALG_SHA_ENC				SE_SHA_CFG_ENC_ALG(1)
+#define SE_SHA_ENC_ALG_RNG				SE_SHA_CFG_ENC_ALG(2)
+#define SE_SHA_ENC_ALG_SHA				SE_SHA_CFG_ENC_ALG(3)
+#define SE_SHA_ENC_ALG_SM3				SE_SHA_CFG_ENC_ALG(4)
+#define SE_SHA_ENC_ALG_HMAC				SE_SHA_CFG_ENC_ALG(7)
+#define SE_SHA_ENC_ALG_KDF				SE_SHA_CFG_ENC_ALG(8)
+#define SE_SHA_ENC_ALG_KEY_INVLD			SE_SHA_CFG_ENC_ALG(10)
+#define SE_SHA_ENC_ALG_KEY_INQUIRE			SE_SHA_CFG_ENC_ALG(12)
+#define SE_SHA_ENC_ALG_INS				SE_SHA_CFG_ENC_ALG(13)
+
+#define SE_SHA_OP_LASTBUF				FIELD_PREP(BIT(16), 1)
+#define SE_SHA_OP_WRSTALL				FIELD_PREP(BIT(15), 1)
+
+#define SE_SHA_OP_OP(x)					FIELD_PREP(GENMASK(2, 0), x)
+#define SE_SHA_OP_START					SE_SHA_OP_OP(1)
+#define SE_SHA_OP_RESTART_OUT				SE_SHA_OP_OP(2)
+#define SE_SHA_OP_RESTART_IN				SE_SHA_OP_OP(4)
+#define SE_SHA_OP_RESTART_INOUT				SE_SHA_OP_OP(5)
+#define SE_SHA_OP_DUMMY					SE_SHA_OP_OP(6)
+
+#define SE_SHA_CFG_DEC_ALG(x)				FIELD_PREP(GENMASK(11, 8), x)
+#define SE_SHA_DEC_ALG_NOP				SE_SHA_CFG_DEC_ALG(0)
+#define SE_SHA_DEC_ALG_AES_DEC				SE_SHA_CFG_DEC_ALG(1)
+#define SE_SHA_DEC_ALG_HMAC				SE_SHA_CFG_DEC_ALG(7)
+#define SE_SHA_DEC_ALG_HMAC_VERIFY			SE_SHA_CFG_DEC_ALG(9)
+
+#define SE_SHA_CFG_DST(x)				FIELD_PREP(GENMASK(4, 2), x)
+#define SE_SHA_DST_MEMORY				SE_SHA_CFG_DST(0)
+#define SE_SHA_DST_HASH_REG				SE_SHA_CFG_DST(1)
+#define SE_SHA_DST_KEYTABLE				SE_SHA_CFG_DST(2)
+#define SE_SHA_DST_SRK					SE_SHA_CFG_DST(3)
+
+#define SE_SHA_TASK_HASH_INIT				BIT(0)
+
+/* AES Configuration */
+#define SE_AES0_CFG					0x1004
+#define SE_AES0_CRYPTO_CONFIG				0x1008
+#define SE_AES0_KEY_DST					0x1030
+#define SE_AES0_OPERATION				0x1038
+#define SE_AES0_LINEAR_CTR				0x101c
+#define SE_AES0_LAST_BLOCK				0x102c
+#define SE_AES0_KEY_ADDR				0x10bc
+#define SE_AES0_KEY_DATA				0x10c0
+#define SE_AES0_CMAC_RESULT				0x10c4
+#define SE_AES0_SRC_KSLT				0x1100
+#define SE_AES0_TGT_KSLT				0x1104
+#define SE_AES0_KEYMANIFEST				0x1114
+#define SE_AES0_AAD_LEN					0x112c
+#define SE_AES0_CRYPTO_MSG_LEN				0x1134
+
+#define SE_AES1_CFG					0x2004
+#define SE_AES1_CRYPTO_CONFIG				0x2008
+#define SE_AES1_KEY_DST					0x2030
+#define SE_AES1_OPERATION				0x2038
+#define SE_AES1_LINEAR_CTR				0x201c
+#define SE_AES1_LAST_BLOCK				0x202c
+#define SE_AES1_KEY_ADDR				0x20bc
+#define SE_AES1_KEY_DATA				0x20c0
+#define SE_AES1_CMAC_RESULT				0x20c4
+#define SE_AES1_SRC_KSLT				0x2100
+#define SE_AES1_TGT_KSLT				0x2104
+#define SE_AES1_KEYMANIFEST				0x2114
+#define SE_AES1_AAD_LEN					0x212c
+#define SE_AES1_CRYPTO_MSG_LEN				0x2134
+
+#define SE_AES_CFG_ENC_MODE(x)				FIELD_PREP(GENMASK(31, 24), x)
+#define SE_AES_ENC_MODE_GMAC				SE_AES_CFG_ENC_MODE(3)
+#define SE_AES_ENC_MODE_GCM				SE_AES_CFG_ENC_MODE(4)
+#define SE_AES_ENC_MODE_GCM_FINAL			SE_AES_CFG_ENC_MODE(5)
+#define SE_AES_ENC_MODE_CMAC				SE_AES_CFG_ENC_MODE(7)
+#define SE_AES_ENC_MODE_CBC_MAC				SE_AES_CFG_ENC_MODE(12)
+
+#define SE_AES_CFG_DEC_MODE(x)				FIELD_PREP(GENMASK(23, 16), x)
+#define SE_AES_DEC_MODE_GMAC				SE_AES_CFG_DEC_MODE(3)
+#define SE_AES_DEC_MODE_GCM				SE_AES_CFG_DEC_MODE(4)
+#define SE_AES_DEC_MODE_GCM_FINAL			SE_AES_CFG_DEC_MODE(5)
+#define SE_AES_DEC_MODE_CBC_MAC				SE_AES_CFG_DEC_MODE(12)
+
+#define SE_AES_CFG_ENC_ALG(x)				FIELD_PREP(GENMASK(15, 12), x)
+#define SE_AES_ENC_ALG_NOP				SE_AES_CFG_ENC_ALG(0)
+#define SE_AES_ENC_ALG_AES_ENC				SE_AES_CFG_ENC_ALG(1)
+#define SE_AES_ENC_ALG_RNG				SE_AES_CFG_ENC_ALG(2)
+#define SE_AES_ENC_ALG_SHA				SE_AES_CFG_ENC_ALG(3)
+#define SE_AES_ENC_ALG_HMAC				SE_AES_CFG_ENC_ALG(7)
+#define SE_AES_ENC_ALG_KDF				SE_AES_CFG_ENC_ALG(8)
+#define SE_AES_ENC_ALG_INS				SE_AES_CFG_ENC_ALG(13)
+
+#define SE_AES_CFG_DEC_ALG(x)				FIELD_PREP(GENMASK(11, 8), x)
+#define SE_AES_DEC_ALG_NOP				SE_AES_CFG_DEC_ALG(0)
+#define SE_AES_DEC_ALG_AES_DEC				SE_AES_CFG_DEC_ALG(1)
+
+#define SE_AES_CFG_DST(x)				FIELD_PREP(GENMASK(4, 2), x)
+#define SE_AES_DST_MEMORY				SE_AES_CFG_DST(0)
+#define SE_AES_DST_HASH_REG				SE_AES_CFG_DST(1)
+#define SE_AES_DST_KEYTABLE				SE_AES_CFG_DST(2)
+#define SE_AES_DST_SRK					SE_AES_CFG_DST(3)
+
+/* AES Crypto Configuration */
+#define SE_AES_KEY2_INDEX(x)				FIELD_PREP(GENMASK(31, 28), x)
+#define SE_AES_KEY_INDEX(x)				FIELD_PREP(GENMASK(27, 24), x)
+
+#define SE_AES_CRYPTO_CFG_SCC_DIS			FIELD_PREP(BIT(20), 1)
+
+#define SE_AES_CRYPTO_CFG_CTR_CNTN(x)			FIELD_PREP(GENMASK(18, 11), x)
+
+#define SE_AES_CRYPTO_CFG_IV_MODE(x)			FIELD_PREP(BIT(10), x)
+#define SE_AES_IV_MODE_SWIV				SE_AES_CRYPTO_CFG_IV_MODE(0)
+#define SE_AES_IV_MODE_HWIV				SE_AES_CRYPTO_CFG_IV_MODE(1)
+
+#define SE_AES_CRYPTO_CFG_CORE_SEL(x)			FIELD_PREP(BIT(9), x)
+#define SE_AES_CORE_SEL_DECRYPT				SE_AES_CRYPTO_CFG_CORE_SEL(0)
+#define SE_AES_CORE_SEL_ENCRYPT				SE_AES_CRYPTO_CFG_CORE_SEL(1)
+
+#define SE_AES_CRYPTO_CFG_IV_SEL(x)			FIELD_PREP(GENMASK(8, 7), x)
+#define SE_AES_IV_SEL_UPDATED				SE_AES_CRYPTO_CFG_IV_SEL(1)
+#define SE_AES_IV_SEL_REG				SE_AES_CRYPTO_CFG_IV_SEL(2)
+#define SE_AES_IV_SEL_RANDOM				SE_AES_CRYPTO_CFG_IV_SEL(3)
+
+#define SE_AES_CRYPTO_CFG_VCTRAM_SEL(x)			FIELD_PREP(GENMASK(6, 5), x)
+#define SE_AES_VCTRAM_SEL_MEMORY			SE_AES_CRYPTO_CFG_VCTRAM_SEL(0)
+#define SE_AES_VCTRAM_SEL_TWEAK				SE_AES_CRYPTO_CFG_VCTRAM_SEL(1)
+#define SE_AES_VCTRAM_SEL_AESOUT			SE_AES_CRYPTO_CFG_VCTRAM_SEL(2)
+#define SE_AES_VCTRAM_SEL_PREV_MEM			SE_AES_CRYPTO_CFG_VCTRAM_SEL(3)
+
+#define SE_AES_CRYPTO_CFG_INPUT_SEL(x)			FIELD_PREP(GENMASK(4, 3), x)
+#define SE_AES_INPUT_SEL_MEMORY				SE_AES_CRYPTO_CFG_INPUT_SEL(0)
+#define SE_AES_INPUT_SEL_RANDOM				SE_AES_CRYPTO_CFG_INPUT_SEL(1)
+#define SE_AES_INPUT_SEL_AESOUT				SE_AES_CRYPTO_CFG_INPUT_SEL(2)
+#define SE_AES_INPUT_SEL_LINEAR_CTR			SE_AES_CRYPTO_CFG_INPUT_SEL(3)
+#define SE_AES_INPUT_SEL_REG				SE_AES_CRYPTO_CFG_INPUT_SEL(1)
+
+#define SE_AES_CRYPTO_CFG_XOR_POS(x)			FIELD_PREP(GENMASK(2, 1), x)
+#define SE_AES_XOR_POS_BYPASS				SE_AES_CRYPTO_CFG_XOR_POS(0)
+#define SE_AES_XOR_POS_BOTH				SE_AES_CRYPTO_CFG_XOR_POS(1)
+#define SE_AES_XOR_POS_TOP				SE_AES_CRYPTO_CFG_XOR_POS(2)
+#define SE_AES_XOR_POS_BOTTOM				SE_AES_CRYPTO_CFG_XOR_POS(3)
+
+#define SE_AES_CRYPTO_CFG_HASH_EN(x)			FIELD_PREP(BIT(0), x)
+#define SE_AES_HASH_DISABLE				SE_AES_CRYPTO_CFG_HASH_EN(0)
+#define SE_AES_HASH_ENABLE				SE_AES_CRYPTO_CFG_HASH_EN(1)
+
+#define SE_LAST_BLOCK_VAL(x)				FIELD_PREP(GENMASK(19, 0), x)
+#define SE_LAST_BLOCK_RES_BITS(x)			FIELD_PREP(GENMASK(26, 20), x)
+
+#define SE_AES_OP_LASTBUF				FIELD_PREP(BIT(16), 1)
+#define SE_AES_OP_WRSTALL				FIELD_PREP(BIT(15), 1)
+#define SE_AES_OP_FINAL					FIELD_PREP(BIT(5), 1)
+#define SE_AES_OP_INIT					FIELD_PREP(BIT(4), 1)
+
+#define SE_AES_OP_OP(x)					FIELD_PREP(GENMASK(2, 0), x)
+#define SE_AES_OP_START					SE_AES_OP_OP(1)
+#define SE_AES_OP_RESTART_OUT				SE_AES_OP_OP(2)
+#define SE_AES_OP_RESTART_IN				SE_AES_OP_OP(4)
+#define SE_AES_OP_RESTART_INOUT				SE_AES_OP_OP(5)
+#define SE_AES_OP_DUMMY					SE_AES_OP_OP(6)
+
+#define SE_KAC_SIZE(x)					FIELD_PREP(GENMASK(15, 14), x)
+#define SE_KAC_SIZE_128					SE_KAC_SIZE(0)
+#define SE_KAC_SIZE_192					SE_KAC_SIZE(1)
+#define SE_KAC_SIZE_256					SE_KAC_SIZE(2)
+
+#define SE_KAC_EXPORTABLE				FIELD_PREP(BIT(12), 1)
+
+#define SE_KAC_PURPOSE(x)				FIELD_PREP(GENMASK(11, 8), x)
+#define SE_KAC_ENC					SE_KAC_PURPOSE(0)
+#define SE_KAC_CMAC					SE_KAC_PURPOSE(1)
+#define SE_KAC_HMAC					SE_KAC_PURPOSE(2)
+#define SE_KAC_GCM_KW					SE_KAC_PURPOSE(3)
+#define SE_KAC_HMAC_KDK					SE_KAC_PURPOSE(6)
+#define SE_KAC_HMAC_KDD					SE_KAC_PURPOSE(7)
+#define SE_KAC_HMAC_KDD_KUW				SE_KAC_PURPOSE(8)
+#define SE_KAC_XTS					SE_KAC_PURPOSE(9)
+#define SE_KAC_GCM					SE_KAC_PURPOSE(10)
+
+#define SE_KAC_USER_NS					FIELD_PREP(GENMASK(6, 4), 3)
+
+#define SE_AES_KEY_DST_INDEX(x)				FIELD_PREP(GENMASK(11, 8), x)
+#define SE_ADDR_HI_MSB(x)				FIELD_PREP(GENMASK(31, 24), x)
+#define SE_ADDR_HI_SZ(x)				FIELD_PREP(GENMASK(23, 0), x)
+
+#define SE_CFG_AES_ENCRYPT				(SE_AES_ENC_ALG_AES_ENC | \
+							 SE_AES_DEC_ALG_NOP | \
+							 SE_AES_DST_MEMORY)
+
+#define SE_CFG_AES_DECRYPT				(SE_AES_ENC_ALG_NOP | \
+							 SE_AES_DEC_ALG_AES_DEC | \
+							 SE_AES_DST_MEMORY)
+
+#define SE_CFG_GMAC_ENCRYPT				(SE_AES_ENC_ALG_AES_ENC | \
+							 SE_AES_DEC_ALG_NOP | \
+							 SE_AES_ENC_MODE_GMAC | \
+							 SE_AES_DST_MEMORY)
+
+#define SE_CFG_GMAC_DECRYPT				(SE_AES_ENC_ALG_NOP | \
+							 SE_AES_DEC_ALG_AES_DEC | \
+							 SE_AES_DEC_MODE_GMAC | \
+							 SE_AES_DST_MEMORY)
+
+#define SE_CFG_GCM_ENCRYPT				(SE_AES_ENC_ALG_AES_ENC | \
+							 SE_AES_DEC_ALG_NOP | \
+							 SE_AES_ENC_MODE_GCM | \
+							 SE_AES_DST_MEMORY)
+
+#define SE_CFG_GCM_DECRYPT				(SE_AES_ENC_ALG_NOP | \
+							 SE_AES_DEC_ALG_AES_DEC | \
+							 SE_AES_DEC_MODE_GCM | \
+							 SE_AES_DST_MEMORY)
+
+#define SE_CFG_GCM_FINAL_ENCRYPT			(SE_AES_ENC_ALG_AES_ENC | \
+							 SE_AES_DEC_ALG_NOP | \
+							 SE_AES_ENC_MODE_GCM_FINAL | \
+							 SE_AES_DST_MEMORY)
+
+#define SE_CFG_GCM_FINAL_DECRYPT			(SE_AES_ENC_ALG_NOP | \
+							 SE_AES_DEC_ALG_AES_DEC | \
+							 SE_AES_DEC_MODE_GCM_FINAL | \
+							 SE_AES_DST_MEMORY)
+
+#define SE_CFG_CMAC					(SE_AES_ENC_ALG_AES_ENC | \
+							 SE_AES_ENC_MODE_CMAC | \
+							 SE_AES_DST_HASH_REG)
+
+#define SE_CFG_CBC_MAC					(SE_AES_ENC_ALG_AES_ENC | \
+							 SE_AES_ENC_MODE_CBC_MAC)
+
+#define SE_CFG_INS					(SE_AES_ENC_ALG_INS | \
+							 SE_AES_DEC_ALG_NOP)
+
+#define SE_CRYPTO_CFG_ECB_ENCRYPT			(SE_AES_INPUT_SEL_MEMORY | \
+							 SE_AES_XOR_POS_BYPASS | \
+							 SE_AES_CORE_SEL_ENCRYPT)
+
+#define SE_CRYPTO_CFG_ECB_DECRYPT			(SE_AES_INPUT_SEL_MEMORY | \
+							 SE_AES_XOR_POS_BYPASS | \
+							 SE_AES_CORE_SEL_DECRYPT)
+
+#define SE_CRYPTO_CFG_CBC_ENCRYPT			(SE_AES_INPUT_SEL_MEMORY | \
+							 SE_AES_VCTRAM_SEL_AESOUT | \
+							 SE_AES_XOR_POS_TOP | \
+							 SE_AES_CORE_SEL_ENCRYPT | \
+							 SE_AES_IV_SEL_REG)
+
+#define SE_CRYPTO_CFG_CBC_DECRYPT			(SE_AES_INPUT_SEL_MEMORY | \
+							 SE_AES_VCTRAM_SEL_PREV_MEM | \
+							 SE_AES_XOR_POS_BOTTOM | \
+							 SE_AES_CORE_SEL_DECRYPT | \
+							 SE_AES_IV_SEL_REG)
+
+#define SE_CRYPTO_CFG_OFB				(SE_AES_INPUT_SEL_AESOUT | \
+							 SE_AES_VCTRAM_SEL_MEMORY | \
+							 SE_AES_XOR_POS_BOTTOM | \
+							 SE_AES_CORE_SEL_ENCRYPT | \
+							 SE_AES_IV_SEL_REG)
+
+#define SE_CRYPTO_CFG_CTR				(SE_AES_INPUT_SEL_LINEAR_CTR | \
+							 SE_AES_VCTRAM_SEL_MEMORY | \
+							 SE_AES_XOR_POS_BOTTOM | \
+							 SE_AES_CORE_SEL_ENCRYPT | \
+							 SE_AES_CRYPTO_CFG_CTR_CNTN(1) | \
+							 SE_AES_IV_SEL_REG)
+
+#define SE_CRYPTO_CFG_XTS_ENCRYPT			(SE_AES_INPUT_SEL_MEMORY | \
+							 SE_AES_VCTRAM_SEL_TWEAK | \
+							 SE_AES_XOR_POS_BOTH | \
+							 SE_AES_CORE_SEL_ENCRYPT | \
+							 SE_AES_IV_SEL_REG)
+
+#define SE_CRYPTO_CFG_XTS_DECRYPT			(SE_AES_INPUT_SEL_MEMORY | \
+							 SE_AES_VCTRAM_SEL_TWEAK | \
+							 SE_AES_XOR_POS_BOTH | \
+							 SE_AES_CORE_SEL_DECRYPT | \
+							 SE_AES_IV_SEL_REG)
+
+#define SE_CRYPTO_CFG_XTS_DECRYPT			(SE_AES_INPUT_SEL_MEMORY | \
+							 SE_AES_VCTRAM_SEL_TWEAK | \
+							 SE_AES_XOR_POS_BOTH | \
+							 SE_AES_CORE_SEL_DECRYPT | \
+							 SE_AES_IV_SEL_REG)
+
+#define SE_CRYPTO_CFG_CBC_MAC				(SE_AES_INPUT_SEL_MEMORY | \
+							 SE_AES_VCTRAM_SEL_AESOUT | \
+							 SE_AES_XOR_POS_TOP | \
+							 SE_AES_CORE_SEL_ENCRYPT | \
+							 SE_AES_HASH_ENABLE | \
+							 SE_AES_IV_SEL_REG)
+
+#define HASH_RESULT_REG_COUNT				50
+#define CMAC_RESULT_REG_COUNT				4
+
+#define SE_CRYPTO_CTR_REG_COUNT			4
+#define SE_MAX_KEYSLOT				15
+#define SE_MAX_MEM_ALLOC			SZ_4M
+#define SE_AES_BUFLEN				0x8000
+#define SE_SHA_BUFLEN				0x2000
+
+#define SHA_FIRST	BIT(0)
+#define SHA_UPDATE	BIT(1)
+#define SHA_FINAL	BIT(2)
+
+/* Security Engine operation modes */
+enum se_aes_alg {
+	SE_ALG_CBC,		/* Cipher Block Chaining (CBC) mode */
+	SE_ALG_ECB,		/* Electronic Codebook (ECB) mode */
+	SE_ALG_CTR,		/* Counter (CTR) mode */
+	SE_ALG_OFB,		/* Output feedback (CFB) mode */
+	SE_ALG_XTS,		/* XTS mode */
+	SE_ALG_GMAC,		/* GMAC mode */
+	SE_ALG_GCM,		/* GCM mode */
+	SE_ALG_GCM_FINAL,	/* GCM FINAL mode */
+	SE_ALG_CMAC,	/* Cipher-based MAC (CMAC) mode */
+	SE_ALG_CBC_MAC,	/* CBC MAC mode */
+};
+
+enum se_hash_alg {
+	SE_ALG_RNG_DRBG,	/* Deterministic Random Bit Generator */
+	SE_ALG_SHA1,		/* Secure Hash Algorithm-1 (SHA1) mode */
+	SE_ALG_SHA224,		/* Secure Hash Algorithm-224  (SHA224) mode */
+	SE_ALG_SHA256,		/* Secure Hash Algorithm-256  (SHA256) mode */
+	SE_ALG_SHA384,		/* Secure Hash Algorithm-384  (SHA384) mode */
+	SE_ALG_SHA512,		/* Secure Hash Algorithm-512  (SHA512) mode */
+	SE_ALG_SHA3_224,	/* Secure Hash Algorithm3-224 (SHA3-224) mode */
+	SE_ALG_SHA3_256,	/* Secure Hash Algorithm3-256 (SHA3-256) mode */
+	SE_ALG_SHA3_384,	/* Secure Hash Algorithm3-384 (SHA3-384) mode */
+	SE_ALG_SHA3_512,	/* Secure Hash Algorithm3-512 (SHA3-512) mode */
+	SE_ALG_SHAKE128,	/* Secure Hash Algorithm3 (SHAKE128) mode */
+	SE_ALG_SHAKE256,	/* Secure Hash Algorithm3 (SHAKE256) mode */
+	SE_ALG_HMAC_SHA224,	/* Hash based MAC (HMAC) - 224 */
+	SE_ALG_HMAC_SHA256,	/* Hash based MAC (HMAC) - 256 */
+	SE_ALG_HMAC_SHA384,	/* Hash based MAC (HMAC) - 384 */
+	SE_ALG_HMAC_SHA512,	/* Hash based MAC (HMAC) - 512 */
+};
+
+struct tegra_se_alg {
+	struct tegra_se *se_dev;
+	const char *alg_base;
+
+	union {
+		struct skcipher_engine_alg skcipher;
+		struct aead_engine_alg aead;
+		struct ahash_engine_alg ahash;
+	} alg;
+};
+
+struct tegra_se_regs {
+	u32 op;
+	u32 config;
+	u32 last_blk;
+	u32 linear_ctr;
+	u32 out_addr;
+	u32 aad_len;
+	u32 cryp_msg_len;
+	u32 manifest;
+	u32 key_addr;
+	u32 key_data;
+	u32 key_dst;
+	u32 result;
+};
+
+struct tegra_se_hw {
+	const struct tegra_se_regs *regs;
+	int (*init_alg)(struct tegra_se *se);
+	void (*deinit_alg)(struct tegra_se *se);
+	bool support_sm_alg;
+	u32 host1x_class;
+	u32 kac_ver;
+};
+
+struct tegra_se {
+	int (*manifest)(u32 user, u32 alg, u32 keylen);
+	const struct tegra_se_hw *hw;
+	struct host1x_client client;
+	struct host1x_channel *channel;
+	struct tegra_se_cmdbuf *cmdbuf;
+	struct crypto_engine *engine;
+	struct host1x_syncpt *syncpt;
+	struct device *dev;
+	struct clk *clk;
+	unsigned int opcode_addr;
+	unsigned int stream_id;
+	unsigned int syncpt_id;
+	void __iomem *base;
+	u32 owner;
+};
+
+struct tegra_se_cmdbuf {
+	dma_addr_t iova;
+	u32 *addr;
+	struct device *dev;
+	struct kref ref;
+	struct host1x_bo bo;
+	ssize_t size;
+	u32 words;
+};
+
+struct tegra_se_datbuf {
+	u8 *buf;
+	dma_addr_t addr;
+	ssize_t size;
+};
+
+static inline int se_algname_to_algid(const char *name)
+{
+	if (!strcmp(name, "cbc(aes)"))
+		return SE_ALG_CBC;
+	else if (!strcmp(name, "ecb(aes)"))
+		return SE_ALG_ECB;
+	else if (!strcmp(name, "ofb(aes)"))
+		return SE_ALG_OFB;
+	else if (!strcmp(name, "ctr(aes)"))
+		return SE_ALG_CTR;
+	else if (!strcmp(name, "xts(aes)"))
+		return SE_ALG_XTS;
+	else if (!strcmp(name, "cmac(aes)"))
+		return SE_ALG_CMAC;
+	else if (!strcmp(name, "gcm(aes)"))
+		return SE_ALG_GCM;
+	else if (!strcmp(name, "ccm(aes)"))
+		return SE_ALG_CBC_MAC;
+
+	else if (!strcmp(name, "sha1"))
+		return SE_ALG_SHA1;
+	else if (!strcmp(name, "sha224"))
+		return SE_ALG_SHA224;
+	else if (!strcmp(name, "sha256"))
+		return SE_ALG_SHA256;
+	else if (!strcmp(name, "sha384"))
+		return SE_ALG_SHA384;
+	else if (!strcmp(name, "sha512"))
+		return SE_ALG_SHA512;
+	else if (!strcmp(name, "sha3-224"))
+		return SE_ALG_SHA3_224;
+	else if (!strcmp(name, "sha3-256"))
+		return SE_ALG_SHA3_256;
+	else if (!strcmp(name, "sha3-384"))
+		return SE_ALG_SHA3_384;
+	else if (!strcmp(name, "sha3-512"))
+		return SE_ALG_SHA3_512;
+	else if (!strcmp(name, "hmac(sha224)"))
+		return SE_ALG_HMAC_SHA224;
+	else if (!strcmp(name, "hmac(sha256)"))
+		return SE_ALG_HMAC_SHA256;
+	else if (!strcmp(name, "hmac(sha384)"))
+		return SE_ALG_HMAC_SHA384;
+	else if (!strcmp(name, "hmac(sha512)"))
+		return SE_ALG_HMAC_SHA512;
+	else
+		return -EINVAL;
+}
+
+/* Functions */
+int tegra_init_aes(struct tegra_se *se);
+int tegra_init_hash(struct tegra_se *se);
+void tegra_deinit_aes(struct tegra_se *se);
+void tegra_deinit_hash(struct tegra_se *se);
+int tegra_key_submit(struct tegra_se *se, const u8 *key,
+		     u32 keylen, u32 alg, u32 *keyid);
+void tegra_key_invalidate(struct tegra_se *se, u32 keyid, u32 alg);
+int tegra_se_host1x_submit(struct tegra_se *se, u32 size);
+
+/* HOST1x OPCODES */
+static inline u32 host1x_opcode_setpayload(unsigned int payload)
+{
+	return (9 << 28) | payload;
+}
+
+static inline u32 host1x_opcode_incr_w(unsigned int offset)
+{
+	/* 22-bit offset supported */
+	return (10 << 28) | offset;
+}
+
+static inline u32 host1x_opcode_nonincr_w(unsigned int offset)
+{
+	/* 22-bit offset supported */
+	return (11 << 28) | offset;
+}
+
+static inline u32 host1x_opcode_incr(unsigned int offset, unsigned int count)
+{
+	return (1 << 28) | (offset << 16) | count;
+}
+
+static inline u32 host1x_opcode_nonincr(unsigned int offset, unsigned int count)
+{
+	return (2 << 28) | (offset << 16) | count;
+}
+
+static inline u32 host1x_uclass_incr_syncpt_cond_f(u32 v)
+{
+	return (v & 0xff) << 10;
+}
+
+static inline u32 host1x_uclass_incr_syncpt_indx_f(u32 v)
+{
+	return (v & 0x3ff) << 0;
+}
+
+static inline u32 host1x_uclass_wait_syncpt_r(void)
+{
+	return 0x8;
+}
+
+static inline u32 host1x_uclass_incr_syncpt_r(void)
+{
+	return 0x0;
+}
+
+#define se_host1x_opcode_incr_w(x) host1x_opcode_incr_w((x) / 4)
+#define se_host1x_opcode_nonincr_w(x) host1x_opcode_nonincr_w((x) / 4)
+#define se_host1x_opcode_incr(x, y) host1x_opcode_incr((x) / 4, y)
+#define se_host1x_opcode_nonincr(x, y) host1x_opcode_nonincr((x) / 4, y)
+
+#endif /*_TEGRA_SE_H*/
-- 
2.43.2

