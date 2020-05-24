Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A261E07E2
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 09:23:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 673D389C6E;
	Mon, 25 May 2020 07:23:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E9189D84
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 19:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1590350054; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fwf7ftUxr1LG1ieCK/CZ/esUFPuAL86uhpljKO+V16k=;
 b=mcDpbxUdGeZVvO2TmE86sV0ayhBQlUn3IED/CTsK+pa4Ou9QZnNSCBpTs3adTjC/AYWmgU
 HGC3qHoVRJW2CJUgiHs3Fhz/B5TLiqHm8g2svK6BNOSfl7/CUBVgT8oYjvYblNvKs7tEGe
 6pmxRF4QG+ll2G6sErjbisluinTi4xQ=
Date: Sun, 24 May 2020 21:54:03 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: MIPI DSI, DBI, and tinydrm drivers
To: Noralf =?iso-8859-1?q?Tr=F8nnes?= <noralf@tronnes.org>
Message-Id: <3YPUAQ.ALFWN74JD6DR1@crapouillou.net>
In-Reply-To: <05f4908a-2df4-2694-e5e6-0faee31cc2a9@tronnes.org>
References: <4QFUAQ.UPWBIKSUSOG@crapouillou.net>
 <05f4908a-2df4-2694-e5e6-0faee31cc2a9@tronnes.org>
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

Hi Noralf,

Le dim. 24 mai 2020 =E0 19:46, Noralf Tr=F8nnes <noralf@tronnes.org> a =

=E9crit :
> =

> =

> Den 24.05.2020 18.13, skrev Paul Cercueil:
>>  Hi list,
>> =

>>  I'd like to open a discussion about the current support of MIPI DSI =

>> and
>>  DBI panels.
>> =

>>  Both are standards from the MIPI alliance, both are communication
>>  protocols between a LCD controller and a LCD panel, they generally =

>> both
>>  use the same commands (DCS), the main difference is that DSI is =

>> serial
>>  and DBI is generally parallel.
>> =

>>  In the kernel right now, DSI is pretty well implemented. All the
>>  infrastucture to register a DSI host, DSI device etc. is there. DSI
>>  panels are implemented as regular drm_panel instances, and their =

>> drivers
>>  go through the DSI API to communicate with the panel, which makes =

>> them
>>  independent of the DSI host driver.
>> =

>>  DBI, on the other hand, does not have any of this. All (?) DBI =

>> panels
>>  are implemented as tinydrm drivers, which make them impossible to =

>> use
>>  with regular DRM drivers. Writing a standard drm_panel driver is
>>  impossible, as there is no concept of host and device. All these =

>> tinydrm
>>  drivers register their own DBI host as they all do DBI over SPI.
>> =

>>  I think this needs a good cleanup. Given that DSI and DBI are so
>>  similar, it would probably make sense to fuse DBI support into the
>>  current DSI code, as trying to update DBI would result in a lot of =

>> code
>>  being duplicated. With the proper host/device registration mechanism
>>  from DSI code, it would be possible to turn most of the tinydrm =

>> drivers
>>  into regular drm_panel drivers.
>> =

>>  The problem then is that these should still be available as tinydrm
>>  drivers. If the DSI/DBI panels can somehow register a .update_fb()
>>  callback, it would make it possible to have a panel-agnostic tinydrm
>>  driver, which would then probably open a lot of doors, and help a =

>> lot to
>>  clean the mess.
>> =

>>  I think I can help with that, I just need some guidance - I am =

>> fishing
>>  in exotic seas here.
>> =

>>  Thoughts, comments, are very welcome.
> =

> I did look at this a few months back:
> =

> drm/mipi-dbi: Support panel drivers
> https://lists.freedesktop.org/archives/dri-devel/2019-August/228966.html
> =

> The problem with DBI is that it has reused other busses which means we
> don't have DBI drivers, we have SPI drivers instead (6800/8080 is not
> avail. as busses in Linux yet). DSI and DPI on the other hand has
> dedicated hw controller drivers not shared with other subsystems.

I don't think that should be much of a problem. You could have a =

DBI/SPI bridge, that wraps a SPI device into a DBI host, for instance. =

The panel drivers would just use the DBI API without having to know =

what's done behind the scene.

Cheers,
-Paul

> My initial tinydrm work used drm_panel, but I was not allowed to use =

> it
> (at least not the way I had done it).
> =

> Noralf.
> =

>> =

>>  Cheers,
>>  -Paul
>> =

>> =



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
