Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A8B800F59
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 17:11:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A0B10E107;
	Fri,  1 Dec 2023 16:11:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6761810E107
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 16:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701447101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ElA6Fj5DJkJvfXTjhyinKJ7iR3dZv3cvuKNwFak2q8c=;
 b=fZWBfIB07WajG9IK1Z+7mP5MXbuvN/ZAwUxX7l7UmjmDih19LjQPL9a9t/vB2/m80EbIaq
 uWkiwCgfAhvryh0Eu0AVPX1LSYlNE6AXTPyaw+E5Osu4bYx9999kUnqG+ZVTUNhgt/3AWC
 MDN5iSA09qr3fzM9qd3A7Og5+qYi7Ec=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-29-fadl10qWMv--3DyaCaz95A-1; Fri,
 01 Dec 2023 11:11:38 -0500
X-MC-Unique: fadl10qWMv--3DyaCaz95A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25FF63C025CC;
 Fri,  1 Dec 2023 16:11:37 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA6581121307;
 Fri,  1 Dec 2023 16:11:35 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH] drm/i915/dsi: Use devm_gpiod_get() for all GPIOs
Date: Fri,  1 Dec 2023 17:11:30 +0100
Message-ID: <20231201161130.23976-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

soc_gpio_set_value() already uses devm_gpiod_get(), lets be consistent
and use devm_gpiod_get() for all GPIOs.

This allows removing the intel_dsi_vbt_gpio_cleanup() function,
which only function was to put the GPIO-descriptors.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Note this applies on top of Andy's recent GPIO rework series which
has just landed in drm-intel-next
---
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 17 ++---------------
 drivers/gpu/drm/i915/display/intel_dsi_vbt.h |  1 -
 drivers/gpu/drm/i915/display/vlv_dsi.c       | 10 +---------
 3 files changed, 3 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
index 275d0218394c..a5d7fc8418c9 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -922,7 +922,7 @@ void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_on)
 		gpiod_add_lookup_table(gpiod_lookup_table);
 
 	if (want_panel_gpio) {
-		intel_dsi->gpio_panel = gpiod_get(dev->dev, "panel", flags);
+		intel_dsi->gpio_panel = devm_gpiod_get(dev->dev, "panel", flags);
 		if (IS_ERR(intel_dsi->gpio_panel)) {
 			drm_err(&dev_priv->drm,
 				"Failed to own gpio for panel control\n");
@@ -932,7 +932,7 @@ void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_on)
 
 	if (want_backlight_gpio) {
 		intel_dsi->gpio_backlight =
-			gpiod_get(dev->dev, "backlight", flags);
+			devm_gpiod_get(dev->dev, "backlight", flags);
 		if (IS_ERR(intel_dsi->gpio_backlight)) {
 			drm_err(&dev_priv->drm,
 				"Failed to own gpio for backlight control\n");
@@ -943,16 +943,3 @@ void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_on)
 	if (gpiod_lookup_table)
 		gpiod_remove_lookup_table(gpiod_lookup_table);
 }
-
-void intel_dsi_vbt_gpio_cleanup(struct intel_dsi *intel_dsi)
-{
-	if (intel_dsi->gpio_panel) {
-		gpiod_put(intel_dsi->gpio_panel);
-		intel_dsi->gpio_panel = NULL;
-	}
-
-	if (intel_dsi->gpio_backlight) {
-		gpiod_put(intel_dsi->gpio_backlight);
-		intel_dsi->gpio_backlight = NULL;
-	}
-}
diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.h b/drivers/gpu/drm/i915/display/intel_dsi_vbt.h
index 468d873fab1a..3462fcc760e6 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.h
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.h
@@ -13,7 +13,6 @@ struct intel_dsi;
 
 bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi, u16 panel_id);
 void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_on);
-void intel_dsi_vbt_gpio_cleanup(struct intel_dsi *intel_dsi);
 void intel_dsi_vbt_exec_sequence(struct intel_dsi *intel_dsi,
 				 enum mipi_seq seq_id);
 void intel_dsi_log_params(struct intel_dsi *intel_dsi);
diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
index 5bda97c96810..9b33b8a74d64 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi.c
+++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
@@ -1532,16 +1532,8 @@ static void intel_dsi_unprepare(struct intel_encoder *encoder)
 	}
 }
 
-static void intel_dsi_encoder_destroy(struct drm_encoder *encoder)
-{
-	struct intel_dsi *intel_dsi = enc_to_intel_dsi(to_intel_encoder(encoder));
-
-	intel_dsi_vbt_gpio_cleanup(intel_dsi);
-	intel_encoder_destroy(encoder);
-}
-
 static const struct drm_encoder_funcs intel_dsi_funcs = {
-	.destroy = intel_dsi_encoder_destroy,
+	.destroy = intel_encoder_destroy,
 };
 
 static enum drm_mode_status vlv_dsi_mode_valid(struct drm_connector *connector,
-- 
2.41.0

