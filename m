Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4868B7D6EC2
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 16:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8552610E674;
	Wed, 25 Oct 2023 14:35:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 671F810E676;
 Wed, 25 Oct 2023 14:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698244539; x=1729780539;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=irynHibsENopzA2YTPqM/u9yk2FLhxudwWWg4Bn+yJ4=;
 b=evdsH/30Uh+mOaxN+RerOFdvdPBMV5BrVfAWlvIe0D45787nzZpGDgAh
 z18C94tDz0/B7R3zLcePEq5ws/6m0FQPvas969SvkNwgIl0b8wjlotO46
 kmVGzfb2VlHifJdxrieb66mog/eF+CqMPjfLPYBLl5d1kiN2c5j3SxN/V
 ye9DVlkH05V2Td2PVs/3FKYCBib7oVql6qqLHruXcxm/2gfpJrk8wGCB1
 XvwN6wlhX9NlWmSqlOuGru47lhRJP4VeBs2bIjchKHz+rwiuPtl1e7d2L
 aI25Bj6xE3z2ZUoaZk8FHi1IqOr1ojbHBgWvYjL5OsDxfJK8Ojbyd+J8A A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="453787497"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="453787497"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 07:35:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="1090245551"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="1090245551"
Received: from marlonpr-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.33.160])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 07:35:36 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: John Harrison <John.C.Harrison@Intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v2 0/5] Add gt_to_guc and guc_to_i915 helpers
Date: Wed, 25 Oct 2023 16:35:10 +0200
Message-ID: <20231025143515.254468-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.42.0
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

while working on the GuC TLB invalidation these days, I just
wished I had the two helpers I am submitting today:

   gt_to_guc()
   guc_to_i915()

Now I have them, at the next GuC TLB invalidation my life will be
easier :-)

Andi

Changelog:
==========
 - add the gt_to_guc() helper and change files in:
    - i915/gt/
    - i915/gt/uc
    - i915/

Andi Shyti (5):
  drm/i915/guc: Create the guc_to_i915() wrapper
  drm/i915/gt: Create the gt_to_guc() wrapper
  drm/i915/guc: Use the new gt_to_guc() wrapper
  drm/i915: Use the new gt_to_guc() wrapper
  drm/i915/guc: Use the ce_to_guc() wrapper whenever possible

 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  4 +--
 drivers/gpu/drm/i915/gt/intel_ggtt.c          |  9 ++---
 drivers/gpu/drm/i915/gt/intel_gt.h            | 10 ++++++
 drivers/gpu/drm/i915/gt/intel_gt_irq.c        |  6 ++--
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c   |  8 ++---
 drivers/gpu/drm/i915/gt/intel_rc6.c           |  4 +--
 drivers/gpu/drm/i915/gt/intel_rps.c           |  2 +-
 drivers/gpu/drm/i915/gt/intel_tlb.c           |  2 +-
 drivers/gpu/drm/i915/gt/selftest_slpc.c       |  6 ++--
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c     |  4 +--
 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c  |  3 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  2 +-
 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    |  8 ++---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  2 +-
 .../gpu/drm/i915/gt/uc/intel_guc_hwconfig.c   |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    | 10 +++---
 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c     |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   |  2 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 34 +++++++++----------
 drivers/gpu/drm/i915/gt/uc/intel_huc.c        |  4 +--
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  4 +--
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c     |  2 +-
 drivers/gpu/drm/i915/i915_debugfs_params.c    |  5 +--
 .../i915/selftests/intel_scheduler_helpers.c  |  4 +--
 26 files changed, 76 insertions(+), 67 deletions(-)

-- 
2.42.0

