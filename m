Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 684A69E7B47
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 23:00:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A26810F1D3;
	Fri,  6 Dec 2024 22:00:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uzH1l2Kk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11B010E63B
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 22:00:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=arqdZGiJ0l1vL0jy+Nmt45JtIbrCRgjK0NgQc33xvt2pj2ZllufjFwfw6hlaTXWzfSeNQDl6tLEN9CiSATHQpEjKc+N8yHX+CCex+yAZhdGdEVaeoo+ArKBDTI5Lot9aaJqJHdAbk9Yek2KAW4GHGw8fQyo7KhdTbnnzSjMCfK00AA4XrYArFggjO5Y0QyG/cd5jxMNqaWJe3BUgy8D4dd0n8ep4lj94269uU059xxFWy+2VdW9kfB2BhEFQ12jF11Fu3ikE17KoLbcH0tgxFv8gdi75yk3i01qWaW9kEWKoHcPMTh5sLxIfsUrMuBO33zcBOSVoloPgFMgOwS8wTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9MAEkych0gZM+G1VVu4YwSSh2TQGOrnn9U5H/xW2Lvw=;
 b=g4JU7Irt24g7hoyGghvFSuSs8c5DPTdg9+1FP4nPE6zQQLrXjkcRcgXr6tXdy076xbuS3C7+s0XWARGtZieRT2K06buj4gP6qApUJ2lsVcIhv42dAe7EEHCajg2tKUkajwkLbphJamn6YsF8yyU24+aLAajNsOgZ/2yZDF3Q3PC6DuuzgJUDJkpJd8IQ71SyKd3dlCDu0paMD3CQngdhkZRHXCcyA3JdJDhhE7z/GoXRVpgE5/PEBaqvXW411yin3ktyk+/0P6HNOfi4LbLkK3bLPpo+HADn2qvZ5+AGEan0N48okJ/WHWIpi3+o2Gb4MMNjUOKHbgh62FkAcj0okg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9MAEkych0gZM+G1VVu4YwSSh2TQGOrnn9U5H/xW2Lvw=;
 b=uzH1l2KkjtvyXf7XQ7vKYYd+9aHqiwgaRpU6/rE0GkiiKFCQFIJfM9B8vKCIaqT9UKYzVzOMjZlm82TLm4B0JU4dms7rQDlY2ICM39IpS60YuHkZMm0kEMq3015F7+Ta83DOgAIisS3JBbadK9KArRU1knmXi5Uy+Upmdu8YdbA=
Received: from SJ0PR03CA0034.namprd03.prod.outlook.com (2603:10b6:a03:33e::9)
 by PH0PR12MB7864.namprd12.prod.outlook.com (2603:10b6:510:26c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.23; Fri, 6 Dec
 2024 22:00:20 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:a03:33e:cafe::91) by SJ0PR03CA0034.outlook.office365.com
 (2603:10b6:a03:33e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.12 via Frontend Transport; Fri,
 6 Dec 2024 22:00:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Fri, 6 Dec 2024 22:00:20 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Dec
 2024 16:00:17 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Dec
 2024 16:00:16 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 6 Dec 2024 16:00:16 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V2 4/8] accel/amdxdna: Replace idr api with xarray
