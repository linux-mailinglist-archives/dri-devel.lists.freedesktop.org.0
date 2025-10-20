Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52296BF04ED
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 11:50:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB4510E284;
	Mon, 20 Oct 2025 09:50:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jc8Iuc5I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A9BB10E392
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 09:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760953811; x=1792489811;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=toWtOieDsYfqWfN+8amH9Octs1Y4IKU0gyOxBWazfC0=;
 b=jc8Iuc5Ijn2Vpo7EdcxGSpVW6yULBgmoFCY4XTO5b0jCXtdDt0roOlqw
 iWkrgxXBYflSgoJ+FUvIyP+vVZFo99CP+G79+h1a4jj62ciwOCvXSRMV2
 W0Kke5Lp+BMp0zgS4kXnljH50Ouzu+qazU8JLpb5uCmY7iwLCSEWc1T8g
 j1T+oocndmrBbJII7xoORF7wNf1CeDg4r8VSemHEPzojT40v8HqHkFD9u
 gky5YdFZ6JSZ8auE8wNvcGT5slANooGBVm/bA/LkuLFmN03cX/TmSg3Bm
 xbw2N0T+rOaSUCnSNr1ZuxQFbCdLC1Aat5OVyX00xr1KByZeZOen2g8eY g==;
X-CSE-ConnectionGUID: iIa0bsUZRHattsCMORHxjA==
X-CSE-MsgGUID: B6bequVZRhmbdynxNgY62w==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="62275253"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="62275253"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 02:50:11 -0700
X-CSE-ConnectionGUID: m2+TlMjjQxGoDB2gd0tPdg==
X-CSE-MsgGUID: tcNt11N3RAOD/MBidoQ4vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="183702716"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.7])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 02:50:07 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>, Thomas
 Zimmermann <tzimmermann@suse.de>, Greg KH <gregkh@linuxfoundation.org>
Cc: lanzano.alex@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 khalid@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] drm/tiny: Use kmalloc_array() instead of kmalloc()
In-Reply-To: <d072dfe7-e0e9-49f6-89ed-25d194035e3b@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251019151247.171558-1-mehdi.benhadjkhelifa@gmail.com>
 <2025101910-dipper-suburb-1755@gregkh>
 <cb0f0a36-0593-4d4c-8450-d086b9c99d87@suse.de>
 <d072dfe7-e0e9-49f6-89ed-25d194035e3b@gmail.com>
Date: Mon, 20 Oct 2025 12:50:04 +0300
Message-ID: <02e617bec795d2ef371069f2d5fb954dfb31a450@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Sun, 19 Oct 2025, Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com=
> wrote:
> On 10/19/25 3:47 PM, Thomas Zimmermann wrote:
>> Hi
>>=20
>> Am 19.10.25 um 16:34 schrieb Greg KH:
>>> On Sun, Oct 19, 2025 at 04:12:28PM +0100, Mehdi Ben Hadj Khelifa wrote:
>>>> Replace kmalloc() with kmalloc_array() to correctly
>>>> handle array allocations and benefit from built-in overflow checking[1=
].
>>>>
>>>> [1]:https://docs.kernel.org/process/deprecated.html
>>>>
>>>> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
>>>> ---
>>>> =C2=A0 drivers/gpu/drm/tiny/repaper.c | 2 +-
>>>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/=20
>>>> repaper.c
>>>> index 4824f863fdba..290132c24ff9 100644
>>>> --- a/drivers/gpu/drm/tiny/repaper.c
>>>> +++ b/drivers/gpu/drm/tiny/repaper.c
>>>> @@ -534,7 +534,7 @@ static int repaper_fb_dirty(struct=20
>>>> drm_framebuffer *fb, const struct iosys_map *
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_DEBUG("Flushing [FB:%d] st=3D%ums\n=
", fb->base.id,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 epd=
->factored_stage_time);
>>>> -=C2=A0=C2=A0=C2=A0 buf =3D kmalloc(fb->width * fb->height / 8, GFP_KE=
RNEL);
>>>> +=C2=A0=C2=A0=C2=A0 buf =3D kmalloc_array(fb->height / 8, fb->width, G=
FP_KERNEL);

Also worth emphasizing that this is wildly wrong for any height that is
not a multiple of 8.

And I thought I shot down a similar patch not long ago.

Is there some tool that suggests doing this? Fix the tool instead
please.

BR,
Jani.




>>> This isn't an array, so this function change doesn't seem to make much
>>> sense, right?=C2=A0 The size should have already been checked earlier i=
n the
>>> call change to be correct.
> Yes,I was intending to say framebuffer but I was working on another=20
> similar patch simultaneously so I reused same words by mistake. Thanks=20
> for clarifying that.>
>> Yes, we've recently received plenty of these pointless changes. The=20
>> correct code would compute the number of bytes per pixel using=20
>> drm_format_info_min_pitch() and multiply with fb->height. The latter=20
>> could (maybe) use kmalloc_array(). It would still not be an array in the=
=20
>> common sense.
>>=20
> Thanks for the review and suggestion.I will be sending a v2 patch with=20
> the recommended code change.
>
> Best Regards,
> Mehdi Ben Hadj Khelifa> Best regards
>> Thomas
>>=20
>>>
>>> thanks,
>>>
>>> greg k-h
>>=20
>> --=20
>> --=20
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Frankenstrasse 146, 90461 Nuernberg, Germany
>> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
>> HRB 36809 (AG Nuernberg)
>

--=20
Jani Nikula, Intel
