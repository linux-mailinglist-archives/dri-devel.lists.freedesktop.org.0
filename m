Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E808B94808D
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 19:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD0610E262;
	Mon,  5 Aug 2024 17:40:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FekzqGHm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448F210E262
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 17:40:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BY3SF5OrsGUXVAndv0I0Y20YW4SSjsAp+W3zRmkN+ditFF4sEkYFql8vaIIHjx9VOS4WtxVbziOkXJhaHrTqaBKuX7BkJggBb4RLyNUT6grLefz6O7sHKfGtGroBhSwpx8QY8fymi03p56z4FmDbKmvhTbCjE7x0WWEe64uHAOeXYDDePg7SyY4Th4Bh15QTj/ddQ8tqjRGlqOJOXkTvJ1ReM0NKX4lgp6Ikt14lQZJHldBlxmyWYJJlrjvdjZulFLbDqJroK4s70Y0EiL0XNfrD1Ir6myQwxSMw6jo99jzDZtvaq8k+1tAkVWPD7pOWGN7I1hpzJKi6N76p8QAozg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lhjlypeVxwuslSi0EdVbLh3vqnSN5XMcS0i6NDgJMAc=;
 b=CBcs4ONkqONJFbLukPkBkTo87gHYBDb7gIw6SLIGJkhbL6F/H1VdmBXC4BLqx3buvwM6s+marx9Yaj6zaW9LhnVsgStnjMrYSS/9vhZr1MZD1SAV3SxYdbWvaFM8+ABEKE+Gr7nXZNDwK9jpmXe25db5ZA1DiG4ho2K0ITrJkcyc0ePOwoezPFLwl18hxYptyHdIVla61R0t0rA0ZfiXGqTpi8Cg+Ijv4czGZ5sAC3xPnUHOshH+l1FJKxs4ZJI45Ehok4BmOOaAHTbW7GwOGng6ERC7rNESauiLE+Q93RSz6abVX6C3CoPHYNydATmbZQSGu2OaSpgHiwmSl10Zhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lhjlypeVxwuslSi0EdVbLh3vqnSN5XMcS0i6NDgJMAc=;
 b=FekzqGHmlxpWxqYz9WV0P8kTcbKaQ1Kg9CCB+g2u1hlS70iB9o7Q+iVN/BpiCzlAPPFd8QBPkMuiNBtz1oEL1UfpGPwoRNIdOJsClxstKGLokS4PVrfdQwgtzxOxFZ28GpjjcCtNpxMpNR2aBoNet1nzvRlBXNlW7NvexOFzPZc=
