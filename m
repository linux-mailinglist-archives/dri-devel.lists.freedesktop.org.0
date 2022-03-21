Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A76A4E32B6
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 23:38:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BBC10E497;
	Mon, 21 Mar 2022 22:38:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F51710E05D;
 Mon, 21 Mar 2022 22:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647902304; x=1679438304;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IRnqHe1Z2Fk2g+9ZgouoCqE5vBsuN1NOLTMwITtXolk=;
 b=Tq5aa/SVM9vwwR6CSA2lqFFftczWj9ORuNDXNEeSWuEbsa8YATFZGFsJ
 KMykU/TWzD21XgCI09ld1oCERdkIixb2Zc/kUoLKphwkKNR3EK1wEwPX7
 io/pUi+m896mKCPP/ADjZ6S03HksBw7T4sJ3gf41OlZDYGe9KaQeszA9x
 jF69PJ5jujEgtCnkPEa1qpLSM8bcGogbOErS8uYS3siBPI93JhWwbWwG1
 cwlnslDiAV29ZXklqNf0ZLsBBQcaYZ7ACk4qcEka8u6oUGKG49Wt7dHGY
 bOW1aqKJfwjK4BU37FzMoPhyFkbbPwP14xsEeVVTLXIc1MJfuKmvn81ZG g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="255227151"
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="255227151"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 15:38:23 -0700
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="518616756"
Received: from prithika-mobl.amr.corp.intel.com (HELO mvcheng-desk2.intel.com)
 ([10.251.16.248])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 15:38:23 -0700
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v13 0/5] Use drm_clflush* instead of clflush
Date: Mon, 21 Mar 2022 15:38:14 -0700
Message-Id: <20220321223819.72833-1-michael.cheng@intel.com>
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
Cc: michael.cheng@intel.com, wayne.boyer@intel.com, casey.g.bowman@intel.com,
 lucas.demarchi@intel.com, dri-devel@lists.freedesktop.org
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

v11: Correctly get the sizeof certian addresses. Also rebased to the latest.

v12: Drop include of cacheflush.h and use caches_clean_inval_pou instead of
dcache_clean_inval_poc, since it is not exported for other modules to use.

v13: Drop arm64 implementation for drm_clflush_virt_range. This series will 
focus more on making i915 more architecture neutral by abstracting all clflush
and clflush opt to the drm layer. 

Michael Cheng (5):
  drm/i915/gt: Re-work intel_write_status_page
  drm/i915/gt: Drop invalidate_csb_entries
  drm/i915/gt: Re-work reset_csb
  drm/i915/: Re-work clflush_write32
  drm/i915/gt: replace cache_clflush_range

 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  8 +++-----
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c          | 12 +++++------
 drivers/gpu/drm/i915/gt/intel_engine.h        | 13 ++++--------
 .../drm/i915/gt/intel_execlists_submission.c  | 20 +++++++------------
 drivers/gpu/drm/i915/gt/intel_gtt.c           |  2 +-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  2 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  2 +-
 7 files changed, 23 insertions(+), 36 deletions(-)

-- 
2.25.1

