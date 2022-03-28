Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C10C84E9107
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 11:18:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6243A10EBEB;
	Mon, 28 Mar 2022 09:18:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1BFE10EBB6;
 Mon, 28 Mar 2022 09:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648459106; x=1679995106;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U5eI4u1D+0DhKWd1tvpzwvpi060icjZPwKJUqtmC3n8=;
 b=dSUh/W2Q9hoWkvD4wqqcizhuRRTd7v/vgHbPhxHI5scxIq9TO4R7OQBD
 UyoOkThf71SoU0Qdqmr8ZQyNTvpDF0dlyKp2M2soNJPVnU1wRiLBbAzQL
 OUFX4whx5EBl+6bD6OxJ/hyTneZymXb8CxNo/LXFqjED1F2xiYfnpaXv9
 io6Y+pU9ITYe+EV4io4BMKCn8sL7iGFlFkUb9bWAWurl6cV0uWiy1ppCv
 3Aw3wkvomqxIl44SC0lh3G2sRZUke2d+rdnO+Fvekbrzx4UzugxBO/SUK
 RimM2GBYUzx5quy/VPAb0wcn8T9+dFBIHHmT2a4OU5RY8u4CKh9a9lza1 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10299"; a="319655844"
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="319655844"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 02:18:25 -0700
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="617721951"
Received: from aysivtso-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.62.56])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 02:18:23 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 11/11] drm/edid: add more general struct edid constness in
 the interfaces
Date: Mon, 28 Mar 2022 12:17:25 +0300
Message-Id: <db34a607afb05802c882a437bb1183174ba0985e.1648458971.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1648458971.git.jani.nikula@intel.com>
References: <cover.1648458971.git.jani.nikula@intel.com>
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

With this, the remaining non-const parts are the ones that actually
modify the EDID, for example to fix corrupt EDID.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 21 +++++++++++----------
 include/drm/drm_edid.h     | 10 +++++-----
 2 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 0c4b95fb6bd9..114ccc712c71 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2150,7 +2150,7 @@ static u32 edid_extract_panel_id(const struct edid *edid)
 
 u32 drm_edid_get_panel_id(struct i2c_adapter *adapter)
 {
-	struct edid *edid;
+	const struct edid *edid;
 	u32 panel_id;
 
 	edid = drm_do_get_edid_base_block(NULL, drm_do_probe_ddc_edid, adapter);
@@ -3670,7 +3670,7 @@ static bool drm_valid_hdmi_vic(u8 vic)
 }
 
 static int
