Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 792A225C01B
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 13:23:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FAD86E9AA;
	Thu,  3 Sep 2020 11:23:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830A36E9A8
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 11:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599132229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c+wC7ixkxZtL6B/Ur8An//2LHjZwp8cEzzDSJyc9S+g=;
 b=J+nPTsrf1k9dtdvD4k6E/TlzZ54UWC93g1s/7AXada02MsHFu5/ILRXkDtLoPtYaYjby7m
 Qd3C5T4Vj6ER8wpDOw2LeTj6JnOKuEerSCK4VKvQR/IJLAPNxP/Ch6MLLGMn4bZn/7TJ/N
 19enBmCwtgJbM+L4xpFy5GHhHzkiq8Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-02yKD_ADPoeG4RVMWn-kPw-1; Thu, 03 Sep 2020 07:23:47 -0400
X-MC-Unique: 02yKD_ADPoeG4RVMWn-kPw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6114801AB3;
 Thu,  3 Sep 2020 11:23:45 +0000 (UTC)
Received: from x1.localdomain (ovpn-113-3.ams2.redhat.com [10.36.113.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D88925C1C2;
 Thu,  3 Sep 2020 11:23:42 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>
Subject: [PATCH v10 01/17] ACPI / LPSS: Resume Cherry Trail PWM controller in
 no-irq phase
Date: Thu,  3 Sep 2020 13:23:21 +0200
Message-Id: <20200903112337.4113-2-hdegoede@redhat.com>
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
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DSDTs on most Cherry Trail devices have an ugly clutch where the PWM
controller gets poked from the _PS0 method of the graphics-card device:

	Local0 = PSAT /* \_SB_.PCI0.GFX0.PSAT */
	If (((Local0 & 0x03) == 0x03))
	{
	    PSAT &= 0xFFFFFFFC
	    Local1 = PSAT /* \_SB_.PCI0.GFX0.PSAT */
	    RSTA = Zero
	    RSTF = Zero
	    RSTA = One
	    RSTF = One
	    PWMB |= 0xC0000000
	    PWMC = PWMB /* \_SB_.PCI0.GFX0.PWMB */
	}

Where PSAT is the power-status register of the PWM controller, so if it
is in D3 when the GFX0 device's PS0 method runs then it will turn it on
and restore the PWM ctrl register value it saved from its PS3 handler.
Note not only does it restore it, it ors it with 0xC0000000 turning it
on at a time where we may not want it to get turned on at all.

The pwm_get call which the i915 driver does to get a reference to the
PWM controller, already adds a device-link making the GFX0 device a
consumer of the PWM device. So it should already have been resumed when
the above AML runs and the AML should thus not do its undesirable poking
of the PWM controller register.

But the PCI core powers on PCI devices in the no-irq resume phase and
thus calls the troublesome PS0 method in the no-irq resume phase.
Where as LPSS devices by default are resumed in the early resume phase.

This commit sets the resume_from_noirq flag in the bsw_pwm_dev_desc
struct, so that Cherry Trail PWM controllers will be resumed in the
no-irq phase. Together with the device-link added by the pwm-get this
ensures that the PWM controller will be on when the troublesome PS0
method runs, which stops it from poking the PWM controller.

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/acpi/acpi_lpss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/acpi/acpi_lpss.c b/drivers/acpi/acpi_lpss.c
index 5e2bfbcf526f..67892fc0b822 100644
--- a/drivers/acpi/acpi_lpss.c
+++ b/drivers/acpi/acpi_lpss.c
@@ -257,6 +257,7 @@ static const struct lpss_device_desc bsw_pwm_dev_desc = {
 	.flags = LPSS_SAVE_CTX | LPSS_NO_D3_DELAY,
 	.prv_offset = 0x800,
 	.setup = bsw_pwm_setup,
+	.resume_from_noirq = true,
 };
 
 static const struct lpss_device_desc byt_uart_dev_desc = {
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
