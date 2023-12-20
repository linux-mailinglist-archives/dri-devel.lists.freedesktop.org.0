Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFAB81A753
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 20:37:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4437710E5E6;
	Wed, 20 Dec 2023 19:37:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org
 [IPv6:2001:67c:2050:0:465::101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F9310E5E6
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 19:37:50 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4SwP3b1fmjz9ssS;
 Wed, 20 Dec 2023 20:37:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1703101067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jgxSUwGOi+ie/puV3wymSBpsL2XirYOnPiXm8jpB72I=;
 b=xbQQdgnGakr8QIqbYrhLaYBAmMjZeHqK+kgRtWIfiTEw6bI2ZeRalOrkweo9b7MqptX65d
 vIB4sGVAAw79caC0Tus+QNhPiHsM/RKd12D7HtqTwbkNUq+osNaBuIkZWFRmQnuk62b6Hv
 8wuPpg/a75LWGtHsnabNtGjgFzqnWBahaUS1qTs2kAmneFYcC7YNJblIpi0/Ek+BOHHse6
 bb7ZnfOx4X1ew9HJUvbUxRqsXSp29Z3dXNuxKhEFJ9YtSUN3NgLTdsXB8mfWfLHb3nUVFT
 ud9eAuOyF4gFtqV41ulbeS2P0PoRaVtJ0pfcw/A0HFfcQX4PiUHNK7yp0fz1IQ==
References: <20231218-pinephone-pll-fixes-v1-0-e238b6ed6dc1@oltmanns.dev>
 <10386431.nUPlyArG6x@jernej-laptop> <87edfh9ud8.fsf@oltmanns.dev>
 <1845418.atdPhlSkOF@jernej-laptop>
From: Frank Oltmanns <frank@oltmanns.dev>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 5/5] drm/panel: st7703: Drive XBD599 panel at higher
 clock rate
Date: Wed, 20 Dec 2023 19:57:06 +0100
In-reply-to: <1845418.atdPhlSkOF@jernej-laptop>
Message-ID: <875y0sacmz.fsf@oltmanns.dev>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Purism Kernel Team <kernel@puri.sm>, Samuel Holland <samuel@sholland.org>,
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>,
 Ondrej Jirman <megi@xff.cz>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Ok, I've done more detailed testing, and it seems this patch results in
lots of dropped frames. I'm sorry for not being more thorough earlier.
I'll do some more testing without this patch and might have to either
remove it from V2 of this series.

I need to see if the same stability can be achieved when running
PLL-MIPI outside its specied range.

Best regards,
  Frank

