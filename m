Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E899F19E7
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2024 00:30:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 171B910F11E;
	Fri, 13 Dec 2024 23:30:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rCU6W6dK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::60c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D25610E44D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 23:30:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BZzi4Lkw3Tww4po4KWkxbx9Nyc1eG2DBotonR2oq3RzuK/mHCK/AQVMQBeSHRehrxOyWjy75u2wezVPDmhp5SYQ5w0KN7ecYZ/UwkEFaDy3jBwi7JzliPh4y2hUu3pvYVz0yofods+SXZkoL3O47rmhvM22NV4RL+fDDdlt7pkXy5OqTcuX7HOPZOKFykeCz8IHpXcBeMg4GVGuV0lRe/5rsvjUbRUiHRhs0Wbae7X08hbKnH1Zi+fEXRDUhxQfxogy2EdUStNOoJ3gNn6u+fkx5nkJi5dhTBH7PGQkZlLWw5Hd5mGuj0ALKgrTgIMP4MbMevDFj2YWsGE66aXjZ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ly6vUHAHQrKcCKLdVN3p34fdTFlaWjRn+mfCzMF1WU=;
 b=Bbr+A1de4DrHKOgnyYmwP0foxKWNvKq5T57M66desqu6J0uJ9CjL/I703oLKBhsXN2xRX5iiyzD7noljnUQzSvEDB/g3sWC7Ya0TFwfz/vuaGboE4avXYLlqVYlDfe9QeYFEAmokCQugJG3GMtusOK6ZfHOGsIH/SRMN592bNnbqM1sCPX462oCO/QR/H0xbC8VCexli03O9FkExeL/wYziceLk2/1VjP7Wa/joZOG9MW7djVsI3eAUFIuHpdgvyKLcBEidgy2x/KMePEEN76iIWZKVof1Tf91OCFGOErDzOyhB9q6W30MJbozFp7WlCzeJEFfy26MCUKA1lXSDXRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ly6vUHAHQrKcCKLdVN3p34fdTFlaWjRn+mfCzMF1WU=;
 b=rCU6W6dKtEV+RlbZV7xQDUHldkUQgI2mgngWNE6kFFjgcrE9cyGnbguySEy9hvb4OsDGuDHbd5XE4ax4LrAW44kWY+7crnN0Z61YQBcMy8V7lqjdJ/GtYRdgM0n2ltp06+h3j4IXFBosz0/jLJLRqxIyILT6dES0vbpRtR3s1Vw=