Date: Fri, 6 Dec 2024 13:59:57 -0800
Message-ID: <20241206220001.164049-5-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241206220001.164049-1-lizhi.hou@amd.com>
References: <20241206220001.164049-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|PH0PR12MB7864:EE_
X-MS-Office365-Filtering-Correlation-Id: 68af1ce0-0b5f-422d-6b24-08dd16416094
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0mSOyplZL4bPw8h3U5yCRtXFlAF7W9qbmLnwy/le4UEjsUhtxiItNMIVNvKU?=
 =?us-ascii?Q?XXGiIJmccPUdh7XGaMAzr31McuJOenQ2usksHHfrQ/EhEypTZfm05UZG46NI?=
 =?us-ascii?Q?MMxsexMoB+oq1mboUSyo5V63za/Jwv0GeFpEN/MYuEZ7Bs9NobM1DkXTxCoe?=
 =?us-ascii?Q?25XAIl1a/WlO9F0m7UGnFWfpq0guo2/6MVh6OsLXu/QnPBeC6nufEqqEgAsh?=
 =?us-ascii?Q?3vs0ckUH+1yuWLn3ljn8wzSvvzftzAa1QhDQphPg6WgEXBaKPyPgQaxhdDVB?=
 =?us-ascii?Q?zf811FELMduyGWdK7fp3Q69znDh67NPI/pgYTIHiXOio6kaiqvJsSo1btHBo?=
 =?us-ascii?Q?CwehrJqxFbAhegcbcpFx2J1OP/oxgyXR1mXeBiebOsTv/8RdsksIDe9r2sV9?=
 =?us-ascii?Q?uKMBrfRWp/fEW5HFiYk/mTMbkQTPc7paOgkXE+JXEX4Gh0Us7MYOfsImM++h?=
 =?us-ascii?Q?9eRaeDBS9SfAiIL4hDkWvdWVSXsh13KgQSMFJiKH6t9hYFPVGhnZjLBsaJND?=
 =?us-ascii?Q?QNahWQoeo/a0pWz2o3A9DUBtl7u7WqEzGnTwykSCOSc2gBEPKb9OCk8OTAQO?=
 =?us-ascii?Q?WJd9fHLbj9sA2szK/i9xZLFqT+yprWELJpxTsFMy7TC/GhfyVtTtSCcwqKKy?=
 =?us-ascii?Q?wZ08nUUaiUbIVVHPcHsvr4fE+udyPvd2geBSwf0M126y9J5s+mVg00zbMqYA?=
 =?us-ascii?Q?XnBTOr2fnB4tlkvSQccpzcYawCe3e+PaoI75iTvNzY7uLgwqPi/nqbv9uWP4?=
 =?us-ascii?Q?ig9DKS0Jh1sN884aMZsZIZdgBET1seeqHw2zjin5hqzYI7okLCmOYbWzO9hD?=
 =?us-ascii?Q?Up5C/0Y5zBHu9EHArWAtxe/Z+MWF1CyYqY2vLJtQiCiYOcwB3uiy/ISL8iyh?=
 =?us-ascii?Q?VD4MS6XMeX6NuSp8c+o3cnqwJ+Cy45rCWBWHOxtxh4isozpeo0cVN+kLy1K+?=
 =?us-ascii?Q?Z2I2ZfPkx/gTqwg38ulbUpIunnSU+dIH2ARr9KWcYddDSOpCmramuor99LB6?=
 =?us-ascii?Q?iwKWZh9KoG1B4+BgvW4OxqyzpmMq2dPJGIJiKfzUc8sTRfAbKdNiOVPq+NRu?=
 =?us-ascii?Q?9NV7D/HWBMqd10/Nzvn7A55IlixCyxma/3a1XFzYmCQjHSdMSQT90qkKhnOF?=
 =?us-ascii?Q?QHtBGYzfikz/2SV2ja5YDt3SlXE8nbhA7CgnkNm19BwGxci5QFAeVENMoWZd?=
 =?us-ascii?Q?OUt+BRreTbWH5+CcVLYQTWyElJfr/y+VfGF6/P5B5LNFKnNOcjuC3KCRc68M?=
 =?us-ascii?Q?rXwbCF9ou8bLADOOAcradHdVf9YLKdzg0Yyn++5ePL4nVDfd8Iv8Xp6N/jH1?=
 =?us-ascii?Q?A6iNJzgxx4NWV9ftt7g+49XZ/rmg5+tRW9WV3tajMANIEUQinJ6AD+6pn4ID?=
 =?us-ascii?Q?FoqLPYizAnWbMKQqPNgmYWbTZIu4ICuw+MDA2X/MV6/cwnZAEwqT/jfhlvsi?=
 =?us-ascii?Q?yV4XN6d6GJCSloUrZgMAK0Nhy3+IsZdz?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 22:00:20.3940 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68af1ce0-0b5f-422d-6b24-08dd16416094
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7864
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

