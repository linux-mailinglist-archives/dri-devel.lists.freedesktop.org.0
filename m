Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0EE79CF5C
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 13:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF0B10E404;
	Tue, 12 Sep 2023 11:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BB6A10E403;
 Tue, 12 Sep 2023 11:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694516892; x=1726052892;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fywPuGh/6D6XVCKeO8/47kNEIPVzpbwI2yP9aJSqroU=;
 b=A5d17PWLI+Yj4WY972W7mWN2+YJUihXGSnGNb99mMvAyDzHFd2kF8MGi
 yrtTwUWcWFA3GGEpzEk1ErzsDDHInxel2pRqLXeLEiOns+R9wL/Z92xAe
 jfYWLsA7CTzi7Skra24tl1g+YIVPggB1041Qata6p2tTTr7tXcz3kSLHf
 Q4R4pOF6MzE6mPRQSAVSpIkD/mcDbeDrfc8l8uwoj8Ijislvc2Z1RALct
 jNNmDV1GoJ7mhoGKjhhtzQ85g0VqxpvqPeoRmXXs7VUyAGKL7ClJu7J7r
 xQXSOYgs+HkHrJhTnzBNemYj5TUhRw5TOGByvXhPu2lXxNcvr8BCBtwup A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="442358525"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="442358525"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:08:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="737090746"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="737090746"
Received: from kscholl-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.206])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:08:10 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 18/19] drm/i915/display: add I915 conditional build to
 intel_tv.h
Date: Tue, 12 Sep 2023 14:06:45 +0300
Message-Id: <290e555ac87ea11cd6021c1338b75ad64c42ae98.1694514689.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1694514689.git.jani.nikula@intel.com>
References: <cover.1694514689.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add stubs for !I915.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_tv.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_tv.h b/drivers/gpu/drm/i915/display/intel_tv.h
index 44518575ec5c..f08827b8bf2b 100644
--- a/drivers/gpu/drm/i915/display/intel_tv.h
+++ b/drivers/gpu/drm/i915/display/intel_tv.h
@@ -8,6 +8,12 @@
 
 struct drm_i915_private;
 
+#ifdef I915
 void intel_tv_init(struct drm_i915_private *dev_priv);
+#else
+static inline void intel_tv_init(struct drm_i915_private *dev_priv)
+{
+}
+#endif
 
 #endif /* __INTEL_TV_H__ */
-- 
2.39.2

