Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D98509EB8
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 13:37:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 276FF10F374;
	Thu, 21 Apr 2022 11:37:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D91210F3C2;
 Thu, 21 Apr 2022 11:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650541048; x=1682077048;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3wYOwCwnmCdI37dEF7PXNHQEdd37nkbUkMxpWd9t80I=;
 b=Kq/r/sI926pnqRbI/YwBkboK1hVgT56g55oI4PPvfWO5wq2qN6YlSkps
 hdndGvHWX9gf5mcGpwMyP1P5iwaYW6slGTYGtmDAnTIV6zHgC92p1lJve
 6YLrtfr/0xel+if3L0AYjV1XBluJJIzJix498535sQ6K10eSUR7prsYKV
 6QYWCYC0Hm3Cnt5ulnB7rK4wfQ0P/a9cfQx9nimiEhTcFcfGlvRFSc29p
 2Lk4YdYAo3vzZmf+kV97oiDZrSS/WPHlZddUp/Ra78vTg/H1GUG2bMfrI
 H9I6vNhaF6hQAfEi355t/umw7KeZIt/GNsHRrrOI22xH9uInl4kP8bxmE w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="324766846"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="324766846"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 04:37:27 -0700
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="727952166"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 04:37:25 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/4] uapi/drm/i915: Update the placement list impact on obj
 residency
Date: Thu, 21 Apr 2022 17:08:13 +0530
Message-Id: <20220421113813.30796-5-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220421113813.30796-1-ramalingam.c@intel.com>
References: <20220421113813.30796-1-ramalingam.c@intel.com>
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
Cc: Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Object created with list of memory classes as placement preferences, can
be backed with any memory class of the list as per kernel's migration
policy for the memory contrain situation. Userspace won't be notified of
the memory residency change at this scenario.

And also Flat-CCS compression is supported only on objects of
I915_MEMORY_CLASS_DEVICE. When the Flat-CCS compressed objects migrates
out of I915_MEMORY_CLASS_DEVICE, due to memory constrain, content will
be decompressed without notifying the userpsace.

Record these details in Kernel documentation.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 include/uapi/drm/i915_drm.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 35ca528803fd..8b25dd6a157a 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -3393,6 +3393,20 @@ struct drm_i915_gem_create_ext {
  * At which point we get the object handle in &drm_i915_gem_create_ext.handle,
  * along with the final object size in &drm_i915_gem_create_ext.size, which
  * should account for any rounding up, if required.
+ *
+ * If an object is created with list of memory classes as their placement
+ * preference, kernel could use one of the memory class as the backing storage
+ * based on the memory availability. At memory pressure kernel could migrate the
+ * objects content from one memory class to another, given in the placement list.
+ *
+ * With placement preference list, userpace can't be sure about the object's memory
+ * residence.
+ *
+ * Flat-CCS compression is supported only for objects of I915_MEMORY_CLASS_DEVICE.
+ * If the object has other placement preferences, and if the content is
+ * migrated (by kernel due to memory constrain) to a memory class which is other
+ * than I915_MEMORY_CLASS_DEVICE, object content will be decompressed by kernel.
+ * Userpace will be ignorant of this Flat-CCS state change.
  */
 struct drm_i915_gem_create_ext_memory_regions {
 	/** @base: Extension link. See struct i915_user_extension. */
-- 
2.20.1

