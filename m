Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D577186432
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 05:24:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E96866E32F;
	Mon, 16 Mar 2020 04:24:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E34C6E32C;
 Mon, 16 Mar 2020 04:24:00 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id f3so12446527wrw.7;
 Sun, 15 Mar 2020 21:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BFbGXoNRkYhu7pj0FHhokhuVS4Fb4wpUfdzOgdNP9tw=;
 b=JceIzu66t4zKvbngDbCNiU9prpEQgCoNncoNTWT9e5qQCfqAXSLBR+u+irIlQImbaq
 mH8Flvz7Jda5wSnVk6MD4thogX2hRbZ7nDKRg9NevYo/4whe3+cAPs6wdJqvb7Epf7mf
 V4Q2X2RaXnT70Rw7/sKAbGOtDaQv7RglM8XHDxjM/+BRpOLSw31D3HCdA9CY2R67c+d0
 BzuVleLM4Pe/Vvt1W1bu4QQzijmpnaxR0GXrNkp1coCsy7dDiikUKjE7NEKUlyiXqxcw
 wBQdSOi3Bg4lBk/fW9BKbYtGe8+JAxLOG13lzPjaKf7mQagGoRUNEhFEQcrAYfoLArMa
 Z48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BFbGXoNRkYhu7pj0FHhokhuVS4Fb4wpUfdzOgdNP9tw=;
 b=Sk1iH4ldrqwo7Xjt9oflvyV0pL/F7oeoxDJMeLH7NapGS6QYvAiPW0T1ubY1htM0r/
 Nffylk6MxauOdd8+rSiomFOqUMDxq5YgTeyQ29QnJtHUDTCbiHawsRmVkz68FpIYX/z5
 vK0Mj9AZr6pLBmiCX4XYgRdZxjiZov+E74MJA4IxDO/cSnuXIBG49S5PyGtZ2JdV4toD
 GatS7VgAUywjWj7FbwCe2s6JtonX3meHelNZOXeiAWzFLYrUQL9h8NOMuIiQJ2EAuv+Q
 mSm7zTq6RRmYQUyCmanGRgku/hlpCCShfFq5ovlsusP48SSrOGpuVOen99VhXbSzpT6J
 lRZQ==
X-Gm-Message-State: ANhLgQ2yEbE/NY8yT094a7Nyu2s4DiiV6l5Md2lWMfwDEiovb9gR8JOj
 gyxhFXF1ViKUXuDTMzw1NC2lfGtM
X-Google-Smtp-Source: ADFU+vuFizVUnwKp8sjSDX41wgN++nnQlDMw0iE9GI80KOjHDHLrH3E/muuzK5R8PzwKKrzIOx/n9w==
X-Received: by 2002:adf:e581:: with SMTP id l1mr19504126wrm.395.1584332638795; 
 Sun, 15 Mar 2020 21:23:58 -0700 (PDT)
Received: from groovy.localdomain
 (dynamic-2a01-0c23-7803-8800-a85c-f091-4474-9511.c23.pool.telefonica.de.
 [2a01:c23:7803:8800:a85c:f091:4474:9511])
 by smtp.gmail.com with ESMTPSA id z4sm5909800wrr.6.2020.03.15.21.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 21:23:58 -0700 (PDT)
From: Mario Kleiner <mario.kleiner.de@gmail.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/dp: Add dpcd link_rate quirk for Apple 15" MBP 2017
 (v3)
Date: Mon, 16 Mar 2020 05:23:40 +0100
Message-Id: <20200316042340.4783-1-mario.kleiner.de@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: Jani Nikula <jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This fixes a problem found on the MacBookPro 2017 Retina panel.

The panel reports 10 bpc color depth in its EDID, and the
firmware chooses link settings at boot which support enough
bandwidth for 10 bpc (324000 kbit/sec = multiplier 0xc),
but the DP_MAX_LINK_RATE dpcd register only reports
2.7 Gbps (multiplier value 0xa) as possible, in direct
contradiction of what the firmware successfully set up.

This restricts the panel to 8 bpc, not providing the full
color depth of the panel.

This patch adds a quirk specific to the MBP 2017 15" Retina
panel to add the additiional 324000 kbps link rate during
edp setup.

Link to previous discussion of a different attempted fix
with Ville and Jani:

https://patchwork.kernel.org/patch/11325935/

v2: Follow Jani's proposal of defining quirk_rates[] instead
    of just appending 324000. This for better clarity.

v3: Rebased onto current drm-tip, as of 16-March-2020. Adapt
    to new edid_quirks parameter of drm_dp_has_quirk().

Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
Tested-by: Mario Kleiner <mario.kleiner.de@gmail.com>
Cc: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_dp_helper.c         |  2 ++
 drivers/gpu/drm/i915/display/intel_dp.c | 11 +++++++++++
 include/drm/drm_dp_helper.h             |  7 +++++++
 3 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index c6fbe6e6bc9d..8ba4531e808d 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -1238,6 +1238,8 @@ static const struct dpcd_quirk dpcd_quirk_list[] = {
 	{ OUI(0x00, 0x00, 0x00), DEVICE_ID('C', 'H', '7', '5', '1', '1'), false, BIT(DP_DPCD_QUIRK_NO_SINK_COUNT) },
 	/* Synaptics DP1.4 MST hubs can support DSC without virtual DPCD */
 	{ OUI(0x90, 0xCC, 0x24), DEVICE_ID_ANY, true, BIT(DP_DPCD_QUIRK_DSC_WITHOUT_VIRTUAL_DPCD) },
+	/* Apple MacBookPro 2017 15 inch eDP Retina panel reports too low DP_MAX_LINK_RATE */
+	{ OUI(0x00, 0x10, 0xfa), DEVICE_ID(101, 68, 21, 101, 98, 97), false, BIT(DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_3_24_GBPS) },
 };
 
 #undef OUI
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 0a417cd2af2b..ef2e06e292d5 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -164,6 +164,17 @@ static void intel_dp_set_sink_rates(struct intel_dp *intel_dp)
 	};
 	int i, max_rate;
 
+	if (drm_dp_has_quirk(&intel_dp->desc, 0,
+			     DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_3_24_GBPS)) {
+		/* Needed, e.g., for Apple MBP 2017, 15 inch eDP Retina panel */
+		static const int quirk_rates[] = { 162000, 270000, 324000 };
+
+		memcpy(intel_dp->sink_rates, quirk_rates, sizeof(quirk_rates));
+		intel_dp->num_sink_rates = ARRAY_SIZE(quirk_rates);
+
+		return;
+	}
+
 	max_rate = drm_dp_bw_code_to_link_rate(intel_dp->dpcd[DP_MAX_LINK_RATE]);
 
 	for (i = 0; i < ARRAY_SIZE(dp_rates); i++) {
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index c6119e4c169a..9d87cdf2740a 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1548,6 +1548,13 @@ enum drm_dp_quirk {
 	 * capabilities advertised.
 	 */
 	DP_QUIRK_FORCE_DPCD_BACKLIGHT,
+	/**
+	 * @DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_3_24_GBPS:
+	 *
+	 * The device supports a link rate of 3.24 Gbps (multiplier 0xc) despite
+	 * the DP_MAX_LINK_RATE register reporting a lower max multiplier.
+	 */
+	DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_3_24_GBPS,
 };
 
 /**
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
