Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 598E469C883
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 11:26:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CFEC10E129;
	Mon, 20 Feb 2023 10:26:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F046810E129
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 10:26:53 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4PKz9k0mtKz9sSj;
 Mon, 20 Feb 2023 11:26:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1676888810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nw7utrCKJZ11SBTdEKu8EmY729voqWiToPXqZxlP6g8=;
 b=nz/2vz68ElMsNd3L4ArepIEjFAwWT/ASsWOv5KdBQ3l6bZjkgKE1ebrdV6drC6PQxjuKbW
 JyuQSLdlNq5KkDGGXHJbXbXWkxSE6az9Rr+U/wR7CiuJL7DvL9qKtFFLpAwLxWM3UaADOw
 qrBtNZ9y3y+46OS4IxFKIKdDByZFWxwXsAMVJa8Fs9f5vxCL/4LIQ6AtF2Yf+JkhSTo9Vg
 dpIoOPqQKRmk5WBwIttnAp3GaypK6HHuLA/qzJo16v5ljoykyrq1RVMJ29eZd+w9GZqIUz
 h+1qQPgJaULgdk1J+uMieNX0t8+d4y8DCcCWEewAfeSlGN/1KZ6RycKreYlEZw==
From: Frank Oltmanns <frank@oltmanns.dev>
To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
Subject: Re: [PATCH 1/1] drm/panel: st7703: Fix vertical refresh rate of XBD599
Date: Mon, 20 Feb 2023 08:40:28 +0100
References: <20230219114553.288057-1-frank@oltmanns.dev>
 <20230219114553.288057-2-frank@oltmanns.dev>
 <20230219123542.yxb5ixe424ig6ofv@core>
In-reply-to: <20230219123542.yxb5ixe424ig6ofv@core>
Message-ID: <874jrgr5t3.fsf@oltmanns.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
X-Rspamd-Queue-Id: 4PKz9k0mtKz9sSj
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
Cc: Purism Kernel Team <kernel@puri.sm>, Sam Ravnborg <sam@ravnborg.org>,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ond=C5=99ej,
hi all,

Ond=C5=99ej Jirman <megous@megous.com> writes:
> On Sun, Feb 19, 2023 at 12:45:53PM +0100, Frank Oltmanns wrote:
>> Fix the XBD599 panel=E2=80=99s slight visual stutter by correcting the p=
ixel
>> clock speed so that the panel=E2=80=99s 60Hz vertical refresh rate is me=
t.
>>
>> Set the clock speed using the underlying formula instead of a magic
>> number. To have a consistent procedure for both panels, set the JH057N
>> panel=E2=80=99s clock also as a formula.
>>
>> =E2=80=94
>>  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 4 ++=E2=80=93
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff =E2=80=93git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/driv=
ers/gpu/drm/panel/panel-sitronix-st7703.c
>> index 6747ca237ced..cd7d631f7573 100644
>> =E2=80=94 a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
>> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
>> @@ -139,7 +139,7 @@ static const struct drm_display_mode jh057n00900_mod=
e =3D {
>>  	.vsync_start =3D 1440 + 20,
>>  	.vsync_end   =3D 1440 + 20 + 4,
>>  	.vtotal	     =3D 1440 + 20 + 4 + 12,
>> -	.clock	     =3D 75276,
>> +	.clock	     =3D (720 + 90 + 20 + 20) * (1440 + 20 + 4 + 12) * 60 / 100=
0,
>>  	.flags	     =3D DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
>>  	.width_mm    =3D 65,
>>  	.height_mm   =3D 130,
>> @@ -324,7 +324,7 @@ static const struct drm_display_mode xbd599_mode =3D=
 {
>>  	.vsync_start =3D 1440 + 18,
>>  	.vsync_end   =3D 1440 + 18 + 10,
>>  	.vtotal	     =3D 1440 + 18 + 10 + 17,
>> -	.clock	     =3D 69000,
>> +	.clock	     =3D (720 + 40 + 40 + 40) * (1440 + 18 + 10 + 17) * 60 / 10=
00,
>
> As for pinephone, A64 can=E2=80=99t produce 74.844 MHz precisely, so this=
 will not work.
>
> Better fix is to alter the mode so that clock can be something the only S=
oC this
> panel is used with can actually produce.
>
> See eg. <https://github.com/megous/linux/commit/dd070679d717e7f34af755856=
3698240a43981a6>
> which is tested to actually produce 60Hz by measuring the vsync events ag=
ainst
> the CPU timer.
>
> Your patch will not produce the intended effect.
>
> kind regards,
> 	o.
>

The TL;DR of my upcoming musings are: Thank you very much for your feedback=
! Any
recommendations for an informative read about the topic that you or anybody=
 else
has, is greatly appreciated.

How did you measure the vsync events? Were you using vblank interrupts [1]?

I have to admit that I tested only visually and couldn=E2=80=99t spot a dif=
ference
between your patch and mine. I=E2=80=99ll need to put more thinking into th=
is, and maybe
you or anyone reading this can help me with that.

My interpretation of the `struct drm_display_mode` documentation [2] was, t=
hat
these are logical dimensions/clocks that somewhere down the stack are conve=
rted
to their physical/hardware representation.

But now I=E2=80=99ve read the description of the struct=E2=80=99s =E2=80=9C=
crtc_clock=E2=80=9D member more
carefully. It says:
=E2=80=9CActual pixel or dot clock in the hardware. This differs from the
logical @clock when e.g. using interlacing, double-clocking, stereo
modes or other fancy stuff that changes the timings and signals
actually sent over the wire.=E2=80=9D

So, can I say that if we don=E2=80=99t use =E2=80=9Cinterlacing, double-clo=
cking, stereo modes
or other fancy stuff=E2=80=9D that `crtc_clock` will be equal to `clock` an=
d therefore
we have to choose `clock` according to the SoC=E2=80=99s capabilities?

Also, I haven=E2=80=99t found a source about which values to use for the fr=
ont and back
porch part of the panel and why can you just =E2=80=9Carbitrarily=E2=80=9D =
change those. My
assumption is, that those are just extra pixels we can add to make the
dimensions match the ratio of clock and vertical refresh rate. At least that
seems to be, what you did in your patch. But again, no source to back my
assumption about the range the porches can have.

I=E2=80=99ve put the following docs on my =E2=80=9Cto read and understand=
=E2=80=9D list:
=E2=80=A2 Allwinner A64 User Manual (to learn more about the SoC=E2=80=99s =
TCON0 and what
  clock=E2=80=99s the SoC can produce)
=E2=80=A2 drm-internals.rst
=E2=80=A2 =E2=80=9CRendering PinePhone=E2=80=99s display=E2=80=9D [3], to l=
earn why it produces 69 MHz.
=E2=80=A2 Your commit message for the PinePhone Pro panel [4] (found on you=
r blog:
  <https://xnux.eu/log/>)

Is there anything else I should add?

Thank you again and best regards,
  Frank

[1] <https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/drivers/gpu/drm/drm_vblank.c>
[2] <https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/include/drm/drm_modes.h#n198>
[3] <https://lupyuen.github.io/articles/de>
[4] <https://github.com/megous/linux/commit/a173b114c9323c718530280b3a918d0=
925edaa6a>

>>  	.flags	     =3D DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
>>  	.width_mm    =3D 68,
>>  	.height_mm   =3D 136,
>> =E2=80=93
>> 2.39.1
>>

--=-=-=--
