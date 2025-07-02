Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D821EAF6632
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 01:26:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE1DE10E7AA;
	Wed,  2 Jul 2025 23:26:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ll0o+hbT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6AC810E7AA
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 23:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751498813; x=1783034813;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aRRSL/imw7Rqt/ig4YNA+hzWEjR1KBMhSSU7JEU1Ae8=;
 b=ll0o+hbTn3I8/yYIu/nBt1YrgPeX4v8w/emgFE2p8Y8uPn1b80OElTra
 lmFLdUexCyWfvJk0SDWZfgobj543jrJa5aLGmN9HCWcqyDVc/+TqTKygt
 8g0rw2BQyqQ3t+GeQpYdm2aVn068El7RLIh/pHPiOVil8ndX0jyMUYcuF
 gSouBW7PEAKEiPGEiwwVcREtu4GuE7uBRS2eghEaqAK8oVZtH1d5MqZV1
 wEy3XhwOGbRrp7rqmnBOStbqRMH2VooAcwTfn2p7SdDuDBfbBO780VVHk
 73FeDq6TImQ+JSxHaYmNtCTjNOxjaKK+5rl8S98wSQXpoSKJYLHHWMXbM w==;
X-CSE-ConnectionGUID: wwnI6ASKT3S/iUNBucXjJw==
X-CSE-MsgGUID: jywkFLp5Rde2gaFNmMPohQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="52929107"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="52929107"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 16:26:52 -0700
X-CSE-ConnectionGUID: Teuee/nERd+5E2UDOPymjQ==
X-CSE-MsgGUID: yvrD+xmAS8O1E0Tp72EmNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="154350825"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 16:26:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com
Subject: [PATCH 1/1] drm: Simplify drmm_alloc_ordered_workqueue return
Date: Wed,  2 Jul 2025 16:28:31 -0700
Message-Id: <20250702232831.3271328-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250702232831.3271328-1-matthew.brost@intel.com>
References: <20250702232831.3271328-1-matthew.brost@intel.com>
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

Rather than returning ERR_PTR or NULL on failure, replace the NULL
return with ERR_PTR(-ENOMEM). This simplifies error handling at the
caller. While here, add kernel documentation for
drmm_alloc_ordered_workqueue.

Cc: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/vkms/vkms_crtc.c |  2 --
 include/drm/drm_managed.h        | 15 +++++++++++++--
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 8c9898b9055d..e60573e0f3e9 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -302,8 +302,6 @@ struct vkms_output *vkms_crtc_init(struct drm_device *dev, struct drm_plane *pri
 	vkms_out->composer_workq = drmm_alloc_ordered_workqueue(dev, "vkms_composer", 0);
 	if (IS_ERR(vkms_out->composer_workq))
 		return ERR_CAST(vkms_out->composer_workq);
-	if (!vkms_out->composer_workq)
-		return ERR_PTR(-ENOMEM);
 
 	return vkms_out;
 }
diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
index 53017cc609ac..72bfac002c06 100644
--- a/include/drm/drm_managed.h
+++ b/include/drm/drm_managed.h
@@ -129,14 +129,25 @@ void __drmm_mutex_release(struct drm_device *dev, void *res);
 
 void __drmm_workqueue_release(struct drm_device *device, void *wq);
 
+/**
+ * drmm_alloc_ordered_workqueue - &drm_device managed alloc_ordered_workqueue()
+ * @dev: DRM device
+ * @fmt: printf format for the name of the workqueue
+ * @flags: WQ_* flags (only WQ_FREEZABLE and WQ_MEM_RECLAIM are meaningful)
+ * @args: args for @fmt
+ *
+ * This is a &drm_device-managed version of alloc_ordered_workqueue(). The
+ * allocated workqueue is automatically destroyed on the final drm_dev_put().
+ *
+ * Returns: workqueue on success, negative ERR_PTR otherwise.
+ */
 #define drmm_alloc_ordered_workqueue(dev, fmt, flags, args...)					\
 	({											\
 		struct workqueue_struct *wq = alloc_ordered_workqueue(fmt, flags, ##args);	\
 		wq ? ({										\
 			int ret = drmm_add_action_or_reset(dev, __drmm_workqueue_release, wq);	\
 			ret ? ERR_PTR(ret) : wq;						\
-		}) :										\
-			wq;									\
+		}) : ERR_PTR(-ENOMEM);								\
 	})
 
 #endif
-- 
2.34.1

