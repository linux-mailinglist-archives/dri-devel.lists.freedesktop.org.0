Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3A5AF5DBD
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 17:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0AC010E734;
	Wed,  2 Jul 2025 15:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BM2t+XRx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2041.outbound.protection.outlook.com [40.107.92.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E02510E734
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 15:56:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iNGMUiMsHJh7mdBEe6deN/Mh4GYlRWpaT9m12zIJNKMT64PLTN509szHB7/2miVUFiMQ68JwkAVRkEsPHv2Vrsr5+PHUa7r0z8fpvPyB8J0yIX6oLaTrEupMT1kDRgVE+eP3Xf9OiA8UyY5RLqy/xticZ6MnCqNZddHgtM37oMQLT8sXBBxzBqMURAhglHewY4hVlt5tSGLR3n/VHMopueUpG/AGrrM1LoApUE+k8EwLuc9KJekbyGqfty4SUuct2BdO5poJSqPKr7JJAaa8KDhQ1ri3S3Kw83nbd9HS+dp4dktqaKv+HC4rjOQA8QWL8unHByQhsY5zUmSgdPPDPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNQkpdphobxwMnliY58m62gFCEfkKWVU589PrjZHcpo=;
 b=dHnDXCvByxuAgdR8m/w2ZgjEdCJxYP2/96AAbmX7H3I5gOpG4yBLGjrBRUCLezGStL4QMHA3Z6q/mKYTMSstkpqJBAqDtXuADBe/KhMKhloE/G2jWhd/PdlBVUB5+S94Z0+yUm4Os3+vfPAN2uoTl8VPFXMuDPP+tkUAycyvOdWMi8TkCc8wcFhxaq2kxIPELZxMVH4hscLUGYO5CyrOUiulwx1UyWZ9bruq/0MVSYeRoGlPj47AQuld3tI1L/OmXICrD/rS7tT8AlzL30zvXnSaAlY71P9YPt7HqZ1w37rt6HlrpXPtQmWaCzHTiFVaC2MT1ArhYUTH9ttKCWFyuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jNQkpdphobxwMnliY58m62gFCEfkKWVU589PrjZHcpo=;
 b=BM2t+XRxmSn2XIZXJayY7DP0S1uGw51cMriIP4EHm56BVgn7MaFNdsTYF9NwSCKPoR7MFdJsy+yTZPPEsihoq5ljvbY7EPAu7pQByuf/yAdaSILHBAuGLDsLlH9DUJsr/NaaI8sxNlKM9BI6fSqH8Kstcx1icAYA8JmJUe9aNnE=
Received: from CH0PR13CA0021.namprd13.prod.outlook.com (2603:10b6:610:b1::26)
 by DM6PR12MB4300.namprd12.prod.outlook.com (2603:10b6:5:21a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 15:56:48 +0000
Received: from CH3PEPF00000017.namprd21.prod.outlook.com
 (2603:10b6:610:b1:cafe::81) by CH0PR13CA0021.outlook.office365.com
 (2603:10b6:610:b1::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Wed,
 2 Jul 2025 15:56:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF00000017.mail.protection.outlook.com (10.167.244.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.1 via Frontend Transport; Wed, 2 Jul 2025 15:56:48 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 10:56:47 -0500
Received: from xsjgregoryw50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 2 Jul 2025 10:56:47 -0500
From: Gregory Williams <gregory.williams@amd.com>
To: <ogabbay@kernel.org>, <michal.simek@amd.com>, <robh@kernel.org>
CC: Gregory Williams <gregory.williams@amd.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH V1 8/9] accel: amd-ai-engine: Create tile memory information
Date: Wed, 2 Jul 2025 08:56:29 -0700
Message-ID: <20250702155630.1737227-9-gregory.williams@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250702155630.1737227-1-gregory.williams@amd.com>
References: <20250702155630.1737227-1-gregory.williams@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: gregory.williams@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000017:EE_|DM6PR12MB4300:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b788693-fe46-4492-9ded-08ddb9810d8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FP71XR4JUwascbsJoBs3FvpwQKfMhH+vUCLL0lPJjQuldeLAZvrmsjqTByyh?=
 =?us-ascii?Q?sGdEnnKtdwMofkiXdVcqqQLd0MqUn196iTtjswQcRGWcanwu6RYEE0ZT7rcQ?=
 =?us-ascii?Q?nSWXso1++CvBF++Y94XzVHjI8UmicfXphEQdJX+RKpXso3DFestjbf61bEHW?=
 =?us-ascii?Q?pGu1UVS6PdEyTeeONvblFmZDDTUpT3eTcnjcnVsAQ49EGu2uCD3xC/k7KIoy?=
 =?us-ascii?Q?jj+hnVe7vFf6OulCgRLJTRZth8in5yeGzg+BpcPg/RNJyy6NmQBN99w/m0b+?=
 =?us-ascii?Q?TjLqJtBQ/oVhOePyUVZSlevy6ILApsJwVGRrjcJ6rKfDKSUeHwngC0vLMa90?=
 =?us-ascii?Q?vxajPmST5pAMx5r6BIxH46EA9QNtkaDNMeYjlijFhUmDlQ2RoWiaPfa447U5?=
 =?us-ascii?Q?OaogrGO6/cbWt0SuoOtlYzrN/+/+xRh+ldIiytKm67n/kfsg/XLkwFaqpWwd?=
 =?us-ascii?Q?Gw3KKVUH39O8xLsnCgiT7n7ncyD23+n2617zc/fayuY92Dt3hY7Xf5FqIJcb?=
 =?us-ascii?Q?FOiXW83Ow8/yeWF4k0KgtxqkW4YuN8obdjxYr1x0U9VUNK5IwWNAcDY+CAcn?=
 =?us-ascii?Q?V5JgFyYD5t5HldpCa1PGoBjZ3eQZDm92m8p6uwpZC2/PXIOT4Lg3cgzTEVLE?=
 =?us-ascii?Q?KH9KM2mcv3s9FvpOxE+m1sgmGwUy1Do+6yghZdyn7MUEu/sgDBm3mzVxW7aJ?=
 =?us-ascii?Q?yt4NLLOJ4GOJs8BiLr2JUzw0wukvFmaodJycjKt0i/6gHrwsWCQdhP/YkuoH?=
 =?us-ascii?Q?aJJs3oyvqc5WrmaxOUv0JDb9OoATkw9mYC/5cmXaW69CCCywJhVA0wyCwxoo?=
 =?us-ascii?Q?89ZG/fj0LLLbOzMpyzsQkHh7Z7epLR+QILZl2x5N4+MykWbS6n5SPH6SW+J5?=
 =?us-ascii?Q?qu47F4SWF4Wx11QwUm+PNB2jaX8yRmRwh0LU+KrqtvmXH+CFPPabN4/vgGdf?=
 =?us-ascii?Q?xizsJRwkd0BWzRYrHTye63KDTFcb0UByWuAazKGAuAxxvqniI8WVwPf917Oh?=
 =?us-ascii?Q?bW0fKLn44Ht6Ow3ivcdqE1PuuK1sULp8LSZU6Zet34y/cEzELdW2ypAm7MqN?=
 =?us-ascii?Q?aOPv18b0TXu1gzUQFGxnpvFawn6m8HKLkb8nX19iDU2l/QO4FYre6H6Jfpyg?=
 =?us-ascii?Q?gDo2GkInJKOI+RE4sqb11Iit2kSGcY0vC6n1vGzRSjpAgWQwuhkQGmanazw6?=
 =?us-ascii?Q?CAxVJk21zkciTbtjN2yx1TcvT/QLw8hVbhcdsdS5s1EInhRk+HrW5go5l4eT?=
 =?us-ascii?Q?EsVftFO3/yTdw7u7ogU6LwQpugdjBbrdZGCN6UlMldjLEXTF/z4oocQg0XLy?=
 =?us-ascii?Q?rRNtRTjb8kLWBeJkLiaJaiZ9u+7FA1cgJ7i8+ZObN6IbxMICT8eh1fc35qWd?=
 =?us-ascii?Q?K1ZenHek/Rz/G+KEwIWx8bfoRWW8gYQue6vFvQtqYBm0qk02Xs/mJl1T7sp6?=
 =?us-ascii?Q?d2oDZOJjtHp4ZkpTgvw5HYTczYzYA54F0VRP8UvJp6TdVZHrbD6e6dVLmMfl?=
 =?us-ascii?Q?8xGNWOVaUZBuDLnjOBX4KgHaXD9wn9fOJ8ym?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 15:56:48.5016 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b788693-fe46-4492-9ded-08ddb9810d8a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000017.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4300
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

Creates tile memory information structure to store size and offsets for
core data and program memory and memory tile memory for AIEML.

Signed-off-by: Gregory Williams <gregory.williams@amd.com>
---
 drivers/accel/amd-ai-engine/ai-engine-aie.c   | 39 +++++++++
 drivers/accel/amd-ai-engine/ai-engine-aieml.c | 47 ++++++++++
 .../accel/amd-ai-engine/ai-engine-internal.h  | 85 +++++++++++++------
 drivers/accel/amd-ai-engine/ai-engine-part.c  | 45 ++++++++++
 4 files changed, 192 insertions(+), 24 deletions(-)

diff --git a/drivers/accel/amd-ai-engine/ai-engine-aie.c b/drivers/accel/amd-ai-engine/ai-engine-aie.c
index 5e3cb44a16c8..056db0b7be0e 100644
--- a/drivers/accel/amd-ai-engine/ai-engine-aie.c
+++ b/drivers/accel/amd-ai-engine/ai-engine-aie.c
@@ -16,6 +16,8 @@
 #define AIE_COL_SHIFT		23U
 #define AIE_ROW_SHIFT		18U
 
+#define NUM_TYPES_OF_MEM	2U
+
 /*
  * Register offsets
  */
@@ -41,6 +43,42 @@ static u32 aie_get_tile_type(struct aie_device *adev, struct aie_location *loc)
 	return AIE_TILE_TYPE_SHIMNOC;
 }
 
+static unsigned int aie_get_mem_info(struct aie_device *adev,
+				     struct aie_range *range,
+				     struct aie_part_mem *pmem)
+{
+	u8 start_row, num_rows;
+	unsigned int i;
+
+	if (range->start.row + range->size.row <= 1) {
+		/* SHIM row only, no memories in this range */
+		return 0;
+	}
+	if (!pmem)
+		return NUM_TYPES_OF_MEM;
+
+	for (i = 0; i < NUM_TYPES_OF_MEM; i++) {
+		struct aie_mem *mem = &pmem[i].mem;
+
+		memcpy(&mem->range, range, sizeof(*range));
+	}
+
+	start_row = adev->ttype_attr[AIE_TILE_TYPE_TILE].start_row;
+	num_rows = adev->ttype_attr[AIE_TILE_TYPE_TILE].num_rows;
+	/* Setup tile data memory information */
+	pmem[0].mem.offset = 0;
+	pmem[0].mem.size = KBYTES(32);
+	pmem[0].mem.range.start.row = start_row;
+	pmem[0].mem.range.size.row = num_rows;
+	/* Setup program memory information */
+	pmem[1].mem.offset = 0x20000;
+	pmem[1].mem.size = KBYTES(16);
+	pmem[1].mem.range.start.row = start_row;
+	pmem[1].mem.range.size.row = num_rows;
+
+	return NUM_TYPES_OF_MEM;
+}
+
 /* aie_scan_part_clocks() - scan clocks of a partition
  * @apart: AI engine partition
  *
@@ -258,6 +296,7 @@ static int aie_set_part_clocks(struct aie_partition *apart)
 }
 static const struct aie_tile_operations aie_ops = {
 	.get_tile_type = aie_get_tile_type,
+	.get_mem_info = aie_get_mem_info,
 	.scan_part_clocks = aie_scan_part_clocks,
 	.set_part_clocks = aie_set_part_clocks,
 };
diff --git a/drivers/accel/amd-ai-engine/ai-engine-aieml.c b/drivers/accel/amd-ai-engine/ai-engine-aieml.c
index 328688942a6a..7730609ff7c0 100644
--- a/drivers/accel/amd-ai-engine/ai-engine-aieml.c
+++ b/drivers/accel/amd-ai-engine/ai-engine-aieml.c
@@ -50,6 +50,52 @@ static u32 aieml_get_tile_type(struct aie_device *adev,
 	return AIE_TILE_TYPE_SHIMNOC;
 }
 
+static unsigned int aieml_get_mem_info(struct aie_device *adev,
+				       struct aie_range *range,
+				       struct aie_part_mem *pmem)
+{
+	u8 start_row, num_rows;
+	unsigned int i;
+
+	if (range->start.row + range->size.row <= 1) {
+		/* SHIM row only, no memories in this range */
+		return 0;
+	}
+
+	if (!pmem)
+		return NUM_TYPES_OF_MEM;
+
+	for (i = 0; i < NUM_TYPES_OF_MEM; i++) {
+		struct aie_mem *mem = &pmem[i].mem;
+
+		memcpy(&mem->range, range, sizeof(*range));
+	}
+
+	start_row = adev->ttype_attr[AIE_TILE_TYPE_TILE].start_row;
+	num_rows = adev->ttype_attr[AIE_TILE_TYPE_TILE].num_rows;
+	/* Setup tile data memory information */
+	pmem[0].mem.offset = 0;
+	pmem[0].mem.size = KBYTES(64);
+	pmem[0].mem.range.start.row = start_row;
+	pmem[0].mem.range.size.row = num_rows;
+
+	/* Setup program memory information */
+	pmem[1].mem.offset = 0x20000;
+	pmem[1].mem.size = KBYTES(16);
+	pmem[1].mem.range.start.row = start_row;
+	pmem[1].mem.range.size.row = num_rows;
+
+	start_row = adev->ttype_attr[AIE_TILE_TYPE_MEMORY].start_row;
+	num_rows = adev->ttype_attr[AIE_TILE_TYPE_MEMORY].num_rows;
+	/* Setup memory tile memory information */
+	pmem[2].mem.offset = 0;
+	pmem[2].mem.size = KBYTES(512);
+	pmem[2].mem.range.start.row = start_row;
+	pmem[2].mem.range.size.row = num_rows;
+
+	return NUM_TYPES_OF_MEM;
+}
+
 /* aieml_scan_part_clocks() - scan clocks of a partition
  * @apart: AI engine partition
  *
@@ -188,6 +234,7 @@ static int aieml_set_part_clocks(struct aie_partition *apart)
 
 static const struct aie_tile_operations aieml_ops = {
 	.get_tile_type = aieml_get_tile_type,
+	.get_mem_info = aieml_get_mem_info,
 	.scan_part_clocks = aieml_scan_part_clocks,
 	.set_part_clocks = aieml_set_part_clocks,
 };
diff --git a/drivers/accel/amd-ai-engine/ai-engine-internal.h b/drivers/accel/amd-ai-engine/ai-engine-internal.h
index 31a45575cc43..13a39c4e3331 100644
--- a/drivers/accel/amd-ai-engine/ai-engine-internal.h
+++ b/drivers/accel/amd-ai-engine/ai-engine-internal.h
@@ -68,30 +68,6 @@ struct aie_device;
 struct aie_partition;
 struct aie_aperture;
 
-/**
- * struct aie_tile_operations - AI engine device operations
- * @get_tile_type: get type of tile based on tile operation
- * @scan_part_clocks: scan partition modules to check whether the modules are
- *		      clock gated or not, and update the soft clock states
- *		      structure. It is required to be called when the partition
- *		      is requested so that the driver knows which modules are
- *		      clock gated when the partition is requested. This function
- *		      expects the caller to apply partition lock before calling
- *		      this function.
- * @set_part_clocks: set partition modules clocks gate registers based on the
- *		     partition clock states bitmap. This function expects the
- *		     caller to apply partition lock before calling this
- *		     function. The caller function will need to set the bitmap
- *		     on which tiles are required to be clocked on.
- * Different AI engine device version has its own device
- * operation.
- */
-struct aie_tile_operations {
-	u32 (*get_tile_type)(struct aie_device *adev, struct aie_location *loc);
-	int (*scan_part_clocks)(struct aie_partition *apart);
-	int (*set_part_clocks)(struct aie_partition *apart);
-};
-
 /**
  * struct aie_resource - AI engine resource structure
  * @bitmap: resource bitmap
@@ -112,6 +88,37 @@ struct aie_range {
 	struct aie_location size;
 };
 
+/**
+ * struct aie_mem - AIE memory information
+ * @range: range of tiles of the memory
+ * @offset: register offset within a tile of the memory
+ * @size: of a the memory in one tile
+ */
+struct aie_mem {
+	struct aie_range range;
+	__kernel_size_t offset;
+	__kernel_size_t size;
+};
+
+/**
+ * struct aie_part_mem - AI engine partition memory information structure
+ * @apart: AI engine partition
+ * @mem: memory information of a type of memory
+ * @size: size of the total memories in the partition
+ *
+ * This structure is to keep the information of a type of memory in a
+ * partition. The memory information will be stored in @mem property.
+ * The following information will be kept:
+ *  * memory start address offset within a tile
+ *  * memory size
+ *  * what tiles contain this type of memory
+ */
+struct aie_part_mem {
+	struct aie_partition *apart;
+	struct aie_mem mem;
+	size_t size;
+};
+
 /**
  * struct aie_tile_attr - AI engine device tile type attributes
  * @start_row: start row
@@ -126,6 +133,34 @@ struct aie_tile_attr {
 	const enum aie_module_type *mods;
 };
 
+/**
+ * struct aie_tile_operations - AI engine device operations
+ * @get_tile_type: get type of tile based on tile operation
+ * @get_mem_info: get different types of memories information
+ * @scan_part_clocks: scan partition modules to check whether the modules are
+ *		      clock gated or not, and update the soft clock states
+ *		      structure. It is required to be called when the partition
+ *		      is requested so that the driver knows which modules are
+ *		      clock gated when the partition is requested. This function
+ *		      expects the caller to apply partition lock before calling
+ *		      this function.
+ * @set_part_clocks: set partition modules clocks gate registers based on the
+ *		     partition clock states bitmap. This function expects the
+ *		     caller to apply partition lock before calling this
+ *		     function. The caller function will need to set the bitmap
+ *		     on which tiles are required to be clocked on.
+ * Different AI engine device version has its own device
+ * operation.
+ */
+struct aie_tile_operations {
+	u32 (*get_tile_type)(struct aie_device *adev, struct aie_location *loc);
+	unsigned int (*get_mem_info)(struct aie_device *adev,
+				     struct aie_range *range,
+				     struct aie_part_mem *pmem);
+	int (*scan_part_clocks)(struct aie_partition *apart);
+	int (*set_part_clocks)(struct aie_partition *apart);
+};
+
 /**
  * struct aie_device - AI engine device structure
  * @apertures: list of apertures
@@ -188,6 +223,7 @@ struct aie_aperture {
  * @range: range of partition
  * @cores_clk_state: bitmap to indicate the power state of core and mem tiles
  * @tiles_inuse: bitmap to indicate if a tile is in use
+ * @pmems: pointer to partition memories types
  * @mlock: protection for AI engine partition operations
  * @freq_req: required frequency
  */
