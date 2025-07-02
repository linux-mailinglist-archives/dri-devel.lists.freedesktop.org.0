Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75193AF5DBA
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 17:56:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C42310E32E;
	Wed,  2 Jul 2025 15:56:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4vbk4rek";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2069.outbound.protection.outlook.com [40.107.220.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E7A10E32E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 15:56:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJLnCW1AxYb2bhGBLX/Hd0dpJibPWdF7dLXe6V9MfKbc4VYcXUOmeH7OH90yLZPlUHS6rXWQu0c/GXj5fMUXFvRaLnhPgHbcbn4OaC9aFKLlFOWRBRlJR+0flu4wuC57tpzzUclOX01vQi6Ifde5xRHe8BUrHgKEYARBmyKqjf8nxzEwKaT6M+6JBL4YuHFHr4NlkjhJMh4t9ttC3QXWuEtAA5DpE5MQAkBNySYmYonUsFsf0iNZPWroeSEYE/tB5rZWewRwdN0XyIR921e5Luu27YvLSfxtVRNktaKwIlJpmhB/eZdRzntp/KN9yUrLSDqU2ZGvrF+XfaHmLKyfCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U3FuspSJOHSR2XYV/2Kxe1E0y4DCe1Xj2Qibw1DZyZY=;
 b=s3JgkTodzjaq9hKX97Majsqcv3ne/spN4KsBFVEK5OyEVtDenF0ZJ02kihYzj+D6N3PJLSkeaf8ChqnNsjfKvfr0mBt/F7AJfloOoobMAYkxuGZh1dGuA1qYosxFNMW7vrXQIbnmapcgxBVYRvN9rRLCvEHhZlwEwFE/2t98Y189zJxDp7q8o86tdbiFqb7CFi0qRsi9dggUsGbB3KFMYz1cI/0kn/bW/+OBU4JX3OtlPou/D1+rpqO2eY2Zj/X2lKEwrTXu7xc0W7S7m1MoroOaV1Rc7ZQ6hqvACqhInaRy2dqK4H6atp1N1vp9GkBDiLua8/wYZ9PbUcxGLsMbfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U3FuspSJOHSR2XYV/2Kxe1E0y4DCe1Xj2Qibw1DZyZY=;
 b=4vbk4rekaYMjyy3uuKKcTH3Ndid/Mje73H2Dud0QG5PgpqknLG1wEslyEVgiNFHswoKfq95oDYTjzlmktlY1c3Y60oC3tusiGvjFyrtMcQ5dbPTNgJ4N9rVArvmXYMxoQHB529ruToVqqSkMThkuWA3NK7+kzShiL7HxPmsstLM=
