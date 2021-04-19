Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E9F364002
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 12:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C2C6E204;
	Mon, 19 Apr 2021 10:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC316E204;
 Mon, 19 Apr 2021 10:58:58 +0000 (UTC)
IronPort-SDR: AiqcoQFe+p7Xc8nIoaSIKzSY9AVbM/pIGArBBlsnTYSMEb06LPGtpo6hVRmskEtNboh0V17lH9
 MSn9ikVP6Mxw==
X-IronPort-AV: E=McAfee;i="6200,9189,9958"; a="259264073"
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; d="scan'208";a="259264073"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2021 03:58:58 -0700
IronPort-SDR: 0m6Jmf+KaGwPsFZNytPcUPFOpvEMqOQ3r2SwHPy2CROtUfIAP3113Hct0MIvQuvIJdFhhNDO3U
 sO2fdAp5X45Q==
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; d="scan'208";a="383700197"
Received: from vpjampan-mobl2.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.252.9.192])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2021 03:58:56 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 3/4] drm/i915/uapi: convert i915_user_extension to kernel
 doc
Date: Mon, 19 Apr 2021 11:57:40 +0100
Message-Id: <20210419105741.27844-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210419105741.27844-1-matthew.auld@intel.com>
References: <20210419105741.27844-1-matthew.auld@intel.com>
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
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Kenneth Graunke <kenneth@whitecape.org>, Jason Ekstrand <jason@jlekstrand.net>,
 mesa-dev@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add some example usage for the extension chaining also, which is quite
nifty.

v2: (Daniel)
  - clarify that the name is just some integer, also document that the
    name space is not global
v3: prefer kernel-doc references for structs

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
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>
---
 include/uapi/drm/i915_drm.h | 54 ++++++++++++++++++++++++++++++++++---
 1 file changed, 50 insertions(+), 4 deletions(-)

diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 92da48e935d1..e2867d8cd5e3 100644
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
@@ -76,12 +76,58 @@ extern "C" {
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
+ * Typically the struct i915_user_extension would be embedded in some uAPI
+ * struct, and in this case we would feed it the head of the chain(i.e ext1),
+ * which would then apply all of the above extensions.
+ *
  */
 struct i915_user_extension {
+	/**
+	 * @next_extension:
+	 *
+	 * Pointer to the next struct i915_user_extension, or zero if the end.
+	 */
 	__u64 next_extension;
+	/**
+	 * @name: Name of the extension.
+	 *
+	 * Note that the name here is just some integer.
+	 *
+	 * Also note that the name space for this is not global for the whole
+	 * driver, but rather its scope/meaning is limited to the specific piece
+	 * of uAPI which has embedded the struct i915_user_extension.
+	 */
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
