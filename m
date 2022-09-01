Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A415A974E
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 14:48:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F11610E70C;
	Thu,  1 Sep 2022 12:48:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 442F810E702;
 Thu,  1 Sep 2022 12:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662036503; x=1693572503;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1zo/g/lzCaus+5d4r+Hxgrmube05BOXK/cJkdikHWAM=;
 b=Jleu1NWWTeTBYhN+u9Ug7/srFMJWUqOUF5LmGDlt3pRG55v2rXNfECBJ
 xaGc3BV9dNXzZyK836iSVeI2KGTTAPPxwoTjp08UHggMybn7zYsGkw5Sh
 xYBaODdjbj4nXG6CvbeaLHts7zaH/ySbl2FHY2fQ92Y2PZxR2i5vnWnt6
 KjtJ4Gyz9vK4qqaQoM+euir5vLAt5XEcsStSLwNf+NabE6WvuxnfXB1OX
 6ieoPektEZ71XgdQQusvgMP2XaaQQT8OskAc0FGp8LUSHjhCAjhYwllxC
 m1ndn+cemoiBG0ZSIHpnkxKfQYkPXD9cp7YYIWPBwuApKdRUOVtPNpoIw g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="296987469"
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="296987469"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 05:48:22 -0700
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="642318322"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.142])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 05:48:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 9/9] drm/rockchip: convert to using has_audio from display_info
Date: Thu,  1 Sep 2022 15:47:11 +0300
Message-Id: <429e4b3f905b070fb985ce7388b9637e2b4704dd.1662036058.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1662036058.git.jani.nikula@intel.com>
References: <cover.1662036058.git.jani.nikula@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sandy Huang <hjc@rock-chips.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prefer the parsed results for has_audio in display info over calling
drm_detect_monitor_audio().

Cc: Sandy Huang <hjc@rock-chips.com>
Cc: Heiko Stübner <heiko@sntech.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/rockchip/cdn-dp-core.c | 4 ++--
 drivers/gpu/drm/rockchip/inno_hdmi.c   | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index f77bdf5f5168..50af9861553b 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -272,10 +272,10 @@ static int cdn_dp_connector_get_modes(struct drm_connector *connector)
 		DRM_DEV_DEBUG_KMS(dp->dev, "got edid: width[%d] x height[%d]\n",
 				  edid->width_cm, edid->height_cm);
 
-		dp->sink_has_audio = drm_detect_monitor_audio(edid);
-
 		drm_connector_update_edid_property(connector, edid);
 		ret = drm_add_edid_modes(connector, edid);
+
+		dp->sink_has_audio = connector->display_info.has_audio;
 	}
 	mutex_unlock(&dp->lock);
 
diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 87b2243ea23e..fadaa795fb3d 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -564,10 +564,11 @@ static int inno_hdmi_connector_get_modes(struct drm_connector *connector)
 
 	edid = drm_get_edid(connector, hdmi->ddc);
 	if (edid) {
-		hdmi->hdmi_data.sink_has_audio = drm_detect_monitor_audio(edid);
 		drm_connector_update_edid_property(connector, edid);
 		ret = drm_add_edid_modes(connector, edid);
 		kfree(edid);
+
+		hdmi->hdmi_data.sink_has_audio = connector->display_info.has_audio;
 	}
 
 	return ret;
-- 
2.34.1