Received: from CH2PR10CA0002.namprd10.prod.outlook.com (2603:10b6:610:4c::12)
 by MW4PR12MB7117.namprd12.prod.outlook.com (2603:10b6:303:221::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.17; Fri, 13 Dec
 2024 23:29:54 +0000
Received: from CH2PEPF0000013D.namprd02.prod.outlook.com
 (2603:10b6:610:4c:cafe::72) by CH2PR10CA0002.outlook.office365.com
 (2603:10b6:610:4c::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.16 via Frontend Transport; Fri,
 13 Dec 2024 23:29:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF0000013D.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 13 Dec 2024 23:29:54 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Dec
 2024 17:29:53 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 13 Dec 2024 17:29:53 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V3 4/5] accel/amdxdna: Read firmware interface version from
 registers
Date: Fri, 13 Dec 2024 15:29:32 -0800
Message-ID: <20241213232933.1545388-5-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241213232933.1545388-1-lizhi.hou@amd.com>
References: <20241213232933.1545388-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013D:EE_|MW4PR12MB7117:EE_
X-MS-Office365-Filtering-Correlation-Id: 77c8dfde-c866-4102-04b1-08dd1bce0c74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C8wuaq0T2MYORRCw7wz4ONcTFhGDMG5K3x0/QUPFksXWKjFL8tbeJ2q8xEGS?=
 =?us-ascii?Q?/u6FDs+LFtZtLJDy50fkJfvgkhhuUmvNLOLNNa5wUuebZStsRqDpwRR3lv62?=
 =?us-ascii?Q?2ZI2DW8yun9LAVjWHjr9Ze5fvztRbhCTkruuiBs9ebQ1zxmCIBdVrUv8+Ihf?=
 =?us-ascii?Q?/2E1yF+cyEqTyLjwqL51P6Qs4uEPDozT21VPZjxnr6XtetTxLdog5nMxAcc5?=
 =?us-ascii?Q?AxDl3Una4e10GWKBJnd5dpK6zH+dk8M7SA2m0B+nzgdx1Z/SzSWEcHER8ic1?=
 =?us-ascii?Q?aSNr2cR7nIxyrmD7zD19irDQld+7YmPt0fJqmBwI67qW9Y2XMJMjeNzySlYD?=
 =?us-ascii?Q?34NdX3dq45CZUzj37W2/ismLg5DcDAS2sxCfpwE7dO0LazIG0TdeuSDp81ex?=
 =?us-ascii?Q?pFWkCQKDDCqtU5B3OK4iSrn/j+++KMIlOiX9qALwCPNYvCgWHmnkxIQXBioC?=
 =?us-ascii?Q?k5RcAlgLtZfxVyHFHjN8lfczMtwEYngWZCEjw4d5ECiANTx8tTVKiX2uE9QY?=
 =?us-ascii?Q?dSnxolINsma7w5G8wWT67SzXruaznC0vlpqpxItg2rJ32SvD86apyx90EW7o?=
 =?us-ascii?Q?jr7vOF6IZgla0TeSCiTSVukAD7F2qha4+tU7fYHMXjDUFEIbR6crTdF/t4f9?=
 =?us-ascii?Q?PTFSmcDQpwCBPoRSp2I/Tr1Tq23sNr5YZe1iiXq7TOOYSvFRJVaR3XsUU4fH?=
 =?us-ascii?Q?zpaMvcXKs7OQj+BOG0UYFyWDmVEncxHfl2GsmRDQd74+GXN2ynMlL0fVZVKv?=
 =?us-ascii?Q?5DN+dwrTeqYZFQz6WlGveDaSzVJ4AZA+qtNtwaglgy+p8WoTCMolc6g1CX3F?=
 =?us-ascii?Q?tB5eAwxaQClkbG1DzJD88hrgyQ31xwRAGubDBVyIa14UuK5MXv20lPTVOKN/?=
 =?us-ascii?Q?sdmip2NIUdEOjuPhmlfGiFEogk4KKBg3CcWQp9Q9qoO/rN8sL1Cn2EqXBHKs?=
 =?us-ascii?Q?QiuA3QUmfX+VAEOwS8vrPldrprzltIf7T9A8l/BbVG8q2eqpouZWr9BWC/6g?=
 =?us-ascii?Q?xBKxZ36MYiYI06s2pnzFmQ/n1YOvhNoiqjcRx2W7iZ2TNTgWN5p53YHQR2n8?=
 =?us-ascii?Q?VNNuAlT3ujjXTWCP1bNavHLY5lf1039xH54yd2QHqbLldR0c+UeGsZ3WpYQl?=
 =?us-ascii?Q?mLQ7l2qWkuvRPPps3Ib9XlClCY6dhxIT3fXRjXPK7oeSMOcn7s7R7dIZOWRR?=
 =?us-ascii?Q?HJvUmymynGRJa5tHqd3usSMmBXtxHxk/L+drLEC1auGZdwpxr3VRwS7EccIb?=
 =?us-ascii?Q?Yb/YjI9BAuxdqYq4/PrvFZN0zd9ovf7EU4jlS8ygC41ZSOFtIYBNrG7ciCu1?=
 =?us-ascii?Q?Zh7iu5Svp1K7RH7hiPQTLO7FaOFhqV8qCTpLLWENifQfC2p4zXp4Q48xs/if?=
 =?us-ascii?Q?YvAUnbEU7TX4nprzvOpnLpSBRYT3m/xWMyiUq13csThtuF2yVhKVKxMz8ncB?=
 =?us-ascii?Q?WJGgTWBNwrTCsxg51WfNLsOlrbAT4HzG36jTfWyr6z/JlHFA2N2eLRGSneYt?=
 =?us-ascii?Q?M6BDZx7L8gKWSGA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 23:29:54.1683 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77c8dfde-c866-4102-04b1-08dd1bce0c74
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7117
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
minor version numbers. If the firmware interface is not compatible with
the driver, the driver's probe routine returns failure.

Co-developed-by: Min Ma <min.ma@amd.com>
Signed-off-by: Min Ma <min.ma@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
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
index 640330fd5cbd..b2ca78cfd0a7 100644
--- a/drivers/accel/amdxdna/aie2_message.c
+++ b/drivers/accel/amdxdna/aie2_message.c
@@ -101,32 +101,6 @@ int aie2_get_runtime_cfg(struct amdxdna_dev_hdl *ndev, u32 type, u64 *value)
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
index c71b5e434dee..8de8f3bd4987 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -34,17 +34,51 @@ MODULE_PARM_DESC(aie2_max_col, "Maximum column could be used");
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
@@ -58,6 +92,8 @@ static void aie2_dump_chann_info_debug(struct amdxdna_dev_hdl *ndev)
 	XDNA_DBG(xdna, "x2i ringbuf 0x%x", ndev->mgmt_x2i.rb_start_addr);
 	XDNA_DBG(xdna, "x2i rsize   0x%x", ndev->mgmt_x2i.rb_size);
 	XDNA_DBG(xdna, "x2i chann index 0x%x", ndev->mgmt_chan_idx);
+	XDNA_DBG(xdna, "mailbox protocol major 0x%x", ndev->mgmt_prot_major);
+	XDNA_DBG(xdna, "mailbox protocol minor 0x%x", ndev->mgmt_prot_minor);
 }
 
 static int aie2_get_mgmt_chann_info(struct amdxdna_dev_hdl *ndev)
@@ -88,6 +124,12 @@ static int aie2_get_mgmt_chann_info(struct amdxdna_dev_hdl *ndev)
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
 
@@ -100,14 +142,20 @@ static int aie2_get_mgmt_chann_info(struct amdxdna_dev_hdl *ndev)
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
@@ -156,12 +204,6 @@ static int aie2_mgmt_fw_init(struct amdxdna_dev_hdl *ndev)
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

