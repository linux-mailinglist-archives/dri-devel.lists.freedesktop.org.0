Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8334F975643
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 16:59:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4887910EA32;
	Wed, 11 Sep 2024 14:59:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ymftcDIf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2074.outbound.protection.outlook.com [40.107.102.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23E5E10EA32
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 14:59:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k9qJ31B0EGb+jd8rxK0ZWi2v/8uUnFi3l4JT+vd+nTpuNpL2nBZCDVK2taLekuxwr9U0o2Q+2gEv0UZT4YlH/KpUaMALP8awePcASPrW88/HNageqeufhUZaMPzMhe1pqlCNm8pb4RM0bHVjgIzVIankDz6NSpUQzbWvdUcNfymeGFv6/jN6kUJ/qagLrZJJyi3v98m0ZMOR8m3kAtUnuizXg8MB//JfxzyF6JWkFuFQ0pboCXO8wzukMqbYIXyr6Kcxj5FKkO72Mi8bUlg6IIs26fLTqovlYqdedBFum8abR+Vc0GzY+GzQAAwuivzuFZ5Gmj8GgIkfnmHtzK+97w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ewsw6na8f9cxlEXlEVzHmSU9eHvgnfjSaT+vmWgGc0=;
 b=g1khqTBn14he8JjuufWYkMz4+cKc0Bg022Rxyu1mJ53wBiQ2smII06fR+7kQhkocXTRINbdOoGD5/He5QUZJ7eZnwHaLyWGVTFE/zhVWlRXy1Q4sP6RbrL749xXY7gxUqIQUw1/10BWCJQZ3UivqlPefFUhfcm+s3HKgtQcw7zy5bRSedfY/1/GuURE2kQj+kA6LxlHlGZgiJcahe3Rov5vDR478qL6tvjoB3sjp3imJWe+UzyO5ESgeNf4qVQJOpScLXnMn61jzb9HDd1t0o5xyHUaywEgvqjO+hs542hkZoFiqCw8Uye3JgaAMtYTIhxq22D3dQUF3/peGx0iudA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ewsw6na8f9cxlEXlEVzHmSU9eHvgnfjSaT+vmWgGc0=;
 b=ymftcDIfwMtYNIkG+LSxE88ZczyCIueLKoHVrT0Te2fJyDfGIVOqecqNcBW4KnIbcKuRC39rqh0q+GZBPqZtXwjYxUuldXV4cqZdEXf9dc9g+4jPnJq4PRKrUzvFmPYWqdUaw6Wg/zc7E064Ieb1SsbeuR82g6XHSqcX+aYyTj0=
Received: from BN0PR08CA0029.namprd08.prod.outlook.com (2603:10b6:408:142::15)
 by DS0PR12MB6656.namprd12.prod.outlook.com (2603:10b6:8:d2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Wed, 11 Sep
 2024 14:59:04 +0000
Received: from MN1PEPF0000F0E2.namprd04.prod.outlook.com
 (2603:10b6:408:142:cafe::bd) by BN0PR08CA0029.outlook.office365.com
 (2603:10b6:408:142::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Wed, 11 Sep 2024 14:59:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E2.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 11 Sep 2024 14:59:04 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Sep
 2024 09:59:01 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <dri-devel@lists.freedesktop.org>, <christian.koenig@amd.com>,
 <tursulin@igalia.com>, <simona.vetter@ffwll.ch>, <robdclark@gmail.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH 3/3] drm/amdgpu: use drm_file name
Date: Wed, 11 Sep 2024 16:58:34 +0200
Message-ID: <20240911145836.734080-3-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240911145836.734080-1-pierre-eric.pelloux-prayer@amd.com>
References: <20240911145836.734080-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E2:EE_|DS0PR12MB6656:EE_
X-MS-Office365-Filtering-Correlation-Id: 55acc9f6-fb87-41ed-da93-08dcd2724739
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hhSN9VuqhnICVwhsiKSXZdNVFoMlK06xSRZ0khKb6EhswjUTElV6TlIlOeJB?=
 =?us-ascii?Q?B+fEBy93TfDvVeOfQvwDMHgwWDJi67zzdXaZoDBW7knqiKtNxS70tz3+e/6n?=
 =?us-ascii?Q?x+Bs8ln+SVBUjk/ZrghJ/c4SDWTU0popEnr7VOhca/3u0b+HDJn/zFwclBBf?=
 =?us-ascii?Q?+sPrLWcBxggUIy/tFf4fZwXCe9JxGqidCISbcMtNnlCac2OjUoFmIEYQ8nXv?=
 =?us-ascii?Q?MsOJuroXPv1FJ9MTc35WEdNrpICuV6PYihDHkabUlrzNDC2PQbKAcAroSgBJ?=
 =?us-ascii?Q?Zgyc8AV3pJwGBcNMJ1xXIn6QNRdnJr4tscp3QU0JQpK1uTdG2jsY2ti3a/HV?=
 =?us-ascii?Q?HifHR8DpalK6LFNuZFAY8SP9Mi39J4xzPaNmWEmEK5bge5Hp9Clszc3FQGk6?=
 =?us-ascii?Q?FrM/B6tV/rK9iqHNOMTogkwlfkrTCCah3pOdqdcPTBu/KWmVWR7maTI3wNrz?=
 =?us-ascii?Q?eJE8CpnObQP2qE6y/QHMY0vICsFYK7tJrKnjQJXSEivY9IEklX3pmoxhiUhr?=
 =?us-ascii?Q?djWiqV2ZVaIRk4N4GaMp+YkxnJ3ODwRV2jNIYFq5GIQSTaeehjBdlzAlWpOx?=
 =?us-ascii?Q?ZwK366Z8pM7KhPkPqtM91YOmQ7UDA4OwcaNzqOSCZhqIxkxjRGzyeSDNCqyo?=
 =?us-ascii?Q?NK7iIZNY6hZYC/c1/XN0mTwYrEvPV5Ya8uH8XVmUTY7USwC2j2CK8ECv4QGV?=
 =?us-ascii?Q?0fk5vozZtTuO3t6nRLgHhySa2OSJYQXu1cGU3k7WkNGWc2c6Cl2ZFDk1Vuro?=
 =?us-ascii?Q?iHbtvf0/jehKRhcrbSQeC2pV2FiqXaMlZpI+TX+6buML1cyGdwX8poTmHDLL?=
 =?us-ascii?Q?SJsQdcKTtRyKt//F3iCQAq1MXv0MxqjThf/8l4uSWRuqFotAhDf+P3MxW74j?=
 =?us-ascii?Q?NJT6zC1M73EAKe24rO8Jo+BCf5xcmuZiHfWPJ2o6ijDWk5BOeuiTjXcICtIa?=
 =?us-ascii?Q?DeeoB206fYjP7IN10zCGn3pEHuQ9PCnpda5YcCPIoI51dXljdcV139QkeNgh?=
 =?us-ascii?Q?UqX4ENM6kUI8z7AJYcvb7KqcgI2IpDqrki/OGUKo4b6xObvS1oAtm9IBvqds?=
 =?us-ascii?Q?z97C/gx9Rq+Ai/Hco5WDYERdb63lh5V8HNs2okuHTXe4DYL1ST56A2Isdvhr?=
 =?us-ascii?Q?wUXeYs0/s9mopudsHH8PyFvFeV9H0lDXKBE7mLIYso2b19Iq8yDIY5XQCbdl?=
 =?us-ascii?Q?ztaacpF1ALCbLSTXBFeIk5Zcr48m/N6ge9uR3sIi0Fw13RoZgg/VUUr9/Qya?=
 =?us-ascii?Q?qiVUlm6QFvY3Iz0CJstfb+8XwfCD6WB1DKpbHxsWz5iL4cXloOh2v0rMicBP?=
 =?us-ascii?Q?CJQyoXEu8mjXb+aqvHH9iqu1nN+eL3qvS4S3yFalZmYSy4xib7sdjw5mbwuh?=
 =?us-ascii?Q?LcXIMm/CEP5RBQIG0LIBi2bljSKhyiZIL2OXY1y5yVdv1O9rSWOBQvX0vQK9?=
 =?us-ascii?Q?XVFCEWAVz/n8vev08hAld1acxQRcJYj0?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 14:59:04.1908 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55acc9f6-fb87-41ed-da93-08dcd2724739
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6656
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

In debugfs gem_info/vm_info files, timeout handler and page fault reports.

This information is useful with the virtio/native-context driver: this
allows the guest applications identifier to visible in amdgpu's output.

The output in amdgpu_vm_info/amdgpu_gem_info looks like this:
   pid:12255	Process:glxgears/test-set-fd-name ----------

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       | 11 ++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        | 20 +++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |  4 ++--
 5 files changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 6d5fd371d5ce..1712feb2c238 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1577,7 +1577,7 @@ int amdgpu_amdkfd_gpuvm_acquire_process_vm(struct amdgpu_device *adev,
 	if (ret)
 		return ret;
 
-	amdgpu_vm_set_task_info(avm);
+	amdgpu_vm_set_task_info(avm, NULL);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 1e475eb01417..d32dc547cc80 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -310,7 +310,7 @@ static int amdgpu_cs_pass1(struct amdgpu_cs_parser *p,
 	kvfree(chunk_array);
 
 	/* Use this opportunity to fill in task info for the vm */
-	amdgpu_vm_set_task_info(vm);
+	amdgpu_vm_set_task_info(vm, p->filp);
 
 	return 0;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 0e617dff8765..0e0d49060ca8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -1012,8 +1012,15 @@ static int amdgpu_debugfs_gem_info_show(struct seq_file *m, void *unused)
 		rcu_read_lock();
 		pid = rcu_dereference(file->pid);
 		task = pid_task(pid, PIDTYPE_TGID);
-		seq_printf(m, "pid %8d command %s:\n", pid_nr(pid),
-			   task ? task->comm : "<unknown>");
+		seq_printf(m, "pid %8d command %s", pid_nr(pid),
+				   task ? task->comm : "<unknown>");
+		if (file->name) {
+			mutex_lock(&file->name_lock);
+			seq_putc(m, '/');
+			seq_puts(m, file->name);
+			mutex_unlock(&file->name_lock);
+		}
+		seq_puts(m, ":\n");
 		rcu_read_unlock();
 
 		spin_lock(&file->table_lock);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index e20d19ae01b2..385211846ae3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2370,7 +2370,7 @@ static int amdgpu_vm_create_task_info(struct amdgpu_vm *vm)
  *
  * @vm: vm for which to set the info
  */
-void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
+void amdgpu_vm_set_task_info(struct amdgpu_vm *vm, struct drm_file *file)
 {
 	if (!vm->task_info)
 		return;
@@ -2385,7 +2385,23 @@ void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
 		return;
 
 	vm->task_info->tgid = current->group_leader->pid;
-	get_task_comm(vm->task_info->process_name, current->group_leader);
+	__get_task_comm(vm->task_info->process_name, TASK_COMM_LEN,
+			current->group_leader);
+	/* Append drm_client_name if set. */
+	if (file && file->name) {
+		int n;
+
+		mutex_lock(&file->name_lock);
+		n = strlen(vm->task_info->process_name);
+		if (n < NAME_MAX) {
+			if (file->name) {
+				vm->task_info->process_name[n] = '/';
+				strscpy_pad(&vm->task_info->process_name[n + 1],
+					    file->name, NAME_MAX - (n + 1));
+			}
+		}
+		mutex_unlock(&file->name_lock);
+	}
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index d12d66dca8e9..cabec384b4d4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -232,7 +232,7 @@ struct amdgpu_vm_pte_funcs {
 };
 
 struct amdgpu_task_info {
-	char		process_name[TASK_COMM_LEN];
+	char		process_name[NAME_MAX];
 	char		task_name[TASK_COMM_LEN];
 	pid_t		pid;
 	pid_t		tgid;
@@ -561,7 +561,7 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
 			    u32 vmid, u32 node_id, uint64_t addr, uint64_t ts,
 			    bool write_fault);
 
-void amdgpu_vm_set_task_info(struct amdgpu_vm *vm);
+void amdgpu_vm_set_task_info(struct amdgpu_vm *vm, struct drm_file *file);
 
 void amdgpu_vm_move_to_lru_tail(struct amdgpu_device *adev,
 				struct amdgpu_vm *vm);
-- 
2.40.1

