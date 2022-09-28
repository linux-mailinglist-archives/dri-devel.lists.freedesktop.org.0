Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 774F25ED75F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 10:15:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F172A10E308;
	Wed, 28 Sep 2022 08:15:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F5D510E31A;
 Wed, 28 Sep 2022 08:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664352893; x=1695888893;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8mTLsr3wQJEHPys39tavADqBaVpCfMjGIDna8R9c7q4=;
 b=AJDdLiCMrUn0N7lHLhTtdb2zRae511ClCH42cQQ/rJymOa1vfwdn8pRb
 aHUCrwuq894fnzSPdq2clCkrbTCx+FVrqXwTyQye7mqaaOivz5TxLIVCZ
 0GRp3Qm6pxYEuBtf2jXwXmuFOwM8K+Pr8vkXBxXLfIT1iVlLHLsQ2MsXu
 AdZ2ZgVL8cL+sfAqc79VbF23IdtTjZgJUt1u7hohrmOp2oC1cxzmu7i5a
 w/qIkM4Q3+CmbvQ/fRjElRlPdmwpTNwvS/OIQQBzYJe5FA8dWItdbZaGR
 Bjxk2LVBqTckoek3Z76h43PIJqBeFVXpwARMAk24PCc6+DBrmr3C61/Cv g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="281257845"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; d="scan'208";a="281257845"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 01:14:47 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="621836461"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; d="scan'208";a="621836461"
Received: from maciejos-mobl.ger.corp.intel.com (HELO
 paris.ger.corp.intel.com) ([10.249.147.47])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 01:14:38 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v13 9/9] drm/i915: Remove truncation warning for large objects
Date: Wed, 28 Sep 2022 11:13:00 +0300
Message-Id: <20220928081300.101516-10-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220928081300.101516-1-gwan-gyeong.mun@intel.com>
References: <20220928081300.101516-1-gwan-gyeong.mun@intel.com>
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
Cc: gustavoars@kernel.org, trix@redhat.com, dlatypov@google.com,
 llvm@lists.linux.dev, linux@rasmusvillemoes.dk,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 linux-hardening@vger.kernel.org, andrzej.hajda@intel.com,
 linux-sparse@vger.kernel.org, matthew.auld@intel.com,
 andi.shyti@linux.intel.com, airlied@redhat.com,
 thomas.hellstrom@linux.intel.com, keescook@chromium.org, jani.nikula@intel.com,
 nathan@kernel.org, mchehab@kernel.org, mauro.chehab@linux.intel.com,
 ndesaulniers@google.com, linux-kernel@vger.kernel.org, vitor@massaru.org,
 luc.vanoostenryck@gmail.com, nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

Having addressed the issues surrounding incorrect types for local
variables and potential integer truncation in using the scatterlist API,
we have closed all the loop holes we had previously identified with
dangerously large object creation. As such, we can eliminate the warning
put in place to remind us to complete the review.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Testcase: igt@gem_create@create-massive
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/4991
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.h | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 9f8e29112c31..59a64262647b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -20,25 +20,10 @@
 
 enum intel_region_id;
 
-/*
- * XXX: There is a prevalence of the assumption that we fit the
- * object's page count inside a 32bit _signed_ variable. Let's document
- * this and catch if we ever need to fix it. In the meantime, if you do
- * spot such a local variable, please consider fixing!
- *
- * We can check for invalidly typed locals with typecheck(), see for example
- * i915_gem_object_get_sg().
- */
-#define GEM_CHECK_SIZE_OVERFLOW(sz) \
-	GEM_WARN_ON((sz) >> PAGE_SHIFT > INT_MAX)
-
 static inline bool i915_gem_object_size_2big(u64 size)
 {
 	struct drm_i915_gem_object *obj;
 
-	if (GEM_CHECK_SIZE_OVERFLOW(size))
-		return true;
-
 	if (overflows_type(size, obj->base.size))
 		return true;
 
-- 
2.37.1

