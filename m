Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F41A1BB89
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 18:35:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DFBD10E010;
	Fri, 24 Jan 2025 17:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4+w9kOo2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD4D10E010
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 17:35:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kVx+BTkEKoC6YP4bFxXQWJBg3ITIZt0Z6JDbtKSGFbTjHU0Hij6oCWWxPth5r6oesC2WieNhT9qcNaOtA+KxMIZyaynvOALFY+I9W3Mwj2ByinP26arsCTz2hfF3gHshyJ5SwHe0UCoYv47n8Hn92pDBcf3RX8HuLUn20LHyv3TpiW/WFjyXD2+r2cZqU8UQIw1d6GUWl8AuPo0ElEGmx+gn2uHMUPvq4zdFZVFg3hM7Fxja5rd6eS2WDnyWBSJKV8mzHNzWS0oMYW3fXDapf0pcF94R39yfPbXrWR4Ny2rrm4ueVefRC6tyxc6f/vnY331FKB9WtgPgUJbzQn7/Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3XyplJ0Fm5iWn9gphOEcyDO/xskofaw5TlkDn1nrbF0=;
 b=Fv5Y0R4EtbHKTEonpHozG630C/LIIadwyR6I5xwwvtN8K5O1M1BQliOc60KQk/udufRMG2ORuME18hQdqcw8YKiROyeYgtSp9xhuukT3nDMeqWZ3N4+Eap2TIJH+m3u5cBYR2g05UsN5KZ2LpMSxCOIG99QYDQXd7hoWeBejUyNIQNxXULqrAlwSRP3E5dRhDT7Z980TmMUwSdJCUrPfWJp7hjF8E/Al47q5YaZ7dIMtnojLdKhWY5HXD2ayMAuALCRnF1vih5qI9rCg4XpTe9kgQuhbEM9zzOh8WtPvBiesTYF6MV8eufEB8SIPYfmpcVU5ZE1F0nJ06F5IPHdNAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3XyplJ0Fm5iWn9gphOEcyDO/xskofaw5TlkDn1nrbF0=;
 b=4+w9kOo2IORTlmLzSs7z3GQw1yn2k6hotaBn9VGos7KWxT2QF6oSn6ggbOp0QTs4slnJH0ZCyLKrOWdbvaSvfyXJ9ev1PVhfk/e5jE8K+YR7O0LRLMZyy9O0tcP8gotAJIF2lyeFbFxFuMVWxmxr57LjDF74GydQi0aB8TOrlMM=
