Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F580121AE2
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 21:29:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F0E6E880;
	Mon, 16 Dec 2019 20:29:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE4096E87F
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 20:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576528158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k2HGVAku3D2mh9WWpAzR5oMoHJT5K9AydRRBKoSCtI0=;
 b=OKsLA2FPWLRcAOF170sBURxXY5HdmJKH/T3AnbCugd+Ob1pDkuEsgAalIzuT5R1MuQfPDe
 nQGtUzGl1O1BpLhhV0JWjuAZ1cCypgij6CLiK/IDNiR4f/DAXcG1kwqeMUFkKE+8LqnKH6
 nfxDzulXjCVDeRgc6LqOQo08fxncpbE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-CulOLptnNGCP64Tsca-mDA-1; Mon, 16 Dec 2019 15:29:17 -0500
X-MC-Unique: CulOLptnNGCP64Tsca-mDA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68AFD800D4C;
 Mon, 16 Dec 2019 20:29:15 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1631A5C1D6;
 Mon, 16 Dec 2019 20:29:12 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Lee Jones <lee.jones@linaro.org>
Subject: [CI 2/3] mfd: intel_soc_pmic: Rename pwm_backlight pwm-lookup to
 pwm_pmic_backlight
Date: Mon, 16 Dec 2019 21:29:05 +0100
Message-Id: <20191216202906.1662893-3-hdegoede@redhat.com>
In-Reply-To: <20191216202906.1662893-1-hdegoede@redhat.com>
References: <20191216202906.1662893-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: linux-acpi@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

At least Bay Trail (BYT) and Cherry Trail (CHT) devices can use 1 of 2
different PWM controllers for controlling the LCD's backlight brightness.

Either the one integrated into the PMIC or the one integrated into the
SoC (the 1st LPSS PWM controller).

So far in the LPSS code on BYT we have skipped registering the LPSS PWM
controller "pwm_backlight" lookup entry when a Crystal Cove PMIC is
present, assuming that in this case the PMIC PWM controller will be used.

On CHT we have been relying on only 1 of the 2 PWM controllers being
enabled in the DSDT at the same time; and always registered the lookup.

So far this has been working, but the correct way to determine which PWM
controller needs to be used is by checking a bit in the VBT table and
recently I've learned about 2 different BYT devices:
Point of View MOBII TAB-P800W
Acer Switch 10 SW5-012

Which use a Crystal Cove PMIC, yet the LCD is connected to the SoC/LPSS
PWM controller (and the VBT correctly indicates this), so here our old
heuristics fail.

Since only the i915 driver has access to the VBT, this commit renames
the "pwm_backlight" lookup entries for the Crystal Cove PMIC's PWM
controller to "pwm_pmic_backlight" so that the i915 driver can do a
pwm_get() for the right controller depending on the VBT bit, instead of
the i915 driver relying on a "pwm_backlight" lookup getting registered
which magically points to the right controller.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/mfd/intel_soc_pmic_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/intel_soc_pmic_core.c b/drivers/mfd/intel_soc_pmic_core.c
index c9f35378d391..47188df3080d 100644
--- a/drivers/mfd/intel_soc_pmic_core.c
+++ b/drivers/mfd/intel_soc_pmic_core.c
@@ -38,7 +38,7 @@ static struct gpiod_lookup_table panel_gpio_table = {
 
 /* PWM consumed by the Intel GFX */
 static struct pwm_lookup crc_pwm_lookup[] = {
-	PWM_LOOKUP("crystal_cove_pwm", 0, "0000:00:02.0", "pwm_backlight", 0, PWM_POLARITY_NORMAL),
+	PWM_LOOKUP("crystal_cove_pwm", 0, "0000:00:02.0", "pwm_pmic_backlight", 0, PWM_POLARITY_NORMAL),
 };
 
 static int intel_soc_pmic_i2c_probe(struct i2c_client *i2c,
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
