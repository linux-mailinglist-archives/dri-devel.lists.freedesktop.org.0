Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A39A237592D
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 19:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95C96E7D7;
	Thu,  6 May 2021 17:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [159.69.62.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1AD6ECD3;
 Thu,  6 May 2021 17:23:47 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 424ADC800AE;
 Thu,  6 May 2021 19:23:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id WB3n034q-CHi; Thu,  6 May 2021 19:23:46 +0200 (CEST)
Received: from wsembach-tuxedo.fritz.box
 (p200300e37F12f2008bdED9a70B37E3f5.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f12:f200:8bde:d9a7:b37:e3f5])
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPA id E59FEC800AB;
 Thu,  6 May 2021 19:23:45 +0200 (CEST)
From: Werner Sembach <wse@tuxedocomputers.com>
To: ville.syrjala@linux.intel.com, airlied@linux.ie, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] drm/i915/display: New function to avoid duplicate code in
 upcomming commits
Date: Thu,  6 May 2021 19:23:23 +0200
Message-Id: <20210506172325.1995964-2-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210506172325.1995964-1-wse@tuxedocomputers.com>
References: <20210506172325.1995964-1-wse@tuxedocomputers.com>
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
Cc: Werner Sembach <wse@tuxedocomputers.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Moves some checks that later will be performed 2 times to an own fuction. This
avoids duplicate code later on.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 41 ++++++++++++++---------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 46de56af33db..576d3d910d06 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -1861,6 +1861,31 @@ static int intel_hdmi_port_clock(int clock, int bpc)
 	return clock * bpc / 8;
 }
 
+static enum drm_mode_status
+intel_hdmi_mode_clock_valid(struct intel_hdmi *hdmi, int clock, bool has_hdmi_sink)
+{
+	struct drm_device *dev = intel_hdmi_to_dev(hdmi);
+	struct drm_i915_private *dev_priv = to_i915(dev);
+	enum drm_mode_status status;
+
+	/* check if we can do 8bpc */
+	status = hdmi_port_clock_valid(hdmi, clock, true, has_hdmi_sink);
+
+	if (has_hdmi_sink) {
+		/* if we can't do 8bpc we may still be able to do 12bpc */
+		if (status != MODE_OK && !HAS_GMCH(dev_priv))
+			status = hdmi_port_clock_valid(hdmi, clock * 3 / 2,
+						       true, has_hdmi_sink);
+
+		/* if we can't do 8,12bpc we may still be able to do 10bpc */
+		if (status != MODE_OK && INTEL_GEN(dev_priv) >= 11)
+			status = hdmi_port_clock_valid(hdmi, clock * 5 / 4,
+						       true, has_hdmi_sink);
+	}
+
+	return status;
+}
+
 static enum drm_mode_status
 intel_hdmi_mode_valid(struct drm_connector *connector,
 		      struct drm_display_mode *mode)
@@ -1891,21 +1916,7 @@ intel_hdmi_mode_valid(struct drm_connector *connector,
 	if (drm_mode_is_420_only(&connector->display_info, mode))
 		clock /= 2;
 
-	/* check if we can do 8bpc */
-	status = hdmi_port_clock_valid(hdmi, intel_hdmi_port_clock(clock, 8),
-				       true, has_hdmi_sink);
-
-	if (has_hdmi_sink) {
-		/* if we can't do 8bpc we may still be able to do 12bpc */
-		if (status != MODE_OK && !HAS_GMCH(dev_priv))
-			status = hdmi_port_clock_valid(hdmi, intel_hdmi_port_clock(clock, 12),
-						       true, has_hdmi_sink);
-
-		/* if we can't do 8,12bpc we may still be able to do 10bpc */
-		if (status != MODE_OK && DISPLAY_VER(dev_priv) >= 11)
-			status = hdmi_port_clock_valid(hdmi, intel_hdmi_port_clock(clock, 10),
-						       true, has_hdmi_sink);
-	}
+	status = intel_hdmi_mode_clock_valid(hdmi, clock, has_hdmi_sink);
 	if (status != MODE_OK)
 		return status;
 
-- 
2.25.1

