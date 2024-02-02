Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADF1847196
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 15:05:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2424910E782;
	Fri,  2 Feb 2024 14:05:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g7qF+8XI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD1A10E77C;
 Fri,  2 Feb 2024 14:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706882745; x=1738418745;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Oa0hPWy61i5mT3dBxqzy6opmTiQPuCKY6YQkiEuroZ8=;
 b=g7qF+8XI7YrpCmbf2NzZcp0nPjiNgnOF8AosPypICNCYEIgSv8/fSFYs
 AmZH9KsP80Dqo6GoHZVvD0ETa3XjrSYIww1C4c2N+E6kOcECCMu095IzX
 drfJWPkZgpzPlYGlm9y0PMaOXlQKvuOrbZOrY33U5XRWwo1kOxiFqmEzI
 NgxNm6BQXrJabQTKYicmVHTeYekftgtwo6zLpQvGSzcxWVu1o2kJ3+Y48
 CTR1AJ4b6sSSEuKixpn6BgLBBBbESqiLD6EUvjLRErW7ftHnBBXB2Cdw4
 ZYvacotnfgIhbosaYBNmKiT+Yvhm6o1rel7hIPmX106WsgxnsQ6RvC5c5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="17578409"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="17578409"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 06:05:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="23367404"
Received: from mmermeza-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.59.198])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 06:05:39 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 Arun R Murthy <arun.r.murthy@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [RFC 0/4] drm/i915/mst: enable MST mode for 128b/132b single-stream
 sideband
Date: Fri,  2 Feb 2024 16:05:30 +0200
Message-Id: <cover.1706882590.git.jani.nikula@intel.com>
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

Draft for comments.

BR,
Jani.


Cc: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>

Jani Nikula (4):
  drm/mst: read sideband messaging cap
  drm/i915/dp: refactor DP MST detection and configuration
  drm/i915/mst: improve debug logging of DP MST mode detect
  drm/i915/mst: enable MST mode for 128b/132b single-stream sideband

 drivers/gpu/drm/display/drm_dp_mst_topology.c | 20 ++++---
 drivers/gpu/drm/i915/display/intel_dp.c       | 53 ++++++++++---------
 drivers/gpu/drm/nouveau/nouveau_dp.c          |  2 +-
 include/drm/display/drm_dp_mst_helper.h       | 23 +++++++-
 4 files changed, 64 insertions(+), 34 deletions(-)

-- 
2.39.2

