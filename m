Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0C320F637
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 15:52:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA356E290;
	Tue, 30 Jun 2020 13:52:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB346E290;
 Tue, 30 Jun 2020 13:51:59 +0000 (UTC)
IronPort-SDR: C/do4fmwZ3M0mVXTB/4ptN/qEojbzdZB9wHyhcMHH98DZzw/99cnFYLHrnIQ1mkKewHQ/AkpyB
 mQe/zgIj4Qiw==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="134533177"
X-IronPort-AV: E=Sophos;i="5.75,297,1589266800"; d="scan'208";a="134533177"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 06:51:58 -0700
IronPort-SDR: XKukowqspT+Ukx2NVyUVAxLdfpPpXh84dw+YvvRYLdUTHkl/s+XZZxhzq5+aVOtwdf862+OOl7
 PcfQIlh2qscg==
X-IronPort-AV: E=Sophos;i="5.75,297,1589266800"; d="scan'208";a="454614744"
Received: from rgrotewx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.38.12])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 06:51:53 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, Thierry Reding
 <thierry.reding@gmail.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 Len Brown <lenb@kernel.org>
Subject: Re: [PATCH v3 00/15] acpi/pwm/i915: Convert pwm-crc and i915 driver's
 PWM code to use the atomic PWM API
In-Reply-To: <20200620121758.14836-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200620121758.14836-1-hdegoede@redhat.com>
Date: Tue, 30 Jun 2020 16:51:50 +0300
Message-ID: <874kqsmzk9.fsf@intel.com>
MIME-Version: 1.0
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

On Sat, 20 Jun 2020, Hans de Goede <hdegoede@redhat.com> wrote:
> Hi All,
>
> Here is v3 of my patch series converting the i915 driver's code for
> controlling the panel's backlight with an external PWM controller to
> use the atomic PWM API. See below for the changelog.
>
> Initially the plan was for this series to consist of 2 parts:
> 1. convert the pwm-crc driver to support the atomic PWM API and
> 2. convert the i915 driver's PWM code to use the atomic PWM API.
>
> But during testing I've found a number of bugs in the pwm-lpss and I
> found that the acpi_lpss code needs some special handling because of
> some ugliness found in most Cherry Trail DSDTs.
>
> So now this series has grown somewhat large and consists of 4 parts:
>
> 1. acpi_lpss fixes workarounds for Cherry Trail DSTD nastiness
> 2. various fixes to the pwm-lpss driver
> 3. convert the pwm-crc driver to support the atomic PWM API and
> 4. convert the i915 driver's PWM code to use the atomic PWM API
>
> So we need to discuss how to merge this (once it passes review).
> Although the inter-dependencies are only runtime I still think we should
> make sure that 1-3 are in the drm-intel-next-queued (dinq) tree before
> merging the i915 changes. Both to make sure that the intel-gfx CI system
> does not become unhappy and for bisecting reasons.
>
> The involved acpi_lpss and pwm drivers do not see a whole lot of churn, so
> it likely is the easiest to just merge everything through dinq.
>
> Rafael and Thierry, can I get your Acked-by for directly merging this into
> dinq?
>
> This series has been tested (and re-tested after adding various bug-fixes)
> extensively. It has been tested on the following devices:
>
> -Asus T100TA  BYT + CRC-PMIC PWM
> -Toshiba WT8-A  BYT + CRC-PMIC PWM
> -Thundersoft TS178 BYT + CRC-PMIC PWM, inverse PWM
> -Asus T100HA  CHT + CRC-PMIC PWM
> -Terra Pad 1061  BYT + LPSS PWM
> -Trekstor Twin 10.1 BYT + LPSS PWM
> -Asus T101HA  CHT + CRC-PMIC PWM
> -GPD Pocket  CHT + CRC-PMIC PWM

For the drm/i915 patches 12-15,

Acked-by: Jani Nikula <jani.nikula@intel.com>

I eyeballed through them, and didn't spot anything obviously wrong, but
at the same time didn't have the time to do an in-depth review. That
said, I do have a lot of trust in you testing this with all the above
devices. I think that's enough for merging.

As for that matter, I'm fine with merging this via whichever tree you
find best. Kind of stating the obvious, but please do ensure you have
the proper acks in place for this.


BR,
Jani.



>
> Changelog:
>
> Changes in v2:
> - Fix coverletter subject
> - Drop accidentally included debugging patch
> - "[PATCH v3 02/15] ACPI / LPSS: Save Cherry Trail PWM ctx registers only once (
>   - Move #define LPSS_SAVE_CTX_ONCE define to group it with LPSS_SAVE_CTX
>
> Changes in v3:
> - "[PATCH v3 04/15] pwm: lpss: Add range limit check for the base_unit register value"
>   - Use base_unit_range - 1 as maximum value for the clamp()
> - "[PATCH v3 05/15] pwm: lpss: Use pwm_lpss_apply() when restoring state on resume"
>   - This replaces the "pwm: lpss: Set SW_UPDATE bit when enabling the PWM"
>     patch from previous versions of this patch-set, which really was a hack
>     working around the resume issue which this patch fixes properly.
> - PATCH v3 6 - 11 pwm-crc changes:
>   - Various small changes resulting from the reviews by Andy and Uwe,
>     including some refactoring of the patches to reduce the amount of churn
>     in the patch-set
>
> Regards,
>
> Hans
>

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
