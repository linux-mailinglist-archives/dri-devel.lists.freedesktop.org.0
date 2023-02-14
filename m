Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C857E697212
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 00:49:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C10910E10C;
	Tue, 14 Feb 2023 23:49:45 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0FBF10E10C;
 Tue, 14 Feb 2023 23:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676418582; x=1707954582;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TGNE57+J1fwARHlfhoV/IvHZUYyKlvIVK5rMy8kLlh0=;
 b=lPa4kbcrgrkFEwOoOSBY6JuwwR9DvoIVWf8LLrCuvP08BKFBoGL6pV1F
 iypVaF8RYla9gzYhwehGot84IrW/r+NQ/acisuEgw3QDvRJ4DFZA2V6rb
 RhbZTc4HfKJkG7VMZKlqRk8J5sH9jSO2VvDiEYcGH4u9MSbRSovznowSH
 lZOkDTrob7jCog0dj3JDYd3UIXa1cicN14gpq7JsT5borbmQu9FQx7e2M
 LGEpIRtjK6K3AY6a1ZIGKtrKX0T7RjIu5PfdsGnU3KkZGQZ3/zq1puHnz
 P8q018ajzj8k52Hy2zt+vB98MKwzKlbxPC2BknjluhgXGLBTZdFx6+zpn w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="310930984"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; d="scan'208";a="310930984"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 15:49:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="778545742"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; d="scan'208";a="778545742"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmsmga002.fm.intel.com with ESMTP; 14 Feb 2023 15:49:41 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH] drm/i915: Don't use stolen memory for ring buffers
Date: Tue, 14 Feb 2023 15:48:56 -0800
Message-Id: <20230214234856.744573-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Direction from hardware is that stolen memory should never be used for
ring buffer allocations. There are too many caching pitfalls due to the
way stolen memory accesses are routed. So it is safest to just not use
it.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/intel_ring.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_ring.c b/drivers/gpu/drm/i915/gt/intel_ring.c
index 15ec64d881c44..d1a47e1ae6452 100644
--- a/drivers/gpu/drm/i915/gt/intel_ring.c
+++ b/drivers/gpu/drm/i915/gt/intel_ring.c
@@ -116,8 +116,6 @@ static struct i915_vma *create_ring_vma(struct i915_ggtt *ggtt, int size)
 
 	obj = i915_gem_object_create_lmem(i915, size, I915_BO_ALLOC_VOLATILE |
 					  I915_BO_ALLOC_PM_VOLATILE);
-	if (IS_ERR(obj) && i915_ggtt_has_aperture(ggtt))
-		obj = i915_gem_object_create_stolen(i915, size);
 	if (IS_ERR(obj))
 		obj = i915_gem_object_create_internal(i915, size);
 	if (IS_ERR(obj))
-- 
2.39.1

