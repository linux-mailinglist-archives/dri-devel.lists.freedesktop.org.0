Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B81A4ACA1D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 21:11:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE95410F936;
	Mon,  7 Feb 2022 20:11:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E5910E610;
 Mon,  7 Feb 2022 20:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644264691; x=1675800691;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=92reNZ4Bin03Kd2WLn/K7khpGT3+5O6hrpHvHhrhJ0c=;
 b=UT7FZe5cTbngYnIPmotTXeOiKsPSuiro2fqXksdGVWQsUmMUv3sFtrsU
 kEDmFoOQlDtKVHQihJgJSyo2MtoiqFgmwDe26/5g2IsDsYk7frluSzmA2
 Y7OBQL1ILs5juLZ+OgegulaIiP8bfThIH5ZX7EqA9ztcyZzIRPYdzPocM
 f36HO61FAPATIqyRRs9rfLz+GWoZIPFq0FbrAdJhGBE69Z7SZWoK/S3PE
 iW3zyRlA/JvQPInerhLkw9jXFhzI0kWXubAs6cpGcxNrjigRoOsA3h1Un
 Yn2kHnbb0GuTzy+gKkaTYc9wjxoBmjjiSqX8+g1Zhh5Ml4ZmjG0UfUSg3 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="229448809"
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; d="scan'208";a="229448809"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 12:11:30 -0800
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; d="scan'208";a="770754191"
Received: from vdixit-mobl.amr.corp.intel.com (HELO mvcheng-desk2.intel.com)
 ([10.209.60.7])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 12:11:30 -0800
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 0/6] Use drm_clflush* instead of clflush
Date: Mon,  7 Feb 2022 12:11:21 -0800
Message-Id: <20220207201127.648624-1-michael.cheng@intel.com>
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

Michael Cheng (6):
  drm/i915/gt: Re-work intel_write_status_page
  drm/i915/gt: Drop invalidate_csb_entries
  drm/i915/gt: Re-work reset_csb
  drm/i915/: Re-work clflush_write32
  drm/i915/gt: replace cache_clflush_range
  drm: Add arch arm64 for drm_clflush_virt_range

 drivers/gpu/drm/drm_cache.c                   |  4 ++++
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  8 +++-----
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c          | 12 ++++++------
 drivers/gpu/drm/i915/gt/intel_engine.h        | 13 ++++---------
 .../drm/i915/gt/intel_execlists_submission.c  | 19 ++++++-------------
 drivers/gpu/drm/i915/gt/intel_gtt.c           |  2 +-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  2 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  2 +-
 8 files changed, 26 insertions(+), 36 deletions(-)

-- 
2.25.1

