Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCAD25BF94
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 12:52:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A7B6E997;
	Thu,  3 Sep 2020 10:52:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7584B6E995
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 10:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599130332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1wMXBHDyyQ6t98T6xFtSD2movAwUy8KekR8cCyDYfqQ=;
 b=U5OaWJeqFtkoOujTE5W8mhHUorepYRMztGwuB23lS4TcIz97gHLM/hL4MdoxtH00LhD34+
 Bd34UXoW26FyglQKqaNgqdBrKrAQCTZZ/s2/+l0pyHd06QaK15PjGKMINOLaMn6AZGF5+H
 RAyyTQ80l7GE+XSX9DAZtDdKMYtxUVA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533--_LT4ow9O3Sq7pwO4Ub6cg-1; Thu, 03 Sep 2020 06:52:07 -0400
X-MC-Unique: -_LT4ow9O3Sq7pwO4Ub6cg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B7E31DE09;
 Thu,  3 Sep 2020 10:52:05 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-115-4.ams2.redhat.com [10.36.115.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6D21784A8;
 Thu,  3 Sep 2020 10:52:02 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>
Subject: [PATCH v9 14/17] drm/i915: panel: Add get_vbt_pwm_freq() helper
Date: Thu,  3 Sep 2020 12:51:11 +0200
Message-Id: <20200903105114.9969-15-hdegoede@redhat.com>
In-Reply-To: <20200903105114.9969-1-hdegoede@redhat.com>
References: <20200903105114.9969-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: linux-pwm@vger.kernel.org, linux-acpi@vger.kernel.org,
 Jani Nikula <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Factor the code which checks and drm_dbg_kms-s the VBT PWM frequency
out of get_backlight_max_vbt().

This is a preparation patch for honering the VBT PWM frequency for
devices which use an external PWM controller (devices using
pwm_setup_backlight()).

Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_panel.c | 27 ++++++++++++++--------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
index 4072d7062efd..df7472a3b9f8 100644
--- a/drivers/gpu/drm/i915/display/intel_panel.c
+++ b/drivers/gpu/drm/i915/display/intel_panel.c
@@ -1543,18 +1543,9 @@ static u32 vlv_hz_to_pwm(struct intel_connector *connector, u32 pwm_freq_hz)
 	return DIV_ROUND_CLOSEST(clock, pwm_freq_hz * mul);
 }
 
-static u32 get_backlight_max_vbt(struct intel_connector *connector)
+static u16 get_vbt_pwm_freq(struct drm_i915_private *dev_priv)
 {
-	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
-	struct intel_panel *panel = &connector->panel;
 	u16 pwm_freq_hz = dev_priv->vbt.backlight.pwm_freq_hz;
-	u32 pwm;
-
-	if (!panel->backlight.hz_to_pwm) {
-		drm_dbg_kms(&dev_priv->drm,
-			    "backlight frequency conversion not supported\n");
-		return 0;
-	}
 
 	if (pwm_freq_hz) {
 		drm_dbg_kms(&dev_priv->drm,
@@ -1567,6 +1558,22 @@ static u32 get_backlight_max_vbt(struct intel_connector *connector)
 			    pwm_freq_hz);
 	}
 
+	return pwm_freq_hz;
+}
+
+static u32 get_backlight_max_vbt(struct intel_connector *connector)
+{
+	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
+	struct intel_panel *panel = &connector->panel;
+	u16 pwm_freq_hz = get_vbt_pwm_freq(dev_priv);
+	u32 pwm;
+
+	if (!panel->backlight.hz_to_pwm) {
+		drm_dbg_kms(&dev_priv->drm,
+			    "backlight frequency conversion not supported\n");
+		return 0;
+	}
+
 	pwm = panel->backlight.hz_to_pwm(connector, pwm_freq_hz);
 	if (!pwm) {
 		drm_dbg_kms(&dev_priv->drm,
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
