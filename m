Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 224B58A6C1E
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 15:23:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3651110EF76;
	Tue, 16 Apr 2024 13:23:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e91JNLcb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E590410EF76
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 13:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713273788; x=1744809788;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x6jfXcFRBti7KkgtfDl0XTo9aIOmY0FStdfCBjx7DUc=;
 b=e91JNLcbgFwPz7s+S5K6o1ju0/1D2jX1y0aUBReyfD56Tfbmt0dgaI+x
 rgb1xfaUrFtWz6s9xFv+JIBHIhe2UNYQX4rtvceCF628nl/qxhpyG6ilB
 grZ8gk2IyKcLpStWUTXVuHwtt4pWsgx3TPVppadlEW1gbISFMUIC13Tmg
 ZAn7OCeZMxlsYa+kDsVUQ+Fr2kDT3MRfP1NNBmdYhLeI6fdbmSqisFv1D
 pNqFyI57Xnvn35UwNoKJgNv/z0x82uXmx1G/v/N5VGQfqDl9WoQTWv2J3
 zXYqfnGr7eplNzynJnU7vFgtso2Y59pRDZJbBmcdVqYW8XZB+Z5DATirF Q==;
X-CSE-ConnectionGUID: St+0WYmRTl+n0APRkTdlUQ==
X-CSE-MsgGUID: AgTszLhLSequDhVNL2IZyw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8571735"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8571735"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 06:23:08 -0700
X-CSE-ConnectionGUID: RZ3RKF8gQaSfe64ZnDVnrg==
X-CSE-MsgGUID: xxkEhbmFSTWJcooAB7if5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="53438742"
Received: from martakit-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.44.100])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 06:23:04 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: [PATCH 06/15] drm/sun4i: hdmi: switch to struct drm_edid
Date: Tue, 16 Apr 2024 16:22:20 +0300
Message-Id: <0967dde8ae35cd58ab8ea58397d514bb9df29fd1.1713273659.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1713273659.git.jani.nikula@intel.com>
References: <cover.1713273659.git.jani.nikula@intel.com>
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

Prefer struct drm_edid based functions over struct edid.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index 2d1880c61b50..245b34adca5a 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -214,20 +214,24 @@ sun4i_hdmi_connector_mode_valid(struct drm_connector *connector,
 static int sun4i_hdmi_get_modes(struct drm_connector *connector)
 {
 	struct sun4i_hdmi *hdmi = drm_connector_to_sun4i_hdmi(connector);
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 	int ret;
 
-	edid = drm_get_edid(connector, hdmi->ddc_i2c ?: hdmi->i2c);
-	if (!edid)
+	drm_edid = drm_edid_read_ddc(connector, hdmi->ddc_i2c ?: hdmi->i2c);
+
+	drm_edid_connector_update(connector, drm_edid);
+	cec_s_phys_addr(hdmi->cec_adap,
+			connector->display_info.source_physical_address, false);
+
+	if (!drm_edid)
 		return 0;
 
 	DRM_DEBUG_DRIVER("Monitor is %s monitor\n",
 			 connector->display_info.is_hdmi ? "an HDMI" : "a DVI");
 
-	drm_connector_update_edid_property(connector, edid);
-	cec_s_phys_addr_from_edid(hdmi->cec_adap, edid);
-	ret = drm_add_edid_modes(connector, edid);
-	kfree(edid);
+
+	ret = drm_edid_connector_add_modes(connector);
+	drm_edid_free(drm_edid);
 
 	return ret;
 }
-- 
2.39.2

