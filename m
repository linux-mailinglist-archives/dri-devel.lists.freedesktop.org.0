Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B28054E736A
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 13:26:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5943A10E706;
	Fri, 25 Mar 2022 12:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 306C110E70A;
 Fri, 25 Mar 2022 12:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648211181; x=1679747181;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qP9B2pbCJ9k6L1sfmXFXrnkLWv5tjDeVr3+EgFyAUJI=;
 b=PPlyjQi3SaSKNzxxUHEp0zYwhE4E/LJp3bw5XQcS+w0V+/ppb4PR8Pj9
 kcDd588PIQ5238Smy2lpBz3K9k9ydp+yw0sPzWsC8riijBP2c7ldAf1xg
 yVxxIGFoTeYrl8BwwXUeLwXbtazNidONMWo7Vu7XNgEchFBez9oitbHar
 yMmJEgdzmn0+wq3MTEl85tsw+fd17aXMH6Cq/mq17DW61Q/SZAcsbtfeQ
 Vt553k8Nf9/oH6OUWyfSGvvjngBL2rf29yxMFuiScyjyxDE9K97qB+YLs
 RS9pbbZHt2UIdjW+osu/qwcnuGEqsRAuPUwe0bTuMNxVFVEMAro7h6sKO w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10296"; a="283492651"
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="283492651"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 05:26:20 -0700
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="602036890"
Received: from avgorshk-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.35.183])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 05:26:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 9/9] drm/edid: add more general struct edid constness in the
 interfaces
Date: Fri, 25 Mar 2022 14:25:31 +0200
Message-Id: <3300df1a01b075c4d756c0ac258b2dab1f9363cd.1648210803.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1648210803.git.jani.nikula@intel.com>
References: <cover.1648210803.git.jani.nikula@intel.com>
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
index fae6f39897c8..a069c2ddb09d 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2150,7 +2150,7 @@ static u32 edid_extract_panel_id(const struct edid *edid)
 
 u32 drm_edid_get_panel_id(struct i2c_adapter *adapter)
 {
-	struct edid *edid;
+	const struct edid *edid;
 	u32 panel_id;
 
 	edid = drm_do_get_edid_base_block(NULL, drm_do_probe_ddc_edid, adapter);
@@ -3659,7 +3659,7 @@ static bool drm_valid_hdmi_vic(u8 vic)
 }
 
 static int
-add_alternate_cea_modes(struct drm_connector *connector, struct edid *edid)
+add_alternate_cea_modes(struct drm_connector *connector, const struct edid *edid)
 {
 	struct drm_device *dev = connector->dev;
 	struct drm_display_mode *mode, *tmp;
@@ -4340,7 +4340,7 @@ static void drm_parse_y420cmdb_bitmap(struct drm_connector *connector,
 }
 
 static int
-add_cea_modes(struct drm_connector *connector, struct edid *edid)
+add_cea_modes(struct drm_connector *connector, const struct edid *edid)
 {
 	const u8 *cea = drm_find_cea_extension(edid);
 	const u8 *db, *hdmi = NULL, *video = NULL;
@@ -4546,7 +4546,7 @@ static int get_monitor_name(const struct edid *edid, char name[13])
  * @bufsize: The size of the name buffer (should be at least 14 chars.)
  *
  */
-void drm_edid_get_monitor_name(struct edid *edid, char *name, int bufsize)
+void drm_edid_get_monitor_name(const struct edid *edid, char *name, int bufsize)
 {
 	int name_length;
 	char buf[13];
@@ -4580,7 +4580,8 @@ static void clear_eld(struct drm_connector *connector)
  * Fill the ELD (EDID-Like Data) buffer for passing to the audio driver. The
  * HDCP and Port_ID ELD fields are left for the graphics driver to fill in.
  */
-static void drm_edid_to_eld(struct drm_connector *connector, struct edid *edid)
+static void drm_edid_to_eld(struct drm_connector *connector,
+			    const struct edid *edid)
 {
 	uint8_t *eld = connector->eld;
 	const u8 *cea;
@@ -4676,7 +4677,7 @@ static void drm_edid_to_eld(struct drm_connector *connector, struct edid *edid)
  *
  * Return: The number of found SADs or negative number on error.
  */
-int drm_edid_to_sad(struct edid *edid, struct cea_sad **sads)
+int drm_edid_to_sad(const struct edid *edid, struct cea_sad **sads)
 {
 	int count = 0;
 	int i, start, end, dbl;
@@ -4738,7 +4739,7 @@ EXPORT_SYMBOL(drm_edid_to_sad);
  * Return: The number of found Speaker Allocation Blocks or negative number on
  * error.
  */
-int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb)
+int drm_edid_to_speaker_allocation(const struct edid *edid, u8 **sadb)
 {
 	int count = 0;
 	int i, start, end, dbl;
@@ -4833,7 +4834,7 @@ EXPORT_SYMBOL(drm_av_sync_delay);
  *
  * Return: True if the monitor is HDMI, false if not or unknown.
  */
-bool drm_detect_hdmi_monitor(struct edid *edid)
+bool drm_detect_hdmi_monitor(const struct edid *edid)
 {
 	const u8 *edid_ext;
 	int i;
@@ -4871,7 +4872,7 @@ EXPORT_SYMBOL(drm_detect_hdmi_monitor);
  *
  * Return: True if the monitor supports audio, false otherwise.
  */
-bool drm_detect_monitor_audio(struct edid *edid)
+bool drm_detect_monitor_audio(const struct edid *edid)
 {
 	const u8 *edid_ext;
 	int i, j;
@@ -5538,7 +5539,7 @@ static int add_displayid_detailed_1_modes(struct drm_connector *connector,
 }
 
 static int add_displayid_detailed_modes(struct drm_connector *connector,
-					struct edid *edid)
+					const struct edid *edid)
 {
 	const struct displayid_block *block;
 	struct displayid_iter iter;
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 144c495b99c4..48b1bf9c315a 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -372,8 +372,8 @@ struct drm_connector;
 struct drm_connector_state;
 struct drm_display_mode;
 
-int drm_edid_to_sad(struct edid *edid, struct cea_sad **sads);
-int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb);
+int drm_edid_to_sad(const struct edid *edid, struct cea_sad **sads);
+int drm_edid_to_speaker_allocation(const struct edid *edid, u8 **sadb);
 int drm_av_sync_delay(struct drm_connector *connector,
 		      const struct drm_display_mode *mode);
 
@@ -569,8 +569,8 @@ int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid);
 int drm_add_override_edid_modes(struct drm_connector *connector);
 
 u8 drm_match_cea_mode(const struct drm_display_mode *to_match);
-bool drm_detect_hdmi_monitor(struct edid *edid);
-bool drm_detect_monitor_audio(struct edid *edid);
+bool drm_detect_hdmi_monitor(const struct edid *edid);
+bool drm_detect_monitor_audio(const struct edid *edid);
 enum hdmi_quantization_range
 drm_default_rgb_quant_range(const struct drm_display_mode *mode);
 int drm_add_modes_noedid(struct drm_connector *connector,
@@ -582,7 +582,7 @@ int drm_edid_header_is_valid(const u8 *raw_edid);
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

