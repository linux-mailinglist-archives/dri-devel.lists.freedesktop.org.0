Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B936053A998
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 17:07:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D892210EAD2;
	Wed,  1 Jun 2022 15:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A1E10EA63;
 Wed,  1 Jun 2022 15:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654096071; x=1685632071;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3pPfeGG4dqswArI08N+BDseC1XkYd7c4GSF7aLis9Q0=;
 b=WWx2vHeQMvtqToopThm46rzYmejBUeWL96KL2f/icAjWxpBAKJR+1IqM
 Jq/hFwqKVkR6XhHJMAVdxIgds9qEGKJRWMnh22PNJY5skrqK3V8vwWMr6
 xeLe8c2lk/xIWHl9BlTLpBre2nTbxvNZaoDmfm4tGaNSSthCv1FgKR2T+
 afvia0hUJQA4oSalzsMnSS6XoN6FMWQd0mzNY15VsI7lRoEtfhp2zUSbE
 lntisxwzw5HIUFmkLthYVaKhfn0G2PHKtS9p7QlQB6EVj6q98obu6xfxI
 1hiRFukMSLcHEU+BumiM5n9bqp9mnC/3+vSM8mB19GbbT9HY4eFBaTIEV g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="338665524"
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; d="scan'208";a="338665524"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 08:07:31 -0700
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; d="scan'208";a="667465440"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 08:07:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 0/6] i915: SSEU handling updates
Date: Wed,  1 Jun 2022 08:07:19 -0700
Message-Id: <20220601150725.521468-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.3
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
Cc: balasubramani.vivekanandan@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series reworks i915's internal handling of slice/subslice/EU (SSEU)                                                                             
data to represent platforms like Xe_HP in a more natural manner and to                                                                               
prepare for future platforms where the masks will need to grow in size.                                                                              
One key idea of this series is that although we have a fixed ABI to                                                                                  
convey SSEU data to userspace (i.e., multiple u8[] arrays with data                                                                                  
stored at different strides), we don't need to use this cumbersome                                                                                   
format for the driver's own internal storage.  As long as we can convert                                                                             
into the uapi form properly when responding to the I915_QUERY ioctl,                                                                                 
it's preferable to use an internal storage format that's easier for the                                                                              
driver to work with.                                                                                                                                 
                                                                                                                                                     
Another key point here is that we're reaching the point where subslice                                                                               
(DSS) masks will soon not fit within simple u32/u64 integer values.                                                                                  
Xe_HP SDV and DG2 platforms today have subslice (DSS) masks that are 32                                                                              
bits, which maxes out the current storage of a u32.  With PVC the masks                                                                              
are represented by a pair of 32-bit registers, requiring a bump up to at                                                                             
least 64-bits of storage internally.  We could switch to u64 for that in                                                                             
the short term, but since we already know that upcoming architectures                                                                                
intend to provide DSS fuse bits via three or more registers it's best to                                                                             
switch to a representation that's more future-proof but still easy to                                                                                
work with in the driver code.  To accomodate this, we start storing our                                                                              
subslice mask for Xe_HP and beyond in a new typedef that can be                                                                                      
processed by the linux/bitmap.h operations.                                                                                                          
                                                                                                                                                     
