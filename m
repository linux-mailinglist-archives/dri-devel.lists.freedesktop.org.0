Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 817153B1C37
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 16:16:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD4B6E90A;
	Wed, 23 Jun 2021 14:16:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80CA66E906;
 Wed, 23 Jun 2021 14:16:35 +0000 (UTC)
IronPort-SDR: xFgP7ji9ICyqqG7kOq/jxFRTUAlJVwP2N/JNVaPzFSn4wKn75wX0pFnyWAB/km3NFJc6y8RM+i
 so0qi599na1w==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="194575753"
X-IronPort-AV: E=Sophos;i="5.83,294,1616482800"; d="scan'208";a="194575753"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 07:16:35 -0700
IronPort-SDR: Sb3c2Cb6pok9+BOgORNSYfM4lVBEvdNHggbl817lO9r6gmrweVPR+hZhZuwdmOTFoQNvf+K8tG
 ytTuAaHZ5ciQ==
X-IronPort-AV: E=Sophos;i="5.83,294,1616482800"; d="scan'208";a="556982702"
Received: from dconnon-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.14.111])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 07:16:32 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/i915/gtt: ignore min_page_size for paging
 structures
Date: Wed, 23 Jun 2021 15:16:15 +0100
Message-Id: <20210623141615.291391-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210623141615.291391-1-matthew.auld@intel.com>
References: <20210623141615.291391-1-matthew.auld@intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The min_page_size is only needed for pages inserted into the GTT, and
for our paging structures we only need at most 4K bytes, so simply
ignore the min_page_size restrictions here, otherwise we might see some
severe overallocation on some devices.

v2(Thomas): add some commentary

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gtt.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index 084ea65d59c0..f7e0352edb62 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -16,7 +16,19 @@ struct drm_i915_gem_object *alloc_pt_lmem(struct i915_address_space *vm, int sz)
 {
 	struct drm_i915_gem_object *obj;
 
-	obj = i915_gem_object_create_lmem(vm->i915, sz, 0);
+	/*
+	 * To avoid severe over-allocation when dealing with min_page_size
+	 * restrictions, we override that behaviour here by allowing an object
+	 * size and page layout which can be smaller. In practice this should be
+	 * totally fine, since GTT paging structures are not typically inserted
+	 * into the GTT.
+	 *
+	 * Note that we also hit this path for the scratch page, and for this
+	 * case it might need to be 64K, but that should work fine here since we
+	 * used the passed in size for the page size, which should ensure it
+	 * also has the same alignment.
+	 */
+	obj = __i915_gem_object_create_lmem_with_ps(vm->i915, sz, sz, 0);
 	/*
 	 * Ensure all paging structures for this vm share the same dma-resv
 	 * object underneath, with the idea that one object_lock() will lock
-- 
2.26.3

