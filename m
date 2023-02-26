Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1906A3323
	for <lists+dri-devel@lfdr.de>; Sun, 26 Feb 2023 18:17:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7298510E152;
	Sun, 26 Feb 2023 17:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3496010E152
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Feb 2023 17:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1677431856; bh=PdQE92l4m1eosnMoyNkPDV+mCLKb8gG7MiUyMELBZqg=;
 h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
 b=m3e8RT4Fk3sq1lFOKgzW6RqgUeGiCU0RlyOgZdfvVvhib1ScKporyCO2BTzRSwtO5
 birWLyUtybAXjaDkMav1oh1IvuB9uBnDNLwF6xE+XrENTDPq8uFRD9oL/y1zc4cTOH
 k8oytTWO+mVBTHiH0kqpHOfRBYl1Fsy1JCccV3KI=
Date: Sun, 26 Feb 2023 18:17:35 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: Frank Oltmanns <frank@oltmanns.dev>
Subject: Re: [PATCH 1/1] drm/panel: st7703: Fix vertical refresh rate of XBD599
Message-ID: <20230226171735.h7fqce3sdlvvi3jn@core>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
 Frank Oltmanns <frank@oltmanns.dev>,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20230219114553.288057-1-frank@oltmanns.dev>
 <20230219114553.288057-2-frank@oltmanns.dev>
 <20230219123542.yxb5ixe424ig6ofv@core>
 <87zg90e6s5.fsf@oltmanns.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87zg90e6s5.fsf@oltmanns.dev>
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

Hi,

On Sun, Feb 26, 2023 at 04:17:32PM +0100, Frank Oltmanns wrote:
> Hi Ondřej,
> hi Guido,
> 
> On 2023-02-19 at 13:35:42 +0100, Ondřej Jirman <megous@megous.com> wrote:
> 
> > On Sun, Feb 19, 2023 at 12:45:53PM +0100, Frank Oltmanns wrote:
> >> Fix the XBD599 panel’s slight visual stutter by correcting the pixel
> >> clock speed so that the panel’s 60Hz vertical refresh rate is met.
> >>
> >> Set the clock speed using the underlying formula instead of a magic
> >> number. To have a consistent procedure for both panels, set the JH057N
> >> panel’s clock also as a formula.
> >>
> >> —
> >>  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 4 ++–
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff –git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> >> index 6747ca237ced..cd7d631f7573 100644
> >> — a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> >> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> >> @@ -139,7 +139,7 @@ static const struct drm_display_mode jh057n00900_mode = {
> >>  	.vsync_start = 1440 + 20,
> >>  	.vsync_end   = 1440 + 20 + 4,
> >>  	.vtotal	     = 1440 + 20 + 4 + 12,
> >> -	.clock	     = 75276,
> >> +	.clock	     = (720 + 90 + 20 + 20) * (1440 + 20 + 4 + 12) * 60 / 1000,
> >>  	.flags	     = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> >>  	.width_mm    = 65,
> >>  	.height_mm   = 130,
> >> @@ -324,7 +324,7 @@ static const struct drm_display_mode xbd599_mode = {
> >>  	.vsync_start = 1440 + 18,
> >>  	.vsync_end   = 1440 + 18 + 10,
> >>  	.vtotal	     = 1440 + 18 + 10 + 17,
> >> -	.clock	     = 69000,
> >> +	.clock	     = (720 + 40 + 40 + 40) * (1440 + 18 + 10 + 17) * 60 / 1000,
> >
> > As for pinephone, A64 can’t produce 74.844 MHz precisely, so this will not work.
> >
> > Better fix is to alter the mode so that clock can be something the only SoC this
> > panel is used with can actually produce.
> >
> > See eg. <https://github.com/megous/linux/commit/dd070679d717e7f34af7558563698240a43981a6>
> > which is tested to actually produce 60Hz by measuring the vsync events against
> > the CPU timer.
> 
> I did some testing using a 60fps video I produced using the following command:
> ffmpeg -f lavfi -i testsrc=duration=10:size=80x50:rate=60 -vf
> “drawtext=text=%{n}:fontsize=36:r=60:x=(w-tw)/2:
> y=h-(1*lh):fontcolor=white:box=1:boxcolor=0x00000099” test_80x50.mp4
> 
> This 10-second video shows an increasing number on every frame, which makes it
> easy to spot dropped frames by recording the playback with a camera that can
> record more than 60fps (I used a 240fps camera).
> 
> When playing back that video with your current drm-6.2 branch I get a steady
> 60fps. But applying either your or my patch to mainline, only helps very
> little. Frames are being skipped more often than not in both cases.
> 
> Therefore, I need to investigate more and retract the patch for now.
> 
> The other two patches I sent earlier, however, are far more important for
> making the pinephone usable on mainline.

Mainline sunxi DE2 DRM driver has a bug where it doesn't respect the requirement
to use the 50% higher clock for MIPI DSI output. So real refresh rate will be
2/3 the expected one, even if everything else is set correctly.

This is not documented in A64 datasheet, but it is documented in one of other
Allwinner SoC datasheets that reuse DE2 engine and MIPI DSI interface.

So, you need this first: https://github.com/megous/linux/commit/cc3ce397408b597f5cab2c987cd88cce3a8509d3

When this is fixed, it's possible to finetune the panel refresh rate/mode to
the actual clock. The values I have sent you the link to are tuned to
60.006 Hz Maybe you'll find some values that will produce 60Hz exactly,
but the above is the closest I was able to get to 60Hz.

kind regards,
	o.


> Best regards,
>   Frank
> 
> >
> > Your patch will not produce the intended effect.
> >
> > kind regards,
> > 	o.
> >
> >>  	.flags	     = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> >>  	.width_mm    = 68,
> >>  	.height_mm   = 136,
> >> –
> >> 2.39.1
> >>

