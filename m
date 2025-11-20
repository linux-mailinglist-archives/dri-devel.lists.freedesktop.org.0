Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DD8C758C3
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 18:08:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE5110E78C;
	Thu, 20 Nov 2025 17:08:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZT6LmXCz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A202310E78C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 17:08:06 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DACF4C59;
 Thu, 20 Nov 2025 18:05:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1763658359;
 bh=TY7Is5PourliMVizNQln+FNs21UFGMl0426q/PVJdXc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZT6LmXCzdt99lGLNPLGRFDK/bUdT2a/BbcJNAJdpgSAgfuyFnp22MYo0j1LHF8W1q
 HkgPBKI1sqQ65x+wdgFotfyuMFQyIW2QKrjk5QgpV3KaSjMfLlxOejM5LTki9Mtwsb
 hFnIKk/KqQ4PasH3nB7sxN8ZK0TD98poG0yVDzfY=
Message-ID: <5da8f176-4db5-4d2d-a7df-23b8047b293e@ideasonboard.com>
Date: Thu, 20 Nov 2025 19:08:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/atomic-helper: Add special quirk tail function
To: Maxime Ripard <mripard@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org
References: <20251118-mcde-drm-regression-v2-0-4fedf10b18f6@linaro.org>
 <20251118-mcde-drm-regression-v2-3-4fedf10b18f6@linaro.org>
 <20251118150128.GB23711@pendragon.ideasonboard.com>
 <cncl6nwbr6fu3nvhz2y34ou4geqzo7hjf3wpukmm4t6utvygor@t2v4smey5ful>
 <CACRpkdYh9nSBtqU_8w5gnkWOc+Dw7fW3tPinm6JjfXMbdEJOjg@mail.gmail.com>
 <5zo76nnejrinmf6snaezld5ylfvk266bwyxg3phdhtg74z43pu@kub3r7tvz7vc>
 <19fc5a8e-999c-46a0-b755-0bd09fe84d92@ideasonboard.com>
 <tcu23ayvadb3vtz6vksrrkw6rkngofxnhokaa4khat2grnqgcu@ttmqg6illoz7>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <tcu23ayvadb3vtz6vksrrkw6rkngofxnhokaa4khat2grnqgcu@ttmqg6illoz7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi,

