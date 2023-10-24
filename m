Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FF87D5772
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 18:09:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD2410E3F6;
	Tue, 24 Oct 2023 16:09:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B40910E3F6;
 Tue, 24 Oct 2023 16:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698163752; x=1729699752;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VdjY32/Uu2D4uk0y6fkSIpnqez7zOqy3ni8nIcydf2s=;
 b=eMNm4ZNp2qe26HOBFyHAKfNKY7Q2I74GULOYzu2v0OlVA2CF/rRDpUb3
 iy1Jhmgk31npA/aj7DPLGjXDoddVCtelHtYdwElCAfsrfEzmf4YtbBbfn
 YYxbbSZIF2uDeULV4up6V+lD/1Q9rwr3yaW8aaJ8Es6gIWijgVF808J2h
 mRBVh+L25Y5uQifgE688J9idSWZlxQlyfveKnfdh0BEgNedQ8JKximscF
 O2GUW2iPVwhXdwDbfQhV3pe6jKc4xD9JH5B0oApxzvpNdie02dGmYBmFh
 8uutuwsGkQA2lFvg8n3iRfbqwmCMrtBS8kyqqyydmZZGpLDpXQ7JOpJa7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="473328733"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; d="scan'208";a="473328733"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 08:57:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="708354964"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; d="scan'208";a="708354964"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga003.jf.intel.com with ESMTP; 24 Oct 2023 08:57:43 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 206A5871; Tue, 24 Oct 2023 18:57:42 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/7] drm/i915/dsi: Get rid of redundant 'else'
Date: Tue, 24 Oct 2023 18:57:34 +0300
Message-Id: <20231024155739.3861342-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20231024155739.3861342-1-andriy.shevchenko@linux.intel.com>
References: <20231024155739.3861342-1-andriy.shevchenko@linux.intel.com>
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
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the snippets like the following

	if (...)
		return / goto / break / continue ...;
	else
		...

the 'else' is redundant. Get rid of it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 58 ++++++++++----------
 1 file changed, 28 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
index a6a6f1814967..22b89e68e6de 100644
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
 
@@ -675,8 +675,8 @@ static const char *sequence_name(enum mipi_seq seq_id)
 {
 	if (seq_id < ARRAY_SIZE(seq_name) && seq_name[seq_id])
 		return seq_name[seq_id];
-	else
-		return "(unknown)";
+
+	return "(unknown)";
 }
 
 static void intel_dsi_vbt_exec(struct intel_dsi *intel_dsi,
@@ -870,36 +870,34 @@ bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi, u16 panel_id)
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

