Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EC2AF5DB9
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 17:56:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A1FA10E730;
	Wed,  2 Jul 2025 15:56:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xn4Rgq9K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2068.outbound.protection.outlook.com [40.107.101.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1AB510E72E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 15:56:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jyLWjkBsiFIkJSPem/IM//tBtv8lnErULrnywG3v5/88DXv7Do+R2/IfzDyOY4drNCHVSaTjQyqqgPYyRZtxMIWSq/FFH26ojr5aNo5ioLkcbBgzHG0AoUevvHGtHCte9VyTKpiRe2tfdEiYXmx1yV9nqmd+2GAB+LxYy66Z6NIns9NPvi1Ti6A6EDwnT6hvP9oaBDKZwVxJ7EtaNnO80ed22qImvhcNGjgbzWelG5xEtNuvp55tIkrk21WgzeNTvxqgwlLZetRLO/RSjz/NMQyx66k5yLaTFPVu/HnQ9SAk30VUiMN0i4P6iIVh5waDadQAFwR+QeCiYjZyvJjxlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DotgvFoPXMhZbRyDI/9p+/+TlIOWCyEoJALVG03oRog=;
 b=GRkuD+BBmJnTc/KB8IvRfFTtaSEXGvjJxbPx4YXuKvLEmewjyJT96USLc99xqEJcXcbaLSSf9tcG5uQ8vC93KYSp1EUXS8aC/Rwcub/LLEwulnp1GWbrYvL1MoTpEDg6nv3fZzy1/YcZpEUxw27rgxFGWDafscbz4a0xYuTcJdbojAf41FDExgnONL7mXBmCWEF2JT6jS6Dz+1EhhUwCbh/n5w/tNlaoE84A0UVyyPUvnePgqKNF9fS2nnIcDTPzmdio3iEA3ZGmmSYX6wK8BebCh6IObMrONymFR2qudf3Hi5qtFy8VHDQrsn2ToGNwTA9wrJVfxxO6jCXVp3oucQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DotgvFoPXMhZbRyDI/9p+/+TlIOWCyEoJALVG03oRog=;
 b=xn4Rgq9K7JiTVwxhNnDPZ+dsYTUzR7zg3v5r5wY8twmfjdMGVaF/27K335vvR0AC14amKUMUrE5pR8j0ZOMzqLQqm3lzUTV9jLdQTC3knJGi+maMZdFB8+a3+REHX/7ZhGuk2SVWUmomTfoCJsDevYMBpOss89GPzQBBP86jdAo=
Received: from CH0PR13CA0026.namprd13.prod.outlook.com (2603:10b6:610:b1::31)
 by SJ2PR12MB8955.namprd12.prod.outlook.com (2603:10b6:a03:542::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 2 Jul
 2025 15:56:48 +0000
Received: from CH3PEPF00000017.namprd21.prod.outlook.com
 (2603:10b6:610:b1:cafe::d3) by CH0PR13CA0026.outlook.office365.com
 (2603:10b6:610:b1::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Wed,
 2 Jul 2025 15:56:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF00000017.mail.protection.outlook.com (10.167.244.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.1 via Frontend Transport; Wed, 2 Jul 2025 15:56:47 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 10:56:47 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 10:56:46 -0500
Received: from xsjgregoryw50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 2 Jul 2025 10:56:46 -0500
From: Gregory Williams <gregory.williams@amd.com>
To: <ogabbay@kernel.org>, <michal.simek@amd.com>, <robh@kernel.org>
CC: Gregory Williams <gregory.williams@amd.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH V1 7/9] accel: amd-ai-engine: Add support for AIEML devices
Date: Wed, 2 Jul 2025 08:56:28 -0700
Message-ID: <20250702155630.1737227-8-gregory.williams@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000017:EE_|SJ2PR12MB8955:EE_
X-MS-Office365-Filtering-Correlation-Id: ee813fe6-c30e-43a9-b66f-08ddb9810cf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eirDAPMntYaj3uBqxOt++PWUy+oa3PoO2M6ErCGBQ0uRaN6Ae6ot/aGaqj41?=
 =?us-ascii?Q?4QrrZgGZJJwnMQj1RIX9mLb/EZmw/77ufAK5xQyBR6W5ZmA9PwVWRMhOqV+H?=
 =?us-ascii?Q?2oSgLgZ5ijdtVMz3/TyxE1quhLx5B0DfhO6XWnRUK7WnwkAG+i3vjFiiaK4p?=
 =?us-ascii?Q?cvD6s5vQMXS/5TU3mRA1iwDOg63MYypJmEZy6TtF6z5hyIi0mm49aSCFLpge?=
 =?us-ascii?Q?rHspFDDLXSt+N3mo77ZLguH90PURY+wnXfMhO+T0pdTDf/WbX8cktThQ/l0Q?=
 =?us-ascii?Q?4ZWSu4+l3j9XvmYCHh70AfnLdOySHmitf2GpupQ8G5B/LSRpLrGbB/b/KlHJ?=
 =?us-ascii?Q?hk1t9fpTUlQ3v7/Pfwr4YZIXl6cqqd/acljKubap1D6yxpBAobzKCpLodGGw?=
 =?us-ascii?Q?OtEw85Gv0W+jWn8L8AYIFCBfrQg68Qh7McuEnN0KCuY6x+JU2bGGiqczWsLZ?=
 =?us-ascii?Q?qg9+lH5gOAgC8DS9Fp0EegvbvIxeDD5F0sg7A9U6IOTeLwbA9fjWc4zjbk45?=
 =?us-ascii?Q?NCvkzOsOADbrv0h7pOfV/BCxwIy7dxPzjwqUptkpj6q8m7maoxeVyJyB7FT8?=
 =?us-ascii?Q?T9VI6Cfft7rrZvjDy6ByoMtVYISg7tvMjWmgdhGqAiTIRLHHgudT/cs49pRs?=
 =?us-ascii?Q?IWIWY6jQ+X7hGhZ7owuuYV2RNRB7kIl7c4ZSRdzsVs+B3DgPXB+awMSG5Pmi?=
 =?us-ascii?Q?M5fvkIFNfxyp7PF9HZjxa1O4bDtSUIJqnIJvVNiaS5B3Rc4G+5JOA3+5hzuC?=
 =?us-ascii?Q?04frBueKBFBY/uhDMg6bNi0PEQZGnk7Eht3QgrvrAQysNNJxESN+WLCOogqt?=
 =?us-ascii?Q?tLWAPEg84j1+OFYDlOtGBJ0CoJf8YNEqfOlcKiU5AlgDbCXdAlAKzk+1QBWx?=
 =?us-ascii?Q?BnvO9hsX4prUSi1yBfoSx8KKcJpKsAybX9OWYXLgT+lDw/LCve0Vc9cK72Fc?=
 =?us-ascii?Q?opE7qjIofgszoUitoo2rDV8ce7/JpdH3rihuIKvb4LnuxxvU7t1tNrd1TIws?=
 =?us-ascii?Q?pVfkwj8EtJhdbXziYln067WLgCB8wz2OVhOHO7d4EP/UsfHD6/2GdhXmF6uZ?=
 =?us-ascii?Q?OOMSuMdKieA1Poc3bGIAzID5GlZjNhEYT0sSIi3tiLtpH4Zkn6NdAD0S9zqr?=
 =?us-ascii?Q?7+t01VsT5XP1aWkVqEByryhGOaXhFPtPfRRM83DGBswFWOtfr4X8n4zsyRnl?=
 =?us-ascii?Q?t4NosHkr86hnWMCDiNnYwBy/8iB5UDUkt4+tLi1Y2nGO4DjmQc5fErgnjc/Q?=
 =?us-ascii?Q?2MmOohUmLAq4butUtuy0ByXa9eZcT+2P5FRYOIo1Kx9+cRZPbuaefqFUHpaF?=
 =?us-ascii?Q?oYxEU2r3XHghcxLF5a7O0ODYM98U2EB8f0WcQ0P7lTUO8yqSqeh0T/Rc59a8?=
 =?us-ascii?Q?TmEVf1NzwWggK+oVrMQ8qf6cIL8LyFIBZ+aTmk7pODJvEa4d3AaKVLSFhztZ?=
 =?us-ascii?Q?Gf9o/BDmEif8DGmFPFJHWKfrg1xe9KDfUneEPnH4IaP2PshVOfOpBtcOe+v0?=
 =?us-ascii?Q?vct2MJPpFlKjgbC4BcaYKWr0eWDcZQH6BZHJ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 15:56:47.5535 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee813fe6-c30e-43a9-b66f-08ddb9810cf9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000017.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8955
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

Adds driver support for AIEML generation devices. The following modules
are enabled:
- Get tile type from location (support for new memory tile type)
- Clock state tracking and request and release of tiles

Signed-off-by: Gregory Williams <gregory.williams@amd.com>
---
 drivers/accel/amd-ai-engine/Makefile          |   1 +
 drivers/accel/amd-ai-engine/ai-engine-aieml.c | 210 ++++++++++++++++++
 drivers/accel/amd-ai-engine/ai-engine-dev.c   |   2 +
 .../accel/amd-ai-engine/ai-engine-internal.h  |   2 +
 4 files changed, 215 insertions(+)
 create mode 100644 drivers/accel/amd-ai-engine/ai-engine-aieml.c

diff --git a/drivers/accel/amd-ai-engine/Makefile b/drivers/accel/amd-ai-engine/Makefile
index 9a830f7432d2..66cbce4705ea 100644
--- a/drivers/accel/amd-ai-engine/Makefile
+++ b/drivers/accel/amd-ai-engine/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_DRM_ACCEL_AMDAIE)	+= amd-aie.o
 
 amd-aie-$(CONFIG_DRM_ACCEL_AMDAIE) := \
 	ai-engine-aie.o		\
+	ai-engine-aieml.o	\
 	ai-engine-aperture.o	\
 	ai-engine-clock.o	\
 	ai-engine-dev.o		\
diff --git a/drivers/accel/amd-ai-engine/ai-engine-aieml.c b/drivers/accel/amd-ai-engine/ai-engine-aieml.c
new file mode 100644
index 000000000000..328688942a6a
--- /dev/null
+++ b/drivers/accel/amd-ai-engine/ai-engine-aieml.c
@@ -0,0 +1,210 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD AI Engine driver AIEML device specific implementation
+ *
+ * Copyright(C) 2025 Advanced Micro Devices, Inc. All rights reserved.
+ */
+
+#include <linux/amd-ai-engine.h>
+#include <linux/bitmap.h>
+#include <linux/device.h>
+#include <linux/firmware/xlnx-zynqmp.h>
+#include <linux/io.h>
+
+#include "ai-engine-internal.h"
+
+#define AIEML_ARRAY_SHIFT	32U
+#define AIEML_COL_SHIFT		25U
+#define AIEML_ROW_SHIFT		20U
+
+#define NUM_TYPES_OF_MEM	3U
+
+#define NUM_MODS_CORE_TILE	2U
+#define NUM_MODS_MEM_TILE	1U
+#define NUM_MODS_SHIMPL_TILE	1U
+
+/*
+ * Register offsets
+ */
+#define AIEML_SHIMPL_COLCLOCK_CTRL_REGOFF		0x000fff20U
+
+/*
+ * Register masks
+ */
+#define AIEML_SHIMPL_COLRESET_CTRL_MASK			GENMASK(1, 0)
+#define AIEML_SHIMPL_COLCLOCK_CTRL_MASK			GENMASK(1, 0)
+
+static u32 aieml_get_tile_type(struct aie_device *adev,
+			       struct aie_location *loc)
+{
+	u8 num_mem_rows = adev->ttype_attr[AIE_TILE_TYPE_MEMORY].num_rows;
+
+	if (loc->row > num_mem_rows)
+		return AIE_TILE_TYPE_TILE;
+	if (loc->row && loc->row <= num_mem_rows)
+		return AIE_TILE_TYPE_MEMORY;
+	if (loc->row == 0)
+		if ((loc->col % 4) < 2)
+			return AIE_TILE_TYPE_SHIMPL;
+
+	return AIE_TILE_TYPE_SHIMNOC;
+}
+
+/* aieml_scan_part_clocks() - scan clocks of a partition
+ * @apart: AI engine partition
+ *
+ * Return: 0 for success, negative value for errors.
+ */
+static int aieml_scan_part_clocks(struct aie_partition *apart)
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
+	/*
+	 * In aieml if clock buffer on shim tile is enabled, the clock for all
+	 * tiles in the same column is enabled.
+	 */
+	for (loc.col = range->start.col;
+	     loc.col < range->start.col + range->size.col;
+	     loc.col++) {
+		void __iomem *va;
+		u32 val, nbitpos;
+
+		nbitpos = (loc.col - range->start.col) * (range->size.row - 1);
+
+		va = aperture->base +
+		     aie_cal_regoff(adev, loc,
+				    AIEML_SHIMPL_COLCLOCK_CTRL_REGOFF);
+		val = readl(va);
+
+		if (!(val & AIEML_SHIMPL_COLCLOCK_CTRL_MASK))
+			continue;
+
+		ret = aie_resource_set(&apart->cores_clk_state, nbitpos,
+				       range->size.row - 1);
+		if (ret) {
+			dev_err(aperture->dev,
+				"failed to set clock state bitmaps for column %u",
+				loc.col);
+			return ret;
+		}
+	}
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
+/* aieml_set_part_clocks() - set clocks of a partition
+ * @apart: AI engine partition
+ *
+ * Return: 0 for success, negative value for errors.
+ */
+static int aieml_set_part_clocks(struct aie_partition *apart)
+{
+	struct aie_aperture *aperture = apart->aperture;
+	struct aie_range *range = &apart->range;
+	u32 node_id = apart->adev->pm_node_id;
+	struct aie_location loc;
+	int ret;
+
+	for (loc.col = range->start.col;
+	     loc.col < range->start.col + range->size.col;
+	     loc.col++) {
+		u32 startbit, col_inuse = 0;
+
+		startbit = (loc.col - range->start.col) * (range->size.row - 1);
+
+		for (loc.row = range->start.row + 1;
+		     loc.row < range->start.row + range->size.row;
+		     loc.row++) {
+			u32 nbitpos = startbit + loc.row - 1;
+
+			if (aie_resource_testbit(&apart->tiles_inuse, nbitpos)) {
+				col_inuse = 1;
+				break;
+			}
+		}
+
+		if (col_inuse) {
+			ret = zynqmp_pm_aie_operation(node_id, loc.col,
+						      1,
+						      XILINX_AIE_OPS_ENB_COL_CLK_BUFF);
+			if (ret < 0) {
+				dev_err(aperture->dev,
+					"failed to enable clock for column: %d",
+					loc.col);
+				return ret;
+			}
+
+			ret = aie_resource_set(&apart->tiles_inuse,
+					       startbit, apart->range.size.row - 1) |
+			      aie_resource_set(&apart->cores_clk_state,
+					       startbit, apart->range.size.row - 1);
+			if (ret) {
+				dev_err(aperture->dev,
+					"failed to set bitmaps for column: %d",
+					loc.col);
+				return ret;
+			}
+		} else {
+			ret = zynqmp_pm_aie_operation(node_id, loc.col,
+						      1,
+						      XILINX_AIE_OPS_DIS_COL_CLK_BUFF);
+			if (ret < 0) {
+				dev_err(aperture->dev,
+					"failed to disable clock for column: %d",
+					loc.col);
+				return ret;
+			}
+
+			ret = aie_resource_clear(&apart->tiles_inuse,
+						 startbit, apart->range.size.row - 1) |
+			      aie_resource_clear(&apart->cores_clk_state,
+						 startbit, apart->range.size.row - 1);
+			if (ret) {
+				dev_err(aperture->dev,
+					"failed to clear bitmaps for column: %d",
+					loc.col);
+				return ret;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static const struct aie_tile_operations aieml_ops = {
+	.get_tile_type = aieml_get_tile_type,
+	.scan_part_clocks = aieml_scan_part_clocks,
+	.set_part_clocks = aieml_set_part_clocks,
+};
+
+/**
+ * aieml_device_init() - Initialize AI engine device struct AIEML specific
+ * @adev: AI engine device
+ *
+ * This function initialize the AI engine device structure device version
+ * specific elements such as register addressing related array shift,
+ * column shift, and row shift; AIEML device specific device operations, device
+ * columns resource.
+ */
+void aieml_device_init(struct aie_device *adev)
+{
+	adev->array_shift = AIEML_ARRAY_SHIFT;
+	adev->col_shift = AIEML_COL_SHIFT;
+	adev->row_shift = AIEML_ROW_SHIFT;
+	adev->ops = &aieml_ops;
+}
diff --git a/drivers/accel/amd-ai-engine/ai-engine-dev.c b/drivers/accel/amd-ai-engine/ai-engine-dev.c
index ba28257cbd04..f713d38ff8c3 100644
--- a/drivers/accel/amd-ai-engine/ai-engine-dev.c
+++ b/drivers/accel/amd-ai-engine/ai-engine-dev.c
@@ -154,6 +154,8 @@ static int amd_ai_engine_probe(struct platform_device *pdev)
 	adev->dev_gen = aie_gen;
 	if (aie_gen == AIE_DEVICE_GEN_AIE) {
 		aie_device_init(adev);
+	} else if (aie_gen == AIE_DEVICE_GEN_AIEML) {
+		aieml_device_init(adev);
 	} else {
 		dev_err(&pdev->dev, "Invalid device generation");
 		return -EINVAL;
diff --git a/drivers/accel/amd-ai-engine/ai-engine-internal.h b/drivers/accel/amd-ai-engine/ai-engine-internal.h
index 495d56d5f993..31a45575cc43 100644
--- a/drivers/accel/amd-ai-engine/ai-engine-internal.h
+++ b/drivers/accel/amd-ai-engine/ai-engine-internal.h
@@ -19,6 +19,7 @@
 #include <linux/platform_device.h>
 
 #define AIE_DEVICE_GEN_AIE	1U
+#define AIE_DEVICE_GEN_AIEML	2U
 
 #define KBYTES(n)		((n) * SZ_1K)
 
@@ -246,6 +247,7 @@ static inline u32 aie_cal_regoff(struct aie_device *adev,
 }
 
 void aie_device_init(struct aie_device *adev);
+void aieml_device_init(struct aie_device *adev);
 struct aie_partition *
 aie_aperture_request_part(struct aie_aperture *aperture,
 			  struct aie_partition_req *req);
-- 
2.34.1

