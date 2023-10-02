Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A18D47B52D6
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 14:21:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764E210E295;
	Mon,  2 Oct 2023 12:20:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A54810E29F;
 Mon,  2 Oct 2023 12:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696249245; x=1727785245;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TtzwBm9DERNLTiJPDvQed7U0fE/SYIghggWbRcXuo+g=;
 b=DIsIkt5vRGHV5Je1tj5if1VHPPVGkulahESgYPIkN2nYqMibFZJ5vLM6
 EbhbIHg3duiPh2i/spn8yxiV5er7lEqFpS0p+IRU+de2YY0NYt2yj6/PJ
 F/Hy1h+JvgD+f/KQM6fBSyiWZYdQvKlqFkFfu0ozFbvdh5/gIyLk3IFsh
 P8WcsMXva9uCp88i1mXGXUsGnK430JoENiWHpS1HoUng3PgaO2dXKfyGU
 qLmKvgfHE3vdGHb/CP3pnr36afIeLpHVlyVfJHGNHuJArKoUkuAnFUz//
 E2jIwfiUTg0yNLvnheq+hUGfMevu2oW8pEeA+LSfdCyF8H9Xxds8Eb3Y8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="386501844"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="386501844"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 05:20:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="779918158"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="779918158"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 05:20:39 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Invalidate all GTs in flush_tlb_invalidate()
Date: Mon,  2 Oct 2023 14:20:32 +0200
Message-ID: <20231002122032.23703-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Fei Yang <fei.yang@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't return early if one of the GT doesn't require
any flushing.

Fixes: d6c531ab4820 ("drm/i915: Invalidate the TLBs on each GT")
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Fei Yang <fei.yang@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: "Ville Syrjälä" <ville.syrjala@linux.intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_pages.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index 6b6d22c19411..0ba955611dfb 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -198,7 +198,7 @@ static void flush_tlb_invalidate(struct drm_i915_gem_object *obj)
 
 	for_each_gt(gt, i915, id) {
 		if (!obj->mm.tlb[id])
-			return;
+			continue;
 
 		intel_gt_invalidate_tlb_full(gt, obj->mm.tlb[id]);
 		obj->mm.tlb[id] = 0;
-- 
2.41.0

