Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEF3852F51
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 12:31:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53DD310E4CB;
	Tue, 13 Feb 2024 11:31:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="apgISfCQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 874BF10E4BC;
 Tue, 13 Feb 2024 11:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707823868; x=1739359868;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FWTEl8zZ0sQLDhirZp+GJ7OR5cl7hpgzhTzTBpepeac=;
 b=apgISfCQbwL9BdAtA414Scuw2aYkWx3AK/CpRytrF98EQCZLwkcg7zGq
 AIlxdxOAV2ByfO4Crj5yMlmZZqPV2sWM3jZbplTI4Jg+i7RUv7kMg5b8Q
 jA7qat3Jb1nQ/4RSXjC4zM2q/SImLi5/FB86RJqsaQpa6S/a+yAD6BIiG
 KRtTJKK1nOe0IoQw6cvzoxPGgFM3j1RoAQpDo3HRO7jy7o/H8qOc6J7TU
 bsq8HEOgqZqTrCLVyrT07tKOEkN4Fl8sTNqgbUs5f9BVM/rFxD0z+4pRc
 8ucYrNU7P8ttzm/IiRVludSF3Ebu4HfMqtP+ZM4861J6IpRVUEJYcPTXz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1965648"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="1965648"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 03:31:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="7607586"
Received: from snasibli-mobl2.ccr.corp.intel.com (HELO localhost)
 ([10.252.44.50])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 03:31:05 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCH v2 0/6] drm/i915/mst: enable MST mode for 128b/132b
 single-stream sideband
Date: Tue, 13 Feb 2024 13:30:55 +0200
Message-Id: <cover.1707823736.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sort of successor to [1], but revamped.

BR,
Jani.


[1] https://patchwork.freedesktop.org/series/129468/

Jani Nikula (6):
  drm/mst: read sideband messaging cap
  drm/i915/mst: improve debug logging of DP MST mode detect
  drm/i915/mst: abstract choosing the MST mode to use
  drm/i915/mst: use the MST mode detected previously
  drm/i915/mst: add intel_dp_mst_disconnect()
  drm/i915/mst: enable MST mode for 128b/132b single-stream sideband

 drivers/gpu/drm/display/drm_dp_mst_topology.c | 20 +++--
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 90 +++++++++++++------
 drivers/gpu/drm/nouveau/nouveau_dp.c          |  2 +-
 include/drm/display/drm_dp_mst_helper.h       | 23 ++++-
 5 files changed, 99 insertions(+), 37 deletions(-)

-- 
2.39.2

