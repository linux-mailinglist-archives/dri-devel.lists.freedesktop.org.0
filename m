Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1AD2F2987
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 08:58:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3ECE6E08E;
	Tue, 12 Jan 2021 07:57:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpcmd15176.aruba.it (smtpcmd0756.aruba.it [62.149.156.56])
 by gabe.freedesktop.org (Postfix) with ESMTP id A951989C93
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 17:37:50 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.213.249])
 by Aruba Outgoing Smtp  with ESMTPSA
 id z18QkRB5IiSGyz18QkaX0h; Mon, 11 Jan 2021 18:37:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1610386669; bh=9rypusLXSregUp5IREA3MTJHjP1GCcUbjnNzJVPU29A=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=F75mtUW8k9w5YP0g3OxcngzxU/7uRbim1V62GTN1xj27hKfVNQgMohcE0MEniDgl8
 U1hCZ5vaujqq03jOtOD4r2bJNRQQFSyMiTjHIXQ1kL1huX/TECbxBWoohTxLsg6SdN
 MwVarMQpuiiAPVLaXYHwXNa9hIrAjo3PiqQ1qVScpRGBylzo5ZMvClam14ktGe0g8S
 i1NHeYFAOpwa6c7e523+lsaodbI85DEp4MdvNc8iYJJpUHJcJ2y0OTYvL7S/jqHEe6
 TFWG6pb/QsDy/gDsNoCiyX4SLhw6PvlUjK52+IkE6jWRlaTn0nVbpnyvidYYHe28R+
 Rc5d0YMTXnjRA==
Subject: Re: [PATCH v2 2/2] drm/sun4i: tcon: improve DCLK polarity handling
To: Maxime Ripard <maxime@cerno.tech>
References: <3685133.SLcexNTYsu@kista>
 <20210107023032.560182-1-giulio.benetti@benettiengineering.com>
 <20210107023032.560182-3-giulio.benetti@benettiengineering.com>
 <20210108092355.7p5uakxt7lpdu3bn@gilmour>
 <35622307-5e88-a2ed-bdf9-fca6554efefc@benettiengineering.com>
 <20210111172052.7v522xam74xkq6se@gilmour>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <fc01c99c-3b5d-0064-917f-1582abba51f4@benettiengineering.com>
Date: Mon, 11 Jan 2021 18:37:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210111172052.7v522xam74xkq6se@gilmour>
Content-Language: en-US
X-CMAE-Envelope: MS4wfK8Kt4nJXeFMs4gCbJtRGyPSD58rPmQLQ1OKbK7WAyj6e0WfasPgC+VWds73gfqHjRv51nb+TgfqF82quQSbJOZrAsthYIroOpocDqIL4QQRuWu1d5bE
 sOPKvRqjYYl5cYKzWTIEj2j76ZBlBKnuC7ITHZ9B4QGKr2PAouWcDC/hbUInTuxP48DlTRc9bXRWeH+/NozPc97jpN6gQUpVqZ7DVZCk0Xrok0qTkvw1VkyV
 LkagEdS5aN9bV682N6z4ltxiTw6Sc1aClsfZL0hzFruiUJGt/jvkcVg7/GzgbwNB7emG+gCjrzo17hxYYXAqcoFphBD0P5CUQKT6uAxq9Naysjz7dsfPKYyR
 DnddLFC/3fnH7Jr24Jiu46SueAfUW8394VkKWhCnXqg8zjKVxpPDtamlZQu5iuzYQjG/jHTU/fw4tHl9TlYGRjjoMdTCgcdkoCMxOS3zuXqr9VKVk9t3udyQ
 0LW2wDYmLXuP7AxgjPc/+moYG/Wl+rbdwY7zogPE4DlUUJXFFLSVTD93ehuA8abYWHc5I43IujLuMdTe+peICcKyLLoyDxVzmBmLOg==
X-Mailman-Approved-At: Tue, 12 Jan 2021 07:57:10 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, treding@nvidia.com,
 Giulio Benetti <giulio.benetti@micronovasrl.com>,
 Marjan Pascolo <marjan.pascolo@trexom.it>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/11/21 6:20 PM, Maxime Ripard wrote:
