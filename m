Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E94F8A0BFC2
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 19:26:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78B110E798;
	Mon, 13 Jan 2025 18:26:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gArjOceQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A4010E158
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 18:26:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IH67FMdPpDaI43rTqixqmD4QF7sF/kPlUP7PqWWM60/9ecT9AqAb0QYn+Ies8jXOXo8G9sc+500gfvFdoWyidramOXhWjU/2/ZGnIgrToXyEPdRympH+STO5FGytQV9fb0XE1tRNC+tpag31MG7ktB0+50zcxh7Ap9fEwYTkqUil1PfZgs6UGvGD9iySoAvwc2Fm7O9/8tzWMUKxPFhbyqAUq2adHOQQW8ggHHIE6LBrYknBoYJtLdEIYuZpoHdUy4evWQdI9lN4tSrApmaZ/PJKR+UcBBSDIWtUzsbV7X/4whQBZ0Cev4+sCxjl6CYep7fh1UMkW3ptl8iLnIDjGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z1TvOwt+RPTmUZY3hYa+/gp/flE0Cb8qyQOpDSG9wgo=;
 b=jQy1/wisoialFP0dtgeOSCd8yG/r4BaM44AdBwnXdeUSAF8T7N2EBbXkEXZEsji05xGVB9dgTKlxsGBjCPU32kEViIu+9mEzyn1DDwyWQy/BVYLGlTHewr0MXNX7DwRQcXhp729nXwPqDxkJSkJCr/LByoF7+kFPzrYyD01FTCCAH31ney3EaIVjHYGbqVxnD4ib9B+v+lPTTDJuE/f0VS1cI6Be/K5oRMUOQS9ftXKauBCRezCh4sCcGOgGHQJmDIcGgyMS4Ya3m8oGesqaexzeExCDEMRGRX2xwC74mIh/+DlQ6xoc2foVrrmn6miMYe8YEpybdb4uRwSGcQBb3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z1TvOwt+RPTmUZY3hYa+/gp/flE0Cb8qyQOpDSG9wgo=;
 b=gArjOceQH0GPCKoD69BSE6GbdupXnYLD1+FcUHdYjQ+Oq+ssoia43hAwKtuk6g2mLgS0hXR8co64dSYsfjY9iX9u9ZPQRf2jVkyIJbtubVmB3YtQm5XV1TrPf/jox9zHXu5CU2VUAR4KZuNsBCwLjbxEeWUNY1aA89EgtJCkSbk=
