Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1196223CDE
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 15:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1422E6EDAB;
	Fri, 17 Jul 2020 13:38:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A566EDAB
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 13:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594993083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=rkMZSQba86giMjUJYDHSci638nlcSpXyRKRn/y8AUNM=;
 b=AC3TMdcobbjdEvKw4gq/jrCI/gx6OINSNzEVVjYJ59AXMASpGRLuPzxLvBzMmTJA2k9KxA
 czSuXKX0TXVkxNqsaQU9TBt0J/LA9nj1VGC2EZgDL2sbB3G4SmlSmfFNvJuqdpfz2cj8iO
 roFW/+gN8u0KOB0Ekt7l7aqn3NOCtzo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-glvKm1WQP0S1InhgB9-oQQ-1; Fri, 17 Jul 2020 09:37:59 -0400
X-MC-Unique: glvKm1WQP0S1InhgB9-oQQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67A401081;
 Fri, 17 Jul 2020 13:37:57 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-162.ams2.redhat.com
 [10.36.112.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9895E8FA27;
 Fri, 17 Jul 2020 13:37:54 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>
Subject: [PATCH v5 00/16] acpi/pwm/i915: Convert pwm-crc and i915 driver's PWM
 code to use the atomic PWM API
Date: Fri, 17 Jul 2020 15:37:37 +0200
Message-Id: <20200717133753.127282-1-hdegoede@redhat.com>
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
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

Here is v5 of my patch series converting the i915 driver's code for
controlling the panel's backlight with an external PWM controller to
use the atomic PWM API. See below for the changelog.

This series consists of 4 parts:

1. acpi_lpss fixes workarounds for Cherry Trail DSTD nastiness
2. various fixes to the pwm-lpss driver
3. convert the pwm-crc driver to support the atomic PWM API and
4. convert the i915 driver's PWM code to use the atomic PWM API

The involved acpi_lpss and pwm drivers do not see a whole lot of churn,
so the plan is to merge this all through drm-intel-next-queued (dinq)
once all the patches are reviewed / have acks.

Specifically patches 5-9, 11 still need an Acked- / Reviewed-by

Andy, can you please take a look at the unreviewed patches? Specifically
patches 5-6 should address your review remarks from v4 of this set
and I've addressed your review remarks on patches 7-9 in v3 already.
A review of patch 11 would also be welcome

Uwe, can you please take a look at the unreviewed patches?

Uwe, may I have your Acked-by for merging this series through the
drm-intel-next-queued branch once all PWM patches have an Acked- or
Reviewed-by ?

This series has been tested (and re-tested after adding various bug-fixes)
extensively. It has been tested on the following devices:

-Asus T100TA  BYT + CRC-PMIC PWM
-Toshiba WT8-A  BYT + CRC-PMIC PWM
-Thundersoft TS178 BYT + CRC-PMIC PWM, inverse PWM
-Asus T100HA  CHT + CRC-PMIC PWM
-Terra Pad 1061  BYT + LPSS PWM
-Trekstor Twin 10.1 BYT + LPSS PWM
-Asus T101HA  CHT + CRC-PMIC PWM
-GPD Pocket  CHT + CRC-PMIC PWM

Changelog:
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

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
