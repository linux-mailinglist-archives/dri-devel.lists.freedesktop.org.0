Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8980D9880BF
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 10:50:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A1310EC8E;
	Fri, 27 Sep 2024 08:49:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="46Pt7fcC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2087.outbound.protection.outlook.com [40.107.220.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1224410EC8D;
 Fri, 27 Sep 2024 08:49:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IMGrLljCAkIw3HxIrM6AnghYAD58OH3zTg3vCKQ88q7CPpWEfXUikEfqI9/vReKRk7wEHPpTPOPee6NBINe4JNCSOl3xo92KEtaRpqEAhQyugSHUnGKrh5f/JEtcozU/ork7G6SHpRldGKZyj3PDlNbXfk/sWjalcBh2IctTg9htzRewsD6k1O4hrc/JZXOXdkw658eKL13Rez6eQ4iPK4U1TdrY01F9TTghdeiA3+EPGp5/v5piAzxBeBV9Rt/2n3ijJSFX7ioLa25qfzdLbWQJJiikm+tx13tBmcCBPTTHxH3woCko87NEmiDkava3Xm7YQs+ZauKwf/zY6w0AHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eBuKALi4se0gRlCS/U4Xce/SJYbnTBUgSzeVI5R/dWw=;
 b=xR0gVXmViPTSQMW9T3+Z84na+QWDG+XTZrt3pfObNgRbLph2z5IzHJrlJVTNxDHQ8i1BnnicOm12ZnunTFNfguatZ2AZKvtAcx5Y40hb79Xndvrvw+fV8d7I9Ky9B15haSDk0Gfp+ZEWLAwoI00mfvQErqGATtsfQtmNApTUFtYjc63JTsJVuCQJ/aYnC3ZKrTb66kE1KyetUeXaH4b+37NFmUncBlL9lVBW6no4ZFrQouhas9LQOelEO8zmB6KujiyRZiFx716Pg29Q+/w2QHJo0S23ah12h8EL2obbNHnkTR+buX/carXGKxOh7wn5ZL1IvbsmZBn6+O/J1HdXmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eBuKALi4se0gRlCS/U4Xce/SJYbnTBUgSzeVI5R/dWw=;
 b=46Pt7fcCSH474NcwWT2hWqxLq5vSzwON4b5oUTyrLMTbo93yVN+7+irTpQZDK4Id6kNaZQVXv1mcyNGKc958+cXv2CV++1Cjjk9GA8md9gmHbJrVVM61sYpUIFyXyApJU34krRPLko1+SO89Te2KwsOsHhD1LwXCD/n/S66Kzzw=
