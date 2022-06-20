Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5C25526D0
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 00:03:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BEEA10F730;
	Mon, 20 Jun 2022 22:03:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EBC010F71A;
 Mon, 20 Jun 2022 22:03:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ieyW8E0wO/O4inhE8/ADqPmY8MJH6P4SVJw+sizr6Dh5VoxzPONzF6X7wM3wwj92wv3LxCCX7QI8dZ375H4c0PMcpxgVUm3iYFw9ls+BKambPERqVweelhT0YjzWeYM2jVDKkycdTGNrjO7MIrVTzKReNVCBFHCu8VzXwK1shqzItdiyL9ZwaZKuzRSa9VzvMsheCMmHIIaGxEV2Nh2gX0MIDABLXYLcRNI1G0Vmqia9VcAAABSEMNNyqGgZGsePoWkff89dB2677v1Q4UUODd7pjtHZMvQN5hUJxZmkHrD5E50LkDBXDTBS7gDVnQGplISi9gtKTQVJhlv9foqmSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TyJZTsCkrjcKfbP7lXdrG44FSirUMZ7lN34LVAM5P5Q=;
 b=VN1B8bP7b6M7bZQSbfQVOJfBBBTcHGS3wVroc0u1idKk5AUFq+d+ITfMfBLGhi/q0j8F5TfOikxAmZNUpxs5ncU4OUrYfHf3pgIPewqCiQbMDf2yLEqCeCbKEi28xeazyRDQoDjCW1HoljAb+gUdX5rNXHBPexctBpLN1cvZXZQUTtK2sLk/atJM8VHDmP1dlXtLm6VslfZipU4zEpOh12GWEndoJ2FEt1dPZXKsZS6j+bQo+mAOMxAb2wU4ukD1hX6ZoEhOYh7cPSy5KhpS2QhTuMkOpIKJkQDJxQ8ZVS7FmM5haT9hwwe3wxfN0Rvt4A4jFfodP+wYroyelCtoCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TyJZTsCkrjcKfbP7lXdrG44FSirUMZ7lN34LVAM5P5Q=;
 b=dBw/WpkWHut+bJadm3ip2hSiq/0kkW1rigKDYoeDgW+LZxbWU7q5n5JmJf7KrYjB8PSRsicQTJfZ7o1Qyh2xNLELTn9mwHPQTI2jGRRrvPFYf8mcCu5D1Hn+ZFlWdXXAZgY3kEnGj5ONRGom+IB5V0fgVi4LlSC9u93YVuRavqY=
