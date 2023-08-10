Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF55677791B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 15:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A64C10E520;
	Thu, 10 Aug 2023 13:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D77010E51E;
 Thu, 10 Aug 2023 13:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691672890; x=1723208890;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PQbvgn81YjI+IlZGV0d4cGrf+i/ggf+6NQYWq9/IA/c=;
 b=KQU9i28niL8kBTESADzQnF3yG8wILOMK7cP8tNzPiYiCGLhIaDSQkeLu
 I9wlFl3UyJ3UdVA1vom+YBHfXk5mlNl7wQIoSRzfLcgcJoPhM0UC+UEt+
 wB7ZvkvQNBiFW9/70+ABuvwZt2+fFQNILVgIDoJe/GYJ5JO+0zWbKDlw+
 AgQG/wrjMe6ldZ4etWRVMjYoYNVgPBsKZK9N998Lgc3P2FUiMsuYJ0hoF
 V05fKGw+cuD169aDLzN4u2NB+7ea2oRkGF7GYFgCm5ULDTvpzIuNb57yT
 UcY528a+NsQMFd9Tk9R1ilIWyJMW/7El5kVGChHb10BOItIP4hLtIwnqZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="356358510"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="356358510"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 06:06:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="709142874"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="709142874"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 06:06:38 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 00/20] DSC misc fixes
Date: Thu, 10 Aug 2023 18:32:59 +0530
Message-Id: <20230810130319.3708392-1-ankit.k.nautiyal@intel.com>
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

Patch 20 is to fix compressed bpc for MST DSC, from Stan's series :
https://patchwork.freedesktop.org/series/116179/

Rev2: Addressed review comments from Stan, Ville.

Rev3: Split larger patches. Separate out common helpers.

Rev4: Rebased, fixed checkpatch warnings.

Rev5: Addressed review comments from Stan.
Added a patch to check if forced dsc format can be used before forcing.

Rev6: Addressed review comments from Stan.

Rev7: Reordered and rebased.

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
 drivers/gpu/drm/i915/display/intel_dp.c     | 655 ++++++++++++++++----
 drivers/gpu/drm/i915/display/intel_dp.h     |  20 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c |  80 +--
 include/drm/display/drm_dp.h                |   2 +-
 5 files changed, 625 insertions(+), 191 deletions(-)

-- 
2.40.1