Received: from CH2PR15CA0006.namprd15.prod.outlook.com (2603:10b6:610:51::16)
 by BY5PR12MB4033.namprd12.prod.outlook.com (2603:10b6:a03:213::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 17:40:29 +0000
Received: from CH1PEPF0000AD75.namprd04.prod.outlook.com
 (2603:10b6:610:51:cafe::b9) by CH2PR15CA0006.outlook.office365.com
 (2603:10b6:610:51::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27 via Frontend
 Transport; Mon, 5 Aug 2024 17:40:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD75.mail.protection.outlook.com (10.167.244.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Mon, 5 Aug 2024 17:40:29 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 5 Aug
 2024 12:40:28 -0500
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 5 Aug 2024 12:40:27 -0500
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>, Narendra Gutta <VenkataNarendraKumar.Gutta@amd.com>,
 Xiaoming Ren <xiaoming.ren@amd.com>
Subject: [PATCH V2 07/10] accel/amdxdna: Add suspend and resume
Date: Mon, 5 Aug 2024 10:39:56 -0700
Message-ID: <20240805173959.3181199-8-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240805173959.3181199-1-lizhi.hou@amd.com>
References: <20240805173959.3181199-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD75:EE_|BY5PR12MB4033:EE_
X-MS-Office365-Filtering-Correlation-Id: 6efaec1a-5ef5-4c6e-c9a6-08dcb575b297
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Y2M/XmRTqtwerLl+eDCjd1bMvj+xka9EjeQ4WKiTRNXiZej3o2DrLBeb2EIZ?=
 =?us-ascii?Q?rmnftcHqJJHCeYoA1GbEARamZCIjFmuqRr9k5zalhnzwWJRZwi8eBnyvCJyx?=
 =?us-ascii?Q?EtbsudKv7IooKI25Ev5XPSGTE1HYhjxP2Mm9in5nZc96iw6yuSPCtcp7vwVz?=
 =?us-ascii?Q?SUngAR3krEuMyY47DZIpTM59pjTWrxashizeMxF21izHw/SmaYDVR+uiRu3a?=
 =?us-ascii?Q?emYE7ZzrVYMxjLF6BHcSl8nBMAhecDM+IuXsHercrUqY66jxrqAc7WXqTOuZ?=
 =?us-ascii?Q?JFQfvgBb30P/DL6opnvzNlVicQtcQa291XLKSjTBMX18T36zzrLuMHxJFIB1?=
 =?us-ascii?Q?mSRlnZGgYOdXqNeh4aA+zjOU6a/mnFBgUnFZ8DGIDhDav1Tcc+rl2cV+QNf5?=
 =?us-ascii?Q?D4rqWNeZ5Af+7FVke/Jkdvg7UOPmB0Y8Ln7sTjdWJljVDuz3TZOmgXJDCBRr?=
 =?us-ascii?Q?5BOY3kkunmblqxrKpBSPXdwyap3Jb52u69QA7Q9PBJIAwazMC5usEC3+amAn?=
 =?us-ascii?Q?em8a6ogpsxorGz3UDymWIBnfvHhl2W1pslWtazoGkgxyXXx03Puz8vEV3KA6?=
 =?us-ascii?Q?9YQyfF1xXX1N4rxc5E6TMfQMjJ/PvluO8vuOo84dECqKEhESV/YjksnNWTqi?=
 =?us-ascii?Q?JPlKhzAVIgflcTnmdEz5k57ELKDM67/Ct+wwK6M9LVoChX6kA3Pcdkvn98Mr?=
 =?us-ascii?Q?7t7WN3B5ZNtz+Epl4AFuMRLXRMsMR0HBs8Nyl07ezI3yvijGdOq42KRUqu1h?=
 =?us-ascii?Q?QQEMBAH3hGVG3Shw6isXuZx9YuFSEw+Wf/zrB/v1KKMSDPHynBshHEWjVQC7?=
 =?us-ascii?Q?YNVJ6WvgBksSdoLW/9Fc/TbBfdCDvVeBhukovWToRAbeM21FQlLFtOdohTkj?=
 =?us-ascii?Q?yBKIMoguA46Yn7osoRmcplXwxZwVSiqUy7laJCR0IeI8PBuT8VYWUI1jbSC5?=
 =?us-ascii?Q?2chO9X06NUTZSQlSxlfRXXfCiDC8L5Xa5DouVm4sk2YxmL192aXtk/HQbOj7?=
 =?us-ascii?Q?1MIns4zS43OQk82erOLpj3bxmInjqSrGQ2pqYX2jQMARQ5woUl3ijwTGyfv3?=
 =?us-ascii?Q?+AZZeSo1FINe1L7VMnoyT67goUiCADq6bB84Lq1Bp/W4jgDVD6yMGxaVKJyz?=
 =?us-ascii?Q?domXyO0vOwzv11gKFiEsZCLBowt7Yi+KlOi6RXANxc/B3CBfY6YI6DlDfWad?=
 =?us-ascii?Q?dEFdW+Xb/PKRZbN3Y1Fca63dLUThHpeXEnPGRsSOJshav3Tsl+2b0+ddySPg?=
 =?us-ascii?Q?ToswGlo6rPx/x072/kwpK38JIaNIPP0fIg7T90iz7B+qTauWC2IM4N8u/vK5?=
 =?us-ascii?Q?q60mW1+jglAtkUTJszfUForQPR0cBBIpcs+dBdQbMU5Y1o0FxApdfUXat4K1?=
 =?us-ascii?Q?dXgKu3UZCpD+mUSETqqBC+ty4kM1F8XFlIWxRT+yyOj9nRfso2v80TYxZUuK?=
 =?us-ascii?Q?Xj3fg2KoQ0T/KdNPIWLXvMsKC0ZjzelT?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 17:40:29.0923 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6efaec1a-5ef5-4c6e-c9a6-08dcb575b297
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD75.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4033
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

Implement PCI power management suspend and resume callbacks.

Co-developed-by: Narendra Gutta <VenkataNarendraKumar.Gutta@amd.com>
Signed-off-by: Narendra Gutta <VenkataNarendraKumar.Gutta@amd.com>
Co-developed-by: Xiaoming Ren <xiaoming.ren@amd.com>
Signed-off-by: Xiaoming Ren <xiaoming.ren@amd.com>
Co-developed-by: Min Ma <min.ma@amd.com>
Signed-off-by: Min Ma <min.ma@amd.com>
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_ctx.c        |  30 +++++++
 drivers/accel/amdxdna/aie2_pci.c        |   4 +
 drivers/accel/amdxdna/aie2_pci.h        |   2 +
 drivers/accel/amdxdna/amdxdna_ctx.c     |  26 ++++++
 drivers/accel/amdxdna/amdxdna_ctx.h     |   2 +
 drivers/accel/amdxdna/amdxdna_drm.c     |  17 +++-
 drivers/accel/amdxdna/amdxdna_drm.h     |   5 ++
 drivers/accel/amdxdna/amdxdna_pci_drv.c | 103 +++++++++++++++++++++++-
 8 files changed, 186 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index dbbc71c40f5f..1dbb89d28004 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -168,6 +168,36 @@ static int aie2_hwctx_wait_for_idle(struct amdxdna_hwctx *hwctx)
 	return 0;
 }
 
+void aie2_hwctx_suspend(struct amdxdna_hwctx *hwctx)
+{
+	struct amdxdna_dev *xdna = hwctx->client->xdna;
+
+	/*
+	 * Command timeout is unlikely. But if it happens, it doesn't
+	 * break the system. aie2_hwctx_stop() will destroy mailbox
+	 * and abort all commands.
+	 */
+	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
+	aie2_hwctx_wait_for_idle(hwctx);
+	aie2_hwctx_stop(xdna, hwctx, NULL);
+	hwctx->old_status = hwctx->status;
+	hwctx->status = HWCTX_STAT_STOP;
+}
+
+void aie2_hwctx_resume(struct amdxdna_hwctx *hwctx)
+{
+	struct amdxdna_dev *xdna = hwctx->client->xdna;
+
+	/*
+	 * The resume path cannot guarantee that mailbox channel can be
+	 * regenerated. If this happen, when submit message to this
+	 * mailbox channel, error will return.
+	 */
+	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
+	hwctx->status = hwctx->old_status;
+	aie2_hwctx_restart(xdna, hwctx);
+}
+
 static void
 aie2_sched_notify(struct amdxdna_sched_job *job)
 {
diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index 42f6461cd2ec..e52428d2c092 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -490,10 +490,14 @@ static void aie2_fini(struct amdxdna_dev *xdna)
 const struct amdxdna_dev_ops aie2_ops = {
 	.init           = aie2_init,
 	.fini           = aie2_fini,
+	.resume         = aie2_hw_start,
+	.suspend        = aie2_hw_stop,
 	.hwctx_init     = aie2_hwctx_init,
 	.hwctx_fini     = aie2_hwctx_fini,
 	.hwctx_config   = aie2_hwctx_config,
 	.cmd_submit     = aie2_cmd_submit,
 	.cmd_wait       = aie2_cmd_wait,
 	.hmm_invalidate = aie2_hmm_invalidate,
+	.hwctx_suspend  = aie2_hwctx_suspend,
+	.hwctx_resume   = aie2_hwctx_resume,
 };
diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
index 26d271a1040b..113395ab5e33 100644
--- a/drivers/accel/amdxdna/aie2_pci.h
+++ b/drivers/accel/amdxdna/aie2_pci.h
@@ -243,6 +243,8 @@ int aie2_sync_bo(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
 int aie2_hwctx_init(struct amdxdna_hwctx *hwctx);
 void aie2_hwctx_fini(struct amdxdna_hwctx *hwctx);
 int aie2_hwctx_config(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *buf, u32 size);
+void aie2_hwctx_suspend(struct amdxdna_hwctx *hwctx);
+void aie2_hwctx_resume(struct amdxdna_hwctx *hwctx);
 int aie2_cmd_submit(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq);
 int aie2_cmd_wait(struct amdxdna_hwctx *hwctx, u64 seq, u32 timeout);
 void aie2_hmm_invalidate(struct amdxdna_gem_obj *abo, unsigned long cur_seq);
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
index 1bf7bd5a10d7..35f84f8884a7 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.c
+++ b/drivers/accel/amdxdna/amdxdna_ctx.c
@@ -48,6 +48,32 @@ static struct dma_fence *amdxdna_fence_create(struct amdxdna_hwctx *hwctx)
 	return &fence->base;
 }
 
+void amdxdna_hwctx_suspend(struct amdxdna_client *client)
+{
+	struct amdxdna_dev *xdna = client->xdna;
+	struct amdxdna_hwctx *hwctx;
+	int next = 0;
+
+	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
+	mutex_lock(&client->hwctx_lock);
+	idr_for_each_entry_continue(&client->hwctx_idr, hwctx, next)
+		xdna->dev_info->ops->hwctx_suspend(hwctx);
+	mutex_unlock(&client->hwctx_lock);
+}
+
+void amdxdna_hwctx_resume(struct amdxdna_client *client)
+{
+	struct amdxdna_dev *xdna = client->xdna;
+	struct amdxdna_hwctx *hwctx;
+	int next = 0;
+
+	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
+	mutex_lock(&client->hwctx_lock);
+	idr_for_each_entry_continue(&client->hwctx_idr, hwctx, next)
+		xdna->dev_info->ops->hwctx_resume(hwctx);
+	mutex_unlock(&client->hwctx_lock);
+}
+
 static void amdxdna_hwctx_destroy_rcu(struct amdxdna_hwctx *hwctx,
 				      struct srcu_struct *ss)
 {
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h b/drivers/accel/amdxdna/amdxdna_ctx.h
index bd86ec137857..e8aa2ed9f392 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.h
+++ b/drivers/accel/amdxdna/amdxdna_ctx.h
@@ -145,6 +145,8 @@ static inline u32 amdxdna_hwctx_col_map(struct amdxdna_hwctx *hwctx)
 void amdxdna_job_put(struct amdxdna_sched_job *job);
 
 void amdxdna_hwctx_remove_all(struct amdxdna_client *client);
+void amdxdna_hwctx_suspend(struct amdxdna_client *client);
+void amdxdna_hwctx_resume(struct amdxdna_client *client);
 
 int amdxdna_cmd_submit(struct amdxdna_client *client,
 		       u32 cmd_bo_hdls, u32 *arg_bo_hdls, u32 arg_bo_cnt,
diff --git a/drivers/accel/amdxdna/amdxdna_drm.c b/drivers/accel/amdxdna/amdxdna_drm.c
index 3b15eae65e6d..a4c189b4953e 100644
--- a/drivers/accel/amdxdna/amdxdna_drm.c
+++ b/drivers/accel/amdxdna/amdxdna_drm.c
@@ -15,9 +15,17 @@ static int amdxdna_drm_open(struct drm_device *ddev, struct drm_file *filp)
 	struct amdxdna_client *client;
 	int ret;
 
+	ret = pm_runtime_resume_and_get(ddev->dev);
+	if (ret) {
+		XDNA_ERR(xdna, "Failed to get rpm, ret %d", ret);
+		return ret;
+	}
+
 	client = kzalloc(sizeof(*client), GFP_KERNEL);
-	if (!client)
-		return -ENOMEM;
+	if (!client) {
+		ret = -ENOMEM;
+		goto put_rpm;
+	}
 
 	client->pid = pid_nr(filp->pid);
 	client->xdna = xdna;
@@ -53,6 +61,9 @@ static int amdxdna_drm_open(struct drm_device *ddev, struct drm_file *filp)
 	iommu_sva_unbind_device(client->sva);
 failed:
 	kfree(client);
+put_rpm:
+	pm_runtime_mark_last_busy(ddev->dev);
+	pm_runtime_put_autosuspend(ddev->dev);
 
 	return ret;
 }
@@ -75,6 +86,8 @@ static void amdxdna_drm_close(struct drm_device *ddev, struct drm_file *filp)
 
 	XDNA_DBG(xdna, "pid %d closed", client->pid);
 	kfree(client);
+	pm_runtime_mark_last_busy(ddev->dev);
+	pm_runtime_put_autosuspend(ddev->dev);
 }
 
 static int amdxdna_flush(struct file *f, fl_owner_t id)
diff --git a/drivers/accel/amdxdna/amdxdna_drm.h b/drivers/accel/amdxdna/amdxdna_drm.h
index 6f1eaed46382..79eb9b4f6574 100644
--- a/drivers/accel/amdxdna/amdxdna_drm.h
+++ b/drivers/accel/amdxdna/amdxdna_drm.h
@@ -14,6 +14,7 @@
 #include <drm/drm_print.h>
 #include <drm/drm_file.h>
 #include <linux/hmm.h>
+#include <linux/pm_runtime.h>
 #include <linux/vmalloc.h>
 
 #include "amdxdna_ctx.h"
@@ -38,10 +39,14 @@ struct amdxdna_dev;
 struct amdxdna_dev_ops {
 	int (*init)(struct amdxdna_dev *xdna);
 	void (*fini)(struct amdxdna_dev *xdna);
+	int (*resume)(struct amdxdna_dev *xdna);
+	void (*suspend)(struct amdxdna_dev *xdna);
 	int (*hwctx_init)(struct amdxdna_hwctx *hwctx);
 	void (*hwctx_fini)(struct amdxdna_hwctx *hwctx);
 	int (*hwctx_config)(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *buf, u32 size);
 	void (*hmm_invalidate)(struct amdxdna_gem_obj *abo, unsigned long cur_seq);
+	void (*hwctx_suspend)(struct amdxdna_hwctx *hwctx);
+	void (*hwctx_resume)(struct amdxdna_hwctx *hwctx);
 	int (*cmd_submit)(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq);
 	int (*cmd_wait)(struct amdxdna_hwctx *hwctx, u64 seq, u32 timeout);
 };
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
index 924ee8b96ebb..b472c4d7342a 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
@@ -7,6 +7,8 @@
 
 #include "amdxdna_pci_drv.h"
 
+#define AMDXDNA_AUTOSUSPEND_DELAY	5000 /* miliseconds */
+
 /*
  *  There are platforms which share the same PCI device ID
  *  but have different PCI revision IDs. So, let the PCI class
@@ -46,10 +48,11 @@ amdxdna_get_dev_info(struct pci_dev *pdev)
 
 static int amdxdna_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
+	struct device *dev = &pdev->dev;
 	struct amdxdna_dev *xdna;
 	int ret;
 
-	xdna = devm_drm_dev_alloc(&pdev->dev, &amdxdna_drm_drv, typeof(*xdna), ddev);
+	xdna = devm_drm_dev_alloc(dev, &amdxdna_drm_drv, typeof(*xdna), ddev);
 	if (IS_ERR(xdna))
 		return PTR_ERR(xdna);
 
@@ -75,12 +78,19 @@ static int amdxdna_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		goto failed_dev_fini;
 	}
 
+	pm_runtime_set_autosuspend_delay(dev, AMDXDNA_AUTOSUSPEND_DELAY);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_allow(dev);
+
 	ret = drm_dev_register(&xdna->ddev, 0);
 	if (ret) {
 		XDNA_ERR(xdna, "DRM register failed, ret %d", ret);
+		pm_runtime_forbid(dev);
 		goto failed_sysfs_fini;
 	}
 
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
 	return 0;
 
 failed_sysfs_fini:
@@ -95,8 +105,12 @@ static int amdxdna_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 static void amdxdna_remove(struct pci_dev *pdev)
 {
 	struct amdxdna_dev *xdna = pci_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
 	struct amdxdna_client *client;
 
+	pm_runtime_get_noresume(dev);
+	pm_runtime_forbid(dev);
+
 	drm_dev_unplug(&xdna->ddev);
 	amdxdna_sysfs_fini(xdna);
 
@@ -118,11 +132,98 @@ static void amdxdna_remove(struct pci_dev *pdev)
 	mutex_unlock(&xdna->dev_lock);
 }
 
+static int amdxdna_dev_suspend_nolock(struct amdxdna_dev *xdna)
+{
+	if (xdna->dev_info->ops->suspend)
+		xdna->dev_info->ops->suspend(xdna);
+
+	return 0;
+}
+
+static int amdxdna_dev_resume_nolock(struct amdxdna_dev *xdna)
+{
+	if (xdna->dev_info->ops->resume)
+		return xdna->dev_info->ops->resume(xdna);
+
+	return 0;
+}
+
+static int amdxdna_pmops_suspend(struct device *dev)
+{
+	struct amdxdna_dev *xdna = pci_get_drvdata(to_pci_dev(dev));
+	struct amdxdna_client *client;
+
+	mutex_lock(&xdna->dev_lock);
+	list_for_each_entry(client, &xdna->client_list, node)
+		amdxdna_hwctx_suspend(client);
+
+	amdxdna_dev_suspend_nolock(xdna);
+	mutex_unlock(&xdna->dev_lock);
+
+	return 0;
+}
+
+static int amdxdna_pmops_resume(struct device *dev)
+{
+	struct amdxdna_dev *xdna = pci_get_drvdata(to_pci_dev(dev));
+	struct amdxdna_client *client;
+	int ret;
+
+	XDNA_INFO(xdna, "firmware resuming...");
+	mutex_lock(&xdna->dev_lock);
+	ret = amdxdna_dev_resume_nolock(xdna);
+	if (ret) {
+		XDNA_ERR(xdna, "resume NPU firmware failed");
+		mutex_unlock(&xdna->dev_lock);
+		return ret;
+	}
+
+	XDNA_INFO(xdna, "hardware context resuming...");
+	list_for_each_entry(client, &xdna->client_list, node)
+		amdxdna_hwctx_resume(client);
+	mutex_unlock(&xdna->dev_lock);
+
+	return 0;
+}
+
+static int amdxdna_rpmops_suspend(struct device *dev)
+{
+	struct amdxdna_dev *xdna = pci_get_drvdata(to_pci_dev(dev));
+	int ret;
+
+	mutex_lock(&xdna->dev_lock);
+	WARN_ON(!list_empty(&xdna->client_list));
+	ret = amdxdna_dev_suspend_nolock(xdna);
+	mutex_unlock(&xdna->dev_lock);
+
+	XDNA_DBG(xdna, "Runtime suspend done ret: %d", ret);
+	return ret;
+}
+
+static int amdxdna_rpmops_resume(struct device *dev)
+{
+	struct amdxdna_dev *xdna = pci_get_drvdata(to_pci_dev(dev));
+	int ret;
+
+	mutex_lock(&xdna->dev_lock);
+	ret = amdxdna_dev_resume_nolock(xdna);
+	mutex_unlock(&xdna->dev_lock);
+
+	XDNA_DBG(xdna, "Runtime resume done ret: %d", ret);
+	return ret;
+}
+
+static const struct dev_pm_ops amdxdna_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(amdxdna_pmops_suspend, amdxdna_pmops_resume)
+	SET_RUNTIME_PM_OPS(amdxdna_rpmops_suspend, amdxdna_rpmops_resume, NULL)
+};
+
 static struct pci_driver amdxdna_pci_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = pci_ids,
 	.probe = amdxdna_probe,
 	.remove = amdxdna_remove,
+	.driver.pm = &amdxdna_pm_ops,
 };
 
 module_pci_driver(amdxdna_pci_driver);
-- 
2.34.1

