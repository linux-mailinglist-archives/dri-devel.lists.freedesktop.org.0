Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A577C24FD26
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 14:01:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9553A6E20D;
	Mon, 24 Aug 2020 12:01:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A5606E20B
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 12:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598270499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=HpcDUK52/UDxZyv8A9aeHTJ/qDjPZ77nKjdZsqv7cec=;
 b=UquJzuseO9o9W2hkkOhKkXFEKvDxUtnKOgD2CFFCsVYXPS7yf1UiMJujto1YDCFTRY/bT9
 VvhJbbWxrmYpaAfpgucA0KvtSVKPC8CpVUwz5ccEwg15J3QAPcuauAZRA4USuKiuppT40P
 yRBdNxlK+FoaqqcDPue0+4vPaxcTH38=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-ZCGUcaXJNWunUf1rkjsFeQ-1; Mon, 24 Aug 2020 08:01:35 -0400
X-MC-Unique: ZCGUcaXJNWunUf1rkjsFeQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E85D801AC9;
 Mon, 24 Aug 2020 12:01:32 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-113-147.ams2.redhat.com
 [10.36.113.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E54F5D9DD;
 Mon, 24 Aug 2020 12:01:28 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>
Subject: [PATCH v6 00/16] acpi/pwm/i915: Convert pwm-crc and i915 driver's PWM
 code to use the atomic PWM API
Date: Mon, 24 Aug 2020 14:01:10 +0200
Message-Id: <20200824120126.7116-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

Here is v6 of my patch series converting the i915 driver's code for
controlling the panel's backlight with an external PWM controller to
use the atomic PWM API. See below for the changelog.

This version of the series has been rebased on 5.9-rc1 and has
a Reviewed-by or Acked-by for all patches.

The main purpose of sending this new version out is to allow the
intel-gfx CI to play with it.

As discussed before, because of interdependencies of the patches
I plan to push the entire series to drm-intel-next-queued once it
has passed CI.

Thierry, I believe from our previous discussion that you are ok with
pushing the pwm-crc and pwm-lpss patches through the drm-intel tree,
but you have not given your Acked-by for this. If you are not ok with
me pushing these out this way please let me now ASAP. If you are ok
with this an Acked-by would be appreciated.

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

Regards,

Hans


Changelog:

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
