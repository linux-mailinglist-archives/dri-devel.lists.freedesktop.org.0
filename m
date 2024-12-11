Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DB39EBFC1
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 01:05:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE33510EA14;
	Wed, 11 Dec 2024 00:04:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="gPiWZ/CB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E7A10EA14
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 00:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1733875479; x=1734480279; i=deller@gmx.de;
 bh=+u4iVwG3BgjlcucenB7yUM+6T8REXyTKB5WD3RHPgv4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=gPiWZ/CBVI9nYsfim+NR2rL9lcosDLhTtcI9gopwMbLDDrW6aCC11rypZpd/ymjT
 VrfTDwL1KdaVLwYoR2zinPC4PHMAOWncFTe0/kRXTc3utNCkIemPV44H0YqQjKnUE
 srMLObeFhVcMD8SY4QhRPZUUPAX+0reMDDq8HDlELsUnHyCMUdUlFSYiMADdhIGh8
 TM1h58seEshxeFic12nTprDJ5ERz2j78Dfj5hR5IQCLD4PTuDYnYa+sL6yRkXtJUk
 XeZv+dA0bk8N1YgQuHHZXYsxw99U2ggEhwlBEtPBv3nkAWgFCiPITlmFyuoKJpECD
 JiPbeIpoHSd1HCHI5Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.155]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MpDJd-1tyMrA2kbX-00cq5L; Wed, 11
 Dec 2024 01:04:39 +0100
Message-ID: <1c72c520-64cc-436e-aa74-970b30cef593@gmx.de>
Date: Wed, 11 Dec 2024 01:04:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] fbdev: Fix recursive dependencies wrt
 BACKLIGHT_CLASS_DEVICE
From: Helge Deller <deller@gmx.de>
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 arnd@arndb.de, simona@ffwll.ch, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
References: <20241210142329.660801-1-tzimmermann@suse.de>
 <20241210142329.660801-2-tzimmermann@suse.de>
 <b5136312-e18c-46cb-9a01-3efc61d6fd9a@gmx.de>
 <de810def-84ac-4d55-b625-536b5781a20f@gmx.de>
 <e7d5fba5-7ecd-4ed3-be7a-56bf82030e67@suse.de>
 <6b543ccd-23dd-474d-9828-1eb0ecec9c5d@gmx.de>
 <b06308ee-93bf-40e8-bc58-a49ecdfbdeeb@gmx.de>
Content-Language: en-US
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <b06308ee-93bf-40e8-bc58-a49ecdfbdeeb@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KK1pma/5tcyN3UjxqPweoFHXYYro/uASbc93k5BLVCXr9PBZaAk
 WVImr4NkDkdRbc+Cesq2HDbvI8RdvWVvxJpop4kylhkXo7S5nkmmRiwrqEV1Glm4pDzEEiD
 U3RM/6V5dWpT6Ebl9D7Qa5q7e0W9SrGTNfxEOoUcskhb6UxGp8eR74lGHJa1T60+M8qOCYS
 nLZ3IFLRv7AVm3rNUv79g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Eb37hDM+tK0=;dnu7EQozlwTxxDIuVS51yug+3SS
 XpnqsQNjThNPh2gR/nDJgw1edxTDKLvjlW8Hebdyc4SrOR35x6aM6/BbJ0Rn0hUmd5A4j0O+n
 tMVKWsrNLGQYE5HgUNYgKe1RsHg4p1wvuoyHb85tXgtsxSYRgpzE84V/Gn/0EM6a1W76c8gJz
 50v9gqxJX8IWdBFb6kvaSGqzyBnhJG3K9lkS7XSVGf8wSzS9OTJfte2Duv6KkL+fheILaZ2on
 irxZJQwQlk3bx1grJFPx7VPVzlPKV/33qjqHzjx5eA23IlpKY2t5ZomQlsw1BzbvrpwoPlyPF
 2cFS3VP+qXEkv2J1NVgK6cagtrLL4c2NQ3ID0wgmIJPkJFrv/bOqTv7y/U2YYjhRY+YZbA1cu
 zhJHDodcrvb0AwZQOEq4VUOeMyPcvjrENf++PgX58pcDw7TpjSmKcrSM+0ZIbyyVYZjStErGK
 m3y9keVNUsvmWpTp5qWkalE+DP/n/b9NBVVgFtZV66Tq/Jo3IfPctH/mYC+runuJ4atFWJYKm
 vNr5CBIrMaVGEaai8OQq9N5Y3EuSiReBY1lo7NqlpfeN0Hk5dXu2nuTNz3k2BQjKC8NcQXnsw
 w/LyjB/yEpDYErcphVPJDpZOs3RevAHk4IuEmhCX3kSePPqBcvd0WvhdQmCL1mQFergn+f0DC
 2tc9zNImgBwJTP0sk01UsCXNeYayCcIOSIhw1wEArboAk2NLE6KbeizQR6TNQX2zfrho8gmyx
 HOHX5e/LlQOplGjdZzxsTyPK5cEd/HdTRPG5wPoIobjCyAOh/7yJ7zXGhsZq9Vao4mVpofvps
 uLxs4VOY1qgOSm4gSL43i9BDYFDp3KmGl1tiYFkcixsmeJYHvsoGdB1rMEjDMVOKw++sm5YwV
 i/F380wYvrGZjdkCZyi4myoUW62oAcs5LtRu7YVuZdz4wMpACK0yI3HIXC0Ai9VklTR4f9h/e
 bpMzfibsDiDy++dE5+RnJEyQFxUAaRDt0IlQKUswQSzt09U7b33+/xxRFqkG9Q3bT16MkfRWg
 MBD8PtN3GhJvwKZt7Wzm0qd+zvHlxGzwM6HikaT2ydBldwXhJyHWSetzR1cwVWzKMNWSAo9gb
 Ybik9QPDsepQiThdqDbPeHst2aT/vz
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

