Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2596ADCBF4
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 14:50:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4443510E631;
	Tue, 17 Jun 2025 12:50:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="g5CUUded";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D4010E64E;
 Tue, 17 Jun 2025 12:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=igjcypcHRqWMBVYlF2JqC//zq6/A67FBmSApQUqFsk4=; b=g5CUUdedEF8I7mHpFMz8lqsCST
 tSZfSfw+EM4MD/+JoEmBpSsZz9dRH/THE5DgK9tWVGg+Ty06rtengEl15c+s/SLe2Eq95lcga2Pzt
 IuBA7GMaP6nEziquzTTgcn7+RBmqjIENlU1gXVwNiKXi3JZ2Z+vch4DJ6qMIpzeLEJR5qAzzvRfMP
 P4zmnWtUw9dUs/fC0hlp/vsX77vqqidoqT27mnkWzkudWJTQmg5nV82BWihwknOHxskTeQVQWCamt
 KnyJwmRmx7X0/yQC255zOD5Q1D3rCNrZYBiWnOVD2VrCt42/eULCmKn08B4ZJpF2LjdqHQQaNEeHd
 mU/lp8SA==;
Received: from [191.204.192.64] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uRVlc-004ans-JW; Tue, 17 Jun 2025 14:50:20 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: "Alex Deucher" <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 siqueira@igalia.com, airlied@gmail.com, simona@ffwll.ch,
 "Raag Jadav" <raag.jadav@intel.com>, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, Xaver Hugl <xaver.hugl@gmail.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v9 5/6] drm: amdgpu: Use struct drm_wedge_task_info inside of
 struct amdgpu_task_info
Date: Tue, 17 Jun 2025 09:49:48 -0300
Message-ID: <20250617124949.2151549-6-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617124949.2151549-1-andrealmeid@igalia.com>
References: <20250617124949.2151549-1-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

To avoid a cast when calling drm_dev_wedged_event(), replace pid and
task name inside of struct amdgpu_task_info with struct
drm_wedge_task_info.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
v7: New patch
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c      |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c          |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c           | 12 ++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h           |  3 +--
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c           |  2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c         |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c          |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c      |  8 ++++----
 9 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index 8e626f50b362..dac4b926e7be 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -1786,7 +1786,7 @@ static int amdgpu_debugfs_vm_info_show(struct seq_file *m, void *unused)
 
 		ti = amdgpu_vm_get_task_info_vm(vm);
 		if (ti) {
-			seq_printf(m, "pid:%d\tProcess:%s ----------\n", ti->pid, ti->process_name);
+			seq_printf(m, "pid:%d\tProcess:%s ----------\n", ti->task.pid, ti->process_name);
 			amdgpu_vm_put_task_info(ti);
 		}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
index 7b50741dc097..8a026bc9ea44 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
@@ -220,10 +220,10 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
 	drm_printf(&p, "time: %lld.%09ld\n", coredump->reset_time.tv_sec,
 		   coredump->reset_time.tv_nsec);
 
-	if (coredump->reset_task_info.pid)
+	if (coredump->reset_task_info.task.pid)
 		drm_printf(&p, "process_name: %s PID: %d\n",
 			   coredump->reset_task_info.process_name,
-			   coredump->reset_task_info.pid);
+			   coredump->reset_task_info.task.pid);
 
 	/* SOC Information */
 	drm_printf(&p, "\nSOC Information\n");
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 0ecc88df7208..e5e33a68d935 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -329,7 +329,7 @@ static int amdgpu_gem_object_open(struct drm_gem_object *obj,
 
 			dev_warn(adev->dev, "validate_and_fence failed: %d\n", r);
 			if (ti) {
-				dev_warn(adev->dev, "pid %d\n", ti->pid);
+				dev_warn(adev->dev, "pid %d\n", ti->task.pid);
 				amdgpu_vm_put_task_info(ti);
 			}
 		}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 3bf63eee2d4e..0ff95a56c2ce 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -622,7 +622,7 @@ int amdgpu_vm_validate(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 
 			pr_warn_ratelimited("Evicted user BO is not reserved\n");
 			if (ti) {
-				pr_warn_ratelimited("pid %d\n", ti->pid);
+				pr_warn_ratelimited("pid %d\n", ti->task.pid);
 				amdgpu_vm_put_task_info(ti);
 			}
 
@@ -2508,11 +2508,11 @@ void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
 	if (!vm->task_info)
 		return;
 
-	if (vm->task_info->pid == current->pid)
+	if (vm->task_info->task.pid == current->pid)
 		return;
 
-	vm->task_info->pid = current->pid;
-	get_task_comm(vm->task_info->task_name, current);
+	vm->task_info->task.pid = current->pid;
+	get_task_comm(vm->task_info->task.comm, current);
 
 	if (current->group_leader->mm != current->mm)
 		return;
@@ -2775,7 +2775,7 @@ void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm)
 
 		dev_warn(adev->dev,
 			 "VM memory stats for proc %s(%d) task %s(%d) is non-zero when fini\n",
-			 ti->process_name, ti->pid, ti->task_name, ti->tgid);
+			 ti->process_name, ti->task.pid, ti->task.comm, ti->tgid);
 	}
 
 	amdgpu_vm_put_task_info(vm->task_info);
