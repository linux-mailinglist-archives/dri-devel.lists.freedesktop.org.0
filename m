Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C971F82C3
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jun 2020 12:18:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 798386E426;
	Sat, 13 Jun 2020 10:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B606E949;
 Fri, 12 Jun 2020 11:57:33 +0000 (UTC)
IronPort-SDR: S4+kuPdOf5Q80ZZl3hv8SjCTFuaFWF/mMhCtd9gjd/lvafTcRhOr2Z0uDvSYjvfqk3tOsXwDVl
 7nNmoS8QC1/A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2020 04:57:33 -0700
IronPort-SDR: ABSPo+JBvBU79vQhZigciL7kR9UOM6gudQ79a9E/eot+fTbjWJoQC0Uc00I99Okq50ZXR+JZHs
 +RV39hC8Hnhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,503,1583222400"; d="scan'208";a="296922866"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga004.fm.intel.com with ESMTP; 12 Jun 2020 04:57:30 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jjiJQ-00CYBT-2r; Fri, 12 Jun 2020 14:57:32 +0300
Date: Fri, 12 Jun 2020 14:57:32 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2 03/15] pwm: lpss: Add range limit check for the
 base_unit register value
Message-ID: <20200612115732.GC2428291@smile.fi.intel.com>
References: <20200607181840.13536-1-hdegoede@redhat.com>
 <20200607181840.13536-4-hdegoede@redhat.com>
 <20200608035023.GZ2428291@smile.fi.intel.com>
 <90769dc0-3174-195b-34e0-ef4bb9d9b982@redhat.com>
 <20200611221242.3bjqvnhcwwxaocxy@taurus.defre.kleine-koenig.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200611221242.3bjqvnhcwwxaocxy@taurus.defre.kleine-koenig.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Sat, 13 Jun 2020 10:16:46 +0000
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
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Hans de Goede <hdegoede@redhat.com>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 12, 2020 at 12:12:42AM +0200, Uwe Kleine-K=F6nig wrote:
> On Mon, Jun 08, 2020 at 01:07:12PM +0200, Hans de Goede wrote:
> > On 6/8/20 5:50 AM, Andy Shevchenko wrote:
> > > On Sun, Jun 07, 2020 at 08:18:28PM +0200, Hans de Goede wrote:
> > > > When the user requests a high enough period ns value, then the
> > > > calculations in pwm_lpss_prepare() might result in a base_unit valu=
e of 0.
> > > > =

> > > > But according to the data-sheet the way the PWM controller works is=
 that
> > > > each input clock-cycle the base_unit gets added to a N bit counter =
and
> > > > that counter overflowing determines the PWM output frequency. Addin=
g 0
> > > > to the counter is a no-op. The data-sheet even explicitly states th=
at
> > > > writing 0 to the base_unit bits will result in the PWM outputting a
> > > > continuous 0 signal.
> > > =

> > > So, and why it's a problem?
> > =

> > Lets sya the user requests a PWM output frequency of 100Hz on Cherry Tr=
ail
> > which has a 19200000 Hz clock this will result in 100 * 65536 / 1920000=
0 =3D
> > 0.3 -> 0 as base-unit value. So instead of getting 100 Hz the user will
> > now get a pin which is always outputting low.
> =

> I didn't follow the complete discussion but note that the general rule
> is:
> =

> 	round period down to the next possible implementable period
> 	round duty_cycle down to the next possible implementable duty_cycle
> =

> so if a small enough period (and so a small duty_cycle) is requested it
> is expected that duty_cycle will be zero.

...which brings me an idea that PWM framework should expose API to get a
capabilities, like DMA Engine has.

In such capabilities, in particular, caller can get ranges of the correct
frequencies of the underneath hardware.

-- =

With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