On 20/11/2025 18:19, Maxime Ripard wrote:
> On Wed, Nov 19, 2025 at 12:41:52PM +0200, Tomi Valkeinen wrote:
>> Hi,
>>
>> On 19/11/2025 11:19, Maxime Ripard wrote:
>>> On Tue, Nov 18, 2025 at 07:10:47PM +0100, Linus Walleij wrote:
>>>> On Tue, Nov 18, 2025 at 4:44 PM Maxime Ripard <mripard@kernel.org> wrote:
>>>>> On Tue, Nov 18, 2025 at 05:01:28PM +0200, Laurent Pinchart wrote:
>>>>>> On Tue, Nov 18, 2025 at 03:36:05PM +0100, Linus Walleij wrote:
>>>>
>>>>>>> +/**
>>>>>>> + * drm_atomic_helper_commit_tail_crtc_early_late - commit atomic update
>>>>>>
>>>>>> Based on the function name, it feels that the nem commit tail and
>>>>>> modeset enable/disable helpers reached a point where we may want to
>>>>>> reconsider the design instead of adding new functions with small
>>>>>> differences in behaviour that will end up confusing driver developers.
>>>>>
>>>>> Agreed, and I'd go even further than that: we don't want every odd order
>>>>> in the core. And if some driver has to break the order we document in
>>>>> some way it should be very obvious.
>>>>
>>>> Is this just a comment on this patch 3/3?
>>>>
>>>> Or do you mean that Mareks new callback
>>>> drm_atomic_helper_commit_modeset_enables_crtc_early()
>>>> from patch 1/2 should go straight into the R-Car driver as well
>>>> and that
>>>> drm_atomic_helper_commit_modeset_disables_crtc_late()
>>>> patch 2/2 should also go into my driver, even if this
>>>> is a comment on patch 3/3?
>>>>
>>>> Both patches 1 & 2 have a lot to do with ordering, this is
>>>> why I ask.
>>>
>>> I mean, it applies to all your three patches and Marek's: helpers are
>>> here to provide a default implementation. We shouldn't provide a default
>>> implementation for a single user. All your patches enable to create
>>> defaults for a single user.
>>
>> Two users so far: Renesas and ST-Ericsson.
>>
>>> So my point is that none of those functions should be helpers.
>>>
>>>> We already have
>>>> drm_atomic_helper_commit_tail()
>>>> drm_atomic_helper_commit_tail_rpm()
>>>
>>> The former has 5 users, the latter 13. And it's already confusing enough
>>> and regression-prone as it is.
>>>
>>>> Does one more or less really matter? Maybe, I'm not sure,
>>>> but if it's just this one patch that is the problem I can surely
>>>> do it that way since we're only calling public functions.
>>>>
>>>> Pushing the first two patches would be more problematic,
>>>> because they call a lot of functions that are local to the
>>>> drm atomic helpers.
>>>
>>> I'm totally fine with making more internal functions public though.
>> While I generally agree with that, I still wonder if an implementation
>> in the core is better here. Perhaps a flag in struct drm_driver, instead
>> of new set of helpers.
>>
>> Moving this to the driver would require (with a quick glance) exposing
>> the following functions:
>>
>> crtc_enable
>> crtc_disable
>> crtc_set_mode
>> encoder_bridge_pre_enable
>> encoder_bridge_enable
>> encoder_bridge_disable
>> encoder_bridge_post_disable
>>
>> Not impossible to expose, but making a private function public does
>> require work in validating the function for more general use, and adding
>> kernel docs.
> 
> Those are pretty trivial to document though, compared to document how
> the new variants differ from drm_atomic_helper_commit_tail() and
> drm_atomic_helper_commit_tail_rpm(), and then validating that it does
> indeed stay that way.

I agree.

>> Handling this in the core would act as documentation too, so instead of
>> the driver doing things in a different way "hidden" inside the driver,
>> it would be a standard quirk, clearly documented.
> 
> We've had the "let's not introduce helpers for a single user" rule for
> like a decade at this point, because it simply doesn't scale. Plenty of
> drivers have opted-out for very specific use-case already. I'm not sure
> why we should create this precedent.

Ok.

>> Also, I'm also not sure how rare this quirk is. In fact, I feel we're
>> missing ways to handle the enable/disable related issues in the core
>> framework. In these patches we're talking about the case where the SoC's
>> DSI host needs an incoming pclk to operate, and panels need to do
>> configuration before the video stream is enabled. But the exact same
>> problem could be present with an external DSI bridge, and then we can't
>> fix it in the crtc driver.
>>
>> So the question becomes "does any component in the pipeline need the
>> video stream's clock to operate". But then, it doesn't help if the crtc
>> output is enabled early if any bridge in between does not also enable
>> its output early. So it all gets a bit complex.
>>
>> And sometimes the clocks go backward: the entity on the downstream side
>> provides a clock backwards, to the source entity...
> 
> Yes, you're right, this is why it's so fragile. Do you want to create
> the test suite to check that all combinations are properly tested before
> reworking the whole thing?

Yes, right after I finish rewriting V4L2 to fix the mistakes there! =)

>> But I digress. I think initially we should just look for a clean fix for
>> the platforms affected:
>>
>> - Add the implementation into the drivers?
>> - Add helpers to the core?
>> - Add a flag of some kind so the core can do the right thing?
>>
>> I made a quick test with the flag approach, below. It's not many lines,
>> but... Ugh, it does feel like a hack.
> 
> Because it is.
> 
> Really, I don't get it. I gave you a free pass to do whatever you wanted
> in your driver. It doesn't add any maintenance burden on anyone. It
> doesn't risk regressing other drivers in the process. It doesn't come
> with any testing requirement. It doesn't even have to be reviewed by us,
> really.
> 
> Why do you argue for a more bothersome (for everyone) solution?
I don't argue for it. I presented the easy-ish options I see to fix
this. I think there are valid reasons to have this, in a way or another,
in the core. But as I said, it feels like a hack so I'm not too happy
with it.

In any case, it makes sense to fix these in the respective drivers (with
some core functions exported). It will get the issue sorted out for now,
without needing elaborate reverts, and without hacking the core.

Linus, Marek, is this ok for you?

 Tomi