Received: from CH0P221CA0001.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::27)
 by MW4PR12MB6849.namprd12.prod.outlook.com (2603:10b6:303:20d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 18:26:25 +0000
Received: from CH1PEPF0000AD75.namprd04.prod.outlook.com
 (2603:10b6:610:11c:cafe::3d) by CH0P221CA0001.outlook.office365.com
 (2603:10b6:610:11c::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.18 via Frontend Transport; Mon,
 13 Jan 2025 18:26:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD75.mail.protection.outlook.com (10.167.244.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8356.11 via Frontend Transport; Mon, 13 Jan 2025 18:26:24 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 13 Jan
 2025 12:26:24 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 13 Jan 2025 12:26:23 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>, <mario.limonciello@amd.com>, kernel test robot
 <lkp@intel.com>
Subject: [PATCH 1/2] accel/amdxdna: Remove casting mailbox payload pointer
Date: Mon, 13 Jan 2025 10:26:16 -0800
Message-ID: <20250113182617.1256094-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD75:EE_|MW4PR12MB6849:EE_
X-MS-Office365-Filtering-Correlation-Id: e75dd726-be7a-4492-7e05-08dd33ffc992
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dQIO9H6vL86JQzbIHPa5jxaLWFa7lMle57M9QyvLrPrb+xMRDe0laG9m2O3+?=
 =?us-ascii?Q?4G3KoOOR6vaoap/m/Km08WrAaPjFmFAjn8EcbnaYzkwkYqA4c0MTaMBU+mYl?=
 =?us-ascii?Q?HiQ9649Z+Xf2dPc2LRJdD8trEAF0GKsIAGlad5RVmQCTAqD0MUl8jeG0HTcb?=
 =?us-ascii?Q?u9aBP7ZDX4Uih036cO/ohfWveXUm8gkBNr6707l+UpZr9qTaSzT9IsWftQj9?=
 =?us-ascii?Q?ElX37Lz3gzFKvAHy5yF5MVX74XmoZt8mYuocCQ+8pPnlxrSynGkmVBweLDyi?=
 =?us-ascii?Q?1EgSvUpR24lMXephIG5LZ+9plPcfCLK3W2yK7dcdOnGXRbuksVAPZCzXhYfv?=
 =?us-ascii?Q?xM6BJwEWLEHWbsozbHxWrBguZ/TK286lJsEt03VWWioTUXg2QSet2G91gYfd?=
 =?us-ascii?Q?b0mauJ57o0kXzE3FqhKorDOMo1i6iT+i9+xSgiXHC6ODCfBQGzGCuCyKqC/1?=
 =?us-ascii?Q?KCdmfjU6rt+aIgkC7O22dEDWTHGWF4bIJft+36O13cf/IupuLwCAh9dfc7tf?=
 =?us-ascii?Q?IrnePp2HeqzkpeHe155zl+zywmI+iVKw+IUmXxYX7fskLRA8Jqy+s/CZ1O3m?=
 =?us-ascii?Q?T+H7Z+m0HfRlu385q9ezMLv+sFVd1opstHzCsVjCXbsqX/f/gEkknDzlnjyK?=
 =?us-ascii?Q?Y+ZQu41FOXTVz3smaOcFApsuTT+MPzBFE7Xd0vaU/R10Txduf+ajckoHr35g?=
 =?us-ascii?Q?8x74LuOKCZa0ABXVXuxikfPdc4K2HkCsPgFxQkKaRx46MgX7xaU+/imHtxYl?=
 =?us-ascii?Q?Ex08WOfwvq0TdBGIB7TeTYLWbMIs+Ejy/5F2CxhkYm2gf1jlaF3ksua5/9kq?=
 =?us-ascii?Q?v1uMNZ6imOxD53r7rfvaBcGYJrmFZDE4EbbmSx07iZWnK/TlFgcHy4PEOk/A?=
 =?us-ascii?Q?XKV4IVgDUjdTGzG0hx9/YZaLTOVRqp5kyD0rQb0/PejpifWc1Op4G321Rx1T?=
 =?us-ascii?Q?kUcX0hb+OI9h+sPXD9nVX+1VugxPxtDpxEzngHlM522tvwnctROEhqTJx5bz?=
 =?us-ascii?Q?DuBNgsAwaX3eM9fJHXyn1TAirIQGxSDGHxJv6xg9nh3b3qJOkfCH19CcgJwx?=
 =?us-ascii?Q?D+XrghP+8Z+bhiodcgcwaIStUq03FGHvzFWSwUV9ntZmEXz97/aHJpheg0M8?=
 =?us-ascii?Q?S9kJjKrJNpscuSTmXB1016+ilgCFAnvnOh7TcDxy/kq1WSXRrzh/g8TUKhWl?=
 =?us-ascii?Q?Q/I3yX+MUKU4jotsQ6sF2uBwv8MpNrdnnXKogDaKtJ9Q/3E9ldtrUXsjgJvw?=
 =?us-ascii?Q?7Kw5Q4rYO0W83JfROnJbXEWxtemJ5vONSCqM/L6FRjmkZfqL6g5jLh00ijGx?=
 =?us-ascii?Q?XjysA1kKrZMg+AIy1wN0Y8b2LG8GVvCIMA/nyKWAtIe5KRkI0dDqSO7rrQpl?=
 =?us-ascii?Q?f0Bs5JYAREdE+wNg0V330LmmCAQ7KH5sPuhaXZVd6k66R2JlBc7V7zqrf1nQ?=
 =?us-ascii?Q?PeONTYT8HhYQmawWzS5aCvgdVB7quDGnVMn/ZcpKYwwSj71eRalvFLoqy0Uc?=
 =?us-ascii?Q?MSERvH0RTFpTsd0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 18:26:24.7039 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e75dd726-be7a-4492-7e05-08dd33ffc992
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD75.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6849
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

The mailbox payload pointer is void __iomem *. Casting it to u32 * is
incorrect and causes sparse warning.
  cast removes address space '__iomem' of expression

Fixes: b87f920b9344 ("accel/amdxdna: Support hardware mailbox")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501130921.ktqwsMLH-lkp@intel.com/
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_ctx.c              | 22 +++++++++----------
 drivers/accel/amdxdna/aie2_error.c            |  8 +++----
 drivers/accel/amdxdna/aie2_message.c          | 10 ++++-----
 drivers/accel/amdxdna/aie2_pci.h              | 10 ++++-----
 drivers/accel/amdxdna/amdxdna_mailbox.c       |  6 ++---
 drivers/accel/amdxdna/amdxdna_mailbox.h       |  2 +-
 .../accel/amdxdna/amdxdna_mailbox_helper.c    |  6 ++---
 .../accel/amdxdna/amdxdna_mailbox_helper.h    |  2 +-
 8 files changed, 32 insertions(+), 34 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 5f43db02b240..5c69ae3c40f8 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -185,7 +185,7 @@ aie2_sched_notify(struct amdxdna_sched_job *job)
 }
 
 static int
-aie2_sched_resp_handler(void *handle, const u32 *data, size_t size)
+aie2_sched_resp_handler(void *handle, void __iomem *data, size_t size)
 {
 	struct amdxdna_sched_job *job = handle;
 	struct amdxdna_gem_obj *cmd_abo;
@@ -203,7 +203,7 @@ aie2_sched_resp_handler(void *handle, const u32 *data, size_t size)
 		goto out;
 	}
 
-	status = *data;
+	status = readl(data);
 	XDNA_DBG(job->hwctx->client->xdna, "Resp status 0x%x", status);
 	if (status == AIE2_STATUS_SUCCESS)
 		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_COMPLETED);
@@ -216,7 +216,7 @@ aie2_sched_resp_handler(void *handle, const u32 *data, size_t size)
 }
 
 static int
