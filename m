Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F316C9E46F4
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 22:38:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42DAC10ED49;
	Wed,  4 Dec 2024 21:38:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BTHybL10";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2087.outbound.protection.outlook.com [40.107.223.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 977C510ED5F
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 21:38:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iRiMVoi80pRXedK6XaMWOpUuf9Qe+iFpfnTPQR3XHtCzCtNLBMoWT3aiUJtfvg97cd2tViI0DQ/G8GUT+PLsmdqaJZ5d40YFgHqC6oTOsnwQGTJr1EYYafv//xnl5pO4VptNGhmGLpXp4SD4H8aNDOqgn7WZSv1EnFTzfhrGNYwSz8QXqrLZDNnYoUH/wP8iDvpku+/dGvS2N4ZDvgGIyYzsB82ua73Y+0Q3f5H5T+9+TC2u2nHENZQHiIAQEo4XvEmayE+NrImRjiPyThLus5ZvAzn4DUOz55XOYZmk2OOJtMAUUzEy/ieh9GazwPn7FkHHm0qF7+IVNH2KCtt3Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9JD9iEkpsR/D34L2zmydsjU3gvB5+MR4TzJdf9I8yoA=;
 b=PG4bXtqhqAeYZS+EI1ic02nHj+FXe1OTD3hueTcD2gS4m0qMlL9Rr5DVYUnG96b9qYA/CExCHfz7QC6cjbM/RuywUckITlDp0ZpillzHgrpVnp2jk4vcKjYALL/mLZXrK4g1R0jI0MMGwKREVcgrwF6hm/bF40b2pZtJGlTSfSGhzs+2QNu6I4/ls5IdkRd8zSCznlEumnw2xhK2WE4ZAYREKlxHcUDZJ0iZMbJ6+qD7K3BjIn/X4ioIwYAVjyQLyDadzMwuQ/xYbC4q3fCtl9TwnBlBBOhDeNqYGt/hWzWgmlvg3YQ7WuKaAkbfp1UvcYX/69wXUi9cl+NK79EBNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9JD9iEkpsR/D34L2zmydsjU3gvB5+MR4TzJdf9I8yoA=;
 b=BTHybL10VCEd3hQeTNJ0wqQoUauq4SuWd/Fd0mVMTrFjYql/jVl7sEsz1hVV46lAfBkUiec31Jz/M6g4+ptImZeXPXKM9VFSzSU/iWbfUUN3NcPUyT4GxXCRHSoQjQjzN/Oa1K7n1nXwqYfEVS6mRGK4R+nVwqWnUWz7sOTG2dY=
