Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 878DB3B41D5
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 12:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C18E6ED65;
	Fri, 25 Jun 2021 10:38:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64DE56ED1B;
 Fri, 25 Jun 2021 10:38:46 +0000 (UTC)
IronPort-SDR: Cn7LDpkguuMhQlC3AHxRYKLKycVYSCSiPJROa4K92gxM0veakE9iwZtfUd6pyqtU48z8bIxrV9
 WxOcwsoMOHBw==
X-IronPort-AV: E=McAfee;i="6200,9189,10025"; a="207466384"
X-IronPort-AV: E=Sophos;i="5.83,298,1616482800"; d="scan'208";a="207466384"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2021 03:38:46 -0700
IronPort-SDR: JrHFnTugLMZMMp00JDtqZ/pHSRftrFHGr8CPEZt6oM2jqYiAg4CT1mYLinWEFH6UqiXcaqtC4g
 aFmnvq1NzB3w==
X-IronPort-AV: E=Sophos;i="5.83,298,1616482800"; d="scan'208";a="488139141"
Received: from adalyx-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.15.48])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2021 03:38:45 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 2/2] drm/i915/gtt: ignore min_page_size for paging
 structures
Date: Fri, 25 Jun 2021 11:38:24 +0100
Message-Id: <20210625103824.558481-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210625103824.558481-1-matthew.auld@intel.com>
References: <20210625103824.558481-1-matthew.auld@intel.com>
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

