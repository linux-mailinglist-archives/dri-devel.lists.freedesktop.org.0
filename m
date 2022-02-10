Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 832AD4B155F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 19:37:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E1F10E963;
	Thu, 10 Feb 2022 18:36:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC8E10E957;
 Thu, 10 Feb 2022 18:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644518212; x=1676054212;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GS9A40cuDyA1hG33qh6dY/oSm9ukL+xhlJneJzkWmt8=;
 b=W9vV5+G1DVr/NY9SQF3Rw6QChcJ6mx2nYXcauWHr8V0f0l0NyrqoErmH
 G6u5LJ6nMGrluu1R1L4j/MIZFGLXLQnGezoQUUsgte5phAurlHnuP+7yg
 LdYO27OnSXs8LylBiLb1OllS+yf5owxnRmUuVnapUZiRSVKgPLlRpLcbG
 q2DsJPW3mB/0Ah6F/tXZt0+nZ85uhe3QNfnLGhA6+OK9TtIvKDmICE9WY
 mn1p7oLv4qtWY80Cz0xfWraeaJXLoYFXoTn6d+fd4Ry+KDtvpD0Qsah0d
 3p0E0cZX9q3TnR1G1y1J7G3OSutEuy6PO+Vx+QYuOofRaUfzR+P/yQif2 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="229528160"
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="229528160"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 10:36:40 -0800
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="526616742"
Received: from lmoua-mobl.amr.corp.intel.com (HELO mvcheng-desk2.intel.com)
 ([10.212.169.226])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 10:36:39 -0800
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v10 0/6] Use drm_clflush* instead of clflush 
Date: Thu, 10 Feb 2022 10:36:30 -0800
Message-Id: <20220210183636.1187973-1-michael.cheng@intel.com>
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

v9: Rebased

v10: Replaced asm/cacheflush with linux/cacheflush

Michael Cheng (6):
  drm: Add arch arm64 for drm_clflush_virt_range
  drm/i915/gt: Re-work intel_write_status_page
  drm/i915/gt: Drop invalidate_csb_entries
  drm/i915/gt: Re-work reset_csb
  drm/i915/: Re-work clflush_write32
  drm/i915/gt: replace cache_clflush_range

 drivers/gpu/drm/drm_cache.c                   |  6 ++++++
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  8 +++-----
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c          | 12 +++++------
 drivers/gpu/drm/i915/gt/intel_engine.h        | 13 ++++--------
 .../drm/i915/gt/intel_execlists_submission.c  | 20 +++++++------------
 drivers/gpu/drm/i915/gt/intel_gtt.c           |  2 +-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  2 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  2 +-
 8 files changed, 29 insertions(+), 36 deletions(-)

-- 
2.25.1

