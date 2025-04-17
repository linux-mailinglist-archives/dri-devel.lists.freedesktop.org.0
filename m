Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABD9A91C45
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 14:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43BFC10EAEC;
	Thu, 17 Apr 2025 12:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DCFA10EAEA;
 Thu, 17 Apr 2025 12:32:27 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 53HCW4BC4002386; Thu, 17 Apr 2025 18:02:04 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 53HCW4QV4002385;
 Thu, 17 Apr 2025 18:02:04 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH V6 3/5] drm/amdgpu: use drm_file_err in fence timeouts
Date: Thu, 17 Apr 2025 18:01:53 +0530
Message-Id: <20250417123155.4002358-3-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417123155.4002358-1-sunil.khatri@amd.com>
References: <20250417123155.4002358-1-sunil.khatri@amd.com>
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
[   42.444297] [drm:amdgpu_userqueue_wait_for_signal [amdgpu]] *ERROR* Timed out waiting for fence f=000000001c74d978 for comm:Xwayland pid:3427
[   42.444669] [drm:amdgpu_userqueue_suspend [amdgpu]] *ERROR* Not suspending userqueue, timeout waiting for comm:Xwayland pid:3427
[   42.824729] [drm:amdgpu_userqueue_wait_for_signal [amdgpu]] *ERROR* Timed out waiting for fence f=0000000074407d3e for comm:systemd-logind pid:1058
[   42.825082] [drm:amdgpu_userqueue_suspend [amdgpu]] *ERROR* Not suspending userqueue, timeout waiting for comm:systemd-logind pid:1058

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c | 21 ++++++++++++-------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
index cd9dc0018ee6..613a3a63301b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
@@ -43,8 +43,9 @@ amdgpu_userqueue_cleanup(struct amdgpu_userq_mgr *uq_mgr,
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
@@ -456,7 +457,8 @@ amdgpu_userqueue_resume_all(struct amdgpu_userq_mgr *uq_mgr)
 	}
 
 	if (ret)
-		DRM_ERROR("Failed to map all the queues\n");
+		drm_file_err(uq_mgr->file, "Failed to map all the queues\n");
+
 	return ret;
 }
 
@@ -614,7 +616,8 @@ amdgpu_userqueue_suspend_all(struct amdgpu_userq_mgr *uq_mgr)
 	}
 
 	if (ret)
-		DRM_ERROR("Couldn't unmap all the queues\n");
+		drm_file_err(uq_mgr->file, "Couldn't unmap all the queues\n");
+
 	return ret;
 }
 
@@ -631,8 +634,10 @@ amdgpu_userqueue_wait_for_signal(struct amdgpu_userq_mgr *uq_mgr)
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
@@ -651,13 +656,13 @@ amdgpu_userqueue_suspend(struct amdgpu_userq_mgr *uq_mgr,
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

