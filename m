Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9154978C925
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 18:00:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F16310E40A;
	Tue, 29 Aug 2023 15:59:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDBF310E3F6;
 Tue, 29 Aug 2023 15:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693324792; x=1724860792;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G80/t0E+Y7X7UG/FuuAwrW8sEE/xYeufMdF4yveur7o=;
 b=OIknZ0eweySJLcM7qjeKyNXhe9eLEeza4Q33z8br2pTlgP2T++8jlRq3
 sHJNGkmkXupJFcDnk0nu8lYTzWjJx0Zy1jaKahw8CSxEH+yALo1Y1HT/C
 mIi1Ke2e4+INAFL3dLDBsn6VcsDKLr7VKYXbXi5iKrC0UrE/FCnvfaJxC
 Fathv7f/7Po6Pfk6307ttfQ1Mtc+2qMcY69QHzQYEGeSPJMP8Wt45voYv
 wKAJUkI5N+tHjUgEWYzsOYFuMn5GuzoB6skZuedc/azQlUVnFMW/ZbsQJ
 mTx969B/U0s3gC8cBRMhNjx2MnGrktAudqeTN94BOt0QITgG3lB7yHOMX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441769427"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="441769427"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 08:59:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="688555060"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="688555060"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orsmga003.jf.intel.com with ESMTP; 29 Aug 2023 08:59:26 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 22/33] drm/i915/color: Add plane color callbacks
Date: Tue, 29 Aug 2023 21:34:11 +0530
Message-ID: <20230829160422.1251087-23-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230829160422.1251087-1-uma.shankar@intel.com>
References: <20230829160422.1251087-1-uma.shankar@intel.com>
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
Cc: Uma Shankar <uma.shankar@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add callbacks for color plane operations.

load_plane_luts: used to load pre/post csc luts
load_plane_csc_matrix: used to load csc matrix

Co-developed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index feff8ac45f47..faf16107d339 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -81,6 +81,12 @@ struct intel_color_funcs {
 	 * Read config other than LUTs and CSCs, before them. Optional.
 	 */
 	void (*get_config)(struct intel_crtc_state *crtc_state);
+
+	/*
+	 * Plane color callbacks
+	 */
+	void (*load_plane_csc_matrix)(const struct drm_plane_state *plane_state);
+	void (*load_plane_luts)(const struct drm_plane_state *plane_state);
 };
 
 #define CTM_COEFF_SIGN	(1ULL << 63)
-- 
2.38.1

