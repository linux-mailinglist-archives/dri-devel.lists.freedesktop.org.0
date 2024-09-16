Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F4697A2FC
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 15:32:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F55A10E36B;
	Mon, 16 Sep 2024 13:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DWF4nGlh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2044.outbound.protection.outlook.com [40.107.95.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A9E10E36C
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 13:32:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HGlJib+7tKTcxwID4owc7QPSiE3Zw/4VBaUXqZ+0TdAl1v8qChF5tvRZzShq9Gx6Km6WNAP58CRKRj+BiWn3yfaceK+YgCqgCYSrOqzwxrXkwBCaK/LlyFJWiVoQ2ab69oh9yPRVGgRud2gjatoTf/Ob9GGOwgrwSkWE9D+jE09rFVX9uFZRjNoCmJEoUstXPhh/8nGc2WS5un2N17jbVWfKQC7U772tmhfGVwX4t7964j4WARwvb6d8ywcHNcVNS3RDw2Eor2rpIvaKOhoBZBcZEneVK4MkD0gy15WR9XjtiO/84QabGu7XsH6cOP5pc8bUmM1B+o0rgpF2ol4pWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U3bkblEfbxCTfGa+hLazBLN9IC5sG4y/zPKsY4CQH+4=;
 b=Ugh61GD9bJHgdEUGQjm7gExHcyFflSxmx3K7gqRne7HmA9OCsQyJo1pXqdx9Z2WoutMYE8H1H557f5RTNzZI2LYWjNwY/7DxPSOJbtACDGxlpjICZA79+cUZ0N7/eA9KfnzK8rmeClApYSo6sd8A8hdnaiAg9EHczSuySZ7gROGnYG8STeuwLf3cZ1aQXsc0WpC76HI3vWevckWnFYFy23EQhiEesPd0O8IS04nr7uvsgm7o9RIKrsp4YjGkMQzxIB25cs76Q488mv/u1qWtftA7QxtsDBbPGplG348GKVJcFAdkeIISYrBeMenfP3KPoa4QZY+p10cQcqZITgq7WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U3bkblEfbxCTfGa+hLazBLN9IC5sG4y/zPKsY4CQH+4=;
 b=DWF4nGlhfToB7jxXZ2Cvj/kQwM6chD73t/VFWW2R1hH+hxFlW7gwm6ZKvE98LUoQcPeF9B0DCKVffu18su7pCJoUtl9UXgISEQkrgESGDOqrQZLPMSYxjBBSwkhDrysWR9riSaj5fvbAbhHgT71M4ECr8QR3+pq5lbVrnDcHetg=
Received: from BN9PR03CA0983.namprd03.prod.outlook.com (2603:10b6:408:109::28)
 by PH0PR12MB8822.namprd12.prod.outlook.com (2603:10b6:510:28d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Mon, 16 Sep
 2024 13:32:46 +0000
Received: from BL6PEPF0001AB72.namprd02.prod.outlook.com
 (2603:10b6:408:109:cafe::e4) by BN9PR03CA0983.outlook.office365.com
 (2603:10b6:408:109::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Mon, 16 Sep 2024 13:32:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB72.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Mon, 16 Sep 2024 13:32:46 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Sep
 2024 08:32:44 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <dri-devel@lists.freedesktop.org>, <christian.koenig@amd.com>,
 <tursulin@igalia.com>, <simona.vetter@ffwll.ch>, <robdclark@gmail.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v2 3/3] drm/amdgpu: use drm_file name
Date: Mon, 16 Sep 2024 15:32:20 +0200
Message-ID: <20240916133223.1023773-3-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240916133223.1023773-1-pierre-eric.pelloux-prayer@amd.com>
References: <20240916133223.1023773-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB72:EE_|PH0PR12MB8822:EE_
X-MS-Office365-Filtering-Correlation-Id: 7195c9e2-3a43-4e7a-6652-08dcd6540cee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qXjIg51vU9Oo3OMJkmXU7SIGMu0B3UkZcBLeJyFDoq9jvdqGOfehAdK03yv+?=
 =?us-ascii?Q?DY8yGnGd3VBfXxZwbwU+d0bwtWvHR6Vu1ehu9ABJrkb1LlCA87pD8jmDaudI?=
 =?us-ascii?Q?kw0eNVT9txZQj10xM5Qfmp1xLlo20VGkZkk4bm1toMAwnYDKvUMO5S7uw5zQ?=
 =?us-ascii?Q?ybWSj1JuVWe2Cjs+pFJ9b0LB9OIhj5AArWDR+l/yx9g7zFahIORm5qMlBGWE?=
 =?us-ascii?Q?i5pzTzym/sEs1lRuTKEijOj/3Vy2u4mZjQpnlSHnqfJ9SWW0AG50ptJpf/Lc?=
 =?us-ascii?Q?PoLz4TazLmStcqx3iLrP7LBjzlVjeZ6fB2YJTKuDChXEnQCiKwKWti5YLxy4?=
 =?us-ascii?Q?i7IOf4+xp6xRdpS1ps6WLLWGr5VsnZndooYW8chaNOvgcjOgl8p8URPYX+oJ?=
 =?us-ascii?Q?6iS5qxuKmKRf0JGVuC6kiP1s0kjQlKMIrl0mI8dgD8ZjmaJS2j/lgjvr9B0T?=
 =?us-ascii?Q?LWx8uaL0Qb2mVw/bnm3bBKmLgUGVx5A0OBjILG81/L5sgAPLT3DM+1LAsoMb?=
 =?us-ascii?Q?glkpqRW0fPQlKJMp1K3CDHRMfJQMbZmJXdKb7REqsGPjLeUsdFHCK316yWzS?=
 =?us-ascii?Q?mgZBCNKrFx9GASP8sEUPOZwK/dekeEN2PDOyWT6YiV+9DslSjw1C3XyOxmdT?=
 =?us-ascii?Q?Ve1B8k+c0WgIIolfGtME4DMg7NMx3r7gM4SW9fbO8C0mSFqa64dLhmYTWEbR?=
 =?us-ascii?Q?yzeO2+Xej3S2i4beHh7+L9iZDEcNuk/lw9CYT8lb20ro0J7PVt+wPZYkvXz+?=
 =?us-ascii?Q?xTTGbbSKxqgQax4qMUQoFZVKTaKdmzi0TGeVuJ2UVyIBPVNgri8HzabHhyQR?=
 =?us-ascii?Q?iHPuFvMFT70FJjyJTrGm674F+pZpVVGhf+rFnCnq0q6Xcl+EaGMgrtlRdehx?=
 =?us-ascii?Q?JlBmpRDZU9LOBpMRN/JgJUuRcHmcQd67lVt/P3G4Uzyi1WC3YgBA9+zjCKoZ?=
 =?us-ascii?Q?z3m+7XVvcou9os0kZQBhUG5HLhC+zCj7Cd1ulLjXhsgNNAdLs8Vb6gV9//C7?=
 =?us-ascii?Q?yrPv9EDKL+uk0NvBUfokdqLEe4Ppgd36CtaIIoFzJZHrVVwBJXQCP8Go/Y2B?=
 =?us-ascii?Q?K6fi5mEGlxFiSZnPmkkgo2EniBkPfm0g2Gzuf+aPS2xybezh/Bo5uZZ+BofZ?=
 =?us-ascii?Q?WUXLuKbIvMQC8yA82mkpWwXPMGXnTtbJEFIpy4w2EJM9H/JDdzFBdKxo2fTA?=
 =?us-ascii?Q?3XJU2voAEIv72khfbZNhldGW9eFbhat0GoK0ZWDm6H4Wj+4/oS3P5e6dmzEW?=
 =?us-ascii?Q?jF9kCHApnooRFE+na+GzBX9uaLHcxunQhRsyPd0HXf46LF1bp8NbPHEFDlcB?=
 =?us-ascii?Q?4eNON4voiiwAkrTEIg+QeVDm3GwBnHfu4W8++DjjXVpzPh5u4kDEIIHI16BD?=
 =?us-ascii?Q?bB19FIemKE2IMV92kWp8aJ6WV3nR2FXWuP3jq7jK5sYqzSbTvLAIsDN4DRWi?=
 =?us-ascii?Q?zGoqGdHrtlhqOjFTTc1CaDeOYROqceEa?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 13:32:46.1690 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7195c9e2-3a43-4e7a-6652-08dcd6540cee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB72.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8822
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       | 16 +++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        | 25 +++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |  4 +--
 5 files changed, 40 insertions(+), 9 deletions(-)

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
index 0e617dff8765..0c52168edbaf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -997,6 +997,10 @@ static int amdgpu_debugfs_gem_info_show(struct seq_file *m, void *unused)
 	if (r)
 		return r;
 
+	r = mutex_lock_interruptible(&file->name_lock);
+	if (r)
+		goto out;
+
 	list_for_each_entry(file, &dev->filelist, lhead) {
 		struct task_struct *task;
 		struct drm_gem_object *gobj;
@@ -1012,8 +1016,13 @@ static int amdgpu_debugfs_gem_info_show(struct seq_file *m, void *unused)
 		rcu_read_lock();
 		pid = rcu_dereference(file->pid);
 		task = pid_task(pid, PIDTYPE_TGID);
-		seq_printf(m, "pid %8d command %s:\n", pid_nr(pid),
-			   task ? task->comm : "<unknown>");
+		seq_printf(m, "pid %8d command %s", pid_nr(pid),
+				   task ? task->comm : "<unknown>");
+		if (file->name) {
+			seq_putc(m, '/');
+			seq_puts(m, file->name);
+		}
+		seq_puts(m, ":\n");
 		rcu_read_unlock();
 
 		spin_lock(&file->table_lock);
@@ -1024,7 +1033,8 @@ static int amdgpu_debugfs_gem_info_show(struct seq_file *m, void *unused)
 		}
 		spin_unlock(&file->table_lock);
 	}
-
+	mutex_unlock(&file->name_lock);
+out:
 	mutex_unlock(&dev->filelist_mutex);
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index e20d19ae01b2..5701d74159d4 100644
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
@@ -2385,7 +2385,28 @@ void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
 		return;
 
 	vm->task_info->tgid = current->group_leader->pid;
-	get_task_comm(vm->task_info->process_name, current->group_leader);
+	__get_task_comm(vm->task_info->process_name, TASK_COMM_LEN,
+			current->group_leader);
+	/* Append drm_client_name if set. */
+	if (file && file->name) {
+		mutex_lock(&file->name_lock);
+
+		/* Assert that process_name is big enough to store process_name,
+		 * so: (TASK_COMM_LEN - 1) + '/' + '\0'.
+		 * This way we can concat file->name without worrying about space.
+		 */
+		static_assert(sizeof(vm->task_info->process_name) >= TASK_COMM_LEN + 1);
+		if (file->name) {
+			int n;
+
+			n = strlen(vm->task_info->process_name);
+			vm->task_info->process_name[n] = '/';
+			strscpy_pad(&vm->task_info->process_name[n + 1],
+				    file->name,
+				    sizeof(vm->task_info->process_name) - (n + 1));
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

