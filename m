Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B548721A7
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 15:38:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A851112B5F;
	Tue,  5 Mar 2024 14:38:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mpi5krdf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 941CC112B5D;
 Tue,  5 Mar 2024 14:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709649501; x=1741185501;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uQIR7uK4X0DEAe8rl7jvYcwTmaUoNzaNKjv8QGmBcEw=;
 b=Mpi5krdfiUKf3yQPxw/ll0Ep9waGTMWo7RT0EHtr9KvNktwo6DeehU8h
 mHgo1LY8mAPYPCMP/ld19v5wymQN0Lz8KVNuYmuDi95hlC2g5HFxh6RTd
 Lhwwo3IARBSlehLzh40N7ylUA35AtctFJW/y4OgE/UaHc1nxFv+nbQwMo
 dEV7ijv417YE4aWXdhwnYEq//m4woo0FesQqnR2sUcHf5BovBF6hTC6AL
 R20QTfDG69FcgXuEk0BXUxbqaOQ6mAVc6VMHv2EfKx5/EB6I5+cMySXKY
 GZR9/QK1OoQA+h6I9H+rUxOQ0tMyF5qA/4eyIw0jL2AKccKeY+OperEMJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="21662454"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="21662454"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 06:38:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="13959959"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.213.25.18])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 06:38:18 -0800
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
Subject: [PATCH v7 3/3] Revert "drm/i915: Wait for active retire before
 i915_active_fini()"
Date: Tue,  5 Mar 2024 15:35:08 +0100
Message-ID: <20240305143747.335367-8-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240305143747.335367-5-janusz.krzysztofik@linux.intel.com>
References: <20240305143747.335367-5-janusz.krzysztofik@linux.intel.com>
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
index b70715b1411d6..d2f064d2525cc 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1776,8 +1776,6 @@ static void release_references(struct i915_vma *vma, struct intel_gt *gt,
 	if (vm_ddestroy)
 		i915_vm_resv_put(vma->vm);
 
-	/* Wait for async active retire */
-	i915_active_wait(&vma->active);
 	i915_active_fini(&vma->active);
 	GEM_WARN_ON(vma->resource);
 	i915_vma_free(vma);
-- 
2.43.0

