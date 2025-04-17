Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC2BA91C47
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 14:32:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C272210EAF1;
	Thu, 17 Apr 2025 12:32:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 263C610EAE4;
 Thu, 17 Apr 2025 12:32:27 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 53HCW4rx4002396; Thu, 17 Apr 2025 18:02:04 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 53HCW4mO4002395;
 Thu, 17 Apr 2025 18:02:04 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH V6 5/5] drm/amdgpu: change DRM_DBG_DRIVER to drm_dbg_driver
Date: Thu, 17 Apr 2025 18:01:55 +0530
Message-Id: <20250417123155.4002358-5-sunil.khatri@amd.com>
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

update the functions in amdgpu_userqueues.c from
DRM_DBG_DRIVER to drm_dbg_driver so multi gpu instance
can be logged in.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
index 4ef49179bbaf..4729425c04a5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
@@ -227,7 +227,8 @@ amdgpu_userqueue_get_doorbell_index(struct amdgpu_userq_mgr *uq_mgr,
 
 	index = amdgpu_doorbell_index_on_bar(uq_mgr->adev, db_obj->obj,
 					     db_info->doorbell_offset, db_size);
-	DRM_DEBUG_DRIVER("[Usermode queues] doorbell index=%lld\n", index);
+	drm_dbg_driver(adev_to_drm(uq_mgr->adev),
+		       "[Usermode queues] doorbell index=%lld\n", index);
 	amdgpu_bo_unreserve(db_obj->obj);
 	return index;
 
@@ -254,7 +255,7 @@ amdgpu_userqueue_destroy(struct drm_file *filp, int queue_id)
 
 	queue = amdgpu_userqueue_find(uq_mgr, queue_id);
 	if (!queue) {
-		DRM_DEBUG_DRIVER("Invalid queue id to destroy\n");
+		drm_dbg_driver(adev_to_drm(adev), "Invalid queue id to destroy\n");
 		mutex_unlock(&uq_mgr->userq_mutex);
 		return -EINVAL;
 	}
@@ -433,7 +434,8 @@ int amdgpu_userq_ioctl(struct drm_device *dev, void *data,
 		break;
 
 	default:
-		DRM_DEBUG_DRIVER("Invalid user queue op specified: %d\n", args->in.op);
+		drm_dbg_driver(dev, "Invalid user queue op specified: %d\n",
+			       args->in.op);
 		return -EINVAL;
 	}
 
-- 
2.34.1

