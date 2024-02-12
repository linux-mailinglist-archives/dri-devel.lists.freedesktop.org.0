Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7E4851518
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 14:29:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6CBC10E2AD;
	Mon, 12 Feb 2024 13:29:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oltmanns.dev header.i=@oltmanns.dev header.b="vw0PaWBD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D1BE10E245
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 13:29:27 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4TYQKY3z40z9sbq;
 Mon, 12 Feb 2024 14:29:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1707744561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6hQXyKsjxlQOVZTDodnZAiw/5mwBoEpdiKUN3Omtj/4=;
 b=vw0PaWBD/K1z9/h6KAOxQ33Wa+sXzXwyrc5m8vXDM0DDGmCre4J5jA4GBLZR7mbU47XTIw
 xmU4VNFK7vajv6HhNe0qeV/VYW0cU6ZN1A9ESzAdmrAYpNG+HsG2hJjuexkJHndxTiZ8dv
 mzAX4NgZ6Ii525xOHXFDG/DruyFc95+VHeP7H0dzGEwf9wouGAdcNWnWH0dGaQiYojmmdq
 fmObgubotgbVFOmnNChdzKiMWeCKQXiysg18nifA0/OUb4SJavwo6yv4uruXLn+nA6LQ86
 k0yfiWnHsdTs68XseNapwFnFCIHwAQc1oBBpyQjNVV+/n7yWOqFwVvR1nOmbOQ==
References: <20240205-pinephone-pll-fixes-v2-0-96a46a2d8c9b@oltmanns.dev>
 <20240205-pinephone-pll-fixes-v2-5-96a46a2d8c9b@oltmanns.dev>
 <poua4bzyciiwt65sqjf2whqfdumvoe4h3bkjpf64px2vwgumrf@sai73byg2iju>
 <87sf1zxb0s.fsf@oltmanns.dev>
From: Frank Oltmanns <frank@oltmanns.dev>
To: Maxime Ripard <mripard@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Guido
 =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>, Purism Kernel Team
 <kernel@puri.sm>, Ondrej
 Jirman <megi@xff.cz>, Neil Armstrong <neil.armstrong@linaro.org>, Jessica
 Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/6] drm/panel: st7703: Drive XBD599 panel at higher
 clock rate
In-reply-to: <87sf1zxb0s.fsf@oltmanns.dev>
Date: Mon, 12 Feb 2024 14:29:14 +0100
Message-ID: <87o7clyfo5.fsf@oltmanns.dev>
MIME-Version: 1.0
Content-Type: text/plain
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


On 2024-02-11 at 16:42:43 +0100, Frank Oltmanns <frank@oltmanns.dev> wrote:
> On 2024-02-08 at 20:05:08 +0100, Maxime Ripard <mripard@kernel.org> wrote:
>> [[PGP Signed Part:Undecided]]
>> Hi Frank,
>>
>> On Mon, Feb 05, 2024 at 04:22:28PM +0100, Frank Oltmanns wrote:
>>> This panel is used in the pinephone that runs on a Allwinner A64 SOC.
>>> The SOC requires pll-mipi to run at more than 500 MHz.
>>>
>>> This is the relevant clock tree:
>>>  pll-mipi
>>>     tcon0
>>>        tcon-data-clock
>>>
>>> tcon-data-clock has to run at 1/4 the DSI per-lane bit rate. The XBD599
>>> has 24 bpp and 4 lanes. Therefore, the resulting requested
>>> tcon-data-clock rate is:
>>>     crtc_clock * 1000 * (24 / 4) / 4
>>>
>>> tcon-data-clock runs at tcon0 / 4 (fixed divisor), so it requests a
>>> parent rate of
>>>     4 * (crtc_clock * 1000 * (24 / 4) / 4)
>>>
>>> Since tcon0 is a ccu_mux, the rate of tcon0 equals the rate of pll-mipi.
>>>
>>> pll-mipi's constraint to run at 500MHz or higher forces us to have a
>>> crtc_clock >= 83333 kHz if we want a 60 Hz vertical refresh rate.
>>>
>>> Change [hv]sync_(start|end) so that we reach a clock rate of 83502 kHz
>>> so that it is high enough to align with pll-pipi limits.
>>>
>>> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
>>
>> That commit log is great, but it's kind of off-topic. It's a panel
>> driver, it can be used on any MIPI-DSI controller, the only relevant
>> information there should be the panel timings required in the datasheet.
>>
>> The PLL setup is something for the MIPI-DSI driver to adjust, not for
>> the panel to care for.
>>
>
> I absolutely agree. It even was the reason for my submission of a
> sunxi-ng patch series last year that was accepted, to make pll-mipi more
> flexible. :)
>
> The only remaining option I currently see for adjusting the sunxi-ng
> driver to further accomodate the panel, is trying to use a higher
> divisor than 4 for calculating tcon-data-clock from tcon0. I remember
> reading a discussion about this, but as far as I remember that proposal
> was rejected (by you, IIRC).
>
> While I appreciate other suggestion as well, I'll look into options for
> using a different divisor than 4.

I tried the following:
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -391,7 +391,7 @@ static void sun4i_tcon0_mode_set_cpu(struct sun4i_tcon *tcon,
         * dclk is required to run at 1/4 the DSI per-lane bit rate.
         */
        tcon->dclk_min_div = SUN6I_DSI_TCON_DIV;
-       tcon->dclk_max_div = SUN6I_DSI_TCON_DIV;
+       tcon->dclk_max_div = 127;
        clk_set_rate(tcon->dclk, mode->crtc_clock * 1000 * (bpp / lanes)
                                                  / SUN6I_DSI_TCON_DIV);

On the pinephone, this selects a divisor of 6 resulting in a 25% frame
drop. I.e., unless I'm missing something using a divisor other than 4 is
not an option. This also matches your report from 2019: "Well, it's also
breaking another panel." [1]

I can currently see the following options:

a. Drive PLL-MIPI outside spec and panel within spec (current situation,
   but missing a small patch [2] that fixes the crtc_clock and nothing
   else) and live with the fact that some pinephones will run
   unreliably.

b. Drive PLL-MIPI and panel within spec and shove data into the panel at
   a too high rate (i.e., apply the rest of this series but not this
   specific patch). This seems to mostly work, but hasn't seen any long
   term testing. Short term testing showed that this approach results in
   a slight but noticable unsmooth scrolling behavior.

c. Drive PLL-MIPI within spec and panel outside spec (i.e., apply a
   future version of the whole series). This has been tested for over a
   month on three devices that I know of. There are no reports of panels
   not working with the suggested parameters.

All options require additional work on the GPU rate which is currently
being discussed in a parallel thread of this series. Unless somebody
comes up with a better idea, I will pause working on fixing PLL-MIPI and
focus on the GPU instead. While I doubt it, maybe fixing the GPU is
sufficient and continuing to drive PLL-MIPI outside spec proves to be
ok.

[1]: https://lore.kernel.org/all/20190828130341.s5z76wejulwdgxlc@flea/
[2]: https://lore.kernel.org/all/20230219114553.288057-2-frank@oltmanns.dev/

Best regards,
  Frank

>
> Best regards,
>   Frank
>
>>
>> Maxime
>>
>> [[End of PGP Signed Part]]