Received: from MWH0EPF00056D03.namprd21.prod.outlook.com
 (2603:10b6:30f:fff2:0:1:0:d) by MWHPR12MB1151.namprd12.prod.outlook.com
 (2603:10b6:300:e::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Mon, 20 Jun
 2022 22:03:42 +0000
Received: from CO1NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::207) by MWH0EPF00056D03.outlook.office365.com
 (2603:1036:d20::b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.2 via Frontend
 Transport; Mon, 20 Jun 2022 22:03:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT054.mail.protection.outlook.com (10.13.174.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5353.14 via Frontend Transport; Mon, 20 Jun 2022 22:03:42 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 20 Jun 2022 17:03:40 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 4/5] drm/sched: Partial revert of 'drm/sched: Keep
 s_fence->parent pointer'
Date: Mon, 20 Jun 2022 18:03:01 -0400
Message-ID: <20220620220302.86389-5-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620220302.86389-1-andrey.grodzovsky@amd.com>
References: <20220620220302.86389-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e77c0b9-a4b8-4843-b7b7-08da5308bd21
X-MS-TrafficTypeDiagnostic: MWHPR12MB1151:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1151F624512AB445B8EB0ED6EAB09@MWHPR12MB1151.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YyWrG9tb6otxwR/j2PmghR8a2u2OVDn24pPP5DOhvD4MGe+2vAcTrViqccU0BMvRbm9ZLlkqYcNi6q16NuHINzaJATMQbo1RYlYhScC4teTCPTtCoNlJ/8bISSSKhWYxXKkG+AVGlLOs/uW9XcMdgXuJXDGXrH+9MFbuigBg3UK2a/3jieRZ4psCC9wJ1/PLMBSOXmm3xaWZmG8ZhcPg5uzefi2OLqWWiLdOksmZOZLFS1L3MdwWfiI7+Ji7caViZdELMZdg5hz4RhtWBfjirN0H5lAnMVK8Y5cY5V+0YXXFiCm26ZvoH/M0juj4NdHdUcH19j5IWPCyGG+IN58nCJy/EgiyQzJLxan7Gv+d2wd/sTIzdqRIF7IE33sbrjGr/bi8xwEjN3zd6lemO8Xs2Ja+gCy4RRk9V5PQA48F7mEB2we1HNvqn2WXdnjSr7W7JFo2ER6URj7rDW9uaxbB/V0KqabuhIQnVNNusjv9a7dbEmXLN+21xYBbcQIbIR09EsPNSsEDnLfVI+wsBEuSxLrMA8nw10bre4trBd4QNq31ZVLi/4ELWthUbprXjsM2TBhhBtqMTw5zfhXdrOeiPDzWPZZLUy+MnlF18fSwzxE93GVaBgGKkQoZay3Wvhh6SgtnKp8yPCfSQW+E5l/SHlK1P+g1GR0QPP/exjhuLyChYm3TPTaoi3JgiO5+EjvuheRzs1ymwHV/JlWr4aHdg3CeJzJoSpk9Xi9vfcpZ+FWR8gn/vsuQ47u9HfAxoJKUMWM2vRLgkU+p4wu+noLZXJx0/ZNPafknJS0k9Nqp1ig7sTfw91do427QjiuzQWlR5L5mTVSxMtirELqE1ARbyA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(376002)(39860400002)(136003)(36840700001)(46966006)(40470700004)(16526019)(426003)(186003)(82740400003)(70206006)(47076005)(450100002)(1076003)(83380400001)(86362001)(336012)(40460700003)(4326008)(70586007)(356005)(5660300002)(81166007)(44832011)(2616005)(2906002)(36860700001)(40480700001)(478600001)(8936002)(41300700001)(7696005)(26005)(8676002)(36756003)(6666004)(54906003)(316002)(966005)(82310400005)(110136005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2022 22:03:42.2418 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e77c0b9-a4b8-4843-b7b7-08da5308bd21
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1151
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
Cc: jingwen.chen2@amd.com, Christian.Koenig@amd.com, monk.liu@amd.com,
 yiqing.yao@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Problem:
This patch caused negative refcount as described in [1] because
for that case parent fence did not signal by the time of drm_sched_stop and hence
kept in pending list the assumption was they will not signal and
so fence was put to account for the s_fence->parent refcount but for
amdgpu which has embedded HW fence (always same parent fence)
drm_sched_fence_release_scheduled was always called and would
still drop the count for parent fence once more. For jobs that
never signaled this imbalance was masked by refcount bug in
amdgpu_fence_driver_clear_job_fences that would not drop
refcount on the fences that were removed from fence drive
fences array (against prevois insertion into the array in
get in amdgpu_fence_emit).

Fix:
Revert this patch and by setting s_job->s_fence->parent to NULL
as before prevent the extra refcount drop in amdgpu when
drm_sched_fence_release_scheduled is called on job release.

Also - align behaviour in drm_sched_resubmit_jobs_ext with that of
drm_sched_main when submitting jobs - take a refcount for the
new parent fence pointer and drop refcount for original kref_init
for new HW fence creation (or fake new HW fence in amdgpu - see next patch).

[1] - https://lore.kernel.org/all/731b7ff1-3cc9-e314-df2a-7c51b76d4db0@amd.com/t/#r00c728fcc069b1276642c325bfa9d82bf8fa21a3

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Tested-by: Yiqing Yao <yiqing.yao@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index b81fceb0b8a2..b38394f5694f 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -419,6 +419,11 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 		if (s_job->s_fence->parent &&
 		    dma_fence_remove_callback(s_job->s_fence->parent,
 					      &s_job->cb)) {
+			/* Revert drm/sched: Keep s_fence->parent pointer, no
+			 * need anymore for amdgpu and creates only troubles
+			 */
+			dma_fence_put(s_job->s_fence->parent);
+			s_job->s_fence->parent = NULL;
 			atomic_dec(&sched->hw_rq_count);
 		} else {
 			/*
@@ -548,7 +553,6 @@ void drm_sched_resubmit_jobs_ext(struct drm_gpu_scheduler *sched, int max)
 		if (found_guilty && s_job->s_fence->scheduled.context == guilty_context)
 			dma_fence_set_error(&s_fence->finished, -ECANCELED);
 
-		dma_fence_put(s_job->s_fence->parent);
 		fence = sched->ops->run_job(s_job);
 		i++;
 
@@ -558,7 +562,11 @@ void drm_sched_resubmit_jobs_ext(struct drm_gpu_scheduler *sched, int max)
 
 			s_job->s_fence->parent = NULL;
 		} else {
-			s_job->s_fence->parent = fence;
+
+			s_job->s_fence->parent = dma_fence_get(fence);
+
+			/* Drop for orignal kref_init */
+			dma_fence_put(fence);
 		}
 	}
 }
@@ -952,6 +960,9 @@ static int drm_sched_main(void *param)
 
 		if (!IS_ERR_OR_NULL(fence)) {
 			s_fence->parent = dma_fence_get(fence);
+			/* Drop for original kref_init of the fence */
+			dma_fence_put(fence);
+
 			r = dma_fence_add_callback(fence, &sched_job->cb,
 						   drm_sched_job_done_cb);
 			if (r == -ENOENT)
@@ -959,7 +970,6 @@ static int drm_sched_main(void *param)
 			else if (r)
 				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
 					  r);
-			dma_fence_put(fence);
 		} else {
 			if (IS_ERR(fence))
 				dma_fence_set_error(&s_fence->finished, PTR_ERR(fence));
-- 
2.25.1

