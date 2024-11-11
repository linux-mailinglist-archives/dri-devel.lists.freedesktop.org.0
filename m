Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3F59C43A9
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 18:32:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 713D910E4EB;
	Mon, 11 Nov 2024 17:32:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RVmOM2nj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2047.outbound.protection.outlook.com [40.107.101.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3663E10E4E8
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 17:32:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GJEmBvJaVRiGq/yCJvcGgJOb3vMw+eEdHEDcXw7DdxHhgEviq0b0Fgo40iFZ6tGJxllHrDBUSLyIMSSnFE0Qhs5A7IKFU+uTJS6a43xw10BmcG+QgowNJXM2eXfxfHtIEOHzNvLknP+33pcpjKDPMXa95lem39ZMZ3wxiIhBCuJ5++aCh+X2zNZhOQ/r8CgYdbVp3OHQP6BcsShlGERI/RpJgrUz3T2h8I3MhUNkJOTLNF2wM1rfYozLDa+ZvM+0IZA/feOYO5KSfdjaGuA09ZPrj9E1FT0HCrb/+mM4uHOupiYHNCsoPIjDnNPbvQemvFjs8bT8sJmUqykOJhfAyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Cgvo2WsiniFEPzDsoBfDwpJ1ha4EHiTd/lvfFW6iHc=;
 b=cGROj8NUqTdPSAVPq0CJy5qCEKlpIA8j5MdArk5Q/AL9EXYl/JA1wTRxcmOLcBJo/QxghMNtpo5nd3ry3nqB05iIrGf/heduNJlGuq+vWf+8bx061jZk4p0QxqcPemqbJQXkMsHKZ4Ar0Kr8EXqX9bqX7acjam6NPkpEBMeUAlTAE87mBY3etQDkt7t3v7vZWO/os6FjoL3GLiNBccToagSrxmdZSn9AlMqlKqc0IlGKpb2B+JqmbOqMZngh7oUkxZU0jAYQZI5hxqGSHvqrOWxcLlEygfMjDafgRwS+3o9w7XwBdwEYhlZiR96E+ONQd2Uo389M7zIm0Vqh/1c1ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Cgvo2WsiniFEPzDsoBfDwpJ1ha4EHiTd/lvfFW6iHc=;
 b=RVmOM2nj8bVif48atVxgHJQiWLmG3G0ETHebviTRkueYLSrMwGWI7Bga12wyOKEKxHSEw9h4BGF6Nsm3e/gy5niYduoghWFYqzCRA3OJjjT7BSRIppNF5ApQIXY6KgO+Ap0efLBRs5L6q9/YiYdVwXdgt8bAqCdK1QUTrmQsptM=
Received: from PH7PR02CA0010.namprd02.prod.outlook.com (2603:10b6:510:33d::29)
 by PH7PR12MB9204.namprd12.prod.outlook.com (2603:10b6:510:2e7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 17:32:44 +0000
Received: from CY4PEPF0000E9CF.namprd03.prod.outlook.com
 (2603:10b6:510:33d:cafe::80) by PH7PR02CA0010.outlook.office365.com
 (2603:10b6:510:33d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28 via Frontend
 Transport; Mon, 11 Nov 2024 17:32:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9CF.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Mon, 11 Nov 2024 17:32:44 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 11 Nov
 2024 11:32:40 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 11 Nov
 2024 11:32:40 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 11 Nov 2024 11:32:39 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>, Narendra Gutta <VenkataNarendraKumar.Gutta@amd.com>,
 Xiaoming Ren <xiaoming.ren@amd.com>
Subject: [PATCH V8 08/10] accel/amdxdna: Add suspend and resume
Date: Mon, 11 Nov 2024 09:32:28 -0800
Message-ID: <20241111173230.655325-9-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241111173230.655325-1-lizhi.hou@amd.com>
References: <20241111173230.655325-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CF:EE_|PH7PR12MB9204:EE_
X-MS-Office365-Filtering-Correlation-Id: 58d816f4-f583-4f2f-047d-08dd0276da3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VzdEjOD8NXx8+AQC+AYiSW73h9PvZxdrJzb9uDIhjmkNjhT9LNl4eW9rPIXh?=
 =?us-ascii?Q?IbHhRPD9CcZ23O6yNumKbtlgY2BE81xk+M5ZvBHq0TwS+POoVQbK+3WD0XX7?=
 =?us-ascii?Q?bNIIxJ8dT1boVM3gqVmfXKqn7bBUnOtxS5SXfc0gShoI8WTCINFhbXcAbTXs?=
 =?us-ascii?Q?kwOBvHNVmUwBlUaG87+/o4qWTvFMMQEYLvQODqv/WII6aQWKSCvBME6OB1lr?=
 =?us-ascii?Q?SMKw0nwm4lqA1JXOu8OB6x1/AXW6/ZdzGQNBjuFuP8A0fcQOCeQwa1j7ySnf?=
 =?us-ascii?Q?OtYP5fQVRZwUmoXsl2IMpfxmqMPoFShO97TCyxU58yQu2syP54AtinIeiC+1?=
 =?us-ascii?Q?X2qI7on/zqrVJlnfQ6XvFVdbkf9HAtVtkCy3tt0dcXL1pbt90D5hJXaezyyK?=
 =?us-ascii?Q?N2EYOHKdjn+7y7pGkDfNxQj96ghVhX28E70gjOtPXY0RZJ/4GpK7zJoFJAQ9?=
 =?us-ascii?Q?w4JPcv1PL6e7kilcvE88Use6V5zECwm3Hw4C0YRRy32YtCAXAXug5p1hH76n?=
 =?us-ascii?Q?8SKMzKeSx//Kh89PLy+XS81VjMm65PE2kcfX3wsvkS8rBUWCCfVmp/ESsk+f?=
 =?us-ascii?Q?C5FRTmW8zsuMZeBwv6y5i5MzXIo+AxXhylGcWxUDvuK8J270dq+08Irck3Tu?=
 =?us-ascii?Q?R5MmnR60nY9TkrEf92Ejk+E8DhnsB1Wtvs8ylY1U1PA2E7d316sN91/p3CTI?=
 =?us-ascii?Q?kZqMU21RpG5IIiqFrkZqiDVFPHfTiHYcJ2QDhgK1YbMnZmLKFTQuFRuO64Ma?=
 =?us-ascii?Q?YJREMCD/sNVGYYVXgBGVUfAH4VO5UreH/cmoAYvHSOPNV9l8fwsSyZEujhEf?=
 =?us-ascii?Q?RPIKzjSxmvzA/fGStevPdcaRtbDk2Q1RNQFo0woFcaW64E6KZp/OL8Ixl4jM?=
 =?us-ascii?Q?pQELiXSz6cOE5Lf7GsvKuxYs7Bn3oLTTKZRuTjRGAOGgvqIJ613h+j/Y/kM/?=
 =?us-ascii?Q?FAKdQIyhaKTCLNyWvPloxNOVljf3WKl0+ZO0ktDcPhC7xj3gYGu8o8Ggh1mO?=
 =?us-ascii?Q?QFTxBvlpvsyh0B25DW/5S6PaMIr1RZHw9C8s6k1nLnEPUVsrO/zwkgZQkW0t?=
 =?us-ascii?Q?+gWk9INCqy6bWRl2EwTaJlzPr+MdFGS+j+FPguO0ZVoUwy7OlKYmZCfpk/Bi?=
 =?us-ascii?Q?n/Ymqf8s6jpX2iykLw3gAUjvtY7Y44S6YPdMHrVMmp53V0AL0V2mQOQi/ChJ?=
 =?us-ascii?Q?fXrBA3w6WTDiQPR53QsIE8WSRx5a9DS5c1ZGiZzHokVj2Lj7p7HbJX5O2T+E?=
 =?us-ascii?Q?VbvO5heEdNq22L4OZ1XucSdUgTCYNOCoCJSlzJ5dH1Bm51L8HtLW5eb5bCNw?=
 =?us-ascii?Q?3B3+/fSytIQ7AtW0E2wB2ivFVAJTKSPGznKMxJ9D03Fx4urEipn7vT96xt8D?=
 =?us-ascii?Q?nLnsgAvXqgWJvNQMy1bJZJBvx+7gLWAqhp2mTESVqhziQ0NPAg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 17:32:44.5653 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58d816f4-f583-4f2f-047d-08dd0276da3e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9CF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9204
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
index 5e2310a90cc7..e6108eca0166 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -137,6 +137,36 @@ static void aie2_hwctx_wait_for_idle(struct amdxdna_hwctx *hwctx)
 	dma_fence_put(fence);
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
index 465764712040..803ebb237971 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -496,9 +496,13 @@ static void aie2_fini(struct amdxdna_dev *xdna)
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
index 9836f721fc9a..72691c9eebd7 100644
--- a/drivers/accel/amdxdna/aie2_pci.h
+++ b/drivers/accel/amdxdna/aie2_pci.h
@@ -240,6 +240,8 @@ int aie2_sync_bo(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
 int aie2_hwctx_init(struct amdxdna_hwctx *hwctx);
 void aie2_hwctx_fini(struct amdxdna_hwctx *hwctx);
 int aie2_hwctx_config(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *buf, u32 size);
+void aie2_hwctx_suspend(struct amdxdna_hwctx *hwctx);
+void aie2_hwctx_resume(struct amdxdna_hwctx *hwctx);
 int aie2_cmd_submit(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq);
 void aie2_hmm_invalidate(struct amdxdna_gem_obj *abo, unsigned long cur_seq);
 void aie2_restart_ctx(struct amdxdna_client *client);
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
index 13cfbab9caa0..5478b631b73f 100644
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
index 18ed9bdbd6d8..80b0304193ec 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.h
+++ b/drivers/accel/amdxdna/amdxdna_ctx.h
@@ -144,6 +144,8 @@ static inline u32 amdxdna_hwctx_col_map(struct amdxdna_hwctx *hwctx)
 
 void amdxdna_sched_job_cleanup(struct amdxdna_sched_job *job);
 void amdxdna_hwctx_remove_all(struct amdxdna_client *client);
+void amdxdna_hwctx_suspend(struct amdxdna_client *client);
+void amdxdna_hwctx_resume(struct amdxdna_client *client);
 
 int amdxdna_cmd_submit(struct amdxdna_client *client,
 		       u32 cmd_bo_hdls, u32 *arg_bo_hdls, u32 arg_bo_cnt,
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
index 32a58bb6e6b1..c611024f060d 100644
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
 
@@ -219,12 +236,19 @@ static int amdxdna_probe(struct pci_dev *pdev, const struct pci_device_id *id)
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
@@ -239,8 +263,12 @@ static int amdxdna_probe(struct pci_dev *pdev, const struct pci_device_id *id)
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
 
@@ -262,11 +290,97 @@ static void amdxdna_remove(struct pci_dev *pdev)
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
index ec22a074aac6..3be058af3545 100644
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

