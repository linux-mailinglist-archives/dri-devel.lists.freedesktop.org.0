Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5502C6527
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:12:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D5D6ECE7;
	Fri, 27 Nov 2020 12:10:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B79D6ECCF;
 Fri, 27 Nov 2020 12:10:49 +0000 (UTC)
IronPort-SDR: P2XGUAqHtaoO+yVSFRE1U4Nt0PHeKobjioSB7oCQnIrFg6DhprveJy1gn0/Nbyc+NPoMpD2c9x
 If7rpqwDPyRA==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="257092806"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="257092806"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:10:44 -0800
IronPort-SDR: pBnSy1SfY51DvMzC6IHuuCr7oHh9xuJp/DS0o/AGKXKhSToOdna7FV8XvDsE23I/WCZHAXxRbi
 shatTJQOV6YQ==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029486"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:10:41 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 106/162] drm/i915: i915 returns -EBUSY on thread contention
Date: Fri, 27 Nov 2020 12:06:22 +0000
Message-Id: <20201127120718.454037-107-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
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
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Sudeep Dutt <sudeep.dutt@intel.com>, dri-devel@lists.freedesktop.org,
	CQ Tang <cq.tang@intel.com>,
	Venkata S Dhanalakota <venkata.s.dhanalakota@intel.com>,
	Neel Desai <neel.desai@intel.com>,
	Francesco <francesco.balestrieri@intel.com>,
	Balestrieri@freedesktop.org,
	Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: CQ Tang <cq.tang@intel.com>

During high threads contention, the same object had been pinned
with a different type. A new pinning will catch -EBUSY if the
FORCE flag is not specified.

This error was observed on DG1 silicon during PO.

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>
Cc: Balestrieri, Francesco <francesco.balestrieri@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Venkata S Dhanalakota <venkata.s.dhanalakota@intel.com>
Cc: Neel Desai <neel.desai@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Sudeep Dutt <sudeep.dutt@intel.com>
Signed-off-by: CQ Tang <cq.tang@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object_blt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_blt.c b/drivers/gpu/drm/i915/gem/i915_gem_object_blt.c
index b41b076f6864..1096f27627d4 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_blt.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_blt.c
@@ -57,7 +57,7 @@ struct i915_vma *intel_emit_vma_fill_blt(struct intel_context *ce,
 	/* we pinned the pool, mark it as such */
 	intel_gt_buffer_pool_mark_used(pool);
 
-	cmd = i915_gem_object_pin_map(pool->obj, I915_MAP_WC);
+	cmd = i915_gem_object_pin_map(pool->obj, I915_MAP_FORCE_WC);
 	if (IS_ERR(cmd)) {
 		err = PTR_ERR(cmd);
 		goto out_unpin;
@@ -297,7 +297,7 @@ struct i915_vma *intel_emit_vma_copy_blt(struct intel_context *ce,
 	/* we pinned the pool, mark it as such */
 	intel_gt_buffer_pool_mark_used(pool);
 
-	cmd = i915_gem_object_pin_map(pool->obj, I915_MAP_WC);
+	cmd = i915_gem_object_pin_map(pool->obj, I915_MAP_FORCE_WC);
 	if (IS_ERR(cmd)) {
 		err = PTR_ERR(cmd);
 		goto out_unpin;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
