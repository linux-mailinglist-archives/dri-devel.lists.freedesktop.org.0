Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 239401E07D0
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 09:22:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5903A89DB8;
	Mon, 25 May 2020 07:21:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C865889D02
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 01:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1590371216; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=orU0K8jf0TTvgUzPv6gXs+exJ+cNAHJF3xMNx1FP0VM=;
 b=P/l/2SeG3OslBTx+PYoalf3WpS+4M9d6bFQ5JdAXCJqtMu/X7PP8O3C1zL1ryeh4HYmSgE
 2lw71X7INh2SKY10eiAStcTvEOzEiYJ7a0HvwyvWA0s4n35Az1xoxsrc2HkNrxhltwkJLd
 4Z3M95UU7dvEcDYrLZyfrVqBMbl7J30=
Date: Mon, 25 May 2020 03:46:47 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: MIPI DSI, DBI, and tinydrm drivers
To: Sam Ravnborg <sam@ravnborg.org>
Message-Id: <Z96VAQ.OJZYLOUQ5XU4@crapouillou.net>
In-Reply-To: <20200524200655.GA44152@ravnborg.org>
References: <4QFUAQ.UPWBIKSUSOG@crapouillou.net>
 <20200524200655.GA44152@ravnborg.org>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Le dim. 24 mai 2020 =E0 22:06, Sam Ravnborg <sam@ravnborg.org> a =E9crit :
> Hi Paul.
> =

> On Sun, May 24, 2020 at 06:13:16PM +0200, Paul Cercueil wrote:
>>  Hi list,
>> =

>>  I'd like to open a discussion about the current support of MIPI DSI =

>> and DBI
>>  panels.
>> =

>>  Both are standards from the MIPI alliance, both are communication =

>> protocols
>>  between a LCD controller and a LCD panel, they generally both use =

>> the same
>>  commands (DCS), the main difference is that DSI is serial and DBI is
>>  generally parallel.
>> =

>>  In the kernel right now, DSI is pretty well implemented. All the
>>  infrastucture to register a DSI host, DSI device etc. is there. DSI =

>> panels
>>  are implemented as regular drm_panel instances, and their drivers =

>> go through
>>  the DSI API to communicate with the panel, which makes them =

>> independent of
>>  the DSI host driver.
>> =

>>  DBI, on the other hand, does not have any of this. All (?) DBI =

>> panels are
>>  implemented as tinydrm drivers, which make them impossible to use =

>> with
>>  regular DRM drivers. Writing a standard drm_panel driver is =

>> impossible, as
>>  there is no concept of host and device. All these tinydrm drivers =

>> register
>>  their own DBI host as they all do DBI over SPI.
>> =

>>  I think this needs a good cleanup. Given that DSI and DBI are so =

>> similar, it
>>  would probably make sense to fuse DBI support into the current DSI =

>> code, as
>>  trying to update DBI would result in a lot of code being =

>> duplicated. With
>>  the proper host/device registration mechanism from DSI code, it =

>> would be
>>  possible to turn most of the tinydrm drivers into regular drm_panel =

>> drivers.
> =

> We could add proper support for a DBI bus, like we have today for DSI.
> This seems like the simple approach as we then have a DSI and a DBI =

> bus.
> =

> But many panels implement support for both DSI and DBI and then what =

> to
> do then? We could register a driver based on the configuration like we
> do in some drivers already. But this would push logic to the dirvers
> which we would like to keep simple.
> We could also try to extend the current DSI bus support to cover
> DBI too - but thats seems also to be not so elegant.

My controller supports 8/16/18-bit commands, 8/16/18-bit data, serial =

or parallel. There is nothing DBI-specific in that, but there is =

nothing DSI-specific either; it is more of a bus controller, on which =

the DSI and DBI protocols can be used. I think the way to go would be =

to separate the buses from the protocols. Ideally, I would have a bus =

driver, with "mipi-dsi" and "mipi-dbi-8080" flags in devicetree, and =

the core's DSI/DBI code would work on top of the bus API.

> I atually started on the framework bits for implementing a DBI bus
> but got sidetracked so did not get far.
> And back then I also was concerned if we should go for a dedicated
> DBI bus or we should do something else.
> =

> I have attached two WIP patches from when I looked at it.
> The binding needs extra work and the code may not even build...

The code looks pretty much like what I was experimenting with before =

sending the email. But I think we can do better.

The binding specifies the 'mipi-dbi-type' while in practice the same =

hardware may be able to support several types, and specifies a bunch of =

GPIOs which wouldn't apply in my case (since they are handled by the =

controller).

>>  The problem then is that these should still be available as tinydrm =

>> drivers.
>>  If the DSI/DBI panels can somehow register a .update_fb() callback, =

>> it would
>>  make it possible to have a panel-agnostic tinydrm driver, which =

>> would then
>>  probably open a lot of doors, and help a lot to clean the mess.
> We should find a clean solution for new drivers and then we can see =

> what
> to do for the existing drivers.

Agreed.

Cheers,
-Paul

> We only have a few existing tiny drivers for now - and knowing the
> amount of panel candidates that exist we have to make it simple to
> add support for new panels, both DBI, DSI and DPI variants.
> =

> And if we could then find a way to allow the user to specify the init
> sequence without modifying the kernel then we could make it much
> simpler again. Noralf have a solution for this in staging but I think
> we need something else in DRM.
> I have had in mind if we could ut something in initrd or some sort but
> that is down on the TODO list to look at.
> =

> 	Sam


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
