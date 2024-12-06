Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B819E7B49
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 23:00:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEBFA10F1D4;
	Fri,  6 Dec 2024 22:00:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ubb807rH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E302C10E636
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 22:00:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eErihrXJjONLH435LCN2qnsG9rHEaW+bHnrRvji5PNOr6lOtjknGN7hAZNHh1ZGGbRVPNSNhLioDdrTlU9zLsHV1Ga4YiB7a1rVHIVf6DOunGjdL+ZqoXjeMt9d58EjP65RpEacUNrNp/7wJotXj60CgPAPbdHgCTdIF1MJXjkSGswLA8RxeJbnflo+oDt01+eMsXey80wuO8ZSkT+melMDmurih/jX1COY87G6Nnw2T65SdBWA2p/HLW2WrqxNbKf+nM78A6e+8auj6pddK/AtPNXuEAEOSyXnFXEk9DP/9oRFYHs5KtRC7KYiiIInLD7/aHqOB9IS7LzVVqm9lJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBGNkKcEDQ4LqQ6kLyvql5RHqPlY0+8IwCNc01Kudbs=;
 b=nwysJ3SsYgXpWb9cw9XboO6HJFyZDnP6T1Xq22Bf9xQmPknQKGk1geQG1zYUZQ5oRvff+MsNAmE71CXS8JXF2kTaSvimleLxlWcaMHb5zodhogkLSYYc6etH5kBCq21LIsZZYGGrr1w+bUG/IdBHkPf6x7gtbSW2GjzRu+kR5kOJ8OjMAaESvymDNp2XZ2NGJV6RzIKlcV3b26QhMObHuljwpYTk33zLVtt/Gj6WbJgm1suw777LSn8FkVaJ3IdYcQJsN8XlZBC42NOl1cZbIgRVhITCdebnL1ZlxfcaxZeMwLeF2ntyh3PFbL3j808oBE0lt8ACdFgf2D/jSWy7Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBGNkKcEDQ4LqQ6kLyvql5RHqPlY0+8IwCNc01Kudbs=;
 b=ubb807rH64FMwMm7P+CcNBgk8KBdc2bgjnKegHc6ES8U5L26UvW4ZpbRzsKQ4qHxDuoZVshis/wctOfcUolUCEHou2evK2GokQX1yA+ocYn1XskAu8wG21hfynGrVwmW7wRs1EFWFclbtkMV1s2ZZmefKnoq4MBq61cMaNO3izk=
