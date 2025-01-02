Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B01A0008B
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 22:23:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D2810E7B8;
	Thu,  2 Jan 2025 21:23:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bSPgEPYh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2062.outbound.protection.outlook.com [40.107.95.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C9CA10E3F9
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 21:23:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uXc10AXHZ6wEMWHdCdGpBITDpGWfJQG6gQSo4x1Gk3H2rEJ3b3UVaNNU5BK4gCWInnFKGC7AB2Kd6DNQKMgaKH7Q0KtQyQkEokFY1cLqPt8QAJ2eo5YQOyJhfbSlY64agGnq769AjcaTuVPmy56huaf62WjJWWl0xygW2PciRlx/uVzcULhdun/54tTbCDwUFLGWBOWft/qaK07c4VuoTWocuVz/SylYaICfaW3Z/2voKPp/955vOEDx/HS87JMCYi3DpC9RU7ENgPYUVdb180MqbnAWWq6wiaH1+ctUg6PxwBXV9n+z+Q5qmL+zWQmemlr86Um4zR3T8fzPnRZN7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMz9TsvgUCKgi51LjihlbvhsmpzjvwPH8C4G6HZruHA=;
 b=QrAaa5KAUUtSQ7nP9Pj/dHs8y8oa9HzK4fwGSbFHZikKeklwGFTl1gt4owGL8euRGZUA/C5lEUWCKM0FZRNOzzsiz79gjEEbS9z9BCuGj05YfA8cQwwdooES3V7LIsHuzxQxXIhYVckWo+6GwXrgks1m4Q4o/R0cKs2W3yKOGwb6MBg7jQhKf2pu4bIoREmrOHw8OnYPRUos3yysJSTWOJr14gYGsyCcSShqvVoxXWCuwPuqeGgqFZ/dqUnp5NRUR9zI7g1QddsF4WxxgbCXh16ZHEXpDy3an7HHY/7CDDw+Kok3IsiyWX3FVzJAG5ApptbOZZllsyr7P9OwANS/Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMz9TsvgUCKgi51LjihlbvhsmpzjvwPH8C4G6HZruHA=;
 b=bSPgEPYhHCpP/URSYmrXqqM9MDiGdHCo0uo7q8Et8T6WWreYudNSvuOczMupipnkdv9sakH+LqV/B+JnfHMfprKhwXEJpiCUqmTBNszCqGHEltDAUV9WQU/7RiXP38DdULYEPIgonPqViTAhg1oCv63LgQVENBMJkeN6JOPlftg=
Received: from SJ0PR03CA0387.namprd03.prod.outlook.com (2603:10b6:a03:3a1::32)
 by CH3PR12MB9217.namprd12.prod.outlook.com (2603:10b6:610:195::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.11; Thu, 2 Jan
 2025 21:22:52 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::65) by SJ0PR03CA0387.outlook.office365.com
 (2603:10b6:a03:3a1::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.13 via Frontend Transport; Thu,
 2 Jan 2025 21:22:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8314.11 via Frontend Transport; Thu, 2 Jan 2025 21:22:51 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 2 Jan
 2025 15:22:50 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 2 Jan 2025 15:22:49 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>, <mario.limonciello@amd.com>, kernel test robot
 <lkp@intel.com>
Subject: [PATCH V1 2/7] accel/amdxdna: Declare mailbox register base as
 __iomem pointer
Date: Thu, 2 Jan 2025 13:22:39 -0800
Message-ID: <20250102212244.1586340-2-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250102212244.1586340-1-lizhi.hou@amd.com>
References: <20250102212244.1586340-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|CH3PR12MB9217:EE_
X-MS-Office365-Filtering-Correlation-Id: 72c53397-9022-4e9a-ad07-08dd2b739d46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Poq8YT4xMcfbB2li16Y16gmMlmd6ltEeyi4bBnlWzBqkKfh8qAasfvCfhRgX?=
 =?us-ascii?Q?ti7F5mWeZz/arLvr3GroJ+t+I5HSRYDgt3zh6gR/zHaIaOGZ8m2i5Qx2EpY/?=
 =?us-ascii?Q?oadw7OY4a0b3ekMNLRurCgdmYOML7E5e8ZX1H9ELrCFLGW7MQ90/jM+esV1S?=
 =?us-ascii?Q?PUE8H1TySIFfpxfqv5R1yYwmmldv/Pr3ZB/bHAf239jCeH+otNwBxZVZk74h?=
 =?us-ascii?Q?3afSiMsJePU2dI7ZpEdV1Y1JSO58LAnN3Y1X/OeBbegKuWryAqgMjiXe+4xU?=
 =?us-ascii?Q?NUFeGAm0ayQHSZf6D4jyAdjK8BRo6h654iaipCG545IrcS5CVrUBry91/uFy?=
 =?us-ascii?Q?oLTGKvaC+TFTddTsFmw6VHpaHR3wdcZJurEwUjY5Dtbzt7GugLzZ1RG33OLO?=
 =?us-ascii?Q?/rJMVTQB65avUVO/vnQfVTvi4PzRUCp78vzh0dwlB+Rxy6UOkAKuKQKj4jYc?=
 =?us-ascii?Q?Uol3dX4+iWIYPC92nhu6UkmpNxDO7J+pAvzK3V0i0AJAOHOr8cDDy3quWfCk?=
 =?us-ascii?Q?hID4lmcQwOPxlorxAtj/NBi74ydgKmsTuHOUpvOKTYXQ/LYNCd+u9MiSIxsi?=
 =?us-ascii?Q?eAg1aoVYKcBSfgOUrqGfVMvoFT1XFNpnTxxV+5HeJ3oxchbU1OQxJY1xodBr?=
 =?us-ascii?Q?BZrnoWDQZxs3sgr/Uy8NqLXy/46C+ye0aWcccHOjiLbzMJjULORl/WO9SFPy?=
 =?us-ascii?Q?OxvIgQRPAGrdLd3dNqtUMDz0ZCfqgjeKAR27gFxHC/Ds5rfm0GlBSbqFYdKa?=
 =?us-ascii?Q?X6UqhyRAjz63ZAZsnU+K8ySmRdI3MQilh/m+EB5IOvPZ3eu00+WGWBVlI9Tf?=
 =?us-ascii?Q?EFuqHzMWZxhN2KiEiggA1WIt3AF9Rb6psgc8ZT+eartUwGYNs/BNAWstNDLq?=
 =?us-ascii?Q?8rn5nlpJHVJwj3S6MB5hfwDYQXEtJaWFU4BtAMt3exlGTM0xCBBg9DU7pQFf?=
 =?us-ascii?Q?Y6y9poeF9O0piZCxKHmcx4oitKcYNEnqDiD1I6i+gbj1U/+RXNxdj8/axcQx?=
 =?us-ascii?Q?Y7kf4vafuO1DiIBCTcOcnEnxKEtB19AYw3i/JorC4Shhyf3pWmYgIo6SnOXN?=
 =?us-ascii?Q?XSSH4lSZiiU4mdIm7zw4WEf6kb44cX5b/QSFaitDj+XeJNTXY8ZyJUfKZbZZ?=
 =?us-ascii?Q?kyJNFDniIxentnKkmQDtlw2ItwDuhze6BkEtPHO4GionQ1QThqp0VudidusU?=
 =?us-ascii?Q?Dk+7dT6xbB4lKg4XF+6AtQQR8SPI5zrorvORdFTP6NGoO8HtCvX17VWFiT9v?=
 =?us-ascii?Q?isLKPONDg/mogvpZH9ejVeRDUxeaeFv7cEHKa/lbYCpZzaBvZuFU0d6FD0I5?=
 =?us-ascii?Q?BtxvBEPtj7NN+LvrCW/LgLgMQCzuoH9/kfRd79QztIdlQvVOkppb8qFnpiKX?=
 =?us-ascii?Q?ghJXf1smcjrB7TcZkAwRRJjdWGdgwSBD39/+mQsBR7vyxFjodXMXb4pXmR/p?=
 =?us-ascii?Q?RjFO5u/6XpP0IIvswFqJzOxXRn2LC08HwFwxSs5YcGRbxqbQ+YANTJVGnNZ5?=
 =?us-ascii?Q?Jbpe0WTOVeBjhKM=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 21:22:51.4804 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72c53397-9022-4e9a-ad07-08dd2b739d46
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9217
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

Declare mailbox ringbuf_base and mbox_base as 'void __iomem *' to fix
sparse warnings:
  cast removes address space '__iomem' of expression
  incorrect type in argument 2 (different address spaces)

Fixes: b87f920b9344 ("accel/amdxdna: Support hardware mailbox")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202412310857.syD1sXXO-lkp@intel.com/
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_pci.c        |  4 ++--
 drivers/accel/amdxdna/amdxdna_mailbox.c | 24 ++++++++++++------------
 drivers/accel/amdxdna/amdxdna_mailbox.h |  4 ++--
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index 8de8f3bd4987..8b273bc7db44 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -380,9 +380,9 @@ static int aie2_hw_start(struct amdxdna_dev *xdna)
 		goto stop_psp;
 	}
 
-	mbox_res.ringbuf_base = (u64)ndev->sram_base;
+	mbox_res.ringbuf_base = ndev->sram_base;
 	mbox_res.ringbuf_size = pci_resource_len(pdev, xdna->dev_info->sram_bar);
-	mbox_res.mbox_base = (u64)ndev->mbox_base;
+	mbox_res.mbox_base = ndev->mbox_base;
 	mbox_res.mbox_size = MBOX_SIZE(ndev);
 	mbox_res.name = "xdna_mailbox";
 	ndev->mbox = xdnam_mailbox_create(&xdna->ddev, &mbox_res);
diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
index 1afc8079e3d1..814b16bb1953 100644
--- a/drivers/accel/amdxdna/amdxdna_mailbox.c
+++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
@@ -98,27 +98,27 @@ struct mailbox_msg {
 static void mailbox_reg_write(struct mailbox_channel *mb_chann, u32 mbox_reg, u32 data)
 {
 	struct xdna_mailbox_res *mb_res = &mb_chann->mb->res;
-	u64 ringbuf_addr = mb_res->mbox_base + mbox_reg;
+	void __iomem *ringbuf_addr = mb_res->mbox_base + mbox_reg;
 
-	writel(data, (void *)ringbuf_addr);
+	writel(data, ringbuf_addr);
 }
 
 static u32 mailbox_reg_read(struct mailbox_channel *mb_chann, u32 mbox_reg)
 {
 	struct xdna_mailbox_res *mb_res = &mb_chann->mb->res;
-	u64 ringbuf_addr = mb_res->mbox_base + mbox_reg;
+	void __iomem *ringbuf_addr = mb_res->mbox_base + mbox_reg;
 
-	return readl((void *)ringbuf_addr);
+	return readl(ringbuf_addr);
 }
 
 static int mailbox_reg_read_non_zero(struct mailbox_channel *mb_chann, u32 mbox_reg, u32 *val)
 {
 	struct xdna_mailbox_res *mb_res = &mb_chann->mb->res;
-	u64 ringbuf_addr = mb_res->mbox_base + mbox_reg;
+	void __iomem *ringbuf_addr = mb_res->mbox_base + mbox_reg;
 	int ret, value;
 
 	/* Poll till value is not zero */
-	ret = readx_poll_timeout(readl, (void *)ringbuf_addr, value,
+	ret = readx_poll_timeout(readl, ringbuf_addr, value,
 				 value, 1 /* us */, 100);
 	if (ret < 0)
 		return ret;
@@ -200,10 +200,10 @@ static void mailbox_release_msg(struct mailbox_channel *mb_chann,
 static int
 mailbox_send_msg(struct mailbox_channel *mb_chann, struct mailbox_msg *mb_msg)
 {
+	void __iomem *write_addr;
 	u32 ringbuf_size;
 	u32 head, tail;
 	u32 start_addr;
-	u64 write_addr;
 	u32 tmp_tail;
 
 	head = mailbox_get_headptr(mb_chann, CHAN_RES_X2I);
@@ -221,14 +221,14 @@ mailbox_send_msg(struct mailbox_channel *mb_chann, struct mailbox_msg *mb_msg)
 
 	if (tail >= head && tmp_tail > ringbuf_size - sizeof(u32)) {
 		write_addr = mb_chann->mb->res.ringbuf_base + start_addr + tail;
-		writel(TOMBSTONE, (void *)write_addr);
+		writel(TOMBSTONE, write_addr);
 
 		/* tombstone is set. Write from the start of the ringbuf */
 		tail = 0;
 	}
 
 	write_addr = mb_chann->mb->res.ringbuf_base + start_addr + tail;
-	memcpy_toio((void *)write_addr, &mb_msg->pkg, mb_msg->pkg_size);
+	memcpy_toio(write_addr, &mb_msg->pkg, mb_msg->pkg_size);
 	mailbox_set_tailptr(mb_chann, tail + mb_msg->pkg_size);
 
 	trace_mbox_set_tail(MAILBOX_NAME, mb_chann->msix_irq,
@@ -275,11 +275,11 @@ mailbox_get_resp(struct mailbox_channel *mb_chann, struct xdna_msg_header *heade
 static int mailbox_get_msg(struct mailbox_channel *mb_chann)
 {
 	struct xdna_msg_header header;
+	void __iomem *read_addr;
 	u32 msg_size, rest;
 	u32 ringbuf_size;
 	u32 head, tail;
 	u32 start_addr;
-	u64 read_addr;
 	int ret;
 
 	if (mailbox_reg_read_non_zero(mb_chann, mb_chann->res[CHAN_RES_I2X].mb_tail_ptr_reg, &tail))
@@ -302,7 +302,7 @@ static int mailbox_get_msg(struct mailbox_channel *mb_chann)
 
 	/* Peek size of the message or TOMBSTONE */
 	read_addr = mb_chann->mb->res.ringbuf_base + start_addr + head;
-	header.total_size = readl((void *)read_addr);
+	header.total_size = readl(read_addr);
 	/* size is TOMBSTONE, set next read from 0 */
 	if (header.total_size == TOMBSTONE) {
 		if (head < tail) {
@@ -328,7 +328,7 @@ static int mailbox_get_msg(struct mailbox_channel *mb_chann)
 
 	rest = sizeof(header) - sizeof(u32);
 	read_addr += sizeof(u32);
-	memcpy_fromio((u32 *)&header + 1, (void *)read_addr, rest);
+	memcpy_fromio((u32 *)&header + 1, read_addr, rest);
 	read_addr += rest;
 
 	ret = mailbox_get_resp(mb_chann, &header, (u32 *)read_addr);
diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.h b/drivers/accel/amdxdna/amdxdna_mailbox.h
index 6ab7f5424633..57954c303bdd 100644
--- a/drivers/accel/amdxdna/amdxdna_mailbox.h
+++ b/drivers/accel/amdxdna/amdxdna_mailbox.h
@@ -39,9 +39,9 @@ struct xdna_mailbox_msg {
  * @mbox_size:		mailbox size
  */
 struct xdna_mailbox_res {
-	u64		ringbuf_base;
+	void __iomem	*ringbuf_base;
 	size_t		ringbuf_size;
-	u64		mbox_base;
+	void __iomem	*mbox_base;
 	size_t		mbox_size;
 	const char	*name;
 };
-- 
2.34.1

