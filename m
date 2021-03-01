Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0608D3282BD
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 16:43:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9E9F6E03C;
	Mon,  1 Mar 2021 15:43:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 521916E03C
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 15:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614613433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CQn7g+FvITuXu9PhqqHAnWCmDG6jgNmR15zTEk3x5bE=;
 b=VEFDEPfjDsIdBhbxfFym+NiTRxTa4iK8KyGgI83xpxoR4JPnpDFmhgTCBpXXds7mZh7Leg
 gVuPXqATEbDzEhEe4T63hkWN3KPL5tHm2TQS4lM8w8I8fBBXSz6CE2KCQm3XHzOCLWvYuh
 vJ2BDdJDdRDNKoVhPHblNkn+SQsTADE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-SsEkDmwOPgOOy_oEAjxQxw-1; Mon, 01 Mar 2021 10:43:51 -0500
X-MC-Unique: SsEkDmwOPgOOy_oEAjxQxw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE4D0100CCC3;
 Mon,  1 Mar 2021 15:43:49 +0000 (UTC)
Received: from x1.localdomain (ovpn-113-1.ams2.redhat.com [10.36.113.1])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 515155C1D1;
 Mon,  1 Mar 2021 15:43:48 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH] drm/i915/display/vlv_dsi: Do no shut down displays on reboot
 if a DSI panel is used
Date: Mon,  1 Mar 2021 16:43:47 +0100
Message-Id: <20210301154347.50052-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After the recently added commit fe0f1e3bfdfe ("drm/i915: Shut down
displays gracefully on reboot"), the DSI panel on a Cherry Trail based
Predia Basic tablet would no longer properly light up after reboot.

The backlight still turns back on after reboot, but the LCD shows an
all black display. The display is also all black during the time that
EFI / the GOP is managing it, so e.g. the grub menu also is not visible.

In this scenario the panel is initialized so that it appears to be working
and the fastboot code skips doing a modeset. Forcing a modeset by doing a
chvt to a text-console over ssh followed by echo-ing 1 and then 0 to
/sys/class/graphics/fb0/blank causes the panel to work again.

Add a QUIRK_SKIP_SHUTDOWN quirk which turns i915_driver_shutdown() into
a no-op when set; and set this on vlv/chv devices when a DSI panel is
detected, to work around this.

Admittedly this is a bit of a big hammer, but these platforms have been
around for quite some time now and they have always worked fine without
the new behavior to shutdown everything on shutdown/reboot. This approach
simply disables the recently introduced new shutdown behavior in this
specific case where it is known to cause problems. Which is a nice and
simple way to deal with this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/i915/display/vlv_dsi.c | 3 +++
 drivers/gpu/drm/i915/i915_drv.c        | 3 +++
 drivers/gpu/drm/i915/i915_drv.h        | 1 +
 3 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
index f94025ec603a..792ef868b6af 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi.c
+++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
@@ -1949,6 +1949,9 @@ void vlv_dsi_init(struct drm_i915_private *dev_priv)
 
 	vlv_dsi_add_properties(intel_connector);
 
+	/* Some BIOS-es fail to re-init the DSI panel on reboot if we turn it off */
+	dev_priv->quirks |= QUIRK_SKIP_SHUTDOWN;
+
 	return;
 
 err_cleanup_connector:
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 8e9cb44e66e5..92f2af55af6d 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -1048,6 +1048,9 @@ static void intel_shutdown_encoders(struct drm_i915_private *dev_priv)
 
 void i915_driver_shutdown(struct drm_i915_private *i915)
 {
+	if (i915->quirks & QUIRK_SKIP_SHUTDOWN)
+		return;
+
 	disable_rpm_wakeref_asserts(&i915->runtime_pm);
 
 	i915_gem_suspend(i915);
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 26d69d06aa6d..272cd7cb22d4 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -517,6 +517,7 @@ struct i915_psr {
 #define QUIRK_PIN_SWIZZLED_PAGES (1<<5)
 #define QUIRK_INCREASE_T12_DELAY (1<<6)
 #define QUIRK_INCREASE_DDI_DISABLED_TIME (1<<7)
+#define QUIRK_SKIP_SHUTDOWN (1<<8)
 
 struct intel_fbdev;
 struct intel_fbc_work;
-- 
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
