Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6949F8704
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 22:34:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4BEA10E4AA;
	Thu, 19 Dec 2024 21:34:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bwZWmm9p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A49C10E4AA;
 Thu, 19 Dec 2024 21:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734644083; x=1766180083;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J02hf91E0nIwvUJCdSablclEHl5Rviv3E7A0/IgUgek=;
 b=bwZWmm9pC1Ba274JHO8BnkZSsksEqliXWObvIAuRRvDHy6+IvjYt1XqI
 5jsoFnyc3uEZb4aWnXTWQXTG2KNAShykS4Z/JTopXrLTyolTIzrFvrV71
 JRCNtYnvVDjdToVF4C4UVoNlxT5HJAMdbbNVyti7s9W3DFc+SLaDUvIjh
 yeKAl5wpAeVH7XOjjt6GA8KlMkw7OJQTaYveC0H8j21mI2CQlZBvMFxuv
 /1fp6FPCrU+HxDqorLYXHTe+Tc4qA9DdyrXOryw6ayq52iNPkpNWlznyC
 /gMQemILUASCBp3J0EnO2WZqMpj/6I1NXLl8pdPWK+sQ8Y0NItDZlLHNS Q==;
X-CSE-ConnectionGUID: iM8eJkFhQQa4rNRmGujr2g==
X-CSE-MsgGUID: XnJNW8WxRXu2dUpoloR7mQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35330537"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="35330537"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 13:34:43 -0800
X-CSE-ConnectionGUID: 8r3LUsvDSHy9GZFU334ZTQ==
X-CSE-MsgGUID: Zhm16ZKFTiiwLwFau5JeKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="98115618"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.207])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 13:34:41 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com, imre.deak@intel.com
Subject: [PATCH v2 05/16] drm/i915/mst: remove crtc_state->pbn
Date: Thu, 19 Dec 2024 23:33:54 +0200
Message-Id: <774e051f77d89fbf8a933659356e67729d8a2a58.1734643485.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1734643485.git.jani.nikula@intel.com>
References: <cover.1734643485.git.jani.nikula@intel.com>
MIME-Version: 1.0
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

The crtc_state->pbn member is only used as a temporary variable within
mst_stream_find_vcpi_slots_for_bpp(). Remove it as unnecessary.

Suggested-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_types.h | 2 --
 drivers/gpu/drm/i915/display/intel_dp_mst.c        | 3 +--
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index eb9dd1125a4a..16e2bbde76eb 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1160,8 +1160,6 @@ struct intel_crtc_state {
 
 	bool double_wide;
 
-	int pbn;
-
 	struct intel_crtc_scaler_state scaler_state;
 
 	/* w/a for waiting 2 vblanks during crtc enable */
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index f7b91cf32b5b..51f0248084b6 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -321,14 +321,13 @@ static int mst_stream_find_vcpi_slots_for_bpp(struct intel_dp *intel_dp,
 		 * first branch device's link also applies here.
 		 */
 		pbn.full = remote_tu * mst_state->pbn_div.full;
-		crtc_state->pbn = dfixed_trunc(pbn);
 
 		drm_WARN_ON(display->drm, remote_tu < crtc_state->dp_m_n.tu);
 		crtc_state->dp_m_n.tu = remote_tu;
 
 		slots = drm_dp_atomic_find_time_slots(state, &intel_dp->mst_mgr,
 						      connector->port,
-						      crtc_state->pbn);
+						      dfixed_trunc(pbn));
 		if (slots == -EDEADLK)
 			return slots;
 
-- 
2.39.5

