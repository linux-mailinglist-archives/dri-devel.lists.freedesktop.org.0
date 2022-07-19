Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B43BE57A087
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 16:07:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC5DA12AEE4;
	Tue, 19 Jul 2022 14:06:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A22E18B9F4;
 Tue, 19 Jul 2022 14:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658239561; x=1689775561;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fV70aCNko5pjg1YfxZTno57Ja6YfWWbTwwqYkQ8AOc0=;
 b=mceJUH+tTcQOdTUCMX7qGT/oe1E0oSBJ05qd75nBP9CElwJEur+8Q9B2
 D/fWE/tPhpbJmsu3M5KBvSVkHWfp3pzBHAihlRDtPnREOHyc9GXQ63XxL
 mU7U3VXrqTX7EL90tFGoJOzjKn/uE9U2xyV6rhT3+IiRXEtFgb1JZ4ftB
 GQCDtEuOpRtlgBwDYP2JlVEnGA7Q9hcwYeH9z9VYCUPPRXec8FIZP59Kj
 SqVUahJ0aT5vtKs+vF+S+fKzqHaWDv+/gis0+1f+VIeuzxuL5YTN5ZQ4K
 Oq+P8AsErsyBvFYVLOVBlaiSqoWk9vfFQK45ZKg6JZufLJNUhH8lPEFk5 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="269523429"
X-IronPort-AV: E=Sophos;i="5.92,284,1650956400"; d="scan'208";a="269523429"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 07:05:47 -0700
X-IronPort-AV: E=Sophos;i="5.92,284,1650956400"; d="scan'208";a="655773838"
Received: from unknown (HELO hades.ger.corp.intel.com) ([10.252.55.53])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 07:05:45 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 7/7] drm/i915: Remove truncation warning for large objects
Date: Tue, 19 Jul 2022 17:04:24 +0300
Message-Id: <20220719140424.430572-8-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220719140424.430572-1-gwan-gyeong.mun@intel.com>
References: <20220719140424.430572-1-gwan-gyeong.mun@intel.com>
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
Cc: thomas.hellstrom@linux.intel.com, jani.nikula@intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk, airlied@linux.ie,
 matthew.auld@intel.com, mchehab@kernel.org, nirmoy.das@intel.com
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
---
 drivers/gpu/drm/i915/gem/i915_gem_object.h | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index d5f823cc1c2e..ae97811e8ff9 100644
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
2.34.1

