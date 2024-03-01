Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B807286DC25
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 08:34:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D6710EBCF;
	Fri,  1 Mar 2024 07:34:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Apodu8Aa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0209110EBCC;
 Fri,  1 Mar 2024 07:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709278446; x=1740814446;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6XeupMtZ6JTXI2m9SQbqwDc0A6UjQu/uto4OEpXKWzE=;
 b=Apodu8AaGn/Z21Ik77iOlb5S7SySux2Lab/nYelS27V66Ir0ZArAXTZc
 gSKhxMRUWPt7sJ95T699+EM7e4z8WuZBVis6zCw4eSIQP4WoJOTh9BFOh
 NlEehsscXXlJRoTam2/WLRY7umA8nRHevwWR05FMFZBM1wx7ZLZdpwuwJ
 DLdpPfSZ/RXIdVpGIC8nR/YfZmG31FOP/lu1aQJjWWuWDdaSPSFH/TFnC
 2eTF6UuqNSecVCYSFUj/umvVy9hmy2eOeah3RA1xOECp0xC87IsL919uW
 WNqp1KeJDNXkcnEJ9OLxN+0/IAkMm+CZsjDK6kGpy55niOZCj0nJWI0dL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3657716"
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="3657716"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 23:34:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="8045833"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.213.5.115])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 23:34:01 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH v6 3/3] Revert "drm/i915: Wait for active retire before
 i915_active_fini()"
Date: Fri,  1 Mar 2024 08:29:22 +0100
Message-ID: <20240301073225.121634-8-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240301073225.121634-5-janusz.krzysztofik@linux.intel.com>
References: <20240301073225.121634-5-janusz.krzysztofik@linux.intel.com>
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

This reverts commit 7a2280e8dcd2f1f436db9631287c0b21cf6a92b0, obsoleted
by "drm/i915/vma: Fix UAF on destroy against retire race".

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/i915_vma.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index ffe81fe338f7e..00ce9e20deb2d 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1752,8 +1752,6 @@ static void release_references(struct i915_vma *vma, struct intel_gt *gt,
 	if (vm_ddestroy)
 		i915_vm_resv_put(vma->vm);
 
-	/* Wait for async active retire */
-	i915_active_wait(&vma->active);
 	i915_active_fini(&vma->active);
 	GEM_WARN_ON(vma->resource);
 	i915_vma_free(vma);
-- 
2.43.0

