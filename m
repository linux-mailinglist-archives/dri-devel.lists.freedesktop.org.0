Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0CF11F914
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2019 17:38:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D236E106;
	Sun, 15 Dec 2019 16:38:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 065536E109
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2019 16:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576427905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4jsQeTa9+tKAcks/nLyZi1gT8Q5NqYoTibMwTcABwCY=;
 b=Fo/wDP/cJ6EmDlq8hJkYOM+OP2NaDLNTOjl+dYHDGSQuCHG+YbI/FYcKm/hpwy7vBNl8F4
 /d7sJFel6DYoY4R/9dBDPVtKlxD2skChuTlMBNrKmTGo9SOzUDyX8FWUqr8/HijuLt4DWT
 +I9IRR1i/JYuOddJovhesygehVkOiB8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-MbXVefckNIaFhU7aH_IJYA-1; Sun, 15 Dec 2019 11:38:22 -0500
X-MC-Unique: MbXVefckNIaFhU7aH_IJYA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0ABAB107ACC4;
 Sun, 15 Dec 2019 16:38:21 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-49.ams2.redhat.com
 [10.36.116.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A4345D9C9;
 Sun, 15 Dec 2019 16:38:18 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/5] drm/i915/dsi: Init panel-enable GPIO to low when the LCD
 is initially off
Date: Sun, 15 Dec 2019 17:38:08 +0100
Message-Id: <20191215163810.52356-4-hdegoede@redhat.com>
In-Reply-To: <20191215163810.52356-1-hdegoede@redhat.com>
References: <20191215163810.52356-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the LCD has not been turned on by the firmware/GOP, because e.g. the
device was booted with an external monitor connected over HDMI, we should
not turn on the panel-enable GPIO when we request it.

Turning on the panel-enable GPIO when we request it, means we turn it on
too early in the init-sequence, which causes some panels to not correctly
light up.

This commits adds a panel_is_on parameter to intel_dsi_vbt_gpio_init()
and makes intel_dsi_vbt_gpio_init() set the initial GPIO value accordingly.

This fixes the panel not lighting up on a Thundersoft TST168 tablet when
booted with an external monitor connected over HDMI.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_dsi.h     | 2 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 7 +++----
 drivers/gpu/drm/i915/display/vlv_dsi.c       | 2 +-
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsi.h b/drivers/gpu/drm/i915/display/intel_dsi.h
index de7e51cd3460..675771ea91aa 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi.h
+++ b/drivers/gpu/drm/i915/display/intel_dsi.h
@@ -203,7 +203,7 @@ void bxt_dsi_reset_clocks(struct intel_encoder *encoder, enum port port);
 
 /* intel_dsi_vbt.c */
 bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi, u16 panel_id);
-void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi);
+void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_on);
 void intel_dsi_vbt_gpio_cleanup(struct intel_dsi *intel_dsi);
 void intel_dsi_vbt_exec_sequence(struct intel_dsi *intel_dsi,
 				 enum mipi_seq seq_id);
diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
index 5352e8c9eca5..027970348b22 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -688,17 +688,16 @@ bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi, u16 panel_id)
  * On some BYT/CHT devs some sequences are incomplete and we need to manually
  * control some GPIOs.
  */
-void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi)
+void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_on)
 {
 	struct drm_device *dev = intel_dsi->base.base.dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct mipi_config *mipi_config = dev_priv->vbt.dsi.config;
+	enum gpiod_flags flags = panel_is_on ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
 
 	if ((IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) &&
 	    (mipi_config->pwm_blc == PPS_BLC_PMIC)) {
-		intel_dsi->gpio_panel =
-			gpiod_get(dev->dev, "panel", GPIOD_OUT_HIGH);
-
+		intel_dsi->gpio_panel = gpiod_get(dev->dev, "panel", flags);
 		if (IS_ERR(intel_dsi->gpio_panel)) {
 			DRM_ERROR("Failed to own gpio for panel control\n");
 			intel_dsi->gpio_panel = NULL;
diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
index 178d0fffba5b..e86e4a11e199 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi.c
+++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
@@ -1910,7 +1910,7 @@ void vlv_dsi_init(struct drm_i915_private *dev_priv)
 
 	vlv_dphy_param_init(intel_dsi);
 
-	intel_dsi_vbt_gpio_init(intel_dsi);
+	intel_dsi_vbt_gpio_init(intel_dsi, current_mode != NULL);
 
 	drm_connector_init(dev, connector, &intel_dsi_connector_funcs,
 			   DRM_MODE_CONNECTOR_DSI);
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
