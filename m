Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E97ADCC9028
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 18:17:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A04CD10E8CE;
	Wed, 17 Dec 2025 17:17:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5MMW6vVE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010053.outbound.protection.outlook.com
 [52.101.193.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D567310E8C0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 17:17:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b8+9SnxOR7RRYZQT+n0CTKRfmE4RcOzl3UwRhYqVLlfA8O4vK05IJwPbbieAa4TXMq3netHGZ3cBZMpCB4+EeXsq1dPawagTOKN2nkGhSlsLC5ZK5R5n9DsYKEepeq0lDzAU0ODGSNQLCSe4AU1RJ6OgB5KyUlmSv1PwRFThZ3jwQ4+4kEbdOJ00/m5vzneeps2Vyvy4gNQ2QLaaoT6AN/bBW4EvG2dPndHmDhcwiElpAltlA1o+m8osxrNUsNoLV7q3RWNbfpkWCh6O1RoUTDU0oHwBuYZrDDRNBvNCY/DCIPL6+JnppGPaltmUSft0ZT2uhiCJIZchCOSOUq8yKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1wZ1W+IGAvZRfAjix4qrNo1FevL/t14X8d+k8q/atSg=;
 b=oq4qW1z9Hduu9N4cloyajNOq69/NkYPGf3CchEBQtt23BcAy4ahWH33gJQ9DJ7mBgnhj83PKhBkp6FY8NjkM4mH4nUGcu38cx5+xXbp850b1Pev5b7kMtPfzrll84zqrMETZcbpaz4IjQ9LKA9nM3VfPFTJoL+FeBwQikZP+kvke5UfXIsN9ATKrQggDLdgcRtOsAEysxTAwKnp9QbmYIwSL3uoPjTJeIum5JSKuHVwpv11f6de9hXLnAxAn+TYiTbr80t2p/ZGQmpq9Pwy2TlRvwwiG74lmZ63yklWgk78cDS7sF8mU9rlotkDnXLZudW8iwo7tmRKVXXnV6ZyitA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1wZ1W+IGAvZRfAjix4qrNo1FevL/t14X8d+k8q/atSg=;
 b=5MMW6vVEVQa18p/F0gEmrOEWKkpxXVZg3Dhp13pXbTp/DtktkXl5qkEj5X4S8xBsZc45XVnJihgphwstKIPy0OZYi66P4eDxCLL/ZmrP8LVRWi5pNKgyS73yzK58LgrrlP02Yk6Pk5AvDqflNXSM7ICgHry/+bR58PE657r+R8I=
Received: from DM6PR02CA0112.namprd02.prod.outlook.com (2603:10b6:5:1b4::14)
 by DS0PR12MB7826.namprd12.prod.outlook.com (2603:10b6:8:148::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 17:17:03 +0000
Received: from DS1PEPF00017095.namprd03.prod.outlook.com
 (2603:10b6:5:1b4:cafe::5f) by DM6PR02CA0112.outlook.office365.com
 (2603:10b6:5:1b4::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Wed,
 17 Dec 2025 17:17:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS1PEPF00017095.mail.protection.outlook.com (10.167.17.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Wed, 17 Dec 2025 17:17:03 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 17 Dec
 2025 11:17:03 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 17 Dec
 2025 11:17:03 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 17 Dec 2025 11:17:02 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V1] accel/amdxdna: Enable temporal sharing only mode
Date: Wed, 17 Dec 2025 09:17:01 -0800
Message-ID: <20251217171701.2138980-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|DS0PR12MB7826:EE_
X-MS-Office365-Filtering-Correlation-Id: f664e297-efbc-4781-739c-08de3d90190d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eED9+UifaAM28bKM7q0rZxertYFef8PmH8eTlbgVV8G2X7thw74D0jUzyAX0?=
 =?us-ascii?Q?wcdxXy4OJnKhbQqHQrpKyfX+KznaJ0+1rAAXjP9MucqtKJtfxXjmNhbv65N6?=
 =?us-ascii?Q?K9exlptkX5iKKAUzzzwGs61ybCxFWzERS/zbRAOFnaNxtlnI3FQqQbMV8wRH?=
 =?us-ascii?Q?A79S9aUyqqwuBv0VsmXPjLGKug2wJiTGnYlem0tYICGEQvOxL9DzxaKAGCvz?=
 =?us-ascii?Q?vmbsYvoXSdWOLW+DbixMNYRHjII0iNjA0axG1pXQUZv2/74yGcHWT9YiOJ2x?=
 =?us-ascii?Q?RcLG66voTbdcomRR54U5XX+QLvkjLwSIzq6gu9DzKgHr21DV9GFKDDr51Q3u?=
 =?us-ascii?Q?Vwy1uFwzU+uy32sPHvNPPJ94cKxhj+HrklTCNbYiiRhux9NdpCx0MBo6u2lr?=
 =?us-ascii?Q?dYEIPosVD7HEdcILqSfnvKwb041AVyEdZgKJ5QburrIP+3d3t/iQVbMNAEby?=
 =?us-ascii?Q?tpeLPYqGjtg0hH8/MjhpH8oPjT4bOu0IEi5KvGF46t1fb/fwpkkY6YycblFg?=
 =?us-ascii?Q?7Ou9gj42BujkuarUrzFgs5Kmq8Oz1DTR11+POglinF5k2TKuIPIF4QS/S0jP?=
 =?us-ascii?Q?pR/I9ziRXg1WTRcH0bOaSbCmXtGt31B0JoDM3UBliQn043uJJcnjNZg/j7sr?=
 =?us-ascii?Q?zDCiDqF2+gEy/IPeB3QDl+SRKowBtEVveB0YB8Umih8LDyhZ6kvPU4IrNkBx?=
 =?us-ascii?Q?dkmnujMhzZP3mY8pKT5wYdo+cy+FZKR0g5YQbWamGq8GzYuUDvHzcE7ghnhJ?=
 =?us-ascii?Q?g/CvuY9EIFm+wIW2MO3mDUdu5gN8NCe5BvqSP6muu0aRmNwL1QcbcSsocep7?=
 =?us-ascii?Q?fNq6o5+GW0uGKUnyu675q94aKwHiYztWLnud6iYBhOZ8HBa8M1Pe1f5cn13x?=
 =?us-ascii?Q?TGIHPq/QpYbr6v2MKy677sfZZiLAXqvg6hBgR5s8SofxN+LBK1qvovgSNshM?=
 =?us-ascii?Q?s79gxmaAxmtfVfGVV8Eb6XGgtohag96OYgO/nMYLdSZpIbUg2825hx1NE/5X?=
 =?us-ascii?Q?3fuZZmP/p/lx6fY/+ET1QWdBkGQrTvTlb706z4aSRKw8T3jJqaxh0wJ12VNm?=
 =?us-ascii?Q?imPD4RFFSHkES58mKFbjujCqQPfLq9BjejgmaPlrI+SxTV54hMHKYOR+t2p8?=
 =?us-ascii?Q?RhDHPBzK9KOHDJMlpQzOhzFCAsRBIaxbQyv6lSUsU20cjdj+ffSDCoR93mca?=
 =?us-ascii?Q?yLU7WQOXCnPHyZKqVuJgyQZRpftpwJwV37TdMFa+FRU1CvuHgq0sJJgAhSSP?=
 =?us-ascii?Q?SCrGkSFRQtXxa8F8eqa6+LCxBWqLrztubtXeptPsoYqS+FPCslVSay4/yCtw?=
 =?us-ascii?Q?G+EneyVZKSgsoAeaYv1ruiMamwDc17rB70RNNhY1aYuvcl5dPLEbnJnxzd1z?=
 =?us-ascii?Q?tDicQ+fgRJlwEuRDH/AOj7aoHJuIAr9/ccPNuZfxtNl0ShITZRXKTX7+hgWp?=
 =?us-ascii?Q?yXeSTMSJ/aN+sJqPheOFuvpg6Spdy08owwR/EwK+4AJ3+16/iMHcflBYnRe0?=
 =?us-ascii?Q?sFlRwrRKWIJ1lDtK5sBoqAKZORAki3oxIaGO3dEqgaDrqtZZjiOdynRExUMw?=
 =?us-ascii?Q?GN9UPbGNt37tDSIv2VE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 17:17:03.7513 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f664e297-efbc-4781-739c-08de3d90190d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7826
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

Newer firmware versions prefer temporal sharing only mode. In this mode,
the driver no longer needs to manage AIE array column allocation. Instead,
a new field, num_unused_col, is added to the hardware context creation
request to specify how many columns will not be used by this hardware
context.

Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_ctx.c      | 11 ++++++++++-
 drivers/accel/amdxdna/aie2_message.c  |  1 +
 drivers/accel/amdxdna/aie2_msg_priv.h |  3 ++-
 drivers/accel/amdxdna/aie2_pci.h      |  1 +
 drivers/accel/amdxdna/amdxdna_ctx.h   |  1 +
 drivers/accel/amdxdna/npu4_regs.c     |  1 +
 6 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 42d876a427c5..2ed087803628 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -468,6 +468,12 @@ static int aie2_alloc_resource(struct amdxdna_hwctx *hwctx)
 	struct alloc_requests *xrs_req;
 	int ret;
 
+	if (AIE2_FEATURE_ON(xdna->dev_handle, AIE2_TEMPORAL_ONLY)) {
+		hwctx->num_unused_col = xdna->dev_handle->total_col - hwctx->num_col;
+		hwctx->num_col = xdna->dev_handle->total_col;
+		return aie2_create_context(xdna->dev_handle, hwctx);
+	}
+
 	xrs_req = kzalloc(sizeof(*xrs_req), GFP_KERNEL);
 	if (!xrs_req)
 		return -ENOMEM;
@@ -499,7 +505,10 @@ static void aie2_release_resource(struct amdxdna_hwctx *hwctx)
 	struct amdxdna_dev *xdna = hwctx->client->xdna;
 	int ret;
 
-	ret = xrs_release_resource(xdna->xrs_hdl, (uintptr_t)hwctx);
+	if (AIE2_FEATURE_ON(xdna->dev_handle, AIE2_TEMPORAL_ONLY))
+		ret = aie2_destroy_context(xdna->dev_handle, hwctx);
+	else
+		ret = xrs_release_resource(xdna->xrs_hdl, (uintptr_t)hwctx);
 	if (ret)
 		XDNA_ERR(xdna, "Release AIE resource failed, ret %d", ret);
 }
diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
index 9ec973028221..e77a353cadc5 100644
--- a/drivers/accel/amdxdna/aie2_message.c
+++ b/drivers/accel/amdxdna/aie2_message.c
@@ -218,6 +218,7 @@ int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwct
 	req.aie_type = 1;
 	req.start_col = hwctx->start_col;
 	req.num_col = hwctx->num_col;
+	req.num_unused_col = hwctx->num_unused_col;
 	req.num_cq_pairs_requested = 1;
 	req.pasid = hwctx->client->pasid;
 	req.context_priority = 2;
diff --git a/drivers/accel/amdxdna/aie2_msg_priv.h b/drivers/accel/amdxdna/aie2_msg_priv.h
index 1c957a6298d3..cc912b7899ce 100644
--- a/drivers/accel/amdxdna/aie2_msg_priv.h
+++ b/drivers/accel/amdxdna/aie2_msg_priv.h
@@ -112,7 +112,8 @@ struct create_ctx_req {
 	__u32	aie_type;
 	__u8	start_col;
 	__u8	num_col;
-	__u16	reserved;
+	__u8    num_unused_col;
+	__u8	reserved;
 	__u8	num_cq_pairs_requested;
 	__u8	reserved1;
 	__u16	pasid;
diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
index c6b5cf4ae5c4..a929fa98a121 100644
--- a/drivers/accel/amdxdna/aie2_pci.h
+++ b/drivers/accel/amdxdna/aie2_pci.h
@@ -232,6 +232,7 @@ struct aie2_hw_ops {
 enum aie2_fw_feature {
 	AIE2_NPU_COMMAND,
 	AIE2_PREEMPT,
+	AIE2_TEMPORAL_ONLY,
 	AIE2_FEATURE_MAX
 };
 
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h b/drivers/accel/amdxdna/amdxdna_ctx.h
index b6151244d64f..b29449a92f60 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.h
+++ b/drivers/accel/amdxdna/amdxdna_ctx.h
@@ -98,6 +98,7 @@ struct amdxdna_hwctx {
 	u32				*col_list;
 	u32				start_col;
 	u32				num_col;
+	u32				num_unused_col;
 #define HWCTX_STAT_INIT  0
 #define HWCTX_STAT_READY 1
 #define HWCTX_STAT_STOP  2
diff --git a/drivers/accel/amdxdna/npu4_regs.c b/drivers/accel/amdxdna/npu4_regs.c
index 4ca21db70478..a62234fd266d 100644
--- a/drivers/accel/amdxdna/npu4_regs.c
+++ b/drivers/accel/amdxdna/npu4_regs.c
@@ -90,6 +90,7 @@ const struct dpm_clk_freq npu4_dpm_clk_table[] = {
 const struct aie2_fw_feature_tbl npu4_fw_feature_table[] = {
 	{ .feature = AIE2_NPU_COMMAND, .min_minor = 15 },
 	{ .feature = AIE2_PREEMPT, .min_minor = 12 },
+	{ .feature = AIE2_TEMPORAL_ONLY, .min_minor = 12 },
 	{ 0 }
 };
 
-- 
2.34.1

