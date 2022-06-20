Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA7A55116E
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 09:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 906E710E229;
	Mon, 20 Jun 2022 07:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E070410E229
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 07:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655709897; x=1687245897;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GKSBGkFzEo3TVBQ3cZBM13Df5pB43QFpSeCFiLRtMAY=;
 b=fg49ZrOBXSk3T82z5+OA98WGUCxtiM8Lr81w3LNrU3r5s/7N47AlGhCM
 J11yxarWKGBFKyxJhufZiql4+Gm8xjaorcpyWQzj5/HGtMFVam7H/bvcx
 tZjM21k6v5/9HIQarTnntmAf1VJNP74lmuelGyaj5yTxVLfr21TrlIvwc
 ZneWwEPa0YfNKHQVS65R4baJwJtRSuyMc02oCFPCvjRzFym98yxSuHXBJ
 o2WcJB2khMuvwaW1uzEK9bTP/qDsfOQD26ZbRCT436UOPz5c6tFWdBPF4
 KPeKhndsB4v8bNBqh/hSPXiPLlrOhbKFexY9pfjaL6U+Q5l8LnYFGwzRi g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="268545317"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="268545317"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 00:24:57 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="642986615"
Received: from gpetrea-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.249.41.172])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 00:24:54 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/4] drm/display: Add drm_luminance_range_info
Date: Mon, 20 Jun 2022 10:20:16 +0300
Message-Id: <20220620072019.2710652-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620072019.2710652-1-jouni.hogander@intel.com>
References: <20220620072019.2710652-1-jouni.hogander@intel.com>
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
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>,
 Manasi Navare <manasi.d.navare@intel.com>, Mika Kahola <mika.kahola@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add new data structure to store luminance range calculated using
data from EDID's static hdr metadata block. Add this new struct
as a part of drm_display_info struct.

Cc: Roman Li <roman.li@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Mika Kahola <mika.kahola@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Manasi Navare <manasi.d.navare@intel.com>
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 include/drm/drm_connector.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 3ac4bf87f257..7d8eeac6cc68 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -322,6 +322,22 @@ struct drm_monitor_range_info {
 	u8 max_vfreq;
 };
 
+/**
+ * struct drm_luminance_range_info - Panel's luminance range for
+ * &drm_display_info. Calculated using data in EDID
+ *
+ * This struct is used to store a luminance range supported by panel
+ * as calculated using data from EDID's static hdr metadata.
+ *
+ * @min_luminance: This is the min supported luminance value
+ *
+ * @max_luminance: This is the max supported luminance value
+ */
+struct drm_luminance_range_info {
+	u32 min_luminance;
+	u32 max_luminance;
+};
+
 /**
  * enum drm_privacy_screen_status - privacy screen status
  *
@@ -623,6 +639,11 @@ struct drm_display_info {
 	 */
 	struct drm_monitor_range_info monitor_range;
 
+	/**
+	 * @luminance_range: Luminance range supported by panel
+	 */
+	struct drm_luminance_range_info luminance_range;
+
 	/**
 	 * @mso_stream_count: eDP Multi-SST Operation (MSO) stream count from
 	 * the DisplayID VESA vendor block. 0 for conventional Single-Stream
-- 
2.25.1