-add_alternate_cea_modes(struct drm_connector *connector, struct edid *edid)
+add_alternate_cea_modes(struct drm_connector *connector, const struct edid *edid)
 {
 	struct drm_device *dev = connector->dev;
 	struct drm_display_mode *mode, *tmp;
@@ -4351,7 +4351,7 @@ static void drm_parse_y420cmdb_bitmap(struct drm_connector *connector,
 }
 
 static int
-add_cea_modes(struct drm_connector *connector, struct edid *edid)
+add_cea_modes(struct drm_connector *connector, const struct edid *edid)
 {
 	const u8 *cea = drm_find_cea_extension(edid);
 	const u8 *db, *hdmi = NULL, *video = NULL;
@@ -4557,7 +4557,7 @@ static int get_monitor_name(const struct edid *edid, char name[13])
  * @bufsize: The size of the name buffer (should be at least 14 chars.)
  *
  */
-void drm_edid_get_monitor_name(struct edid *edid, char *name, int bufsize)
+void drm_edid_get_monitor_name(const struct edid *edid, char *name, int bufsize)
 {
 	int name_length;
 	char buf[13];
@@ -4591,7 +4591,8 @@ static void clear_eld(struct drm_connector *connector)
  * Fill the ELD (EDID-Like Data) buffer for passing to the audio driver. The
  * HDCP and Port_ID ELD fields are left for the graphics driver to fill in.
  */
-static void drm_edid_to_eld(struct drm_connector *connector, struct edid *edid)
+static void drm_edid_to_eld(struct drm_connector *connector,
+			    const struct edid *edid)
 {
 	uint8_t *eld = connector->eld;
 	const u8 *cea;
@@ -4687,7 +4688,7 @@ static void drm_edid_to_eld(struct drm_connector *connector, struct edid *edid)
  *
  * Return: The number of found SADs or negative number on error.
  */
-int drm_edid_to_sad(struct edid *edid, struct cea_sad **sads)
+int drm_edid_to_sad(const struct edid *edid, struct cea_sad **sads)
 {
 	int count = 0;
 	int i, start, end, dbl;
@@ -4749,7 +4750,7 @@ EXPORT_SYMBOL(drm_edid_to_sad);
  * Return: The number of found Speaker Allocation Blocks or negative number on
  * error.
  */
-int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb)
+int drm_edid_to_speaker_allocation(const struct edid *edid, u8 **sadb)
 {
 	int count = 0;
 	int i, start, end, dbl;
@@ -4844,7 +4845,7 @@ EXPORT_SYMBOL(drm_av_sync_delay);
  *
  * Return: True if the monitor is HDMI, false if not or unknown.
  */
-bool drm_detect_hdmi_monitor(struct edid *edid)
+bool drm_detect_hdmi_monitor(const struct edid *edid)
 {
 	const u8 *edid_ext;
 	int i;
@@ -4882,7 +4883,7 @@ EXPORT_SYMBOL(drm_detect_hdmi_monitor);
  *
  * Return: True if the monitor supports audio, false otherwise.
  */
-bool drm_detect_monitor_audio(struct edid *edid)
+bool drm_detect_monitor_audio(const struct edid *edid)
 {
 	const u8 *edid_ext;
 	int i, j;
@@ -5549,7 +5550,7 @@ static int add_displayid_detailed_1_modes(struct drm_connector *connector,
 }
 
 static int add_displayid_detailed_modes(struct drm_connector *connector,
-					struct edid *edid)
+					const struct edid *edid)
 {
 	const struct displayid_block *block;
 	struct displayid_iter iter;
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 8e322ef173a8..5fe6e302a81f 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -373,8 +373,8 @@ struct drm_connector;
 struct drm_connector_state;
 struct drm_display_mode;
 
-int drm_edid_to_sad(struct edid *edid, struct cea_sad **sads);
-int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb);
+int drm_edid_to_sad(const struct edid *edid, struct cea_sad **sads);
+int drm_edid_to_speaker_allocation(const struct edid *edid, u8 **sadb);
 int drm_av_sync_delay(struct drm_connector *connector,
 		      const struct drm_display_mode *mode);
 
@@ -570,8 +570,8 @@ int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid);
 int drm_add_override_edid_modes(struct drm_connector *connector);
 
 u8 drm_match_cea_mode(const struct drm_display_mode *to_match);
-bool drm_detect_hdmi_monitor(struct edid *edid);
-bool drm_detect_monitor_audio(struct edid *edid);
+bool drm_detect_hdmi_monitor(const struct edid *edid);
+bool drm_detect_monitor_audio(const struct edid *edid);
 enum hdmi_quantization_range
 drm_default_rgb_quant_range(const struct drm_display_mode *mode);
 int drm_add_modes_noedid(struct drm_connector *connector,
@@ -583,7 +583,7 @@ int drm_edid_header_is_valid(const u8 *raw_edid);
 bool drm_edid_block_valid(u8 *raw_edid, int block, bool print_bad_edid,
 			  bool *edid_corrupt);
 bool drm_edid_is_valid(struct edid *edid);
-void drm_edid_get_monitor_name(struct edid *edid, char *name,
+void drm_edid_get_monitor_name(const struct edid *edid, char *name,
 			       int buflen);
 struct drm_display_mode *drm_mode_find_dmt(struct drm_device *dev,
 					   int hsize, int vsize, int fresh,
-- 
2.30.2

