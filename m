Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3D34B0194
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 01:39:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AE8510E172;
	Thu, 10 Feb 2022 00:39:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B30C10E172;
 Thu, 10 Feb 2022 00:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644453551; x=1675989551;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DEKYzeE0nq/0Wc3lYWywltkmG5C1RHLhZ5iZTvE87v0=;
 b=jCHCJ70MRxq8Al3ExnUCPgXF2j0pLJmameUDykRKyiabD8siA8KjTRYd
 acULpX+s4Ph8mz7TfoIvQZHK+aw+5DBKarI1FvmUAwzz4bBjPJAqmCuv1
 mcvYxh1x1mjcpTsfkczhtEIhy1RoRyB4QCxWM0iWqDWyFZON4EDh7sXQo
 17d7a1wmXqIAquW/TzZqlpsT3adr0WT5/+qBgAqdt0ONbSE//7F/jrPDU
 KOoM8gjvBE30bfJ4IOGTf1BSIM/XcCCWgz0TehTHPZxjnR90mkIX8xhei
 Ncwuqehc0A8Xg6fqfkd69fF/7TcI+HxascwK409iox6L6LSTiBB88tbfe A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="230023277"
X-IronPort-AV: E=Sophos;i="5.88,357,1635231600"; d="scan'208";a="230023277"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 16:39:10 -0800
X-IronPort-AV: E=Sophos;i="5.88,357,1635231600"; d="scan'208";a="482544746"
Received: from sroy1-mobl.amr.corp.intel.com (HELO mvcheng-desk2.intel.com)
 ([10.209.85.186])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 16:39:10 -0800
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v8 0/6] Use drm_clflush* instead of clflush 
Date: Wed,  9 Feb 2022 16:38:58 -0800
Message-Id: <20220210003904.1055898-1-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
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

This patch series re-work a few i915 functions to use drm_clflush_virt_range    
instead of calling clflush or clflushopt directly. This will prevent errors     
when building for non-x86 architectures.                                        
                                                                                 
v2: s/PAGE_SIZE/sizeof(value) for Re-work intel_write_status_page and added     
more patches to convert additional clflush/clflushopt to use drm_clflush*.      
(Michael Cheng)                                                                 
                                                                                 
v3: Drop invalidate_csb_entries and directly invoke drm_clflush_virt_ran        
                                                                                 
v4: Remove extra memory barriers                                                
                                                                                 
v5: s/cache_clflush_range/drm_clflush_virt_range  

v6: Fix up "Drop invalidate_csb_entries" to use correct parameters. Also
added in arm64 support for drm_clflush_virt_range.

v7: Re-order patches, and use correct macro for dcache flush for arm64. 

v8: Remove ifdef for asm/cacheflush.

Michael Cheng (6):
  drm: Add arch arm64 for drm_clflush_virt_range
  drm/i915/gt: Re-work intel_write_status_page
  drm/i915/gt: Drop invalidate_csb_entries
  drm/i915/gt: Re-work reset_csb
  drm/i915/: Re-work clflush_write32
  drm/i915/gt: replace cache_clflush_range

 drivers/gpu/drm/drm_cache.c                   |  5 +++++
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  8 +++-----
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c          | 12 ++++++------
 drivers/gpu/drm/i915/gt/intel_engine.h        | 13 ++++---------
 .../drm/i915/gt/intel_execlists_submission.c  | 19 ++++++-------------
 drivers/gpu/drm/i915/gt/intel_gtt.c           |  2 +-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  2 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  2 +-
 8 files changed, 27 insertions(+), 36 deletions(-)

-- 
2.25.1

