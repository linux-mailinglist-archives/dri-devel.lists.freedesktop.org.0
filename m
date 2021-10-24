Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC97438A74
	for <lists+dri-devel@lfdr.de>; Sun, 24 Oct 2021 17:50:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA0EE6E112;
	Sun, 24 Oct 2021 15:50:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F7096E0C5
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Oct 2021 15:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635090618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=f9aYriJsQLZvXjwRn8iqpmZeqSvR6PYv4oVwjSaB1tI=;
 b=IdZyHzT2ETKBvn4Dsz9D6kYdk+GXLJlY2jWkqemBnoQ7Eou/InZuxv+KiAhy76dYL8w4i9
 nENyg52TQNvGQhv7pA7ooIAqmDrWKC699rGDNobvyRw4n7ZX3B3NwczwXR5gQUtMJ6BYo9
 5bv0t9/O9t/UXyzCtpChtVn7fACExHs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-79M-NU49PUmRg7hc-2Et3Q-1; Sun, 24 Oct 2021 11:50:14 -0400
X-MC-Unique: 79M-NU49PUmRg7hc-2Et3Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35BA31808312;
 Sun, 24 Oct 2021 15:50:13 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 13E8060C9F;
 Sun, 24 Oct 2021 15:50:10 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, Tsuchiya Yuto <kitakar@gmail.com>
Subject: [PATCH] drm/i915: Add NO_VLV_DISP_PW_DPIO_CMN_BC_INIT quirk
Date: Sun, 24 Oct 2021 17:50:10 +0200
Message-Id: <20211024155010.126275-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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

Add a NO_VLV_DISP_PW_DPIO_CMN_BC_INIT quirk to fix i915 not working on
the Xiaomi Mi Pad 2 (with CHT x5-Z8500 SoC).

The Xiaomi Mi Pad 2 uses quite an unusual hardware-design for a Cherry
Trail tablet. It deviates from the typical reference design based tablets
in many ways.

The Mi Pad 2 does not have any DisplayPort or HDMI outouts. I suspect that
as part of its unusual design it also has some supply rail which is only
used for DisplayPort or HDMI not connected.

Force-enabling the dpio-common-bc powerwell as the i915 normal does at boot
appears to cause the P-Unit to hang. When booting with a serial-usb console
the following errors are logged before the system freezes:

 i915 0000:00:02.0: [drm] *ERROR* timeout setting power well state 00000000 (fffff3ff)
 i915 0000:00:02.0: [drm] *ERROR* Display PHY 0 is not power up
 ------------[ cut here ]------------
 i915 0000:00:02.0: DPIO read pipe A reg 0x8170 == 0xffffffff
 WARNING: CPU: 3 PID: 258 at drivers/gpu/drm/i915/intel_sideband.c:257 vlv_dpio_read+0x95/0xb0 [i915]
 ...
 Call Trace:
  chv_dpio_cmn_power_well_enable+0xab/0x210 [i915]
  __intel_display_power_get_domain.part.0+0xa0/0xc0 [i915]
  intel_power_domains_init_hw+0x26d/0x760 [i915]
  intel_modeset_init_noirq+0x5d/0x270 [i915]
  i915_driver_probe+0x6b6/0xd10 [i915]
  ...

If I disable the WARN about the register being 0xffffffff, so that the
system can log some more dmesg output over the serial console before
freezing, the following errors are also logged:

 i915 0000:00:02.0: [drm] *ERROR* timeout setting power well state 00000000 (fcfff3ff)
 i915 0000:00:02.0: [drm] *ERROR* Display PHY 1 is not power up

With this patch to disable the force-enabling of the PHY 0 / dpio-common-bc
powerwell in place, this error for PHY 1 goes away. So it seems that trying
the force-enabling of the PHY 0 / dpio-common-bc powerwell freezes the
P-Unit, causing the subsequent enabling of PHY 1 to also fail (and causing
the entire system to freeze within seconds).

With this patch the PHY 1 error disappears and the entire system works.

Note this change also moves the intel_init_quirks() call a bit up inside
intel_modeset_init_noirq() this is necessary so that the quirk is set
before the intel_power_domains_init_hw() call. This is harmless, all that
intel_init_quirks() does is set some bits in drm_i915_private.quirks and
make some drm_info() log calls.

Reported-by: Tsuchiya Yuto <kitakar@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_display.c     |  4 ++--
 .../gpu/drm/i915/display/intel_display_power.c   | 16 ++++++++++++++--
 drivers/gpu/drm/i915/display/intel_quirks.c      | 10 ++++++++++
 drivers/gpu/drm/i915/i915_drv.h                  |  1 +
 4 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 015854b5078c..1fb885cc86c9 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -12467,6 +12467,8 @@ int intel_modeset_init_noirq(struct drm_i915_private *i915)
 	if (ret)
 		goto cleanup_bios;
 
