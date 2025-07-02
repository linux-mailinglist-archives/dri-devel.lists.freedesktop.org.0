Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FE8AF5DC0
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 17:57:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B64D110E333;
	Wed,  2 Jul 2025 15:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eRGssw13";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8224D10E735
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 15:56:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rk4kNn5C4psgt7lPqdM2awZYmUhzAutvXkEl+8Sd6cMvjhj9dNSHHeE6p8KzA01VnlH0gsJZ3GqWIy/xWxA10+kMNyiO0zVlmY14Ko8qsTdw3kicG4j5yVKc+I5XTiW+D5hN/ivuXr3uWnGvgXDncuO9vhNX2Vowu/i8+mWSeFTEGvzOUXli3FB9i5BOytVVpveubLl8iIJe4tFsqEgXbS25lD+xsOD5+aU1Avt5g/4JiuutGDzQGJmgzoNElF1G+GG4Y5/tRvIcBN2QDpfYgoylonY94sRfmvjyaTnr5S+awFYH51gHa5P+rNzb970gbGJsQtNQ5p7B9VajdUvBkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=03+hix+gmPnEV0IxFrNb7C9JryMm9TekMt4qzXD1VWs=;
 b=wt9CPK0AJ/Mob/RnGnkO3O8zkp0/dKhAW3jJ/QE5zKKyxOWtR0f4hFjdcrHovXQq05WcbTVoVQmm2FMDLR6/llpgsuTkT5o2yntJtdDqo6SRNsWs/2FbW6//fO7K61+TqCJef0ItC/SR9QZRkDzxp/IN3O1up3dWEKDGAUUfL8bvoVr1MVLvAG9lL/+iHknu/ow6y+ttwjcLLt1MWNDpaqsplffLVt/GyjeLrIddywE9bTFF/YQvLX2r5k1caDp0BudaDcgMMCO2ZXB4+F7wSEiQ38i20O0yKaZFRG9RatsXp5ZgeHPraaso0G52ygHLrUzgcReAfr46b/shqnhD8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=03+hix+gmPnEV0IxFrNb7C9JryMm9TekMt4qzXD1VWs=;
 b=eRGssw13pYuAjz8nfzceCGEq8vPYJEwRtU776s3vYmXigPVXwAWgGsj6VAH5rvanpE2bHTevvlFN9OIQBAJ1TkWHInPV/FQBdoYLVKdSLqDLKfwqBF/1D9cfOWiO/0aJ1xlUAlT8RZyKnkhRvBE9BS4g53DnDvXSGDOzX1Vp7QY=
