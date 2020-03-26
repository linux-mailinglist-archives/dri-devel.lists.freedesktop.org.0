Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2821945D8
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 18:52:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D59586E8F5;
	Thu, 26 Mar 2020 17:52:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1858 seconds by postgrey-1.36 at gabe;
 Thu, 26 Mar 2020 17:52:23 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE896E8F6
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Mar 2020 17:52:22 +0000 (UTC)
Received: from [192.168.1.183] ([37.4.249.171]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MJW5G-1ixeLQ2O40-00JoTP; Thu, 26 Mar 2020 18:52:16 +0100
Subject: Re: [PATCH] drm/vc4: Fix HDMI mode validation
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>, Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20200326122001.22215-1-nsaenzjulienne@suse.de>
 <c4b3e083-ac6e-b321-f0eb-f20e8ec3b1a6@i2se.com>
 <486b5c63e5b9bd81051500c0c310e68af16956c4.camel@suse.de>
From: Stefan Wahren <stefan.wahren@i2se.com>
Openpgp: preference=signencrypt
Autocrypt: addr=stefan.wahren@i2se.com; keydata=
 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 AQ==
Message-ID: <096467b2-e617-4353-ce8c-33312bd553da@i2se.com>
Date: Thu, 26 Mar 2020 18:52:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <486b5c63e5b9bd81051500c0c310e68af16956c4.camel@suse.de>
Content-Language: en-US
X-Provags-ID: V03:K1:/dw4OxKu77CHBXgp2rsR6+DCGOJdgmDlUFJLI91y4YoNeJtp3/I
 dXC+CAT9xFZLt67e/gZQ4SoMDn3Lk5NBlYMEDkfmX2gfP7aCoDN+f6FWFDKPYyPtoI1722U
 Ldl1ETnpGUv53vyrjWxr8101C8difqptTvOAc1XX6nmc5D7Y2dBOeCUr3eDTE3S5SukMmxD
 Gm7L7y2LUwHINx3uVgIjQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:AijSonU/UGo=:dHvzR77kshW/cUguLtQMC9
 ckaUihqsT6Keup+cYIRmwNHzXlv1OjKz2Va8eogi7Ag+SQopIEd/S/xRF7E3Y1KOI/xdrIH2w
 W2fBZGpcjsihH4+g2rBx5PagcT6m/JFp/AYH7QPsmKDH2to6tTkdb1bUy3ODcpaybogJo0rsu
 X8VPw64ZNI2ZtJOm6MgMYUq7GOgKmLswwEsbLrCbaXbwpWUlcveNEaLsev9n8hqTVk776QgaD
 xjcd+vFlSC6LFpA7GV1o2jcZcWOJM+r6KmnyoweiDvqbJD7L1bfeycqmIiUCnyexUhKkgSUro
 KjfVJ56prL4D8rz6nUpCV5D8Bysq25BcUF/Oj8SvjvWHji6VcNIFUJwzXDrxAUviMY0x/WAHb
 hKx0X14+rzrgQjU+lhGB1p1u69ar+XD80K/ada2u7+VOTuENPdr4Z8bIJWQe3OIkTglRYC9x8
 m/tm4ND6jxJq8Sfg7qe3pmT8UkgvMZQgGCkinUjc2lm6VtpfATDZ6O3CdDYxm9oMedYXrviIh
 qybpPyIbqLgKkyAXDnYiKvWckIsEeNLgLAueUMiebVT6REyRv4mr+xuIlTJU9Ypj6qLIn9abL
 85mS1ZZVzWZ7aqieEH1x8fFc6WQ0kPKFJ/YmW/+pKVh4qBPl+cqGn5Qa2JdnHq8OxwWWbjSsT
 eGq6bXpLnTXQkfIrNnNrI0F6KFyQpPlCVjJcnj62NUD0f7AgeonAl4W708dPVHdw0E0t4pEUB
 2yIp/wU3kcS6J8gfvky0LNnh4kGDUNpSqIlvNAbXl8sMWzhgfUvT7cyQFP96qzp6oR8XpWmcH
 AfoUy3yF2oeiVRuOC2EyGh7pdXBgBq/OzdmSZlN6MC6eenx0arVEfp3cN+pEqQmQP/I02r/
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
Cc: f.fainelli@gmail.com, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, maxime@cerno.tech,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 26.03.20 um 18:36 schrieb Nicolas Saenz Julienne:
> On Thu, 2020-03-26 at 18:19 +0100, Stefan Wahren wrote:
>> Am 26.03.20 um 13:20 schrieb Nicolas Saenz Julienne:
>>> Current mode validation impedes setting up some video modes which should
>>> be supported otherwise. Namely 1920x1200@60Hz.
>>>
>>> Fix this by lowering the minimum HDMI state machine clock to pixel clock
>>> ratio allowed.
>>>
>>> Fixes: 32e823c63e90 ("drm/vc4: Reject HDMI modes with too high of clocks")
>>> Reported-by: Stefan Wahren <stefan.wahren@i2se.com>
>>> Suggested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>>> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
>>> ---
>>>  drivers/gpu/drm/vc4/vc4_hdmi.c | 20 ++++++++++++++++----
>>>  1 file changed, 16 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
>>> index cea18dc15f77..340719238753 100644
>>> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
>>> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
>>> @@ -681,11 +681,23 @@ static enum drm_mode_status
>>>  vc4_hdmi_encoder_mode_valid(struct drm_encoder *crtc,
>>>  			    const struct drm_display_mode *mode)
>>>  {
>>> -	/* HSM clock must be 108% of the pixel clock.  Additionally,
>>> -	 * the AXI clock needs to be at least 25% of pixel clock, but
>>> -	 * HSM ends up being the limiting factor.
>>> +	/*
>>> +	 * As stated in RPi's vc4 firmware "HDMI state machine (HSM) clock must
>>> +	 * be faster than pixel clock, infinitesimally faster, tested in
>>> +	 * simulation. Otherwise, exact value is unimportant for HDMI
>>> +	 * operation." This conflicts with bcm2835's vc4 documentation, which
>>> +	 * states HSM's clock has to be at least 108% of the pixel clock.
>>> +	 *
>>> +	 * Real life tests reveal that vc4's firmware statement holds up, and
>>> +	 * users are able to use pixel clocks closer to HSM's, namely for
>>> +	 * 1920x1200@60Hz. So it was decided to have leave a 1% margin between
>>> +	 * both clocks. Which, for RPi0-3 implies a maximum pixel clock of
>> s/RPi0-3/bcm2835/ ?
> Well as Dave Stevenson stated on the previous thread[1], it's the firmware that
> sets up the HSM limitation. IIUC technically both HSM and pixel clocks could be
> increased. Hence this being more of a RPi limitation than the chip itself.
>
> "Whilst the firmware would appear to use a fixed HSM clock on Pi0-3, I
> don't anticipate there being any issue with varying it. It looks like
> there was the expectation of it being variable in the past, but
> someone has refactored it and either accidentally or deliberately
> given up on the idea."

Okay thanks for the explanation again

So i'm fine this patch

>
> Regards,
> Nicolas
>
> [1] https://www.spinics.net/lists/arm-kernel/msg794591.html
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
