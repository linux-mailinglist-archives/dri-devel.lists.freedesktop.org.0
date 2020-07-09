Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D72221A389
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 17:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE9B6EA9F;
	Thu,  9 Jul 2020 15:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8C16E0BA;
 Thu,  9 Jul 2020 15:23:19 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 65A69804C8;
 Thu,  9 Jul 2020 17:23:16 +0200 (CEST)
Date: Thu, 9 Jul 2020 17:23:14 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v4 00/15] acpi/pwm/i915: Convert pwm-crc and i915
 driver's PWM code to use the atomic PWM API
Message-ID: <20200709152314.GA233132@ravnborg.org>
References: <20200708211432.28612-1-hdegoede@redhat.com>
 <20200709141407.GA226971@ravnborg.org>
 <fb370663-9efe-a820-2e57-d43d3af7828c@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fb370663-9efe-a820-2e57-d43d3af7828c@redhat.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8 a=ISncdtaFCDb5yrYJnEIA:9
 a=U5XkNeA9I98Y5_jT:21 a=nvJk_VNiUKGhWGwL:21 a=CjuIK1q_8ugA:10
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: linux-pwm@vger.kernel.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-acpi@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Thu, Jul 09, 2020 at 04:40:56PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 7/9/20 4:14 PM, Sam Ravnborg wrote:
> > Hi Hans.
> > 
> > On Wed, Jul 08, 2020 at 11:14:16PM +0200, Hans de Goede wrote:
> > > Hi All,
> > > 
> > > Here is v4 of my patch series converting the i915 driver's code for
> > > controlling the panel's backlight with an external PWM controller to
> > > use the atomic PWM API. See below for the changelog.
> > 
> > Why is it that i915 cannot use the pwm_bl driver for backlight?
> > I have not studied the code - just wondering.
> 
> The intel_panel.c code deals with 7 different types of PWM controllers
> which are built into the GPU + support for external PWM controllers
> through the kernel's PWM subsystem.
> 
> pwm_bl will work for the external PWM controller case, but not for
> the others. On top of that the intel_panel code integrates which
> the video BIOS, getting things like frequency, minimum value
> and if the range is inverted (0% duty == backlight brightness max).
> I'm not even sure if pwm_bl supports all of this, but even if it
> does the intel_panel code handles this in a unified manner for
> all supported PWM controllers, including the ones which are
> an integral part of the GPU.

Thanks for the explanation.
This is a more complicated world than the usual embedded case with a
single pwm, no BIOS etc. So it makes sense.

	Sam

> 
> Regards,
> 
> Hans
> 
> 
> 
> > > Initially the plan was for this series to consist of 2 parts:
> > > 1. convert the pwm-crc driver to support the atomic PWM API and
> > > 2. convert the i915 driver's PWM code to use the atomic PWM API.
> > > 
> > > But during testing I've found a number of bugs in the pwm-lpss and I
> > > found that the acpi_lpss code needs some special handling because of
> > > some ugliness found in most Cherry Trail DSDTs.
> > > 
> > > So now this series has grown somewhat large and consists of 4 parts:
> > > 
> > > 1. acpi_lpss fixes workarounds for Cherry Trail DSTD nastiness
> > > 2. various fixes to the pwm-lpss driver
> > > 3. convert the pwm-crc driver to support the atomic PWM API and
> > > 4. convert the i915 driver's PWM code to use the atomic PWM API
> > > 
> > > The involved acpi_lpss and pwm drivers do not see a whole lot of churn,
> > > so the plan is to merge this all through drm-intel-next-queued (dinq)
> > > once all the patches are reviewed / have acks.
> > > 
> > > In v4 the ACPI patches have been Acked by Rafael and the i915 patches
> > > have been acked by Jani. So that just leaves the PWM patches.
> > > 
> > > Uwe can I get your ok / ack for merging this through the dinq branch
> > > once you have acked al the PWM patches ?
> > > 
> > > This series has been tested (and re-tested after adding various bug-fixes)
> > > extensively. It has been tested on the following devices:
> > > 
> > > -Asus T100TA  BYT + CRC-PMIC PWM
> > > -Toshiba WT8-A  BYT + CRC-PMIC PWM
> > > -Thundersoft TS178 BYT + CRC-PMIC PWM, inverse PWM
> > > -Asus T100HA  CHT + CRC-PMIC PWM
> > > -Terra Pad 1061  BYT + LPSS PWM
> > > -Trekstor Twin 10.1 BYT + LPSS PWM
> > > -Asus T101HA  CHT + CRC-PMIC PWM
> > > -GPD Pocket  CHT + CRC-PMIC PWM
> > > 
> > > Changelog:
> > > 
> > > Changes in v2:
> > > - Fix coverletter subject
> > > - Drop accidentally included debugging patch
> > > - "[PATCH v3 02/15] ACPI / LPSS: Save Cherry Trail PWM ctx registers only once (
> > >    - Move #define LPSS_SAVE_CTX_ONCE define to group it with LPSS_SAVE_CTX
> > > 
> > > Changes in v3:
> > > - "[PATCH v3 04/15] pwm: lpss: Add range limit check for the base_unit register value"
> > >    - Use base_unit_range - 1 as maximum value for the clamp()
> > > - "[PATCH v3 05/15] pwm: lpss: Use pwm_lpss_apply() when restoring state on resume"
> > >    - This replaces the "pwm: lpss: Set SW_UPDATE bit when enabling the PWM"
> > >      patch from previous versions of this patch-set, which really was a hack
> > >      working around the resume issue which this patch fixes properly.
> > > - PATCH v3 6 - 11 pwm-crc changes:
> > >    - Various small changes resulting from the reviews by Andy and Uwe,
> > >      including some refactoring of the patches to reduce the amount of churn
> > >      in the patch-set
> > > 
> > > Changes in v4:
> > > - "[PATCH v4 06/16] pwm: lpss: Correct get_state result for base_unit == 0"
> > >    - This is a new patch in v4 of this patchset
> > > - "[PATCH v4 12/16] pwm: crc: Implement get_state() method"
> > >    - Use DIV_ROUND_UP when calculating the period and duty_cycle values
> > > - "[PATCH v4 16/16] drm/i915: panel: Use atomic PWM API for devs with an external PWM controller"
> > >    - Add a note to the commit message about the changes in pwm_disable_backlight()
> > >    - Use the pwm_set/get_relative_duty_cycle() helpers
> > > 
> > > Regards,
> > > 
> > > Hans
> > > 
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