Received: from CH2PR15CA0011.namprd15.prod.outlook.com (2603:10b6:610:51::21)
 by PH7PR12MB6443.namprd12.prod.outlook.com (2603:10b6:510:1f9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Wed, 2 Jul
 2025 15:56:49 +0000
Received: from CH3PEPF00000013.namprd21.prod.outlook.com
 (2603:10b6:610:51:cafe::1f) by CH2PR15CA0011.outlook.office365.com
 (2603:10b6:610:51::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Wed,
 2 Jul 2025 15:56:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF00000013.mail.protection.outlook.com (10.167.244.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.1 via Frontend Transport; Wed, 2 Jul 2025 15:56:49 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 10:56:48 -0500
Received: from xsjgregoryw50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 2 Jul 2025 10:56:48 -0500
From: Gregory Williams <gregory.williams@amd.com>
To: <ogabbay@kernel.org>, <michal.simek@amd.com>, <robh@kernel.org>
CC: Gregory Williams <gregory.williams@amd.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH V1 9/9] accel: amd-ai-engine: Adds AI Engine reset operations
Date: Wed, 2 Jul 2025 08:56:30 -0700
Message-ID: <20250702155630.1737227-10-gregory.williams@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000013:EE_|PH7PR12MB6443:EE_
X-MS-Office365-Filtering-Correlation-Id: c1b93edc-35d8-4f64-a579-08ddb9810dfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4j59BGTA7m7o0PrMsEUj+mXNBJvSDBRrZV6nQB0AanvsQYnT86z/p5hUd69G?=
 =?us-ascii?Q?C5TPJIhs+C033synbqNaqrHdLOzg4qKyuucGkdtY6/f+XkS6wBdJfcKguqFz?=
 =?us-ascii?Q?4KN5TdlB5jqWlMw7LUa+r4L9/3KhCmIoN/+08DAO5CN9EpfqlNe640r936Oo?=
 =?us-ascii?Q?5rrt2GZoDaaG764+owji6KdpXNqE6dybY8Cy3uo5lm6RePncTitxx8arQ0ie?=
 =?us-ascii?Q?YOxpCXu5eoDlXsqJEkEaM99KrbGIVjLv94NyRn5C9KRkXola6bEYYHQL4Q15?=
 =?us-ascii?Q?KsOseGTspBJmcMlND1pPFjNoV9xozU2Qk37mxYa6jxSbZq+lc5bZZhWCl3xs?=
 =?us-ascii?Q?/ypQ9TcaMs5KEt/Jt3pDPsHU2Xs8CbsDRbStN06CA0wRjvmQksTR2R6rR1qO?=
 =?us-ascii?Q?aPnRHUgz+Act7YxmuOhq3zbFNDaV5kap3UoGiwFV2tKuFlREeRhmLf4Nvrhx?=
 =?us-ascii?Q?4dXH9GA9H+qbN3yi4OM0pSGeWOJmRKqhJeuWrnfTWWaB8eKAnqr8jkucEhRO?=
 =?us-ascii?Q?cTxwGxemVzhrwowC/BCruNfML7mUey4uhMRjHeHy+X1GI60h/h7bQNhqFqJO?=
 =?us-ascii?Q?mPg29k3pJFZoFjeJs7paTkcahX+8ue7QiJ99DpbFyuOfH0v2HBBZGPvnMrC6?=
 =?us-ascii?Q?r+mwd4rbYDSnKtJ4EhhUD1nIILdH/HCwVlbYDUNW1KKxBZDOHL2r7/hvUp3m?=
 =?us-ascii?Q?nB+0xmIwoRC0MVhGpi2eKuuFtCzcYjxHMwCnzyQbNCMFrPCfuJMI+BGTmJ59?=
 =?us-ascii?Q?je6SzHn9su3AEoACgE9389SpbJTtV+zg6ZSr4vRZGgeOuUsBZzkUZpPzZK4t?=
 =?us-ascii?Q?44q65/hwwHbmVaIMGHtbKZValJLTd5grrktWTHzA7VPXVjUWx/OwfM5VFBPM?=
 =?us-ascii?Q?tTORjkc+G0D3nl983S2Q76SFvxe+qimcG5VKGCGo1jn857Z5gwPu7Nfi4VJj?=
 =?us-ascii?Q?U/D9lAxb5kfM+qqrq1FS1MmgVsJ96N+8HAs35qRuTa1tnSf9TNKZyqtoo0zs?=
 =?us-ascii?Q?xo6t2+3sj2I0TPg/+cS3zzGUq6e+QqVtqLcClnaMJFgauim/an3ormi7kFVi?=
 =?us-ascii?Q?ax8mKCMtXiPL3sWy2v4fxSsjFbb7hdjOoAjt7brbRP8uwcI2WIlw8s3KZVkV?=
 =?us-ascii?Q?CdV38HLkye0LnfYegNgphxD4sqT2XTRPQJxZLrLpI+vNDKidhKkn+4b8iC1i?=
 =?us-ascii?Q?174TwqvRyqvKM774yrZz6sNC+oRwYx9otPpJfhhY/giWoNLTU9yvTf8PHl0O?=
 =?us-ascii?Q?ETjeY2Np2uuCweMAnJyR2tYzWlOkIqNSiuCGV1QQBuLAxumMbTIyJAMlxwVO?=
 =?us-ascii?Q?dJWthFaXa8TvcgZ54pHO6tpDOWg4oWY6fqO4ZiSjmOa4qKxxtb0M6k61lMsJ?=
 =?us-ascii?Q?SocwnbimQkC6wg1R0WiFPo2ivmYN3yzA9fcdIVNlHraHos8iCXlMKNULjMp5?=
 =?us-ascii?Q?iX1aN5DtldDnKv5/wgLRzOs2SqsQcZpOutfgUtLivjt0pA17+AhfWZstjViv?=
 =?us-ascii?Q?JU/8K7QRFgQE7Or89OU2va6LcGQO704ei6yG?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 15:56:49.2651 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b93edc-35d8-4f64-a579-08ddb9810dfe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000013.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6443
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

Adds AI Engine hardware reset functionality. Adds call to
initialize and teardown partitions. Partition initialize resets
columns, resets shim tiles, sets up AXIMM error reporting, ungates column
clocks, sets up partition isolation, and zeroizes all tile memories.
Teardown resets columns, resets shim tiles, zeroizes all tile
memories, and gates column clocks.

Signed-off-by: Gregory Williams <gregory.williams@amd.com>
---
 drivers/accel/amd-ai-engine/Makefile          |   3 +-
 drivers/accel/amd-ai-engine/ai-engine-aie.c   | 104 ++++++
 drivers/accel/amd-ai-engine/ai-engine-aieml.c | 105 ++++++
 drivers/accel/amd-ai-engine/ai-engine-clock.c |  16 +-
 .../accel/amd-ai-engine/ai-engine-internal.h  |  45 +++
 drivers/accel/amd-ai-engine/ai-engine-part.c  |  31 ++
 drivers/accel/amd-ai-engine/ai-engine-res.c   |  16 +
 drivers/accel/amd-ai-engine/ai-engine-reset.c | 300 ++++++++++++++++++
 include/linux/amd-ai-engine.h                 |  24 ++
 9 files changed, 629 insertions(+), 15 deletions(-)
 create mode 100644 drivers/accel/amd-ai-engine/ai-engine-reset.c

diff --git a/drivers/accel/amd-ai-engine/Makefile b/drivers/accel/amd-ai-engine/Makefile
index 66cbce4705ea..8522222f330a 100644
--- a/drivers/accel/amd-ai-engine/Makefile
+++ b/drivers/accel/amd-ai-engine/Makefile
@@ -11,4 +11,5 @@ amd-aie-$(CONFIG_DRM_ACCEL_AMDAIE) := \
 	ai-engine-clock.o	\
 	ai-engine-dev.o		\
 	ai-engine-part.o	\
-	ai-engine-res.o
+	ai-engine-res.o		\
+	ai-engine-reset.o
diff --git a/drivers/accel/amd-ai-engine/ai-engine-aie.c b/drivers/accel/amd-ai-engine/ai-engine-aie.c
index 056db0b7be0e..23733d384a2e 100644
--- a/drivers/accel/amd-ai-engine/ai-engine-aie.c
+++ b/drivers/accel/amd-ai-engine/ai-engine-aie.c
@@ -22,7 +22,14 @@
  * Register offsets
  */
 #define AIE_SHIMPL_CLKCNTR_REGOFF		0x00036040U
+#define AIE_SHIMPL_TILECTRL_REGOFF		0x00036030U
+
+#define AIE_TILE_CORE_AMH3_PART3_REGOFF		0x000307a0U
 #define AIE_TILE_CORE_CLKCNTR_REGOFF		0x00036040U
+#define AIE_TILE_CORE_LC_REGOFF			0x00030520U
+#define AIE_TILE_CORE_R0_REGOFF			0x00030000U
+#define AIE_TILE_CORE_TILECTRL_REGOFF		0x00036030U
+#define AIE_TILE_CORE_VRL0_REGOFF		0x00030530U
 
 /*
  * Register masks
@@ -32,6 +39,27 @@
 #define AIE_TILE_CLKCNTR_COLBUF_MASK		BIT(0)
 #define AIE_TILE_CLKCNTR_NEXTCLK_MASK		BIT(1)
 
+static const struct aie_tile_regs aie_core_32bit_regs = {
+	.attribute = AIE_TILE_TYPE_TILE << AIE_REGS_ATTR_TILE_TYPE_SHIFT,
+	.soff = AIE_TILE_CORE_R0_REGOFF,
+	.eoff = AIE_TILE_CORE_LC_REGOFF,
+};
+
+static const struct aie_tile_regs aie_core_128bit_regs = {
+	.attribute = AIE_TILE_TYPE_TILE << AIE_REGS_ATTR_TILE_TYPE_SHIFT,
+	.soff = AIE_TILE_CORE_VRL0_REGOFF,
+	.eoff = AIE_TILE_CORE_AMH3_PART3_REGOFF,
+};
+
+static const struct aie_core_regs_attr aie_core_regs[] = {
+	{.core_regs = &aie_core_32bit_regs,
+	 .width = 1,
+	},
+	{.core_regs = &aie_core_128bit_regs,
+	 .width = 4,
+	},
+};
+
 static u32 aie_get_tile_type(struct aie_device *adev, struct aie_location *loc)
 {
 	if (loc->row)
@@ -79,6 +107,43 @@ static unsigned int aie_get_mem_info(struct aie_device *adev,
 	return NUM_TYPES_OF_MEM;
 }
 
+/**
+ * aie_part_clear_mems() - clear memories of every tile in a partition
+ * @apart: AI engine partition
+ *
+ * Return: return 0 always.
+ */
+static int aie_part_clear_mems(struct aie_partition *apart)
+{
+	struct aie_part_mem *pmems = apart->pmems;
+	struct aie_device *adev = apart->adev;
+	u32 i;
+
+	/* Clear each type of memories in the partition */
+	for (i = 0; i < NUM_TYPES_OF_MEM; i++) {
+		struct aie_mem *mem = &pmems[i].mem;
+		struct aie_range *range = &mem->range;
+		u32 c, r;
+
+		for (c = range->start.col;
+		     c < range->start.col + range->size.col; c++) {
+			for (r = range->start.row;
+			     r < range->start.row + range->size.row; r++) {
+				struct aie_location loc;
+				u32 memoff;
+
+				loc.col = c;
+				loc.row = r;
+				memoff = aie_cal_regoff(adev, loc, mem->offset);
+				memset_io(apart->aperture->base + memoff, 0,
+					  mem->size);
+			}
+		}
+	}
+
+	return 0;
+}
+
 /* aie_scan_part_clocks() - scan clocks of a partition
  * @apart: AI engine partition
  *
@@ -294,11 +359,48 @@ static int aie_set_part_clocks(struct aie_partition *apart)
 
 	return 0;
 }
+
+/**
+ * aie_set_tile_isolation() - Set isolation boundary of AI engine tile
+ * @apart: AI engine partition
+ * @loc: Location of tile
+ * @dir: Direction to block
+ *
+ * Possible direction values are:
+ *      - AIE_ISOLATE_EAST_MASK
+ *      - AIE_ISOLATE_NORTH_MASK
+ *      - AIE_ISOLATE_WEST_MASK
+ *      - AIE_ISOLATE_SOUTH_MASK
+ *      - AIE_ISOLATE_ALL_MASK
+ *      - or "OR" of multiple values
+ */
+static void aie_set_tile_isolation(struct aie_partition *apart,
+				   struct aie_location *loc, u8 dir)
+{
+	struct aie_aperture *aperture = apart->aperture;
+	struct aie_device *adev = apart->adev;
+	void __iomem *va;
+	u32 ttype, val;
+
+	val = (u32)dir;
+	ttype = aie_get_tile_type(adev, loc);
+	if (ttype == AIE_TILE_TYPE_TILE) {
+		va = aperture->base +
+		     aie_cal_regoff(adev, *loc, AIE_TILE_CORE_TILECTRL_REGOFF);
+	} else {
+		va = aperture->base +
+		     aie_cal_regoff(adev, *loc, AIE_SHIMPL_TILECTRL_REGOFF);
+	}
+	writel(val, va);
+}
+
 static const struct aie_tile_operations aie_ops = {
 	.get_tile_type = aie_get_tile_type,
 	.get_mem_info = aie_get_mem_info,
+	.mem_clear = aie_part_clear_mems,
 	.scan_part_clocks = aie_scan_part_clocks,
 	.set_part_clocks = aie_set_part_clocks,
+	.set_tile_isolation = aie_set_tile_isolation,
 };
 
 /**
@@ -316,4 +418,6 @@ void aie_device_init(struct aie_device *adev)
 	adev->col_shift = AIE_COL_SHIFT;
 	adev->row_shift = AIE_ROW_SHIFT;
 	adev->ops = &aie_ops;
+	adev->num_core_regs = ARRAY_SIZE(aie_core_regs);
+	adev->core_regs = aie_core_regs;
 }
diff --git a/drivers/accel/amd-ai-engine/ai-engine-aieml.c b/drivers/accel/amd-ai-engine/ai-engine-aieml.c
index 7730609ff7c0..4ceb51ea13af 100644
--- a/drivers/accel/amd-ai-engine/ai-engine-aieml.c
+++ b/drivers/accel/amd-ai-engine/ai-engine-aieml.c
@@ -27,6 +27,17 @@
  * Register offsets
  */
 #define AIEML_SHIMPL_COLCLOCK_CTRL_REGOFF		0x000fff20U
+#define AIEML_SHIMPL_TILECTRL_REGOFF			0x00036030U
+
+#define AIEML_MEMORY_TILECTRL_REGOFF			0x00096030U
+
+#define AIEML_TILE_COREMOD_AMLL0_PART1_REGOFF		0x00030000U
+#define AIEML_TILE_COREMOD_AMHH8_PART2_REGOFF		0x00030470U
+#define AIEML_TILE_COREMOD_R0_REGOFF			0x00030c00U
+#define AIEML_TILE_COREMOD_R31_REGOFF			0x00030df0U
+#define AIEML_TILE_COREMOD_TILECTRL_REGOFF		0x00036030U
+#define AIEML_TILE_COREMOD_WL0_PART1_REGOFF		0x00030800U
+#define AIEML_TILE_COREMOD_WH11_PART2_REGOFF		0x00030af0U
 
 /*
  * Register masks
@@ -34,6 +45,36 @@
 #define AIEML_SHIMPL_COLRESET_CTRL_MASK			GENMASK(1, 0)
 #define AIEML_SHIMPL_COLCLOCK_CTRL_MASK			GENMASK(1, 0)
 
+static const struct aie_tile_regs aieml_core_amxx_regs = {
+	.attribute = AIE_TILE_TYPE_TILE << AIE_REGS_ATTR_TILE_TYPE_SHIFT,
+	.soff = AIEML_TILE_COREMOD_AMLL0_PART1_REGOFF,
+	.eoff = AIEML_TILE_COREMOD_AMHH8_PART2_REGOFF,
+};
+
+static const struct aie_tile_regs aieml_core_wx_regs = {
+	.attribute = AIE_TILE_TYPE_TILE << AIE_REGS_ATTR_TILE_TYPE_SHIFT,
+	.soff = AIEML_TILE_COREMOD_WL0_PART1_REGOFF,
+	.eoff = AIEML_TILE_COREMOD_WH11_PART2_REGOFF,
+};
+
+static const struct aie_tile_regs aieml_core_32bit_regs = {
+	.attribute = AIE_TILE_TYPE_TILE << AIE_REGS_ATTR_TILE_TYPE_SHIFT,
+	.soff = AIEML_TILE_COREMOD_R0_REGOFF,
+	.eoff = AIEML_TILE_COREMOD_R31_REGOFF,
+};
+
+static const struct aie_core_regs_attr aieml_core_regs[] = {
+	{.core_regs = &aieml_core_amxx_regs,
+	 .width = 4,
+	},
+	{.core_regs = &aieml_core_wx_regs,
+	 .width = 4,
+	},
+	{.core_regs = &aieml_core_32bit_regs,
+	 .width = 1,
+	},
+};
+
 static u32 aieml_get_tile_type(struct aie_device *adev,
 			       struct aie_location *loc)
 {
@@ -96,6 +137,27 @@ static unsigned int aieml_get_mem_info(struct aie_device *adev,
 	return NUM_TYPES_OF_MEM;
 }
 
+/**
+ * aieml_part_clear_mems() - clear memories of every tile in a partition
+ * @apart: AI engine partition
+ *
+ * Return: return 0 for success, error code for failure
+ */
+static int aieml_part_clear_mems(struct aie_partition *apart)
+{
+	struct aie_range *range = &apart->range;
+	u32 node_id = apart->adev->pm_node_id;
+	int ret;
+
+	ret = zynqmp_pm_aie_operation(node_id, range->start.col,
+				      range->size.col,
+				      XILINX_AIE_OPS_ZEROISATION);
+	if (ret < 0)
+		dev_err(apart->aperture->dev, "failed to clear memory for partition\n");
+
+	return ret;
+}
+
 /* aieml_scan_part_clocks() - scan clocks of a partition
  * @apart: AI engine partition
  *
@@ -232,11 +294,52 @@ static int aieml_set_part_clocks(struct aie_partition *apart)
 	return 0;
 }
 
+/**
+ * aieml_set_tile_isolation() - Set isolation boundary of AI engile tile
+ * @apart: AI engine partition
+ * @loc: Location of tile
+ * @dir: Direction to block
+ *
+ * Possible direction values are:
+ *      - AIE_ISOLATE_EAST_MASK
+ *      - AIE_ISOLATE_NORTH_MASK
+ *      - AIE_ISOLATE_WEST_MASK
+ *      - AIE_ISOLATE_SOUTH_MASK
+ *      - AIE_ISOLATE_ALL_MASK
+ *      - or "OR" of multiple values
+ */
+static void aieml_set_tile_isolation(struct aie_partition *apart,
+				     struct aie_location *loc, u8 dir)
+{
+	struct aie_aperture *aperture = apart->aperture;
+	struct aie_device *adev = apart->adev;
+	void __iomem *va;
+	u32 ttype, val;
+
+	/* For AIEML device, dir input will match register mask */
+	val = (u32)dir;
+	ttype = aieml_get_tile_type(adev, loc);
+	if (ttype == AIE_TILE_TYPE_TILE) {
+		va = aperture->base +
+		     aie_cal_regoff(adev, *loc,
+				    AIEML_TILE_COREMOD_TILECTRL_REGOFF);
+	} else if (ttype == AIE_TILE_TYPE_MEMORY) {
+		va = aperture->base +
+		     aie_cal_regoff(adev, *loc, AIEML_MEMORY_TILECTRL_REGOFF);
+	} else {
+		va = aperture->base +
+		     aie_cal_regoff(adev, *loc, AIEML_SHIMPL_TILECTRL_REGOFF);
+	}
+	writel(val, va);
+}
+
 static const struct aie_tile_operations aieml_ops = {
 	.get_tile_type = aieml_get_tile_type,
 	.get_mem_info = aieml_get_mem_info,
+	.mem_clear = aieml_part_clear_mems,
 	.scan_part_clocks = aieml_scan_part_clocks,
 	.set_part_clocks = aieml_set_part_clocks,
+	.set_tile_isolation = aieml_set_tile_isolation,
 };
 
 /**
@@ -254,4 +357,6 @@ void aieml_device_init(struct aie_device *adev)
 	adev->col_shift = AIEML_COL_SHIFT;
 	adev->row_shift = AIEML_ROW_SHIFT;
 	adev->ops = &aieml_ops;
+	adev->num_core_regs = ARRAY_SIZE(aieml_core_regs);
+	adev->core_regs = aieml_core_regs;
 }
diff --git a/drivers/accel/amd-ai-engine/ai-engine-clock.c b/drivers/accel/amd-ai-engine/ai-engine-clock.c
index 646ec1d1658c..6cf1348f135f 100644
--- a/drivers/accel/amd-ai-engine/ai-engine-clock.c
+++ b/drivers/accel/amd-ai-engine/ai-engine-clock.c
@@ -81,9 +81,6 @@ bool aie_part_check_clk_enable_loc(struct aie_partition *apart,
 int aie_part_request_tiles(struct aie_partition *apart, int num_tiles,
 			   struct aie_location *locs)
 {
-	int ret;
-
-	mutex_lock(&apart->mlock);
 	if (num_tiles == 0) {
 		aie_resource_set(&apart->tiles_inuse, 0,
 				 apart->tiles_inuse.total);
@@ -102,10 +99,7 @@ int aie_part_request_tiles(struct aie_partition *apart, int num_tiles,
 				aie_resource_set(&apart->tiles_inuse, bit, 1);
 		}
 	}
-	ret = apart->adev->ops->set_part_clocks(apart);
-	mutex_unlock(&apart->mlock);
-
-	return ret;
+	return apart->adev->ops->set_part_clocks(apart);
 }
 
 /**
@@ -121,9 +115,6 @@ int aie_part_request_tiles(struct aie_partition *apart, int num_tiles,
 int aie_part_release_tiles(struct aie_partition *apart, int num_tiles,
 			   struct aie_location *locs)
 {
-	int ret;
-
-	mutex_lock(&apart->mlock);
 	if (num_tiles == 0) {
 		aie_resource_clear(&apart->tiles_inuse, 0,
 				   apart->tiles_inuse.total);
@@ -143,10 +134,7 @@ int aie_part_release_tiles(struct aie_partition *apart, int num_tiles,
 		}
 	}
 
-	ret = apart->adev->ops->set_part_clocks(apart);
-	mutex_unlock(&apart->mlock);
-
-	return ret;
+	return apart->adev->ops->set_part_clocks(apart);
 }
 
 /**
diff --git a/drivers/accel/amd-ai-engine/ai-engine-internal.h b/drivers/accel/amd-ai-engine/ai-engine-internal.h
index 13a39c4e3331..864fe5d57be4 100644
--- a/drivers/accel/amd-ai-engine/ai-engine-internal.h
+++ b/drivers/accel/amd-ai-engine/ai-engine-internal.h
@@ -23,6 +23,9 @@
 
 #define KBYTES(n)		((n) * SZ_1K)
 
+/* AIE core registers step size */
+#define AIE_CORE_REGS_STEP	0x10
+
 /*
  * Macros for AI engine tile type bitmasks
  */
@@ -40,6 +43,24 @@ enum aie_tile_type {
 #define AIE_TILE_TYPE_MASK_SHIMNOC	BIT(AIE_TILE_TYPE_SHIMNOC)
 #define AIE_TILE_TYPE_MASK_MEMORY	BIT(AIE_TILE_TYPE_MEMORY)
 
+/*
+ * Macros for attribute property of AI engine registers accessed by kernel
+ * 0 - 7 bits: tile type bits
+ * 8 - 15 bits: permission bits. If it is 1, it allows write from userspace
+ */
+#define AIE_REGS_ATTR_TILE_TYPE_SHIFT	0U
+#define AIE_REGS_ATTR_PERM_SHIFT	8U
+#define AIE_REGS_ATTR_TILE_TYPE_MASK	GENMASK(AIE_REGS_ATTR_PERM_SHIFT - 1, \
+						AIE_REGS_ATTR_TILE_TYPE_SHIFT)
+#define AIE_REGS_ATTR_PERM_MASK		GENMASK(15, \
+						AIE_REGS_ATTR_PERM_SHIFT)
+
+#define AIE_ISOLATE_EAST_MASK		BIT(3)
+#define AIE_ISOLATE_NORTH_MASK		BIT(2)
+#define AIE_ISOLATE_WEST_MASK		BIT(1)
+#define AIE_ISOLATE_SOUTH_MASK		BIT(0)
+#define AIE_ISOLATE_ALL_MASK		GENMASK(3, 0)
+
 /**
  * struct aie_tile_regs - contiguous range of AI engine register
  *			  within an AI engine tile
@@ -133,10 +154,21 @@ struct aie_tile_attr {
 	const enum aie_module_type *mods;
 };
 
+/**
+ * struct aie_core_regs_attr - AI engine core register attributes structure
+ * @core_regs: core registers
+ * @width: number of 32 bit words
+ */
+struct aie_core_regs_attr {
+	const struct aie_tile_regs *core_regs;
+	u32 width;
+};
+
 /**
  * struct aie_tile_operations - AI engine device operations
  * @get_tile_type: get type of tile based on tile operation
  * @get_mem_info: get different types of memories information
+ * @mem_clear: clear data memory banks of the partition.
  * @scan_part_clocks: scan partition modules to check whether the modules are
  *		      clock gated or not, and update the soft clock states
  *		      structure. It is required to be called when the partition
@@ -149,6 +181,7 @@ struct aie_tile_attr {
  *		     caller to apply partition lock before calling this
  *		     function. The caller function will need to set the bitmap
  *		     on which tiles are required to be clocked on.
+ * @set_tile_isolation: set tile isolation boundary for input direction.
  * Different AI engine device version has its own device
  * operation.
  */
@@ -157,8 +190,11 @@ struct aie_tile_operations {
 	unsigned int (*get_mem_info)(struct aie_device *adev,
 				     struct aie_range *range,
 				     struct aie_part_mem *pmem);
+	int (*mem_clear)(struct aie_partition *apart);
 	int (*scan_part_clocks)(struct aie_partition *apart);
 	int (*set_part_clocks)(struct aie_partition *apart);
+	void (*set_tile_isolation)(struct aie_partition *apart,
+				   struct aie_location *loc, u8 dir);
 };
 
 /**
@@ -167,12 +203,14 @@ struct aie_tile_operations {
  * @dev: device pointer for the AI engine device
  * @mlock: protection for AI engine device operations
  * @clk: AI enigne device clock
+ * @core_regs: array of core registers
  * @ops: tile operations
  * @array_shift: array address shift
  * @col_shift: column address shift
  * @row_shift: row address shift
  * @dev_gen: aie hardware device generation
  * @pm_node_id: AI Engine platform management node ID
+ * @num_core_regs: number of core registers range
  * @ttype_attr: tile type attributes
  */
 struct aie_device {
@@ -180,12 +218,14 @@ struct aie_device {
 	struct device *dev;
 	struct mutex mlock; /* protection for AI engine apertures */
 	struct clk *clk;
+	const struct aie_core_regs_attr *core_regs;
 	const struct aie_tile_operations *ops;
 	u32 array_shift;
 	u32 col_shift;
 	u32 row_shift;
 	u32 dev_gen;
 	u32 pm_node_id;
+	u32 num_core_regs;
 	struct aie_tile_attr ttype_attr[AIE_TILE_TYPE_MAX];
 };
 
@@ -301,6 +341,10 @@ int aie_part_request_tiles(struct aie_partition *apart, int num_tiles,
 			   struct aie_location *locs);
 int aie_part_release_tiles(struct aie_partition *apart, int num_tiles,
 			   struct aie_location *locs);
+int aie_part_clean(struct aie_partition *apart);
+int aie_part_initialize(struct aie_partition *apart,
+			struct aie_partition_init_args *args);
+int aie_part_teardown(struct aie_partition *apart);
 int aie_resource_initialize(struct aie_resource *res, int count);
 void aie_resource_uninitialize(struct aie_resource *res);
 int aie_resource_check_region(struct aie_resource *res, u32 start,
@@ -310,6 +354,7 @@ int aie_resource_get_region(struct aie_resource *res, u32 start,
 void aie_resource_put_region(struct aie_resource *res, int start, u32 count);
 int aie_resource_set(struct aie_resource *res, u32 start, u32 count);
 int aie_resource_clear(struct aie_resource *res, u32 start, u32 count);
+int aie_resource_clear_all(struct aie_resource *res);
 bool aie_resource_testbit(struct aie_resource *res, u32 bit);
 
 #endif /* AIE_INTERNAL_H */
diff --git a/drivers/accel/amd-ai-engine/ai-engine-part.c b/drivers/accel/amd-ai-engine/ai-engine-part.c
index 878597eff202..97bb10d11309 100644
--- a/drivers/accel/amd-ai-engine/ai-engine-part.c
+++ b/drivers/accel/amd-ai-engine/ai-engine-part.c
@@ -12,6 +12,35 @@
 
 #include "ai-engine-internal.h"
 
+/*
+ * aie_partition_initialize() - Initialize AI engine partition
+ * @apart: AI engine partition instance
+ * @args: User initialization options
+ *
+ * Return: 0 for success, negative value for failure
+ */
+int aie_partition_initialize(void *apart, struct aie_partition_init_args *args)
+{
+	if (!apart)
+		return -EINVAL;
+	return aie_part_initialize((struct aie_partition *)apart, args);
+}
+EXPORT_SYMBOL_GPL(aie_partition_initialize);
+
+/*
+ * aie_partition_reset() - Reset AI engine partition
+ * @apart: AI engine partition instance
+ *
+ * Return: 0 for success, negative value for failure
+ */
+int aie_partition_teardown(void *apart)
+{
+	if (!apart)
+		return -EINVAL;
+	return aie_part_teardown((struct aie_partition *)apart);
+}
+EXPORT_SYMBOL_GPL(aie_partition_teardown);
+
 /**
  * aie_part_create_mems_info() - creates array to store the AI engine partition
  *				 different memories types information
@@ -58,6 +87,8 @@ void aie_part_release(struct aie_partition *apart)
 {
 	struct aie_aperture *aperture = apart->aperture;
 
+	/* aie_part_clean() will do hardware reset */
+	aie_part_clean(apart);
 	aie_part_set_freq(apart, 0);
 	mutex_lock(&aperture->mlock);
 	aie_resource_put_region(&aperture->cols_res,
diff --git a/drivers/accel/amd-ai-engine/ai-engine-res.c b/drivers/accel/amd-ai-engine/ai-engine-res.c
index d71a3a5f7b29..eff41986d5b6 100644
--- a/drivers/accel/amd-ai-engine/ai-engine-res.c
+++ b/drivers/accel/amd-ai-engine/ai-engine-res.c
@@ -151,6 +151,22 @@ int aie_resource_clear(struct aie_resource *res, u32 start, u32 count)
 	return 0;
 }
 
+/**
+ * aie_resource_clear_all() - clear all the AI engine resource bits
+ * @res: pointer to AI engine resource
+ * @return: 0 for success and negative value for failure
+ *
+ * This function clears all the bits in the resource.
+ */
+int aie_resource_clear_all(struct aie_resource *res)
+{
+	if (!res || !res->bitmap)
+		return -EINVAL;
+
+	bitmap_clear(res->bitmap, 0, res->total);
+	return 0;
+}
+
 /**
  * aie_resource_testbit() - test if a bit is set in a AI engine resource
  * @res: pointer to AI engine resource
diff --git a/drivers/accel/amd-ai-engine/ai-engine-reset.c b/drivers/accel/amd-ai-engine/ai-engine-reset.c
new file mode 100644
index 000000000000..650811063232
--- /dev/null
+++ b/drivers/accel/amd-ai-engine/ai-engine-reset.c
@@ -0,0 +1,300 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD AI Engine device driver reset implementation
+ *
+ * Copyright (C) 2025 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/amd-ai-engine.h>
+#include <linux/firmware/xlnx-zynqmp.h>
+#include <linux/io.h>
+#include <linux/mutex.h>
+
+#include "ai-engine-internal.h"
+
+/**
+ * aie_part_clear_core_regs_of_tile() - clear registers of aie core
+ * @apart: AI engine partition
+ * @loc: location of aie tile to clear
+ */
+static void aie_part_clear_core_regs_of_tile(struct aie_partition *apart,
+					     struct aie_location loc)
+{
+	struct aie_device *adev = apart->adev;
+	struct aie_aperture *aperture = apart->aperture;
+	const struct aie_core_regs_attr *regs = adev->core_regs;
+	u32 i;
+
+	for (i = 0; i < adev->num_core_regs; i++) {
+		u32 j, soff, eoff, reg;
+
+		soff = aie_cal_regoff(adev, loc, regs[i].core_regs->soff);
+		eoff = aie_cal_regoff(adev, loc, regs[i].core_regs->eoff);
+
+		for (reg = soff; reg <= eoff; reg += AIE_CORE_REGS_STEP) {
+			for (j = 0; j < regs[i].width; j++)
+				writel(0, aperture->base + reg + j * 4);
+		}
+	}
+}
+
+/**
+ * aie_part_clear_core_regs - clear registers of aie core of a partition
+ * @apart: AI engine partition
+ */
+static void aie_part_clear_core_regs(struct aie_partition *apart)
+{
+	struct aie_range *range = &apart->range;
+	u32 c, r;
+
+	/* clear core registers for each tile in the partition */
+	for (c = range->start.col; c < range->start.col + range->size.col;
+			c++) {
+		for (r = range->start.row;
+				r < range->start.row + range->size.row; r++) {
+			struct aie_location loc;
+			u32 ttype;
+
+			loc.row = r;
+			loc.col = c;
+			ttype = apart->adev->ops->get_tile_type(apart->adev,
+								&loc);
+			if (ttype == AIE_TILE_TYPE_TILE &&
+			    aie_part_check_clk_enable_loc(apart, &loc))
+				aie_part_clear_core_regs_of_tile(apart, loc);
+		}
+	}
+}
+
+/**
+ * aie_part_clean() - reset and clear AI engine partition
+ * @apart: AI engine partition
+ *
+ * Return: 0 for success and negative value for failure
+ *
+ * This function will:
+ *  * gate all the columns
+ *  * reset AI engine partition columns
+ *  * reset AI engine shims
+ *  * clear the memories
+ *  * clear core registers
+ *  * gate all the tiles in a partition
+ *  * update clock state bitmap
+ *
+ * This function will not validate the partition, the caller will need to
+ * provide a valid AI engine partition.
+ */
+int aie_part_clean(struct aie_partition *apart)
+{
+	u32 node_id = apart->adev->pm_node_id;
+	int ret;
+
+	mutex_lock(&apart->mlock);
+	ret = zynqmp_pm_aie_operation(node_id, apart->range.start.col,
+				      apart->range.size.col,
+				      XILINX_AIE_OPS_DIS_COL_CLK_BUFF);
+	if (ret < 0)
+		goto exit;
+
+	ret = zynqmp_pm_aie_operation(node_id, apart->range.start.col,
+				      apart->range.size.col,
+				      XILINX_AIE_OPS_COL_RST |
+				      XILINX_AIE_OPS_SHIM_RST);
+	if (ret < 0)
+		goto exit;
+
+	ret = zynqmp_pm_aie_operation(node_id, apart->range.start.col,
+				      apart->range.size.col,
+				      XILINX_AIE_OPS_ENB_COL_CLK_BUFF);
+	if (ret < 0)
+		goto exit;
+
+	apart->adev->ops->mem_clear(apart);
+	aie_part_clear_core_regs(apart);
+	ret = zynqmp_pm_aie_operation(node_id, apart->range.start.col,
+				      apart->range.size.col,
+				      XILINX_AIE_OPS_DIS_COL_CLK_BUFF);
+	if (ret < 0)
+		goto exit;
+
+	aie_resource_clear_all(&apart->cores_clk_state);
+
+exit:
+	mutex_unlock(&apart->mlock);
+	return ret;
+}
+
+/**
+ * aie_part_init_isolation() - Set isolation boundary of AI engine partition
+ * @apart: AI engine partition
+ */
+static void aie_part_init_isolation(struct aie_partition *apart)
+{
+	struct aie_range *range = &apart->range;
+	u32 c, r;
+	u8 dir;
+
+	for (c = range->start.col;
+	     c < range->start.col + range->size.col; c++) {
+		if (c == range->start.col)
+			dir = AIE_ISOLATE_WEST_MASK;
+		else if (c == (range->start.col + range->size.col - 1))
+			dir = AIE_ISOLATE_EAST_MASK;
+		else
+			dir = 0;
+
+		for (r = range->start.row;
+		     r < range->start.row + range->size.row; r++) {
+			struct aie_location loc;
+
+			loc.col = c;
+			loc.row = r;
+			apart->adev->ops->set_tile_isolation(apart, &loc, dir);
+		}
+	}
+}
+
+/**
+ * aie_part_initialize() - AI engine partition initialization
+ * @apart: AI engine partition
+ * @args: User initialization options
+ *
+ * Return: 0 for success and negative value for failure
+ *
+ * This function will:
+ * - gate all columns
+ * - enable column reset
+ * - ungate all columns
+ * - disable column reset
+ * - reset shim tiles
+ * - setup axi mm to raise events
+ * - setup partition isolation
+ * - zeroize memory
+ */
+int aie_part_initialize(struct aie_partition *apart,
+			struct aie_partition_init_args *args)
+{
+	u32 node_id = apart->adev->pm_node_id;
+	int ret;
+
+	if (!args)
+		return -EINVAL;
+
+	mutex_lock(&apart->mlock);
+
+	/* Clear resources */
+	aie_resource_clear_all(&apart->tiles_inuse);
+	aie_resource_clear_all(&apart->cores_clk_state);
+
+	/* This operation will do first 4 steps of sequence */
+	if (args->init_opts & AIE_PART_INIT_OPT_COLUMN_RST) {
+		ret = zynqmp_pm_aie_operation(node_id, apart->range.start.col,
+					      apart->range.size.col,
+					      XILINX_AIE_OPS_COL_RST);
+		if (ret < 0)
+			goto exit;
+	}
+
+	/* Reset Shims */
+	if (args->init_opts & AIE_PART_INIT_OPT_SHIM_RST) {
+		ret = zynqmp_pm_aie_operation(node_id, apart->range.start.col,
+					      apart->range.size.col,
+					      XILINX_AIE_OPS_SHIM_RST);
+		if (ret < 0)
+			goto exit;
+	}
+
+	/* Setup AXIMM events */
+	if (args->init_opts & AIE_PART_INIT_OPT_BLOCK_NOCAXIMMERR) {
+		ret = zynqmp_pm_aie_operation(node_id, apart->range.start.col,
+					      apart->range.size.col,
+					      XILINX_AIE_OPS_ENB_AXI_MM_ERR_EVENT);
+		if (ret < 0)
+			goto exit;
+	}
+
+	/* Setup partition isolation */
+	if (args->init_opts & AIE_PART_INIT_OPT_ISOLATE)
+		aie_part_init_isolation(apart);
+
+	/* Zeroize memory */
+	if (args->init_opts & AIE_PART_INIT_OPT_ZEROIZEMEM) {
+		ret = zynqmp_pm_aie_operation(node_id, apart->range.start.col,
+					      apart->range.size.col,
+					      XILINX_AIE_OPS_ZEROISATION);
+		if (ret < 0)
+			goto exit;
+	}
+
+	/* Set L2 interrupt */
+	ret = zynqmp_pm_aie_operation(node_id, apart->range.start.col,
+				      apart->range.size.col,
+				      XILINX_AIE_OPS_SET_L2_CTRL_NPI_INTR);
+	if (ret < 0)
+		goto exit;
+
+	/* Request tile locations */
+	ret = aie_part_request_tiles(apart, args->num_tiles, args->locs);
+
+exit:
+	mutex_unlock(&apart->mlock);
+	return ret;
+}
+
+/**
+ * aie_part_teardown() - AI engine partition teardown
+ * @apart: AI engine partition
+ *
+ * Return: 0 for success and negative value for failure
+ *
+ * This function will:
+ * - gate all columns
+ * - enable column reset
+ * - ungate all columns
+ * - disable column reset
+ * - reset shim tiles
+ * - zeroize memory
+ * - gate all columns
+ */
+int aie_part_teardown(struct aie_partition *apart)
+{
+	u32 node_id = apart->adev->pm_node_id;
+	int ret;
+
+	mutex_lock(&apart->mlock);
+
+	/* This operation will do first 4 steps of sequence */
+	ret = zynqmp_pm_aie_operation(node_id, apart->range.start.col,
+				      apart->range.size.col,
+				      XILINX_AIE_OPS_COL_RST);
+	if (ret < 0)
+		goto exit;
+
+	/* Reset shims */
+	ret = zynqmp_pm_aie_operation(node_id, apart->range.start.col,
+				      apart->range.size.col,
+				      XILINX_AIE_OPS_SHIM_RST);
+	if (ret < 0)
+		goto exit;
+
+	/* Zeroize mem */
+	ret = zynqmp_pm_aie_operation(node_id, apart->range.start.col,
+				      apart->range.size.col,
+				      XILINX_AIE_OPS_ZEROISATION);
+	if (ret < 0)
+		goto exit;
+
+	/* Gate all columns */
+	ret = zynqmp_pm_aie_operation(node_id, apart->range.start.col,
+				      apart->range.size.col,
+				      XILINX_AIE_OPS_DIS_COL_CLK_BUFF);
+	if (ret < 0)
+		goto exit;
+
+	/* Clear tile_inuse bitmap */
+	ret = aie_part_release_tiles(apart, 0U, NULL);
+
+exit:
+	mutex_unlock(&apart->mlock);
+	return ret;
+}
diff --git a/include/linux/amd-ai-engine.h b/include/linux/amd-ai-engine.h
index f1f6543f9eae..3e4ae8cb5e91 100644
--- a/include/linux/amd-ai-engine.h
+++ b/include/linux/amd-ai-engine.h
@@ -12,6 +12,16 @@
 #include <linux/list.h>
 #include <linux/mutex.h>
 
+/*
+ * AI engine partition initialize options
+ */
+#define AIE_PART_INIT_OPT_COLUMN_RST		BIT(0)
+#define AIE_PART_INIT_OPT_SHIM_RST		BIT(1)
+#define AIE_PART_INIT_OPT_BLOCK_NOCAXIMMERR	BIT(2)
+#define AIE_PART_INIT_OPT_ISOLATE		BIT(3)
+#define AIE_PART_INIT_OPT_ZEROIZEMEM		BIT(4)
+#define AIE_PART_INIT_OPT_DEFAULT		GENMASK(3, 0)
+
 /**
  * struct aie_partition_req - AIE request partition arguments
  * @start_col: start column of the partition
@@ -40,8 +50,22 @@ struct aie_location {
 	u32 row;
 };
 
+/**
+ * struct aie_partition_init_args - AIE partition initialization arguments
+ * @locs: Allocated array of tile locations that will be used
+ * @num_tiles: Number of tiles to use
+ * @init_opts: Partition initialization options
+ */
+struct aie_partition_init_args {
+	struct aie_location *locs;
+	u32 num_tiles;
+	u32 init_opts;
+};
+
 void *aie_partition_request(struct device *dev, struct aie_partition_req *req);
 void aie_partition_release(void *apart);
+int aie_partition_initialize(void *apart, struct aie_partition_init_args *args);
+int aie_partition_teardown(void *apart);
 int aie_partition_set_freq_req(void *apart, u64 freq);
 int aie_partition_get_freq(void *apart, u64 *freq);
 int aie_partition_get_freq_req(void *apart, u64 *freq);
-- 
2.34.1

