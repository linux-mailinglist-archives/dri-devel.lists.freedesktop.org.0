Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 320251E5954
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:44:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C646E42B;
	Thu, 28 May 2020 07:43:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A6ED89A92
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 12:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1590581447; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4h6GwhXb1hBT/vyv0By/mpP1DjOYxW9/8imwY8ekgAE=;
 b=HMDP5wvZudFh8DL1sYs8S4LNGQDuUsDJl2qQanvALwrkrzP7z0hUdMT9zjpe6fQbS8XkRa
 oTYLdgVKObiyPFUgTuB00x9l+TZSKg+P12zfx++Zx/1CyNlJjYgp/3tdmr7TZoN2QDcjRL
 qW3M4sBVu2mIfiIFIPYLGVarFRoYVeA=
Date: Wed, 27 May 2020 14:10:37 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: MIPI DSI, DBI, and tinydrm drivers
To: Neil Armstrong <narmstrong@baylibre.com>
Message-Id: <PHOZAQ.2O9A4HQPVRH83@crapouillou.net>
In-Reply-To: <3724279f-8dad-dd32-2f9e-ab4027bc0976@baylibre.com>
References: <4QFUAQ.UPWBIKSUSOG@crapouillou.net>
 <05f4908a-2df4-2694-e5e6-0faee31cc2a9@tronnes.org>
 <CAKMK7uGHDrMvchWCmhyy6fbvy2kDWsbPH3nAbCXCmi14uUTA8g@mail.gmail.com>
 <ERPUAQ.BSXG2MHQQJKN2@crapouillou.net>
 <3724279f-8dad-dd32-2f9e-ab4027bc0976@baylibre.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:50 +0000
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

Le lun. 25 mai 2020 =E0 16:58, Neil Armstrong <narmstrong@baylibre.com> =

a =E9crit :
> Hi,
> =

> On 24/05/2020 21:50, Paul Cercueil wrote:
>>  Hi Daniel,
>> =

>>  Le dim. 24 mai 2020 =E0 20:35, Daniel Vetter <daniel@ffwll.ch> a =

>> =E9crit :
>>>  On Sun, May 24, 2020 at 7:46 PM Noralf Tr=F8nnes =

>>> <noralf@tronnes.org> wrote:
>>>> =

>>>> =

>>>> =

>>>>   Den 24.05.2020 18.13, skrev Paul Cercueil:
>>>>   > Hi list,
>>>>   >
>>>>   > I'd like to open a discussion about the current support of =

>>>> MIPI DSI and
>>>>   > DBI panels.
>>>>   >
>>>>   > Both are standards from the MIPI alliance, both are =

>>>> communication
>>>>   > protocols between a LCD controller and a LCD panel, they =

>>>> generally both
>>>>   > use the same commands (DCS), the main difference is that DSI =

>>>> is serial
>>>>   > and DBI is generally parallel.
>>>>   >
>>>>   > In the kernel right now, DSI is pretty well implemented. All =

>>>> the
>>>>   > infrastucture to register a DSI host, DSI device etc. is =

>>>> there. DSI
>>>>   > panels are implemented as regular drm_panel instances, and =

>>>> their drivers
>>>>   > go through the DSI API to communicate with the panel, which =

>>>> makes them
>>>>   > independent of the DSI host driver.
>>>>   >
>>>>   > DBI, on the other hand, does not have any of this. All (?) DBI =

>>>> panels
>>>>   > are implemented as tinydrm drivers, which make them impossible =

>>>> to use
>>>>   > with regular DRM drivers. Writing a standard drm_panel driver =

>>>> is
>>>>   > impossible, as there is no concept of host and device. All =

>>>> these tinydrm
>>>>   > drivers register their own DBI host as they all do DBI over =

>>>> SPI.
>>>>   >
>>>>   > I think this needs a good cleanup. Given that DSI and DBI are =

>>>> so
>>>>   > similar, it would probably make sense to fuse DBI support into =

>>>> the
>>>>   > current DSI code, as trying to update DBI would result in a =

>>>> lot of code
>>>>   > being duplicated. With the proper host/device registration =

>>>> mechanism
>>>>   > from DSI code, it would be possible to turn most of the =

