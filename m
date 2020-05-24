Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 673E11E07D8
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 09:22:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579FC89F01;
	Mon, 25 May 2020 07:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B74389DB4
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 20:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1590352960; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4ldLodTyBQH4EjK7Ys15sLVUuGns1QYCevH+u3ZcLlg=;
 b=qjS4EGUY8A+sHxOdwXgJ8jIb5qY6smHOmKVlyegznGmPyVU2BQPWyZSi4l9jHsJ+RXrIFZ
 DulVOPnQOP89gIOEEh/NS/Lb1aRdon6sLxAmS8NRHHD/ppn+V+PEdMtoLCc0WPsp3gJpwq
 +nhyBzh6EYS4BN0mWz3X9vxJkJqFkGE=
Date: Sun, 24 May 2020 22:42:29 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: MIPI DSI, DBI, and tinydrm drivers
To: Noralf =?iso-8859-1?q?Tr=F8nnes?= <noralf@tronnes.org>
Message-Id: <T6SUAQ.4AZ5S5FWL6VZ@crapouillou.net>
In-Reply-To: <0f860795-218e-b9f0-0d1c-699024d3cc9a@tronnes.org>
References: <4QFUAQ.UPWBIKSUSOG@crapouillou.net>
 <05f4908a-2df4-2694-e5e6-0faee31cc2a9@tronnes.org>
 <3YPUAQ.ALFWN74JD6DR1@crapouillou.net>
 <0f860795-218e-b9f0-0d1c-699024d3cc9a@tronnes.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 25 May 2020 07:21:04 +0000
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



Le dim. 24 mai 2020 =E0 22:14, Noralf Tr=F8nnes <noralf@tronnes.org> a =

=E9crit :
> =

> =

> Den 24.05.2020 21.54, skrev Paul Cercueil:
>>  Hi Noralf,
>> =

>>  Le dim. 24 mai 2020 =E0 19:46, Noralf Tr=F8nnes <noralf@tronnes.org> =

>> a =E9crit :
>>> =

>>> =

>>>  Den 24.05.2020 18.13, skrev Paul Cercueil:
>>>>   Hi list,
>>>> =

>>>>   I'd like to open a discussion about the current support of MIPI =

>>>> DSI and
>>>>   DBI panels.
>>>> =

>>>>   Both are standards from the MIPI alliance, both are communication
>>>>   protocols between a LCD controller and a LCD panel, they =

>>>> generally both
>>>>   use the same commands (DCS), the main difference is that DSI is =

>>>> serial
>>>>   and DBI is generally parallel.
>>>> =

>>>>   In the kernel right now, DSI is pretty well implemented. All the
>>>>   infrastucture to register a DSI host, DSI device etc. is there. =

>>>> DSI
>>>>   panels are implemented as regular drm_panel instances, and their
>>>>  drivers
>>>>   go through the DSI API to communicate with the panel, which =

>>>> makes them
>>>>   independent of the DSI host driver.
>>>> =

>>>>   DBI, on the other hand, does not have any of this. All (?) DBI =

>>>> panels
>>>>   are implemented as tinydrm drivers, which make them impossible =

>>>> to use
>>>>   with regular DRM drivers. Writing a standard drm_panel driver is
>>>>   impossible, as there is no concept of host and device. All these
>>>>  tinydrm
>>>>   drivers register their own DBI host as they all do DBI over SPI.
>>>> =

>>>>   I think this needs a good cleanup. Given that DSI and DBI are so
>>>>   similar, it would probably make sense to fuse DBI support into =

>>>> the
>>>>   current DSI code, as trying to update DBI would result in a lot =

>>>> of code
>>>>   being duplicated. With the proper host/device registration =

>>>> mechanism
>>>>   from DSI code, it would be possible to turn most of the tinydrm =

>>>> drivers
>>>>   into regular drm_panel drivers.
>>>> =

>>>>   The problem then is that these should still be available as =

>>>> tinydrm
>>>>   drivers. If the DSI/DBI panels can somehow register a =

>>>> .update_fb()
>>>>   callback, it would make it possible to have a panel-agnostic =

>>>> tinydrm
>>>>   driver, which would then probably open a lot of doors, and help a
>>>>  lot to
>>>>   clean the mess.
>>>> =

>>>>   I think I can help with that, I just need some guidance - I am =

>>>> fishing
>>>>   in exotic seas here.
>>>> =

>>>>   Thoughts, comments, are very welcome.
>>> =

>>>  I did look at this a few months back:
>>> =

>>>  drm/mipi-dbi: Support panel drivers
>>>  =

>>> https://lists.freedesktop.org/archives/dri-devel/2019-August/228966.html
>>> =

>>>  The problem with DBI is that it has reused other busses which =

>>> means we
>>>  don't have DBI drivers, we have SPI drivers instead (6800/8080 is =

>>> not
>>>  avail. as busses in Linux yet). DSI and DPI on the other hand has
>>>  dedicated hw controller drivers not shared with other subsystems.
>> =

>>  I don't think that should be much of a problem. You could have a =

>> DBI/SPI
>>  bridge, that wraps a SPI device into a DBI host, for instance. The =

>> panel
>>  drivers would just use the DBI API without having to know what's =

>> done
>>  behind the scene.
> =

> This will be a bridge implemented in software, are we allowed to have
> software devices in the Device Tree? I though it was just allowed to
> describe hardware.

It wouldn't appear in devicetree. If the panel is connected over SPI, =

then DBI is just the protocol it uses.

If probed as a SPI device driver, the panel's spi_driver would register =

an instance of the DBI/SPI host driver, then register itself as a =

dbi_driver. If probed from a DBI host it would just register itself as =

a dbi_driver.

-Paul

>> =

>>>  My initial tinydrm work used drm_panel, but I was not allowed to =

>>> use it
>>>  (at least not the way I had done it).
>>> =

>>>  Noralf.
>>> =

>>>> =

>>>>   Cheers,
>>>>   -Paul
>>>> =

>>>> =

>> =

>> =

>> =



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
