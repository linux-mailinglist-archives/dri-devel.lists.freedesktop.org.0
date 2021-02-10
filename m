Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B92316075
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 08:58:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A436E996;
	Wed, 10 Feb 2021 07:58:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 613F56E19A;
 Wed, 10 Feb 2021 07:58:11 +0000 (UTC)
IronPort-SDR: NRSu5jvZOQs5SQMnY2XjUpKC68oT6QBXXQn2hai72CWrVs6o2yAb6HZ9HRSLFq+J6w6EvGruS9
 ELkr+TH9GQBA==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="182095785"
X-IronPort-AV: E=Sophos;i="5.81,167,1610438400"; d="scan'208";a="182095785"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 23:58:10 -0800
IronPort-SDR: ANWhraewEsbZfR6StFFZzymIYzCn/J4IxtYC8Kt96FwiCTriL6Vy3Oa5SpQRGhi1K+zYs1VOY/
 ZbqPfDOF+g2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,167,1610438400"; d="scan'208";a="413054203"
Received: from anand-nuc8i7beh.iind.intel.com ([10.145.162.17])
 by fmsmga004.fm.intel.com with ESMTP; 09 Feb 2021 23:58:07 -0800
From: Anand Moon <anandx.ram.moon@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Matthew Auld <matthew.auld@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Subject: [PATCH] drm/i915/gem: Add a check for object size for corner cases
Date: Wed, 10 Feb 2021 13:29:29 +0530
Message-Id: <20210210075929.5357-1-anandx.ram.moon@intel.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
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
Cc: Anand Moon <anandx.ram.moon@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add check for object size to return appropriate error -E2BIG or -EINVAL
to avoid WARM_ON and sucessfull return for some testcase.

Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Anand Moon <anandx.ram.moon@intel.com>
---
VLK-17702: Since these object size is U64 these corner case will not come
into real test senario.

IGT testcase:
sudo ./gem_create --r create-massive
sudo ./gem_userptr_blits --r input-checking
---
 drivers/gpu/drm/i915/gem/i915_gem_object.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 366d23afbb1a..afc37546da20 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -33,6 +33,9 @@ static inline bool i915_gem_object_size_2big(u64 size)
 {
 	struct drm_i915_gem_object *obj;
 
+	if (size == -1 || size == (-1ull << 32))
+		return true;
+
 	if (GEM_CHECK_SIZE_OVERFLOW(size))
 		return true;
 
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
