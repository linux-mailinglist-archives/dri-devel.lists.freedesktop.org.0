Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAB465D035
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 11:06:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 032AC10E539;
	Wed,  4 Jan 2023 10:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6417A10E539;
 Wed,  4 Jan 2023 10:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672826767; x=1704362767;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2cKw2wnc6eN7IZbF1gfvb1iIyTioFls1v+k6ern9UqU=;
 b=YbwyTSW8UKdnb8uhVlTPSOj6rcZpM7skfWmeJHmjLCMYyOvs6zbOAIwX
 dHX6yAXUCOqDmz0jyUnvUaWVrbY+ycGp8UEmEGvL08WmI/TxSUblqswnK
 halTF9mCX5J1blVYt6VQdt1mXmfo4wfm2Zz7HXqrfKvqaWSLkO9oP2lZ+
 iGFAShn85asCCbr5GzxB/A/5TK6PG2/oispjjSuyyaAQfr+nb/EvK1vLM
 aIwIqd1TnSEWimW+Lvf6lweQln5LmtFasTgrk+z6gQS/do6fFKJIGhLN/
 iQ5ywWjKjC0oZ2VcHhk8LrZLU3N8VFjH/NtZcWD69JoaGxHtxXdr/Xjg9 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="386333731"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; d="scan'208";a="386333731"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 02:06:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="983877051"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; d="scan'208";a="983877051"
Received: from mkabdel-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.25.63])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 02:06:04 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 05/22] drm/edid: use VIC in AVI infoframe if sink lists it
 in CTA VDB
Date: Wed,  4 Jan 2023 12:05:20 +0200
Message-Id: <775124fd07a5b7892e869becc3dd8dadb328ae5f.1672826282.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 William Tseng <william.tseng@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Apparently there are HDMI 1.4 compatible displays out there that support
VICs from specs later than CTA-861-D, i.e. VIC > 64, although HDMI 1.4
references CTA-861-D only.

We try to avoid using VICs from the later specs in the AVI infoframes to
avoid upsetting sinks that conform to earlier specs.

However, it seems reasonable to do this when the sink claims it supports
the VIC. With the pre-parsed list of VICs handy, this is now trivial.

References: https://gitlab.freedesktop.org/drm/intel/-/issues/6153
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: William Tseng <william.tseng@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 7f0386175230..3dfcd6450f10 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5864,6 +5864,22 @@ static void parse_cta_vdb(struct drm_connector *connector, const struct cea_db *
 	}
 }
 
+static bool cta_vdb_has_vic(const struct drm_connector *connector, u8 vic)
+{
+	const struct drm_display_info *info = &connector->display_info;
+	int i;
+
+	if (!vic || !info->vics)
+		return false;
+
+	for (i = 0; i < info->vics_len; i++) {
+		if (info->vics[i] == vic)
+			return true;
+	}
+
+	return false;
+}
+
 static void drm_parse_vcdb(struct drm_connector *connector, const u8 *db)
 {
 	struct drm_display_info *info = &connector->display_info;
@@ -6909,10 +6925,14 @@ static u8 drm_mode_cea_vic(const struct drm_connector *connector,
  *
  * HDMI 1.4 (CTA-861-D) VIC range: [1..64]
  * HDMI 2.0 (CTA-861-F) VIC range: [1..107]
+ *
+ * If the sink lists the VIC in CTA VDB, assume it's fine, regardless of HDMI
+ * version.
  */
 static u8 vic_for_avi_infoframe(const struct drm_connector *connector, u8 vic)
 {
-	if (!is_hdmi2_sink(connector) && vic > 64)
+	if (!is_hdmi2_sink(connector) && vic > 64 &&
+	    !cta_vdb_has_vic(connector, vic))
 		return 0;
 
 	return vic;
-- 
2.34.1

