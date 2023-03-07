Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0488C6ADC4C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 11:48:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2DBA10E457;
	Tue,  7 Mar 2023 10:48:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF64D10E457;
 Tue,  7 Mar 2023 10:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678186117; x=1709722117;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cDh25AJd19dIerLRDdnUajP2eq4D/mJT6rlMOV8EWbk=;
 b=EsslgZp0dUteYenlG3QggyE/9eQNlFzRrHScDCaDusd2G63UpDoWPzNG
 s5db1/vmi+RTNnzbN8KzzAt2+LadbVe0+n7dqYYK9plDGDciUWaCWMRu/
 Cen2vgI/mH6RSuZfsXSdzmjLH4TnyR9YDJgSv6jNv1MPe+BSp51xMc+7h
 EJWqREBUmNsSB1egdK/QsXmxk4cZRKj7z5mPiMNZXOtDm2NJq8qJU39Di
 PQpV4+w+KCs6AX3KtcjXr5kqTEjCbCGDH/9zr7mR5syfnPg3DVrcdG4Jm
 rZ/Ft34RXWk/c8+zY7bIzE3nBtUTO0tyIE+hwsyQAfaZW3LDAuTWZrDGy Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="400643413"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="400643413"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 02:48:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="819712818"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="819712818"
Received: from tanzeelu-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.205.53])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 02:48:36 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 03/12] drm/i915: Use fence callback initialization helper
Date: Tue,  7 Mar 2023 10:48:15 +0000
Message-Id: <20230307104824.231094-4-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230307104824.231094-1-tvrtko.ursulin@linux.intel.com>
References: <20230307104824.231094-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Matt Turner <mattst88@gmail.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Use the previously added initialization helper to ensure correct operation
of the common code.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/i915_active.c | 2 +-
 drivers/gpu/drm/i915/i915_active.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i915_active.c
index a9fea115f2d2..a3ad64583520 100644
--- a/drivers/gpu/drm/i915/i915_active.c
+++ b/drivers/gpu/drm/i915/i915_active.c
@@ -890,7 +890,7 @@ int i915_active_acquire_preallocate_barrier(struct i915_active *ref,
 				goto unwind;
 
 			RCU_INIT_POINTER(node->base.fence, NULL);
-			node->base.cb.func = node_retire;
+			__dma_fence_cb_init(&node->base.cb, node_retire);
 			node->timeline = idx;
 			node->ref = ref;
 		}
diff --git a/drivers/gpu/drm/i915/i915_active.h b/drivers/gpu/drm/i915/i915_active.h
index 7eb44132183a..da0c5b917cb1 100644
--- a/drivers/gpu/drm/i915/i915_active.h
+++ b/drivers/gpu/drm/i915/i915_active.h
@@ -65,7 +65,7 @@ __i915_active_fence_init(struct i915_active_fence *active,
 			 dma_fence_func_t fn)
 {
 	RCU_INIT_POINTER(active->fence, fence);
-	active->cb.func = fn ?: i915_active_noop;
+	__dma_fence_cb_init(&active->cb, fn ?: i915_active_noop);
 }
 
 #define INIT_ACTIVE_FENCE(A) \
-- 
2.37.2

