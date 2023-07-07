Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC14374B16C
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 15:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD14310E595;
	Fri,  7 Jul 2023 13:02:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6DB710E587;
 Fri,  7 Jul 2023 13:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688734960; x=1720270960;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OPJBprVC5iXgAgBnq9kGwl3ZibpT5X7opxpZm+7qmFc=;
 b=Y7m+AWHkhFFF4NX9DtTxsP881fVxbnbAesPQoHuH1aBhaoEIsKbWicQ8
 iKqPaLbfS6CGiXXqArBxBt4G1HbwT1QTXSf8TzHyXUSvBWKLiywsVoCUZ
 14u2MOxOxQaFTHDEX1W3UdIAW+ZzMqxf6GyWbSKFlKdijtlO88RGOmGHa
 LV1HHunG4oxFB/e6HHfbAB/lqFV2eVB923Uh4UC/ESr32G6VXXoRcYsdL
 fluKXElUbmmw+pbs2LJ+s8H9pWNz1tzigormJ0BzfhnrCcGOL/wulvz6n
 5ydzm6fEciCyc5dUIagSKZYedNVs1EtJZ7MerDPpCxqcmdzcXQx25oNEC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="427570731"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; d="scan'208";a="427570731"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2023 06:02:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="1050535667"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; d="scan'208";a="1050535667"
Received: from gjmurphy-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.202.50])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2023 06:02:28 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] drm/i915: Track page table backing store usage
Date: Fri,  7 Jul 2023 14:02:18 +0100
Message-Id: <20230707130220.3966836-4-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707130220.3966836-1-tvrtko.ursulin@linux.intel.com>
References: <20230707130220.3966836-1-tvrtko.ursulin@linux.intel.com>
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

Account page table backing store against the owning client memory usage
stats.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gtt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index 2f6a9be0ffe6..126269a0d728 100644
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