-aie2_sched_nocmd_resp_handler(void *handle, const u32 *data, size_t size)
+aie2_sched_nocmd_resp_handler(void *handle, void __iomem *data, size_t size)
 {
 	struct amdxdna_sched_job *job = handle;
 	u32 ret = 0;
@@ -230,7 +230,7 @@ aie2_sched_nocmd_resp_handler(void *handle, const u32 *data, size_t size)
 		goto out;
 	}
 
-	status = *data;
+	status = readl(data);
 	XDNA_DBG(job->hwctx->client->xdna, "Resp status 0x%x", status);
 
 out:
@@ -239,14 +239,14 @@ aie2_sched_nocmd_resp_handler(void *handle, const u32 *data, size_t size)
 }
 
 static int
-aie2_sched_cmdlist_resp_handler(void *handle, const u32 *data, size_t size)
+aie2_sched_cmdlist_resp_handler(void *handle, void __iomem *data, size_t size)
 {
 	struct amdxdna_sched_job *job = handle;
 	struct amdxdna_gem_obj *cmd_abo;
-	struct cmd_chain_resp *resp;
 	struct amdxdna_dev *xdna;
 	u32 fail_cmd_status;
 	u32 fail_cmd_idx;
+	u32 cmd_status;
 	u32 ret = 0;
 
 	cmd_abo = job->cmd_bo;
@@ -256,17 +256,17 @@ aie2_sched_cmdlist_resp_handler(void *handle, const u32 *data, size_t size)
 		goto out;
 	}
 
