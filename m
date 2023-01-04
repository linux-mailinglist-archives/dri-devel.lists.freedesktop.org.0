Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5226C65D051
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 11:07:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6347510E55C;
	Wed,  4 Jan 2023 10:07:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17DA110E55C;
 Wed,  4 Jan 2023 10:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672826820; x=1704362820;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8Ghhdtk1YGMekvulaNikahnFop2Q+k7EhmnX2eZLpfw=;
 b=VVIXqudCy4/786YPNIfGZ4Yl/e1TOpMTCA5nJNs0urt9OjLSynivmJI2
 h3UIyOvyPvEoajye2EDROvE/QBFT1BR4PaGRUtAWy+hgZTgx0DaC0PcUn
 gV6CnAbKaZpyYlIxVS8WKLWC66NJvsIi79YXOGXHxNiioWqlZ29fykA+6
 n+DMS2y7X39jo3n2pnLRkrvrHo0optC/CGL7Gp4t5fox/+/0lZI8ibLxX
 fC7R/ykxHVKFjne1PLhxYnTiVtxiLMuiDcO1HL1jVOqW9s4rK6MXwtgvF
 QnHxY2jBgek5wRmXauKyG5WNfdi/gyaRWypPNoPfv2C4zK1XUa+xR698X Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="408156999"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; d="scan'208";a="408156999"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 02:06:59 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="723590940"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; d="scan'208";a="723590940"
Received: from mkabdel-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.25.63])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 02:06:57 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 18/22] drm/edid: remove redundant
 _drm_connector_update_edid_property()
Date: Wed,  4 Jan 2023 12:05:33 +0200
Message-Id: <8a3bd5efa7faab2f4d00e8e00cd8d1b680443a2e.1672826282.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1672826282.git.jani.nikula@intel.com>
References: <cover.1672826282.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Realize that drm_edid_connector_update() and
_drm_connector_update_edid_property() are now the same thing. Drop the
latter.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 21 +--------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index a64c0807e97f..ae50f533fea3 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6810,24 +6810,6 @@ int drm_edid_connector_add_modes(struct drm_connector *connector)
 }
 EXPORT_SYMBOL(drm_edid_connector_add_modes);
 
-static int _drm_connector_update_edid_property(struct drm_connector *connector,
-					       const struct drm_edid *drm_edid)
-{
-	/*
-	 * Set the display info, using edid if available, otherwise resetting
-	 * the values to defaults. This duplicates the work done in
-	 * drm_add_edid_modes, but that function is not consistently called
-	 * before this one in all drivers and the computation is cheap enough
-	 * that it seems better to duplicate it rather than attempt to ensure
-	 * some arbitrary ordering of calls.
-	 */
-	update_display_info(connector, drm_edid);
-
-	_drm_update_tile_info(connector, drm_edid);
-
-	return _drm_edid_connector_property_update(connector, drm_edid);
-}
-
 /**
  * drm_connector_update_edid_property - update the edid property of a connector
  * @connector: drm connector
@@ -6849,8 +6831,7 @@ int drm_connector_update_edid_property(struct drm_connector *connector,
 {
 	struct drm_edid drm_edid;
 
-	return _drm_connector_update_edid_property(connector,
-						   drm_edid_legacy_init(&drm_edid, edid));
+	return drm_edid_connector_update(connector, drm_edid_legacy_init(&drm_edid, edid));
 }
 EXPORT_SYMBOL(drm_connector_update_edid_property);
 
-- 
2.34.1

