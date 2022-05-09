Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A91D151FBDF
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 14:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED4710EE45;
	Mon,  9 May 2022 12:03:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A363D10EE35;
 Mon,  9 May 2022 12:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652097815; x=1683633815;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=82X9mfDtRVWQVamwSCwdjYtoVRrvsVNtYWlh6IX24s0=;
 b=KxAHqyogtf61H8FSPeoVUddV7CZJCr0opFk4Yq6iyEseNH729H6w1RwC
 cGB2jL/tafJXUhHWsYTIAemehCmgE5TiLCsFyORoEN2yvz9XwpiUpQBGj
 sVlx4inQ52zMvuA85BhWzEXNIGQjTwp6AIdkIx9Qxr33guFNfHmo8RLjh
 PjXvkrq/xysNkR5G1uyP8qQL2p4KHOnc6e/VaNrmMtkV1HOGBH9Z99gM+
 1Cs00RslRGmKJBaNuR5CAn1bL9uSM4K1yMlkrDwWsFNmFhinvXKoFU/38
 AV8oDXr05JRUWIdE4xH/kbTbjwTzekWDhdyWYDBUEdxeyU6A7ELEVghQz Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="355456514"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="355456514"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 05:03:35 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="592054694"
Received: from csawicki-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.129.3])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 05:03:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 01/25] drm/edid: use else-if in CTA extension parsing
Date: Mon,  9 May 2022 15:03:00 +0300
Message-Id: <3a7ba2217134b0ab4c4c72e4333231a4e0616e88.1652097712.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1652097712.git.jani.nikula@intel.com>
References: <cover.1652097712.git.jani.nikula@intel.com>
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

Only one of the conditions can be true.

Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 47d121e99201..efc1999b9573 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5473,16 +5473,16 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 
 		if (cea_db_is_hdmi_vsdb(db))
 			drm_parse_hdmi_vsdb_video(connector, data);
-		if (cea_db_is_hdmi_forum_vsdb(db) ||
-		    cea_db_is_hdmi_forum_scdb(db))
+		else if (cea_db_is_hdmi_forum_vsdb(db) ||
+			 cea_db_is_hdmi_forum_scdb(db))
 			drm_parse_hdmi_forum_scds(connector, data);
-		if (cea_db_is_microsoft_vsdb(db))
+		else if (cea_db_is_microsoft_vsdb(db))
 			drm_parse_microsoft_vsdb(connector, data);
-		if (cea_db_is_y420cmdb(db))
+		else if (cea_db_is_y420cmdb(db))
 			drm_parse_y420cmdb_bitmap(connector, data);
-		if (cea_db_is_vcdb(db))
+		else if (cea_db_is_vcdb(db))
 			drm_parse_vcdb(connector, data);
-		if (cea_db_is_hdmi_hdr_metadata_block(db))
+		else if (cea_db_is_hdmi_hdr_metadata_block(db))
 			drm_parse_hdr_metadata_block(connector, data);
 	}
 	cea_db_iter_end(&iter);
-- 
2.30.2

