Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1025256DB8
	for <lists+dri-devel@lfdr.de>; Sun, 30 Aug 2020 14:58:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF7A6E29E;
	Sun, 30 Aug 2020 12:58:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B89916E29E
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Aug 2020 12:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598792284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=mTcG81+e5ooagURVW0RXzcs3CQJCwmeINieDCvAZZnM=;
 b=Oo+zxnqypxuQUPGD3V0A4r7Y3+8hRRpVrq4T/MtQLJmlsygI1hph0lWJB+GWrbAe/eEAYn
 oAtGGSy4hx+sTOJHtk7ibPRk4liArhMcjWG8E9qZq5tD6x+whDSXKWFSeca9oCp/ib+ADX
 5xlYiYym1wnbiTZZpyoGjbsPdTAY7D8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-2s25wwNrMQ2ioht6N4s9Tw-1; Sun, 30 Aug 2020 08:58:02 -0400
X-MC-Unique: 2s25wwNrMQ2ioht6N4s9Tw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3D7B801AC5;
 Sun, 30 Aug 2020 12:57:59 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-77.ams2.redhat.com [10.36.112.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF5661A918;
 Sun, 30 Aug 2020 12:57:55 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>
Subject: [PATCH v8 00/17] acpi/pwm/i915: Convert pwm-crc and i915 driver's PWM
 code to use the atomic PWM API
Date: Sun, 30 Aug 2020 14:57:36 +0200
Message-Id: <20200830125753.230420-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

Unfortunately while testing some unrelated things I found another issue with
this series related to the CHT ACPI GFX0._PS3 code poking the PWM controller
in unexpected ways.

This new version contains a new patch: "[PATCH v8 07/17] pwm: lpss: Always
update state and set update bit" fixing this.  It also contains the same
change in: "PATCH v8 06/17] pwm: lpss: Use pwm_lpss_restore() when restoring
state on resume". Rather then adding the below check and then dropping it in
the new patch, I've squashed the dropping of these lines:

		/* If we did not reach S0i3/S3 the controller keeps its state */
		if (ctrl == lpwm->saved_ctrl[i])
			continue;

Directly into the original commit leading to a cleaner history.

As discussed before, because of interdependencies of the patches
I plan to push the entire series to drm-intel-next-queued once the
series has passed CI.

I still plan to do this as soon as I get a Reviewed-by or Acked-by for
the new pwm-lpss.c patch.

Thierry, I believe from our previous discussion that you are ok with
pushing the pwm-crc and pwm-lpss patches through the drm-intel tree,
but you have not given your Acked-by for this. If you are not ok with
me pushing these out this way please let me now ASAP. If you are ok
with this an Acked-by would be appreciated.

This series has been tested (and re-tested after adding various bug-fixes)
extensively. It has been tested on the following devices:

-Asus T100TA  BYT + CRC-PMIC PWM
-Toshiba WT8-A  BYT + CRC-PMIC PWM
-Thundersoft TS178  BYT + CRC-PMIC PWM, inverse PWM
-Asus T100HA  CHT + CRC-PMIC PWM
-Terra Pad 1061  BYT + LPSS PWM
-Trekstor Twin 10.1  BYT + LPSS PWM
-Asus T101HA  CHT + LPSS PWM
-GPD Pocket  CHT + LPSS PWM
-Acer One S1003  CHT + LPSS PWM

Regards,

Hans


Changelog:

Changes in v8:
- Add a new patch dealing with the ACPI/DSDT GFX0._PS3 code poking the PWM controller
  in unexpected ways on some Cherry Trail devices

Changes in v7:
- Fix a u64 divide leading to undefined reference to `__udivdi3' errors on 32 bit
  platforms by casting the divisor to an unsigned long

Changes in v6:
- Rebase on v5.9-rc1
- Adjust pwm-crc patches for pwm_state.period and .duty_cycle now being u64

Changes in v5:
- Dropped the "pwm: lpss: Correct get_state result for base_unit == 0"
  patch. The base_unit == 0 condition should never happen and sofar it is
  unclear what the proper behavior / correct values to store in the
  pwm_state should be when this does happen.  Since this patch was added as
  an extra pwm-lpss fix in v4 of this patch-set and otherwise is orthogonal
  to the of this patch-set just drop it (again).
- "[PATCH 04/16] pwm: lpss: Add range limit check for the base_unit register value"
  - Use clamp_val(... instead of clam_t(unsigned long long, ...
- "[PATCH 05/16] pwm: lpss: Add pwm_lpss_prepare_enable() helper"
  - This is a new patch in v5 of this patchset
- [PATCH 06/16] pwm: lpss: Use pwm_lpss_apply() when restoring state on resume
  - Use the new pwm_lpss_prepare_enable() helper

Changes in v4:
- "[PATCH v4 06/16] pwm: lpss: Correct get_state result for base_unit == 0"
  - This is a new patch in v4 of this patchset
- "[PATCH v4 12/16] pwm: crc: Implement get_state() method"
  - Use DIV_ROUND_UP when calculating the period and duty_cycle values
- "[PATCH v4 16/16] drm/i915: panel: Use atomic PWM API for devs with an external PWM controller"
  - Add a note to the commit message about the changes in pwm_disable_backlight()
  - Use the pwm_set/get_relative_duty_cycle() helpers

Changes in v3:
- "[PATCH v3 04/15] pwm: lpss: Add range limit check for the base_unit register value"
  - Use base_unit_range - 1 as maximum value for the clamp()
- "[PATCH v3 05/15] pwm: lpss: Use pwm_lpss_apply() when restoring state on resume"
  - This replaces the "pwm: lpss: Set SW_UPDATE bit when enabling the PWM"
    patch from previous versions of this patch-set, which really was a hack
    working around the resume issue which this patch fixes properly.
- PATCH v3 6 - 11 pwm-crc changes:
  - Various small changes resulting from the reviews by Andy and Uwe,
    including some refactoring of the patches to reduce the amount of churn
    in the patch-set

Changes in v2:
- Fix coverletter subject
- Drop accidentally included debugging patch
- "[PATCH v3 02/15] ACPI / LPSS: Save Cherry Trail PWM ctx registers only once (
  - Move #define LPSS_SAVE_CTX_ONCE define to group it with LPSS_SAVE_CTX

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
