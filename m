Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFB43A9A76
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 14:30:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 095086E049;
	Wed, 16 Jun 2021 12:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C626E02D;
 Wed, 16 Jun 2021 12:30:01 +0000 (UTC)
IronPort-SDR: exRu7w6H9SGBtzLOOdBDwLDMCVn9sZaxD1TG5woUvTiol08XLkfd1CLScTL4LdrPxTm6mpdzDc
 wnc0eYlIO0qw==
X-IronPort-AV: E=McAfee;i="6200,9189,10016"; a="206203195"
X-IronPort-AV: E=Sophos;i="5.83,277,1616482800"; d="scan'208";a="206203195"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 05:30:00 -0700
IronPort-SDR: yHbz2/rN9GLMeBrKSFzbbkkeG3y0FeuW66iFGGpAdlS6b3272pjNihGePYnc/JQtU6b4Zo2Xot
 Yz5+XGVEY+nQ==
X-IronPort-AV: E=Sophos;i="5.83,277,1616482800"; d="scan'208";a="450610702"
Received: from mrapopor-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.236.122])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 05:29:57 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: return DRIVER_NAME for the fence driver name
Date: Wed, 16 Jun 2021 13:28:33 +0100
Message-Id: <20210616122833.332954-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
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
Cc: Michael Mason <michael.w.mason@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The first tracepoint for a request is trace_dma_fence_init which is
called in the ctor before we have properly setup the request->engine. So
if it's a non-recycled request the rq->engine might be NULL, or some
garbage value, which leads to a crash.

Since we are not permitted to use kmem_cache_zalloc() here with
SLAB_TYPESAFE_BY_RCU, one approach is simply to return DRIVER_NAME. We
can then revisit this later if we decide to get rid of
SLAB_TYPESAFE_BY_RCU.

Fixes: 855e39e65cfc ("drm/i915: Initialise basic fence before acquiring seqno")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Michael Mason <michael.w.mason@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/i915/i915_request.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 1014c71cf7f5..55fa94bde22e 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -61,7 +61,7 @@ static struct i915_global_request {
 
 static const char *i915_fence_get_driver_name(struct dma_fence *fence)
 {
-	return dev_name(to_request(fence)->engine->i915->drm.dev);
+	return DRIVER_NAME;
 }
 
 static const char *i915_fence_get_timeline_name(struct dma_fence *fence)
-- 
2.26.3

