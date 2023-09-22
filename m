Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 134A27AB2FF
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 15:47:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A39610E66E;
	Fri, 22 Sep 2023 13:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F9910E192;
 Fri, 22 Sep 2023 13:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695390429; x=1726926429;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OCwimyZAfF1yxBbSTVrLGVEPGcna2CSWf2hqAApE8LA=;
 b=eXFIH+stRbcaGDFqhTo6Gr6JUrHrUQ8P2Q177Ghma0FRaVoZDLGidJ2m
 6s2dp3RcgtNpBpyUGBoK0eiqW0uuEcimEnusYajKQEIj44A4r24oloJ+N
 xk6GypZzGWz0uST4amJgSQeYr9mMV/sIuqE7RGxK9Dt8ZTNWE0uxNiHEQ
 AlvN3q9Bv+jVCq4ZroAlM8j2QoaQZSVfIOTH3Bxxzx1NqXCPGnY7vtQzH
 2O1Z/XtnX2TbX2OSSRxFTyONvnkE8UO5ElI26EbPt07XcEN36ZM6rCCXP
 wqmRy9A7b2sA2yD1GoTC5kQqlvsKiTV2xPdyvkE0Wg8Et4viFbLFJeVzR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="467126586"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="467126586"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 06:47:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="1078376231"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="1078376231"
Received: from placki-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.200.149])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 06:47:07 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/6] drm/i915: Track page table backing store usage
Date: Fri, 22 Sep 2023 14:46:57 +0100
Message-Id: <20230922134700.235039-4-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230922134700.235039-1-tvrtko.ursulin@linux.intel.com>
References: <20230922134700.235039-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Account page table backing store against the owning client memory usage
stats.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gtt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index 13944a14ea2d..c3f29999b379 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -58,6 +58,9 @@ struct drm_i915_gem_object *alloc_pt_lmem(struct i915_address_space *vm, int sz)
 	if (!IS_ERR(obj)) {
 		obj->base.resv = i915_vm_resv_get(vm);
 		obj->shares_resv_from = vm;
+
+		if (vm->fpriv)
+			i915_drm_client_add_object(vm->fpriv->client, obj);
 	}
 
 	return obj;
@@ -79,6 +82,9 @@ struct drm_i915_gem_object *alloc_pt_dma(struct i915_address_space *vm, int sz)
 	if (!IS_ERR(obj)) {
 		obj->base.resv = i915_vm_resv_get(vm);
 		obj->shares_resv_from = vm;
+
+		if (vm->fpriv)
+			i915_drm_client_add_object(vm->fpriv->client, obj);
 	}
 
 	return obj;
-- 
2.39.2

