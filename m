Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 635CD4B2A2E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 17:25:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F14410EAC4;
	Fri, 11 Feb 2022 16:25:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4720410EAC4
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 16:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644596725; x=1676132725;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=M1mHs7WEgatmlRjx4H6HCF+8F6e5ANVvjld7uTPgqFk=;
 b=d0ZScXuVo9Y89nzCqNfhussMpzvG1Gihy29R5vt9gwPNGWLLVxdnhtEH
 0nGy6jfAPQdQErQqfbzOk/C/i3SqMGx3DqXZC6TYcP5Qw8l7mpshoVy4u
 BX0+wEhFL+EYL+06/zOkLfbPVNNHzQXRKjbDZ8ebF8+aBnmgy+i1y/Aeb
 7pUyYJfrxe3ekYV3xDsb1i9CPk0ZcR0oPfXZBvQfcTngy1r39ya16K2tM
 A9dqXXDsizHjWnYS8MTDaaMZ5lCLmRQO4kcj3/uwdpo2kOPlG/D1pY+Pp
 klECDRvx6XiGw+/hok9BF+Bb3nNCC6YTUsoif4Avo1pdh0Hw/NM2YCpOI g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="233313755"
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; d="scan'208";a="233313755"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 08:25:24 -0800
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; d="scan'208";a="527010658"
Received: from rriverox-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.19.108])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 08:25:20 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 1/6] drm/format-helper: Add
 drm_fb_xrgb8888_to_gray8_line()
In-Reply-To: <YgaDj6Wld4b7S6DF@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220211091927.2988283-1-javierm@redhat.com>
 <20220211091927.2988283-2-javierm@redhat.com>
 <YgY6OqN+guBlt/ED@smile.fi.intel.com>
 <4fa465d9-4fac-4199-9a04-d8e09d164308@redhat.com>
 <YgZEuXvJ2ZiOyNS+@smile.fi.intel.com>
 <7560cd10-0a7c-3fda-da83-9008833e3901@suse.de> <87pmnt7gm3.fsf@intel.com>
 <YgaDj6Wld4b7S6DF@smile.fi.intel.com>
Date: Fri, 11 Feb 2022 18:25:17 +0200
Message-ID: <87fsop74lu.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 11 Feb 2022, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> On Fri, Feb 11, 2022 at 02:05:56PM +0200, Jani Nikula wrote:
>> On Fri, 11 Feb 2022, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> > Am 11.02.22 um 12:12 schrieb Andy Shevchenko:
>> >> On Fri, Feb 11, 2022 at 11:40:13AM +0100, Javier Martinez Canillas wrote:
>> >>> On 2/11/22 11:28, Andy Shevchenko wrote:
>> >>>> On Fri, Feb 11, 2022 at 10:19:22AM +0100, Javier Martinez Canillas wrote:
>
> ...
>
>> >>>>> +static void drm_fb_xrgb8888_to_gray8_line(u8 *dst, const u32 *src, unsigned int pixels)
>> >>>>> +{
>> >>>>> +	unsigned int x;
>> >>>>> +
>> >>>>> +	for (x = 0; x < pixels; x++) {
>> >>>>> +		u8 r = (*src & 0x00ff0000) >> 16;
>> >>>>> +		u8 g = (*src & 0x0000ff00) >> 8;
>> >>>>> +		u8 b =  *src & 0x000000ff;
>> >>>>> +
>> >>>>> +		/* ITU BT.601: Y = 0.299 R + 0.587 G + 0.114 B */
>> >>>>> +		*dst++ = (3 * r + 6 * g + b) / 10;
>> >>>>> +		src++;
>> >>>>> +	}
>> >>>>
>> >>>> Can be done as
>> >>>>
>> >>>> 	while (pixels--) {
>> >>>> 		...
>> >>>> 	}
>> >>>>
>> >>>> or
>> >>>>
>> >>>> 	do {
>> >>>> 		...
>> >>>> 	} while (--pixels);
>> >>>>
>> >>>
>> >>> I don't see why a while loop would be an improvement here TBH.
>> >> 
>> >> Less letters to parse when reading the code.
>> >
>> > It's a simple refactoring of code that has worked well so far. Let's 
>> > leave it as-is for now.
>> 
>> IMO *always* prefer a for loop over while or do-while.
>> 
>> The for (i = 0; i < N; i++) is such a strong paradigm in C. You
>> instantly know how many times you're going to loop, at a glance. Not so
>> with with the alternatives, which should be used sparingly.
>
> while () {}  _is_ a paradigm, for-loop is syntax sugar on top of it.

And while() is just syntax sugar for goto. :p

The for loop written as for (i = 0; i < N; i++) is hands down the most
obvious counting loop pattern there is in C.

>> And yes, the do-while suggested above is buggy, and you actually need to
>> stop and think to see why.
>
> It depends if pixels can be 0 or not and if it's not, then does it contain last
> or number.
>
> The do {} while (--pixels); might be buggy iff pixels may be 0.

Yeah. And how long does it take to figure that out?


BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
