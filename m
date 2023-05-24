Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 207D070F8A4
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 16:27:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D92B010E680;
	Wed, 24 May 2023 14:26:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E55D10E2D2;
 Wed, 24 May 2023 14:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684938413; x=1716474413;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IcQptsGtF3M9j9Vgh9zGustvFyYnJ9NXJMkihBJ2HJE=;
 b=VeGAsxqzZeDtuD1Jkx9KSz3XPxIvTS7KpnFrNzrIcM4nVm2vxcDeohQi
 Zbi5l7AdY4kCy2eoJ1okkcAz3/lpE6lm80FiTXsWpKcuTO9Oi44n85ujE
 nApXQLcU+vHhxJ7vtJyMhk1zW/LRFsuPyuNoP9+6T3MushYBI6oF5HD8M
 Y25Uqv4mPqFvryJhAnoCMVogTdJh0nNnkqR+v96gsetiNL041xeGpENmT
 ZxaQjgzw4PLPU2ait7t9ZDjjuNUhIYAuvvxRkFwZvjDuUKfJwL3d2Mj1J
 AGW82kREqPCGpkVAnlHzv+Lv6UL8AGFm9T3XI8OwHpVB3q+FDs5O+YknH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="356806444"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="356806444"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 07:26:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="1034556043"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="1034556043"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 07:26:50 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 09/14] drm/i915/dp: Avoid forcing DSC BPC for MST case
Date: Wed, 24 May 2023 19:52:05 +0530
Message-Id: <20230524142210.3779331-10-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230524142210.3779331-1-ankit.k.nautiyal@intel.com>
References: <20230524142210.3779331-1-ankit.k.nautiyal@intel.com>
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
Cc: stanislav.lisovskiy@intel.com, anusha.srivatsa@intel.com,
 navaremanasi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For MST the bpc is hardcoded to 8, and pipe bpp to 24.
So avoid forcing DSC bpc for MST case.

v2: Warn and ignore the debug flag than to bail out. (Jani)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c     | 11 +++++------
 drivers/gpu/drm/i915/display/intel_dp_mst.c |  5 +++++
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 090ee61b1147..c060e6cb042e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1670,14 +1670,13 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 	if (!intel_dp_dsc_supports_format(intel_dp, pipe_config->output_format))
 		return -EINVAL;
 
-	if (compute_pipe_bpp)
+	if (intel_dp->force_dsc_bpc && compute_pipe_bpp) {
+		pipe_bpp = intel_dp->force_dsc_bpc * 3;
+		drm_dbg_kms(&dev_priv->drm, "Input DSC BPP forced to %d\n", pipe_bpp);
+	} else if (compute_pipe_bpp) {
 		pipe_bpp = intel_dp_dsc_compute_bpp(intel_dp, conn_state->max_requested_bpc);
-	else
+	} else {
 		pipe_bpp = pipe_config->pipe_bpp;
-
-	if (intel_dp->force_dsc_bpc) {
-		pipe_bpp = intel_dp->force_dsc_bpc * 3;
-		drm_dbg_kms(&dev_priv->drm, "Input DSC BPP forced to %d", pipe_bpp);
 	}
 
 	/* Min Input BPC for ICL+ is 8 */
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 90a5c3d0b9b2..d875fef97356 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -361,6 +361,11 @@ static int intel_dp_mst_compute_config(struct intel_encoder *encoder,
 	/* enable compression if the mode doesn't fit available BW */
 	drm_dbg_kms(&dev_priv->drm, "Force DSC en = %d\n", intel_dp->force_dsc_en);
 	if (ret || intel_dp->force_dsc_en) {
+		/*
+		 * FIXME: As bpc is hardcoded to 8, as mentioned above,
+		 * WARN and ignore the debug flag force_dsc_bpc for now.
+		 */
+		drm_WARN(&dev_priv->drm, intel_dp->force_dsc_bpc, "Cannot Force BPC for MST\n");
 		/*
 		 * Try to get at least some timeslots and then see, if
 		 * we can fit there with DSC.
-- 
2.25.1

