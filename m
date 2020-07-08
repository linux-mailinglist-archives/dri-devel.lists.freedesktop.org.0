Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CE2219203
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 23:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90B306E3A4;
	Wed,  8 Jul 2020 21:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69ADF6E395
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 21:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594242882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=1RhdEjamtv4d5zxvXmjlDsO9oFtiIZCK461hvTVAcEw=;
 b=DXUyxMM5BXmmAXdftRmlri7F6Sfu6/IFqIfQ2BATMToOwhxJhjPMr3blcUyhlhw0kYJGdP
 WNkZxr/KYOM2qS6djLuQzFRVBhiCG0VXATwDi92dEJ45Q1CHm5HaNLHwDCPzdqBedIUBcU
 8bwNYK4Ajr2UC/OQhH6AD3gIktiPsyo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-VKXkUGzSMLaTBQjmHYQklg-1; Wed, 08 Jul 2020 17:14:38 -0400
X-MC-Unique: VKXkUGzSMLaTBQjmHYQklg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CEE91005510;
 Wed,  8 Jul 2020 21:14:36 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-5.ams2.redhat.com [10.36.112.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE4B979220;
 Wed,  8 Jul 2020 21:14:33 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>
Subject: [PATCH v4 00/15] acpi/pwm/i915: Convert pwm-crc and i915 driver's PWM
 code to use the atomic PWM API
Date: Wed,  8 Jul 2020 23:14:16 +0200
Message-Id: <20200708211432.28612-1-hdegoede@redhat.com>
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

Here is v4 of my patch series converting the i915 driver's code for
controlling the panel's backlight with an external PWM controller to
use the atomic PWM API. See below for the changelog.

Initially the plan was for this series to consist of 2 parts:
1. convert the pwm-crc driver to support the atomic PWM API and
2. convert the i915 driver's PWM code to use the atomic PWM API.

But during testing I've found a number of bugs in the pwm-lpss and I
found that the acpi_lpss code needs some special handling because of
some ugliness found in most Cherry Trail DSDTs.

So now this series has grown somewhat large and consists of 4 parts:

1. acpi_lpss fixes workarounds for Cherry Trail DSTD nastiness
2. various fixes to the pwm-lpss driver
3. convert the pwm-crc driver to support the atomic PWM API and
4. convert the i915 driver's PWM code to use the atomic PWM API

The involved acpi_lpss and pwm drivers do not see a whole lot of churn,
so the plan is to merge this all through drm-intel-next-queued (dinq)
once all the patches are reviewed / have acks.

In v4 the ACPI patches have been Acked by Rafael and the i915 patches
have been acked by Jani. So that just leaves the PWM patches.

Uwe can I get your ok / ack for merging this through the dinq branch
once you have acked al the PWM patches ?

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

Changes in v2:
- Fix coverletter subject
- Drop accidentally included debugging patch
- "[PATCH v3 02/15] ACPI / LPSS: Save Cherry Trail PWM ctx registers only once (
  - Move #define LPSS_SAVE_CTX_ONCE define to group it with LPSS_SAVE_CTX

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

Changes in v4:
- "[PATCH v4 06/16] pwm: lpss: Correct get_state result for base_unit == 0"
  - This is a new patch in v4 of this patchset
- "[PATCH v4 12/16] pwm: crc: Implement get_state() method"
  - Use DIV_ROUND_UP when calculating the period and duty_cycle values
- "[PATCH v4 16/16] drm/i915: panel: Use atomic PWM API for devs with an external PWM controller"
  - Add a note to the commit message about the changes in pwm_disable_backlight()
  - Use the pwm_set/get_relative_duty_cycle() helpers

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
