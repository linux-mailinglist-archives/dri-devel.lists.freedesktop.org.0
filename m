Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50659A6BF54
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 17:12:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2076610E80E;
	Fri, 21 Mar 2025 16:11:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G+cCxx27";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B3A410E80D;
 Fri, 21 Mar 2025 16:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742573515; x=1774109515;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/Y7IqoxV+E43TrqFj8uByUVi/II6Ib75u7BmcJ0ROM8=;
 b=G+cCxx27yWwprm3/qO1amQT43sVCmTICrbtA4y1xp0LK4cV0uLPhKBhj
 n8PS2wCC3mMGPDdbs2Kj3DHu8O/t1DEFCxkM6WqcW56WrZz1os+epww9L
 9lY71HY243WI4ICgSerO1f4zaQQFxRGgyairVtn2vs2nDCmW2qqJWY3gT
 ub+6sK2JrOtMhNlA9so5tUNk+k1maVRphTMD3IbUQBMCR9jbL4Mffmarj
 wkKJ1T1TNvc+NPI0x6J+Om6Oe6iUe5AO5UFGKhbXkRBNnz76mQzHYci78
 Agyna7s4GHUMJUZIBvx8Y+rSK2K5MmagYqwZA/1C3SRbJtCO0zpRDiqRy g==;
X-CSE-ConnectionGUID: CQrwKmCpQC+oZYINjg4zjQ==
X-CSE-MsgGUID: lVvlOmhFQPugQQX6djy5vQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="66308477"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="66308477"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 09:11:55 -0700
X-CSE-ConnectionGUID: GjpxnUbbQNOxeAzkPYbPZA==
X-CSE-MsgGUID: dPAWOGFkS22SeP6Gb+7Xtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="128554975"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa004.fm.intel.com with ESMTP; 21 Mar 2025 09:11:54 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 08/12] drm/i915/display: Compare the sharpness state
Date: Fri, 21 Mar 2025 21:36:24 +0530
Message-Id: <20250321160628.2663912-9-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250321160628.2663912-1-nemesa.garg@intel.com>
References: <20250321160628.2663912-1-nemesa.garg@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Compare the sharpness win_size, strength and enable bits

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 4ffe738ad725..f807915e0fee 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -5276,6 +5276,9 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 
 		PIPE_CONF_CHECK_I(scaler_state.scaler_id);
 		PIPE_CONF_CHECK_I(pixel_rate);
+		PIPE_CONF_CHECK_BOOL(hw.casf_params.casf_enable);
+		PIPE_CONF_CHECK_I(hw.casf_params.win_size);
+		PIPE_CONF_CHECK_I(hw.casf_params.strength);
 
 		PIPE_CONF_CHECK_X(gamma_mode);
 		if (display->platform.cherryview)
-- 
2.25.1

