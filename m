Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D68519931
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 10:04:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FBDC10F45E;
	Wed,  4 May 2022 08:04:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A46910F45E
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 08:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651651482; x=1683187482;
 h=resent-to:resent-from:resent-date:resent-message-id:
 mime-version:from:to:cc:subject:date:message-id:
 in-reply-to:references:content-transfer-encoding;
 bh=JUr6nmaPHYa013vyjZPm1z/CYrohH/6B23kGD6SxEng=;
 b=MKgF2A5eL6Y0456na/0OPuL96u3VytiRTEn7jGSYYOh6DrUCt/3jkHUV
 Gt57+e70w8nX1tuze6IPoikwo96cu6XVrQ064NjM0D8k+QCoO/je6ghiZ
 abyWnN4e2Obu/dmQnK8i4/gb6+VdRMk667NHzelL5JgOzVXpYH9bwCzrw
 s0h0/6Sikqfa8dU6qGSY9knXx5/r58dYDyE1oi1L2/3Dkg7pbgYagamQX
 b38/P4NCH5uEuDFY3vFZJ6Y1ph01W1YC5zF9valEl/TbpZoAkhw//+iJj
 PVJuGKjNRMvxlenFZonRE/ThCBghuZzsdYsAEoPAylwVGlqvJmDLvoCm1 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="267293534"
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="267293534"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:04:40 -0700
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="664372695"
Received: from adobrowo-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.156.70])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:04:38 -0700
Resent-Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7,
 02160 Espoo
Resent-To: dri-devel@lists.freedesktop.org
Resent-From: Jani Nikula <jani.nikula@intel.com>
Resent-Date: Wed, 04 May 2022 11:04:35 +0300
Resent-Message-ID: <87pmktn2p8.fsf@intel.com>
MIME-Version: 1.0
Received: from outlook.iglb.intel.com [163.33.184.135]
 by jnikula-mobl4.ger.corp.intel.com with IMAP (fetchmail-6.4.23)
 for <jani@localhost> (single-drop); Tue, 03 May 2022 12:28:35 +0300 (EEST)
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Mailbox Transport; Tue, 3 May 2022 02:25:46 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 3 May 2022 02:25:45 -0700
Received: from orsmga004.jf.intel.com (10.7.209.38) by
 fmsmsx609.amr.corp.intel.com (10.18.84.219) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 3 May 2022 02:25:45 -0700
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="691751854"
Received: from jasinski-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.133.126])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 02:25:43 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v2 19/20] drm/edid: skip CTA extension scan in
 drm_edid_to_eld() just for CTA rev
Date: Tue, 3 May 2022 12:24:04 +0300
Message-ID: <163ebbfd765066acbfc267256fb3b67fc711a78d.1651569697.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1651569697.git.jani.nikula@intel.com>
References: <cover.1651569697.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
X-MS-Exchange-Organization-Network-Message-Id: 6225b2a9-5f08-479c-6880-08da2ce6e710
X-MS-Exchange-Organization-AuthSource: fmsmsx609.amr.corp.intel.com
X-MS-Exchange-Organization-AuthAs: Internal
X-MS-Exchange-Organization-AuthMechanism: 10
X-MS-Exchange-Organization-AVStamp-Enterprise: 1.0
X-MS-Exchange-Organization-SCL: -1
X-MS-Exchange-Transport-EndToEndLatency: 00:00:00.4611228
X-MS-Exchange-Processed-By-BccFoldering: 15.01.2308.027
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
Cc: jani.nikula@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DisplayID CTA data block version does not necessarily match the CTA
revision. Simplify by postponing drm_edid_to_eld() slightly, and reusing
the CTA revision extracted by drm_parse_cea_ext().

By not bailing out early in drm_edid_to_eld() we may end up filling
meaningless data to the ELD. However, the main decision for audio is not
the ELD, but rather drm_detect_monitor_audio() called by drivers.

(Arguably a future cleanup could do that in drm_add_edid_modes() and
cache the result in the connector.)

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 41f24f4c2d23..391c91199aa2 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4863,10 +4863,10 @@ static void clear_eld(struct drm_connector *connector)
 static void drm_edid_to_eld(struct drm_connector *connector,
 			    const struct edid *edid)
 {
+	const struct drm_display_info *info = &connector->display_info;
 	const struct cea_db *db;
 	struct cea_db_iter iter;
 	uint8_t *eld = connector->eld;
-	const u8 *cea;
 	int total_sad_count = 0;
 	int mnl;
 
@@ -4875,16 +4875,10 @@ static void drm_edid_to_eld(struct drm_connector *connector,
 	if (!edid)
 		return;
 
-	cea = drm_find_cea_extension(edid);
-	if (!cea) {
-		DRM_DEBUG_KMS("ELD: no CEA Extension found\n");
-		return;
-	}
-
 	mnl = get_monitor_name(edid, &eld[DRM_ELD_MONITOR_NAME_STRING]);
 	DRM_DEBUG_KMS("ELD monitor %s\n", &eld[DRM_ELD_MONITOR_NAME_STRING]);
 
-	eld[DRM_ELD_CEA_EDID_VER_MNL] = cea[1] << DRM_ELD_CEA_EDID_VER_SHIFT;
+	eld[DRM_ELD_CEA_EDID_VER_MNL] = info->cea_rev << DRM_ELD_CEA_EDID_VER_SHIFT;
 	eld[DRM_ELD_CEA_EDID_VER_MNL] |= mnl;
 
 	eld[DRM_ELD_VER] = DRM_ELD_VER_CEA861D;
@@ -5824,8 +5818,6 @@ static int drm_edid_connector_update(struct drm_connector *connector,
 		return 0;
 	}
 
-	drm_edid_to_eld(connector, edid);
-
 	/*
 	 * CEA-861-F adds ycbcr capability map block, for HDMI 2.0 sinks.
 	 * To avoid multiple parsing of same block, lets parse that map
@@ -5833,6 +5825,9 @@ static int drm_edid_connector_update(struct drm_connector *connector,
 	 */
 	quirks = drm_add_display_info(connector, edid);
 
+	/* Depends on info->cea_rev set by drm_add_display_info() above */
+	drm_edid_to_eld(connector, edid);
+
 	/*
 	 * EDID spec says modes should be preferred in this order:
 	 * - preferred detailed mode
-- 
2.30.2

