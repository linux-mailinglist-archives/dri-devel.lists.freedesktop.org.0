Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 869AF4C0C57
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 06:59:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E42DF10E9D9;
	Wed, 23 Feb 2022 05:59:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE4EF10E9D5;
 Wed, 23 Feb 2022 05:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645595946; x=1677131946;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZGGKF90LmvsWYDLVJRwUsAXZp1v93VwC/mjN5XKbaus=;
 b=GksLpBCZthyxqSoJ96ksfJwiZAaDVi2xZMoUR76d27uYXAC+BV11LoDF
 Fu0fXG77NXpErvEHyeXa4XdMli5Btp+R4ReofwM1VU1rje83Wqufkxtq7
 1/0E4xO8rVYpi1DhYBQJefehz/VFBTTUeATTxeAN4CAcLRC1bwlyUGxJm
 nOgaKGsNtDAWC/EcchPtJN5QMtca/eArdO0mPQE7XGXBDMRdOBlwfdgIY
 4Ow+8txRJ1v1jUx4UHhy/G0kmmjTHXWRYpb3ILvMKqisVBgrlmMU8sSUN
 v/I4LaHIBUaYnnwjJbk2CjkI2HF9BAXxvq4k9AIERoPU+Q1Dx/ao+bqfe A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="312606229"
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; d="scan'208";a="312606229"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 21:59:06 -0800
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; d="scan'208";a="706908171"
Received: from shreyasj-mobl1.amr.corp.intel.com (HELO
 mvcheng-desk2.intel.com) ([10.209.93.217])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 21:59:06 -0800
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v11 5/6] drm/i915/: Re-work clflush_write32
Date: Tue, 22 Feb 2022 21:58:59 -0800
Message-Id: <20220223055900.415627-6-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223055900.415627-1-michael.cheng@intel.com>
References: <20220223055900.415627-1-michael.cheng@intel.com>
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
Cc: tvrtko.ursulin@linux.intel.com, michael.cheng@intel.com,
 balasubramani.vivekanandan@intel.com, wayne.boyer@intel.com,
 casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use drm_clflush_virt_range instead of clflushopt and remove the memory
barrier, since drm_clflush_virt_range takes care of that.

v2(Michael Cheng): Use sizeof(*addr) instead of sizeof(addr) to get the
		   actual size of the page. Thanks to Matt Roper for
		   pointing this out.

Signed-off-by: Michael Cheng <michael.cheng@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 89aa0557ade1..0ca6c3d810da 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -1333,10 +1333,8 @@ static void *reloc_vaddr(struct i915_vma *vma,
 static void clflush_write32(u32 *addr, u32 value, unsigned int flushes)
 {
 	if (unlikely(flushes & (CLFLUSH_BEFORE | CLFLUSH_AFTER))) {
-		if (flushes & CLFLUSH_BEFORE) {
-			clflushopt(addr);
-			mb();
-		}
+		if (flushes & CLFLUSH_BEFORE)
+			drm_clflush_virt_range(addr, sizeof(*addr));
 
 		*addr = value;
 
@@ -1348,7 +1346,7 @@ static void clflush_write32(u32 *addr, u32 value, unsigned int flushes)
 		 * to ensure ordering of clflush wrt to the system.
 		 */
 		if (flushes & CLFLUSH_AFTER)
-			clflushopt(addr);
+			drm_clflush_virt_range(addr, sizeof(*addr));
 	} else
 		*addr = value;
 }
-- 
2.25.1

