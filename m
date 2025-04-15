Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 875F9A89C33
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 13:26:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE1610E749;
	Tue, 15 Apr 2025 11:26:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F4C410E747;
 Tue, 15 Apr 2025 11:26:18 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 53FBPxUq297322; Tue, 15 Apr 2025 16:55:59 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 53FBPxvu297321;
 Tue, 15 Apr 2025 16:55:59 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v2 3/4] drm/amdgpu: update the error logging for more
 information
Date: Tue, 15 Apr 2025 16:55:49 +0530
Message-Id: <20250415112550.297292-3-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415112550.297292-1-sunil.khatri@amd.com>
References: <20250415112550.297292-1-sunil.khatri@amd.com>
MIME-Version: 1.0
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

add process and pid information in the userqueue error
logging to make it more useful in resolving the error
by logs.

Sample log:
[   42.444297] [drm:amdgpu_userqueue_wait_for_signal [amdgpu]] *ERROR* Timed out waiting for fence f=000000001c74d978 for comm:Xwayland pid:3427
[   42.444669] [drm:amdgpu_userqueue_suspend [amdgpu]] *ERROR* Not suspending userqueue, timeout waiting for comm:Xwayland pid:3427
[   42.824729] [drm:amdgpu_userqueue_wait_for_signal [amdgpu]] *ERROR* Timed out waiting for fence f=0000000074407d3e for comm:systemd-logind pid:1058
[   42.825082] [drm:amdgpu_userqueue_suspend [amdgpu]] *ERROR* Not suspending userqueue, timeout waiting for comm:systemd-logind pid:1058

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c | 47 +++++++++++++++----
 1 file changed, 39 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
index 1867520ba258..eb96c12e02e7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
@@ -38,12 +38,17 @@ amdgpu_userqueue_cleanup(struct amdgpu_userq_mgr *uq_mgr,
 	struct amdgpu_device *adev = uq_mgr->adev;
 	const struct amdgpu_userq_funcs *uq_funcs = adev->userq_funcs[queue->queue_type];
 	struct dma_fence *f = queue->last_fence;
+	struct drm_file *file;
+	char proc_log[50];
 	int ret;
 
 	if (f && !dma_fence_is_signaled(f)) {
 		ret = dma_fence_wait_timeout(f, true, msecs_to_jiffies(100));
 		if (ret <= 0) {
-			DRM_ERROR("Timed out waiting for fence f=%p\n", f);
+			file = uq_mgr->file;
+			drm_process_info(file, proc_log, sizeof(proc_log));
+			DRM_ERROR("Timed out waiting for fence f=%p for %s\n",
+				  f, proc_log);
 			return;
 		}
 	}
@@ -431,6 +436,8 @@ amdgpu_userqueue_resume_all(struct amdgpu_userq_mgr *uq_mgr)
 	const struct amdgpu_userq_funcs *userq_funcs;
 	struct amdgpu_usermode_queue *queue;
 	int queue_id;
+	struct drm_file *file;
+	char proc_log[50];
 	int ret = 0;
 
 	/* Resume all the queues for this process */
@@ -439,8 +446,13 @@ amdgpu_userqueue_resume_all(struct amdgpu_userq_mgr *uq_mgr)
 		ret |= userq_funcs->map(uq_mgr, queue);
 	}
 
-	if (ret)
-		DRM_ERROR("Failed to map all the queues\n");
+	if (ret) {
+		file = uq_mgr->file;
+		drm_process_info(file, proc_log, sizeof(proc_log));
+		DRM_ERROR("Failed to map all the queue for %s\n",
+			  proc_log);
+		}
+
 	return ret;
 }
 
@@ -589,6 +601,8 @@ amdgpu_userqueue_suspend_all(struct amdgpu_userq_mgr *uq_mgr)
 	const struct amdgpu_userq_funcs *userq_funcs;
 	struct amdgpu_usermode_queue *queue;
 	int queue_id;
+	struct drm_file *file;
+	char proc_log[50];
 	int ret = 0;
 
 	/* Try to unmap all the queues in this process ctx */
@@ -597,8 +611,13 @@ amdgpu_userqueue_suspend_all(struct amdgpu_userq_mgr *uq_mgr)
 		ret += userq_funcs->unmap(uq_mgr, queue);
 	}
 
-	if (ret)
-		DRM_ERROR("Couldn't unmap all the queues\n");
+	if (ret) {
+		file = uq_mgr->file;
+		drm_process_info(file, proc_log, sizeof(proc_log));
+		DRM_ERROR("Couldn't unmap all the queues for %s\n",
+			  proc_log);
+		}
+
 	return ret;
 }
 
@@ -606,6 +625,8 @@ static int
 amdgpu_userqueue_wait_for_signal(struct amdgpu_userq_mgr *uq_mgr)
 {
 	struct amdgpu_usermode_queue *queue;
+	struct drm_file *file;
+	char proc_log[50];
 	int queue_id, ret;
 
 	idr_for_each_entry(&uq_mgr->userq_idr, queue, queue_id) {
@@ -615,7 +636,10 @@ amdgpu_userqueue_wait_for_signal(struct amdgpu_userq_mgr *uq_mgr)
 			continue;
 		ret = dma_fence_wait_timeout(f, true, msecs_to_jiffies(100));
 		if (ret <= 0) {
-			DRM_ERROR("Timed out waiting for fence f=%p\n", f);
+			file = uq_mgr->file;
+			drm_process_info(file, proc_log, sizeof(proc_log));
+			DRM_ERROR("Timed out waiting for fence f=%p for %s\n",
+				  f, proc_log);
 			return -ETIMEDOUT;
 		}
 	}
@@ -628,19 +652,26 @@ amdgpu_userqueue_suspend(struct amdgpu_userq_mgr *uq_mgr,
 			 struct amdgpu_eviction_fence *ev_fence)
 {
 	int ret;
+	struct drm_file *file;
+	char proc_log[50];
 	struct amdgpu_fpriv *fpriv = uq_mgr_to_fpriv(uq_mgr);
 	struct amdgpu_eviction_fence_mgr *evf_mgr = &fpriv->evf_mgr;
 
 	/* Wait for any pending userqueue fence work to finish */
 	ret = amdgpu_userqueue_wait_for_signal(uq_mgr);
 	if (ret) {
-		DRM_ERROR("Not suspending userqueue, timeout waiting for work\n");
+		file = uq_mgr->file;
+		drm_process_info(file, proc_log, sizeof(proc_log));
+		DRM_ERROR("Not suspending userqueue, timeout waiting for %s\n",
+			  proc_log);
 		return;
 	}
 
 	ret = amdgpu_userqueue_suspend_all(uq_mgr);
 	if (ret) {
-		DRM_ERROR("Failed to evict userqueue\n");
+		file = uq_mgr->file;
+		drm_process_info(file, proc_log, sizeof(proc_log));
+		DRM_ERROR("Failed to evict userqueue for %s\n", proc_log);
 		return;
 	}
 
-- 
2.34.1