@@ -3164,5 +3164,5 @@ void amdgpu_vm_print_task_info(struct amdgpu_device *adev,
 	dev_err(adev->dev,
 		" Process %s pid %d thread %s pid %d\n",
 		task_info->process_name, task_info->tgid,
-		task_info->task_name, task_info->pid);
+		task_info->task.comm, task_info->task.pid);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index 9ec5d94200aa..fd086efd8457 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -236,9 +236,8 @@ struct amdgpu_vm_pte_funcs {
 };
 
 struct amdgpu_task_info {
+	struct drm_wedge_task_info task;
 	char		process_name[TASK_COMM_LEN];
-	char		task_name[TASK_COMM_LEN];
-	pid_t		pid;
 	pid_t		tgid;
 	struct kref	refcount;
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
index 33ed2b158fcd..f38004e6064e 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
@@ -2187,7 +2187,7 @@ static int sdma_v4_0_print_iv_entry(struct amdgpu_device *adev,
 		dev_dbg_ratelimited(adev->dev,
 				    " for process %s pid %d thread %s pid %d\n",
 				    task_info->process_name, task_info->tgid,
-				    task_info->task_name, task_info->pid);
+				    task_info->task.comm, task_info->task.pid);
 		amdgpu_vm_put_task_info(task_info);
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
index 9c169112a5e7..bcde34e4e0a1 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
@@ -1884,7 +1884,7 @@ static int sdma_v4_4_2_print_iv_entry(struct amdgpu_device *adev,
 	if (task_info) {
 		dev_dbg_ratelimited(adev->dev, " for process %s pid %d thread %s pid %d\n",
 				    task_info->process_name, task_info->tgid,
-				    task_info->task_name, task_info->pid);
+				    task_info->task.comm, task_info->task.pid);
 		amdgpu_vm_put_task_info(task_info);
 	}
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
index 2b294ada3ec0..82905f3e54dd 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_events.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
@@ -1302,7 +1302,7 @@ void kfd_signal_reset_event(struct kfd_node *dev)
 			if (ti) {
 				dev_err(dev->adev->dev,
 					"Queues reset on process %s tid %d thread %s pid %d\n",
-					ti->process_name, ti->tgid, ti->task_name, ti->pid);
+					ti->process_name, ti->tgid, ti->task.comm, ti->task.pid);
 				amdgpu_vm_put_task_info(ti);
 			}
 		}
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
index 83d9384ac815..a499449fcb06 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
@@ -253,9 +253,9 @@ void kfd_smi_event_update_vmfault(struct kfd_node *dev, uint16_t pasid)
 	task_info = amdgpu_vm_get_task_info_pasid(dev->adev, pasid);
 	if (task_info) {
 		/* Report VM faults from user applications, not retry from kernel */
-		if (task_info->pid)
+		if (task_info->task.pid)
 			kfd_smi_event_add(0, dev, KFD_SMI_EVENT_VMFAULT, KFD_EVENT_FMT_VMFAULT(
-					  task_info->pid, task_info->task_name));
+					  task_info->task.pid, task_info->task.comm));
 		amdgpu_vm_put_task_info(task_info);
 	}
 }
@@ -359,8 +359,8 @@ void kfd_smi_event_process(struct kfd_process_device *pdd, bool start)
 		kfd_smi_event_add(0, pdd->dev,
 				  start ? KFD_SMI_EVENT_PROCESS_START :
 				  KFD_SMI_EVENT_PROCESS_END,
-				  KFD_EVENT_FMT_PROCESS(task_info->pid,
-				  task_info->task_name));
+				  KFD_EVENT_FMT_PROCESS(task_info->task.pid,
+				  task_info->task.comm));
 		amdgpu_vm_put_task_info(task_info);
 	}
 }
-- 
2.49.0

