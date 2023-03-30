Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A8B6D09F9
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 17:40:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4DD410EEEC;
	Thu, 30 Mar 2023 15:40:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC7A10EEE9;
 Thu, 30 Mar 2023 15:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680190834; x=1711726834;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m23aC6vFNqpc7xyehOYmC7+fYBDlP7sazWsbxwAxVsk=;
 b=SR9SItyJmJoVgCgYlpI8gbUGbOHB3neSzsgI92cZ39C4yN2jfAMcIvj7
 lDTM4r8qiYwDn7kGRiEn+NQSe24VvlW3ayu0M+Dz6gUszIJIE/hejl1i6
 sIXMOM3yoqwkQv8u+L33h2Tch+hOu9fjWeYIwSuo4AXm15Ry3dsThS3Go
 rhpfiAkXobAoF8+M7WJVTfLPNnyl33GRCTszFxhAGWrrdaonjaKRAXvEY
 MItULFzAYE181mjYvf3UBhEBE5DiCbDZ0dNN0yWMz6hUASK87QD3SSbC6
 2ds1QLQpBrCH2YxifV+Gw+1ri4b96Bwu5LQ8j9jefoMY9OfbZlwV+gLlG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="329722231"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="329722231"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 08:40:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="687294922"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="687294922"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 08:40:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/12] drm/i2c/tda998x: convert to using has_audio from
 display_info
Date: Thu, 30 Mar 2023 18:39:45 +0300
Message-Id: <310eac1a1128180240272115fe3f4b68f8999151.1680190534.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1680190534.git.jani.nikula@intel.com>
References: <cover.1680190534.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 Russell King <linux@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prefer the parsed results for has_audio in display info over calling
drm_detect_monitor_audio().

Cc: Russell King <linux@armlinux.org.uk>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i2c/tda998x_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index db5c9343a3d2..3ec2ead567fb 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -1312,7 +1312,7 @@ static int tda998x_connector_get_modes(struct drm_connector *connector)
 
 	mutex_lock(&priv->audio_mutex);
 	n = drm_add_edid_modes(connector, edid);
-	priv->sink_has_audio = drm_detect_monitor_audio(edid);
+	priv->sink_has_audio = connector->display_info.has_audio;
 	mutex_unlock(&priv->audio_mutex);
 
 	kfree(edid);
-- 
2.39.2

