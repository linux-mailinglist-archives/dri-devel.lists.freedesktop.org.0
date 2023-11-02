Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD9D7DF5F4
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 16:13:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45E0010E8F2;
	Thu,  2 Nov 2023 15:12:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A913410E90D;
 Thu,  2 Nov 2023 15:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698937960; x=1730473960;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OjtX56iRe2R3p5yMpkS5TZ75eagAFRwkxp7gUYAmyeg=;
 b=hPsRLFWXOfJUCptHRQ60OYwE2ppgnGsyKQOfRVf1c7di+HeLHsOdNWUP
 srIEK2AXs7b0xGoanRSQaomqx8m5+9UO4J/kOfkdcYYfJ0HbniC8bGSIV
 tGOMz+ie+RA6IVXw/cbM3UT/fH89QexduBinKu+QP1Nr1U8CoWh6wtZqA
 A8Buol71eJw/JkAtBw8cXNJARDZcPmGFMFnCUQzJLiu7M7Jnu+mc+Waor
 5B8CX04LdXuD2qEAHL8saJC02rgW/6cxzGhQ9qXiBBeHeTee/3YO8KmmA
 qfykGw88gxjlfaARkuevFFmMXDArJhyVHp211tz+zV+vVWibOl6r1ImAl w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="373773477"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="373773477"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 08:12:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="711174072"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="711174072"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga003.jf.intel.com with ESMTP; 02 Nov 2023 08:12:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id DC358644; Thu,  2 Nov 2023 17:12:30 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/15] drm/i915/dsi: Get rid of redundant 'else'
Date: Thu,  2 Nov 2023 17:12:20 +0200
Message-Id: <20231102151228.668842-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20231102151228.668842-1-andriy.shevchenko@linux.intel.com>
References: <20231102151228.668842-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the snippets like the following

	if (...)
		return / goto / break / continue ...;
	else
		...

the 'else' is redundant. Get rid of it.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 58 ++++++++++----------
 1 file changed, 28 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
index 290a112f1b63..4ed5ede9ec5b 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -142,7 +142,7 @@ static enum port intel_dsi_seq_port_to_port(struct intel_dsi *intel_dsi,
 	if (seq_port) {
 		if (intel_dsi->ports & BIT(PORT_B))
 			return PORT_B;
-		else if (intel_dsi->ports & BIT(PORT_C))
+		if (intel_dsi->ports & BIT(PORT_C))
 			return PORT_C;
 	}
 
@@ -670,8 +670,8 @@ static const char *sequence_name(enum mipi_seq seq_id)
 {
 	if (seq_id < ARRAY_SIZE(seq_name) && seq_name[seq_id])
 		return seq_name[seq_id];
-	else
-		return "(unknown)";
+
+	return "(unknown)";
 }
 
 static void intel_dsi_vbt_exec(struct intel_dsi *intel_dsi,
@@ -865,36 +865,34 @@ bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi, u16 panel_id)
 	 * multiply by 100 to preserve remainder
 	 */
 	if (intel_dsi->video_mode == BURST_MODE) {
-		if (mipi_config->target_burst_mode_freq) {
-			u32 bitrate = intel_dsi_bitrate(intel_dsi);
+		u32 bitrate;
 
-			/*
-			 * Sometimes the VBT contains a slightly lower clock,
-			 * then the bitrate we have calculated, in this case
-			 * just replace it with the calculated bitrate.
-			 */
-			if (mipi_config->target_burst_mode_freq < bitrate &&
-			    intel_fuzzy_clock_check(
-					mipi_config->target_burst_mode_freq,
-					bitrate))
-				mipi_config->target_burst_mode_freq = bitrate;
-
-			if (mipi_config->target_burst_mode_freq < bitrate) {
-				drm_err(&dev_priv->drm,
-					"Burst mode freq is less than computed\n");
-				return false;
-			}
-
-			burst_mode_ratio = DIV_ROUND_UP(
-				mipi_config->target_burst_mode_freq * 100,
-				bitrate);
-
-			intel_dsi->pclk = DIV_ROUND_UP(intel_dsi->pclk * burst_mode_ratio, 100);
-		} else {
-			drm_err(&dev_priv->drm,
-				"Burst mode target is not set\n");
+		if (mipi_config->target_burst_mode_freq == 0) {
+			drm_err(&dev_priv->drm, "Burst mode target is not set\n");
 			return false;
 		}
+
+		bitrate = intel_dsi_bitrate(intel_dsi);
+
+		/*
+		 * Sometimes the VBT contains a slightly lower clock, then
+		 * the bitrate we have calculated, in this case just replace it
+		 * with the calculated bitrate.
+		 */
+		if (mipi_config->target_burst_mode_freq < bitrate &&
+		    intel_fuzzy_clock_check(mipi_config->target_burst_mode_freq,
+					    bitrate))
+			mipi_config->target_burst_mode_freq = bitrate;
+
+		if (mipi_config->target_burst_mode_freq < bitrate) {
+			drm_err(&dev_priv->drm, "Burst mode freq is less than computed\n");
+			return false;
+		}
+
+		burst_mode_ratio =
+			DIV_ROUND_UP(mipi_config->target_burst_mode_freq * 100, bitrate);
+
+		intel_dsi->pclk = DIV_ROUND_UP(intel_dsi->pclk * burst_mode_ratio, 100);
 	} else
 		burst_mode_ratio = 100;
 
-- 
2.40.0.1.gaa8946217a0b

