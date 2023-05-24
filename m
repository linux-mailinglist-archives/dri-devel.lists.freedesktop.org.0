Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5668670F894
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 16:26:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB28610E101;
	Wed, 24 May 2023 14:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E63B10E101;
 Wed, 24 May 2023 14:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684938400; x=1716474400;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uQuMwvtWgvqR0WwmeLdyvPGPylQAZjeuatTLwxHMgh4=;
 b=k6sxhD6XAjvZZen4X73pSbiUGxRP3GKRUwGEEifi8uOSD6jGOCuN20Re
 +hk0Y86w3a9ud+FbxvuQKQc6e9NdnFW8N9soUsmFqBSwFWapbfoaWhrez
 rgbagBNQ3YTuJpWZJpCDbSaxIW9SL0q/3mk3G9EXSY2PWTCncwi3EYnqa
 9CwWpQ5VYNaLY8Jf5HW/K11FIYInQegQmvTLqh3QjyplX3hmtQNOxIJBY
 vcTvUD2PV6xN0I5CboLCSAnKvSfJ4YQVu+P9679QG9DbhH50lcpQM8GVS
 C5yuYWw/RWY6gozSMtBvKJcHQmmXcY67/qCrXMWBpxS/M9p9dtKFjPZ8o g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="356806281"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="356806281"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 07:26:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="1034555977"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="1034555977"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 07:26:30 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 00/14] DSC misc fixes
Date: Wed, 24 May 2023 19:51:56 +0530
Message-Id: <20230524142210.3779331-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
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

Patches 1-3 are DSC fixes from series to Handle BPC for HDMI2.1 PCON
https://patchwork.freedesktop.org/series/107550/

Patches 4-5 are from series DSC fixes for Bigjoiner:
https://patchwork.freedesktop.org/series/115773/

Patches 6-12 are from series to add DSC fractional BPP support:
https://patchwork.freedesktop.org/series/111391/

Patch 13 is to fix compressed bpc for MST DSC, from Stan's series :
https://patchwork.freedesktop.org/series/116179/

Rev2: Addressed review comments from Stan, Ville.

Ankit Nautiyal (13):
  drm/i915/dp: Consider output_format while computing dsc bpp
  drm/i915/dp_mst: Use output_format to get the final link bpp
  drm/i915/dp: Use consistent name for link bpp and compressed bpp
  drm/i915/dp: Update Bigjoiner interface bits for computing compressed
    bpp
  drm/i915/display: Account for DSC not split case while computing cdclk
  drm/i915/intel_cdclk: Add vdsc with bigjoiner constraints on min_cdlck
  drm/i915/dp: Remove extra logs for printing DSC info
  drm/display/dp: Fix the DP DSC Receiver cap size
  drm/i915/dp: Avoid forcing DSC BPC for MST case
  drm/i915/dp: Check min bpc DSC limits for dsc_force_bpc also
  drm/i915/dp: Avoid left shift of DSC output bpp by 4
  drm/i915/dp: Rename helper to get DSC max pipe_bpp
  drm/i915/dp: Get optimal link config to have best compressed bpp

Stanislav Lisovskiy (1):
  drm/i915: Query compressed bpp properly using correct DPCD and DP Spec
    info

 drivers/gpu/drm/i915/display/intel_cdclk.c    |  57 ++-
 drivers/gpu/drm/i915/display/intel_dp.c       | 435 ++++++++++++++----
 drivers/gpu/drm/i915/display/intel_dp.h       |  20 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  76 ++-
 .../drm/i915/display/skl_universal_plane.c    |   7 +-
 include/drm/display/drm_dp.h                  |   2 +-
 6 files changed, 440 insertions(+), 157 deletions(-)

-- 
2.25.1

