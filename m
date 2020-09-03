Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCD325C03C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 13:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A2E6E9C8;
	Thu,  3 Sep 2020 11:24:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 096D46E9D0
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 11:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599132292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yBZnW0uEhs9/IogdfbWxz1WbKxUqUn2zepvhTOAX9YU=;
 b=D24uhsdjnE0xuPVjXcx/GzIdDkcFWWr85yj2Bk/iV/BLomdPUyNvO0ksyP0Osdw3SRTmlG
 1s4HrZM9UdKEEmnyS+1h2gsSEZ/ntH4+ZRLvqgtyy2jtiDGEkwCSIfs7WV7sdM38eL/6DR
 dib9Iis8fnYciafETVC/z3yZ0NuSqk8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-qa9iJHyvMaC3FbI8_BYOBQ-1; Thu, 03 Sep 2020 07:24:50 -0400
X-MC-Unique: qa9iJHyvMaC3FbI8_BYOBQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5430A640C2;
 Thu,  3 Sep 2020 11:24:48 +0000 (UTC)
Received: from x1.localdomain (ovpn-113-3.ams2.redhat.com [10.36.113.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE8BD5C1C2;
 Thu,  3 Sep 2020 11:24:44 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>
Subject: [PATCH v10 16/17] drm/i915: panel: Honor the VBT PWM min setting for
 devs with an external PWM controller
Date: Thu,  3 Sep 2020 13:23:36 +0200
Message-Id: <20200903112337.4113-17-hdegoede@redhat.com>
In-Reply-To: <20200903112337.4113-1-hdegoede@redhat.com>
References: <20200903112337.4113-1-hdegoede@redhat.com>
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

So far for devices using an external PWM controller (devices using
pwm_setup_backlight()), we have been hardcoding the minimum allowed
PWM level to 0. But several of these devices specify a non 0 minimum
setting in their VBT.

Change pwm_setup_backlight() to use get_backlight_min_vbt() to get
the minimum level.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_panel.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
index 5a13089d2fc0..2b27f9b07403 100644
--- a/drivers/gpu/drm/i915/display/intel_panel.c
+++ b/drivers/gpu/drm/i915/display/intel_panel.c
@@ -1925,8 +1925,8 @@ static int pwm_setup_backlight(struct intel_connector *connector,
 	 */
 	pwm_apply_args(panel->backlight.pwm);
 
-	panel->backlight.min = 0; /* 0% */
 	panel->backlight.max = 100; /* 100% */
+	panel->backlight.min = get_backlight_min_vbt(connector);
 	level = intel_panel_compute_brightness(connector, 100);
 	ns = DIV_ROUND_UP(level * panel->backlight.pwm_period_ns, 100);
 
@@ -1941,8 +1941,9 @@ static int pwm_setup_backlight(struct intel_connector *connector,
 
 	level = DIV_ROUND_UP_ULL(pwm_get_duty_cycle(panel->backlight.pwm) * 100,
 				 panel->backlight.pwm_period_ns);
-	panel->backlight.level =
-		intel_panel_compute_brightness(connector, level);
+	level = intel_panel_compute_brightness(connector, level);
+	panel->backlight.level = clamp(level, panel->backlight.min,
+				       panel->backlight.max);
 	panel->backlight.enabled = panel->backlight.level != 0;
 
 	drm_info(&dev_priv->drm, "Using %s PWM for LCD backlight control\n",
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
