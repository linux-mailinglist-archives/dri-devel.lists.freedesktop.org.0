Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3C6360FBF
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 18:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06FA16EA8D;
	Thu, 15 Apr 2021 16:04:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1801D6EA87;
 Thu, 15 Apr 2021 16:04:24 +0000 (UTC)
IronPort-SDR: tYGuGTYbwkmVoWGXCvLxCz3y4oIldjTolw0lUucBPhF8csi95Eg0Rg1BdFO29qS2SS2TYzaG14
 AAX+HtWQ9mPA==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="182377677"
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; d="scan'208";a="182377677"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 09:04:23 -0700
IronPort-SDR: KHYbym8xM/eU1UHPPjxtPStxIeL7rypy5THAtAG6ASWG7FTsajqUYhYfB3Vp48hsAgBfTW22KT
 2NR3hI02a2nQ==
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; d="scan'208";a="425231266"
Received: from nmarjano-mobl2.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.252.7.25])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 09:04:21 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 2/4] drm/i915/uapi: convert i915_user_extension to kernel
 doc
Date: Thu, 15 Apr 2021 16:59:56 +0100
Message-Id: <20210415155958.391624-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210415155958.391624-1-matthew.auld@intel.com>
References: <20210415155958.391624-1-matthew.auld@intel.com>
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
Cc: Jordan Justen <jordan.l.justen@intel.com>, dri-devel@lists.freedesktop.org,
 Kenneth Graunke <kenneth@whitecape.org>, Jason Ekstrand <jason@jlekstrand.net>,
 mesa-dev@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add some example usage for the extension chaining also, which is quite
nifty.

Suggested-by: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jordan Justen <jordan.l.justen@intel.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Kenneth Graunke <kenneth@whitecape.org>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: mesa-dev@lists.freedesktop.org
---
 include/uapi/drm/i915_drm.h | 46 +++++++++++++++++++++++++++++++++----
 1 file changed, 42 insertions(+), 4 deletions(-)

diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index a50257cde9ff..d9c954a5a456 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -62,8 +62,8 @@ extern "C" {
 #define I915_ERROR_UEVENT		"ERROR"
 #define I915_RESET_UEVENT		"RESET"
 
-/*
- * i915_user_extension: Base class for defining a chain of extensions
+/**
+ * struct i915_user_extension - Base class for defining a chain of extensions
  *
  * Many interfaces need to grow over time. In most cases we can simply
  * extend the struct and have userspace pass in more data. Another option,
@@ -76,12 +76,50 @@ extern "C" {
  * increasing complexity, and for large parts of that interface to be
  * entirely optional. The downside is more pointer chasing; chasing across
  * the __user boundary with pointers encapsulated inside u64.
+ *
+ * Example chaining:
+ *
+ * .. code-block:: C
+ *
+ *	struct i915_user_extension ext3 {
+ *		.next_extension = 0, // end
+ *		.name = ...,
+ *	};
+ *	struct i915_user_extension ext2 {
+ *		.next_extension = (uintptr_t)&ext3,
+ *		.name = ...,
+ *	};
+ *	struct i915_user_extension ext1 {
+ *		.next_extension = (uintptr_t)&ext2,
+ *		.name = ...,
+ *	};
+ *
+ * Typically the i915_user_extension would be embedded in some uAPI struct, and
+ * in this case we would feed it the head of the chain(i.e ext1), which would
+ * then apply all of the above extensions.
+ *
  */
 struct i915_user_extension {
+	/**
+	 * @next_extension:
+	 *
+	 * Pointer to the next i915_user_extension, or zero if the end.
+	 */
 	__u64 next_extension;
+	/** @name: Name of the extension */
 	__u32 name;
-	__u32 flags; /* All undefined bits must be zero. */
-	__u32 rsvd[4]; /* Reserved for future use; must be zero. */
+	/**
+	 * @flags: MBZ
+	 *
+	 * All undefined bits must be zero.
+	 */
+	__u32 flags;
+	/**
+	 * @rsvd: MBZ
+	 *
+	 * Reserved for future use; must be zero.
+	 */
+	__u32 rsvd[4];
 };
 
 /*
-- 
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
