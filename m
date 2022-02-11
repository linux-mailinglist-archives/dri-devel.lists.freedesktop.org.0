Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1324B2531
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 13:06:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D265C10EA76;
	Fri, 11 Feb 2022 12:06:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C60610EA76
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 12:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644581163; x=1676117163;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=oPJ3HrbBkuSthMTs0EG6JJSdCgStR5rAPs5DdmwBg3c=;
 b=jHZg7vr3WXtFrQsNMqO69ZJm0LiiQhiapA96GYX/R/ZzoY6vQR3/caF7
 j1hc17V/+aOk8YZbF0uSkmtGxOnOgf6j/OoEpaggMr1jD9gjZt6IIXuAd
 omjEuiYLZdB0xCQ3HQmGU1ga1GcuLL4kM68MUxy7VUuEfEXq6Vopjr1bX
 j3iCcFNX+EYkZ9mKUCJOWx82hIcTgXIJOdU15RZ17snblWndyYqPLUfgg
 +UTezO0eD80yFujxwOCYH6W851J4VHXgKP68byKV4kbIdIQkG9bEeLExk
 sqRjW/nak6cAYGqPqufpAYMsVkEFXS50vNMWxL3haMIynKebq9liMiBxc g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="249927722"
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="249927722"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 04:06:02 -0800
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="526937460"
Received: from rriverox-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.19.108])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 04:05:58 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Javier Martinez Canillas
 <javierm@redhat.com>
Subject: Re: [PATCH v4 1/6] drm/format-helper: Add
 drm_fb_xrgb8888_to_gray8_line()
In-Reply-To: <7560cd10-0a7c-3fda-da83-9008833e3901@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220211091927.2988283-1-javierm@redhat.com>
 <20220211091927.2988283-2-javierm@redhat.com>
 <YgY6OqN+guBlt/ED@smile.fi.intel.com>
 <4fa465d9-4fac-4199-9a04-d8e09d164308@redhat.com>
 <YgZEuXvJ2ZiOyNS+@smile.fi.intel.com>
 <7560cd10-0a7c-3fda-da83-9008833e3901@suse.de>
Date: Fri, 11 Feb 2022 14:05:56 +0200
Message-ID: <87pmnt7gm3.fsf@intel.com>
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 11 Feb 2022, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi
>
> Am 11.02.22 um 12:12 schrieb Andy Shevchenko:
>> On Fri, Feb 11, 2022 at 11:40:13AM +0100, Javier Martinez Canillas wrote:
>>> On 2/11/22 11:28, Andy Shevchenko wrote:
>>>> On Fri, Feb 11, 2022 at 10:19:22AM +0100, Javier Martinez Canillas wrote:
>> 
>> ...
>> 
>>>>> +static void drm_fb_xrgb8888_to_gray8_line(u8 *dst, const u32 *src, unsigned int pixels)
>>>>> +{
>>>>> +	unsigned int x;
>>>>> +
>>>>> +	for (x = 0; x < pixels; x++) {
>>>>> +		u8 r = (*src & 0x00ff0000) >> 16;
>>>>> +		u8 g = (*src & 0x0000ff00) >> 8;
>>>>> +		u8 b =  *src & 0x000000ff;
>>>>> +
>>>>> +		/* ITU BT.601: Y = 0.299 R + 0.587 G + 0.114 B */
>>>>> +		*dst++ = (3 * r + 6 * g + b) / 10;
>>>>> +		src++;
>>>>> +	}
>>>>
>>>> Can be done as
>>>>
>>>> 	while (pixels--) {
>>>> 		...
>>>> 	}
>>>>
>>>> or
>>>>
>>>> 	do {
>>>> 		...
>>>> 	} while (--pixels);
>>>>
>>>
>>> I don't see why a while loop would be an improvement here TBH.
>> 
>> Less letters to parse when reading the code.
>
> It's a simple refactoring of code that has worked well so far. Let's 
> leave it as-is for now.

IMO *always* prefer a for loop over while or do-while.

The for (i = 0; i < N; i++) is such a strong paradigm in C. You
instantly know how many times you're going to loop, at a glance. Not so
with with the alternatives, which should be used sparingly.

And yes, the do-while suggested above is buggy, and you actually need to
stop and think to see why.


BR,
Jani.



>
> Best regards
> Thomas
>
>> 
>>> In any case, I just pulled the line conversion logic as a separate
>>> function with minimal code changes since doing that should be in a
>>> separate patch.
>> 
>> 
>>> Feel free to post a patch if you want to change that while loop.
>> 
>> Perhaps some day :-)
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center
