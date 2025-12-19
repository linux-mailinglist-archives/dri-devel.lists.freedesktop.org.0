Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 917ECCCF965
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 12:34:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA75F10EF21;
	Fri, 19 Dec 2025 11:34:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="krs70deu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE9210E47C;
 Fri, 19 Dec 2025 11:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766144045; x=1797680045;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4bv3Gk1Rp61YDnZYdNpxoF/HsUv0eSFoQ9vGbwmYIKg=;
 b=krs70deuW5wZ/2KX0+qr76TnwrHed+DuI8IwOawGtg5cDyuuQrhNkUKa
 vLkxIND4ryEL2cJMgIMAp+0mNmIi9GFmFyi2bYStwgiWvv4+BD2kc+Deq
 dQ6YTXOvK/BJ4sbZkqXE+JtoaQMUO/b8XZfCck5PbcM0AUcS3petGXsjU
 Kd7xKFBxBPoCvfFz1hRYmLs62YGKctTXuaYtNClsUomZPMdPMrG5akxgY
 ZjZLFk07YvECXkjRoFPmBLwq1sR1/6yyKfHBXuronLqTJRNemHVnI5uGX
 zQ2osKCiyBZVbrSy5DJF3eP6o11No3OVCvBEKafLGMgHaxoj760NLlt6W A==;
X-CSE-ConnectionGUID: Ju5THu2mTbaRAAcGBP6gmg==
X-CSE-MsgGUID: h3KZJDsCQ1625TW3CFZPcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="79224461"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="79224461"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 03:34:04 -0800
X-CSE-ConnectionGUID: rZ0vhxzAR3SXyyqV3KRJrw==
X-CSE-MsgGUID: I3dRx54VSmqFJNSDJ+7U7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="203005574"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO fedora)
 ([10.245.244.251])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 03:34:00 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v6 01/24] drm/xe/svm: Fix a debug printout
Date: Fri, 19 Dec 2025 12:32:57 +0100
Message-ID: <20251219113320.183860-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251219113320.183860-1-thomas.hellstrom@linux.intel.com>
References: <20251219113320.183860-1-thomas.hellstrom@linux.intel.com>
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

Avoid spamming the log with drm_info(). Use drm_dbg() instead.

Fixes: cc795e041034 ("drm/xe/svm: Make xe_svm_range_needs_migrate_to_vram() public")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: <stable@vger.kernel.org> # v6.17+
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 93550c7c84ac..bab8e6cbe53d 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -937,7 +937,7 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
 	xe_assert(vm->xe, IS_DGFX(vm->xe));
 
 	if (xe_svm_range_in_vram(range)) {
-		drm_info(&vm->xe->drm, "Range is already in VRAM\n");
+		drm_dbg(&vm->xe->drm, "Range is already in VRAM\n");
 		return false;
 	}
 
-- 
2.51.1

