Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB9A7D7FC0
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 11:40:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB1510E799;
	Thu, 26 Oct 2023 09:40:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DEC210E799
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 09:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698313231; x=1729849231;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q0/pgbRpp4AkOpmvRdc/Vx3NV3Ri6J32D7DwtkW2AVw=;
 b=YmgWcEROxj/ZIFb5CkamB/zlCdwj1SVQlSG/DYrGp4WCKYmtSSRZJ3i6
 Aq1OjZRWiR2ivn3GpU652Q9j1rHagXAZVe6jjzzzjOX/BdfNgAmZPRjhJ
 XIF5Kzk9tsrDTnIvTEygxgRkLtGzT9dlm6f6w7Ip9ZyzeqLx2LbHgsWx9
 AKaA9zzkhOgyjZcoc1fURc+OOOyKUu9fwa6wnAp7QWfglRlqZt83/Lo/K
 VNXp2cGAGBfMFXe4O5VkyZVkB/F32pegIBSg+GedrXDvFcjc+lS0KB347
 yxQlzrhSXlvLewjxoVKz5/INvQvvg5Dn9KtJ1aGPgIai64nMhhiFNTOBR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="451737670"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; d="scan'208";a="451737670"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 02:40:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="829554608"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; d="scan'208";a="829554608"
Received: from tzirr-desk2.ger.corp.intel.com (HELO localhost) ([10.252.49.68])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 02:40:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 2/2] drm/bridge: switch to drm_bridge_read_edid()
Date: Thu, 26 Oct 2023 12:39:56 +0300
Message-Id: <7960b84e419569a44a0385b2f724c12eef8d82b7.1698312534.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1698312534.git.jani.nikula@intel.com>
References: <cover.1698312534.git.jani.nikula@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prefer using the struct drm_edid based functions.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_bridge_connector.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 8239ad43aed5..b7d7092aad9f 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -245,27 +245,27 @@ static int drm_bridge_connector_get_modes_edid(struct drm_connector *connector,
 					       struct drm_bridge *bridge)
 {
 	enum drm_connector_status status;
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 	int n;
 
 	status = drm_bridge_connector_detect(connector, false);
 	if (status != connector_status_connected)
 		goto no_edid;
 
-	edid = drm_bridge_get_edid(bridge, connector);
-	if (!drm_edid_is_valid(edid)) {
-		kfree(edid);
+	drm_edid = drm_bridge_edid_read(bridge, connector);
+	if (!drm_edid_valid(drm_edid)) {
+		drm_edid_free(drm_edid);
 		goto no_edid;
 	}
 
-	drm_connector_update_edid_property(connector, edid);
-	n = drm_add_edid_modes(connector, edid);
+	drm_edid_connector_update(connector, drm_edid);
+	n = drm_edid_connector_add_modes(connector);
 
-	kfree(edid);
+	drm_edid_free(drm_edid);
 	return n;
 
 no_edid:
-	drm_connector_update_edid_property(connector, NULL);
+	drm_edid_connector_update(connector, NULL);
 	return 0;
 }
 
-- 
2.39.2

