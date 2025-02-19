Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A83DAA3C315
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 16:07:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C0C610E825;
	Wed, 19 Feb 2025 15:07:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ambPcevD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B8010E825
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 15:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739977661; x=1771513661;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=qLMt/EjgXexfc92vAw0wlJWhv6oYot1ftBwA0iHaP28=;
 b=ambPcevDRaFUJRHr/IVKK0C0DqPIY4hZH+PNhHe6J+OKoEwTAvzKLOVz
 TZdUEw6VVmkLfwKnM41aPwK96b1RQczb2fszW7LuPOCatHMCKS2d0NJLN
 u6cQBkMI+bVcb/+Jfmt/1cEO3EaQC0JbAcvohGJ2fUnD/+KH3BXeryAx7
 CNsYkEFgulg6ypEMtFbPKLgzFpQuzR6J2B2Njr96BxvulHe5/4pZ5VP2i
 OOghfAbDNhZLtFQkuB0CpLmgx3vmZUx6JMpWQ33iT/NvVSITRBNUpU+pc
 fmFhOByjHQJpSbVewoxp0r3eoRQzuKXswY2DmYLPqZrpX9dMJ8+2+KuPv w==;
X-CSE-ConnectionGUID: TXAjHvxmSquEz3bv6w+5fg==
X-CSE-MsgGUID: Sx1UjIpaSVGkK7CeIs4znQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="58127014"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="58127014"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 07:06:49 -0800
X-CSE-ConnectionGUID: OB0MzcPQQFC05yUlRCyNdg==
X-CSE-MsgGUID: Qu6UFl4VQgGe64cmCmVi0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="114593212"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 07:06:45 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tkles-0000000D3UY-0lnR; Wed, 19 Feb 2025 17:06:42 +0200
Date: Wed, 19 Feb 2025 17:06:41 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Pavel Machek <pavel@ucw.cz>,
 Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mfd: lm3533: convert to use OF
Message-ID: <Z7XzgfHcjyK_UZKv@smile.fi.intel.com>
References: <20250218132702.114669-1-clamor95@gmail.com>
 <20250218132702.114669-3-clamor95@gmail.com>
 <Z7XqKcOUt5niXzpv@smile.fi.intel.com>
 <CAPVz0n1_WQyOHhtEVAh53uhEUhZvqqZSEJh6XALtSrVfkMSLYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n1_WQyOHhtEVAh53uhEUhZvqqZSEJh6XALtSrVfkMSLYw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 19, 2025 at 04:36:38PM +0200, Svyatoslav Ryhel wrote:
> ср, 19 лют. 2025 р. о 16:27 Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> пише:
> > On Tue, Feb 18, 2025 at 03:27:00PM +0200, Svyatoslav Ryhel wrote:
> > > Remove platform data and fully relay on OF and device tree
> > > parsing and binding devices.
> >
> > Thanks for following the advice, but the problem with this change as it does
> > too much at once. It should be split to a few simpler ones.
> > On top of that, this removes MFD participation from the driver but leaves it
> > under MFD realm. Moreover, looking briefly at the code it looks like it open
> > codes the parts of MFD. The latter needs a very goo justification which commit
> > message is missing.

...

> Splitting this into a set of commits would be nearly impossible,

I don't buy this.
One patch can introduce device property support.
Another one removes the old platform data interface.

So, at bare minimum there will be two patches. (Besides the advice to have
two more.)

> original driver does not relay on OF, it relays on platform data.

And?..

> Ripping out platform data will leave behind a broken useless driver.

Hmm... This cna be the case if and only if we have the user in kernel.
Is this the case?

> So it has to be done simultaneously.

Nope.

> MFD part is removed since MFD cells binding is unconditional, while
> the device supports any amount of children grater then one. For
> example, my  device uses only backlight at bank A, while all other
> subdevices are not present and used. This patch switches to dynamic
> bind of children.

MFD does the same. Please, take your time and get familiar with how MFD works.

...

> > > +     device_property_read_string(&pdev->dev, "linux,default-trigger",
> > > +                                 &led->cdev.default_trigger);
> >
> > One prerequisite patch you probably want is an introduction of
> >
> >         struct device *dev = &pdev->dev;
> >
> > in the respective ->probe() implementations. This, in particular, makes the
> > above lines shorter and fit one line.
> 
> This is not a scope of this patchset. Original driver uses &pdev->dev

Indirectly it is. The change you are proposing tries to continue using this
construction with making needlessly longer.

...

> > > +             if (!strcmp(comatible, "ti,lm3533-als"))
> > > +                     lm3533->have_als = 1;
> >
> > If you end up having this, it's not the best what we can do. OF ID tables have
> > a driver_data field exactly for the cases like this.
> 
> This is required by core driver to handle some attributes and is here
> solely not to touch those in this patch.

What does this mean?

-- 
With Best Regards,
Andy Shevchenko