@@ -198,6 +234,7 @@ struct aie_partition {
 	struct aie_range range;
 	struct aie_resource cores_clk_state;
 	struct aie_resource tiles_inuse;
+	struct aie_part_mem *pmems;
 	struct mutex mlock; /* protection for AI engine partition operations */
 	u64 freq_req;
 };
diff --git a/drivers/accel/amd-ai-engine/ai-engine-part.c b/drivers/accel/amd-ai-engine/ai-engine-part.c
index 83099cb60161..878597eff202 100644
--- a/drivers/accel/amd-ai-engine/ai-engine-part.c
+++ b/drivers/accel/amd-ai-engine/ai-engine-part.c
@@ -12,6 +12,44 @@
 
 #include "ai-engine-internal.h"
 
+/**
+ * aie_part_create_mems_info() - creates array to store the AI engine partition
+ *				 different memories types information
+ * @apart: AI engine partition
+ *
+ * Return: 0 for success, negative value for failure
+ *
+ * This function will create array to store the information of different
+ * memories types in the partition. This array is stored in @apart->pmems.
+ */
+static int aie_part_create_mems_info(struct aie_partition *apart)
+{
+	unsigned int i, num_mems;
+
+	num_mems = apart->adev->ops->get_mem_info(apart->adev, &apart->range,
+						  NULL);
+	if (!num_mems)
+		return 0;
+
+	apart->pmems = devm_kcalloc(apart->aperture->dev, num_mems,
+				    sizeof(struct aie_part_mem),
+				    GFP_KERNEL);
+	if (!apart->pmems)
+		return -ENOMEM;
+
+	apart->adev->ops->get_mem_info(apart->adev, &apart->range,
+				       apart->pmems);
+	for (i = 0; i < num_mems; i++) {
+		struct aie_mem *mem = &apart->pmems[i].mem;
+
+		apart->pmems[i].apart = apart;
+		apart->pmems[i].size = mem->size *
+				       mem->range.size.col *
+				       mem->range.size.row;
+	}
+	return 0;
+}
+
 /**
  * aie_part_release() - release an AI engine partition instance
  * @apart: AI engine partition device
@@ -29,6 +67,7 @@ void aie_part_release(struct aie_partition *apart)
 	aie_resource_uninitialize(&apart->cores_clk_state);
 	aie_resource_uninitialize(&apart->tiles_inuse);
 	list_del(&apart->node);
+	devm_kfree(aperture->dev, apart->pmems);
 	devm_kfree(aperture->dev, apart);
 	mutex_unlock(&aperture->mlock);
 }
@@ -64,6 +103,12 @@ struct aie_partition *aie_part_create(struct aie_aperture *aperture,
 	apart->range.start.row = aperture->range.start.row;
 	apart->range.size.row = aperture->range.size.row;
 
+	ret = aie_part_create_mems_info(apart);
+	if (ret) {
+		dev_err(aperture->dev, "failed to create tile memory information.");
+		return ERR_PTR(ret);
+	}
+
 	/* SHIM row always enabled so it is not needed in the bitmap */
 	num_tiles = apart->range.size.col * (apart->range.size.row - 1);
 	ret = aie_resource_initialize(&apart->cores_clk_state, num_tiles);
-- 
2.34.1

