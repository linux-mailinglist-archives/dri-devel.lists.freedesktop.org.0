Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D48E58199EC
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 09:00:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A3310E31A;
	Wed, 20 Dec 2023 08:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C5B10E546
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 08:00:19 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Sw5Zl6vNVz9stJ;
 Wed, 20 Dec 2023 09:00:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1703059216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QqldQq4iYnwodp4WI9zeX0/sLSL0co8plzKW8BOl6wU=;
 b=M8Rb13GaWi0+87YX68eL0msATQpuKN2iD821jWi5dWIv8wfhFoj15m8Bo1xnErSeNul+XD
 QjdZYlO4uL+x1wpYIcx3pVoINtmlSC9MRymyi3Ev7tKdMfAaRo7e93i+DfBEQHreJQnaej
 /aEqtw31aZPE+lKP4mAlrwwmD2lj5Kl5LBxzchvYt7YI+cn9o0AW1AwYFaRfvHErlVFBkc
 32b1MSczJEiucBJvX7alXh7BMRI0rGKPzMsQRO0VuIeyZimRnOjnfwTcdBX2p2zwRqbRed
 hkx4nejuv10aVvFfZ2beuOzQ1yqCSz6OzmT8/pi+cejB5/Q/0ZNeYRxX6sDZ+Q==
References: <20231218-pinephone-pll-fixes-v1-0-e238b6ed6dc1@oltmanns.dev>
 <20231218-pinephone-pll-fixes-v1-5-e238b6ed6dc1@oltmanns.dev>
 <10386431.nUPlyArG6x@jernej-laptop>
From: Frank Oltmanns <frank@oltmanns.dev>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 5/5] drm/panel: st7703: Drive XBD599 panel at higher
 clock rate
Date: Wed, 20 Dec 2023 08:14:27 +0100
In-reply-to: <10386431.nUPlyArG6x@jernej-laptop>
Message-ID: <87edfh9ud8.fsf@oltmanns.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4Sw5Zl6vNVz9stJ
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


On 2023-12-19 at 18:04:29 +0100, Jernej =C5=A0krabec <jernej.skrabec@gmail.=
com> wrote:
> Dne ponedeljek, 18. december 2023 ob 14:35:23 CET je Frank Oltmanns napis=
al(a):
>> This panel is used in the pinephone that runs on a Allwinner A64 SOC.
>> Acoording to it's datasheet, the SOC requires PLL-MIPI to run at more
>> than 500 MHz.
>>
>> Therefore, change [hv]sync_(start|end) so that we reach a clock rate
>> that is high enough to drive PLL-MIPI within its limits.
>>
>> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
>
> I'm not too sure about this patch. I see that PLL_MIPI doesn't have set
> minimum frequency limit in clock driver. If you add it, clock framework
> should find rate that is high enough and divisible with target rate.

This one is really a tough nut. Unfortunately, the PLL_MIPI clock for
this panel has to run exactly at 6 * panel clock. Let me start by
showing the relevant part of the clock tree (this is on the pinephone
after applying the patches):
    pll-video0                 393600000
       pll-mipi                500945454
          tcon0                500945454
             tcon-data-clock   125236363

To elaborate, tcon-data-clock has to run at 1/4 the DSI per-lane bit
rate [1]. It's a fixed divisor

The panel I'm proposing to change is defined as this:

    static const struct st7703_panel_desc xbd599_desc =3D {
    	.mode =3D &xbd599_mode,
    	.lanes =3D 4,
    	.mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE,
    	.format =3D MIPI_DSI_FMT_RGB888,
    	.init_sequence =3D xbd599_init_sequence,
    };

So, we have 24 bpp and 4 lanes. Therefore, the resulting requested
tcon-data-clock rate is
    crtc_clock * 1000 * (24 / 4) / 4

tcon-data-clock therefore requests a parent rate of
    4 * (crtc_clock * 1000 * (24 / 4) / 4)

The initial 4 is the fixed divisor between tcon0 and tcon-data-clock.
Since tcon0 is a ccu_mux, the rate of tcon0 equals the rate of pll-mipi.

Since PLL-MIPI has to run at at least at 500MHz this forces us to have a
crtc_clock >=3D 83.333 MHz. The mode I'm prorposing results in a rate of
83.502 MHz.

If we only changed the constraints on the PLL_MIPI without changing the
panel mode, we end up with a mismatch. This, in turn, would result in
dropped frames, right?

Best regards,
  Frank

[1] Source:
https://elixir.bootlin.com/linux/v6.6.7/source/drivers/gpu/drm/sun4i/sun4i_=
tcon.c#L346

>
> Best regards,
> Jernej
>
>> ---
>>  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 14 +++++++-------
>>  1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu=
/drm/panel/panel-sitronix-st7703.c
>> index b55bafd1a8be..6886fd7f765e 100644
>> --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
>> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
>> @@ -320,14 +320,14 @@ static int xbd599_init_sequence(struct st7703 *ctx)
>>
>>  static const struct drm_display_mode xbd599_mode =3D {
>>  	.hdisplay    =3D 720,
>> -	.hsync_start =3D 720 + 40,
>> -	.hsync_end   =3D 720 + 40 + 40,
>> -	.htotal	     =3D 720 + 40 + 40 + 40,
>> +	.hsync_start =3D 720 + 65,
>> +	.hsync_end   =3D 720 + 65 + 65,
>> +	.htotal      =3D 720 + 65 + 65 + 65,
>>  	.vdisplay    =3D 1440,
>> -	.vsync_start =3D 1440 + 18,
>> -	.vsync_end   =3D 1440 + 18 + 10,
>> -	.vtotal	     =3D 1440 + 18 + 10 + 17,
>> -	.clock	     =3D 69000,
>> +	.vsync_start =3D 1440 + 30,
>> +	.vsync_end   =3D 1440 + 30 + 22,
>> +	.vtotal	     =3D 1440 + 30 + 22 + 29,
>> +	.clock	     =3D (720 + 65 + 65 + 65) * (1440 + 30 + 22 + 29) * 60 / 10=
00,
>>  	.flags	     =3D DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
>>  	.width_mm    =3D 68,
>>  	.height_mm   =3D 136,
>>
>>
