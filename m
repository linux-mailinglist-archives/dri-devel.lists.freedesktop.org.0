Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 375E93970E3
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 12:06:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF2F26E9CA;
	Tue,  1 Jun 2021 10:06:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F0F86E10C;
 Tue,  1 Jun 2021 10:05:59 +0000 (UTC)
IronPort-SDR: ZThiIH8k2pzsQtz9n2tFX2W9HahqhA6uhuxmUjYv4lNqYmrR70vU5f8LEp0iHapI8RFCgwbdf9
 B8JcYwGTmY7w==
X-IronPort-AV: E=McAfee;i="6200,9189,10001"; a="183197737"
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="183197737"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:05:50 -0700
IronPort-SDR: Yy3cKuJhJeoRwpn+rPKX20DUCPJgiHsKDtSxlPY7v9JQttzU1wxeF7rkhHkxP1JDPdsDGmPiJN
 SMmxcFoqZksQ==
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="399245225"
Received: from linux-desktop.iind.intel.com ([10.223.34.178])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:05:48 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/9] drm/i915/xelpd: Attach gamma mode property
Date: Tue,  1 Jun 2021 16:11:30 +0530
Message-Id: <20210601104135.29020-5-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601104135.29020-1-uma.shankar@intel.com>
References: <20210601104135.29020-1-uma.shankar@intel.com>
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
Cc: Uma Shankar <uma.shankar@intel.com>, bhanuprakash.modem@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Attach the gamma mode property to allow userspace set the gamma mode
and provide the luts for the same.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 12cacd3aeead..cae96fbec1a7 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -2458,6 +2458,7 @@ void intel_color_init(struct intel_crtc *crtc)
 						       "logarithmic gamma",
 							d13_logarithmic_gamma,
 							sizeof(d13_logarithmic_gamma));
+			drm_crtc_attach_gamma_mode_property(&crtc->base);
 		} else if (DISPLAY_VER(dev_priv) >= 11) {
 			dev_priv->display.color_check = icl_color_check;
 		} else if (DISPLAY_VER(dev_priv) >= 10) {
-- 
2.26.2