Received: from MN2PR20CA0041.namprd20.prod.outlook.com (2603:10b6:208:235::10)
 by BL1PR12MB5874.namprd12.prod.outlook.com (2603:10b6:208:396::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Fri, 27 Sep
 2024 08:49:42 +0000
Received: from MN1PEPF0000F0E2.namprd04.prod.outlook.com
 (2603:10b6:208:235:cafe::7b) by MN2PR20CA0041.outlook.office365.com
 (2603:10b6:208:235::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.20 via Frontend
 Transport; Fri, 27 Sep 2024 08:49:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E2.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Fri, 27 Sep 2024 08:49:42 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Sep
 2024 03:49:38 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <dri-devel@lists.freedesktop.org>, <christian.koenig@amd.com>,
 <tursulin@igalia.com>, <simona.vetter@ffwll.ch>, <robdclark@gmail.com>,
 <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dmitry.osipenko@collabora.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v4 5/6] drm/amdgpu: make process_name a flexible array
Date: Fri, 27 Sep 2024 10:48:41 +0200
Message-ID: <20240927084848.263718-6-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240927084848.263718-1-pierre-eric.pelloux-prayer@amd.com>
References: <20240927084848.263718-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E2:EE_|BL1PR12MB5874:EE_
X-MS-Office365-Filtering-Correlation-Id: a65eaec1-0ccf-4a12-30f8-08dcded1547c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?L8/0Nf871PcSIht4KRv7xBUb1yRpDJFjx8iHSnE1ANqyw1yr/EYZaPSkHkp0?=
 =?us-ascii?Q?+E17I9XEhzpKtkzCDLZrIXPNwb5Xd3FblBJ5FJ5TUNznH9Lcx43oa7HRBNbU?=
 =?us-ascii?Q?BRJIA2GtNg3XinBB4lNY2kZwczQ5tmbjz0dsKP84SbyWvkPIOPMtnEVYVlOA?=
 =?us-ascii?Q?H9GtoJgYhuvj6rrzb7Lm891Z9II/gz3YI4v8+mUdM4ViTFk987DOw2Iu+vIE?=
 =?us-ascii?Q?yi3pTYBjiWi9fVrIjVhMpYm7hMx3JJX7c6n39Q95Q7NS4SWdqiQD8gZ1VdxN?=
 =?us-ascii?Q?ov4tT1VuG68P5j5c5/sgJJtz7cZIGZinSAAHQsB3mA2TczIok1C/hbTaOi8x?=
 =?us-ascii?Q?VgkamLV6D/oUcDnWHRdLizAHWPbgOaM7GFw9jrCXN9Bt4gQVECBiQ/5SCzmI?=
 =?us-ascii?Q?0vBPPL39YGeD6PRxg9S/V3qsWHMdrEAMUiSZT3Y7DOV3w3JVcAnYwHrpJ2xg?=
 =?us-ascii?Q?A1vbWq3NyxgLYB7V9i6u13u70vVs2LamnVVZbmG1s72voPmjbxZ9ZotZtSxA?=
 =?us-ascii?Q?yBuXms4S19P/vfI7q/UGzYufQfPG7X15qtnzLJArymbbyV1E0sQIn3bRsV29?=
 =?us-ascii?Q?DtUM3hL1SQfztzi1bFkwCJazKRwo+A9iGgn3mr7iDh/xUD1KPVUrfTqsWzu0?=
 =?us-ascii?Q?4TWOVQywYx1eIWT1vk3AaKka17xbkK6a4uW7zkpsijXBFj3RaH8cWuN9hkdq?=
 =?us-ascii?Q?c/DG02pMnCO0EmYCfKfDdCTYwSulNWw2H1qIawaXT8jFxNLM8aFInqq31ou9?=
 =?us-ascii?Q?viTbtjwRfZFeWAyJsFy0bxXRkZ8xfCfkL0Muo5GTvxLY7/uPSM0ROJ9G3cWU?=
 =?us-ascii?Q?5TiP/cyacU7Bsdr9JcoAt8+TiTolk2FtRLSfPi+2rz26kJpAFESNw5QPj3e7?=
 =?us-ascii?Q?OKBEYT0y2yfI6vU+xN2KQTS6jYuWfNjvAG88cGEw+T4INkKNcvZw2kguT7Tm?=
 =?us-ascii?Q?RQG7wXWWdLpuuzo+qBMAwoNvcOjMsp/94KSE7IKXiqq7oUUy7uzsC69YJr5i?=
 =?us-ascii?Q?ySnwd4LIccdaedJeFYprpN8YAi5g/CylTPM8Zo3rkaLkhZjUd4txrXhvx2v2?=
 =?us-ascii?Q?XoHegrv0ayelcoFW6midMmNGLzkUgLU/T638KtWkEr/BI9hwnl0yQMMA5iHp?=
 =?us-ascii?Q?tTIPZ287oVq8uV8QYs6TgmfJNqXhrgUUNdtB4XLJV+fkegDf/H/g2FhvSr+U?=
 =?us-ascii?Q?xwbTe5exP9MZh0RRhtRI5ffYk+GgTcSnHsf6JYAoBIR368RpRgW4iMZVhpH4?=
 =?us-ascii?Q?cSORConz0P818QHKayRG36VqnWUa5tT9GJwjAfCEeKib4CXdu3+hSXKaL+MN?=
 =?us-ascii?Q?FFwi0ot04N+St8gD6EKUXUDBirKF4OOMgW2DOyxctTiqzcRJMwqtiLfOJ1ND?=
 =?us-ascii?Q?SWDJsxpfVQhq3lpxrfGQSzVMMWJNXRIsG9xrEapB9wpzqL4FCd0knEpxDsOg?=
 =?us-ascii?Q?gnvWPkPifRfupQTzzbfNP6AQ8pQI6cFX?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 08:49:42.5942 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a65eaec1-0ccf-4a12-30f8-08dcded1547c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5874
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
index 6cd5bd5362d4..cec0a5cffcc8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2357,13 +2357,22 @@ amdgpu_vm_get_task_info_pasid(struct amdgpu_device *adev, u32 pasid)
 
 static int amdgpu_vm_create_task_info(struct amdgpu_vm *vm)
 {
-	vm->task_info = kzalloc(sizeof(struct amdgpu_task_info), GFP_KERNEL);
+	char process_name[TASK_COMM_LEN];
+	int desc_len;
+
+	get_task_comm(process_name, current->group_leader);
+	desc_len = strlen(process_name);
+
+	vm->task_info = kzalloc(
+		struct_size(vm->task_info, process_desc, desc_len + 1),
+		GFP_KERNEL);
+
 	if (!vm->task_info)
 		return -ENOMEM;
 
 	/* Set process attributes now. */
 	vm->task_info->tgid = current->group_leader->pid;
-	get_task_comm(vm->task_info->process_name, current->group_leader);
+	strscpy(vm->task_info->process_desc, process_name, desc_len + 1);
 
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

