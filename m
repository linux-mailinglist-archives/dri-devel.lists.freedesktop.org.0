Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB9CC1174E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 21:59:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A581F10E04D;
	Mon, 27 Oct 2025 20:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HqkKZLWo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012061.outbound.protection.outlook.com [52.101.48.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86AB710E04D
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 20:59:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fRgyidBnjY515TbGPVMsiIDMbm5LL8nGV/3/wk9twVNl5Yuaqii97i6+YvEiaJq4vqiTVOugBF0OaE5qtdlZnhcw7K/XCe1JDGbzjW8/P4RL1EG4OZXZu3xzd2BquJvefoDSTg/TruUthMjn5KSU5nYrWMebiSkROS1ASoHOE5fsXhzTAESBAQ6O0aWR87MvUEwHFdRnyecZcvHanx+sS0TsL+eDiyr+pdjlcmD2fOr6pOC1vzZ2Ykyb/WVi3IDpUDZmaVpDNeD+s50j66fbDQNYQy6KR0nRK5hEgXnyteInhp5tTQ7GHkLwkWf0vuWjZ+olT3zztLA18zBpgivXFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aB8Voh6RB6CStR3KE3/dtKWSyVUAEJgTzNh25dJdoP4=;
 b=hgRFzRuNMZ4e7MWpbU2EGrjn5VB7v88DckBARkG7NBshOQPLlcSLIcEThPF870vkY+m6rCKMACXvSElqI11P799Rkq6uU0Kx5PZD0TJwn5i/7z/w/Noj2wymf/o4fnrXCBHDQ8o8gx3H7JiPKBY9g7E5letJ0uRpelTgDMIT56+Z4mkEaR5COxD2wjpUhH/xodEmewt7VYaF88L5UknfHFiRXqKjUgGWTH6FrE8KvYHZVFEOfx/jdyIrymPy5eqRU2wFmYRgDVj7kPrlahM5vOaSFz9NFs2Ld2Rm3weaExoqPXWlaESeeU252GpSwYgp5VX95HlIQ4V2trDc2inLyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aB8Voh6RB6CStR3KE3/dtKWSyVUAEJgTzNh25dJdoP4=;
 b=HqkKZLWoYcPy392g3789hWamkuZok3uHgAWxiSKGIhoMeZyvRy7EIb8FaATFx+YehUZLkz8zvuysMlHTIgzW/JNL1G1PuMqw11Q01TBZnCZTY+rNzWrJiqaKz63TapJhEYEAnF0EOfp1lf7m9kmVlPhdXy9Zqhn4FIWHR/0gwpc=
Received: from SJ0PR05CA0061.namprd05.prod.outlook.com (2603:10b6:a03:332::6)
 by DS0PR12MB8443.namprd12.prod.outlook.com (2603:10b6:8:126::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 20:59:31 +0000
Received: from SJ1PEPF000023CC.namprd02.prod.outlook.com
 (2603:10b6:a03:332:cafe::a8) by SJ0PR05CA0061.outlook.office365.com
 (2603:10b6:a03:332::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.12 via Frontend Transport; Mon,
 27 Oct 2025 20:59:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000023CC.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Mon, 27 Oct 2025 20:59:31 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 27 Oct
 2025 13:59:30 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 27 Oct
 2025 15:59:30 -0500
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 27 Oct 2025 13:59:29 -0700
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <maciej.falkowski@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH 1/7] accel/amdxdna: Fix incorrect command state for timed out
 job
Date: Mon, 27 Oct 2025 13:59:28 -0700
Message-ID: <20251027205928.2247897-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CC:EE_|DS0PR12MB8443:EE_
X-MS-Office365-Filtering-Correlation-Id: 48bb7579-f8ef-4ba7-50a3-08de159bb9f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?v0D8qbfwHdLbDkBW+ct4l/vItHtGHarl8N85WTFaPi0hM6HBex68KZ9yhfeg?=
 =?us-ascii?Q?om6EjPSryDmykUb81+IKORun7FZKPUNuwTP+5rHa9ZQ1tCqQN6haNWQ5QYMn?=
 =?us-ascii?Q?FdNHJC4MjGN2gJqkkKXx9hhMCTXfBcfVeJ4Dif5CrEUk4YyOW9Oc0Ucc29WR?=
 =?us-ascii?Q?wsGwOMfZYudoEmOk/SQtntiBnPxkb5afyWgmW3Y+MBTuIqDMGLsOO1FyTRWt?=
 =?us-ascii?Q?RRIckh0uUQoCaVOjLGBnnXQMrYU4XEvx/9IsuEM8CBoOlxjX7iJZLcCFwSZu?=
 =?us-ascii?Q?aNrZ7l3N4ow8MJVfFQUOzHIkaBuxb9PO1mo5RGuyC0HgWwgD7CG5lljXGmom?=
 =?us-ascii?Q?gVNT8kSXrzFJkrQDcOpC0B1wDfYS6ck6Efd1ycX5bUMoGXNzlPGlmqsXNVXq?=
 =?us-ascii?Q?aQ8SG+LYBKc+ROKVk3R54lmLDlAhy54yHfy/aFAjzsPo+4CFBJ81SE7E9S29?=
 =?us-ascii?Q?3mTaTje5lLAvsEFP92xq/QqJA3Bh3p/rc/zkbEB1OUlMw4RfFx0TPtnXv9D0?=
 =?us-ascii?Q?1qfsGHRULBUa+4C6n1KikRgNTZymU/RzqBjxwD3AzPS761eq6YF5e9Us4a58?=
 =?us-ascii?Q?MZMhIv9rDLhS23f5nuLDrESGSnRzn6Po5pvCcVUGpY/iMKrMYIA9xVD8KuoN?=
 =?us-ascii?Q?+26yhryOKKuNj0KnlUGgvfiFV3cz+DpHQonoofNHdVs4WBnDdDBYHnha6ZpN?=
 =?us-ascii?Q?YdhUc+PBqi72tubBxK24ZQahR5xkxQcqxt3dPn+8OC2C647s3mdju0WSHCQl?=
 =?us-ascii?Q?ppKOm0PctarscTDvq0KkPG2dsqJNBF/10+pfxetKh/ujLbgFf+6AcM8FwXru?=
 =?us-ascii?Q?fIyrKgzsiCAHKD/gJUaA19Rz6zF1KNi4hn1lLtc3d9hZJ8nos3UjrAOCJRVf?=
 =?us-ascii?Q?ejaVEiZyr7j9+9eQKv0arQtsNxWLhRt6xBtpI6hucxRhVx4PngJ8NvV94S2K?=
 =?us-ascii?Q?83VhMlV644jO/zKiz79CAS4f8zKtZtPiCnAa3eGdmaqmmLQq6XA4Ph8ul0Q3?=
 =?us-ascii?Q?FMDUYCSQO9+bpBJeGOhxPMfMzcZHCdYXuL8jMA4vSxVWA76K5v0SKZESvF6U?=
 =?us-ascii?Q?zmPHDpNKSCcd1bTc5p/vCyYhNACgrOavj6Y3ZnFk5DusTFeZwREfxEpDgvoh?=
 =?us-ascii?Q?TPAuMK5zBBMwu4gonGz9ojE5MI7bzSmVjU9FAGYckJWL03i3YexL0+HjOYcJ?=
 =?us-ascii?Q?PYLJqe8X9yVdiYOBp+RHRynnPwGfn8oueqEXdSMrNuHxBeZHb2rrMUEvvASX?=
 =?us-ascii?Q?LHXcrg8xHoqGRmMizyAzkLbdqWXV2q92aRSH/ihfzsV9VC+M6CeVZRKJZdCP?=
 =?us-ascii?Q?r87zT6isNY2NIvywYR1A+otimhcdXaR0w/EiUk8XEOxMAcOU4bk9r5WCxx9s?=
 =?us-ascii?Q?mhrAigds8xMqp0LTTHakwMxdFHH3Sgmn23FFcjyNkT+eiGAB2NmfY+W6Dk1+?=
 =?us-ascii?Q?RIbePSHOBGlDfH4ps7y4xVafs3dhpe3WxYhiVvMI3/ERl33EcT7P7UiGU7sE?=
 =?us-ascii?Q?gmCNhc2qEK0MMYKk1aI5PC1pXfyFkMkZQC6NAThvgoCrwMq0LzCXHzLzvKgq?=
 =?us-ascii?Q?dFDFUACvTpkNbtDlbBI=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 20:59:31.5772 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48bb7579-f8ef-4ba7-50a3-08de159bb9f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8443
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

When a command times out, mark it as ERT_CMD_STATE_TIMEOUT. Any other
commands that are canceled due to this timeout should be marked as
ERT_CMD_STATE_ABORT.

Fixes: aac243092b70 ("accel/amdxdna: Add command execution")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_ctx.c    | 12 ++++++++++--
 drivers/accel/amdxdna/amdxdna_ctx.h |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index c6c473c78352..958a64bb5251 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -204,10 +204,12 @@ aie2_sched_resp_handler(void *handle, void __iomem *data, size_t size)
 
 	cmd_abo = job->cmd_bo;
 
-	if (unlikely(!data))
+	if (unlikely(job->job_timeout)) {
+		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_TIMEOUT);
 		goto out;
+	}
 
-	if (unlikely(size != sizeof(u32))) {
+	if (unlikely(!data) || unlikely(size != sizeof(u32))) {
 		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ABORT);
 		ret = -EINVAL;
 		goto out;
@@ -258,6 +260,11 @@ aie2_sched_cmdlist_resp_handler(void *handle, void __iomem *data, size_t size)
 	int ret = 0;
 
 	cmd_abo = job->cmd_bo;
+	if (unlikely(job->job_timeout)) {
+		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_TIMEOUT);
+		goto out;
+	}
+
 	if (unlikely(!data) || unlikely(size != sizeof(u32) * 3)) {
 		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ABORT);
 		ret = -EINVAL;
@@ -370,6 +377,7 @@ aie2_sched_job_timedout(struct drm_sched_job *sched_job)
 
 	xdna = hwctx->client->xdna;
 	trace_xdna_job(sched_job, hwctx->name, "job timedout", job->seq);
+	job->job_timeout = true;
 	mutex_lock(&xdna->dev_lock);
 	aie2_hwctx_stop(xdna, hwctx, sched_job);
 
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h b/drivers/accel/amdxdna/amdxdna_ctx.h
index cbe60efbe60b..919c654dfea6 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.h
+++ b/drivers/accel/amdxdna/amdxdna_ctx.h
@@ -116,6 +116,7 @@ struct amdxdna_sched_job {
 	/* user can wait on this fence */
 	struct dma_fence	*out_fence;
 	bool			job_done;
+	bool			job_timeout;
 	u64			seq;
 	struct amdxdna_drv_cmd	*drv_cmd;
 	struct amdxdna_gem_obj	*cmd_bo;
-- 
2.34.1

