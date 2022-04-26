Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BA550FD09
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 14:31:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A6710E1FC;
	Tue, 26 Apr 2022 12:31:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE3E10E1FC
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 12:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650976269; x=1682512269;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3/ul4D1NwEgugOvP7lKzezb80lJFALJ/5t5pO5CRNkY=;
 b=XSGCH7P3SH6bYRjq2WKo7vvdUCMM/GxhKhAq3KbVXLJQzwYbsYOH8aE/
 Kb5h10W2fX4oIy72aQWoopdpvtavjOCUtBv5yb7V7PoN8dj5maOXiJFDG
 1iwf6ZfXOc6OFSc0C0TeWO2t+7F2ImtF69mq3vlo82sYshf8b+CgTRMbH
 7qDP1QxmsuxAqH7LKDbjSoYOAL2pGiKUKqmw7+297W4PexXnj6oU8iY00
 sWylRJ2D1Luh+JyNvnpmOIk8Qo5JbQurc3QpnlhoHIhdFlks1TroluDlB
 PI1t+z3Jd+DNhf2GTnHhcljQ/o5Ty6vOuiVx3Wtq81DruSu5uuRIlOlz9 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="264405588"
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="264405588"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 05:31:08 -0700
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="558287504"
Received: from pbasx-mobl2.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.32.62])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 05:31:06 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm: New function to get luminance range based on static
 hdr metadata
Date: Tue, 26 Apr 2022 15:30:42 +0300
Message-Id: <20220426123044.320415-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426123044.320415-1-jouni.hogander@intel.com>
References: <20220426123044.320415-1-jouni.hogander@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Mika Kahola <mika.kahola@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Split luminance min/max calculation using static hdr metadata from
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:update_connector_ext_caps
into drm/drm_edid.c.

Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Mika Kahola <mika.kahola@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 55 ++++++++++++++++++++++++++++++++++++++
 include/drm/drm_edid.h     |  4 +++
 2 files changed, 59 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 7a8482b75071..1cb886debbbe 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4005,6 +4005,61 @@ drm_display_mode_from_cea_vic(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_display_mode_from_cea_vic);
 
+/**
+ * drm_luminance_range_from_static_hdr_metadata() - luminance range from static hdr
+ * metadata
+ * @connector: connector we're calculating for
+ * @min: Calculated min value
+ * @max: Calculated max value
+ *
+ * Calculates backlight min and max as described in CTA-861-G
+ *
+ * Returns: True when calculation succeeds.
+ */
+bool
+drm_luminance_range_from_static_hdr_metadata(struct drm_connector *connector,
+					     u32 *min, u32 *max)
+{
+	struct hdr_sink_metadata *hdr_metadata = &connector->hdr_sink_metadata;
+	static const u8 pre_computed_values[] = {
+		50, 51, 52, 53, 55, 56, 57, 58, 59, 61, 62, 63, 65, 66, 68, 69,
+		71, 72, 74, 75, 77, 79, 81, 82, 84, 86, 88, 90, 92, 94, 96, 98};
+	u32 min_cll, max_cll, q, r;
+
+	if (!(hdr_metadata->hdmi_type1.metadata_type &
+	      BIT(HDMI_STATIC_METADATA_TYPE1)))
+		return false;
+
+	max_cll = hdr_metadata->hdmi_type1.max_cll;
+	min_cll = hdr_metadata->hdmi_type1.min_cll;
+
+	/* From the specification (CTA-861-G), for calculating the maximum
+	 * luminance we need to use:
+	 *	Luminance = 50*2**(CV/32)
+	 * Where CV is a one-byte value.
+	 * For calculating this expression we may need float point precision;
+	 * to avoid this complexity level, we take advantage that CV is divided
+	 * by a constant. From the Euclids division algorithm, we know that CV
+	 * can be written as: CV = 32*q + r. Next, we replace CV in the
+	 * Luminance expression and get 50*(2**q)*(2**(r/32)), hence we just
+	 * need to pre-compute the value of r/32. For pre-computing the values
+	 * We just used the following Ruby line:
+	 *	(0...32).each {|cv| puts (50*2**(cv/32.0)).round}
+	 * The results of the above expressions can be verified at
+	 * pre_computed_values.
+	 */
+	q = max_cll >> 5;
+	r = max_cll % 32;
+	*max = (1 << q) * pre_computed_values[r];
+
+	/* min luminance: maxLum * (CV/255)^2 / 100 */
+	q = DIV_ROUND_CLOSEST(min_cll, 255);
+	*min = *max * DIV_ROUND_CLOSEST((q * q), 100);
+
+	return true;
+}
+EXPORT_SYMBOL(drm_luminance_range_from_static_hdr_metadata);
+
 static int
 do_cea_modes(struct drm_connector *connector, const u8 *db, u8 len)
 {
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index c3204a58fb09..63e441c84d72 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -406,6 +406,10 @@ drm_hdmi_avi_infoframe_quant_range(struct hdmi_avi_infoframe *frame,
 				   const struct drm_display_mode *mode,
 				   enum hdmi_quantization_range rgb_quant_range);
 
+bool
+drm_luminance_range_from_static_hdr_metadata(struct drm_connector *connector,
+					     u32 *min, u32 *max);
+
 /**
  * drm_eld_mnl - Get ELD monitor name length in bytes.
  * @eld: pointer to an eld memory structure with mnl set
-- 
2.25.1

