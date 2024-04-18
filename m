Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3175A8AA106
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 19:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30455113E4D;
	Thu, 18 Apr 2024 17:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mp0T9OKe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6714A113E4B;
 Thu, 18 Apr 2024 17:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713461100; x=1744997100;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vf74C2S4H0v6XCcLPinYzE4nwsFxaMi/ZbRHUe9X3Gk=;
 b=Mp0T9OKetzo3N111QvEJgtU0i3x2TaRsezKPH7tImcFA41W++jU2nFpp
 6XHNdq4qNVAydr4sOtc+XwL7tG+IkLwPnQvH9c8GWnOg6q8La2tWHKNW4
 RuBl+izpmcwiCSevQn0weoefLuI1620+S6xwN36wmK2v9sS5elrTHgIUj
 V+BnX9vYEJ0MfzE/MKqFY+p3DYvrr29VJqh0PCEBiRSa13Bluq0kfdNpW
 Ior6yGhs+q2/+sM8meODaboI6lvhOsNaGPGqyBFL/Bgf3AqXjl9mDSWrF
 5SJuuClxCIHncWvvNjg5Chy2Wz+iBrYWGp7x0a4XEDg9AJro97tLJXAyB w==;
X-CSE-ConnectionGUID: 16YJK0wpRZmb+mgG5XM/YA==
X-CSE-MsgGUID: QPqFsYVUQfG2MGE/ukkCcg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="34424194"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="34424194"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 10:25:00 -0700
X-CSE-ConnectionGUID: 7gQm9DH9SHu67bH1sc80vw==
X-CSE-MsgGUID: r/rl2OzjQDieyKYFB/bEZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="27881207"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 10:24:59 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, John.C.Harrison@Intel.com,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH 3/3] drm/i915: Fix gt reset with GuC submission disabled
Date: Thu, 18 Apr 2024 19:10:55 +0200
Message-ID: <20240418171055.31371-3-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240418171055.31371-1-nirmoy.das@intel.com>
References: <20240418171055.31371-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

Currently intel_gt_reset() happens as follows:

reset_prepare() ---> Sends GDRST to GuC, GuC is in GS_MIA_IN_RESET
do_reset()
  intel_gt_reset_all_engines()
    *_engine_reset_prepare() -->RESET_CTL expects running GuC
    *_reset_engines()
intel_gt_init_hw() --> GuC comes out of GS_MIA_IN_RESET with FW loaded.

Fix the issue by sanitizing the GuC only after resetting requested
engines and before intel_gt_init_hw().

Note intel_uc_reset_finish() and intel_uc_reset() are nop when
guc submission is disabled.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_reset.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index 6504e8ba9c58..bd166f5aca4b 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -907,8 +907,17 @@ static intel_engine_mask_t reset_prepare(struct intel_gt *gt)
 	intel_engine_mask_t awake = 0;
 	enum intel_engine_id id;
 
-	/* For GuC mode, ensure submission is disabled before stopping ring */
-	intel_uc_reset_prepare(&gt->uc);
+	/**
+	 * For GuC mode with submission enabled, ensure submission
+	 * is disabled before stopping ring.
+	 *
+	 * For GuC mode with submission disabled, ensure that GuC is not
+	 * sanitized, do that at the end in reset_finish(). reset_prepare()
+	 * is followed by engine reset which in this mode requires GuC to
+	 * be functional to process engine reset events.
+	 */
+	if (intel_uc_uses_guc_submission(&gt->uc))
+		intel_uc_reset_prepare(&gt->uc);
 
 	for_each_engine(engine, gt, id) {
 		if (intel_engine_pm_get_if_awake(engine))
@@ -1255,6 +1264,9 @@ void intel_gt_reset(struct intel_gt *gt,
 
 	intel_overlay_reset(gt->i915);
 
+	/* sanitize uC after engine reset */
+	if (!intel_uc_uses_guc_submission(&gt->uc))
+		intel_uc_reset_prepare(&gt->uc);
 	/*
 	 * Next we need to restore the context, but we don't use those
 	 * yet either...
-- 
2.42.0