>>>> tinydrm drivers
>>>>   > into regular drm_panel drivers.
>>> =

>>>  Do we have drivers with dbi support that actually want to reuse the
>>>  tinydrm drivers? Good clean is all good, but we need a solid reason
>>>  for changing stuff. Plus we need to make sure we're not just
>>>  rediscovering all the old reasons for why we ended up where we are
>>>  right now in the first place.
>> =

>>  I'm trying to interface a ILI9331 based panel that has a DBI/8080 =

>> interface. The ILI9331 is very similar to the ILI9341 which already =

>> has a tinydrm driver. My SoC has a dedicated DBI/DSI controller, and =

>> I have currently no way to make it work with the ingenic-drm driver.
>> =

>>  The idea of a generic drm_panel tinydrm driver was to avoid =

>> duplicating code between regular panel and tinydrm drivers, but the =

>> focus of my email was more to point that right now there is no way =

>> to interface a DBI panel with a regular DRM driver. Unlike DSI, =

>> there are currently no drivers with DBI support as there is no API =

>> to register a host DBI driver or a DBI panel driver. This is what's =

>> really missing here.
>> =

> =

> Did you have a look at "Enable ili9341 and l3gd20 on stm32f429-disco" =

> (http://lkml.kernel.org/r/1590378062-7965-1-git-send-email-dillon.minfei@=
gmail.com) =

> from dillon.minfei@gmail.com,
> it uses the STM32 DPI engine to feed a ili9341. Seems it would match =

> your issue.

Note that DBI and DPI are different things. Here the ILI9341 uses SPI =

directly instead of a DBI API for sending its commands, which means the =

driver won't work on e.g. a 8080 bus.

-Paul
>> =

>> =

>>>>   > The problem then is that these should still be available as =

>>>> tinydrm
>>>>   > drivers. If the DSI/DBI panels can somehow register a =

>>>> .update_fb()
>>>>   > callback, it would make it possible to have a panel-agnostic =

>>>> tinydrm
>>>>   > driver, which would then probably open a lot of doors, and =

>>>> help a lot to
>>>>   > clean the mess.
>>>>   >
>>>>   > I think I can help with that, I just need some guidance - I am =

>>>> fishing
>>>>   > in exotic seas here.
>>>>   >
>>>>   > Thoughts, comments, are very welcome.
>>>> =

>>>>   I did look at this a few months back:
>>>> =

>>>>   drm/mipi-dbi: Support panel drivers
>>>> =

>>>>  =

>>>> https://lists.freedesktop.org/archives/dri-devel/2019-August/228966.ht=
ml
>>>> =

>>>>   The problem with DBI is that it has reused other busses which =

>>>> means we
>>>>   don't have DBI drivers, we have SPI drivers instead (6800/8080 =

>>>> is not
>>>>   avail. as busses in Linux yet). DSI and DPI on the other hand has
>>>>   dedicated hw controller drivers not shared with other subsystems.
>>>> =

>>>>   My initial tinydrm work used drm_panel, but I was not allowed to =

>>>> use it
>>>>   (at least not the way I had done it).
>>> =

>>>  Hm, do we have a summary of all the discussions/reasons from back
>>>  then? All I remember is that it's all that simple, you've done a =

>>> lot
>>>  of work exploring all the options, I'm fairly sure I suggested
>>>  drm_panel even back then but somehow it didn't really work. Would =

>>> be
>>>  good if we make sure we don't at least repeat history too much :-)
>>> =

>>>  Cheers, Daniel
>>> =

>>>> =

>>>>   Noralf.
>>>> =

>>>>   >
>>>>   > Cheers,
>>>>   > -Paul
>>>>   >
>>>>   >
>>>>   _______________________________________________
>>>>   dri-devel mailing list
>>>>   dri-devel@lists.freedesktop.org
>>>>   https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>> =

>>> =

>>> =

>>>  --
>>>  Daniel Vetter
>>>  Software Engineer, Intel Corporation
>>>  +41 (0) 79 365 57 48 - http://blog.ffwll.ch
>> =

>> =

>>  _______________________________________________
>>  dri-devel mailing list
>>  dri-devel@lists.freedesktop.org
>>  https://lists.freedesktop.org/mailman/listinfo/dri-devel


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
