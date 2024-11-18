Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 850099D1BEB
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 00:37:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B106510E58B;
	Mon, 18 Nov 2024 23:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jj3WxVxq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64F2410E568;
 Mon, 18 Nov 2024 23:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731973046; x=1763509046;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JMIpXjB8x2plmka8KMhBqdpOHr0UlIYDdaEUAuZzIxQ=;
 b=jj3WxVxqBM6Zd2W6iKQKdgiwdYjmO9JYQMUeV7YhytPc4+Ao0Ubg1mOW
 kWDseZPePbOgaPLmQ4OPdOjLSqy77BTyB5S2hAENt5ya99Xuk7w3S9Ox/
 VUkEzT50Y25YeaerSojjXDeirOkZ+sBC8MLUm4eTn71g4dir5+eCZU/Pn
 SyQfcfZKHfxGpK2iihrvU0D2Muzvx0nOVBjaq2rUxBH0mkr1nLPvhfDRE
 kUloysRaZyRXrQl8AeTIBdbW1/k1l/5JZISzoEdlVwRPHW4vc+k/xchhx
 0pNdKt9WEzSpURZgKBruz3B/weLGaoyLHHj3iyJRrHhnAwIy0A4Nq5rxk A==;
X-CSE-ConnectionGUID: Ef1Tu5g3Ta6bhHd33mvn3Q==
X-CSE-MsgGUID: LC2K6wkTTPWEydsOR6Wwjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31878916"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="31878916"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:26 -0800
X-CSE-ConnectionGUID: ug1TyloXTm2DfCGlo4xEdw==
X-CSE-MsgGUID: 4/d5sIvWR/KTZ2QKiyLFxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89521708"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:26 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kenneth.w.graunke@intel.com, lionel.g.landwerlin@intel.com,
 jose.souza@intel.com, simona.vetter@ffwll.ch,
 thomas.hellstrom@linux.intel.com, boris.brezillon@collabora.com,
 airlied@gmail.com, christian.koenig@amd.com, mihail.atanassov@arm.com,
 steven.price@arm.com, shashank.sharma@amd.com
Subject: [RFC PATCH 11/29] drm/xe: Don't add pinned mappings to VM bulk move
Date: Mon, 18 Nov 2024 15:37:39 -0800
Message-Id: <20241118233757.2374041-12-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118233757.2374041-1-matthew.brost@intel.com>
References: <20241118233757.2374041-1-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We don't want kernel pinned resources (ring, indirect state) in the VM's
bulk move as these are unevictable.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 549866da5cd1..96dbc88b1f55 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1470,6 +1470,9 @@ __xe_bo_create_locked(struct xe_device *xe,
 {
 	struct xe_bo *bo = NULL;
 	int err;
+	bool want_bulk = vm && !xe_vm_in_fault_mode(vm) &&
+		flags & XE_BO_FLAG_USER &&
+		!(flags & (XE_BO_FLAG_PINNED | XE_BO_FLAG_GGTT));
 
 	if (vm)
 		xe_vm_assert_held(vm);
@@ -1488,9 +1491,7 @@ __xe_bo_create_locked(struct xe_device *xe,
 	}
 
 	bo = ___xe_bo_create_locked(xe, bo, tile, vm ? xe_vm_resv(vm) : NULL,
-				    vm && !xe_vm_in_fault_mode(vm) &&
-				    flags & XE_BO_FLAG_USER ?
-				    &vm->lru_bulk_move : NULL, size,
+				    want_bulk ? &vm->lru_bulk_move : NULL, size,
 				    cpu_caching, type, flags);
 	if (IS_ERR(bo))
 		return bo;
@@ -1781,9 +1782,6 @@ int xe_bo_pin(struct xe_bo *bo)
 	struct xe_device *xe = xe_bo_device(bo);
 	int err;
 
-	/* We currently don't expect user BO to be pinned */
-	xe_assert(xe, !xe_bo_is_user(bo));
-
 	/* Pinned object must be in GGTT or have pinned flag */
 	xe_assert(xe, bo->flags & (XE_BO_FLAG_PINNED |
 				   XE_BO_FLAG_GGTT));
-- 
2.34.1