-	resp = (struct cmd_chain_resp *)data;
+	cmd_status = readl(data + offsetof(struct cmd_chain_resp, status));
 	xdna = job->hwctx->client->xdna;
-	XDNA_DBG(xdna, "Status 0x%x", resp->status);
-	if (resp->status == AIE2_STATUS_SUCCESS) {
+	XDNA_DBG(xdna, "Status 0x%x", cmd_status);
+	if (cmd_status == AIE2_STATUS_SUCCESS) {
 		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_COMPLETED);
 		goto out;
 	}
 
 	/* Slow path to handle error, read from ringbuf on BAR */
-	fail_cmd_idx = resp->fail_cmd_idx;
-	fail_cmd_status = resp->fail_cmd_status;
+	fail_cmd_idx = readl(data + offsetof(struct cmd_chain_resp, fail_cmd_idx));
+	fail_cmd_status = readl(data + offsetof(struct cmd_chain_resp, fail_cmd_status));
 	XDNA_DBG(xdna, "Failed cmd idx %d, status 0x%x",
 		 fail_cmd_idx, fail_cmd_status);
 
diff --git a/drivers/accel/amdxdna/aie2_error.c b/drivers/accel/amdxdna/aie2_error.c
index b1defaa8513b..5ee905632a39 100644
--- a/drivers/accel/amdxdna/aie2_error.c
+++ b/drivers/accel/amdxdna/aie2_error.c
@@ -209,16 +209,14 @@ static u32 aie2_error_backtrack(struct amdxdna_dev_hdl *ndev, void *err_info, u3
 	return err_col;
 }
 
