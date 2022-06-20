Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2C0551171
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 09:25:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D5610E486;
	Mon, 20 Jun 2022 07:25:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DAF310E486
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 07:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655709909; x=1687245909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z4Xo6ZdoUUDIxZO2KZ+KCvXOI2y6hS1HxcCiJO4WM7U=;
 b=TxZdNapG6Q+RwlpRToY2W7mnMMqnOT6aqh3l4oX5OFRhDJ8cmvT4RzxJ
 ajYmSnT+Db90OkUTjq/gAXrrETP3ZSkoaFZT7mvNGTT9hxkCrO2OtvPua
 i+yYY5NIk857/wJfH71aYE4LerD7zAN/2q9ntsUGpBHKPYvTJI/8MhF1F
 RqsHn10ZYePhImg7bsGRWhvQnXTT8BUuSthIvHP3mT+xZGd0GGzBB9vMJ
 JlfwRI9kwiwrpblmGOQQSvWHX92IdR1h7vW8AyjokPdE0iir/xhLihQKQ
 2tRG5+UONDNMQ1IEVBaAUf/fy6CWR2opf5algZhBRFkYM4ZutZe9qkz7r g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="268545346"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="268545346"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 00:25:09 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="642986889"
Received: from gpetrea-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.249.41.172])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 00:25:06 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/4] drm/i915: Use luminance range calculated during edid
 parsing
Date: Mon, 20 Jun 2022 10:20:19 +0300
Message-Id: <20220620072019.2710652-5-jouni.hogander@intel.com>
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Manasi Navare <manasi.d.navare@intel.com>,
 Mika Kahola <mika.kahola@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of using fixed 0 - 512 range use luminance range calculated
as a part of edid parsing. As a backup fall back to static 0 - 512.

v2: Use values calculated during edid parsing

Cc: Lyude Paul <lyude@redhat.com>
Cc: Mika Kahola <mika.kahola@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Manasi Navare <manasi.d.navare@intel.com>
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 .../drm/i915/display/intel_dp_aux_backlight.c   | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index c92d5bb2326a..b2666bd67701 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -276,8 +276,11 @@ intel_dp_aux_hdr_disable_backlight(const struct drm_connector_state *conn_state,
 static int
 intel_dp_aux_hdr_setup_backlight(struct intel_connector *connector, enum pipe pipe)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_connector *conn_base = &connector->base;
+	struct drm_i915_private *i915 = to_i915(conn_base->dev);
 	struct intel_panel *panel = &connector->panel;
+	struct drm_luminance_range_info *luminance_range =
+		&conn_base->display_info.luminance_range;
 	int ret;
 
 	if (panel->backlight.edp.intel.sdr_uses_aux) {
@@ -293,8 +296,16 @@ intel_dp_aux_hdr_setup_backlight(struct intel_connector *connector, enum pipe pi
 		}
 	}
 
-	panel->backlight.max = 512;
-	panel->backlight.min = 0;
+	if (!luminance_range->max_luminance) {
+		panel->backlight.max = 512;
+		panel->backlight.min = 0;
+	} else {
+		panel->backlight.max = luminance_range->max_luminance;
+		panel->backlight.min = luminance_range->min_luminance;
+	}
+
+	drm_dbg(&i915->drm, "Using range %d..%d\n", panel->backlight.min, panel->backlight.max);
+
 	panel->backlight.level = intel_dp_aux_hdr_get_backlight(connector, pipe);
 	panel->backlight.enabled = panel->backlight.level != 0;
 
-- 
2.25.1

