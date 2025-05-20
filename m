Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AE5ABE139
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 18:54:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D9C10E635;
	Tue, 20 May 2025 16:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="amAntKye";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D64F410E635;
 Tue, 20 May 2025 16:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747760034; x=1779296034;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iDxAY40fZG0hlx2yCC15l+Na+ZJjf1gGJMCSSGjMoLo=;
 b=amAntKye2Men2MJ5g31Nih5woBfRIyEX3Vl7WzpW02J8wEkbYFwyFx+Q
 VOksb+rINeakwwuW8P4hkFAF49HTFummN08bEzkGejuzpfB//klqOsoSR
 CuYLxV8NsPLcc2siTOMj+wo1xHCCc1uMR/shup439BprY8BBplhO/nH2s
 Mog7aLNgwP1o6GWEg3JXqpfjXTt3SPCIT+ATjqh9pYwWGTHMIB4ZSd30J
 Gjg+7/XPrWITI2IB2hBMJXVXSczM7wQk2+aDfMAenQQ3cAiFQsNdLAUoa
 f/MbV3DysFfAvSsZaUbzXRtKsYS0NGjlaOLH2VhahvcN34QnOZC5caYcU w==;
X-CSE-ConnectionGUID: jmN0WWqPQBmtKggdpnZxKw==
X-CSE-MsgGUID: wIDgbfamToCPud05kU92Sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="37322207"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="37322207"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 09:53:53 -0700
X-CSE-ConnectionGUID: 3Gn+XyLhT5uApPoW2tMssQ==
X-CSE-MsgGUID: bBijd1FiRFyblPsAcQNbvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="163038189"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.245.130])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 09:53:51 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v2 06/12] drm/i915/psr: Add interface to check if AUXLess ALPM
 is needed by PSR
Date: Tue, 20 May 2025 19:53:20 +0300
Message-ID: <20250520165326.1631330-7-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520165326.1631330-1-jouni.hogander@intel.com>
References: <20250520165326.1631330-1-jouni.hogander@intel.com>
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

Currently we spread ugly PSR details into ALPM code to check if AUXLess
ALPM is needed. Prepare to hide these details to PSR code by adding new
interface for checking if AUXLess ALPM is needed.

v2: remove kerneldoc comment

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 6 ++++++
 drivers/gpu/drm/i915/display/intel_psr.h | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 1072549649cd..38535e0d2496 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -4246,3 +4246,9 @@ bool intel_psr_needs_alpm(struct intel_dp *intel_dp, const struct intel_crtc_sta
 	return intel_dp_is_edp(intel_dp) && (crtc_state->has_sel_update ||
 					     crtc_state->has_panel_replay);
 }
+
+bool intel_psr_needs_alpm_aux_less(struct intel_dp *intel_dp,
+				   const struct intel_crtc_state *crtc_state)
+{
+	return intel_dp_is_edp(intel_dp) && crtc_state->has_panel_replay;
+}
diff --git a/drivers/gpu/drm/i915/display/intel_psr.h b/drivers/gpu/drm/i915/display/intel_psr.h
index 73c3fa40844b..0cf53184f13f 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.h
+++ b/drivers/gpu/drm/i915/display/intel_psr.h
@@ -77,5 +77,7 @@ int intel_psr_min_vblank_delay(const struct intel_crtc_state *crtc_state);
 void intel_psr_connector_debugfs_add(struct intel_connector *connector);
 void intel_psr_debugfs_register(struct intel_display *display);
 bool intel_psr_needs_alpm(struct intel_dp *intel_dp, const struct intel_crtc_state *crtc_state);
+bool intel_psr_needs_alpm_aux_less(struct intel_dp *intel_dp,
+				   const struct intel_crtc_state *crtc_state);
 
 #endif /* __INTEL_PSR_H__ */
-- 
2.43.0