+	intel_init_quirks(i915);
+
 	/* FIXME: completely on the wrong abstraction layer */
 	intel_power_domains_init_hw(i915, false);
 
@@ -12501,8 +12503,6 @@ int intel_modeset_init_noirq(struct drm_i915_private *i915)
 	INIT_WORK(&i915->atomic_helper.free_work,
 		  intel_atomic_helper_free_state_worker);
 
-	intel_init_quirks(i915);
-
 	intel_fbc_init(i915);
 
 	return 0;
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index cce1a926fcc1..eeaba3dc064b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -2090,8 +2090,14 @@ __intel_display_power_get_domain(struct drm_i915_private *dev_priv,
 	if (intel_display_power_grab_async_put_ref(dev_priv, domain))
 		return;
 
-	for_each_power_domain_well(dev_priv, power_well, BIT_ULL(domain))
+	for_each_power_domain_well(dev_priv, power_well, BIT_ULL(domain)) {
+		if (domain == POWER_DOMAIN_INIT &&
+		    (dev_priv->quirks & QUIRK_NO_VLV_DISP_PW_DPIO_CMN_BC_INIT) &&
+		    power_well->desc->id == VLV_DISP_PW_DPIO_CMN_BC)
+			continue;
+
 		intel_power_well_get(dev_priv, power_well);
+	}
 
 	power_domains->domain_use_count[domain]++;
 }
@@ -2184,8 +2190,14 @@ __intel_display_power_put_domain(struct drm_i915_private *dev_priv,
 
 	power_domains->domain_use_count[domain]--;
 
-	for_each_power_domain_well_reverse(dev_priv, power_well, BIT_ULL(domain))
+	for_each_power_domain_well_reverse(dev_priv, power_well, BIT_ULL(domain)) {
+		if (domain == POWER_DOMAIN_INIT &&
+		    (dev_priv->quirks & QUIRK_NO_VLV_DISP_PW_DPIO_CMN_BC_INIT) &&
+		    power_well->desc->id == VLV_DISP_PW_DPIO_CMN_BC)
+			continue;
+
 		intel_power_well_put(dev_priv, power_well);
+	}
 }
 
 static void __intel_display_power_put(struct drm_i915_private *dev_priv,
diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/drm/i915/display/intel_quirks.c
index 8a52b7a16774..c377f515bbf4 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.c
+++ b/drivers/gpu/drm/i915/display/intel_quirks.c
@@ -59,6 +59,13 @@ static void quirk_no_pps_backlight_power_hook(struct drm_i915_private *i915)
 	drm_info(&i915->drm, "Applying no pps backlight power quirk\n");
 }
 
+/* The Xiaomi Mi Pad 2 CHT tablet hangs on enabling the dpio-common-bc well */
+static void quirk_no_vlv_disp_pw_dpio_cmn_bc_init(struct drm_i915_private *i915)
+{
+	i915->quirks |= QUIRK_NO_VLV_DISP_PW_DPIO_CMN_BC_INIT;
+	drm_info(&i915->drm, "Applying no dpio-common-bc powerwell init quirk\n");
+}
+
 struct intel_quirk {
 	int device;
 	int subsystem_vendor;
@@ -190,6 +197,9 @@ static struct intel_quirk intel_quirks[] = {
 	/* ASRock ITX*/
 	{ 0x3185, 0x1849, 0x2212, quirk_increase_ddi_disabled_time },
 	{ 0x3184, 0x1849, 0x2212, quirk_increase_ddi_disabled_time },
+
+	/* Xiaomi Mi Pad 2 */
+	{ 0x22b0, 0x1d72, 0x1502, quirk_no_vlv_disp_pw_dpio_cmn_bc_init },
 };
 
 void intel_init_quirks(struct drm_i915_private *i915)
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 005b1cec7007..b907b49b4f0e 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -524,6 +524,7 @@ struct i915_drrs {
 #define QUIRK_INCREASE_T12_DELAY (1<<6)
 #define QUIRK_INCREASE_DDI_DISABLED_TIME (1<<7)
 #define QUIRK_NO_PPS_BACKLIGHT_POWER_HOOK (1<<8)
+#define QUIRK_NO_VLV_DISP_PW_DPIO_CMN_BC_INIT (1<<9)
 
 struct intel_fbdev;
 struct intel_fbc_work;
-- 
2.31.1

