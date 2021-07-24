Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 014DC3D43C1
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 02:12:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358E06FD2C;
	Sat, 24 Jul 2021 00:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8548F6FD17;
 Sat, 24 Jul 2021 00:11:29 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10054"; a="191563444"
X-IronPort-AV: E=Sophos;i="5.84,265,1620716400"; d="scan'208";a="191563444"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 17:11:28 -0700
X-IronPort-AV: E=Sophos;i="5.84,265,1620716400"; d="scan'208";a="434269977"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 17:11:28 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 05/30] drm/i915/display: remove explicit CNL handling from
 intel_color.c
Date: Fri, 23 Jul 2021 17:10:49 -0700
Message-Id: <20210724001114.249295-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210724001114.249295-1-lucas.demarchi@intel.com>
References: <20210724001114.249295-1-lucas.demarchi@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Jose Souza <jose.souza@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The only real platform with DISPLAY_VER == 10 is GLK, so we don't need
any checks and supporting code for CNL. For DISPLAY_VER >= 11,
ilk_load_csc_matrix() is not used, so make it handle GLK only.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index dab892d2251b..afcb4bf3826c 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -305,13 +305,12 @@ static void ilk_load_csc_matrix(const struct intel_crtc_state *crtc_state)
 				    ilk_csc_postoff_limited_range);
 	} else if (crtc_state->csc_enable) {
 		/*
-		 * On GLK+ both pipe CSC and degamma LUT are controlled
+		 * On GLK both pipe CSC and degamma LUT are controlled
 		 * by csc_enable. Hence for the cases where the degama
 		 * LUT is needed but CSC is not we need to load an
 		 * identity matrix.
 		 */
-		drm_WARN_ON(&dev_priv->drm, !IS_CANNONLAKE(dev_priv) &&
-			    !IS_GEMINILAKE(dev_priv));
+		drm_WARN_ON(&dev_priv->drm, !IS_GEMINILAKE(dev_priv));
 
 		ilk_update_pipe_csc(crtc, ilk_csc_off_zero,
 				    ilk_csc_coeff_identity,
-- 
2.31.1