-static int aie2_error_async_cb(void *handle, const u32 *data, size_t size)
+static int aie2_error_async_cb(void *handle, void __iomem *data, size_t size)
 {
-	struct async_event_msg_resp *resp;
 	struct async_event *e = handle;
 
 	if (data) {
-		resp = (struct async_event_msg_resp *)data;
-		e->resp.type = resp->type;
+		e->resp.type = readl(data + offsetof(struct async_event_msg_resp, type));
 		wmb(); /* Update status in the end, so that no lock for here */
-		e->resp.status = resp->status;
+		e->resp.status = readl(data + offsetof(struct async_event_msg_resp, status));
 	}
 	queue_work(e->wq, &e->work);
 	return 0;
diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
index 9e2c9a44f76a..bf4219e32cc1 100644
--- a/drivers/accel/amdxdna/aie2_message.c
+++ b/drivers/accel/amdxdna/aie2_message.c
@@ -356,7 +356,7 @@ int aie2_query_status(struct amdxdna_dev_hdl *ndev, char __user *buf,
 }
 
 int aie2_register_asyn_event_msg(struct amdxdna_dev_hdl *ndev, dma_addr_t addr, u32 size,
-				 void *handle, int (*cb)(void*, const u32 *, size_t))
+				 void *handle, int (*cb)(void*, void __iomem *, size_t))
 {
 	struct async_event_msg_req req = { 0 };
 	struct xdna_mailbox_msg msg = {
@@ -435,7 +435,7 @@ int aie2_config_cu(struct amdxdna_hwctx *hwctx)
 }
 
 int aie2_execbuf(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
-		 int (*notify_cb)(void *, const u32 *, size_t))
+		 int (*notify_cb)(void *, void __iomem *, size_t))
 {
 	struct mailbox_channel *chann = hwctx->priv->mbox_chann;
 	struct amdxdna_dev *xdna = hwctx->client->xdna;
@@ -640,7 +640,7 @@ aie2_cmd_op_to_msg_op(u32 op)
 
 int aie2_cmdlist_multi_execbuf(struct amdxdna_hwctx *hwctx,
 			       struct amdxdna_sched_job *job,
-			       int (*notify_cb)(void *, const u32 *, size_t))
+			       int (*notify_cb)(void *, void __iomem *, size_t))
 {
 	struct amdxdna_gem_obj *cmdbuf_abo = aie2_cmdlist_get_cmd_buf(job);
 	struct mailbox_channel *chann = hwctx->priv->mbox_chann;
@@ -705,7 +705,7 @@ int aie2_cmdlist_multi_execbuf(struct amdxdna_hwctx *hwctx,
 
 int aie2_cmdlist_single_execbuf(struct amdxdna_hwctx *hwctx,
 				struct amdxdna_sched_job *job,
-				int (*notify_cb)(void *, const u32 *, size_t))
+				int (*notify_cb)(void *, void __iomem *, size_t))
 {
 	struct amdxdna_gem_obj *cmdbuf_abo = aie2_cmdlist_get_cmd_buf(job);
 	struct mailbox_channel *chann = hwctx->priv->mbox_chann;
@@ -740,7 +740,7 @@ int aie2_cmdlist_single_execbuf(struct amdxdna_hwctx *hwctx,
 }
 
 int aie2_sync_bo(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
-		 int (*notify_cb)(void *, const u32 *, size_t))
+		 int (*notify_cb)(void *, void __iomem *, size_t))
 {
 	struct mailbox_channel *chann = hwctx->priv->mbox_chann;
 	struct amdxdna_gem_obj *abo = to_xdna_obj(job->bos[0]);
diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
index f2d95531ddc2..385914840eaa 100644
--- a/drivers/accel/amdxdna/aie2_pci.h
+++ b/drivers/accel/amdxdna/aie2_pci.h
@@ -271,18 +271,18 @@ int aie2_destroy_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwc
 int aie2_map_host_buf(struct amdxdna_dev_hdl *ndev, u32 context_id, u64 addr, u64 size);
 int aie2_query_status(struct amdxdna_dev_hdl *ndev, char __user *buf, u32 size, u32 *cols_filled);
 int aie2_register_asyn_event_msg(struct amdxdna_dev_hdl *ndev, dma_addr_t addr, u32 size,
-				 void *handle, int (*cb)(void*, const u32 *, size_t));
+				 void *handle, int (*cb)(void*, void __iomem *, size_t));
 int aie2_config_cu(struct amdxdna_hwctx *hwctx);
 int aie2_execbuf(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
-		 int (*notify_cb)(void *, const u32 *, size_t));
+		 int (*notify_cb)(void *, void __iomem *, size_t));
 int aie2_cmdlist_single_execbuf(struct amdxdna_hwctx *hwctx,
 				struct amdxdna_sched_job *job,
-				int (*notify_cb)(void *, const u32 *, size_t));
+				int (*notify_cb)(void *, void __iomem *, size_t));
 int aie2_cmdlist_multi_execbuf(struct amdxdna_hwctx *hwctx,
 			       struct amdxdna_sched_job *job,
-			       int (*notify_cb)(void *, const u32 *, size_t));
+			       int (*notify_cb)(void *, void __iomem *, size_t));
 int aie2_sync_bo(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
-		 int (*notify_cb)(void *, const u32 *, size_t));
+		 int (*notify_cb)(void *, void __iomem *, size_t));
 
 /* aie2_hwctx.c */
 int aie2_hwctx_init(struct amdxdna_hwctx *hwctx);
diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
index 814b16bb1953..de7bf0fb4594 100644
--- a/drivers/accel/amdxdna/amdxdna_mailbox.c
+++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
@@ -90,7 +90,7 @@ struct mailbox_pkg {
 
 struct mailbox_msg {
 	void			*handle;
-	int			(*notify_cb)(void *handle, const u32 *data, size_t size);
+	int			(*notify_cb)(void *handle, void __iomem *data, size_t size);
 	size_t			pkg_size; /* package size in bytes */
 	struct mailbox_pkg	pkg;
 };
@@ -243,7 +243,7 @@ mailbox_send_msg(struct mailbox_channel *mb_chann, struct mailbox_msg *mb_msg)
 
 static int
 mailbox_get_resp(struct mailbox_channel *mb_chann, struct xdna_msg_header *header,
-		 void *data)
+		 void __iomem *data)
 {
 	struct mailbox_msg *mb_msg;
 	int msg_id;
@@ -331,7 +331,7 @@ static int mailbox_get_msg(struct mailbox_channel *mb_chann)
 	memcpy_fromio((u32 *)&header + 1, read_addr, rest);
 	read_addr += rest;
 
-	ret = mailbox_get_resp(mb_chann, &header, (u32 *)read_addr);
+	ret = mailbox_get_resp(mb_chann, &header, read_addr);
 
 	mailbox_set_headptr(mb_chann, head + msg_size);
 	/* After update head, it can equal to ringbuf_size. This is expected. */
diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.h b/drivers/accel/amdxdna/amdxdna_mailbox.h
index 57954c303bdd..ea367f2fb738 100644
--- a/drivers/accel/amdxdna/amdxdna_mailbox.h
+++ b/drivers/accel/amdxdna/amdxdna_mailbox.h
@@ -25,7 +25,7 @@ struct mailbox_channel;
 struct xdna_mailbox_msg {
 	u32		opcode;
 	void		*handle;
-	int		(*notify_cb)(void *handle, const u32 *data, size_t size);
+	int		(*notify_cb)(void *handle, void __iomem *data, size_t size);
 	u8		*send_data;
 	size_t		send_size;
 };
diff --git a/drivers/accel/amdxdna/amdxdna_mailbox_helper.c b/drivers/accel/amdxdna/amdxdna_mailbox_helper.c
index 5139a9c96a91..6d0c24513476 100644
--- a/drivers/accel/amdxdna/amdxdna_mailbox_helper.c
+++ b/drivers/accel/amdxdna/amdxdna_mailbox_helper.c
@@ -16,7 +16,7 @@
 #include "amdxdna_mailbox_helper.h"
 #include "amdxdna_pci_drv.h"
 
-int xdna_msg_cb(void *handle, const u32 *data, size_t size)
+int xdna_msg_cb(void *handle, void __iomem *data, size_t size)
 {
 	struct xdna_notify *cb_arg = handle;
 	int ret;
@@ -29,9 +29,9 @@ int xdna_msg_cb(void *handle, const u32 *data, size_t size)
 		goto out;
 	}
 
+	memcpy_fromio(cb_arg->data, data, cb_arg->size);
 	print_hex_dump_debug("resp data: ", DUMP_PREFIX_OFFSET,
-			     16, 4, data, cb_arg->size, true);
-	memcpy(cb_arg->data, data, cb_arg->size);
+			     16, 4, cb_arg->data, cb_arg->size, true);
 out:
 	ret = cb_arg->error;
 	complete(&cb_arg->comp);
diff --git a/drivers/accel/amdxdna/amdxdna_mailbox_helper.h b/drivers/accel/amdxdna/amdxdna_mailbox_helper.h
index 23e1317b79fe..710ff8873d61 100644
--- a/drivers/accel/amdxdna/amdxdna_mailbox_helper.h
+++ b/drivers/accel/amdxdna/amdxdna_mailbox_helper.h
@@ -35,7 +35,7 @@ struct xdna_notify {
 		.notify_cb = xdna_msg_cb,				\
 	}
 
-int xdna_msg_cb(void *handle, const u32 *data, size_t size);
+int xdna_msg_cb(void *handle, void __iomem *data, size_t size);
 int xdna_send_msg_wait(struct amdxdna_dev *xdna, struct mailbox_channel *chann,
 		       struct xdna_mailbox_msg *msg);
 
-- 
2.34.1

