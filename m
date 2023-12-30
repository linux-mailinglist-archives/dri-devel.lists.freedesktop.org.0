Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEDB820889
	for <lists+dri-devel@lfdr.de>; Sat, 30 Dec 2023 22:17:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B809910E045;
	Sat, 30 Dec 2023 21:17:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB5A10E045
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Dec 2023 21:17:23 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4T2Znr2Cjnz9scM;
 Sat, 30 Dec 2023 22:17:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1703971040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EqzpSggOCyXix/RyQdbwO3KPIBKLdQSHS6acVQjzt6c=;
 b=Sm3iHXtNAXh9K/xf42tiU1rN0I+mCEy7Yh5xJB7lDG45dqj4W4QsJ7Q/8b/Z+/TQTOU6uL
 xJzOGVp79vCiwI3fCWWUQt/IPOXhjto4X8+hF37c+grkV4kAMOOZCqwAm8Y2mnb6XP8d+z
 sWkJ/CZAPewrist1vQJCgjN00S26rMZvLb5LeIiZJjWtBqHgUUHVHpw7yMy3M68bcYolTL
 gB1ZRwWHrAaIUagoQw6KafgX2nljdrhZMH1SDYB7NJw92QYz8Zqoq2tQpdiAVY4bpGg21o
 78kBpVZuMnESIZSP+DJR/X8wjBz5hKJDNFFo2xDZWzRFFpOp7sxQMs3olLm4lg==
References: <20231218-pinephone-pll-fixes-v1-0-e238b6ed6dc1@oltmanns.dev>
 <10386431.nUPlyArG6x@jernej-laptop> <87edfh9ud8.fsf@oltmanns.dev>
 <1845418.atdPhlSkOF@jernej-laptop>
From: Frank Oltmanns <frank@oltmanns.dev>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 5/5] drm/panel: st7703: Drive XBD599 panel at higher
 clock rate
In-reply-to: <1845418.atdPhlSkOF@jernej-laptop>
Date: Sat, 30 Dec 2023 22:17:06 +0100
Message-ID: <87wmsvo0fh.fsf@oltmanns.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4T2Znr2Cjnz9scM
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
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <uwu@icenowy.me>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


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

Okay, I'll include min and max rate in V2, because you're right that
it's the sane thing to do and actually it wasn't too much work. I (and
others) do experience crashes if pll-mipi is driven below the 500 MHz
mark, so let's fix this once and for all.

> Anyway, do you know where are all those old values come from?

I've done some digging on lore and the values were originally submitted
by Icenowy Zheng as part of a series to support the pinephone's LCD [1].
There has been some refactoring after this initial submission and Ondrej
Jirman took over. But the values are still the ones submitted by
Icenowy, so I've added her to CC. I couldn't find any documentation for
this specific panel.

> And how did
> you come up with new ones?

Trial and no error. :)

No, really, it was just a lucky guess. I know nothing about LCD panels,
so I only looked at the original values:
.htotal =3D  720 + 40 + 40 + 40,
.vtotal =3D 1440 + 18 + 10 + 17,

I thought, what if every time I increase a horizontal value by 2, I
increase a vertical value by 1 (very roughly).

So I ended up with:
.htotal =3D  720 + 65 + 65 + 65,
.vtotal =3D 1440 + 30 + 22 + 29,

So, in conclusion, I've increased each of the horizontal values by 25
and each of the vertical values by 12. Then I just tried out these new
values, and the world didn't end. :)

If this is stupid, please somebody let me know.

I (and at least one postmarket OS tester) have been daily driving the
panel with these values for about a week now.

I've checked the panel's refresh rate with the following test setup:
 - I created a 60 fps video that shows the current frame number in each
   frame. The video is 10 seconds (600 frames) long. [2]
 - I played that video on my pinephone using vlc. [3]
 - I recorded the playback with a Google Pixel 5 phone at 1/8 slow
   motion (240 fps).
 - I converted the video into individual pictures [4], resized
   the pictures to 10% [5], and finally - after deleting some superfluous
   pictures at the beginning and end - I created one big collage out of
   these [6].

I've uploaded the video[7], resulting collage [8] and the individual
pictures [9].

In the resulting picture you can see that in the beginning frame 2 is
missing and frame 136 is only barely visible because it is stuck too
long on frame 135. Other than that, I think this looks pretty good.

> I guess you can't just simply change timings,
> there are probably some HW limitations? Do you know if BSP kernel support
> this panel and how this situation is solved there?

I'm not aware of any BSP kernel that supports this kernel.

>> If we only changed the constraints on the PLL_MIPI without changing the
>> panel mode, we end up with a mismatch. This, in turn, would result in
>> dropped frames, right?
>
> From what I read, I think frame rate would be higher than 60 fps. What
> exactly would happen depends on the panel.

To give this a fair comparison, I tested with the original timings but
with correcting the panel's clock rate of 74844 kHZ instead of 69000 kHz
as discussed elsewhere in this thread [10] and pll-mipi running at
500MHz (because that's really a must to run the pinephone in a stable
manner). I used the same procedure as described above. Again, I've
uploaded the resulting video [11], collage [12] and the individual files
[13].

Here, the being stuck happens much more often, e.g. frames 23, 31, 40,
49, 58, 66 etc.

So, I think, in order to have a better user experience, I think it's a
good idea to update the XBD599 panel with the new values I proposed in
this patch.

Best regards,
  Frank

[1]: https://lore.kernel.org/all/20200311162936.221613-1-icenowy@aosc.io/
[2]: ffmpeg -f lavfi -i testsrc=3Dduration=3D10:size=3D80x50:rate=3D60 -vf \
   "drawtext=3Dtext=3D%{n}:fontsize=3D36:r=3D60:x=3D(w-tw)/2: y=3Dh-(1*lh):=
fontcolor=3Dwhite:box=3D1:boxcolor=3D0x00000099"\
   test_80x50.mp4
[3]: cvlc test_80x50.mp4  --fullscreen --play-and-exit
[4]: ffmpeg -i video_from_pixel_phone.mp4 -vsync vfr output_%04d.jpg
[5]: mogrify -resize 10% output_*.jpg
[6]: montage output_*.jpg -tile 20x -geometry +0+0 \
      verify_panel_65_65_65_30_22_29_83502.jpg
[7]: https://share.mailbox.org/ajax/share/0a471a7205211949ad7067d5211945719=
84a15d1613d74be/1/8/Njg/NjgvMzE
[8]: https://share.mailbox.org/ajax/share/0741f90808f2df4e7d1e5078f2df43cfa=
e732189f27e75e3/1/8/Njg/NjgvMzI
[9]: https://share.mailbox.org/ajax/share/0471bc0706bfee4e4e1a0086bfee40ecb=
a2123a14c9b8d4d/1/8/Njg/NjgvMzA
[10]: https://lore.kernel.org/all/87v88qk3ge.fsf@oltmanns.dev/
[11]: https://share.mailbox.org/ajax/share/036036d00eac574e3f02adfeac5741dd=
a88105026a1221f4/1/8/Njg/NjgvMzQ
[12]: https://share.mailbox.org/ajax/share/05f6d3e905e30058566cfe65e300486a=
a936122f2414639a/1/8/Njg/NjgvMzU
[13]: https://share.mailbox.org/ajax/share/0cf25a810cce2357c62468ecce234681=
a4e8e674d38d02cd/1/8/Njg/NjgvMzM

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
