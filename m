Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BFC9B6871
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 16:52:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E920410E7D4;
	Wed, 30 Oct 2024 15:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OIOAij9c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2076.outbound.protection.outlook.com [40.107.100.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ECB310E7CC
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 15:52:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iI9Vr5i8/a1cELluEKJxUQQS5VEkxBgLSpOdTvwWB7NqqbV0eX1MpnuJOsPh0+okcE3ZGBD6jeuZkIBbFPzcDwBtlOIPfFGYvM+iGbHDUIz43EwbCKR3PX5Q4nm5gggGSzoJPgqUGaz20/Flg5dRb4ifVoKQWkx4N1EwUolIDhEHMKAB6n/UoKcMroaTb8aPiaN/sXk3ZutSh9j3yMmCE3lrag/eYbmMBfD/bJ+VJi2h8JQmYoE7Gcfa1VuE92QADBAlPJEWbeCr30MxrtpOPQhwmdcN+cST1XzNJXNJ+I2oPjJQlHxJFAVk4lQpMZhuJe6St8AVxziMhA027GGZQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10+yBH5d+3WrHKhDyd2YD5afh/x+JYZxuqbCdiyHiz0=;
 b=LPiKl5JhHcf1QC96S4TUciVOr6wssYw6eBhW17Vi7xjJK1N/Xd/4R5PBl7FN7yjmpOgDBdXz7HgPZh+A+vDIdzIoXBrS+0UZV+uPbWN+N6PrD/uIHc1MUrNqTQcjp/pqhoTv5IelrEj+bwj0m22inJ9o+upz8I16U+bvnAw0nwOyTtQz97ooHoELoV6qM72zO0UWs8vpybP49OE/XjSx9MKcLuGRuQyH1LcwI5//JVg4y9YpDnSdUka1Vbfh9waLjSESqypgfTIuOGfUY7vGz5q6QUWBF4ZRmN9kUSsqUvKKz30h6XuESvHUVlBTqOPVl6nyDApqeYAfHfQbcsOa7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10+yBH5d+3WrHKhDyd2YD5afh/x+JYZxuqbCdiyHiz0=;
 b=OIOAij9c2DaeOTkN5ZGVdUn6jCLj6IUz1BV4N8PfNpCEx8MZS9pAfiQgMxCNlQe0w7js2uPV8KeBEr6eeJUo1Vom9EjaVoghnVHVPTJVC4JJLiljhxKnTRGcOy4v/g8ZmJV6fDYifo1WyLKJjWuqs0urxKqE7GJFePU1gwlH7vE=
Received: from MN2PR20CA0008.namprd20.prod.outlook.com (2603:10b6:208:e8::21)
 by MN2PR12MB4159.namprd12.prod.outlook.com (2603:10b6:208:1da::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Wed, 30 Oct
 2024 15:52:16 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:208:e8:cafe::4b) by MN2PR20CA0008.outlook.office365.com
 (2603:10b6:208:e8::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.26 via Frontend
 Transport; Wed, 30 Oct 2024 15:52:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Wed, 30 Oct 2024 15:52:16 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Oct
 2024 10:52:12 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Oct
 2024 10:52:11 -0500
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 30 Oct 2024 10:52:11 -0500
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>, Narendra Gutta <VenkataNarendraKumar.Gutta@amd.com>,
 Xiaoming Ren <xiaoming.ren@amd.com>
Subject: [PATCH V6 08/10] accel/amdxdna: Add suspend and resume
Date: Wed, 30 Oct 2024 08:51:45 -0700
Message-ID: <20241030155147.103908-9-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241030155147.103908-1-lizhi.hou@amd.com>
References: <20241030155147.103908-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|MN2PR12MB4159:EE_
X-MS-Office365-Filtering-Correlation-Id: 99ecb8c7-7e24-4352-1b3f-08dcf8fad44f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2i25SYc9Ljs0e/PFakZZQMc6zHXvJHWfKClzFNPixoamhanj7ZeKu4GrF9TP?=
 =?us-ascii?Q?CDFTr+tOxYBa+tcF8gNNrdjRMuVxBUpzJLTgoeF2xRT97JhMRkYuxMkN38Tx?=
 =?us-ascii?Q?YL7EiRp4guTNG0KvcXwn6iL0SZxj2ex07OCtET2doFiZpbWOvK124BfiSChU?=
 =?us-ascii?Q?zyp90r60eLNPqArrPdURXHC9F/0RKSR2zzCciAJCOfje9DnoDw526+9vo4Yn?=
 =?us-ascii?Q?02zGjysm9t7QU4mmq2S+ea29VW+a+h2eIwdRuhG4vQhYqxehMGVkujN5UymB?=
 =?us-ascii?Q?/4MwzmVphGtkArz6Y5fvAQj1i9FiRu7CwTLqBa+nsamdi7jAwJkZcuwjDlcc?=
 =?us-ascii?Q?Bo0JjW1uxMy0tdcWdBmbWZ+4ROigiXGQaEs09b0/skW8Z8Kf1E3FSGCDBBnt?=
 =?us-ascii?Q?yHqa4eBIU3eCO7lyY3/fuca30ojuiLRtGIh+c/h/xqfSVB9YGyybBgePbx/j?=
 =?us-ascii?Q?tLjVRbOsrfL1OYXoTDlUn53pqqpFPEldDN6RE8QgbeVnnAo67hJ96nVfysDh?=
 =?us-ascii?Q?ipXB8f3J+S4djQtm9fhjFwfDzV4ukT3DkDv1ICIIeSYNT0RdzEorw0oOvf8U?=
 =?us-ascii?Q?PBp9Hb4IHSk5UnFb6E0QXYTXzLkEfGUSNA9SdzEP7Von5mlVAgkUbAhh2XMi?=
 =?us-ascii?Q?0Q7wKnZmBebBlTiI4T50oh12vMWh/V7+N8lXINg8zA2+07142v4ac66mfadU?=
 =?us-ascii?Q?267BCPd4OpL80WaV3Q5v6j/Em3rEspPwejQ8vzLMPwUE+zLr3KNTdbuEpEuU?=
 =?us-ascii?Q?b/p5DH+HiAlImCju2gyhE64zEUXJcceWp6bEQO+wdYJNiAu2LUVImFtMeakn?=
 =?us-ascii?Q?NFVJjpMQFK0gWdR9yit31Zsd/GMZ4+MeBztxGhasOt9jaOkkRCHp2GZuOo5X?=
 =?us-ascii?Q?OIbdU7SuJ+sjjWs5pv/1ypxrkmM3gSbJR1jJmVLveH82+6iCNBwXDLU94+0E?=
 =?us-ascii?Q?6fYVz3DHXaHh5X5lhq7B42GF1+kupU2yZeKlOzu2I7nxNHOM/cxWlE+JpKz0?=
 =?us-ascii?Q?g0Nqk5Gfr8eYd4L12A0zeeh4AsXoYaYI1C51/SbtFoj3YhPg2tGuwvdkDh9y?=
 =?us-ascii?Q?FQ/5F5Q9tQ6E7uozuqCEitPX18gu9lFhHjjz7D07K+vKye9zCb9Dx8elbtO5?=
 =?us-ascii?Q?o3EVT7IWwDX3AneePNDp56730PO8pisayBfd3Z2wopFY7dm5arPywKBfV22S?=
 =?us-ascii?Q?XTnB03eGJvbHkWhXWv66x9CeKQq4DXNuWKuca/1QmanlVo3gX1F1afNxiOdg?=
 =?us-ascii?Q?AUYOPKKM1tqonZsTRiKdht5bFGQDPZKujvuipBdMZf63/rf/ujtbZQiwTQv2?=
 =?us-ascii?Q?v2kkUV0bpKxzh3+WejEVDq+7x4HNFkn3b7BNWNnvIkA9znlIRGNPRbwg+3Je?=
 =?us-ascii?Q?GjOrl9L4cwd4k6tQDuBobJJCn9z7fWjxPpLu2T5P2KkHVK958A=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 15:52:16.6453 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99ecb8c7-7e24-4352-1b3f-08dcf8fad44f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4159
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
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
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
index c3ac668e16ab..29946d9b220a 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -156,6 +156,36 @@ static int aie2_hwctx_wait_for_idle(struct amdxdna_hwctx *hwctx)
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
index fb369d615969..7c7442df6e33 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -495,9 +495,13 @@ static void aie2_fini(struct amdxdna_dev *xdna)
 const struct amdxdna_dev_ops aie2_ops = {
 	.init           = aie2_init,
 	.fini           = aie2_fini,
+	.resume         = aie2_hw_start,
+	.suspend        = aie2_hw_stop,
 	.hwctx_init     = aie2_hwctx_init,
 	.hwctx_fini     = aie2_hwctx_fini,
 	.hwctx_config   = aie2_hwctx_config,
 	.cmd_submit     = aie2_cmd_submit,
 	.hmm_invalidate = aie2_hmm_invalidate,
+	.hwctx_suspend  = aie2_hwctx_suspend,
+	.hwctx_resume   = aie2_hwctx_resume,
 };
diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
index 7c4347649daa..2e75b22aedae 100644
--- a/drivers/accel/amdxdna/aie2_pci.h
+++ b/drivers/accel/amdxdna/aie2_pci.h
@@ -235,6 +235,8 @@ int aie2_sync_bo(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
 int aie2_hwctx_init(struct amdxdna_hwctx *hwctx);
 void aie2_hwctx_fini(struct amdxdna_hwctx *hwctx);
 int aie2_hwctx_config(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *buf, u32 size);
+void aie2_hwctx_suspend(struct amdxdna_hwctx *hwctx);
+void aie2_hwctx_resume(struct amdxdna_hwctx *hwctx);
 int aie2_cmd_submit(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq);
 void aie2_hmm_invalidate(struct amdxdna_gem_obj *abo, unsigned long cur_seq);
 void aie2_stop_ctx_by_col_map(struct amdxdna_client *client, u32 col_map);
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
index 49a180969f4a..016b87fa7f6c 100644
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
index 505bff965bd9..bc440446ba6b 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.h
+++ b/drivers/accel/amdxdna/amdxdna_ctx.h
@@ -144,6 +144,8 @@ static inline u32 amdxdna_hwctx_col_map(struct amdxdna_hwctx *hwctx)
 void amdxdna_job_put(struct amdxdna_sched_job *job);
 
 void amdxdna_hwctx_remove_all(struct amdxdna_client *client);
+void amdxdna_hwctx_suspend(struct amdxdna_client *client);
+void amdxdna_hwctx_resume(struct amdxdna_client *client);
 
 int amdxdna_cmd_submit(struct amdxdna_client *client,
 		       u32 cmd_bo_hdls, u32 *arg_bo_hdls, u32 arg_bo_cnt,
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
index 59477204df89..8ed02f1e9531 100644
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
 
+#define AMDXDNA_AUTOSUSPEND_DELAY	5000 /* milliseconds */
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
@@ -183,10 +199,11 @@ amdxdna_get_dev_info(struct pci_dev *pdev)
 
 static int amdxdna_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
+	struct device *dev = &pdev->dev;
 	struct amdxdna_dev *xdna;
 	int ret;
 
-	xdna = devm_drm_dev_alloc(&pdev->dev, &amdxdna_drm_drv, typeof(*xdna), ddev);
+	xdna = devm_drm_dev_alloc(dev, &amdxdna_drm_drv, typeof(*xdna), ddev);
 	if (IS_ERR(xdna))
 		return PTR_ERR(xdna);
 
@@ -212,12 +229,19 @@ static int amdxdna_probe(struct pci_dev *pdev, const struct pci_device_id *id)
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
@@ -232,8 +256,12 @@ static int amdxdna_probe(struct pci_dev *pdev, const struct pci_device_id *id)
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
 
@@ -255,11 +283,97 @@ static void amdxdna_remove(struct pci_dev *pdev)
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
index be53c9447778..f73d7b98cba4 100644
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
 };
 
-- 
2.34.1

