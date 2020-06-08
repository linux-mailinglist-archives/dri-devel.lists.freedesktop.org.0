Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A92B81F34E9
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 09:35:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FD4589B57;
	Tue,  9 Jun 2020 07:35:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA256E51A;
 Mon,  8 Jun 2020 12:55:58 +0000 (UTC)
IronPort-SDR: I1GjdPEjxOBaKN4g3+Rkc8amQcjepfwpoBk3BKGjtuLidvLBuh2nVSLF7DHUfDoV1ThBI218AY
 9dBmvysdbnCA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2020 05:55:42 -0700
IronPort-SDR: YMTtf9LtzCA+Fx3BKfkswyKevs/R7Wz3cr4ojWM5YYlDjeaaQoGG8r6F+hMyE9psqP81iWftVT
 fB06DdDIq6dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,487,1583222400"; d="scan'208";a="295440241"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga004.fm.intel.com with ESMTP; 08 Jun 2020 05:55:40 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jiHJW-00BgLB-PO; Mon, 08 Jun 2020 15:55:42 +0300
Date: Mon, 8 Jun 2020 15:55:42 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 04/15] pwm: lpss: Fix off by one error in base_unit
 math in pwm_lpss_prepare()
Message-ID: <20200608125542.GM2428291@smile.fi.intel.com>
References: <20200607181840.13536-1-hdegoede@redhat.com>
 <20200607181840.13536-5-hdegoede@redhat.com>
 <20200608035512.GA2428291@smile.fi.intel.com>
 <c8a8d466-9b4a-9021-ca74-01d315e99117@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c8a8d466-9b4a-9021-ca74-01d315e99117@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Tue, 09 Jun 2020 07:35:06 +0000
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
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 08, 2020 at 01:13:01PM +0200, Hans de Goede wrote:
> On 6/8/20 5:55 AM, Andy Shevchenko wrote:
> > On Sun, Jun 07, 2020 at 08:18:29PM +0200, Hans de Goede wrote:
> > > According to the data-sheet the way the PWM controller works is that
> > > each input clock-cycle the base_unit gets added to a N bit counter and
> > > that counter overflowing determines the PWM output frequency.
> > > 
> > > So assuming e.g. a 16 bit counter this means that if base_unit is set to 1,
> > > after 65535 input clock-cycles the counter has been increased from 0 to
> > > 65535 and it will overflow on the next cycle, so it will overflow after
> > > every 65536 clock cycles and thus the calculations done in
> > > pwm_lpss_prepare() should use 65536 and not 65535.
> > > 
> > > This commit fixes this. Note this also aligns the calculations in
> > > pwm_lpss_prepare() with those in pwm_lpss_get_state().
> > 
> > This one sounds like a bug which I have noticed on Broxton (but thought as a
> > hardware issue). In any case it has to be tested on various platforms to see
> > how it affects on them.
> 
> If you like at the datasheet / read my commit description then it
> becomes obvious that because of the way the PWM controller works that
> it takes the full 2^(base-unit-bits) for the counter to overflow,
> not 2^(base-unit-bits) - 1. This will make a difference of a factor
> 65535/65536 in the output frequency which will be tricky to measure.
> 
> IOW I'm not sure we can really test if this helps, but it is
> obviously the right thing to do and it aligns the pwm_apply code
> with the pwm_get_state code which already does not have the - 1.

Yes. It seems I did a mistake in the commit
684309e5043e ("pwm: lpss: Avoid potential overflow of base_unit")
when missed multiplication.

For this one

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
