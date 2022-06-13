Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E299154847A
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 12:23:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADBA10E03B;
	Mon, 13 Jun 2022 10:23:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F2A610E06C;
 Mon, 13 Jun 2022 10:23:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 3DDEACE0EEB;
 Mon, 13 Jun 2022 10:22:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F33FC3411F;
 Mon, 13 Jun 2022 10:22:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="IuGRuPfg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1655115769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=wygRKsQQoOkxE24h6N/fU1chnZEJUkIH6YSLd3q7y2Q=;
 b=IuGRuPfgnX8hxYKzefqnkSo/I3kYneEmE6kmW2HWJx8JnWTevFdnT9MN9KOhxG0a9W+lAJ
 HitPkjW76f9/yVIazewu4avwB2DLQUtGFG95HTGUrFS2+LU2e5zMb/+L3+mAGZW0Ouco6p
 0h0wqePZFo+qgRbzIDxRHLBzRIALTW4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 343c5d8e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Mon, 13 Jun 2022 10:22:49 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/display: Re-add check for low voltage sku for max dp
 source rate
Date: Mon, 13 Jun 2022 12:22:41 +0200
Message-Id: <20220613102241.9236-1-Jason@zx2c4.com>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Jani Nikula <jani.nikula@intel.com>,
 Animesh Manna <animesh.manna@intel.com>,
 Jani Saarinen <jani.saarinen@intel.com>, Uma Shankar <uma.shankar@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 73867c8709b569cdd7fda67f01dfe02c8d055521, which, on
an i7-11850H iGPU with a Thinkpad X1 Extreme Gen 4, attached to a LG
LP160UQ1-SPB1 embedded panel, causes wild flickering glitching
technicolor pyrotechnics on resumption from suspend. The display shows
strobing colors in an utter disaster explosion of pantone, as though
bombs were dropped on the leprechauns at the base of the rainbow.

Rebooting the machine fixes the issue, presumably because the display is
initialized by firmware rather than by i915. Otherwise, the GPU appears
to work fine.

Bisection traced it back to this commit, which makes sense given the
issues.

Fixes: 73867c8709b5 ("drm/i915/display: Remove check for low voltage sku for max dp source rate")
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Imre Deak <imre.deak@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Animesh Manna <animesh.manna@intel.com>
Cc: Jani Saarinen <jani.saarinen@intel.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 32 ++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index e4a79c11fd25..ff67899522cf 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -388,13 +388,23 @@ static int dg2_max_source_rate(struct intel_dp *intel_dp)
 	return intel_dp_is_edp(intel_dp) ? 810000 : 1350000;
 }
 
+static bool is_low_voltage_sku(struct drm_i915_private *i915, enum phy phy)
+{
+	u32 voltage;
+
+	voltage = intel_de_read(i915, ICL_PORT_COMP_DW3(phy)) & VOLTAGE_INFO_MASK;
+
+	return voltage == VOLTAGE_INFO_0_85V;
+}
+
 static int icl_max_source_rate(struct intel_dp *intel_dp)
 {
 	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
 	struct drm_i915_private *dev_priv = to_i915(dig_port->base.base.dev);
 	enum phy phy = intel_port_to_phy(dev_priv, dig_port->base.port);
 
-	if (intel_phy_is_combo(dev_priv, phy) && !intel_dp_is_edp(intel_dp))
+	if (intel_phy_is_combo(dev_priv, phy) &&
+	    (is_low_voltage_sku(dev_priv, phy) || !intel_dp_is_edp(intel_dp)))
 		return 540000;
 
 	return 810000;
@@ -402,7 +412,23 @@ static int icl_max_source_rate(struct intel_dp *intel_dp)
 
 static int ehl_max_source_rate(struct intel_dp *intel_dp)
 {
-	if (intel_dp_is_edp(intel_dp))
+	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
+	struct drm_i915_private *dev_priv = to_i915(dig_port->base.base.dev);
+	enum phy phy = intel_port_to_phy(dev_priv, dig_port->base.port);
+
+	if (intel_dp_is_edp(intel_dp) || is_low_voltage_sku(dev_priv, phy))
+		return 540000;
+
+	return 810000;
+}
+
+static int dg1_max_source_rate(struct intel_dp *intel_dp)
+{
+	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	enum phy phy = intel_port_to_phy(i915, dig_port->base.port);
+
+	if (intel_phy_is_combo(i915, phy) && is_low_voltage_sku(i915, phy))
 		return 540000;
 
 	return 810000;
@@ -445,7 +471,7 @@ intel_dp_set_source_rates(struct intel_dp *intel_dp)
 			max_rate = dg2_max_source_rate(intel_dp);
 		else if (IS_ALDERLAKE_P(dev_priv) || IS_ALDERLAKE_S(dev_priv) ||
 			 IS_DG1(dev_priv) || IS_ROCKETLAKE(dev_priv))
-			max_rate = 810000;
+			max_rate = dg1_max_source_rate(intel_dp);
 		else if (IS_JSL_EHL(dev_priv))
 			max_rate = ehl_max_source_rate(intel_dp);
 		else
-- 
2.35.1

