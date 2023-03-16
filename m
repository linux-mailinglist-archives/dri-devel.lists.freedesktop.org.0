Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E49F56BD689
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 17:59:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D86B610ED8A;
	Thu, 16 Mar 2023 16:59:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B77210ED9D;
 Thu, 16 Mar 2023 16:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678985974; x=1710521974;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TipeZemj07QYm0tsNflZV+cnvwkXU70t44vwDs3ncuc=;
 b=gqTUwzhXk4VIDbyaYO3EEha3DlAilkoTdhgw2uCCVIhxbqxsSIbqraL/
 WqsGmoYpwxLvMLFXc6d/Wn40AQKUyUZF5TTTYuYEKTFI8tfcsQjT2nVtD
 Kmc3W2+9TcjjP/bFc1R8AVIBAwSRD22mO/vQbxtMLwwYbya6kLElMhjLG
 dja3TPF6RBM6Fcl49koZSPqWNjssm9sJgG/TrIURsATiaEZpmmFWrShls
 bdAKitIqGPyhfEZXvMudh68Vco3BrNy0mbIV3TA923aZsFSA/5o2fPJOJ
 ZhlaTtaIE6e/fGOy13LF3z45zhpl0C1SOgi6N72r1XkTujXpe4QrWqFl2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="317705509"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="317705509"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 09:59:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="854130851"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="854130851"
Received: from nirmoyda-desk.igk.intel.com ([10.91.214.27])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 09:59:30 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/gem: Flush lmem contents after construction
Date: Thu, 16 Mar 2023 17:59:18 +0100
Message-Id: <20230316165918.13074-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
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
Cc: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 stable@vger.kernel.org, Chris Wilson <chris.p.wilson@linux.intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@linux.intel.com>

i915_gem_object_create_lmem_from_data() lacks the flush of the data
written to lmem to ensure the object is marked as dirty and the writes
flushed to the backing store. Once created, we can immediately release
the obj->mm.mapping caching of the vmap.

Fixes: 7acbbc7cf485 ("drm/i915/guc: put all guc objects in lmem when available")
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: <stable@vger.kernel.org> # v5.16+
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
index 8949fb0a944f..3198b64ad7db 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
@@ -127,7 +127,8 @@ i915_gem_object_create_lmem_from_data(struct drm_i915_private *i915,
 
 	memcpy(map, data, size);
 
-	i915_gem_object_unpin_map(obj);
+	i915_gem_object_flush_map(obj);
+	__i915_gem_object_release_map(obj);
 
 	return obj;
 }
-- 
2.39.0

