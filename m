Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 311FA39C44B
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jun 2021 02:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C95B66E436;
	Sat,  5 Jun 2021 00:20:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01D216E436;
 Sat,  5 Jun 2021 00:20:58 +0000 (UTC)
IronPort-SDR: /E8YdxfUS6UW9yP8VP3Nk7oh68+N2mZ9olJtjV5y7AXvT6sqFBHKVtJcLGJlyty2pBDzIHvy5z
 i8n296vFaDNg==
X-IronPort-AV: E=McAfee;i="6200,9189,10005"; a="204369565"
X-IronPort-AV: E=Sophos;i="5.83,249,1616482800"; d="scan'208";a="204369565"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2021 17:20:58 -0700
IronPort-SDR: CtqDjBcYidukEhlgPPtYwvyv3qllyOrBvMVR6VKC0Fb40ObDiAWBrY8WRvlTyJDUln9KbBhm2U
 3Ic1T8gwaNkg==
X-IronPort-AV: E=Sophos;i="5.83,249,1616482800"; d="scan'208";a="446862419"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2021 17:20:58 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] dma-buf: fix build due to missing export
Date: Fri,  4 Jun 2021 17:20:07 -0700
Message-Id: <20210605002007.4153933-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 0c6b522abc2a ("dma-buf: cleanup dma-resv shared fence debugging a bit v2")
turned dma_resv_reset_shared_max() into a function when
CONFIG_DEBUG_MUTEXES is set, but forgot to export it. That resulted in a
broken build:

	ERROR: modpost: "dma_resv_reset_shared_max" [drivers/gpu/drm/vgem/vgem.ko] undefined!
	ERROR: modpost: "dma_resv_reset_shared_max" [drivers/gpu/drm/i915/i915.ko] undefined!
	ERROR: modpost: "dma_resv_reset_shared_max" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
	ERROR: modpost: "dma_resv_reset_shared_max" [drivers/gpu/drm/ttm/ttm.ko] undefined!
	ERROR: modpost: "dma_resv_reset_shared_max" [drivers/gpu/drm/drm.ko] undefined!
	ERROR: modpost: "dma_resv_reset_shared_max" [drivers/gpu/drm/drm_vram_helper.ko] undefined!
	make[1]: *** [scripts/Makefile.modpost:150: modules-only.symvers] Error 1

Fixes: 0c6b522abc2a ("dma-buf: cleanup dma-resv shared fence debugging a bit v2")
Cc: Christian König <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/dma-buf/dma-resv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 3964df438505..6132ba631991 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -226,6 +226,7 @@ void dma_resv_reset_shared_max(struct dma_resv *obj)
 		fence->shared_max = fence->shared_count;
 	}
 }
+EXPORT_SYMBOL(dma_resv_reset_shared_max);
 #endif
 
 /**
-- 
2.31.1

