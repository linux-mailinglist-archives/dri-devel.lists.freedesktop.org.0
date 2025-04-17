Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AD8A9225C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 18:11:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A2110EB6D;
	Thu, 17 Apr 2025 16:11:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7019910EB68;
 Thu, 17 Apr 2025 16:11:12 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 53HGAn1J121009; Thu, 17 Apr 2025 21:40:49 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 53HGAnYk121008;
 Thu, 17 Apr 2025 21:40:49 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH V8 3/5] drm/amdgpu: use drm_file_err in fence timeouts
Date: Thu, 17 Apr 2025 21:40:40 +0530
Message-Id: <20250417161042.120981-3-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417161042.120981-1-sunil.khatri@amd.com>
References: <20250417161042.120981-1-sunil.khatri@amd.com>
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

use drm_file_err instead of DRM_ERROR which adds
process and pid information in the userqueue error
logging.

Sample log:

[   19.802315] amdgpu 0000:0a:00.0: [drm] *ERROR* comm: ibus-x11 pid: 2055 client: Unset ... Couldn't unmap all the queues
[   19.802319] amdgpu 0000:0a:00.0: [drm] *ERROR* comm: ibus-x11 pid: 2055 client: Unset ... Failed to evict userqueue
[   19.838432] amdgpu 0000:0a:00.0: [drm] *ERROR* comm: systemd-logind pid: 1042 client: Unset ... Couldn't unmap all the queues
[   19.838436] amdgpu 0000:0a:00.0: [drm] *ERROR* comm: systemd-logind pid: 1042 client: Unset ... Failed to evict userqueue

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c | 21 ++++++++++++-------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
index 5f87cc8b5bf4..e3290d137017 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
@@ -44,8 +44,9 @@ amdgpu_userqueue_cleanup(struct amdgpu_userq_mgr *uq_mgr,
 	if (f && !dma_fence_is_signaled(f)) {
 		ret = dma_fence_wait_timeout(f, true, msecs_to_jiffies(100));
 		if (ret <= 0) {
-			DRM_ERROR("Timed out waiting for fence=%llu:%llu\n",
-				  f->context, f->seqno);
+			drm_file_err(uq_mgr->file,
+				     "Timed out waiting for fence: context=%llu seqno:%llu\n",
+				     f->context, f->seqno);
 			return;
 		}
 	}
@@ -480,7 +481,8 @@ amdgpu_userqueue_resume_all(struct amdgpu_userq_mgr *uq_mgr)
 	}
 
 	if (ret)
-		DRM_ERROR("Failed to map all the queues\n");
+		drm_file_err(uq_mgr->file, "Failed to map all the queues\n");
+
 	return ret;
 }
 
@@ -638,7 +640,8 @@ amdgpu_userqueue_suspend_all(struct amdgpu_userq_mgr *uq_mgr)
 	}
 
 	if (ret)
-		DRM_ERROR("Couldn't unmap all the queues\n");
+		drm_file_err(uq_mgr->file, "Couldn't unmap all the queues\n");
+
 	return ret;
 }
 
@@ -655,8 +658,10 @@ amdgpu_userqueue_wait_for_signal(struct amdgpu_userq_mgr *uq_mgr)
 			continue;
 		ret = dma_fence_wait_timeout(f, true, msecs_to_jiffies(100));
 		if (ret <= 0) {
-			DRM_ERROR("Timed out waiting for fence=%llu:%llu\n",
-				  f->context, f->seqno);
+			drm_file_err(uq_mgr->file,
+				     "Timed out waiting for fence: context=%llu seqno:%llu\n",
+				     f->context, f->seqno);
+
 			return -ETIMEDOUT;
 		}
 	}
@@ -675,13 +680,13 @@ amdgpu_userqueue_suspend(struct amdgpu_userq_mgr *uq_mgr,
 	/* Wait for any pending userqueue fence work to finish */
 	ret = amdgpu_userqueue_wait_for_signal(uq_mgr);
 	if (ret) {
-		DRM_ERROR("Not suspending userqueue, timeout waiting for work\n");
+		drm_file_err(uq_mgr->file, "Not suspending userqueue, timeout waiting\n");
 		return;
 	}
 
 	ret = amdgpu_userqueue_suspend_all(uq_mgr);
 	if (ret) {
-		DRM_ERROR("Failed to evict userqueue\n");
+		drm_file_err(uq_mgr->file, "Failed to evict userqueue\n");
 		return;
 	}
 
-- 
2.34.1

