Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFE8912AB5
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 17:55:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8973610F30A;
	Fri, 21 Jun 2024 15:55:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="G/Kxx9Rt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3616A10F30A
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 15:54:55 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 23CFF88059;
 Fri, 21 Jun 2024 17:54:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1718985293;
 bh=Va3O4DqzQSHq3cJfPChqI8lE50hpgVvzybgMmu0WY2w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G/Kxx9RtfvnuHTC+LxFmPfeeQZiuI8Jrz7aieQaIQlmZpoQBcElw/IRo/OiQeLk5p
 QPieIyG2bDo1Tq/PL7PpqSzFoM+lRr7oD5xNQXPX0LaDWaHnrnL/Iru9yYH0sVqIzg
 49JI1awCAEHK96qAaCrLn26G9Fp7Wir4G8rfoL2r8V+MHiBrexSA0Chou9fyMODSaq
 TvvgYehM3Ic3q37gh6sjU913mBJFb57+CaCMrdd86l04kGV/sd75K8XnZrsYLFHQf7
 EZDPsIh9wGV85xE37PKhPY1X4t+e0GlRWz4b26nDPWOOL9NhCTuq6Fmxf2g93+h7Ob
 GC7+Z9Awk6MIQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, kernel@dh-electronics.com
Subject: [PATCH v2 2/2] drm/bridge: tc358767: Add configurable default
 preemphasis
Date: Fri, 21 Jun 2024 17:53:54 +0200
Message-ID: <20240621155430.92894-2-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240621155430.92894-1-marex@denx.de>
References: <20240621155430.92894-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make the default DP port preemphasis configurable via new DT property
"toshiba,pre-emphasis". This is useful in case the DP link properties
are known and starting link training from preemphasis setting of 0 dB
is not useful. The preemphasis can be set separately for both DP lanes
in range 0=0dB, 1=3.5dB, 2=6dB .

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: kernel@dh-electronics.com
---
V2: - Parse toshiba,pre-emphasis property out of an endpoint of port 2 (the DP port)
---
 drivers/gpu/drm/bridge/tc358767.c | 45 ++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 2b035a136a6e5..8f81fc960d0fa 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -241,6 +241,10 @@
 
 /* Link Training */
 #define DP0_SRCCTRL		0x06a0
+#define DP0_SRCCTRL_PRE1		GENMASK(29, 28)
+#define DP0_SRCCTRL_SWG1		GENMASK(25, 24)
+#define DP0_SRCCTRL_PRE0		GENMASK(21, 20)
+#define DP0_SRCCTRL_SWG0		GENMASK(17, 16)
 #define DP0_SRCCTRL_SCRMBLDIS		BIT(13)
 #define DP0_SRCCTRL_EN810B		BIT(12)
 #define DP0_SRCCTRL_NOTP		(0 << 8)
@@ -278,6 +282,8 @@
 #define AUDIFDATA6		0x0720	/* DP0 Audio Info Frame Bytes 27 to 24 */
 
 #define DP1_SRCCTRL		0x07a0	/* DP1 Control Register */
+#define DP1_SRCCTRL_PRE			GENMASK(21, 20)
+#define DP1_SRCCTRL_SWG			GENMASK(17, 16)
 
 /* PHY */
 #define DP_PHY_CTRL		0x0800
@@ -369,6 +375,7 @@ struct tc_data {
 
 	u32			rev;
 	u8			assr;
+	u8			pre_emphasis[2];
 
 	struct gpio_desc	*sd_gpio;
 	struct gpio_desc	*reset_gpio;
@@ -1090,13 +1097,17 @@ static int tc_main_link_enable(struct tc_data *tc)
 			return ret;
 	}
 
-	ret = regmap_write(tc->regmap, DP0_SRCCTRL, tc_srcctrl(tc));
+	ret = regmap_write(tc->regmap, DP0_SRCCTRL,
+			   tc_srcctrl(tc) |
+			   FIELD_PREP(DP0_SRCCTRL_PRE0, tc->pre_emphasis[0]) |
+			   FIELD_PREP(DP0_SRCCTRL_PRE1, tc->pre_emphasis[1]));
 	if (ret)
 		return ret;
 	/* SSCG and BW27 on DP1 must be set to the same as on DP0 */
 	ret = regmap_write(tc->regmap, DP1_SRCCTRL,
 		 (tc->link.spread ? DP0_SRCCTRL_SSCG : 0) |
-		 ((tc->link.rate != 162000) ? DP0_SRCCTRL_BW27 : 0));
+		 ((tc->link.rate != 162000) ? DP0_SRCCTRL_BW27 : 0) |
+		 FIELD_PREP(DP1_SRCCTRL_PRE, tc->pre_emphasis[1]));
 	if (ret)
 		return ret;
 