On 12/11/24 00:53, Helge Deller wrote:
> On 12/11/24 00:37, Helge Deller wrote:
>> On 12/10/24 16:41, Thomas Zimmermann wrote:
>>> Hi
>>>
>>>
>>> Am 10.12.24 um 15:34 schrieb Helge Deller:
>>>> On 12/10/24 15:29, Helge Deller wrote:
>>>>> On 12/10/24 15:09, Thomas Zimmermann wrote:
>>>>>> diff --git a/drivers/staging/fbtft/Kconfig b/drivers/staging/fbtft/=
Kconfig
>>>>>> index 77ab44362f16..577e91ff7bf6 100644
>>>>>> --- a/drivers/staging/fbtft/Kconfig
>>>>>> +++ b/drivers/staging/fbtft/Kconfig
>>>>>> @@ -3,6 +3,7 @@ menuconfig FB_TFT
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tristate "Support for small TFT LCD =
display modules"
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on FB && SPI
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on FB_DEVICE
>>>>>> +=C2=A0=C2=A0=C2=A0 depends on BACKLIGHT_DEVICE_CLASS
>>>>>
>>>>> Typo. Should be BACKLIGHT_CLASS_DEVICE...
>>>
>>> Ah, thanks. I'll better check the rest of the series for similar mista=
kes.
>>>
>>>>
>>>> Beside the typo:
>>>> In this case, doesn't it make sense to "select BACKLIGHT_DEVICE_CLASS=
" instead?
>>>
>>> That causes the dependency error mentioned in the commit message. This=
 time it's just for fbtft instead of shmobilefb.
>>>
>>>> If people want the fbtft, backlight support should be enabled too.
>>>
>>> As a user-visible option, it should not be auto-selected
>>> unnecessarily.
>>
>> Right, it should not be auto-selected.
>> Unless if fbtft really needs it enabled to function.
>> IMHO all fb/drm drivers have higher priority than some low-level
>> background backlight controller code.
>>
>>> The DRM panel drivers already depend on the backlight
>>> instead of selecting it. It's the correct approach.
>>
>> Sounds wrong IMHO.
>>
>>> As I mentioned
>>> in the cover letter, the few remaining driver that select it should
>>> probably be updated.
>>
>> That dependency sounds weird, but maybe I simply misunderstand your log=
ic...?
>>
>> As a Linux end user I usually know which graphic cards are in my machin=
e
>> and which ones I want to enable.
>> But as a normal user I think I shouldn't be expected to know
>> that I first need to enable the "backlight class device"
>> so that I'm then able to afterwards enable the fbtft (or any other drm/=
fb driver).
>>
>> Am I wrong?
>
> Looking closer on this...
> You propose:
>
> --- a/drivers/staging/fbtft/Kconfig
> +++ b/drivers/staging/fbtft/Kconfig
> @@ -3,6 +3,7 @@ menuconfig FB_TFT
>  =C2=A0=C2=A0=C2=A0=C2=A0 tristate "Support for small TFT LCD display mo=
dules"
>  =C2=A0=C2=A0=C2=A0=C2=A0 depends on FB && SPI
>  =C2=A0=C2=A0=C2=A0=C2=A0 depends on FB_DEVICE
> +=C2=A0=C2=A0=C2=A0 depends on BACKLIGHT_DEVICE_CLASS
>  =C2=A0=C2=A0=C2=A0=C2=A0 depends on GPIOLIB || COMPILE_TEST
>  =C2=A0=C2=A0=C2=A0=C2=A0 select FB_BACKLIGHT
>
> So, it will depend on BACKLIGHT_DEVICE_CLASS.
> But there is "select FB_BACKLIGHT" as well, which is:
> config FB_BACKLIGHT
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tristate
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on FB
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select BACKLIGHT_CLASS_DEVIC=
E
>
> So, you end up with selecting and depending on BACKLIGHT_CLASS_DEVICE ?

Ok. Ignore this ^^^ . I now understand your cover letter.

Looking at your DRM tiny drivers and the i915/gma500 DRM drivers,
there is a "select BACKLIGHT_CLASS_DEVICE" in those.

So, isn't the right approach then something like:

=2D-- a/drivers/staging/fbtft/Kconfig
        tristate "Support for small TFT LCD display modules"
        depends on FB && SPI
        depends on FB_DEVICE
   +    select BACKLIGHT_DEVICE_CLASS
        depends on GPIOLIB || COMPILE_TEST
        select FB_BACKLIGHT

config FB_BACKLIGHT
           tristate
           depends on FB
   +       depends on BACKLIGHT_CLASS_DEVICE

?
