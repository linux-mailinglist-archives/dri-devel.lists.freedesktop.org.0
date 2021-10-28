Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C38643DDBE
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 11:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F22B06E940;
	Thu, 28 Oct 2021 09:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A876E937;
 Thu, 28 Oct 2021 09:28:50 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="291202667"
X-IronPort-AV: E=Sophos;i="5.87,189,1631602800"; d="scan'208";a="291202667"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 02:28:39 -0700
X-IronPort-AV: E=Sophos;i="5.87,189,1631602800"; d="scan'208";a="597730514"
Received: from malloyd-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.16.73])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 02:28:37 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Ramalingam C <ramalingam.c@intel.com>
Subject: [PATCH v2 2/2] drm/i915/gtt: stop caching the scratch page
Date: Thu, 28 Oct 2021 10:26:38 +0100
Message-Id: <20211028092638.3142258-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20211028092638.3142258-1-matthew.auld@intel.com>
References: <20211028092638.3142258-1-matthew.auld@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Normal users shouldn't be hitting this, likely this would indicate a
userspace bug. So don't bother caching, which should be safe now that we
manually flush the page.

Suggested-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
index 8af2f709571c..9966e9dc5218 100644
--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
@@ -651,7 +651,7 @@ static int gen8_init_scratch(struct i915_address_space *vm)
 
 	vm->scratch[0]->encode =
 		gen8_pte_encode(px_dma(vm->scratch[0]),
-				I915_CACHE_LLC, pte_flags);
+				I915_CACHE_NONE, pte_flags);
 
 	for (i = 1; i <= vm->top; i++) {
 		struct drm_i915_gem_object *obj;
@@ -667,7 +667,7 @@ static int gen8_init_scratch(struct i915_address_space *vm)
 		}
 
 		fill_px(obj, vm->scratch[i - 1]->encode);
-		obj->encode = gen8_pde_encode(px_dma(obj), I915_CACHE_LLC);
+		obj->encode = gen8_pde_encode(px_dma(obj), I915_CACHE_NONE);
 
 		vm->scratch[i] = obj;
 	}
-- 
2.26.3

