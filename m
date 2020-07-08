Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF4421923C
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 23:15:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA33B6E937;
	Wed,  8 Jul 2020 21:15:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 189266E936
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 21:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594242947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wFxzn0JHmm3vfb35/XuLlaLchu4vOFUQ8XAR0bQcpag=;
 b=i/mGyX77Vf8ByhcNNheQBuaLYi+/UhQA09o3yz6m5VEJUSQhwjTIsPiwJn+92Gq4Ok58mA
 UkutWLnJXUBRXbnJOR3edfW418DL16r5cfQeMVscbsec+2l5+/R2BDh5tveIgzhk1mJi8z
 NHrYMa1M3cknan0h92pLQkT4Shf9a9c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-t-eZnLqsM_a4OECYjRIqfQ-1; Wed, 08 Jul 2020 17:15:43 -0400
X-MC-Unique: t-eZnLqsM_a4OECYjRIqfQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7B5E18FF666;
 Wed,  8 Jul 2020 21:15:40 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-5.ams2.redhat.com [10.36.112.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24AE279220;
 Wed,  8 Jul 2020 21:15:37 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>
Subject: [PATCH v4 15/16] drm/i915: panel: Honor the VBT PWM min setting for
 devs with an external PWM controller
Date: Wed,  8 Jul 2020 23:14:31 +0200
Message-Id: <20200708211432.28612-16-hdegoede@redhat.com>
In-Reply-To: <20200708211432.28612-1-hdegoede@redhat.com>
References: <20200708211432.28612-1-hdegoede@redhat.com>
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
index 14e611c92194..cb28b9908ca4 100644
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
 
 	level = DIV_ROUND_UP(pwm_get_duty_cycle(panel->backlight.pwm) * 100,
 			     panel->backlight.pwm_period_ns);
-	panel->backlight.level =
-		intel_panel_compute_brightness(connector, level);
+	level = intel_panel_compute_brightness(connector, level);
+	panel->backlight.level = clamp(level, panel->backlight.min,
+				       panel->backlight.max);
 	panel->backlight.enabled = panel->backlight.level != 0;
 
 	drm_info(&dev_priv->drm, "Using %s PWM for LCD backlight control\n",
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
