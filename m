Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C46C5327FA
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 12:40:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2619B10F4E9;
	Tue, 24 May 2022 10:40:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D21110F4E3;
 Tue, 24 May 2022 10:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653388838; x=1684924838;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yOLwtg7V0fGTNSJXKbDoZ3vPRf3GeI4W6GhOQKlSsTQ=;
 b=Mew3fh1y/CS5/0IzC+bgYuPPUw+wr2eyRh/Bs+MQqy10+Sq03aVrO3J8
 m3W7iIgX04GYvgY4SHucFPpw4jsr8LZ/t66sxKvlLCIu+OAFbxyZPs10Z
 dP4WB5ao600f6GxX3gqEDw+4nmc5FuTXhDSZDL59jlCMxG083iQree9gW
 fl8FFNCQ9zuWC0g1IuOYxF7BHR+ZNbgeTCPSS2zT9GnLNaN7UyR0MToxT
 u9oEFlbbXNYvcf2XplkySelpM8YwXJgyKrGmLZOMSXA+VUEqFL69ZFA2b
 SvC0v6iCKnH5dJWpDOXfVQN+gIf2P/K49hN1voBNrAVxkmHxN6uOTkX75 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="334140511"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="334140511"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 03:40:37 -0700
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="745168614"
Received: from zychseba-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.136.104])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 03:40:35 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v1 07/13] drm/probe-helper: add .get_edid() callback
Date: Tue, 24 May 2022 13:39:29 +0300
Message-Id: <dcb83f9e1238d3ff0b90ed9a09409944fef47b29.1653381821.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1653381821.git.jani.nikula@intel.com>
References: <cover.1653381821.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, David Airlie <airlied@linux.ie>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a hook for custom .get_edid() when .get_modes() is not set.

Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_probe_helper.c       | 11 +++++++++--
 include/drm/drm_modeset_helper_vtables.h | 21 ++++++++++++++++++---
 2 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 9df17f0ae225..42481dc9e6db 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -361,12 +361,19 @@ static int drm_helper_probe_get_modes(struct drm_connector *connector)
 	int count;
 
 	if (connector_funcs->get_modes) {
+		/* No point in having both set */
+		drm_WARN_ON_ONCE(connector->dev, connector_funcs->get_edid);
+
 		count = connector_funcs->get_modes(connector);
 	} else {
 		const struct drm_edid *drm_edid;
 
-		/* Note: This requires connector->ddc is set */
-		drm_edid = drm_edid_read(connector);
+		if (connector_funcs->get_edid) {
+			drm_edid = connector_funcs->get_edid(connector);
+		} else {
+			/* Note: This requires connector->ddc is set */
+			drm_edid = drm_edid_read(connector);
+		}
 
 		/* Update modes etc. from the EDID */
 		count = drm_edid_connector_update(connector, drm_edid);
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index b4402bc64e57..f4defbdf1768 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -49,6 +49,7 @@
  */
 
 enum mode_set_atomic;
+struct drm_edid;
 struct drm_writeback_connector;
 struct drm_writeback_job;
 
@@ -894,9 +895,10 @@ struct drm_connector_helper_funcs {
 	 * libraries always call this with the &drm_mode_config.connection_mutex
 	 * held. Because of this it's safe to inspect &drm_connector->state.
 	 *
-	 * This callback is optional. By default, it reads the EDID using
-	 * drm_edid_read() and updates the connector display info, modes, and
-	 * properties using drm_edid_connector_update().
+	 * This callback is optional. By default, it reads the EDID using the
+	 * .get_edid() callback if set, drm_edid_read() otherwise, and updates
+	 * the connector display info, modes, and properties using
+	 * drm_edid_connector_update().
 	 *
 	 * RETURNS:
 	 *
@@ -904,6 +906,19 @@ struct drm_connector_helper_funcs {
 	 */
 	int (*get_modes)(struct drm_connector *connector);
 
+	/**
+	 * @get_edid:
+	 *
+	 * If the get_modes() callback is not set, this function gets called to
+	 * retrieve the EDID. This callback is optional. By default,
+	 * drm_edid_read() is used.
+	 *
+	 * This function must return a copy of the EDID; the returned pointer
+	 * will be freed using drm_edid_free(). Usually it would be a copy of a
+	 * previously cached EDID.
+	 */
+	const struct drm_edid *(*get_edid)(struct drm_connector *connector);
+
 	/**
 	 * @detect_ctx:
 	 *
-- 
2.30.2