On 2023-12-20 at 16:18:49 +0100, Jernej =C5=A0krabec <jernej.skrabec@gmail.=
com> wrote:
> Dne sreda, 20. december 2023 ob 08:14:27 CET je Frank Oltmanns napisal(a):
>>
>> On 2023-12-19 at 18:04:29 +0100, Jernej =C5=A0krabec <jernej.skrabec@gma=
il.com> wrote:
>> > Dne ponedeljek, 18. december 2023 ob 14:35:23 CET je Frank Oltmanns na=
pisal(a):
>> >> This panel is used in the pinephone that runs on a Allwinner A64 SOC.
>> >> Acoording to it's datasheet, the SOC requires PLL-MIPI to run at more
>> >> than 500 MHz.
>> >>
>> >> Therefore, change [hv]sync_(start|end) so that we reach a clock rate
>> >> that is high enough to drive PLL-MIPI within its limits.
>> >>
>> >> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
>> >
>> > I'm not too sure about this patch. I see that PLL_MIPI doesn't have set
>> > minimum frequency limit in clock driver. If you add it, clock framework
>> > should find rate that is high enough and divisible with target rate.
>>
>> This one is really a tough nut. Unfortunately, the PLL_MIPI clock for
>> this panel has to run exactly at 6 * panel clock. Let me start by
>> showing the relevant part of the clock tree (this is on the pinephone
>> after applying the patches):
>>     pll-video0                 393600000
>>        pll-mipi                500945454
>>           tcon0                500945454
>>              tcon-data-clock   125236363
>>
>> To elaborate, tcon-data-clock has to run at 1/4 the DSI per-lane bit
>> rate [1]. It's a fixed divisor
>>
>> The panel I'm proposing to change is defined as this:
>>
>>     static const struct st7703_panel_desc xbd599_desc =3D {
>>     	.mode =3D &xbd599_mode,
>>     	.lanes =3D 4,
>>     	.mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULS=
E,
>>     	.format =3D MIPI_DSI_FMT_RGB888,
>>     	.init_sequence =3D xbd599_init_sequence,
>>     };
>>
>> So, we have 24 bpp and 4 lanes. Therefore, the resulting requested
>> tcon-data-clock rate is
>>     crtc_clock * 1000 * (24 / 4) / 4
>>
>> tcon-data-clock therefore requests a parent rate of
>>     4 * (crtc_clock * 1000 * (24 / 4) / 4)
>>
>> The initial 4 is the fixed divisor between tcon0 and tcon-data-clock.
>> Since tcon0 is a ccu_mux, the rate of tcon0 equals the rate of pll-mipi.
>>
>> Since PLL-MIPI has to run at at least at 500MHz this forces us to have a
>> crtc_clock >=3D 83.333 MHz. The mode I'm prorposing results in a rate of
>> 83.502 MHz.
>
> This is much better explanation why this change is needed. Still, I think
> adding min and max rate to PLL_MIPI would make sense, so proper rates
> are guaranteed.
>
> Anyway, do you know where are all those old values come from? And how did
> you come up with new ones? I guess you can't just simply change timings,
> there are probably some HW limitations? Do you know if BSP kernel support
> this panel and how this situation is solved there?
>
>>
>> If we only changed the constraints on the PLL_MIPI without changing the
>> panel mode, we end up with a mismatch. This, in turn, would result in
>> dropped frames, right?
>
> From what I read, I think frame rate would be higher than 60 fps. What
> exactly would happen depends on the panel.
>
> Best regards,
> Jernej
>
>>
>> Best regards,
>>   Frank
>>
>> [1] Source:
>> https://elixir.bootlin.com/linux/v6.6.7/source/drivers/gpu/drm/sun4i/sun=
4i_tcon.c#L346
>>
>> >
>> > Best regards,
>> > Jernej
>> >
>> >> ---
>> >>  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 14 +++++++-------
>> >>  1 file changed, 7 insertions(+), 7 deletions(-)
>> >>
>> >> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/=
gpu/drm/panel/panel-sitronix-st7703.c
>> >> index b55bafd1a8be..6886fd7f765e 100644
>> >> --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
>> >> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
>> >> @@ -320,14 +320,14 @@ static int xbd599_init_sequence(struct st7703 *=
ctx)
>> >>
>> >>  static const struct drm_display_mode xbd599_mode =3D {
>> >>  	.hdisplay    =3D 720,
>> >> -	.hsync_start =3D 720 + 40,
>> >> -	.hsync_end   =3D 720 + 40 + 40,
>> >> -	.htotal	     =3D 720 + 40 + 40 + 40,
>> >> +	.hsync_start =3D 720 + 65,
>> >> +	.hsync_end   =3D 720 + 65 + 65,
>> >> +	.htotal      =3D 720 + 65 + 65 + 65,
>> >>  	.vdisplay    =3D 1440,
>> >> -	.vsync_start =3D 1440 + 18,
>> >> -	.vsync_end   =3D 1440 + 18 + 10,
>> >> -	.vtotal	     =3D 1440 + 18 + 10 + 17,
>> >> -	.clock	     =3D 69000,
>> >> +	.vsync_start =3D 1440 + 30,
>> >> +	.vsync_end   =3D 1440 + 30 + 22,
>> >> +	.vtotal	     =3D 1440 + 30 + 22 + 29,
>> >> +	.clock	     =3D (720 + 65 + 65 + 65) * (1440 + 30 + 22 + 29) * 60 /=
 1000,
>> >>  	.flags	     =3D DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
>> >>  	.width_mm    =3D 68,
>> >>  	.height_mm   =3D 136,
>> >>
>> >>
>>
