Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A76A97D372
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 11:10:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF6F610E7F7;
	Fri, 20 Sep 2024 09:10:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MB8MJ03+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2076.outbound.protection.outlook.com [40.107.223.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48DA510E7F5;
 Fri, 20 Sep 2024 09:10:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D4iSBQvzJZnMTtmpoIS5VkbwWLmMOUll/gSdFIdiISq6t5yQw1Wugev+cSW45wCgxeBeCFDRRpRcKR7YhkrrZtPx1VZp4zvoq+cPRXVmu1XkuvzE9trebFh8Ufd5/jTZhuYB4vNDLPAbt3ViQfkudYJ7nVqwjA0QQ38CPE9gTenf9q3KrBlzQZHigryr49TYKGhk8Zlhp/RRH4Ncb/LtUgNYFBTKaIJOkWQsIsrvDEOGnMKbHUi0T9NsCsvuuUbQuEvcpkYrl0KpkgAyRNXXRz8X648pO7halODSEIUe/Cbd1AsdKPaoixARefbnxrlnMRRkQEywIs/IroSWM54myg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rzq2PWwBF5hjtU43AMv1Dq7nuQPiVX+F4y1egAzNB1o=;
 b=ei89dILGs4DVm7hY8GY5gG7L7HYYXb9SZCpI4cN3QAp2qNzWXKlm3b7059T/NHwbfoDeY2hrxNL5s4x2UkRyK9e61a3eDjeOx4bP8hh5XIL2xVIG87qxwsGlMZ18J+7AIY5YV7uyDCrnxMfPDJgHfPjVP/8zWpI2Bch99a+ZEhGn80I0ueK8wBYVKze4V111gI2BjLJS3EH8fgvfrDDd/DjxKEkYuD+H9cjnsgIjmc74WRFyO5JTXdlVUMPAJbrYAAkas21Ez+mkFzImDDIuVaVLKYTUF8SaHMV3rvUMBDgE0PrhvvEveSaC6xEvGBC5FUBCV32w0b8LyZSWuXfQTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rzq2PWwBF5hjtU43AMv1Dq7nuQPiVX+F4y1egAzNB1o=;
 b=MB8MJ03+TB7Ih76DC2l8sj8B183CzioqD1gTdLJ795y8DgLGEctmQy6OSpcUAnGSOLIIxGCcwljUb4btsd/XqXqg1uOKUaLZ8xsAjaBkbm6SgtT9FwxetzTDSEdlGYCxNW3/AEOa+YcXxKlwFVkBsR730ulMMb+ysWGcqKTUiiA=
Received: from CH0PR13CA0039.namprd13.prod.outlook.com (2603:10b6:610:b2::14)
 by SJ2PR12MB9140.namprd12.prod.outlook.com (2603:10b6:a03:55f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.22; Fri, 20 Sep
 2024 09:10:04 +0000
Received: from DS3PEPF000099D4.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::19) by CH0PR13CA0039.outlook.office365.com
 (2603:10b6:610:b2::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Fri, 20 Sep 2024 09:10:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D4.mail.protection.outlook.com (10.167.17.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 20 Sep 2024 09:10:03 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Sep
 2024 04:10:01 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <dri-devel@lists.freedesktop.org>, <christian.koenig@amd.com>,
 <tursulin@igalia.com>, <simona.vetter@ffwll.ch>, <robdclark@gmail.com>,
 <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v3 5/6] drm/amdgpu: make process_name a flexible array
Date: Fri, 20 Sep 2024 11:06:47 +0200
Message-ID: <20240920090920.1342694-6-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240920090920.1342694-1-pierre-eric.pelloux-prayer@amd.com>
References: <20240920090920.1342694-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D4:EE_|SJ2PR12MB9140:EE_
X-MS-Office365-Filtering-Correlation-Id: e70fa6bb-7ffa-4443-7b82-08dcd954037a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jnyI0iGQQq+bMs0UZhMzyh1Ge5nHufo3K0ZogPF0cNf+8QhQm5ScXI+slBjY?=
 =?us-ascii?Q?GVDj41gQKWAklr0713Gxh6/byGPxiO91oaNpgqWzqZfngqVkph7fegKO533N?=
 =?us-ascii?Q?l8enfzyZG9NS5Q6IxdCKdX0MmZhf+1atxkxOzCilJbeC1cFEK7bMM4AklKVA?=
 =?us-ascii?Q?W7AhmW36s6DY2A+KYhmd2c8tudQuqQ7BhSSlaiBuj8PPrmw6wz6J1eHecRyT?=
 =?us-ascii?Q?ufkxaEnyGJ7b0T5i9htr31xJlETNmthxd5SoNLq8H0C4jASt2W2NjC8c9p0O?=
 =?us-ascii?Q?7zhbgGBY10BLPajJZEfs4MrrxP09OUIzreW4Pzkb65BIcl1E8Ek0wi9553c3?=
 =?us-ascii?Q?eZomfReemuYJ++OLSjbeDTvGfFqpWolmPZFOB/kZCdca3/63QMfWWRkq5UWr?=
 =?us-ascii?Q?9eZU5Bj1Z1uayCgNz2mFb0jzBHp7l45TcLBWZeLlHr9gGY9LKeLt1MlOca9E?=
 =?us-ascii?Q?k+NCQBzjZYa8fKM1eqyuhsxIlsA9HBQDZVcUpuboMy73zcRZwrTasXMTtJFT?=
 =?us-ascii?Q?v0P3Irv6rED/N87iryvsIiqnAj3pleOAJHX6PMRGVI/sdoGiZK43HmGz6NeX?=
 =?us-ascii?Q?+EbRKPmP6lMkhU+4CgwpOAdXpDoEe2MuGqA7vEP31x81b7ERAOnq3GSVEkK4?=
 =?us-ascii?Q?crhTMj/EcA13CGmm5bFlDqDO2IaeEtWqSUyPpPhUF0pSkDdVIaxDy5yZiXWU?=
 =?us-ascii?Q?uEzqtdxC0ZQeV90fjhvE09o18uB71WuRiDpEp1CWTaO5ORRo0+1A/+3MAruV?=
 =?us-ascii?Q?7UBPGCU64hmLYs4caL6GoZW5zmwXcf5wYZzuLQQUlE6nR4c1b3ALE6Uw7Kcx?=
 =?us-ascii?Q?st+kguUpZP7yIdRlQuXHNzBZl5qjuIq1k/CQEEgTxxSrvuGF6ZMrqW9J6d2M?=
 =?us-ascii?Q?DNU8WFPo+GdilG/+1GQiXYq5RazDl1GADeXnOu5CvqhtzGqP2j4mprT9CVwX?=
 =?us-ascii?Q?HN6XCHaWk1ZJ5loMOYLdjNLjVuWoYijb6nvq82O7l59TXT3Q+MII40zQrO+1?=
 =?us-ascii?Q?dmCfMg/kK/jF4jMi27TDh1W2zpYc1JEOsHEAuPcZDrfAJ6FaVGYC9of6upaA?=
 =?us-ascii?Q?fEbfh2x9YAg70NpkBUnH6pAjbhSpQFmXX0lQ5phqLIOrrkp16UFaLg8CvKnP?=
 =?us-ascii?Q?qkFhK1avnN8sb3n52GB3aSLrB40kKIuEQeeoagbWdZN0xbdeZYg3rfGoLpbh?=
 =?us-ascii?Q?QU6nfsLtoQB+lvZyWluA7bww8f3rmW0CQrQFqAJU70AgFVauJkLBwegmXcId?=
 =?us-ascii?Q?l9S+aSU16LqRmboyTTUr9l8NSckFSFQjT/m8q9Ay7mGMzriIRQRN/f1RfY0U?=
 =?us-ascii?Q?eoe367l692kFZR68iwAg3cBdL0ZFhqiiWyiDC3m94xDShZt2OVatRsN8xLy3?=
 =?us-ascii?Q?2S1DktH6+LUXc6TU/C4buvmUpFyxUEZmkv9S2upcdqSu86O9rdtZvOja76j6?=
 =?us-ascii?Q?//KQYdUql1c0hV8YMqUr2qzMtERufP0g?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 09:10:03.7512 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e70fa6bb-7ffa-4443-7b82-08dcd954037a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9140
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c           | 15 ++++++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h           |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c           |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c           |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c           |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c           |  2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c         |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c          |  2 +-
 13 files changed, 25 insertions(+), 16 deletions(-)

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
index 690676cab022..7f852029d6e1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2357,10 +2357,21 @@ amdgpu_vm_get_task_info_pasid(struct amdgpu_device *adev, u32 pasid)
 
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
 
+	strscpy(vm->task_info->process_desc, process_name, desc_len + 1);
+
 	kref_init(&vm->task_info->refcount);
 	return 0;
 }
@@ -2375,8 +2386,6 @@ void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
 	if (!vm->task_info) {
 		if (amdgpu_vm_create_task_info(vm))
 			return;
-
-		get_task_comm(vm->task_info->process_name, current->group_leader);
 	}
 
 	if (vm->task_info->pid == current->pid)
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

