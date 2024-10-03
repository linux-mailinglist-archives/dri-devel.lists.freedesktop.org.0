Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 490A398EF94
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 14:45:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E2310E83D;
	Thu,  3 Oct 2024 12:45:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vMMjghMW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2067.outbound.protection.outlook.com [40.107.93.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAFDF10E83D;
 Thu,  3 Oct 2024 12:45:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zy4ZSsNNUihagS8XUzY101ZDmFJ2LzLNX958NrswVmUoWJRYmW5Ms89W/4ArHW+ktazoe4dVMmd88r+y/VgMMHtEdyQDe8i8O7evspHnoYZni9BsA5/u/tktG4JZcQNYgNWrtan32DMbjN9H0j9hAI0H8B+eGkDLSwfprcQyUSyNSrh2W7Izg5VIB505HZ+ibZF2uo07LwpBuxRu5MDANr1QfDf56ZWEiO5iiGkXJTY+muUTQn3YmVbbjqVUywlVd2UCgeqdly0bMMdLJpbqwCvvpRw+/nhryXvFaYyAwmktLZpx5zHPqUkx1659PaY+1lhqTijUF2eRrNhU9py0mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Iggs00ZzAIwa2gnAVKT5mtbzHYVfL4Ni9ls0jz6rEM=;
 b=yeFj/Tp7o3+1EGLrgBWjJ6zGROGSXmt1uxvzW8f8ixCgWj2Y7aVPp+Y/ELSys7KbG/EaN4Q2wz+1l0WuGDsBRtTb/ynhQosM2nlEDQLByyJeXgiI8dktFzYTzXC7OfMBfPWiVsea42bLv0iEc4tVWKi3HR1vGj2gmbHlO9XP6mvndosHz4D8A9JymmdgxXJgPvuf/IZo7hUTb5SeKyghcOhkI+d5BP63sGTLi5i4RrVkQ+MMjPyRl/JBJctpiDd7z11WAENo1j/ZmE0UkRlVGHV8zmC+/3T5LjsRN9HM0QUTGKVsVXdtubSoRb1kfYSA2VbnzzQjasrWh9ELcEnJgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Iggs00ZzAIwa2gnAVKT5mtbzHYVfL4Ni9ls0jz6rEM=;
 b=vMMjghMW7rodeHPhScGBDfG/YOiM1fQAZ6chqc3UwJKg377qkw7WdGTxdYaGGNP+8h7YeQrzglYNBIiLYaobpsOLJeFHuqb598Gk3rF37/JkFQC3HVh+az92iLjNg6v+ZfMBab7TN61/GfM12Kz7aiFB2peB/MVv+vb5aglrI10=
Received: from SA1P222CA0063.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2c1::12)
 by MW3PR12MB4346.namprd12.prod.outlook.com (2603:10b6:303:58::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Thu, 3 Oct
 2024 12:45:47 +0000
Received: from SA2PEPF00003F61.namprd04.prod.outlook.com
 (2603:10b6:806:2c1:cafe::95) by SA1P222CA0063.outlook.office365.com
 (2603:10b6:806:2c1::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18 via Frontend
 Transport; Thu, 3 Oct 2024 12:45:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003F61.mail.protection.outlook.com (10.167.248.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 12:45:46 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 07:45:43 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <dmitry.osipenko@collabora.com>, <jani.nikula@linux.intel.com>,
 <christian.koenig@amd.com>, <tursulin@igalia.com>, <simona.vetter@ffwll.ch>,
 <robdclark@gmail.com>, <alexander.deucher@amd.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v5 5/6] drm/amdgpu: make process_name a flexible array
Date: Thu, 3 Oct 2024 14:43:13 +0200
Message-ID: <20241003124506.470931-6-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241003124506.470931-1-pierre-eric.pelloux-prayer@amd.com>
References: <20241003124506.470931-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F61:EE_|MW3PR12MB4346:EE_
X-MS-Office365-Filtering-Correlation-Id: b96dec65-725d-41af-3e08-08dce3a94d8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fIJz99pIH+MdEU7r9RFBHnife0eJqVaikl9dADOp5XSAaFuxNrQyBh5wzKER?=
 =?us-ascii?Q?HWcegswgT9FYg6CTxlpRHenAYBL3pK7O7mZgm2DqMi/w4LlqTnA9fJ4Rm4Dx?=
 =?us-ascii?Q?W9HTkhFa5FsCsbCzj6g5Qi1YzFhWSDWRcPPr4rE2mvvp5iCtzXBLFYT4bqAF?=
 =?us-ascii?Q?kQFj6ukF2GrkqELdbdV/6L6905T16ELBPFb1F2RXUilkHNuSNwxjOXM7D3Q4?=
 =?us-ascii?Q?lxYf1wQCP4G/aPV2f/d9QHCsEhpJFHKf7FlyJio3TO2p3/ZNw6vj1bPzmSPm?=
 =?us-ascii?Q?MJPUzG5R87eBiuOqajU+wm8Rq9B9P9UA7Zh2sEjk+kIQl+2Bl+/K7vV5Cr1K?=
 =?us-ascii?Q?MNYCd72twFbJ0MUycd4MaWfnoR4qn3cz0AHabzEs2KGr3xSn6+exRhFdr63N?=
 =?us-ascii?Q?dCTqi4/fEb1yV751U8bJwmY8JOWb+nnobtPJsaWS+5woLeYiUI3qRM2XaLPc?=
 =?us-ascii?Q?+PnKfUVC8sSJGyx331TeVsY+7yyhZXE2mQoMcVUOE5H/IjXkOTnI0JgHqH6L?=
 =?us-ascii?Q?T7ErNQ13WOjRtwQ8IUJOrD/3WwqiSjPfwucHoepSHS5txWGACLTP+9a/tHR8?=
 =?us-ascii?Q?DmEwwIgVNFwQQW4IVZVoSIufJrbeIMnaBUmWEBIy6Ox3+qlCABknhGZ4pBci?=
 =?us-ascii?Q?8YCgrJSMIqqryZNItTO4QhC8izQVTADLAEqPTr+neRf36FG8BYXAKm7K+q01?=
 =?us-ascii?Q?+a6Y1lGeGT6ZpGxfaznGXbl5lK+OVKnL4JXrH7i3ZdJG8CZqnZ2pqnjmy3nm?=
 =?us-ascii?Q?58bMjlkCeHNVp++sCckmy70vEaeOG2o7KYoPrRMiphCtCHugSGb/5u9N41p0?=
 =?us-ascii?Q?yepQ4SkGhUGJyXklg25p0knQmavKCn7PIcEzfFIcxCz0Li6quB/xvjyZy0bh?=
 =?us-ascii?Q?McK11tl/3L+gimXZ6Z8P7lauvgikdrz9rdNyXDA6yQPSzHZJkSWfjN/4Xh/q?=
 =?us-ascii?Q?SpPFk3rGkmklI1qaaQOsWoJ80zHUP1eIshGRicjsxImAtbAjF1VWBzOeusBq?=
 =?us-ascii?Q?168ZONuzlfPmb8EZ5ZtDPwC5J3I3zEWjMfvNPyyZId/jSWOvpLoETOFA/pSX?=
 =?us-ascii?Q?l41TitDF++i1KapL8M8OTArXPy87gljqhkETlk5x7+9GVwzPoB/M4DPG6p41?=
 =?us-ascii?Q?9/grXUSBVc9Kz7S9d8AFVkgzWCB1Ve4ClXtIzZvx+I551YQw3ZeG7YXPI0Yu?=
 =?us-ascii?Q?Q209uzo/zGpsfQ+5Bfwj1vxAUK7YydT31Dg7sicCQx5BJAjyYT37rJqnCa7z?=
 =?us-ascii?Q?/gOZ5jQbqarD0fH46WjYpyiPKdnv90XrRVbbspYgHP9I4wUSe7+9bZJVYj4g?=
 =?us-ascii?Q?k4OubzZw3Ebubb+dCqnqL+KH8xELx9gMrMJEfypx3bHAy+xjtcGRppM0a1jL?=
 =?us-ascii?Q?9bzhi8bcuvMe0sdlRA35adASIVVl?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 12:45:46.8910 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b96dec65-725d-41af-3e08-08dce3a94d8d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4346
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

And rename it process_desc, since it will soon contain more than
just the process_name.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c      |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c          |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c           | 13 +++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h           |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c           |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c           |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c           |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c           |  2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c         |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c          |  2 +-
 13 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index cbef720de779..c2185e43e38d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -1786,7 +1786,7 @@ static int amdgpu_debugfs_vm_info_show(struct seq_file *m, void *unused)
 
 		ti = amdgpu_vm_get_task_info_vm(vm);
 		if (ti) {
-			seq_printf(m, "pid:%d\tProcess:%s ----------\n", ti->pid, ti->process_name);
+			seq_printf(m, "pid:%d\tProcess:%s ----------\n", ti->pid, ti->process_desc);
 			amdgpu_vm_put_task_info(ti);
 		}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
index 5ac59b62020c..4ca0a372984b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
@@ -220,8 +220,8 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
 		   coredump->reset_time.tv_nsec);
 
 	if (coredump->reset_task_info.pid)
-		drm_printf(&p, "process_name: %s PID: %d\n",
-			   coredump->reset_task_info.process_name,
+		drm_printf(&p, "process: %s PID: %d\n",
+			   coredump->reset_task_info.process_desc,
 			   coredump->reset_task_info.pid);
 
 	/* SOC Information */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index ad6bf5d4e0a9..d1678eebbff3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -125,7 +125,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 	if (ti) {
 		dev_err(adev->dev,
 			"Process information: process %s pid %d thread %s pid %d\n",
-			ti->process_name, ti->tgid, ti->task_name, ti->pid);
+			ti->process_desc, ti->tgid, ti->task_name, ti->pid);
 		amdgpu_vm_put_task_info(ti);
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 6cd5bd5362d4..561ff832930e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2357,13 +2357,22 @@ amdgpu_vm_get_task_info_pasid(struct amdgpu_device *adev, u32 pasid)
 
 static int amdgpu_vm_create_task_info(struct amdgpu_vm *vm)
 {
-	vm->task_info = kzalloc(sizeof(struct amdgpu_task_info), GFP_KERNEL);
+	char process_name[TASK_COMM_LEN];
+	size_t pname_len;
+
+	get_task_comm(process_name, current->group_leader);
+	pname_len = strlen(process_name);
+
+	vm->task_info = kzalloc(
+		struct_size(vm->task_info, process_desc, pname_len + 1),
+		GFP_KERNEL);
+
 	if (!vm->task_info)
 		return -ENOMEM;
 
 	/* Set process attributes now. */
 	vm->task_info->tgid = current->group_leader->pid;
-	get_task_comm(vm->task_info->process_name, current->group_leader);
+	strscpy(vm->task_info->process_desc, process_name, pname_len + 1);
 
 	kref_init(&vm->task_info->refcount);
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index d12d66dca8e9..44da250217be 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -232,11 +232,11 @@ struct amdgpu_vm_pte_funcs {
 };
 
 struct amdgpu_task_info {
-	char		process_name[TASK_COMM_LEN];
 	char		task_name[TASK_COMM_LEN];
 	pid_t		pid;
 	pid_t		tgid;
 	struct kref	refcount;
+	char		process_desc[];
 };
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
index 9784a2892185..c82364e43a15 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
@@ -166,7 +166,7 @@ static int gmc_v10_0_process_interrupt(struct amdgpu_device *adev,
 	if (task_info) {
 		dev_err(adev->dev,
 			" in process %s pid %d thread %s pid %d\n",
-			task_info->process_name, task_info->tgid,
+			task_info->process_desc, task_info->tgid,
 			task_info->task_name, task_info->pid);
 		amdgpu_vm_put_task_info(task_info);
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
index 2797fd84432b..4dace3de1def 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
@@ -136,7 +136,7 @@ static int gmc_v11_0_process_interrupt(struct amdgpu_device *adev,
 		if (task_info) {
 			dev_err(adev->dev,
 				" in process %s pid %d thread %s pid %d)\n",
-				task_info->process_name, task_info->tgid,
+				task_info->process_desc, task_info->tgid,
 				task_info->task_name, task_info->pid);
 			amdgpu_vm_put_task_info(task_info);
 		}
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
index edcb5351f8cc..e56d702fbfed 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
@@ -129,7 +129,7 @@ static int gmc_v12_0_process_interrupt(struct amdgpu_device *adev,
 		if (task_info) {
 			dev_err(adev->dev,
 				" in process %s pid %d thread %s pid %d)\n",
-				task_info->process_name, task_info->tgid,
+				task_info->process_desc, task_info->tgid,
 				task_info->task_name, task_info->pid);
 			amdgpu_vm_put_task_info(task_info);
 		}
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
index 86488c052f82..5fca64e71ada 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
@@ -1451,7 +1451,7 @@ static int gmc_v8_0_process_interrupt(struct amdgpu_device *adev,
 		task_info = amdgpu_vm_get_task_info_pasid(adev, entry->pasid);
 		if (task_info) {
 			dev_err(adev->dev, " for process %s pid %d thread %s pid %d\n",
-				task_info->process_name, task_info->tgid,
+				task_info->process_desc, task_info->tgid,
 				task_info->task_name, task_info->pid);
 			amdgpu_vm_put_task_info(task_info);
 		}
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
index c76ac0dfe572..c54c86dac14f 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -635,7 +635,7 @@ static int gmc_v9_0_process_interrupt(struct amdgpu_device *adev,
 	if (task_info) {
 		dev_err(adev->dev,
 			" for process %s pid %d thread %s pid %d)\n",
-			task_info->process_name, task_info->tgid,
+			task_info->process_desc, task_info->tgid,
 			task_info->task_name, task_info->pid);
 		amdgpu_vm_put_task_info(task_info);
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
index 23ef4eb36b40..ea1990c19803 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
@@ -2186,7 +2186,7 @@ static int sdma_v4_0_print_iv_entry(struct amdgpu_device *adev,
 	if (task_info) {
 		dev_dbg_ratelimited(adev->dev,
 				    " for process %s pid %d thread %s pid %d\n",
-				    task_info->process_name, task_info->tgid,
+				    task_info->process_desc, task_info->tgid,
 				    task_info->task_name, task_info->pid);
 		amdgpu_vm_put_task_info(task_info);
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
index c77889040760..df00bf480dcf 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
@@ -1701,7 +1701,7 @@ static int sdma_v4_4_2_print_iv_entry(struct amdgpu_device *adev,
 	task_info = amdgpu_vm_get_task_info_pasid(adev, entry->pasid);
 	if (task_info) {
 		dev_dbg_ratelimited(adev->dev, " for process %s pid %d thread %s pid %d\n",
-				    task_info->process_name, task_info->tgid,
+				    task_info->process_desc, task_info->tgid,
 				    task_info->task_name, task_info->pid);
 		amdgpu_vm_put_task_info(task_info);
 	}
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
index ea3792249209..95ba07ae3b89 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_events.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
@@ -1267,7 +1267,7 @@ void kfd_signal_reset_event(struct kfd_node *dev)
 			if (ti) {
 				dev_err(dev->adev->dev,
 					"Queues reset on process %s tid %d thread %s pid %d\n",
-					ti->process_name, ti->tgid, ti->task_name, ti->pid);
+					ti->process_desc, ti->tgid, ti->task_name, ti->pid);
 				amdgpu_vm_put_task_info(ti);
 			}
 		}
-- 
2.40.1

