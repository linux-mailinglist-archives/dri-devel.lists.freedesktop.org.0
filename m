Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4363FD131
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 04:21:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D786E040;
	Wed,  1 Sep 2021 02:20:54 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B02AA6E040;
 Wed,  1 Sep 2021 02:20:53 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10093"; a="218324970"
X-IronPort-AV: E=Sophos;i="5.84,368,1620716400"; d="scan'208";a="218324970"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 19:20:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,368,1620716400"; d="scan'208";a="519983664"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by fmsmga004.fm.intel.com with ESMTP; 31 Aug 2021 19:20:44 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Cc: DRI-Devel@Lists.FreeDesktop.Org,
	Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 6/7] Me: Workaround LMEM blow up
Date: Tue, 31 Aug 2021 19:20:42 -0700
Message-Id: <20210901022043.2395135-7-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210901022043.2395135-1-John.C.Harrison@Intel.com>
References: <20210901022043.2395135-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: Matthew Brost <matthew.brost@intel.com>

---
 drivers/gpu/drm/i915/i915_gpu_error.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index b9f66dbd46bb..a61e23deeb00 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1068,7 +1068,7 @@ i915_vma_coredump_create(const struct intel_gt *gt,
 			if (ret)
 				break;
 		}
-	} else if (__i915_gem_object_is_lmem(vma->obj)) {
+	} else if (i915_gem_object_is_lmem(vma->obj)) {
 		struct intel_memory_region *mem = vma->obj->mm.region;
 		dma_addr_t dma;
 
-- 
2.25.1