@@ -1188,8 +1199,10 @@ static int tc_main_link_enable(struct tc_data *tc)
 		goto err_dpcd_write;
 
 	/* Reset voltage-swing & pre-emphasis */
-	tmp[0] = tmp[1] = DP_TRAIN_VOLTAGE_SWING_LEVEL_0 |
-			  DP_TRAIN_PRE_EMPH_LEVEL_0;
+	tmp[0] = DP_TRAIN_VOLTAGE_SWING_LEVEL_0 |
+		 FIELD_PREP(DP_TRAIN_PRE_EMPHASIS_MASK, tc->pre_emphasis[0]);
+	tmp[1] = DP_TRAIN_VOLTAGE_SWING_LEVEL_0 |
+		 FIELD_PREP(DP_TRAIN_PRE_EMPHASIS_MASK, tc->pre_emphasis[1]);
 	ret = drm_dp_dpcd_write(aux, DP_TRAINING_LANE0_SET, tmp, 2);
 	if (ret < 0)
 		goto err_dpcd_write;
@@ -1213,7 +1226,9 @@ static int tc_main_link_enable(struct tc_data *tc)
 	ret = regmap_write(tc->regmap, DP0_SRCCTRL,
 			   tc_srcctrl(tc) | DP0_SRCCTRL_SCRMBLDIS |
 			   DP0_SRCCTRL_AUTOCORRECT |
-			   DP0_SRCCTRL_TP1);
+			   DP0_SRCCTRL_TP1 |
+			   FIELD_PREP(DP0_SRCCTRL_PRE0, tc->pre_emphasis[0]) |
+			   FIELD_PREP(DP0_SRCCTRL_PRE1, tc->pre_emphasis[1]));
 	if (ret)
 		return ret;
 
@@ -1248,7 +1263,9 @@ static int tc_main_link_enable(struct tc_data *tc)
 	ret = regmap_write(tc->regmap, DP0_SRCCTRL,
 			   tc_srcctrl(tc) | DP0_SRCCTRL_SCRMBLDIS |
 			   DP0_SRCCTRL_AUTOCORRECT |
-			   DP0_SRCCTRL_TP2);
+			   DP0_SRCCTRL_TP2 |
+			   FIELD_PREP(DP0_SRCCTRL_PRE0, tc->pre_emphasis[0]) |
+			   FIELD_PREP(DP0_SRCCTRL_PRE1, tc->pre_emphasis[1]));
 	if (ret)
 		return ret;
 
@@ -1274,7 +1291,9 @@ static int tc_main_link_enable(struct tc_data *tc)
 
 	/* Clear Training Pattern, set AutoCorrect Mode = 1 */
 	ret = regmap_write(tc->regmap, DP0_SRCCTRL, tc_srcctrl(tc) |
-			   DP0_SRCCTRL_AUTOCORRECT);
+			   DP0_SRCCTRL_AUTOCORRECT |
+			   FIELD_PREP(DP0_SRCCTRL_PRE0, tc->pre_emphasis[0]) |
+			   FIELD_PREP(DP0_SRCCTRL_PRE1, tc->pre_emphasis[1]));
 	if (ret)
 		return ret;
 
@@ -2408,6 +2427,18 @@ static int tc_probe_bridge_endpoint(struct tc_data *tc)
 			return -EINVAL;
 		}
 		mode |= BIT(endpoint.port);
+		if (endpoint.port != 2)
+			continue;
+
+		of_property_read_u8_array(node, "toshiba,pre-emphasis",
+					  tc->pre_emphasis,
+					  ARRAY_SIZE(tc->pre_emphasis));
+
+		if (tc->pre_emphasis[0] < 0 || tc->pre_emphasis[0] > 2 ||
+		    tc->pre_emphasis[1] < 0 || tc->pre_emphasis[1] > 2) {
+			dev_err(dev, "Incorrect Pre-Emphasis setting, use either 0=0dB 1=3.5dB 2=6dB\n");
+			return -EINVAL;
+		}
 	}
 
 	if (mode == mode_dpi_to_edp || mode == mode_dpi_to_dp) {
-- 
2.43.0