Received: from BN1PR13CA0014.namprd13.prod.outlook.com (2603:10b6:408:e2::19)
 by IA1PR12MB7735.namprd12.prod.outlook.com (2603:10b6:208:421::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Wed, 2 Jul
 2025 15:56:50 +0000
Received: from BN1PEPF00005FFC.namprd05.prod.outlook.com
 (2603:10b6:408:e2:cafe::5b) by BN1PR13CA0014.outlook.office365.com
 (2603:10b6:408:e2::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Wed,
 2 Jul 2025 15:56:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFC.mail.protection.outlook.com (10.167.243.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.20 via Frontend Transport; Wed, 2 Jul 2025 15:56:50 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 10:56:46 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 10:56:45 -0500
Received: from xsjgregoryw50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 2 Jul 2025 10:56:45 -0500
From: Gregory Williams <gregory.williams@amd.com>
To: <ogabbay@kernel.org>, <michal.simek@amd.com>, <robh@kernel.org>
CC: Gregory Williams <gregory.williams@amd.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH V1 6/9] accel: amd-ai-engine: Add support to enable/disable
 clocks and change clock frequency
Date: Wed, 2 Jul 2025 08:56:27 -0700
Message-ID: <20250702155630.1737227-7-gregory.williams@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250702155630.1737227-1-gregory.williams@amd.com>
References: <20250702155630.1737227-1-gregory.williams@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: gregory.williams@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFC:EE_|IA1PR12MB7735:EE_
X-MS-Office365-Filtering-Correlation-Id: 25756307-366b-4726-2888-08ddb9810ed3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RDhBCgEMMuLCijN7aMNfM6id9xULJlScZEhY25o2XZrgEaumobhBWDL70M4F?=
 =?us-ascii?Q?7oa4ojCUVzvObc9DJcSF79ddcvSoptOvMep0vPTqRzmIh8rYQuDowT8cD9y9?=
 =?us-ascii?Q?DLTvgV4JtvtL7TutLPJSEVOyCv1qEL9eHmqHh8IbzJqOYyR2XU+e+X1rHUyF?=
 =?us-ascii?Q?7eamGLvquMzCYaJ2GU2ZxbtwBnjHsIiZbCFfRuVenMKFc6k9xrHv0q38SEru?=
 =?us-ascii?Q?5QtAObwd1zFJUKT81p+CPDRDxWSNpK6q4MKxk/axAXPrLDhtTQjWeeZ4aXI6?=
 =?us-ascii?Q?fFIRntaiHsWFvUkIU+Tnx7QdHsBrmQeuzg+ermJo/lrhbnyUYuifnQI1VcgB?=
 =?us-ascii?Q?clqC88al4IBSEbsXEuTFxR61rfwJW4PJbn/LrOQo7sX6xo7VXuBCC/DKu0Tz?=
 =?us-ascii?Q?/NF2s2zk4UWJFuRqc7fpZSsx4e/0ot4vVA/rPnRCJVt2VboVuWKWpaeJlrzE?=
 =?us-ascii?Q?OUApRB8umm2E+LCsHCxKrepRmpxek49fu51FRDsvLJXTmKo08YoPGxQcYwi+?=
 =?us-ascii?Q?hnf7V/fTDCUN5EWsTFVSxys9sIVYypphgAD9fNbyP9+MjyzI8HNDmDvhiEll?=
 =?us-ascii?Q?jAAFrWlivhMGr5ij2MjfcH8epiFgH25eSMQjjJ+Q388ORYDPJ/X8JR6E0UX2?=
 =?us-ascii?Q?KK1SRsdFXKQhGFncYyqtfGmF6AjbHcIxYX3u7m4nzhOtYum5+6LzmAcPvdUK?=
 =?us-ascii?Q?KLub22TE56oD5L3LRSQmANWh9KJg/ptrV1LkX8FWWaFecmrD9U6zbwTdmZjT?=
 =?us-ascii?Q?C6yLhyJTBsEb2StCgr6o5VPkarFPHJ8txYHGicv2zPC1VMfaNSjj7E5qGwQs?=
 =?us-ascii?Q?lxfDOyNOm2D2iPrm/lwui53F80+HXv0kFJ0xPy2Twsgq2dfM9TaEzPC1HqhG?=
 =?us-ascii?Q?OVDWP3j25UvizM10vCyD2NmUzIzhNSrgG+qtMzVWuQc1/yc/ZUU+MwfHiG7l?=
 =?us-ascii?Q?Uckk5JjGfIMgBHhvyXIBM7d/k4ui3scwY5zf/qxCI7US6LcVAtOFjGMNrhsJ?=
 =?us-ascii?Q?astorKuDmpofiC8mfLHi+ZASr5x5IKcOJNJXcdNGNj7vGB9erVfAAK+vb7ya?=
 =?us-ascii?Q?erkS+Ro3ufC8DsVzn9fTG2ionVgxCa3snfB8NjA2WU6xGpwM0j4mS1gohdCK?=
 =?us-ascii?Q?YupP/TikUuBtCwFG8lvzsTQMPP2m6BSGjR4muu4OfZBZkAJrlra5423EbdUv?=
 =?us-ascii?Q?RrEzDL2b+Nsu0wSqnKpFmPBqt04U6+yOwwzgMQvFMGB9BkgQ8qRUv4Kilmzu?=
 =?us-ascii?Q?rDe7yOHCcetMUxAiNkficdOC2FGNR+hOasvhyGaRhDrRGfu8T9a65kwoP863?=
 =?us-ascii?Q?RxIVerTCx+odIc1FxQuibRxOXA8zkmdSgTJ7fbnKG8SNJRs20S0Mfzfw1N78?=
 =?us-ascii?Q?x+VVx7L1deOZ7f90LrCdY582n9FfkUi/6gSMSaqSXVurLsMettF+1rtYmADZ?=
 =?us-ascii?Q?cFoh8EPrTsFmfpmsHIjiTJlj8nEfyWeEYJCYyeNDIoQsp1BxCdsEZJaha6LT?=
 =?us-ascii?Q?DthLm3Qre5tPlfo4EK2ELVgZ9Uqy0DuZdiom?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 15:56:50.6697 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25756307-366b-4726-2888-08ddb9810ed3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00005FFC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7735
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

Adds support for getting current and setting AI engine array frequency.
Frequency values are validated by the driver then passed to the Versal
firmware driver. Support is also added to request and release tiles.
Requesting tiles will enable the clocks of the tiles requested,
releasing tiles will disable the tile clocks.

Signed-off-by: Gregory Williams <gregory.williams@amd.com>
---
 drivers/accel/amd-ai-engine/Makefile          |   1 +
 drivers/accel/amd-ai-engine/ai-engine-aie.c   | 234 ++++++++++++
 drivers/accel/amd-ai-engine/ai-engine-clock.c | 338 ++++++++++++++++++
 .../accel/amd-ai-engine/ai-engine-internal.h  |  46 +++
 drivers/accel/amd-ai-engine/ai-engine-part.c  |  28 +-
 drivers/accel/amd-ai-engine/ai-engine-res.c   |  54 +++
 include/linux/amd-ai-engine.h                 |   3 +
 7 files changed, 703 insertions(+), 1 deletion(-)
 create mode 100644 drivers/accel/amd-ai-engine/ai-engine-clock.c

diff --git a/drivers/accel/amd-ai-engine/Makefile b/drivers/accel/amd-ai-engine/Makefile
index ed635a2f2602..9a830f7432d2 100644
--- a/drivers/accel/amd-ai-engine/Makefile
+++ b/drivers/accel/amd-ai-engine/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_DRM_ACCEL_AMDAIE)	+= amd-aie.o
 amd-aie-$(CONFIG_DRM_ACCEL_AMDAIE) := \
 	ai-engine-aie.o		\
 	ai-engine-aperture.o	\
+	ai-engine-clock.o	\
 	ai-engine-dev.o		\
 	ai-engine-part.o	\
 	ai-engine-res.o
diff --git a/drivers/accel/amd-ai-engine/ai-engine-aie.c b/drivers/accel/amd-ai-engine/ai-engine-aie.c
index 7b4be8d2c5eb..5e3cb44a16c8 100644
--- a/drivers/accel/amd-ai-engine/ai-engine-aie.c
+++ b/drivers/accel/amd-ai-engine/ai-engine-aie.c
@@ -6,6 +6,9 @@
  */
 
 #include <linux/amd-ai-engine.h>
+#include <linux/bitmap.h>
+#include <linux/device.h>
+#include <linux/io.h>
 
 #include "ai-engine-internal.h"
 
@@ -13,6 +16,20 @@
 #define AIE_COL_SHIFT		23U
 #define AIE_ROW_SHIFT		18U
 
+/*
+ * Register offsets
+ */
+#define AIE_SHIMPL_CLKCNTR_REGOFF		0x00036040U
+#define AIE_TILE_CORE_CLKCNTR_REGOFF		0x00036040U
+
+/*
+ * Register masks
+ */
+#define AIE_SHIMPL_CLKCNTR_COLBUF_MASK		BIT(0)
+#define AIE_SHIMPL_CLKCNTR_NEXTCLK_MASK		BIT(1)
+#define AIE_TILE_CLKCNTR_COLBUF_MASK		BIT(0)
+#define AIE_TILE_CLKCNTR_NEXTCLK_MASK		BIT(1)
+
 static u32 aie_get_tile_type(struct aie_device *adev, struct aie_location *loc)
 {
 	if (loc->row)
@@ -24,8 +41,225 @@ static u32 aie_get_tile_type(struct aie_device *adev, struct aie_location *loc)
 	return AIE_TILE_TYPE_SHIMNOC;
 }
 
+/* aie_scan_part_clocks() - scan clocks of a partition
+ * @apart: AI engine partition
+ *
+ * Return: 0 for success, negative value for errors.
+ */
+static int aie_scan_part_clocks(struct aie_partition *apart)
+{
+	struct aie_aperture *aperture = apart->aperture;
+	struct aie_range *range = &apart->range;
+	struct aie_device *adev = apart->adev;
+	struct aie_location loc;
+	int ret;
+
+	/* Clear the bitmap of cores and memories clock state */
+	aie_resource_put_region(&apart->cores_clk_state, 0,
+				apart->cores_clk_state.total);
+
+	for (loc.col = range->start.col;
+	     loc.col < range->start.col + range->size.col;
+	     loc.col++) {
+		for (loc.row = range->start.row;
+		     loc.row < range->start.row + range->size.row - 1;
+		     loc.row++) {
+			void __iomem *va;
+			u32 val, nbitpos;
+
+			/*
+			 * Reading registers of the current tile to see the next
+			 * tile is clock gated.
+			 */
+			nbitpos = (loc.col - range->start.col) *
+				  (range->size.row - 1) + loc.row;
+
+			if (aie_get_tile_type(adev, &loc) !=
+					AIE_TILE_TYPE_TILE) {
+				/* Checks shim tile for next core tile */
+				va = aperture->base +
+				     aie_cal_regoff(adev, loc,
+						    AIE_SHIMPL_CLKCNTR_REGOFF);
+				val = readl(va);
+
+				/*
+				 * check if the clock buffer and the next clock
+				 * tile is set, if one of them is not set, the
+				 * tiles of the column are clock gated.
+				 */
+				if (!(val & AIE_SHIMPL_CLKCNTR_COLBUF_MASK) ||
+				    !(val & AIE_SHIMPL_CLKCNTR_NEXTCLK_MASK))
+					break;
+
+				/* Set next tile in the row clock state on */
+				ret = aie_resource_set(&apart->cores_clk_state,
+						       nbitpos, 1);
+				if (ret) {
+					dev_err(aperture->dev,
+						"failed to set clock state bitmap.");
+					return ret;
+				}
+				continue;
+			}
+
+			/* Checks core tile for next tile */
+			va = aperture->base +
+			     aie_cal_regoff(adev, loc,
+					    AIE_TILE_CORE_CLKCNTR_REGOFF);
+			val = readl(va);
+
+			/*
+			 * If the next tile is gated, skip the rest of the
+			 * column.
+			 */
+			if (!(val & AIE_TILE_CLKCNTR_NEXTCLK_MASK))
+				break;
+
+			ret = aie_resource_set(&apart->cores_clk_state,
+					       nbitpos, 1);
+			if (ret) {
+				dev_err(aperture->dev,
+					"failed to set clock state bitmap.");
+				return ret;
+			}
+		}
+	}
+
+	/*
+	 * Set the tiles in use bitmap.
+	 * In case of scanning, tiles which are powered on are considered as
+	 * tiles in use.
+	 */
+	bitmap_copy(apart->tiles_inuse.bitmap, apart->cores_clk_state.bitmap,
+		    apart->tiles_inuse.total);
+
+	return 0;
+}
+
+/* aie_set_col_clocks() - set clocks of a range of tiles of a column
+ * @apart: AI engine partition
+ * @range: range of tiles of a column
+ * @enable: true to enable the clock, false to disable
+ *
+ * Return: 0 for success, negative value for errors.
+ */
+static int aie_set_col_clocks(struct aie_partition *apart,
+			      struct aie_range *range, bool enable)
+{
+	struct aie_location ploc;
+	u32 startbit;
+	int ret;
+
+	/*
+	 * check if the range is of single colum. only single column is allowed.
+	 * check if the start row is tile row, only tile rows are allowed.
+	 */
+	if (range->size.col != 1 || range->start.row < 1)
+		return -EINVAL;
+
+	ploc.col = range->start.col;
+	for (ploc.row = range->start.row - 1;
+	     ploc.row < range->start.row + range->size.row;
+	     ploc.row++) {
+		struct aie_aperture *aperture = apart->aperture;
+		struct aie_device *adev = apart->adev;
+		void __iomem *va;
+		u32 val = 0, regoff;
+
+		if (!ploc.row) {
+			if (enable)
+				val = AIE_SHIMPL_CLKCNTR_COLBUF_MASK |
+				      AIE_SHIMPL_CLKCNTR_NEXTCLK_MASK;
+			regoff = AIE_SHIMPL_CLKCNTR_REGOFF;
+		} else {
+			if (enable)
+				val = AIE_TILE_CLKCNTR_COLBUF_MASK |
+				      AIE_TILE_CLKCNTR_NEXTCLK_MASK;
+			regoff = AIE_TILE_CORE_CLKCNTR_REGOFF;
+		}
+
+		va = aperture->base + aie_cal_regoff(adev, ploc, regoff);
+		writel(val, va);
+
+		/* If the tile clock is not on, no need to go to next row */
+		if (!enable)
+			break;
+	}
+
+	/* Update clock state bitmap */
+	startbit = (range->start.col - apart->range.start.col) *
+		   (apart->range.size.row - 1) + range->start.row - 1;
+	if (enable)
+		ret = aie_resource_set(&apart->cores_clk_state, startbit,
+				       range->size.row);
+	else
+		ret = aie_resource_clear(&apart->cores_clk_state, startbit,
+					 range->size.row);
+
+	return ret;
+}
+
+/* aie_set_part_clocks() - set clocks of a partition
+ * @apart: AI engine partition
+ *
+ * Return: 0 for success, negative value for errors.
+ */
+static int aie_set_part_clocks(struct aie_partition *apart)
+{
+	struct aie_aperture *aperture = apart->aperture;
+	struct aie_range *range = &apart->range, lrange;
+	struct aie_location rloc;
+	int ret = 0;
+
+	/*
+	 * The tiles below the highest tile whose clock is on, need to have the
+	 * clock on. The first for loop is to scan the clock states bitmap to
+	 * see which tiles are required to be clocked on, and update the bitmap
+	 * to make sure the tiles below are also required to be clocked on.
+	 */
+	for (rloc.col = 0; rloc.col < range->size.col; rloc.col++) {
+		u32 startbit, inuse_toprow = 0, clk_toprow = 0;
+
+		startbit = rloc.col * (range->size.row - 1);
+
+		for (rloc.row = range->start.row + 1;
+		     rloc.row < range->start.row + range->size.row;
+		     rloc.row++) {
+			u32 bit = startbit + rloc.row - 1;
+
+			if (aie_resource_testbit(&apart->tiles_inuse, bit))
+				inuse_toprow = rloc.row;
+			if (aie_resource_testbit(&apart->cores_clk_state, bit))
+				clk_toprow = rloc.row;
+		}
+
+		/* Update clock states of a column */
+		lrange.start.col = rloc.col + range->start.col;
+		lrange.size.col = 1;
+		if (inuse_toprow < clk_toprow) {
+			lrange.start.row = inuse_toprow + 1;
+			lrange.size.row = clk_toprow - inuse_toprow;
+			ret = aie_set_col_clocks(apart, &lrange, false);
+		} else if (inuse_toprow > clk_toprow) {
+			lrange.start.row = clk_toprow + 1;
+			lrange.size.row = inuse_toprow - clk_toprow;
+			ret = aie_set_col_clocks(apart, &lrange, true);
+		}
+
+		if (ret) {
+			dev_err(aperture->dev,
+				"failed to set clocks for column %u.",
+				rloc.col);
+			return ret;
+		}
+	}
+
+	return 0;
+}
 static const struct aie_tile_operations aie_ops = {
 	.get_tile_type = aie_get_tile_type,
+	.scan_part_clocks = aie_scan_part_clocks,
+	.set_part_clocks = aie_set_part_clocks,
 };
 
 /**
diff --git a/drivers/accel/amd-ai-engine/ai-engine-clock.c b/drivers/accel/amd-ai-engine/ai-engine-clock.c
new file mode 100644
index 000000000000..646ec1d1658c
--- /dev/null
+++ b/drivers/accel/amd-ai-engine/ai-engine-clock.c
@@ -0,0 +1,338 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD AI Engine clock operations
+ *
+ * Copyright(C) 2025 Advanced Micro Devices, Inc. All rights reserved.
+ */
+
+#include <linux/amd-ai-engine.h>
+#include <linux/clk.h>
+#include <linux/firmware/xlnx-zynqmp.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+
+#include "ai-engine-internal.h"
+
+/**
+ * aie_part_get_clk_state_bit() - return bit position of the clock state of a
+ *				  tile
+ * @apart: AI engine partition
+ * @loc: AI engine tile location
+ *
+ * Return: bit position for success, negative value for failure
+ */
+static int aie_part_get_clk_state_bit(struct aie_partition *apart,
+				      struct aie_location *loc)
+{
+	u32 ttype = apart->adev->ops->get_tile_type(apart->adev, loc);
+
+	if (ttype != AIE_TILE_TYPE_TILE && ttype != AIE_TILE_TYPE_MEMORY)
+		return -EINVAL;
+
+	return (loc->col - apart->range.start.col) *
+	       (apart->range.size.row - 1) + loc->row - 1;
+}
+
+/**
+ * aie_part_scan_clk_state() - scan the clock states of tiles of the AI engine
+ *			       partition
+ * @apart: AI engine partition
+ *
+ * Return: 0 for success, negative value for failure.
+ *
+ * This function will scan the clock status of both the memory and core
+ * modules.
+ */
+int aie_part_scan_clk_state(struct aie_partition *apart)
+{
+	return apart->adev->ops->scan_part_clocks(apart);
+}
+
+/**
+ * aie_part_check_clk_enable_loc() - return if clock of a tile is enabled
+ * @apart: AI engine partition
+ * @loc: AI engine tile location
+ *
+ * Return: true for enabled, false for disabled
+ */
+bool aie_part_check_clk_enable_loc(struct aie_partition *apart,
+				   struct aie_location *loc)
+{
+	u32 ttype = apart->adev->ops->get_tile_type(apart->adev, loc);
+	int bit;
+
+	if (ttype != AIE_TILE_TYPE_TILE && ttype != AIE_TILE_TYPE_MEMORY)
+		return true;
+
+	bit = aie_part_get_clk_state_bit(apart, loc);
+	return aie_resource_testbit(&apart->cores_clk_state, bit);
+}
+
+/**
+ * aie_part_request_tiles() - request tiles from an AI engine partition.
+ * @apart: AI engine partition
+ * @num_tiles: number of tiles to request. If it is 0, it means all tiles
+ * @locs: the AI engine tiles locations array which will be requested
+ *
+ * Return: 0 for success, negative value for failure.
+ *
+ * This function will enable clocks of the specified tiles.
+ */
+int aie_part_request_tiles(struct aie_partition *apart, int num_tiles,
+			   struct aie_location *locs)
+{
+	int ret;
+
+	mutex_lock(&apart->mlock);
+	if (num_tiles == 0) {
+		aie_resource_set(&apart->tiles_inuse, 0,
+				 apart->tiles_inuse.total);
+	} else {
+		u32 n;
+
+		if (!locs) {
+			mutex_unlock(&apart->mlock);
+			return -EINVAL;
+		}
+
+		for (n = 0; n < num_tiles; n++) {
+			int bit = aie_part_get_clk_state_bit(apart, &locs[n]);
+
+			if (bit >= 0)
+				aie_resource_set(&apart->tiles_inuse, bit, 1);
+		}
+	}
+	ret = apart->adev->ops->set_part_clocks(apart);
+	mutex_unlock(&apart->mlock);
+
+	return ret;
+}
+
+/**
+ * aie_part_release_tiles() - release tiles from an AI engine partition.
+ * @apart: AI engine partition
+ * @num_tiles: number of tiles to release. If it is 0, it means all tiles
+ * @locs: the AI engine tiles locations array which will be released
+ *
+ * Return: 0 for success, negative value for failure.
+ *
+ * This function will disable clocks of the specified tiles.
+ */
+int aie_part_release_tiles(struct aie_partition *apart, int num_tiles,
+			   struct aie_location *locs)
+{
+	int ret;
+
+	mutex_lock(&apart->mlock);
+	if (num_tiles == 0) {
+		aie_resource_clear(&apart->tiles_inuse, 0,
+				   apart->tiles_inuse.total);
+	} else {
+		u32 n;
+
+		if (!locs) {
+			mutex_unlock(&apart->mlock);
+			return -EINVAL;
+		}
+
+		for (n = 0; n < num_tiles; n++) {
+			int bit = aie_part_get_clk_state_bit(apart, &locs[n]);
+
+			if (bit >= 0)
+				aie_resource_clear(&apart->tiles_inuse, bit, 1);
+		}
+	}
+
+	ret = apart->adev->ops->set_part_clocks(apart);
+	mutex_unlock(&apart->mlock);
+
+	return ret;
+}
+
+/**
+ * aie_aperture_get_freq_req() - get current required frequency of aperture
+ * @aperture: AI engine aperture
+ *
+ * Return: required clock frequency of the aperture which is the largest
+ *	   required clock frequency of all partitions of the aperture. If
+ *	   return value is 0, it means no partition has specific frequency
+ *	   requirement.
+ */
+static unsigned long aie_aperture_get_freq_req(struct aie_aperture *aperture)
+{
+	struct aie_partition *apart;
+	unsigned long freq_req = 0;
+
+	mutex_lock(&aperture->mlock);
+	list_for_each_entry(apart, &aperture->partitions, node) {
+		if (apart->freq_req > freq_req)
+			freq_req = apart->freq_req;
+	}
+	mutex_unlock(&aperture->mlock);
+
+	return freq_req;
+}
+
+/**
+ * aie_part_set_freq() - set frequency requirement of an AI engine partition
+ *
+ * @apart: AI engine partition
+ * @freq: required frequency
+ *
+ * Return: 0 for success, negative value for failure
+ *
+ * This function sets frequency requirement for the partition.
+ * It will call aie_dev_set_freq() to check the frequency requirements
+ * of all partitions. it will send QoS EEMI request to request the max
+ * frequency of all the partitions.
+ */
+int aie_part_set_freq(struct aie_partition *apart, u64 freq)
+{
+	struct aie_aperture *aperture = apart->aperture;
+	struct aie_device *adev = apart->adev;
+	u32 boot_qos, current_qos, target_qos;
+	unsigned long clk_rate;
+	u64 temp_freq;
+	int ret;
+
+	clk_rate = clk_get_rate(adev->clk);
+	if (freq > (u64)clk_rate) {
+		dev_err(aperture->dev,
+			"Invalid frequency to set, larger than full frequency(%lu).\n",
+			clk_rate);
+		return -EINVAL;
+	}
+	mutex_lock(&apart->mlock);
+
+	temp_freq = apart->freq_req;
+	apart->freq_req = freq;
+
+	freq = aie_aperture_get_freq_req(aperture);
+	if (!freq) {
+		mutex_unlock(&apart->mlock);
+		return 0;
+	}
+
+	ret = zynqmp_pm_get_qos(aperture->node_id, &boot_qos, &current_qos);
+	if (ret < 0) {
+		dev_err(aperture->dev, "Failed to get clock divider value.\n");
+		goto out;
+	}
+
+	target_qos = (boot_qos * clk_rate) / freq;
+
+	/* The clock divisor value (QoS) is a 10-bit value */
+	if (target_qos > (BIT(10) - 1)) {
+		/*
+		 * Reset the logged partition frequency requirement to its
+		 * previous value.
+		 */
+		dev_err(aperture->dev,
+			"Failed to set frequency requirement. Frequency value out-of bound.\n");
+		ret = -EINVAL;
+		goto out;
+	}
+
+	ret = zynqmp_pm_set_requirement(aperture->node_id,
+					ZYNQMP_PM_CAPABILITY_ACCESS, target_qos,
+					ZYNQMP_PM_REQUEST_ACK_BLOCKING);
+	if (ret < 0) {
+		dev_err(aperture->dev, "Failed to set frequency requirement.\n");
+		goto out;
+	}
+
+	mutex_unlock(&apart->mlock);
+	return 0;
+out:
+	apart->freq_req = temp_freq;
+	mutex_unlock(&apart->mlock);
+	return ret;
+}
+
+/**
+ * aie_partition_set_freq_req() - set partition frequency requirement
+ *
+ * @apart: AI engine partition instance
+ * @freq: required frequency
+ *
+ * Return: 0 for success, negative value for failure
+ *
+ * This function sets the minimum required frequency for the AI engine
+ * partition. If there are other partitions requiring a higher frequency in the
+ * system, AI engine device will be clocked at that value to satisfy frequency
+ * requirements of all partitions.
+ */
+int aie_partition_set_freq_req(void *apart, u64 freq)
+{
+	if (!apart)
+		return -EINVAL;
+	return aie_part_set_freq((struct aie_partition *)apart, freq);
+}
+EXPORT_SYMBOL_GPL(aie_partition_set_freq_req);
+
+/**
+ * aie_part_get_freq() - get running frequency of AI engine device.
+ *
+ * @apart: AI engine partition
+ * @freq: return running frequency
+ *
+ * Return: 0 for success, negative value for failure
+ *
+ * This function gets clock divider value with EEMI requests, and it gets the
+ * full clock frequency from common clock framework. And then it divides the
+ * full clock frequency by the divider value and returns the result.
+ */
+static int aie_part_get_freq(struct aie_partition *apart, u64 *freq)
+{
+	struct aie_aperture *aperture = apart->aperture;
+	struct aie_device *adev = apart->adev;
+	u32 boot_qos, current_qos;
+	unsigned long clk_rate;
+	int ret;
+
+	clk_rate = clk_get_rate(adev->clk);
+	ret = zynqmp_pm_get_qos(aperture->node_id, &boot_qos,
+				&current_qos);
+	if (ret < 0) {
+		dev_err(aperture->dev, "Failed to get clock divider value.\n");
+		return ret;
+	}
+
+	*freq = (clk_rate * boot_qos) / current_qos;
+	return 0;
+}
+
+/**
+ * aie_partition_get_freq() - get partition running frequency
+ *
+ * @apart: AI engine partition instance
+ * @freq: return running frequency
+ *
+ * Return: 0 for success, negative value for failure
+ */
+int aie_partition_get_freq(void *apart, u64 *freq)
+{
+	if (!apart || !freq)
+		return -EINVAL;
+	return aie_part_get_freq((struct aie_partition *)apart, freq);
+}
+EXPORT_SYMBOL_GPL(aie_partition_get_freq);
+
+/**
+ * aie_partition_get_freq_req() - get partition required frequency
+ *
+ * @apart: AI engine partition instance
+ * @freq: return partition required frequency. 0 means partition doesn't have
+ *	  frequency requirement.
+ *
+ * Return: 0 for success, negative value for failure
+ */
+int aie_partition_get_freq_req(void *apart, u64 *freq)
+{
+	if (!apart || !freq)
+		return -EINVAL;
+
+	*freq = ((struct aie_partition *)apart)->freq_req;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(aie_partition_get_freq_req);
diff --git a/drivers/accel/amd-ai-engine/ai-engine-internal.h b/drivers/accel/amd-ai-engine/ai-engine-internal.h
index 4f1d8ace2977..495d56d5f993 100644
--- a/drivers/accel/amd-ai-engine/ai-engine-internal.h
+++ b/drivers/accel/amd-ai-engine/ai-engine-internal.h
@@ -70,11 +70,25 @@ struct aie_aperture;
 /**
  * struct aie_tile_operations - AI engine device operations
  * @get_tile_type: get type of tile based on tile operation
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
  * Different AI engine device version has its own device
  * operation.
  */
 struct aie_tile_operations {
 	u32 (*get_tile_type)(struct aie_device *adev, struct aie_location *loc);
+	int (*scan_part_clocks)(struct aie_partition *apart);
+	int (*set_part_clocks)(struct aie_partition *apart);
 };
 
 /**
@@ -171,14 +185,20 @@ struct aie_aperture {
  * @aperture: pointer to AI engine aperture
  * @adev: pointer to AI device instance
  * @range: range of partition
+ * @cores_clk_state: bitmap to indicate the power state of core and mem tiles
+ * @tiles_inuse: bitmap to indicate if a tile is in use
  * @mlock: protection for AI engine partition operations
+ * @freq_req: required frequency
  */
 struct aie_partition {
 	struct list_head node;
 	struct aie_aperture *aperture;
 	struct aie_device *adev;
 	struct aie_range range;
+	struct aie_resource cores_clk_state;
+	struct aie_resource tiles_inuse;
 	struct mutex mlock; /* protection for AI engine partition operations */
+	u64 freq_req;
 };
 
 #define dev_to_aiedev(_dev) container_of((_dev), struct aie_device, dev)
@@ -210,6 +230,21 @@ struct aie_partition {
 #define aie_cal_tile_reg(adev, regoff) ( \
 	aie_tile_reg_field_get(aie_tile_reg_mask(adev), 0, regoff))
 
+/**
+ * aie_cal_regoff() - calculate register offset to the whole AI engine
+ *		      device start address
+ * @adev: AI engine device
+ * @loc: AI engine tile location
+ * @regoff_intile: register offset within a tile
+ * @return: register offset to the whole AI engine device start address
+ */
+static inline u32 aie_cal_regoff(struct aie_device *adev,
+				 struct aie_location loc, u32 regoff_intile)
+{
+	return regoff_intile + (loc.col << adev->col_shift) +
+	       (loc.row << adev->row_shift);
+}
+
 void aie_device_init(struct aie_device *adev);
 struct aie_partition *
 aie_aperture_request_part(struct aie_aperture *aperture,
@@ -219,6 +254,14 @@ void aie_aperture_remove(struct platform_device *pdev);
 struct aie_partition *aie_part_create(struct aie_aperture *aperture,
 				      u8 start_col, u8 num_col);
 void aie_part_release(struct aie_partition *apart);
+int aie_part_set_freq(struct aie_partition *apart, u64 freq);
+int aie_part_scan_clk_state(struct aie_partition *apart);
+bool aie_part_check_clk_enable_loc(struct aie_partition *apart,
+				   struct aie_location *loc);
+int aie_part_request_tiles(struct aie_partition *apart, int num_tiles,
+			   struct aie_location *locs);
+int aie_part_release_tiles(struct aie_partition *apart, int num_tiles,
+			   struct aie_location *locs);
 int aie_resource_initialize(struct aie_resource *res, int count);
 void aie_resource_uninitialize(struct aie_resource *res);
 int aie_resource_check_region(struct aie_resource *res, u32 start,
@@ -226,5 +269,8 @@ int aie_resource_check_region(struct aie_resource *res, u32 start,
 int aie_resource_get_region(struct aie_resource *res, u32 start,
 			    u32 count);
 void aie_resource_put_region(struct aie_resource *res, int start, u32 count);
+int aie_resource_set(struct aie_resource *res, u32 start, u32 count);
+int aie_resource_clear(struct aie_resource *res, u32 start, u32 count);
+bool aie_resource_testbit(struct aie_resource *res, u32 bit);
 
 #endif /* AIE_INTERNAL_H */
diff --git a/drivers/accel/amd-ai-engine/ai-engine-part.c b/drivers/accel/amd-ai-engine/ai-engine-part.c
index 3675a72971d5..83099cb60161 100644
--- a/drivers/accel/amd-ai-engine/ai-engine-part.c
+++ b/drivers/accel/amd-ai-engine/ai-engine-part.c
@@ -20,12 +20,14 @@ void aie_part_release(struct aie_partition *apart)
 {
 	struct aie_aperture *aperture = apart->aperture;
 
+	aie_part_set_freq(apart, 0);
 	mutex_lock(&aperture->mlock);
-
 	aie_resource_put_region(&aperture->cols_res,
 				apart->range.start.col -
 				aperture->range.start.col,
 				apart->range.size.col);
+	aie_resource_uninitialize(&apart->cores_clk_state);
+	aie_resource_uninitialize(&apart->tiles_inuse);
 	list_del(&apart->node);
 	devm_kfree(aperture->dev, apart);
 	mutex_unlock(&aperture->mlock);
@@ -48,6 +50,7 @@ struct aie_partition *aie_part_create(struct aie_aperture *aperture,
 				      u8 start_col, u8 num_col)
 {
 	struct aie_partition *apart;
+	int ret, num_tiles;
 
 	apart = devm_kzalloc(aperture->dev, sizeof(*apart), GFP_KERNEL);
 	if (!apart)
@@ -61,5 +64,28 @@ struct aie_partition *aie_part_create(struct aie_aperture *aperture,
 	apart->range.start.row = aperture->range.start.row;
 	apart->range.size.row = aperture->range.size.row;
 
+	/* SHIM row always enabled so it is not needed in the bitmap */
+	num_tiles = apart->range.size.col * (apart->range.size.row - 1);
+	ret = aie_resource_initialize(&apart->cores_clk_state, num_tiles);
+	if (ret) {
+		dev_err(aperture->dev, "failed to initialize clock state resource.");
+		return ERR_PTR(ret);
+	}
+
+	ret = aie_resource_initialize(&apart->tiles_inuse, num_tiles);
+	if (ret) {
+		dev_err(aperture->dev, "failed to initialize tiles in use resource.");
+		aie_resource_uninitialize(&apart->cores_clk_state);
+		return ERR_PTR(ret);
+	}
+
+	ret = aie_part_scan_clk_state(apart);
+	if (ret) {
+		dev_err(aperture->dev, "failed to scan clock state.");
+		aie_resource_uninitialize(&apart->cores_clk_state);
+		aie_resource_uninitialize(&apart->tiles_inuse);
+		return ERR_PTR(ret);
+	}
+
 	return apart;
 }
diff --git a/drivers/accel/amd-ai-engine/ai-engine-res.c b/drivers/accel/amd-ai-engine/ai-engine-res.c
index 6bbd7273686e..d71a3a5f7b29 100644
--- a/drivers/accel/amd-ai-engine/ai-engine-res.c
+++ b/drivers/accel/amd-ai-engine/ai-engine-res.c
@@ -112,3 +112,57 @@ void aie_resource_put_region(struct aie_resource *res, int start, u32 count)
 		return;
 	bitmap_clear(res->bitmap, start, count);
 }
+
+/**
+ * aie_resource_set() - set the AI engine resource bits
+ * @res: pointer to AI engine resource
+ * @start: start bit to set
+ * @count: number of bits to set
+ *
+ * Return: 0 for success and negative value for failure
+ *
+ * This function sets the specified number bits in the resource.
+ */
+int aie_resource_set(struct aie_resource *res, u32 start, u32 count)
+{
+	if (!res || !res->bitmap || !count || start + count > res->total)
+		return -EINVAL;
+
+	bitmap_set(res->bitmap, start, count);
+	return 0;
+}
+
+/**
+ * aie_resource_clear() - clear the AI engine resource bits
+ * @res: pointer to AI engine resource
+ * @start: start bit to set
+ * @count: number of bits to clear
+ *
+ * Return: 0 for success and negative value for failure
+ *
+ * This function clears the specified number bits in the resource.
+ */
+int aie_resource_clear(struct aie_resource *res, u32 start, u32 count)
+{
+	if (!res || !res->bitmap || !count || start + count > res->total)
+		return -EINVAL;
+
+	bitmap_clear(res->bitmap, start, count);
+	return 0;
+}
+
+/**
+ * aie_resource_testbit() - test if a bit is set in a AI engine resource
+ * @res: pointer to AI engine resource
+ * @bit: bit to check
+ *
+ * Return: true for set, false for not set
+ */
+bool aie_resource_testbit(struct aie_resource *res, u32 bit)
+{
+	if (!res || !res->bitmap || bit >= res->total)
+		return false;
+
+	/* Locate the unsigned long the required bit belongs to */
+	return test_bit(bit, res->bitmap);
+}
diff --git a/include/linux/amd-ai-engine.h b/include/linux/amd-ai-engine.h
index 2a13362edd0c..f1f6543f9eae 100644
--- a/include/linux/amd-ai-engine.h
+++ b/include/linux/amd-ai-engine.h
@@ -42,5 +42,8 @@ struct aie_location {
 
 void *aie_partition_request(struct device *dev, struct aie_partition_req *req);
 void aie_partition_release(void *apart);
+int aie_partition_set_freq_req(void *apart, u64 freq);
+int aie_partition_get_freq(void *apart, u64 *freq);
+int aie_partition_get_freq_req(void *apart, u64 *freq);
 
 #endif
-- 
2.34.1