Received: from CH2PR05CA0004.namprd05.prod.outlook.com (2603:10b6:610::17) by
 BY5PR12MB4147.namprd12.prod.outlook.com (2603:10b6:a03:205::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.20; Wed, 4 Dec
 2024 21:38:45 +0000
Received: from CH1PEPF0000AD82.namprd04.prod.outlook.com
 (2603:10b6:610:0:cafe::53) by CH2PR05CA0004.outlook.office365.com
 (2603:10b6:610::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.12 via Frontend Transport; Wed,
 4 Dec 2024 21:38:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD82.mail.protection.outlook.com (10.167.244.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Wed, 4 Dec 2024 21:38:45 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Dec
 2024 15:38:44 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 4 Dec 2024 15:38:43 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V1 7/7] accel/amdxdna: Read firmware interface version from
 registers
Date: Wed, 4 Dec 2024 13:37:29 -0800
Message-ID: <20241204213729.3113941-8-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241204213729.3113941-1-lizhi.hou@amd.com>
References: <20241204213729.3113941-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD82:EE_|BY5PR12MB4147:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fa0bbac-422e-4d61-53c1-08dd14ac07eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uIdm2Of59yQr/jQqwbE/U2MKZACYigduIjix2GpwHfgYIwVW9JOSSRfdaiRA?=
 =?us-ascii?Q?QIfikOJXTWqL8phoqAn6h3p+nBW3hWC83ZiRt7r5lTFuuiyRKrYGfT+REKac?=
 =?us-ascii?Q?HEDbW5ehvHfjxf60FoouMp5DvH4Pahc+q6HpjwJ3lJ1ULVNqmpyJhivA84xq?=
 =?us-ascii?Q?K4w9qB2Gxh79n9PmspRTT1MKlqjzdhu9ygCtcTUgh1joIWSiYaxS6zarWfyI?=
 =?us-ascii?Q?onJIyLM+LwBqUvVhd8Njsih71el4Jug/1jVT41TqDYNXX5vliOfT8pDC9gKu?=
 =?us-ascii?Q?feZ7Bllx3GOcBQ79VS1saErN42NIHdfoxe2hsgqS+P9Jcy+/D9I5nUnS7+t7?=
 =?us-ascii?Q?FmzYVu9iqpiUH+NifRHuJey9Pc4mZXXEd2bho2NA0/pmMd23rwETlIzRQfos?=
 =?us-ascii?Q?Cu9Ve+zJHVoENtgnKIlpHXLkVZL4CHs/gpiX7xSrBLBRGaLpTRANZYgk2rvw?=
 =?us-ascii?Q?OyhiQw3P2jV1GA7DRpeIiwUS1fSQWqAuQTZLvhPbH1qxn88sq6pRZx+Yztzn?=
 =?us-ascii?Q?tJhLZyIXPM1CSAPfBOGmQNH+FbntijU6sdLrMJPDIVn49dFAz1uCIwgkiGlr?=
 =?us-ascii?Q?pmoGdEBgdxAm4bhQcwXyOkZl0Ti/6mJ6k4dWakoojq8dAfKXVbsSxilIIcM/?=
 =?us-ascii?Q?KaWMOL6YTIBDaNhcBisBzu4xhxE4IZY+m7MYzlYn88LXok4Sqmy1QyQleVUH?=
 =?us-ascii?Q?zAh6TRxvFnoHz6Rvlphd/cxsnR/kwCduvkD822nxyxJt1BSb5MKyyZuUOue+?=
 =?us-ascii?Q?/PWAX9+aKqYRJOgLrE7dEAv+rD/QlNFVxsoYDirkq9bliPW6kRr7vPNq07uX?=
 =?us-ascii?Q?Ir8JKJwzGALD9u2u4if5iD9I2KF7BCOEYWdFKa7LsCFTGmPaQ7azPvkw3W0d?=
 =?us-ascii?Q?kEZtT6/9I1+B7VpunXPT4VkKwb4YytkhZmYKnUligQbn1VEOfeyZEX6ZuWQO?=
 =?us-ascii?Q?8timzHk1pYnQDojs7/8ZjGR4DoHijQxlEO8OsTS0GtCKWYwheUVgejsLwJ2W?=
 =?us-ascii?Q?erxH2efSBPYkkSyTi9NwRybhdNSp/D9lV658QPwY0jXfilZ0LcdlVNEHDU/e?=
 =?us-ascii?Q?ANED1g/MXPHkzTPqcWKa4sxAv0y4Fn2NcbaGJVt6E1rspqfxsO+pyLhcgyhp?=
 =?us-ascii?Q?vC8mK9/oKcUpfkkNJ4+hklJBeg/LO+TEJ/3a5EJxJaJaTOBmErf5wVbXgfYF?=
 =?us-ascii?Q?8avmCyEt2iHq5z9wzEOPEv+wwrUzI6L17fbeEi76Y88Dbx+7dMh3SgP2K7+t?=
 =?us-ascii?Q?c2aa+ORU78xXt50aJfxHWz4v/9UEQOJ4ydbVUmbkQ2Vdb+8JP+v/rFgMhOQY?=
 =?us-ascii?Q?V66a9mbM1jHV0EouL3wLM9fJdojtwQOdTBpUOHOUgiLK2RjIVJrmL9TrJEQJ?=
 =?us-ascii?Q?z877MXA7MKi4VD+TxJ7f0MUaYOeBVjj1MHGVIeru+/35BiWo5Eelbz/pxnX6?=
 =?us-ascii?Q?acQAb/bxCJVEGunxUvu+0KOwgmR3eUHW?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 21:38:45.5334 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fa0bbac-422e-4d61-53c1-08dd14ac07eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD82.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4147
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

The latest released firmware supports reading firmware interface version
from registers directly. The driver's probe routine reads the major and
minor version numbers. If the firmware interface does not compatible with
the driver, the driver's probe routine returns failure.

Co-developed-by: Min Ma <min.ma@amd.com>
Signed-off-by: Min Ma <min.ma@amd.com>
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_message.c | 26 ----------
 drivers/accel/amdxdna/aie2_pci.c     | 74 ++++++++++++++++++++++------
 drivers/accel/amdxdna/aie2_pci.h     |  6 +--
 drivers/accel/amdxdna/npu1_regs.c    |  2 +-
 drivers/accel/amdxdna/npu2_regs.c    |  2 +-
 drivers/accel/amdxdna/npu4_regs.c    |  2 +-
 drivers/accel/amdxdna/npu5_regs.c    |  2 +-
 7 files changed, 64 insertions(+), 50 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
index 13b5a96f8d25..f6d46e1e5086 100644
--- a/drivers/accel/amdxdna/aie2_message.c
+++ b/drivers/accel/amdxdna/aie2_message.c
@@ -100,32 +100,6 @@ int aie2_get_runtime_cfg(struct amdxdna_dev_hdl *ndev, u32 type, u64 *value)
 	return 0;
 }
 
-int aie2_check_protocol_version(struct amdxdna_dev_hdl *ndev)
-{
-	DECLARE_AIE2_MSG(protocol_version, MSG_OP_GET_PROTOCOL_VERSION);
-	struct amdxdna_dev *xdna = ndev->xdna;
-	int ret;
-
-	ret = aie2_send_mgmt_msg_wait(ndev, &msg);
-	if (ret) {
-		XDNA_ERR(xdna, "Failed to get protocol version, ret %d", ret);
-		return ret;
-	}
-
-	if (resp.major != ndev->priv->protocol_major) {
-		XDNA_ERR(xdna, "Incompatible firmware protocol version major %d minor %d",
-			 resp.major, resp.minor);
-		return -EINVAL;
-	}
-
-	if (resp.minor < ndev->priv->protocol_minor) {
-		XDNA_ERR(xdna, "Firmware minor version smaller than supported");
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
 int aie2_assign_mgmt_pasid(struct amdxdna_dev_hdl *ndev, u16 pasid)
 {
 	DECLARE_AIE2_MSG(assign_mgmt_pasid, MSG_OP_ASSIGN_MGMT_PASID);
diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index 489744a2e226..2d2b6b66617a 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -33,17 +33,51 @@ MODULE_PARM_DESC(aie2_max_col, "Maximum column could be used");
  * The related register and ring buffer information is on SRAM BAR.
  * This struct is the register layout.
  */
+#define MGMT_MBOX_MAGIC 0x55504e5f /* _NPU */
 struct mgmt_mbox_chann_info {
-	u32	x2i_tail;
-	u32	x2i_head;
-	u32	x2i_buf;
-	u32	x2i_buf_sz;
-	u32	i2x_tail;
-	u32	i2x_head;
-	u32	i2x_buf;
-	u32	i2x_buf_sz;
+	__u32	x2i_tail;
+	__u32	x2i_head;
+	__u32	x2i_buf;
+	__u32	x2i_buf_sz;
+	__u32	i2x_tail;
+	__u32	i2x_head;
+	__u32	i2x_buf;
+	__u32	i2x_buf_sz;
+	__u32	magic;
+	__u32	msi_id;
+	__u32	prot_major;
+	__u32	prot_minor;
+	__u32	rsvd[4];
 };
 
+static int aie2_check_protocol(struct amdxdna_dev_hdl *ndev, u32 fw_major, u32 fw_minor)
+{
+	struct amdxdna_dev *xdna = ndev->xdna;
+
+	/*
+	 * The driver supported mailbox behavior is defined by
+	 * ndev->priv->protocol_major and protocol_minor.
+	 *
+	 * When protocol_major and fw_major are different, it means driver
+	 * and firmware are incompatible.
+	 */
+	if (ndev->priv->protocol_major != fw_major) {
+		XDNA_ERR(xdna, "Incompatible firmware protocol major %d minor %d",
+			 fw_major, fw_minor);
+		return -EINVAL;
+	}
+
+	/*
+	 * When protocol_minor is greater then fw_minor, that means driver
+	 * relies on operation the installed firmware does not support.
+	 */
+	if (ndev->priv->protocol_minor > fw_minor) {
+		XDNA_ERR(xdna, "Firmware minor version smaller than supported");
+		return -EINVAL;
+	}
+	return 0;
+}
+
 static void aie2_dump_chann_info_debug(struct amdxdna_dev_hdl *ndev)
 {
 	struct amdxdna_dev *xdna = ndev->xdna;
@@ -57,6 +91,8 @@ static void aie2_dump_chann_info_debug(struct amdxdna_dev_hdl *ndev)
 	XDNA_DBG(xdna, "x2i ringbuf 0x%x", ndev->mgmt_x2i.rb_start_addr);
 	XDNA_DBG(xdna, "x2i rsize   0x%x", ndev->mgmt_x2i.rb_size);
 	XDNA_DBG(xdna, "x2i chann index 0x%x", ndev->mgmt_chan_idx);
+	XDNA_DBG(xdna, "mailbox protocol major 0x%x", ndev->mgmt_prot_major);
+	XDNA_DBG(xdna, "mailbox protocol minor 0x%x", ndev->mgmt_prot_minor);
 }
 
 static int aie2_get_mgmt_chann_info(struct amdxdna_dev_hdl *ndev)
@@ -87,6 +123,12 @@ static int aie2_get_mgmt_chann_info(struct amdxdna_dev_hdl *ndev)
 	for (i = 0; i < sizeof(info_regs) / sizeof(u32); i++)
 		reg[i] = readl(ndev->sram_base + off + i * sizeof(u32));
 
+	if (info_regs.magic != MGMT_MBOX_MAGIC) {
+		XDNA_ERR(ndev->xdna, "Invalid mbox magic 0x%x", info_regs.magic);
+		ret = -EINVAL;
+		goto done;
+	}
+
 	i2x = &ndev->mgmt_i2x;
 	x2i = &ndev->mgmt_x2i;
 
@@ -99,14 +141,20 @@ static int aie2_get_mgmt_chann_info(struct amdxdna_dev_hdl *ndev)
 	x2i->mb_tail_ptr_reg = AIE2_MBOX_OFF(ndev, info_regs.x2i_tail);
 	x2i->rb_start_addr   = AIE2_SRAM_OFF(ndev, info_regs.x2i_buf);
 	x2i->rb_size         = info_regs.x2i_buf_sz;
-	ndev->mgmt_chan_idx  = CHANN_INDEX(ndev, x2i->rb_start_addr);
 
+	ndev->mgmt_chan_idx  = info_regs.msi_id;
+	ndev->mgmt_prot_major = info_regs.prot_major;
+	ndev->mgmt_prot_minor = info_regs.prot_minor;
+
+	ret = aie2_check_protocol(ndev, ndev->mgmt_prot_major, ndev->mgmt_prot_minor);
+
+done:
 	aie2_dump_chann_info_debug(ndev);
 
 	/* Must clear address at FW_ALIVE_OFF */
 	writel(0, SRAM_GET_ADDR(ndev, FW_ALIVE_OFF));
 
-	return 0;
+	return ret;
 }
 
 int aie2_runtime_cfg(struct amdxdna_dev_hdl *ndev,
@@ -155,12 +203,6 @@ static int aie2_mgmt_fw_init(struct amdxdna_dev_hdl *ndev)
 {
 	int ret;
 
-	ret = aie2_check_protocol_version(ndev);
-	if (ret) {
-		XDNA_ERR(ndev->xdna, "Check header hash failed");
-		return ret;
-	}
-
 	ret = aie2_runtime_cfg(ndev, AIE2_RT_CFG_INIT, NULL);
 	if (ret) {
 		XDNA_ERR(ndev->xdna, "Runtime config failed");
diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
index 5f0bfe152455..7b42308767b2 100644
--- a/drivers/accel/amdxdna/aie2_pci.h
+++ b/drivers/accel/amdxdna/aie2_pci.h
@@ -39,9 +39,6 @@
 })
 
 #define CHAN_SLOT_SZ SZ_8K
-#define CHANN_INDEX(ndev, rbuf_off) \
-	(((rbuf_off) - SRAM_REG_OFF((ndev), MBOX_CHANN_OFF)) / CHAN_SLOT_SZ)
-
 #define MBOX_SIZE(ndev) \
 ({ \
 	typeof(ndev) _ndev = (ndev); \
@@ -170,6 +167,8 @@ struct amdxdna_dev_hdl {
 	struct xdna_mailbox_chann_res	mgmt_x2i;
 	struct xdna_mailbox_chann_res	mgmt_i2x;
 	u32				mgmt_chan_idx;
+	u32				mgmt_prot_major;
+	u32				mgmt_prot_minor;
 
 	u32				total_col;
 	struct aie_version		version;
@@ -262,7 +261,6 @@ int aie2_suspend_fw(struct amdxdna_dev_hdl *ndev);
 int aie2_resume_fw(struct amdxdna_dev_hdl *ndev);
 int aie2_set_runtime_cfg(struct amdxdna_dev_hdl *ndev, u32 type, u64 value);
 int aie2_get_runtime_cfg(struct amdxdna_dev_hdl *ndev, u32 type, u64 *value);
-int aie2_check_protocol_version(struct amdxdna_dev_hdl *ndev);
 int aie2_assign_mgmt_pasid(struct amdxdna_dev_hdl *ndev, u16 pasid);
 int aie2_query_aie_version(struct amdxdna_dev_hdl *ndev, struct aie_version *version);
 int aie2_query_aie_metadata(struct amdxdna_dev_hdl *ndev, struct aie_metadata *metadata);
diff --git a/drivers/accel/amdxdna/npu1_regs.c b/drivers/accel/amdxdna/npu1_regs.c
index c8f4d1cac65d..e408af57e378 100644
--- a/drivers/accel/amdxdna/npu1_regs.c
+++ b/drivers/accel/amdxdna/npu1_regs.c
@@ -65,7 +65,7 @@ const struct dpm_clk_freq npu1_dpm_clk_table[] = {
 const struct amdxdna_dev_priv npu1_dev_priv = {
 	.fw_path        = "amdnpu/1502_00/npu.sbin",
 	.protocol_major = 0x5,
-	.protocol_minor = 0x1,
+	.protocol_minor = 0x7,
 	.rt_config	= npu1_default_rt_cfg,
 	.dpm_clk_tbl	= npu1_dpm_clk_table,
 	.col_align	= COL_ALIGN_NONE,
diff --git a/drivers/accel/amdxdna/npu2_regs.c b/drivers/accel/amdxdna/npu2_regs.c
index ac63131f9c7c..286bd0d475e2 100644
--- a/drivers/accel/amdxdna/npu2_regs.c
+++ b/drivers/accel/amdxdna/npu2_regs.c
@@ -64,7 +64,7 @@
 const struct amdxdna_dev_priv npu2_dev_priv = {
 	.fw_path        = "amdnpu/17f0_00/npu.sbin",
 	.protocol_major = 0x6,
-	.protocol_minor = 0x1,
+	.protocol_minor = 0x6,
 	.rt_config	= npu4_default_rt_cfg,
 	.dpm_clk_tbl	= npu4_dpm_clk_table,
 	.col_align	= COL_ALIGN_NATURE,
diff --git a/drivers/accel/amdxdna/npu4_regs.c b/drivers/accel/amdxdna/npu4_regs.c
index a713ac18adfc..00c52833ce89 100644
--- a/drivers/accel/amdxdna/npu4_regs.c
+++ b/drivers/accel/amdxdna/npu4_regs.c
@@ -85,7 +85,7 @@ const struct dpm_clk_freq npu4_dpm_clk_table[] = {
 const struct amdxdna_dev_priv npu4_dev_priv = {
 	.fw_path        = "amdnpu/17f0_10/npu.sbin",
 	.protocol_major = 0x6,
-	.protocol_minor = 0x1,
+	.protocol_minor = 12,
 	.rt_config	= npu4_default_rt_cfg,
 	.dpm_clk_tbl	= npu4_dpm_clk_table,
 	.col_align	= COL_ALIGN_NATURE,
diff --git a/drivers/accel/amdxdna/npu5_regs.c b/drivers/accel/amdxdna/npu5_regs.c
index 67a5d5bc8a49..118849272f27 100644
--- a/drivers/accel/amdxdna/npu5_regs.c
+++ b/drivers/accel/amdxdna/npu5_regs.c
@@ -64,7 +64,7 @@
 const struct amdxdna_dev_priv npu5_dev_priv = {
 	.fw_path        = "amdnpu/17f0_11/npu.sbin",
 	.protocol_major = 0x6,
-	.protocol_minor = 0x1,
+	.protocol_minor = 12,
 	.rt_config	= npu4_default_rt_cfg,
 	.dpm_clk_tbl	= npu4_dpm_clk_table,
 	.col_align	= COL_ALIGN_NATURE,
-- 
2.34.1

