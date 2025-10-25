Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D3AC08FF6
	for <lists+dri-devel@lfdr.de>; Sat, 25 Oct 2025 14:05:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D199710E28D;
	Sat, 25 Oct 2025 12:05:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l3ZL5gY0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EFF610E28D;
 Sat, 25 Oct 2025 12:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761393918; x=1792929918;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/qpEVbnE9L3o+etbBoLDWYN/3iM4TPauTXLiHOcb+lc=;
 b=l3ZL5gY0r5SNBQLt2/Z70VW90kAbS+goHQ922aR5dIWLwUljK4zycVKG
 hsx9OGtitK6+C8kLWp5GbQLy74MFNGI+ANt20jJ/74xtt/WqGTsLakYZ8
 2ysxMVsdRUXLYtwNH4m+C/tvLrIJ70sXdRKR8UA+P4eN5vtvVJWTwLbK7
 vC1IZwY9wtJ5r2YevfOIlG7YPu/SufUBPGaCz5zwY7XP6vulGYftmtYaE
 Wl8Zig3plUalsLQ16yxA88xuZdz3kcYR3KFNIThO9k7D4HJHqlgSn07Ab
 4hW7coCoCx6kklq+FbCwDuG8nF0IxabIJBSp8MmSgFUw2RzvKxA7KLO/r g==;
X-CSE-ConnectionGUID: uWRyNufTSDOy9yrsP3892Q==
X-CSE-MsgGUID: gg6n0MGcTpaEaEpr20teuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63590394"
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; d="scan'208";a="63590394"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2025 05:05:18 -0700
X-CSE-ConnectionGUID: /mpOedjRQmONewA+qVWtmA==
X-CSE-MsgGUID: HIs2+lOpSxSVLwbjfrBk3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; d="scan'208";a="189023833"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.245.168])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2025 05:05:15 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH 14/15] drm/xe/vm: Add a prefetch debug printout
Date: Sat, 25 Oct 2025 14:04:11 +0200
Message-ID: <20251025120412.12262-15-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
References: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add debug printout that is valueable for pagemap prefetch.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 381d4b4abac9..c646afef131f 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2912,6 +2912,10 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
 		if (!dpagemap)
 			xe_svm_range_migrate_to_smem(vm, svm_range);
 
+		drm_dbg(&vm->xe->drm, "Prefetch pagemap is %s start 0x%016lx end 0x%016lx\n",
+			dpagemap ? dpagemap->drm->unique : "system",
+			xe_svm_range_start(svm_range), xe_svm_range_end(svm_range));
+
 		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, !!dpagemap)) {
 			err = xe_svm_alloc_vram(svm_range, &ctx, dpagemap);
 			if (err) {
-- 
2.51.0