Received: from CY5PR15CA0255.namprd15.prod.outlook.com (2603:10b6:930:66::25)
 by CH3PR12MB7644.namprd12.prod.outlook.com (2603:10b6:610:14f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Fri, 24 Jan
 2025 17:35:45 +0000
Received: from CY4PEPF0000E9D2.namprd03.prod.outlook.com
 (2603:10b6:930:66:cafe::fe) by CY5PR15CA0255.outlook.office365.com
 (2603:10b6:930:66::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.20 via Frontend Transport; Fri,
 24 Jan 2025 17:35:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D2.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Fri, 24 Jan 2025 17:35:45 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 24 Jan
 2025 11:35:44 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 24 Jan
 2025 11:35:44 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 24 Jan 2025 11:35:43 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH] accel/amdxdna: Refactor hardware context destroy routine
Date: Fri, 24 Jan 2025 09:35:36 -0800
Message-ID: <20250124173536.148676-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D2:EE_|CH3PR12MB7644:EE_
X-MS-Office365-Filtering-Correlation-Id: 963d5273-2c0c-433d-12b4-08dd3c9d8872
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GYjKckvKPJnoS/1WMGkKa72yKPWWJf3XL/lo1XlRCgIJTIZ3ZQhzKKGCAdEL?=
 =?us-ascii?Q?r0JFmq7CrBHRoBclC6UDH6nbokisD78KTDDaP+G8hilpFfsITsWrNQHTrB12?=
 =?us-ascii?Q?0htfylXZHb2zgcQNKEFcy/uSAICrRh7oBdVCu9QrTonzrKVwtQWjK5gRuMge?=
 =?us-ascii?Q?afKrppdKc3fI71Fg0WrKyzMi0Ztw8HlfS/5MU6rfBTB7/nEZQir5LEVHp4JY?=
 =?us-ascii?Q?pipS3WEOYhtXV+vrMZn6JBBcQ952ql+ptf2jgitfZk2lpns4A12BeMkvrS1I?=
 =?us-ascii?Q?bppcy5flVtebreTF82OxJd2zpjOM+w/dHMXiEUu8KDf6EzsD8TBB7XtiG0oK?=
 =?us-ascii?Q?9XbrDYdZpGaP0V97RnaA1qDZ4izYKYubcXpPk15Rd89IwZqWGbEG6WesniZ9?=
 =?us-ascii?Q?cThIn6O/5R29TtxMuqCfawmfLnziS3EVp2oxpsdpMhOHthhvXY0NvbIi/X2i?=
 =?us-ascii?Q?QUjZhL8293fKDStU8hIwtsD+C56mq6vCFBVrnRkz8gmetvx1rbNxX0nVZ0Jz?=
 =?us-ascii?Q?5HvgsfaLYJBoCH4CTZz7snj6k9Q6enmG8iNMsaGkfTSjZf1pQod67AgJqnQ7?=
 =?us-ascii?Q?Ra6Y6/DRPxBsoMCz4+S8JaGk4Qb6ge0FWmZVUxeX5iIvcXuLakvDszUbK4ja?=
 =?us-ascii?Q?8ZIrUuVW9tWosPVtWmIWCDxBuvbJ0RGUGzUc7vcmeF5aHPePCg7cbC8VOWUj?=
 =?us-ascii?Q?HMtVetBpq6fjeeyYbK1+JkJSHazRwAMaYSKr2j8T4uNfZrL09XVowVNsMuRu?=
 =?us-ascii?Q?fEnZSgipwueFQ3uIqQdIB0Lxe++iy+z4rqbtkxY2QxfxgZa82I9Ee0CNuxjo?=
 =?us-ascii?Q?/IMzFyAUusp+EGmKJGuwfw+iL56Ef0oVOIwHq3bzDW1EihRjrXFeHIo7Ywkf?=
 =?us-ascii?Q?ydrocOlex8PGRet/m6aBiI8QdBQYvILfp348UjusWkLikKAEVGkAhr73BhQi?=
 =?us-ascii?Q?r+xoGoK0qG3RhoLr5Kk433zW2Qubj+mAuXyFVmwQBgHf76HKItEsEka6paa3?=
 =?us-ascii?Q?DPgJR4b9gXIDK6qrERYznVLTaGuERxwQU2MNqj0LAfOhxzaRXOdcPB2RmLwl?=
 =?us-ascii?Q?85qv8YNQlxFJsbG+6a7s+9cONfT9H+Dw8xsrA930EZAIdOS57wtM0bvEY0aH?=
 =?us-ascii?Q?tQVl+fgYvmg7ld9VHAYNHl9ETWDL1gKbZVtc6AlZQw3z0Zn6VOcwxkj1Lz1h?=
 =?us-ascii?Q?lEZ94FrOhu6ouHmWFf0YigZfnzeBICMKNHP4ea7RqxOQXBb1/pRNeZ5CfEVU?=
 =?us-ascii?Q?egRD6FBKi9zoyKtoOAFK0x7XUw5Izjl5XJyIIM8/QvbGGpLZefOQJB24OAQU?=
 =?us-ascii?Q?7fOAzgcHkEPKHva/qPoV4Dar+bmsCtqMkhNPg9tGXCIhlrOJ2JN7RYosD39Z?=
 =?us-ascii?Q?zRqFFy5FGGTdUq3IZpmBIMn2mz7AatwI3zmmdQ2j/Dup9hIZEt9awwAcfIg0?=
 =?us-ascii?Q?7spY8QoGJPEa+sBUAuQ4DEc67eHINsKmD20Pip/rjKTTRQluRmKIIaGmPZ73?=
 =?us-ascii?Q?9sIiYthvUXVN4Jo=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 17:35:45.1469 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 963d5273-2c0c-433d-12b4-08dd3c9d8872
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7644
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

It is required by firmware to wait up to 2 seconds for pending commands
before sending the destroy hardware context command. After 2 seconds
wait, if there are still pending commands, driver needs to cancel them.

So the context destroy steps need to be:
  1. Stop drm scheduler. (drm_sched_entity_destroy)
  2. Wait up to 2 seconds for pending commands.
  3. Destroy hardware context and cancel the rest pending requests.
  4. Wait all jobs associated with the hwctx are freed.
  5. Free job resources.

Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_ctx.c    | 29 ++++++++++++++++-------------
 drivers/accel/amdxdna/amdxdna_ctx.c |  2 ++
 drivers/accel/amdxdna/amdxdna_ctx.h |  3 +++
 3 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 2799729801f6..88c428fa4ad1 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -34,6 +34,8 @@ static void aie2_job_release(struct kref *ref)
 
 	job = container_of(ref, struct amdxdna_sched_job, refcnt);
 	amdxdna_sched_job_cleanup(job);
+	atomic64_inc(&job->hwctx->job_free_cnt);
+	wake_up(&job->hwctx->priv->job_free_wq);
 	if (job->out_fence)
 		dma_fence_put(job->out_fence);
 	kfree(job);
@@ -134,7 +136,8 @@ static void aie2_hwctx_wait_for_idle(struct amdxdna_hwctx *hwctx)
 	if (!fence)
 		return;
 
-	dma_fence_wait(fence, false);
+	/* Wait up to 2 seconds for fw to finish all pending requests */
+	dma_fence_wait_timeout(fence, false, msecs_to_jiffies(2000));
 	dma_fence_put(fence);
 }
 