Finally, since no userspace for Xe_HP or beyond is using the legacy                                                                                  
I915_GETPARAM ioctl lookups for I915_PARAM_SLICE_MASK and                                                                                            
I915_PARAM_SUBSLICE_MASK (since they've migrated to the more flexible                                                                                
I915_QUERY ioctl that can return more than a simple u32 value), we take                                                                              
the opportunity to officially drop support for those GETPARAM lookups on                                                                             
modern platforms.  Maintaining support for these GETPARAM lookups don't                                                                              
make sense for a number of reasons:                                                                                                                  
                                                                                                                                                     
 * Traditional slices no longer exist, and newer ideas like gslices,                                                                                 
   cslices, mslices, etc. aren't something userspace needs to query                                                                                  
   since it can be inferred from other information.                                                                                                  
 * The GETPARAM ioctl doesn't have a way to distinguish between geometry                                                                             
   subslice masks and compute subslice masks, which are distinct on                                                                                  
   Xe_HP and beyond.                                                                                                                                 
 * The I915_GETPARAM ioctl is limited to returning a 32-bit value, so                                                                                
   when subslice masks begin to exceed 32-bits (on PVC), it simply can't                                                                             
   return the entire mask.                                                                                                                           
 * The GETPARAM ioctl doesn't have a way to give sensible information                                                                                
   for multi-tile devices.                                                                                                                           
                                                                                                                                                     
v2:                                                                                                                                                  
 - Switch to union of hsw/xehp formats to keep the representation in a                                                                               
   natural format for different types of hardware.                                                                                                   
 - Avoid accessing internals of intel_sseu_ss_mask_t directly outside of                                                                             
   intel_sseu.[ch].                                                                                                                                  
 - Include PVC SSEU which needs the larger SS mask storage enabled by                                                                                
   this series.                                                                                                                                      
                                                                                                                                                     
v3:                                                                                                                                                  
 - Correct a BIT(s) typo that should have been BIT(ss), causing                                                                                      
   incorrect handling on gen9 platforms.                                                                                                             
                                                                                                                                                     
v4:                                                                                                                                                  
 - Eliminate sseu->{ss,eu}_stride fields and just calculate the proper                                                                               
   value in the UAPI code that needs them.                                                                                                           
 - Handle unwanted ~u8 sign extension at the callsite instead of inside                                                                              
   sseu_set_eus.                                                                                                                                     
 - Use BITMAP_BITS() macro rather than passing I915_MAX_SS_FUSE_BITS                                                                                 
   around directly to bitmap operations.                                                                                                             
 - Improved debugfs / dmesg reporting for Xe_HP dumps                                                                                                
 - Various assertion check improvements.                                                                                                             
                                                                                                                                                     
v5:
 - Rebase to latest drm-tip (resolve trivial conflicts)
 - Move XEHP_BITMAP_BITS() to the header so that we can also replace a usage of
   I915_MAX_SS_FUSE_BITS in one of the inline functions.  (Bala)
 - Change the local variable in intel_slicemask_from_xehp_dssmask() from u16 to
   'unsigned long' to make it a bit more future-proof.
 - Incorporate ack's received from Tvrtko and Lionel.

Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Matt Roper (6):
  drm/i915/xehp: Use separate sseu init function
  drm/i915/xehp: Drop GETPARAM lookups of I915_PARAM_[SUB]SLICE_MASK
  drm/i915/sseu: Simplify gen11+ SSEU handling
  drm/i915/sseu: Don't try to store EU mask internally in UAPI format
  drm/i915/sseu: Disassociate internal subslice mask representation from
    uapi
  drm/i915/pvc: Add SSEU changes

 drivers/gpu/drm/i915/gem/i915_gem_context.c  |   5 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c    |   4 +-
 drivers/gpu/drm/i915/gt/intel_gt.c           |  12 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h      |   1 +
 drivers/gpu/drm/i915/gt/intel_sseu.c         | 450 ++++++++++++-------
 drivers/gpu/drm/i915/gt/intel_sseu.h         |  92 ++--
 drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c |  30 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c  |  24 +-
 drivers/gpu/drm/i915/i915_drv.h              |   2 +
 drivers/gpu/drm/i915/i915_getparam.c         |  11 +-
 drivers/gpu/drm/i915/i915_pci.c              |   3 +-
 drivers/gpu/drm/i915/i915_query.c            |  26 +-
 drivers/gpu/drm/i915/intel_device_info.h     |   1 +
 13 files changed, 397 insertions(+), 264 deletions(-)

-- 
2.35.3

