Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A46D499AF2A
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2024 01:13:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B6C10EB3F;
	Fri, 11 Oct 2024 23:13:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="g2K9pgLV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061.outbound.protection.outlook.com [40.107.243.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C868310EB3F
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 23:13:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OdDUsxqqztHETCmhEpTvbjbRFYqiizO791/oJGZKgxfru3geknkYtZ/wqrS7QhDyQ1a8unRfxLXLbi700j/6Aro6tsIX937gBgsFXD1g/Y0MksOBQ8+yH2A8ETfuz6vvp8KfZKOPqpieDy8/oE6icp4AthD+al1lAbwRQHmmXoub3bQIfDGfqX/f4VfR6XvK2pPMdEdbg9S4TktR5Bvq9yVj9CYBOY66XLmHwYkaLl2/v8/SXTLCJmmVcppkuMMW+RhtDcX9rh1jTAW285S+pSKiCJOB/cmNPjCwWAGD/0YSOGXgGkUjJF+T3gicHl/S+m3CVAfkj3YVpyqhRk1sdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpeRw8N+aUKMwAG2av5xNgQovLosGegxLnsTsNLo0UI=;
 b=WNBxNORMfjmnrjXJmkkdWouYaQ4zxLLobAzPUc4VUBMuelFAMEhp9TZPeixkNDU7LBzd38xym8X6p7D43WZJUW40+OVbM1Fa4h4Rxsycwso/KwyXD5g8TY+gWT2E7mDkVSGPYGZDZ9e01HLIfgadkpGW0kQ4JVQlCxwi9pFjBCawiwoKSkKkJ03Ctkogu6dQGXY25uRNqiLR/AlgPh6jRe+XP/yzfVXZUWiNRcQ2kGoR4/XU9PHDyMYufmHqeRO5wx2S5Hxt40ayZgcJ3TOnTNCUNrUuUYWbdmjWQrdS5RBCpkP7vkgUHxUDyN0HbE2ijeg3/OrI8Es4uDWZMX44IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpeRw8N+aUKMwAG2av5xNgQovLosGegxLnsTsNLo0UI=;
 b=g2K9pgLV/34o3O/LsVQJ5yuiDkDdVy1MzfiNjpP1UN4CSBWsXRXvoVRdCb5jMnPtuIzRz9aWKN+5doqlcgiNdeYIJ/qpgfAgRwvoS4HFZNMuqjCBwz5763s32QEqk7zjdEmCVPFtK5H/gMBPC2xVhYZeWLRGbMMFbiADJ42uFb0=
