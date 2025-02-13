Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E96E7A34056
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 14:26:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD18710EAAE;
	Thu, 13 Feb 2025 13:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b2LpjUGZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5176C10EAAC;
 Thu, 13 Feb 2025 13:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739453209; x=1770989209;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wHOs7S8i4/USFqi6HlPiytLGoZg2Z+K513YXuFQnP/E=;
 b=b2LpjUGZyLEYxDZoSMPVzRdo32rBE50Hs1TsgqZlzc2mFJXwwa5wc+3v
 RAB+CCORo8S5HvImBo5WSQkgvIKkzmv6FR5oGX4DGQqXXmKzqHTnfcb8v
 FBuUHwATRuwnUjCvXn2IELnhgVknn7OIj/0dizOnRgrRDtLEmNMFIvXsi
 HJtEkQVlsHObVG7t/IL50eSXnDXl9GaYDso8ivpt/MGW/rwKTNgU5UQhA
 v0EjIW4ZPQIjQuG42GgM9Io6d317hN5a6ZOd8dlxfWUDQTMxSu/Ci1+H6
 YenwnAPRg6A4mjjWvdNl+mp5RfM4KAL+G1/KdvF6JHHy7TcKvrt4YY4lj A==;
X-CSE-ConnectionGUID: +FmBeqtOT3mIanMIeQ9zqA==
X-CSE-MsgGUID: /JWL/V6OROm/tiW2HRA/BQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40025435"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="40025435"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 05:26:48 -0800
X-CSE-ConnectionGUID: qLZ5Hf8pRqiEF0O9P4gzKQ==
X-CSE-MsgGUID: 6Dxl6J9FRGmKUKRIByBDXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="113014380"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 vgovind2-mobl3.intel.com) ([10.245.246.251])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 05:26:45 -0800
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, vinod.govindapillai@intel.com,
 ville.syrjala@intel.com, santhosh.reddy.guddati@intel.com,
 jani.saarinen@intel.com
Subject: [PATCH v8 7/7] drm/i915/fbc: disable FBC if PSR2 selective fetch is
 enabled
Date: Thu, 13 Feb 2025 15:25:58 +0200
Message-ID: <20250213132559.136815-8-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250213132559.136815-1-vinod.govindapillai@intel.com>
References: <20250213132559.136815-1-vinod.govindapillai@intel.com>
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

It is not recommended to have both FBC dirty rect and PSR2
selective fetch be enabled at the same time. Mark FBC as not
possible, if PSR2 selective fetch is enabled.

v2: fix the condition to disable FBC if PSR2 enabled (Jani)

v3: use HAS_FBC_DIRTY_RECT()

v4: Update to patch description

Bspec: 68881
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 66a5ee10a649..bd8ca6ef832a 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -1434,9 +1434,14 @@ static int intel_fbc_check_plane(struct intel_atomic_state *state,
 	 * Display 12+ is not supporting FBC with PSR2.
 	 * Recommendation is to keep this combination disabled
 	 * Bspec: 50422 HSD: 14010260002
+	 *
+	 * In Xe3, PSR2 selective fetch and FBC dirty rect feature cannot
+	 * coexist. So if PSR2 selective fetch is supported then mark that
+	 * FBC is not supported.
+	 * TODO: Need a logic to decide between PSR2 and FBC Dirty rect
 	 */
-	if (IS_DISPLAY_VER(display, 12, 14) && crtc_state->has_sel_update &&
-	    !crtc_state->has_panel_replay) {
+	if ((IS_DISPLAY_VER(display, 12, 14) || HAS_FBC_DIRTY_RECT(display)) &&
+	    crtc_state->has_sel_update && !crtc_state->has_panel_replay) {
 		plane_state->no_fbc_reason = "PSR2 enabled";
 		return 0;
 	}
-- 
2.43.0

