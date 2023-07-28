Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 043D57662D0
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 06:15:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E6A10E1E8;
	Fri, 28 Jul 2023 04:15:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A55D910E031;
 Fri, 28 Jul 2023 04:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690517722; x=1722053722;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZUMufSNI9ixEQ2eR6dwIiYoRhaoKXxAu4qjcNwj64s8=;
 b=HZ7c6GY9KVgCNEvyWLEfEMdjVuCWPl93Va2YXkwAZhi9bncHUYxmyC2r
 3VfIlAgKF7HMEDzoiFLqef86JYKtI29duPNCkk9ZqiBXlfvhe0bz+0vgC
 oldzsDV0CepkICXgkpQyjB4AGph2+rAtrnCvmLzkwHGVqP9ZvHcO0NN4j
 2DNOPXXQxnnqAniC4BLJdr8qcQwRYtagsQvOQ6+dmHAZK78chE2ItLo00
 RKsR2N21QqC70NWuW3edd8ss/J+mHrpEYXMwl76/4S6xA7ql30t2Gq42k
 G5Yk7MvXBppYJNtYEjfSrSypawxbgcY6PAvmDGrGGruhCAji3zVvHBaMX A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="348104141"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="348104141"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 21:15:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="797276259"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="797276259"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 21:15:20 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 00/20] DSC misc fixes
Date: Fri, 28 Jul 2023 09:41:30 +0530
Message-Id: <20230728041150.2524032-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: stanislav.lisovskiy@intel.com, anusha.srivatsa@intel.com,
 navaremanasi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series is an attempt to address multiple issues with DSC,
scattered in separate existing series.

Patches 1-4 are DSC fixes from series to Handle BPC for HDMI2.1 PCON
https://patchwork.freedesktop.org/series/107550/

Patches 5-6 are from series DSC fixes for Bigjoiner:
https://patchwork.freedesktop.org/series/115773/

Patches 7-17 are based on series to add DSC fractional BPP support:
https://patchwork.freedesktop.org/series/111391/

Patch 18 is to fix compressed bpc for MST DSC, from Stan's series :
https://patchwork.freedesktop.org/series/116179/

Rev2: Addressed review comments from Stan, Ville.

Rev3: Split larger patches. Separate out common helpers.

Rev4: Rebased, fixed checkpatch warnings.

Rev5: Addressed review comments from Stan.
Added a patch to check if forced dsc format can be used before forcing.

Ankit Nautiyal (19):
  drm/i915/dp: Consider output_format while computing dsc bpp
  drm/i915/dp: Move compressed bpp check with 420 format inside the
    helper
  drm/i915/dp_mst: Use output_format to get the final link bpp
  drm/i915/dp: Use consistent name for link bpp and compressed bpp
  drm/i915/dp: Update Bigjoiner interface bits for computing compressed
    bpp
  drm/i915/intel_cdclk: Add vdsc with bigjoiner constraints on min_cdlck
  drm/i915/dp: Remove extra logs for printing DSC info
  drm/display/dp: Fix the DP DSC Receiver cap size
  drm/i915/dp: Avoid forcing DSC BPC for MST case
  drm/i915/dp: Add functions to get min/max src input bpc with DSC
  drm/i915/dp: Check min bpc DSC limits for dsc_force_bpc also
  drm/i915/dp: Avoid left shift of DSC output bpp by 4
  drm/i915/dp: Rename helper to get DSC max pipe_bpp
  drm/i915/dp: Separate out functions for edp/DP for computing DSC bpp
  drm/i915/dp: Add DSC BPC/BPP constraints while selecting pipe bpp with
    DSC
  drm/i915/dp: Separate out function to get compressed bpp with joiner
  drm/i915/dp: Get optimal link config to have best compressed bpp
  drm/i915/dp: Check src/sink compressed bpp limit for edp
  drm/i915/dp: Check if force_dsc_output_format is possible

Stanislav Lisovskiy (1):
  drm/i915: Query compressed bpp properly using correct DPCD and DP Spec
    info

 drivers/gpu/drm/i915/display/intel_cdclk.c  |  59 +-
 drivers/gpu/drm/i915/display/intel_dp.c     | 658 ++++++++++++++++----
 drivers/gpu/drm/i915/display/intel_dp.h     |  20 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c |  80 +--
 include/drm/display/drm_dp.h                |   2 +-
 5 files changed, 628 insertions(+), 191 deletions(-)

-- 
2.40.1

