Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB6B4B021D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 02:26:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B129C10E6AD;
	Thu, 10 Feb 2022 01:26:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6583610E233;
 Thu, 10 Feb 2022 01:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644456381; x=1675992381;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P8Skke48yQfPbb9QLZu3ZyhQQ2iISiTnDqAGuyez1ek=;
 b=a09XKUmwU2wT1Hr1JqglUoaL3NDYH1x3hJIWWy6U/LzV4PZgWLwb0cDc
 xRGmmwGHj39rnxDMxeXs8Kk5KmhO4y1JrkYEhPl8iOfclIV3/Uw/smhiC
 zK8X2ka+Q8/+NVkTa8DJGbEbg+5BqtvmlI9idtuT5VTFCaiIj3HJ2yV6Z
 SMROdH3SPwzmrrPNSNESladTJKEUZHgydfGemJSQn0LSFwl6KYDM/lWL8
 iMGT97rR4l2ilNIYr6nvnyHhVsPWHZiygBBbITjSAosl2ZsoAq+CKNBMv
 drqx4yFshy64mSL5UqJrn0P6sdmXGappq2a/X6sewUVgjG5jGb6GipOXe g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="249591574"
X-IronPort-AV: E=Sophos;i="5.88,357,1635231600"; d="scan'208";a="249591574"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 17:26:21 -0800
X-IronPort-AV: E=Sophos;i="5.88,357,1635231600"; d="scan'208";a="773706163"
Received: from sroy1-mobl.amr.corp.intel.com (HELO mvcheng-desk2.intel.com)
 ([10.209.85.186])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 17:26:20 -0800
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v9 0/6] Use drm_clflush* instead of clflush 
Date: Wed,  9 Feb 2022 17:26:11 -0800
Message-Id: <20220210012617.1061641-1-michael.cheng@intel.com>
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