Switch mailbox message id and hardware context id management over from
the idr api to the xarray api.

Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/TODO              |  1 -
 drivers/accel/amdxdna/aie2_ctx.c        |  4 +-
 drivers/accel/amdxdna/aie2_message.c    |  4 +-
 drivers/accel/amdxdna/aie2_pci.c        |  5 +--
 drivers/accel/amdxdna/amdxdna_ctx.c     | 46 ++++++++-------------
 drivers/accel/amdxdna/amdxdna_mailbox.c | 55 ++++++++++---------------
 drivers/accel/amdxdna/amdxdna_pci_drv.c |  4 +-
 drivers/accel/amdxdna/amdxdna_pci_drv.h |  6 ++-
 8 files changed, 53 insertions(+), 72 deletions(-)

diff --git a/drivers/accel/amdxdna/TODO b/drivers/accel/amdxdna/TODO
index a130259f5f70..de4e1dbc8868 100644
--- a/drivers/accel/amdxdna/TODO
+++ b/drivers/accel/amdxdna/TODO
@@ -1,4 +1,3 @@
-- Replace idr with xa
 - Add import and export BO support
 - Add debugfs support
 - Add debug BO support
diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index b5282555bbf2..07eecb40767f 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -90,11 +90,11 @@ void aie2_restart_ctx(struct amdxdna_client *client)
 {
 	struct amdxdna_dev *xdna = client->xdna;
 	struct amdxdna_hwctx *hwctx;
-	int next = 0;
+	unsigned long hwctx_id;
 
 	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
 	mutex_lock(&client->hwctx_lock);
-	idr_for_each_entry_continue(&client->hwctx_idr, hwctx, next) {
+	amdxdna_for_each_hwctx(client, hwctx_id, hwctx) {
 		if (hwctx->status != HWCTX_STAT_STOP)
 			continue;
 
diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
index c01a1d957b56..fc33a158d223 100644
--- a/drivers/accel/amdxdna/aie2_message.c
+++ b/drivers/accel/amdxdna/aie2_message.c
@@ -315,10 +315,10 @@ int aie2_query_status(struct amdxdna_dev_hdl *ndev, char __user *buf,
 	struct amdxdna_dev *xdna = ndev->xdna;
 	struct amdxdna_client *client;
 	struct amdxdna_hwctx *hwctx;
+	unsigned long hwctx_id;
 	dma_addr_t dma_addr;
 	u32 aie_bitmap = 0;
 	u8 *buff_addr;
-	int next = 0;
 	int ret, idx;
 
 	buff_addr = dma_alloc_noncoherent(xdna->ddev.dev, size, &dma_addr,
@@ -329,7 +329,7 @@ int aie2_query_status(struct amdxdna_dev_hdl *ndev, char __user *buf,
 	/* Go through each hardware context and mark the AIE columns that are active */
 	list_for_each_entry(client, &xdna->client_list, node) {
 		idx = srcu_read_lock(&client->hwctx_srcu);
-		idr_for_each_entry_continue(&client->hwctx_idr, hwctx, next)
+		amdxdna_for_each_hwctx(client, hwctx_id, hwctx)
 			aie_bitmap |= amdxdna_hwctx_col_map(hwctx);
 		srcu_read_unlock(&client->hwctx_srcu, idx);
 	}
diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index 19c76b2b204b..1c8170325837 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -674,11 +674,11 @@ static int aie2_get_hwctx_status(struct amdxdna_client *client,
 	struct amdxdna_drm_query_hwctx *tmp;
 	struct amdxdna_client *tmp_client;
 	struct amdxdna_hwctx *hwctx;
+	unsigned long hwctx_id;
 	bool overflow = false;
 	u32 req_bytes = 0;
 	u32 hw_i = 0;
 	int ret = 0;
-	int next;
 	int idx;
 
 	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
@@ -690,8 +690,7 @@ static int aie2_get_hwctx_status(struct amdxdna_client *client,
 	buf = u64_to_user_ptr(args->buffer);
 	list_for_each_entry(tmp_client, &xdna->client_list, node) {
 		idx = srcu_read_lock(&tmp_client->hwctx_srcu);
-		next = 0;
-		idr_for_each_entry_continue(&tmp_client->hwctx_idr, hwctx, next) {
+		amdxdna_for_each_hwctx(tmp_client, hwctx_id, hwctx) {
 			req_bytes += sizeof(*tmp);
 			if (args->buffer_size < req_bytes) {
 				/* Continue iterating to get the required size */
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
index 5478b631b73f..64fc59b20a24 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.c
+++ b/drivers/accel/amdxdna/amdxdna_ctx.c
@@ -63,11 +63,11 @@ void amdxdna_hwctx_suspend(struct amdxdna_client *client)
 {
 	struct amdxdna_dev *xdna = client->xdna;
 	struct amdxdna_hwctx *hwctx;
-	int next = 0;
+	unsigned long hwctx_id;
 
 	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
 	mutex_lock(&client->hwctx_lock);
-	idr_for_each_entry_continue(&client->hwctx_idr, hwctx, next)
+	amdxdna_for_each_hwctx(client, hwctx_id, hwctx)
 		xdna->dev_info->ops->hwctx_suspend(hwctx);
 	mutex_unlock(&client->hwctx_lock);
 }
@@ -76,11 +76,11 @@ void amdxdna_hwctx_resume(struct amdxdna_client *client)
 {
 	struct amdxdna_dev *xdna = client->xdna;
 	struct amdxdna_hwctx *hwctx;
-	int next = 0;
+	unsigned long hwctx_id;
 
 	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
 	mutex_lock(&client->hwctx_lock);
-	idr_for_each_entry_continue(&client->hwctx_idr, hwctx, next)
+	amdxdna_for_each_hwctx(client, hwctx_id, hwctx)
 		xdna->dev_info->ops->hwctx_resume(hwctx);
 	mutex_unlock(&client->hwctx_lock);
 }
@@ -149,13 +149,13 @@ int amdxdna_cmd_get_cu_idx(struct amdxdna_gem_obj *abo)
 void amdxdna_hwctx_remove_all(struct amdxdna_client *client)
 {
 	struct amdxdna_hwctx *hwctx;
-	int next = 0;
+	unsigned long hwctx_id;
 
 	mutex_lock(&client->hwctx_lock);
-	idr_for_each_entry_continue(&client->hwctx_idr, hwctx, next) {
+	amdxdna_for_each_hwctx(client, hwctx_id, hwctx) {
 		XDNA_DBG(client->xdna, "PID %d close HW context %d",
 			 client->pid, hwctx->id);
-		idr_remove(&client->hwctx_idr, hwctx->id);
+		xa_erase(&client->hwctx_xa, hwctx->id);
 		mutex_unlock(&client->hwctx_lock);
 		amdxdna_hwctx_destroy_rcu(hwctx, &client->hwctx_srcu);
 		mutex_lock(&client->hwctx_lock);
@@ -194,15 +194,13 @@ int amdxdna_drm_create_hwctx_ioctl(struct drm_device *dev, void *data, struct dr
 	hwctx->num_tiles = args->num_tiles;
 	hwctx->mem_size = args->mem_size;
 	hwctx->max_opc = args->max_opc;
-	mutex_lock(&client->hwctx_lock);
-	ret = idr_alloc_cyclic(&client->hwctx_idr, hwctx, 0, MAX_HWCTX_ID, GFP_KERNEL);
+	ret = xa_alloc_cyclic(&client->hwctx_xa, &hwctx->id, hwctx,
+			      XA_LIMIT(AMDXDNA_INVALID_CTX_HANDLE + 1, MAX_HWCTX_ID),
+			      &client->next_hwctxid, GFP_KERNEL);
 	if (ret < 0) {
-		mutex_unlock(&client->hwctx_lock);
 		XDNA_ERR(xdna, "Allocate hwctx ID failed, ret %d", ret);
 		goto free_hwctx;
 	}
-	hwctx->id = ret;
-	mutex_unlock(&client->hwctx_lock);
 
 	hwctx->name = kasprintf(GFP_KERNEL, "hwctx.%d.%d", client->pid, hwctx->id);
 	if (!hwctx->name) {
@@ -228,9 +226,7 @@ int amdxdna_drm_create_hwctx_ioctl(struct drm_device *dev, void *data, struct dr
 free_name:
 	kfree(hwctx->name);
 rm_id:
-	mutex_lock(&client->hwctx_lock);
-	idr_remove(&client->hwctx_idr, hwctx->id);
-	mutex_unlock(&client->hwctx_lock);
+	xa_erase(&client->hwctx_xa, hwctx->id);
 free_hwctx:
 	kfree(hwctx);
 exit:
@@ -249,24 +245,18 @@ int amdxdna_drm_destroy_hwctx_ioctl(struct drm_device *dev, void *data, struct d
 	if (!drm_dev_enter(dev, &idx))
 		return -ENODEV;
 
-	/*
-	 * Use hwctx_lock to achieve exclusion with other hwctx writers,
-	 * SRCU to synchronize with exec/wait command ioctls.
-	 *
-	 * The pushed jobs are handled by DRM scheduler during destroy.
-	 */
-	mutex_lock(&client->hwctx_lock);
-	hwctx = idr_find(&client->hwctx_idr, args->handle);
+	hwctx = xa_erase(&client->hwctx_xa, args->handle);
 	if (!hwctx) {
-		mutex_unlock(&client->hwctx_lock);
 		ret = -EINVAL;
 		XDNA_DBG(xdna, "PID %d HW context %d not exist",
 			 client->pid, args->handle);
 		goto out;
 	}
-	idr_remove(&client->hwctx_idr, hwctx->id);
-	mutex_unlock(&client->hwctx_lock);
 
+	/*
+	 * The pushed jobs are handled by DRM scheduler during destroy.
+	 * SRCU to synchronize with exec command ioctls.
+	 */
 	amdxdna_hwctx_destroy_rcu(hwctx, &client->hwctx_srcu);
 
 	XDNA_DBG(xdna, "PID %d destroyed HW context %d", client->pid, args->handle);
@@ -324,7 +314,7 @@ int amdxdna_drm_config_hwctx_ioctl(struct drm_device *dev, void *data, struct dr
 
 	mutex_lock(&xdna->dev_lock);
 	idx = srcu_read_lock(&client->hwctx_srcu);
-	hwctx = idr_find(&client->hwctx_idr, args->handle);
+	hwctx = xa_load(&client->hwctx_xa, args->handle);
 	if (!hwctx) {
 		XDNA_DBG(xdna, "PID %d failed to get hwctx %d", client->pid, args->handle);
 		ret = -EINVAL;
@@ -436,7 +426,7 @@ int amdxdna_cmd_submit(struct amdxdna_client *client,
 	}
 
 	idx = srcu_read_lock(&client->hwctx_srcu);
-	hwctx = idr_find(&client->hwctx_idr, hwctx_hdl);
+	hwctx = xa_load(&client->hwctx_xa, hwctx_hdl);
 	if (!hwctx) {
 		XDNA_DBG(xdna, "PID %d failed to get hwctx %d",
 			 client->pid, hwctx_hdl);
diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
index eab79dbb8b25..fe684f463b94 100644
--- a/drivers/accel/amdxdna/amdxdna_mailbox.c
+++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
@@ -54,8 +54,8 @@ struct mailbox_channel {
 	struct xdna_mailbox_chann_res	res[CHAN_RES_NUM];
 	int				msix_irq;
 	u32				iohub_int_addr;
-	struct idr			chan_idr;
-	spinlock_t			chan_idr_lock; /* protect chan_idr */
+	struct xarray			chan_xa;
+	u32				next_msgid;
 	u32				x2i_tail;
 
 	/* Received msg related fields */
@@ -164,19 +164,17 @@ static inline int mailbox_validate_msgid(int msg_id)
 
 static int mailbox_acquire_msgid(struct mailbox_channel *mb_chann, struct mailbox_msg *mb_msg)
 {
-	unsigned long flags;
-	int msg_id;
+	u32 msg_id;
+	int ret;
 
-	spin_lock_irqsave(&mb_chann->chan_idr_lock, flags);
-	msg_id = idr_alloc_cyclic(&mb_chann->chan_idr, mb_msg, 0,
-				  MAX_MSG_ID_ENTRIES, GFP_NOWAIT);
-	spin_unlock_irqrestore(&mb_chann->chan_idr_lock, flags);
-	if (msg_id < 0)
-		return msg_id;
+	ret = xa_alloc_cyclic_irq(&mb_chann->chan_xa, &msg_id, mb_msg,
+				  XA_LIMIT(0, MAX_MSG_ID_ENTRIES - 1),
+				  &mb_chann->next_msgid, GFP_NOWAIT);
+	if (ret < 0)
+		return ret;
 
 	/*
-	 * The IDR becomes less efficient when dealing with larger IDs.
-	 * Thus, add MAGIC_VAL to the higher bits.
+	 * Add MAGIC_VAL to the higher bits.
 	 */
 	msg_id |= MAGIC_VAL;
 	return msg_id;
@@ -184,25 +182,17 @@ static int mailbox_acquire_msgid(struct mailbox_channel *mb_chann, struct mailbo
 
 static void mailbox_release_msgid(struct mailbox_channel *mb_chann, int msg_id)
 {
-	unsigned long flags;
-
 	msg_id &= ~MAGIC_VAL_MASK;
-	spin_lock_irqsave(&mb_chann->chan_idr_lock, flags);
-	idr_remove(&mb_chann->chan_idr, msg_id);
-	spin_unlock_irqrestore(&mb_chann->chan_idr_lock, flags);
+	xa_erase_irq(&mb_chann->chan_xa, msg_id);
 }
 
-static int mailbox_release_msg(int id, void *p, void *data)
+static void mailbox_release_msg(struct mailbox_channel *mb_chann,
+				struct mailbox_msg *mb_msg)
 {
-	struct mailbox_channel *mb_chann = data;
-	struct mailbox_msg *mb_msg = p;
-
 	MB_DBG(mb_chann, "msg_id 0x%x msg opcode 0x%x",
 	       mb_msg->pkg.header.id, mb_msg->pkg.header.opcode);
 	mb_msg->notify_cb(mb_msg->handle, NULL, 0);
 	kfree(mb_msg);
-
-	return 0;
 }
 
 static int
@@ -254,7 +244,6 @@ mailbox_get_resp(struct mailbox_channel *mb_chann, struct xdna_msg_header *heade
 		 void *data)
 {
 	struct mailbox_msg *mb_msg;
-	unsigned long flags;
 	int msg_id;
 	int ret;
 
@@ -265,15 +254,11 @@ mailbox_get_resp(struct mailbox_channel *mb_chann, struct xdna_msg_header *heade
 	}
 
 	msg_id &= ~MAGIC_VAL_MASK;
-	spin_lock_irqsave(&mb_chann->chan_idr_lock, flags);
-	mb_msg = idr_find(&mb_chann->chan_idr, msg_id);
+	mb_msg = xa_erase_irq(&mb_chann->chan_xa, msg_id);
 	if (!mb_msg) {
 		MB_ERR(mb_chann, "Cannot find msg 0x%x", msg_id);
-		spin_unlock_irqrestore(&mb_chann->chan_idr_lock, flags);
 		return -EINVAL;
 	}
-	idr_remove(&mb_chann->chan_idr, msg_id);
-	spin_unlock_irqrestore(&mb_chann->chan_idr_lock, flags);
 
 	MB_DBG(mb_chann, "opcode 0x%x size %d id 0x%x",
 	       header->opcode, header->total_size, header->id);
@@ -497,8 +482,7 @@ xdna_mailbox_create_channel(struct mailbox *mb,
 	memcpy(&mb_chann->res[CHAN_RES_X2I], x2i, sizeof(*x2i));
 	memcpy(&mb_chann->res[CHAN_RES_I2X], i2x, sizeof(*i2x));
 
-	spin_lock_init(&mb_chann->chan_idr_lock);
-	idr_init(&mb_chann->chan_idr);
+	xa_init_flags(&mb_chann->chan_xa, XA_FLAGS_ALLOC | XA_FLAGS_LOCK_IRQ);
 	mb_chann->x2i_tail = mailbox_get_tailptr(mb_chann, CHAN_RES_X2I);
 	mb_chann->i2x_head = mailbox_get_headptr(mb_chann, CHAN_RES_I2X);
 
@@ -530,13 +514,18 @@ xdna_mailbox_create_channel(struct mailbox *mb,
 
 int xdna_mailbox_destroy_channel(struct mailbox_channel *mb_chann)
 {
+	struct mailbox_msg *mb_msg;
+	unsigned long msg_id;
+
 	MB_DBG(mb_chann, "IRQ disabled and RX work cancelled");
 	free_irq(mb_chann->msix_irq, mb_chann);
 	destroy_workqueue(mb_chann->work_q);
 	/* We can clean up and release resources */
 
-	idr_for_each(&mb_chann->chan_idr, mailbox_release_msg, mb_chann);
-	idr_destroy(&mb_chann->chan_idr);
+	xa_for_each(&mb_chann->chan_xa, msg_id, mb_msg)
+		mailbox_release_msg(mb_chann, mb_msg);
+
+	xa_destroy(&mb_chann->chan_xa);
 
 	MB_DBG(mb_chann, "Mailbox channel destroyed, irq: %d", mb_chann->msix_irq);
 	kfree(mb_chann);
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
index 02533732d4ca..c3541796d189 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
@@ -77,7 +77,7 @@ static int amdxdna_drm_open(struct drm_device *ddev, struct drm_file *filp)
 	}
 	mutex_init(&client->hwctx_lock);
 	init_srcu_struct(&client->hwctx_srcu);
-	idr_init_base(&client->hwctx_idr, AMDXDNA_INVALID_CTX_HANDLE + 1);
+	xa_init_flags(&client->hwctx_xa, XA_FLAGS_ALLOC);
 	mutex_init(&client->mm_lock);
 
 	mutex_lock(&xdna->dev_lock);
@@ -108,7 +108,7 @@ static void amdxdna_drm_close(struct drm_device *ddev, struct drm_file *filp)
 
 	XDNA_DBG(xdna, "closing pid %d", client->pid);
 
-	idr_destroy(&client->hwctx_idr);
+	xa_destroy(&client->hwctx_xa);
 	cleanup_srcu_struct(&client->hwctx_srcu);
 	mutex_destroy(&client->hwctx_lock);
 	mutex_destroy(&client->mm_lock);
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h b/drivers/accel/amdxdna/amdxdna_pci_drv.h
index c50d65a050ad..f5b830fb14bb 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
@@ -100,7 +100,8 @@ struct amdxdna_client {
 	struct mutex			hwctx_lock; /* protect hwctx */
 	/* do NOT wait this srcu when hwctx_lock is held */
 	struct srcu_struct		hwctx_srcu;
-	struct idr			hwctx_idr;
+	struct xarray			hwctx_xa;
+	u32				next_hwctxid;
 	struct amdxdna_dev		*xdna;
 	struct drm_file			*filp;
 
@@ -111,6 +112,9 @@ struct amdxdna_client {
 	int				pasid;
 };
 
+#define amdxdna_for_each_hwctx(client, hwctx_id, entry)		\
+	xa_for_each(&(client)->hwctx_xa, hwctx_id, entry)
+
 /* Add device info below */
 extern const struct amdxdna_dev_info dev_npu1_info;
 extern const struct amdxdna_dev_info dev_npu2_info;
-- 
2.34.1