> On Fri, Jan 08, 2021 at 03:34:52PM +0100, Giulio Benetti wrote:
>> Hi,
>>
>> On 1/8/21 10:23 AM, Maxime Ripard wrote:
>>> Hi,
>>>
>>> Thanks for those patches
>>>
>>> On Thu, Jan 07, 2021 at 03:30:32AM +0100, Giulio Benetti wrote:
>>>> From: Giulio Benetti <giulio.benetti@micronovasrl.com>
>>>>
>>>> It turned out(Maxime suggestion) that bit 26 of SUN4I_TCON0_IO_POL_REG=
 is
>>>> dedicated to invert DCLK polarity and this makes thing really easier t=
han
>>>> before. So let's handle DCLK polarity by adding
>>>> SUN4I_TCON0_IO_POL_DCLK_POSITIVE as bit 26 and activating according to
>>>> bus_flags the same way is done for all the other signals.
>>>>
>>>> Cc: Maxime Ripard <maxime@cerno.tech>
>>>
>>> Suggested-by would be nice here :)
>>
>> Ok, didn't know about this tag
>>
>>>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>>>> ---
>>>>    drivers/gpu/drm/sun4i/sun4i_tcon.c | 20 +-------------------
>>>>    drivers/gpu/drm/sun4i/sun4i_tcon.h |  1 +
>>>>    2 files changed, 2 insertions(+), 19 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4=
i/sun4i_tcon.c
>>>> index 52598bb0fb0b..30171ccd87e5 100644
>>>> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
>>>> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
>>>> @@ -569,26 +569,8 @@ static void sun4i_tcon0_mode_set_rgb(struct sun4i=
_tcon *tcon,
>>>>    	if (info->bus_flags & DRM_BUS_FLAG_DE_LOW)
>>>>    		val |=3D SUN4I_TCON0_IO_POL_DE_NEGATIVE;
>>>> -	/*
>>>> -	 * On A20 and similar SoCs, the only way to achieve Positive Edge
>>>> -	 * (Rising Edge), is setting dclk clock phase to 2/3(240=B0).
>>>> -	 * By default TCON works in Negative Edge(Falling Edge),
>>>> -	 * this is why phase is set to 0 in that case.
>>>> -	 * Unfortunately there's no way to logically invert dclk through
>>>> -	 * IO_POL register.
>>>> -	 * The only acceptable way to work, triple checked with scope,
>>>> -	 * is using clock phase set to 0=B0 for Negative Edge and set to 240=
=B0
>>>> -	 * for Positive Edge.
>>>> -	 * On A33 and similar SoCs there would be a 90=B0 phase option,
>>>> -	 * but it divides also dclk by 2.
>>>> -	 * Following code is a way to avoid quirks all around TCON
>>>> -	 * and DOTCLOCK drivers.
>>>> -	 */
>>>>    	if (info->bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE)
>>>> -		clk_set_phase(tcon->dclk, 0);
>>>> -
>>>> -	if (info->bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
>>>> -		clk_set_phase(tcon->dclk, 240);
>>>> +		val |=3D SUN4I_TCON0_IO_POL_DCLK_POSITIVE;
>>>
>>> I'm not really sure why we need the first patch of this series here?
>>
>> The idea was to have 2 for testing, 1st one is already applicable, while=
 the
>> other must be tested, but I can send only one with no problem.
>>
>>> That patch only seem to undo what you did in patch 1
>>
>> No, it doesn't, the 2nd one change the way it achieve the same thing,
>> because the 1st swap DCLK phase, while the 2nd uses the IO_POL bit to se=
t IO
>> polarity according to bus_flags.
> =

> It makes sense for testing, but I'm not sure we want to carry it into
> the history. Can you squash them both into the same patch?
Sure, I'm going to send V3 then.

Thank you
Best regards
-- =

Giulio Benetti
Benetti Engineering sas
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
