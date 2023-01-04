Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0510665D031
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 11:06:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D9910E53A;
	Wed,  4 Jan 2023 10:06:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 333F610E537;
 Wed,  4 Jan 2023 10:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672826758; x=1704362758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Oo/wnnM1I6Opg3PXM/W7hKdP5lQdKOv3fui4po9W1uM=;
 b=BaQ79mtlcjf0kOrWe/hoirX2t8XwbJG8RK/7uhnfj8XCfvW+AEOSpOpZ
 lxxgx9hemjVJfFBXVlIuIi8EQVS1lXXpAWBqml38OrYrWr8MALXf6skid
 6XbKpkLPV87JOU47iPlruGG5Fv1ESBUA0KnLT9QRSMnvEj2gez8IVIeuy
 2+NP/jKVZOsUbb5C5Ymk57faEqtADH29A6Py2xjfyjR5ImBki/mJrA8g5
 FcWZgkZibuvTQAckgsLtN5nWOtRDUs8GvBRf3JbMTdJ+tHiL9lsuf1sb8
 wTQkW9jslYrOTmXsP2HUPovXPIPeMWHjivVGfwkMZvPNeF6NNAa23JNtW A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="386333702"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; d="scan'208";a="386333702"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 02:05:57 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="983877022"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; d="scan'208";a="983877022"
Received: from mkabdel-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.25.63])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 02:05:56 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 03/22] drm/edid: parse VICs from CTA VDB early
Date: Wed,  4 Jan 2023 12:05:18 +0200
Message-Id: <7989b2b37837be68953c5d20afd3e93762bfd626.1672826282.git.jani.nikula@intel.com>
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

A number of places need access to the VICs. Just parse them early for
easy access. Gracefully handle multiple CTA VDBs. It's unlikely to have
more than one, but the CTA-861 references "Video Data Block(s)", so err
on the safe side.

Start parsing them now, convert users in follow-up to have fewer moving
parts in one go.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_connector.c |  1 +
 drivers/gpu/drm/drm_edid.c      | 36 +++++++++++++++++++++++++++++++++
 include/drm/drm_connector.h     | 10 +++++++++
 3 files changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 8d92777e57dd..21b3df75ab8c 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -565,6 +565,7 @@ void drm_connector_cleanup(struct drm_connector *connector)
 	ida_free(&dev->mode_config.connector_ida, connector->index);
 
 	kfree(connector->display_info.bus_formats);
+	kfree(connector->display_info.vics);
 	drm_mode_object_unregister(dev, &connector->base);
 	kfree(connector->name);
 	connector->name = NULL;
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index b94adb9bbefb..90846dc69061 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5862,6 +5862,36 @@ drm_default_rgb_quant_range(const struct drm_display_mode *mode)
 }
 EXPORT_SYMBOL(drm_default_rgb_quant_range);
 
+/* CTA-861 Video Data Block (CTA VDB) */
+static void parse_cta_vdb(struct drm_connector *connector, const struct cea_db *db)
+{
+	struct drm_display_info *info = &connector->display_info;
+	int i, vic_index, len = cea_db_payload_len(db);
+	const u8 *svds = cea_db_data(db);
+	u8 *vics;
+
+	if (!len)
+		return;
+
+	/* Gracefully handle multiple VDBs, however unlikely that is */
+	vics = krealloc(info->vics, info->vics_len + len, GFP_KERNEL);
+	if (!vics)
+		return;
+
+	vic_index = info->vics_len;
+	info->vics_len += len;
+	info->vics = vics;
+
+	for (i = 0; i < len; i++) {
+		u8 vic = svd_to_vic(svds[i]);
+
+		if (!drm_valid_cea_vic(vic))
+			vic = 0;
+
+		info->vics[vic_index++] = vic;
+	}
+}
+
 static void drm_parse_vcdb(struct drm_connector *connector, const u8 *db)
 {
 	struct drm_display_info *info = &connector->display_info;
@@ -6205,6 +6235,8 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 			drm_parse_vcdb(connector, data);
 		else if (cea_db_is_hdmi_hdr_metadata_block(db))
 			drm_parse_hdr_metadata_block(connector, data);
+		else if (cea_db_tag(db) == CTA_DB_VIDEO)
+			parse_cta_vdb(connector, db);
 	}
 	cea_db_iter_end(&iter);
 }
@@ -6372,6 +6404,10 @@ static void drm_reset_display_info(struct drm_connector *connector)
 	info->mso_stream_count = 0;
 	info->mso_pixel_overlap = 0;
 	info->max_dsc_bpp = 0;
+
+	kfree(info->vics);
+	info->vics = NULL;
+	info->vics_len = 0;
 }
 
 static u32 update_display_info(struct drm_connector *connector,
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 9037f1317aee..d97ed06d5837 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -721,6 +721,16 @@ struct drm_display_info {
 	 * monitor's default value is used instead.
 	 */
 	u32 max_dsc_bpp;
+
+	/**
+	 * @vics: Array of vics_len VICs. Internal to EDID parsing.
+	 */
+	u8 *vics;
+
+	/**
+	 * @vics_len: Number of elements in vics. Internal to EDID parsing.
+	 */
+	int vics_len;
 };
 
 int drm_display_info_set_bus_formats(struct drm_display_info *info,
-- 
2.34.1

