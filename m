Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C758AD5DA
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 22:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB9310EB5E;
	Mon, 22 Apr 2024 20:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TLnAKju6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BBBE10EB5E;
 Mon, 22 Apr 2024 20:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713818039; x=1745354039;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LUZ7YaAWEq8ANrIZ/9zRKcBMPghyjgHguorL0pKOUiY=;
 b=TLnAKju6tUR5UcvP7zIw9eKwl7W4rqfYmOAz4a7qVDzXRKMR9uGhjgwc
 ViKjUY3/JODChXNjKaadullJ6tzaNGnPYtk+HilQMz7tBwJyiW4l7sFqv
 LBS1z5ttDBCf8gR7tXKdW9eGKUVVJbZLBfqTHyeaT3TT6f8a+aVPKmlBM
 AvHiRo3beJQY1nj3OKT/0Df3bsnDnSGCIoMljgs/orVpzh9Of8eUnWAAO
 BUbEHCB4GYoQBSpldBFJ9DxzRWc7cc0UZg67NUEs1fD1PZ2m4CZzcj5Cl
 yjWOBGek3I7blspKCzEcw8GEAQNcdKeCi1/ldEZNvl35SNe8KxdUNpN9X g==;
X-CSE-ConnectionGUID: rbzH6IZuTk+450G3FHha5w==
X-CSE-MsgGUID: 19/NFJW8TQOdq/SwS+PuRw==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="20781600"
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="20781600"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 13:33:59 -0700
X-CSE-ConnectionGUID: mtMPpH7xTeK3lBMhu7wdoA==
X-CSE-MsgGUID: f0zSYgkWThCPLjiskmjTSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="24191728"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 13:33:57 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, John.C.Harrison@Intel.com,
 Nirmoy Das <nirmoy.das@intel.com>,
 John Harrison <john.c.harrison@intel.com>
Subject: [PATCH v2 2/2] drm/i915: Fix gt reset with GuC submission is disabled
Date: Mon, 22 Apr 2024 22:19:51 +0200
Message-ID: <20240422201951.633-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240422201951.633-1-nirmoy.das@intel.com>
References: <20240422201951.633-1-nirmoy.das@intel.com>
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

Currently intel_gt_reset() kills the GuC and then resets requested
engines. This is problematic because there is a dedicated CSB FIFO
which only GuC can access and if that FIFO fills up, the hardware
will block on the next context switch until there is space that means
the system is effectively hung. If an engine is reset whilst actively
executing a context, a CSB entry will be sent to say that the context
has gone idle. Thus if reset happens on a very busy system then
killing GuC before killing the engines will lead to deadlock because
of filled up CSB FIFO.

To address this issue, the GuC should be killed only after resetting
the requested engines and before calling intel_gt_init_hw().

v2: Improve commit message(John)

Cc: John Harrison <john.c.harrison@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_reset.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index b1393863ca9b..6161f7a3ff70 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -879,8 +879,17 @@ static intel_engine_mask_t reset_prepare(struct intel_gt *gt)
 	intel_engine_mask_t awake = 0;
 	enum intel_engine_id id;
 
-	/* For GuC mode, ensure submission is disabled before stopping ring */
-	intel_uc_reset_prepare(&gt->uc);
+	/**
+	 * For GuC mode with submission enabled, ensure submission
+	 * is disabled before stopping ring.
+	 *
+	 * For GuC mode with submission disabled, ensure that GuC is not
+	 * sanitized, do that after engine reset. reset_prepare()
+	 * is followed by engine reset which in this mode requires GuC to
+	 * process any CSB FIFO entries generated by the resets.
+	 */
+	if (intel_uc_uses_guc_submission(&gt->uc))
+		intel_uc_reset_prepare(&gt->uc);
 
 	for_each_engine(engine, gt, id) {
 		if (intel_engine_pm_get_if_awake(engine))
@@ -1227,6 +1236,9 @@ void intel_gt_reset(struct intel_gt *gt,
 
 	intel_overlay_reset(gt->i915);
 
+	/* sanitize uC after engine reset */
+	if (!intel_uc_uses_guc_submission(&gt->uc))
+		intel_uc_reset_prepare(&gt->uc);
 	/*
 	 * Next we need to restore the context, but we don't use those
 	 * yet either...
-- 
2.42.0

