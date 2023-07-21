Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D90975C756
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 15:07:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03DDF10E1CF;
	Fri, 21 Jul 2023 13:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E619C10E1AF;
 Fri, 21 Jul 2023 13:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689944868; x=1721480868;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zekvW1wKqoBypeyJ4oJnWnSGxR2raglDQNucQ3yFu50=;
 b=djcew19dHRPDC2S9epROibN66yoiPvGzJJNW4oUk19JvY7Me3Eyorquj
 HRPF82PHzy11h+/hqQeG2r1hn6bchckb8xV3oztzasj8bAhWamcKtVIkh
 FvDA8M8GuiunLTLCAfJVsckH+c2MO4x0xv7KDkoYNpfrBm5Om64pKm52I
 LcI6eFAWDiupSWfpqTO+cZY2mLAx6eWccGvDKVN41AlHNK+D7VEa3YVZu
 xXBI93uCEEps8rEBgP5gLH8j/82UOSE+56k/U13MjKwinyAFeUyWXvV/d
 AZGQ6NxRO/wY6DPz1ZagCRLUmA1jjPq719Zx+v1ZlOI4cAFSMEvXrG4qU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="365911509"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="365911509"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 06:07:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="675042099"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="675042099"
Received: from sahilama-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.213.22])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 06:07:46 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Use the i915_vma_flush_writes helper
Date: Fri, 21 Jul 2023 14:07:41 +0100
Message-Id: <20230721130741.1306563-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

We can use the existing helper in flush_write_domain() and save some lines
of code.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_domain.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
index dfaaa8b66ac3..ffddec1d2a76 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
@@ -68,10 +68,8 @@ flush_write_domain(struct drm_i915_gem_object *obj, unsigned int flush_domains)
 	switch (obj->write_domain) {
 	case I915_GEM_DOMAIN_GTT:
 		spin_lock(&obj->vma.lock);
-		for_each_ggtt_vma(vma, obj) {
-			if (i915_vma_unset_ggtt_write(vma))
-				intel_gt_flush_ggtt_writes(vma->vm->gt);
-		}
+		for_each_ggtt_vma(vma, obj)
+			i915_vma_flush_writes(vma);
 		spin_unlock(&obj->vma.lock);
 
 		i915_gem_object_flush_frontbuffer(obj, ORIGIN_CPU);
-- 
2.39.2

