Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBD2C16547
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 18:55:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E34610E63E;
	Tue, 28 Oct 2025 17:55:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="J+/qEy+w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013068.outbound.protection.outlook.com
 [40.107.201.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D5E210E63E
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 17:55:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=noAJVKNsWee2BS4jWaNzgpfm1scjJFJzVwM7cJS4DWaHJeIlgLXP9BRLSbKDa4FWjmMqSs8aEdCAV7o/LHY9AFsPHUbl6bAI/Xp6fVsYwrNGmwMOXuTEWZtWduG8xk0kyACKBgS0OsJp/hszJjXrq08ZJOiSBaIoiRLQImD6cDftzBWFInMs4c2Cy8/uBsZtgQeOHD5MHT6bMIj5TlRApG+2KLkmk79oSrxAsOa6e7ELvgVx4bX29pVIfU9asOu8et5gHLp4ONWsgVv1jbK/+h9TSEXZKmvfjE2XFSbMUsJKlp7Mvpn7R8WQGQVogkg/56bBywznGnkJhuPfI29Biw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aB8Voh6RB6CStR3KE3/dtKWSyVUAEJgTzNh25dJdoP4=;
 b=TBzNdx98FnxWmtDxQMOGvLFDINq97co6R4MDOj7a90w+VKEeUM+nSzPQANOGwreUW1qc9iqRNqFUS9dcjfy9T34aDXeQUKyXYQQllT6oxW6zux0xSof1WEy0+IoOjIx2HXsXQYQ58zu9/4+ZnmZFDrfC36OGW0kcl6y2KVceCMQH7JqqPZS4ZMNGL7gTd4PVVqLljrccf0ftOi12nHLJXe/svPT4aC+iSkXeFP12JXiEE/3E3IrOeSG0QLNUZVtjMfJwmyJYdIC2lCeWBmuosY4H6h/XFELxwv9MnORW4CpcDNYZCdLORBdLWfi0aezWQnvEMS+l2Mp/pZwZ1OJZwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aB8Voh6RB6CStR3KE3/dtKWSyVUAEJgTzNh25dJdoP4=;
 b=J+/qEy+wxFohEvTaSTtDgwIUU7zy51whiKfYuW8Vrup28wa0perXm+rxEVp8Y86BByZNBFMpPhd5rT4jOLTJQWAKoxcN+T1g7e2ii1yevgOvW8DY8ZpS/i4iDNwxeleCfVQ8m2OGuJTKJwHrNs2xRb5waHl+CVv1zBlIkZBy1ig=
Received: from MW3PR05CA0019.namprd05.prod.outlook.com (2603:10b6:303:2b::24)
 by SN7PR12MB6713.namprd12.prod.outlook.com (2603:10b6:806:273::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 17:55:13 +0000
Received: from CO1PEPF000066EA.namprd05.prod.outlook.com
 (2603:10b6:303:2b:cafe::1e) by MW3PR05CA0019.outlook.office365.com
 (2603:10b6:303:2b::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Tue,
 28 Oct 2025 17:54:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000066EA.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Tue, 28 Oct 2025 17:55:12 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 28 Oct
 2025 10:55:03 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 28 Oct
 2025 12:55:03 -0500
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 28 Oct 2025 10:55:03 -0700
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <maciej.falkowski@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH] accel/amdxdna: Fix incorrect command state for timed out job
Date: Tue, 28 Oct 2025 10:54:52 -0700
Message-ID: <20251028175452.2329497-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EA:EE_|SN7PR12MB6713:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a9eeecf-bc52-4050-eb76-08de164b249d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8lvkSwUiTNj83DY5B2LNznGyA2CjQnMXb6JXqpqzcq8hDoZw432L2GQ1yFG+?=
 =?us-ascii?Q?LaEl6gKSbziMjfO0hdbA1RPZLMVyR1mvoBm/tvlNJWF400pk74T7Cf7KHtl2?=
 =?us-ascii?Q?GkknoyyMqpooKzmqZYuAr4pwf4O9QlcA26bD316b3IC6erctPBjmmZMyyPb+?=
 =?us-ascii?Q?pI/WARy7scH5ELqOHi9+GYiJOv4PoJFhmtkBKuHdngOpzcuUH3NCOecJLt7X?=
 =?us-ascii?Q?/oxcvJ+887pUBYB/xfSijFxxfB6tX3TjawipRRjIK5J519njN/MpgtkoXCGR?=
 =?us-ascii?Q?LJ8nnA8zWQGwMSS5KmH/wdzsadMnAcJlUR41sifC0o6hfnMiriBytYcCHMuX?=
 =?us-ascii?Q?yd23KIdGoRmhOu706YGKSuKEsXvmPuVLWejQYeTh7/c8ppjCJ9d1Vj/AoYGA?=
 =?us-ascii?Q?WM8qlc189vvwTM4kmozt5UcMDnBvNS5q1wKj4fyCk028kLU9vgUyoZJbIKIc?=
 =?us-ascii?Q?GuMYcwBX2L0eM1xhvGe70AA1/H4s48/Wy+JIeCcAT8brWBZIuaYzsRViTpyV?=
 =?us-ascii?Q?fTPaYLfcwqBeJMMl9kHJSkYLvrMKGO1g1KVhNNIstmy/GkButeMONQXEjcLp?=
 =?us-ascii?Q?rI9k+YBRMXcLG3md6XlOmxAbCfEBKClY+qg9/gXpm6F4egOutZ5G1A9xaSH/?=
 =?us-ascii?Q?C8Yt82HhAZ6v8Yw2GDh7GjiH03TiLyR1fKQpS+Bf0UfA+EGcsCRkp7/2CY36?=
 =?us-ascii?Q?eMHLG/l9K75WIemfdxQhZg/Qs8L1XXTik+cJMb3hat7JMT0nkk5S0PIRcwHN?=
 =?us-ascii?Q?MSXhqJ/AJ4R7aZnSDZdmlcYJl2dh5wV+Cxo0s+pFWU7VUZLFr/Pd+4xMKJnH?=
 =?us-ascii?Q?fu23nkP0HG4ljxFhYdEkzfk/nZXp8sdMZe+vPCQJGFvBcHTa78ip0kgxeVp+?=
 =?us-ascii?Q?JRsVeRDczSTQ6GA2ocOFWZTfYaDC5m1N2qm8YqjIQj2LoJ51p6KcurRzb9EU?=
 =?us-ascii?Q?a1PRthq6/lHmpPALy4Hx3a0xy3qyE8xfCw4XjGLHUiNIg0a5KKP4IiKPHUBm?=
 =?us-ascii?Q?XaFESUb56BDMqGBxK8IWkEs1DAuuDvi41SdlCgTCMlQzFKynKh9MP0QbNcTt?=
 =?us-ascii?Q?S6ah3DlOxRiwdgZ1odIIn19w8jEPPBjGlWY25M9/BeEEk0ypR40D6/7JsRxi?=
 =?us-ascii?Q?NgfwOGOZDVbPMm1ofBdJgo2sCScZA2EvRhJPPrO8ec6m1K8CXYv5qz5fjJoW?=
 =?us-ascii?Q?WqIaX5UgYzSIGf4QySvDgkb9Ha8n9AAqZD3Yw7FKrQkWwULN3cQA9o9Nidqi?=
 =?us-ascii?Q?kMuCdToBrp38iKSF9iYthBZFYHP1fvBhBDSJDh1XZRhMF/Tw9y90N3L7gq2s?=
 =?us-ascii?Q?lKGEX9Ymotmc7O2H3qnaI8P6wtc4HOEZ0CT6LDzrvT0cHTRs49o2dUF7e/Dc?=
 =?us-ascii?Q?DbFrYpioeBZYka71pnU8oENShSG3oTrxFCYmSMvfB80fkTlihcproGWAn/g1?=
 =?us-ascii?Q?DGrGgYI4y3Phnfloz8u5gnRArjVeUa0hutap3WrylaNi02lgfT/3HbGbgIP1?=
 =?us-ascii?Q?KInWXpkgH/R3P0blraYtybJYzsv5HXgYRgpyR51TQvV65mlrKecYBXllvGht?=
 =?us-ascii?Q?Gu/to3IOPsNTa6Dn0d8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 17:55:12.4516 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a9eeecf-bc52-4050-eb76-08de164b249d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6713
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