Received: from SJ0PR03CA0036.namprd03.prod.outlook.com (2603:10b6:a03:33e::11)
 by DS0PR12MB6392.namprd12.prod.outlook.com (2603:10b6:8:cc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Fri, 6 Dec
 2024 22:00:22 +0000
Received: from SJ1PEPF00001CE3.namprd05.prod.outlook.com
 (2603:10b6:a03:33e:cafe::79) by SJ0PR03CA0036.outlook.office365.com
 (2603:10b6:a03:33e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.13 via Frontend Transport; Fri,
 6 Dec 2024 22:00:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE3.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Fri, 6 Dec 2024 22:00:22 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Dec
 2024 16:00:19 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 6 Dec 2024 16:00:19 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V2 7/8] accel/amdxdna: Read firmware interface version from
 registers
Date: Fri, 6 Dec 2024 14:00:00 -0800
Message-ID: <20241206220001.164049-8-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241206220001.164049-1-lizhi.hou@amd.com>
References: <20241206220001.164049-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE3:EE_|DS0PR12MB6392:EE_
X-MS-Office365-Filtering-Correlation-Id: dcd54560-7eed-4d4c-c682-08dd16416199
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zm4UZirJMWbH53uABRZ3HzWLNGVZY541rPSruBgwCu19Xivxal7PH+dpoQGq?=
 =?us-ascii?Q?ki5G3k4+a3sTJUYprJ5sBruEXzFGfQo0x08Ry563E3UxDhSnmR+oQaWACR+9?=
 =?us-ascii?Q?P9IDybIY5SuxIxaQkKyYOurGkmZlreyWci/bowMWwWLlQQv/eFXwoVb3on4p?=
 =?us-ascii?Q?J/9X3S8vgPjdyfUNsq5pbGY7h9b2urnShRGnp4mLnnFcUwbJ417CSZoflHa8?=
 =?us-ascii?Q?G3njNBgBfSCxt8rwOMeh0qM3bL5wLBU4QRnWwosw8fl2mrkNCsjjNb1qHe4U?=
 =?us-ascii?Q?qIwi8/rc3SG3jFtz5zW8MSMnPQolJIYKHj5o3TTS8hhwCtB17/d8EXH0pHRx?=
 =?us-ascii?Q?cddPBbO6YuXfDg6AGrEv2qHSOyvzymMqmkmVPFyg1G++VjdIp5g3jfoN++4N?=
 =?us-ascii?Q?YZ2u9t6Bfh7yD+TGdiuFRD4SzBvryyureJHKoroaWmw8d0yj5icigPYQHfcm?=
 =?us-ascii?Q?aztqMew4fYPgcvCl4apM9vWY7tLy5+POPr9tvWND7zjaP4rXiyocqKbTtP4c?=
 =?us-ascii?Q?00FMpGOGgmGXM8LHjqoojxGGzNv0v41EQS0M5UL0DHjIRv28RorDSLMcYju7?=
 =?us-ascii?Q?aQvkr62JqOtMGlwlA5u3pMyELssAeBPhTy9ocLIoA7txoqEh+c3hk1AwILgR?=
 =?us-ascii?Q?q4YIrBAlXTnSCgtU0WZ+aHmlaDDAe6y8xnuaWaMVyUMTlrg1i6CGrmqTkG66?=
 =?us-ascii?Q?iiQ1UxN+gSYkT2MJ222X6CMJnjlOAxQeYp1kABlUGyMU6rtnlOSm6tEo3zny?=
 =?us-ascii?Q?pqqbdldBkmuLa1NDus+t7mrkWMBeP+qPkWzmJTNWUGbVrTouy34lRQ/+L3fK?=
 =?us-ascii?Q?2Gztiz0WZ+ZsveYk7cMTKzSJo3+eXzCRLklsXtInqx8WDfB9wzQRutfL/aQh?=
 =?us-ascii?Q?ARe7dH5i/0YhKqfkXupWFuHyFXGYzKio6OgGZxP3y2tX/DF5812wuHSAsp1F?=
 =?us-ascii?Q?q4i9aU8UVGC2rDQcCOhIhkxBOgx6jdd95WmsbEXoZK0SKf43LZzw2mI/c6b1?=
 =?us-ascii?Q?uTkL2cArFQfi7H0p9xGdpf95l8isAx76eu4Pq+v8Qloma+kaqkcQCduGGn98?=
 =?us-ascii?Q?K0h4fgWtmIXiSb9WG+7fTBk7m7Ib4d4HaNjgUWKdVjo0QWRuga+OGygbiXlc?=
 =?us-ascii?Q?yeK/Ncc/NQINOhuohzBkXe4ZbSxHIM4BMYOe2ZQx28LJId0M/pu7C879Xe9o?=
 =?us-ascii?Q?0+59Cpywo4WZL5R8StrYe9s8RW059icAHSEYy9plOM0tAge6kZylEBZx7ydE?=
 =?us-ascii?Q?G7NkhCoFdynb0Se/aW/J/DHiMdSbYHJ/a5K6omeW8+SBpj3WEWyz703+W1My?=
 =?us-ascii?Q?eMa0OkwHgHVdIAE4KDn8qojofvOplYJai7GuGUxbp8E0f0jJ+JVMqiJnasiJ?=
 =?us-ascii?Q?hw1dplhJCgc/U4fPkV0S+DOAZi5dzkWpIvgj2jyPyRGpIzIzZ6QJrhEYS2gE?=
 =?us-ascii?Q?E2Tpke3SwmKL2GNdamPFowCGhctoLXYo?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 22:00:22.1069 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcd54560-7eed-4d4c-c682-08dd16416199
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6392
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
index 8c17b74654ce..cc159cadff9f 100644
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