@@ -616,6 +619,7 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
 	hwctx->status = HWCTX_STAT_INIT;
 	ndev = xdna->dev_handle;
 	ndev->hwctx_num++;
+	init_waitqueue_head(&priv->job_free_wq);
 
 	XDNA_DBG(xdna, "hwctx %s init completed", hwctx->name);
 
@@ -652,25 +656,23 @@ void aie2_hwctx_fini(struct amdxdna_hwctx *hwctx)
 	xdna = hwctx->client->xdna;
 	ndev = xdna->dev_handle;
 	ndev->hwctx_num--;
-	drm_sched_wqueue_stop(&hwctx->priv->sched);
 
-	/* Now, scheduler will not send command to device. */
+	XDNA_DBG(xdna, "%s sequence number %lld", hwctx->name, hwctx->priv->seq);
+	drm_sched_entity_destroy(&hwctx->priv->entity);
+
+	aie2_hwctx_wait_for_idle(hwctx);
+
+	/* Request fw to destroy hwctx and cancel the rest pending requests */
 	aie2_release_resource(hwctx);
 
-	/*
-	 * All submitted commands are aborted.
-	 * Restart scheduler queues to cleanup jobs. The amdxdna_sched_job_run()
-	 * will return NODEV if it is called.
-	 */
-	drm_sched_wqueue_start(&hwctx->priv->sched);
+	/* Wait for all submitted jobs to be completed or canceled */
+	wait_event(hwctx->priv->job_free_wq,
+		   atomic64_read(&hwctx->job_submit_cnt) ==
+		   atomic64_read(&hwctx->job_free_cnt));
 
-	aie2_hwctx_wait_for_idle(hwctx);
-	drm_sched_entity_destroy(&hwctx->priv->entity);
 	drm_sched_fini(&hwctx->priv->sched);
 	aie2_ctx_syncobj_destroy(hwctx);
 
-	XDNA_DBG(xdna, "%s sequence number %lld", hwctx->name, hwctx->priv->seq);
-
 	for (idx = 0; idx < ARRAY_SIZE(hwctx->priv->cmd_buf); idx++)
 		drm_gem_object_put(to_gobj(hwctx->priv->cmd_buf[idx]));
 	amdxdna_gem_unpin(hwctx->priv->heap);
@@ -879,6 +881,7 @@ int aie2_cmd_submit(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
 	drm_gem_unlock_reservations(job->bos, job->bo_cnt, &acquire_ctx);
 
 	aie2_job_put(job);
+	atomic64_inc(&hwctx->job_submit_cnt);
 
 	return 0;
 
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
index d11b1c83d9c3..43442b9e273b 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.c
+++ b/drivers/accel/amdxdna/amdxdna_ctx.c
@@ -220,6 +220,8 @@ int amdxdna_drm_create_hwctx_ioctl(struct drm_device *dev, void *data, struct dr
 	args->syncobj_handle = hwctx->syncobj_hdl;
 	mutex_unlock(&xdna->dev_lock);
 
+	atomic64_set(&hwctx->job_submit_cnt, 0);
+	atomic64_set(&hwctx->job_free_cnt, 0);
 	XDNA_DBG(xdna, "PID %d create HW context %d, ret %d", client->pid, args->handle, ret);
 	drm_dev_exit(idx);
 	return 0;
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h b/drivers/accel/amdxdna/amdxdna_ctx.h
index 80b0304193ec..f0a4a8586d85 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.h
+++ b/drivers/accel/amdxdna/amdxdna_ctx.h
@@ -87,6 +87,9 @@ struct amdxdna_hwctx {
 	struct amdxdna_qos_info		     qos;
 	struct amdxdna_hwctx_param_config_cu *cus;
 	u32				syncobj_hdl;
+
+	atomic64_t			job_submit_cnt;
+	atomic64_t			job_free_cnt ____cacheline_aligned_in_smp;
 };
 
 #define drm_job_to_xdna_job(j) \
-- 
2.34.1

