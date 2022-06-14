Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D79854B8E4
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 20:42:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A7F210F027;
	Tue, 14 Jun 2022 18:42:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F152410E488;
 Tue, 14 Jun 2022 18:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655232141; x=1686768141;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oqeDFkIeetC2wEaujxi3tiITw4j+xHoPlFr8CP/BMxU=;
 b=kNhnS2Wo9fAhzYCguii3WVU7Fzqg4EsOlOl0ZTQSB59IlmYBww1Cf7vD
 vzYeP0+2djJ+iCrJP7it04IVSEd1yJmPr1+HeOroDvLPAlSru7rpmF2Jl
 Ux+73LfQNFocod89GR+4EO/S2OYYqsLGmal3oB0dwpPGugKpxT/IB9xNT
 LjDPYpNECU482ge9ARdssKBT/ERUQRIVLj+3H3AmK3F10RsF97XYqJEst
 vwl0g2l1/RDlkLnckdXfdOOKw1+cdmdgHkBQ7f4VBdRYSbNW4MCDgrL2d
 K8wRGqI7zFx9WjehYOm66bQTi0lLyAqaw/3dtqLKyMHnNKw8r/aI0mlPz g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="279426431"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="279426431"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 11:42:20 -0700
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="588627293"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 11:42:18 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/i915: Do not access rq->engine without a reference
Date: Wed, 15 Jun 2022 00:13:46 +0530
Message-Id: <20220614184348.23746-2-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220614184348.23746-1-ramalingam.c@intel.com>
References: <20220614184348.23746-1-ramalingam.c@intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

In i915_fence_get_driver_name(), user may not hold a
reference to rq->engine. Hence do not access it. Instead,
store required device private pointer in 'rq->i915' and use it.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/i915_request.c | 3 ++-
 drivers/gpu/drm/i915/i915_request.h | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 73d5195146b0..7f6998bf390c 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -60,7 +60,7 @@ static struct kmem_cache *slab_execute_cbs;
 
 static const char *i915_fence_get_driver_name(struct dma_fence *fence)
 {
-	return dev_name(to_request(fence)->engine->i915->drm.dev);
+	return dev_name(to_request(fence)->i915->drm.dev);
 }
 
 static const char *i915_fence_get_timeline_name(struct dma_fence *fence)
@@ -937,6 +937,7 @@ __i915_request_create(struct intel_context *ce, gfp_t gfp)
 	rq->engine = ce->engine;
 	rq->ring = ce->ring;
 	rq->execution_mask = ce->engine->mask;
+	rq->i915 = ce->engine->i915;
 
 	ret = intel_timeline_get_seqno(tl, rq, &seqno);
 	if (ret)
diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
index 28b1f9db5487..47041ec68df8 100644
--- a/drivers/gpu/drm/i915/i915_request.h
+++ b/drivers/gpu/drm/i915/i915_request.h
@@ -196,6 +196,8 @@ struct i915_request {
 	struct dma_fence fence;
 	spinlock_t lock;
 
+	struct drm_i915_private *i915;
+
 	/**
 	 * Context and ring buffer related to this request
 	 * Contexts are refcounted, so when this request is associated with a
-- 
2.20.1

