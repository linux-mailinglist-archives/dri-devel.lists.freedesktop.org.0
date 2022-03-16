Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C104DBB19
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 00:32:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C4B10E9AF;
	Wed, 16 Mar 2022 23:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68FED10E67A;
 Wed, 16 Mar 2022 23:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647473523; x=1679009523;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mdBFztLzerT512Wuao8eTW0HG+xsSNvPWwjvxaQ8npk=;
 b=K/3/g3mszK/cxQgzz8W8qh3QD61VDpT5D5sogdUrNULQWnsqVsLrAWq6
 Kes2BZ1OLsmsj5s3d4GD1+pIAC6pB7Yk9pbOtPQVL6RhrFftVHnw6oxb4
 TWvrrXVLxkmBLNj0Ieg98bzi8PQZKziukDBiUbL8uuQqdUFjbHe+6jhfR
 OJ/lVQdS62PfLgWorMe1vjlBq/JZPWmFBhou1k8txOe3B8KyH0aT2Bybn
 VO1go30FWvZmaJGf/1HtZ4U0ZP3I0+xwWTJ8wHKSFfGAreGhT5aokmlcB
 an8QNi2aqSargfICZAPcAoB2OUmOG7tRb9OXla6c6p00xHK2i0RhHCQAT g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="237343407"
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; d="scan'208";a="237343407"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 16:32:01 -0700
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; d="scan'208";a="613816759"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 16:32:00 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/i915: Fix renamed struct field
Date: Wed, 16 Mar 2022 16:31:46 -0700
Message-Id: <20220316233148.434177-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316233148.434177-1-lucas.demarchi@intel.com>
References: <20220316233148.434177-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
X-Git-Pile: INTEL_DII
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Earlier versions of commit a5b7ef27da60 ("drm/i915: Add struct to hold
IP version") named "ver" as "arch" and then when it was renamed it
missed the rename on MEDIA_VER_FULL() since it it's currently not used.

Fixes: a5b7ef27da60 ("drm/i915: Add struct to hold IP version")
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 72b4c049f2857..2269872a85468 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1006,7 +1006,7 @@ static inline struct intel_gt *to_gt(struct drm_i915_private *i915)
 	(GRAPHICS_VER(i915) >= (from) && GRAPHICS_VER(i915) <= (until))
 
 #define MEDIA_VER(i915)			(INTEL_INFO(i915)->media.ver)
-#define MEDIA_VER_FULL(i915)		IP_VER(INTEL_INFO(i915)->media.arch, \
+#define MEDIA_VER_FULL(i915)		IP_VER(INTEL_INFO(i915)->media.ver, \
 					       INTEL_INFO(i915)->media.rel)
 #define IS_MEDIA_VER(i915, from, until) \
 	(MEDIA_VER(i915) >= (from) && MEDIA_VER(i915) <= (until))