Received: from SJ0PR03CA0006.namprd03.prod.outlook.com (2603:10b6:a03:33a::11)
 by PH7PR12MB7455.namprd12.prod.outlook.com (2603:10b6:510:20e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 23:13:04 +0000
Received: from CO1PEPF000044FA.namprd21.prod.outlook.com
 (2603:10b6:a03:33a:cafe::fe) by SJ0PR03CA0006.outlook.office365.com
 (2603:10b6:a03:33a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20 via Frontend
 Transport; Fri, 11 Oct 2024 23:13:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.1 via Frontend Transport; Fri, 11 Oct 2024 23:13:04 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Oct
 2024 18:13:03 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Oct
 2024 18:13:03 -0500
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 11 Oct 2024 18:13:02 -0500
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>, Narendra Gutta <VenkataNarendraKumar.Gutta@amd.com>,
 Xiaoming Ren <xiaoming.ren@amd.com>
Subject: [PATCH V4 08/10] accel/amdxdna: Add suspend and resume
Date: Fri, 11 Oct 2024 16:12:42 -0700
Message-ID: <20241011231244.3182625-9-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241011231244.3182625-1-lizhi.hou@amd.com>
References: <20241011231244.3182625-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FA:EE_|PH7PR12MB7455:EE_
X-MS-Office365-Filtering-Correlation-Id: 29791ed2-902c-4c57-aeb7-08dcea4a42ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dbzAqmbeCmEp3y1+fZn+ulUBAqyk5Ql58CsClHHHkZONAJ/VpdiDphRAgyOt?=
 =?us-ascii?Q?KyblEoEA4O6ynxmb0VjKkaiKZcwOzrnR/omgBk8am96+IJJHRqoMCrXN3awU?=
 =?us-ascii?Q?HnusqDz441QWavvNIwXoVLpYFS29HfrDOkT2pP4SzPMwyVvMmK+Kedq4Iiui?=
 =?us-ascii?Q?wzLzNGHlj0klMskndih4HpIwiXs5PU3O1Sd1CRI8kL55y1YgcCG0v+PRdYiL?=
 =?us-ascii?Q?YhIwNn/7i3puTc8CLIWzXs5fkyQr17tGcOjhheEnstzCzT770hJmHFYO5/UY?=
 =?us-ascii?Q?rxQOeJ6wa4MgpqaYcywxxRDiHtee/Ha+Z6B/fAxqX3R1WZgr8Ob07OOZk/Xx?=
 =?us-ascii?Q?hrRcAehWUlTzzFydHCyZNFrYTV9+RCWC0LFOCywgo6nqHUqKokINAtZgvQbn?=
 =?us-ascii?Q?7jAgyM9f0FX1+WbUASRqfxzEnTSiWROKMsrnZrZxFTpH2m5jdYhkqHucSb4v?=
 =?us-ascii?Q?gKa2b0cX228HVXrnchMfLHQn6c0KAxNdojzkqit8zfzpcq9GGDa0/gb34pVI?=
 =?us-ascii?Q?Ig/iiXqrX0J0gN00nkNqROhIsIsSmwZF+cDjCAeX9hy8nC6oZz6wy8RgC7+k?=
 =?us-ascii?Q?Jbq+PTkfFRdHvmooOH2ipbvgsjTZB5ipZFQQ3zVdAjD7CcdDdkeP7t4wshwQ?=
 =?us-ascii?Q?jNWdbf2H9R8nePVQ9fGo/q4WDv1hYFfwqHlYtaRpPmPp9JYysjhijjfJL/UA?=
 =?us-ascii?Q?1XwaU5JenNd4TF54S/sXoinC7yDP47ygkRlTP4NWfT8V9jqYiib9Uq009EcK?=
 =?us-ascii?Q?9Hg6ynKYx6+ROquQAZqvtNe3diNhHtXzlwal1GDIjLAnL2cZhevOaceX3ikq?=
 =?us-ascii?Q?Q4rVnZmp7wFaMbH2RNg1N2uobIpdOknd0wnO3WfUtZWB/471wD7PyhVTMwEC?=
 =?us-ascii?Q?MDN4SHzlAW8k3vGrNkAdZIj2xqPZfw8Y3vygS4FNaJSpzOOdPvKrbxfSobla?=
 =?us-ascii?Q?ECUfy87/pVUptgqmURYCnrqEsw1uhqwNnZmE3HuUSTnmRGB5M/A0xi7zlESO?=
 =?us-ascii?Q?fbYEvCuNprfV2xFAFKOwVG0Vdhqt0lwMnyszwgJ1vxD3rJufqgH/EaK/YUCh?=
 =?us-ascii?Q?Qu9XWFPXcsjiuOyUiWOXCEJ+IFrUqSx5kL9mkkpsG0B00II5tpt7zOnLceUD?=
 =?us-ascii?Q?/2kiKwfZH4EpsDdVUhcf8G1etpDqJ9eBu8UqzxWdVxXDZB1EOtmfxMMa+UMs?=
 =?us-ascii?Q?tSZGf+0Ri1U77FomvI2SLW34KTVIgUJ7mCPace56ukF1Lxrf2KHDvHu7n37m?=
 =?us-ascii?Q?jxnbIlXXQd+9v71UWCbrxLIikB5RmoKdxkBR2gKZAmKXRd81sRjIbNabhiLR?=
 =?us-ascii?Q?QPSG8ipkGC1NHFvz7q4Ou6Qq47fwP/tvyiVCutpEfzJQFIiMJQIzkx0OZUFi?=
 =?us-ascii?Q?Q5KfbB4Pt1B5kbLMpmwjGI/Q/UE1?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 23:13:04.4919 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29791ed2-902c-4c57-aeb7-08dcea4a42ab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044FA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7455
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
 drivers/accel/amdxdna/aie2_ctx.c        |  30 ++++++
 drivers/accel/amdxdna/aie2_pci.c        |   4 +
 drivers/accel/amdxdna/aie2_pci.h        |   2 +
 drivers/accel/amdxdna/amdxdna_ctx.c     |  26 +++++
 drivers/accel/amdxdna/amdxdna_ctx.h     |   2 +
 drivers/accel/amdxdna/amdxdna_pci_drv.c | 120 +++++++++++++++++++++++-
 drivers/accel/amdxdna/amdxdna_pci_drv.h |   4 +
 7 files changed, 185 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index f9010a902c99..8da842731103 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -179,6 +179,36 @@ static int aie2_hwctx_wait_for_idle(struct amdxdna_hwctx *hwctx)
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
index 6017826a7104..7a1729bed62d 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -499,10 +499,14 @@ static void aie2_fini(struct amdxdna_dev *xdna)
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
index 81877d9c0542..bbcc3d85e13c 100644
--- a/drivers/accel/amdxdna/aie2_pci.h
+++ b/drivers/accel/amdxdna/aie2_pci.h
@@ -234,6 +234,8 @@ int aie2_sync_bo(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
 int aie2_hwctx_init(struct amdxdna_hwctx *hwctx);
 void aie2_hwctx_fini(struct amdxdna_hwctx *hwctx);
 int aie2_hwctx_config(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *buf, u32 size);
+void aie2_hwctx_suspend(struct amdxdna_hwctx *hwctx);
+void aie2_hwctx_resume(struct amdxdna_hwctx *hwctx);
 int aie2_cmd_submit(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq);
 int aie2_cmd_wait(struct amdxdna_hwctx *hwctx, u64 seq, u32 timeout);
 void aie2_hmm_invalidate(struct amdxdna_gem_obj *abo, unsigned long cur_seq);
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
index b76640e1fdd0..6a1db715129e 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.c
+++ b/drivers/accel/amdxdna/amdxdna_ctx.c
@@ -59,6 +59,32 @@ static struct dma_fence *amdxdna_fence_create(struct amdxdna_hwctx *hwctx)
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
index 65f9c1dfe32c..1db8944b1956 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.h
+++ b/drivers/accel/amdxdna/amdxdna_ctx.h
@@ -141,6 +141,8 @@ static inline u32 amdxdna_hwctx_col_map(struct amdxdna_hwctx *hwctx)
 void amdxdna_job_put(struct amdxdna_sched_job *job);
 
 void amdxdna_hwctx_remove_all(struct amdxdna_client *client);
+void amdxdna_hwctx_suspend(struct amdxdna_client *client);
+void amdxdna_hwctx_resume(struct amdxdna_client *client);
 
 int amdxdna_cmd_submit(struct amdxdna_client *client,
 		       u32 cmd_bo_hdls, u32 *arg_bo_hdls, u32 arg_bo_cnt,
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
index 5c1e863825e0..92113d83e861 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
@@ -13,11 +13,14 @@
 #include <drm/gpu_scheduler.h>
 #include <linux/iommu.h>
 #include <linux/pci.h>
+#include <linux/pm_runtime.h>
 
 #include "amdxdna_ctx.h"
 #include "amdxdna_gem.h"
 #include "amdxdna_pci_drv.h"
 
+#define AMDXDNA_AUTOSUSPEND_DELAY	5000 /* miliseconds */
+
 /*
  * Bind the driver base on (vendor_id, device_id) pair and later use the
  * (device_id, rev_id) pair as a key to select the devices. The devices with
@@ -45,9 +48,17 @@ static int amdxdna_drm_open(struct drm_device *ddev, struct drm_file *filp)
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
@@ -83,6 +94,9 @@ static int amdxdna_drm_open(struct drm_device *ddev, struct drm_file *filp)
 	iommu_sva_unbind_device(client->sva);
 failed:
 	kfree(client);
+put_rpm:
+	pm_runtime_mark_last_busy(ddev->dev);
+	pm_runtime_put_autosuspend(ddev->dev);
 
 	return ret;
 }
@@ -105,6 +119,8 @@ static void amdxdna_drm_close(struct drm_device *ddev, struct drm_file *filp)
 
 	XDNA_DBG(xdna, "pid %d closed", client->pid);
 	kfree(client);
+	pm_runtime_mark_last_busy(ddev->dev);
+	pm_runtime_put_autosuspend(ddev->dev);
 }
 
 static int amdxdna_flush(struct file *f, fl_owner_t id)
@@ -182,10 +198,11 @@ amdxdna_get_dev_info(struct pci_dev *pdev)
 
 static int amdxdna_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
+	struct device *dev = &pdev->dev;
 	struct amdxdna_dev *xdna;
 	int ret;
 
-	xdna = devm_drm_dev_alloc(&pdev->dev, &amdxdna_drm_drv, typeof(*xdna), ddev);
+	xdna = devm_drm_dev_alloc(dev, &amdxdna_drm_drv, typeof(*xdna), ddev);
 	if (IS_ERR(xdna))
 		return PTR_ERR(xdna);
 
@@ -211,12 +228,19 @@ static int amdxdna_probe(struct pci_dev *pdev, const struct pci_device_id *id)
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
@@ -231,8 +255,12 @@ static int amdxdna_probe(struct pci_dev *pdev, const struct pci_device_id *id)
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
 
@@ -254,11 +282,97 @@ static void amdxdna_remove(struct pci_dev *pdev)
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
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h b/drivers/accel/amdxdna/amdxdna_pci_drv.h
index 0324e73094b2..01b516743a00 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
@@ -28,10 +28,14 @@ struct amdxdna_sched_job;
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
-- 
2.34.1

