Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6A5679CD5
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 16:01:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6200210E694;
	Tue, 24 Jan 2023 15:01:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23EA010E694;
 Tue, 24 Jan 2023 15:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674572465; x=1706108465;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Mzv+KYgReVWY7QWCde3drBn0DD3JgO5iXCySzyTpshw=;
 b=TQCNTObkiWLcAXkd9nBekyk/X6/gH8YxcfSXODa+ZN70cpmp3y3/nAUL
 dw6NRICtvbJIseZehOhYENdi2upeBAxPp6E2bqk4LKBbqIXeU8LsPQvLo
 ssKUEOKnRmtlo157ESAETToevqBM/C/7NSbIBt2804DEGs7a8Q/RKcZeP
 c1Ua3TBp1u3LN34OKHx/jVPD8IGP3rJrFzXsbhRYDrr+8CtnWXJ2+KfSv
 L07g8OL/JY1SObGbYybN2F1UtsiRDnRM4W1Wf6SS5Xm7MnjdiSu4tFUhf
 bGk+/itNyaWJ6sbYoHzIQN8pwWrdp2k8Q+OOh/6EaopHr/vURWr9cAujK g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="306664037"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="306664037"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 07:01:02 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="907517022"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="907517022"
Received: from nirmoyda-desk.igk.intel.com ([10.102.42.231])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 07:00:59 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Make sure dsm_size has correct granularity
Date: Tue, 24 Jan 2023 16:00:47 +0100
Message-Id: <20230124150047.9490-1-nirmoy.das@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DSM granularity is 1MB so make sure we stick to that.

Cc: Matthew Auld <matthew.auld@intel.com>
Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index 90a967374b1a..0c027263f09e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -909,7 +909,7 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
 		dsm_base = intel_uncore_read64(uncore, GEN12_DSMBASE) & GEN12_BDSM_MASK;
 		if (WARN_ON(lmem_size < dsm_base))
 			return ERR_PTR(-ENODEV);
-		dsm_size = lmem_size - dsm_base;
+		dsm_size = ALIGN_DOWN(lmem_size - dsm_base, 1 * SZ_1M);
 	}
 
 	io_size = dsm_size;
-- 
2.39.0

