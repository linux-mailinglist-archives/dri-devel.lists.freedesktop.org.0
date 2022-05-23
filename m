Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5209F5314FE
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 18:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5578D10E0A6;
	Mon, 23 May 2022 16:39:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 385 seconds by postgrey-1.36 at gabe;
 Mon, 23 May 2022 16:39:19 UTC
Received: from relay-us1.mymailcheap.com (relay-us1.mymailcheap.com
 [51.81.35.219])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A010310E0A6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 16:39:19 +0000 (UTC)
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.241.64])
 by relay-us1.mymailcheap.com (Postfix) with ESMTPS id F22372018C
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 16:32:52 +0000 (UTC)
Received: from relay4.mymailcheap.com (relay4.mymailcheap.com [137.74.80.155])
 by relay5.mymailcheap.com (Postfix) with ESMTPS id 8BB7B200FE
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 16:32:49 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com
 [149.56.130.247])
 by relay4.mymailcheap.com (Postfix) with ESMTPS id 0C9B920057;
 Mon, 23 May 2022 16:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by filter1.mymailcheap.com (Postfix) with ESMTP id 63ECC2A3ED;
 Mon, 23 May 2022 16:32:46 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
 by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ovGxMFm9Hgml; Mon, 23 May 2022 16:32:45 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter1.mymailcheap.com (Postfix) with ESMTPS;
 Mon, 23 May 2022 16:32:45 +0000 (UTC)
Received: from 127.0.0.1 (unknown [64.225.114.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id AE38240052;
 Mon, 23 May 2022 16:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
 t=1653323564; bh=eMM2/LtD774HPGpt7c9+GCfHLaVlFZojZGyfHiFMXgc=;
 h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
 b=rQP6QQMdXVt8a+M59gi/CGqj054PzWViKiKB+E2UK3QpNOb5azsnBVccs5pV9bTAF
 EpLSLfeC3gM9CDU4RfvEE/0aIbSiMsfbA8odAmCq3TXiFFD3XVlvpWvibWtkSjQggZ
 IVHrN8yGSMXC/j5+ViIn0Qh+QHJvJihInO2Wi1uE=
Message-ID: <70b43ac2910ce9b3e3776d31eda7a791fbae5454.camel@aosc.io>
Subject: Re: [PATCH] drm/sun4i: mixer: fix scanline for V3s and D1
From: Icenowy Zheng <icenowy@aosc.io>
To: Jernej =?gb2312?Q?=810=947krabec?= <jernej.skrabec@gmail.com>, 
 mripard@kernel.org, wens@csie.org, Genfu Pan <benlypan@gmail.com>
In-Reply-To: <3173956.44csPzL39Z@jernej-laptop>
References: <20220521133443.1114749-1-benlypan@gmail.com>
 <3173956.44csPzL39Z@jernej-laptop>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date: Mon, 23 May 2022 21:14:45 +0800
User-Agent: Evolution 3.40.4 
Content-Transfer-Encoding: 8bit
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
Cc: samuel@sholland.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

在 2022-05-22星期日的 10:36 +0200，Jernej Škrabec写道：
> Hi!
> 
> Dne sobota, 21. maj 2022 ob 15:34:43 CEST je Genfu Pan napisal(a):
> > Accrording the SDK from Allwinner, the scanline value of yuv and
> > rgb for
> > V3s are both 1024.
> 
> s/scanline value/scanline length/
> 
> Which SDK? All SDKs that I have or found on internet don't mention
> YUV nor RGB 
> scanline limit. That doesn't mean there is none, I'm just unable to
> verify 
> your claim. Did you test this by yourself? Also, please make YUV
> scanline 
> change separate patch with fixes tag.

BTW I think chip manuals all say that the chip supports NxN resolution
in DE2 chapter, e.g. the V3 datasheet says DE2 "Output size up to
1024x1024".

However there's no information about D1's second mixer.

> 
> > The is also the same for mixer 1 of D1. Currently the
> > scanline value of rgb is hardcoded to 2048 for all SOCs.
> > 
> > Change the scanline_yuv property of V3s to 1024. > Add the
> > scanline_rgb
> > property to the mixer config and replace the hardcoded value with
> > it before
> > scaling.
> 
> I guess RGB scanline patch would also need fixes tag, since it fixes
> existing 
> bug.
> 
> > 
> > Signed-off-by: Genfu Pan <benlypan@gmail.com>
> > ---
> >  drivers/gpu/drm/sun4i/sun8i_mixer.c    | 13 ++++++++++++-
> >  drivers/gpu/drm/sun4i/sun8i_mixer.h    |  1 +
> >  drivers/gpu/drm/sun4i/sun8i_vi_layer.c |  3 +--
> >  3 files changed, 14 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > b/drivers/gpu/drm/sun4i/sun8i_mixer.c index 875a1156c..e64e08207
> > 100644
> > --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > @@ -567,6 +567,7 @@ static const struct sun8i_mixer_cfg
> > sun8i_a83t_mixer0_cfg = { .ccsc         = CCSC_MIXER0_LAYOUT,
> >         .scaler_mask    = 0xf,
> >         .scanline_yuv   = 2048,
> > +       .scanline_rgb   = 2048,
> >         .ui_num         = 3,
> >         .vi_num         = 1,
> >  };
> > @@ -575,6 +576,7 @@ static const struct sun8i_mixer_cfg
> > sun8i_a83t_mixer1_cfg = { .ccsc         = CCSC_MIXER1_LAYOUT,
> >         .scaler_mask    = 0x3,
> >         .scanline_yuv   = 2048,
> > +       .scanline_rgb   = 2048,
> >         .ui_num         = 1,
> >         .vi_num         = 1,
> >  };
> > @@ -584,6 +586,7 @@ static const struct sun8i_mixer_cfg
> > sun8i_h3_mixer0_cfg
> > = { .mod_rate   = 432000000,
> >         .scaler_mask    = 0xf,
> >         .scanline_yuv   = 2048,
> > +       .scanline_rgb   = 2048,
> >         .ui_num         = 3,
> >         .vi_num         = 1,
> >  };
> > @@ -593,6 +596,7 @@ static const struct sun8i_mixer_cfg
> > sun8i_r40_mixer0_cfg
> > = { .mod_rate   = 297000000,
> >         .scaler_mask    = 0xf,
> >         .scanline_yuv   = 2048,
> > +       .scanline_rgb   = 2048,
> >         .ui_num         = 3,
> >         .vi_num         = 1,
> >  };
> > @@ -602,6 +606,7 @@ static const struct sun8i_mixer_cfg
> > sun8i_r40_mixer1_cfg
> > = { .mod_rate   = 297000000,
> >         .scaler_mask    = 0x3,
> >         .scanline_yuv   = 2048,
> > +       .scanline_rgb   = 2048,
> >         .ui_num         = 1,
> >         .vi_num         = 1,
> >  };
> > @@ -610,7 +615,8 @@ static const struct sun8i_mixer_cfg
> > sun8i_v3s_mixer_cfg
> > = { .vi_num = 2,
> >         .ui_num = 1,
> >         .scaler_mask = 0x3,
> > -       .scanline_yuv = 2048,
> > +       .scanline_yuv = 1024,
> > +       .scanline_rgb = 1024,
> >         .ccsc = CCSC_MIXER0_LAYOUT,
> >         .mod_rate = 150000000,
> >  };
> > @@ -620,6 +626,7 @@ static const struct sun8i_mixer_cfg
> > sun20i_d1_mixer0_cfg
> > = { .mod_rate   = 297000000,
> >         .scaler_mask    = 0x3,
> >         .scanline_yuv   = 2048,
> > +       .scanline_rgb   = 2048,
> >         .ui_num         = 1,
> >         .vi_num         = 1,
> >  };
> > @@ -629,6 +636,7 @@ static const struct sun8i_mixer_cfg
> > sun20i_d1_mixer1_cfg
> > = { .mod_rate   = 297000000,
> >         .scaler_mask    = 0x1,
> >         .scanline_yuv   = 1024,
> > +       .scanline_rgb   = 1024,
> >         .ui_num         = 0,
> >         .vi_num         = 1,
> >  };
> > @@ -638,6 +646,7 @@ static const struct sun8i_mixer_cfg
> > sun50i_a64_mixer0_cfg = { .mod_rate     = 297000000,
> >         .scaler_mask    = 0xf,
> >         .scanline_yuv   = 4096,
> > +       .scanline_rgb   = 2048,
> >         .ui_num         = 3,
> >         .vi_num         = 1,
> >  };
> > @@ -647,6 +656,7 @@ static const struct sun8i_mixer_cfg
> > sun50i_a64_mixer1_cfg = { .mod_rate     = 297000000,
> >         .scaler_mask    = 0x3,
> >         .scanline_yuv   = 2048,
> > +       .scanline_rgb   = 2048,
> >         .ui_num         = 1,
> >         .vi_num         = 1,
> >  };
> > @@ -657,6 +667,7 @@ static const struct sun8i_mixer_cfg
> > sun50i_h6_mixer0_cfg
> > = { .mod_rate   = 600000000,
> >         .scaler_mask    = 0xf,
> >         .scanline_yuv   = 4096,
> > +       .scanline_rgb   = 2048,
> >         .ui_num         = 3,
> >         .vi_num         = 1,
> >  };
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> > b/drivers/gpu/drm/sun4i/sun8i_mixer.h index 85c94884f..c01b3e9d6
> > 100644
> > --- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> > +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> > @@ -172,6 +172,7 @@ struct sun8i_mixer_cfg {
> >         unsigned long   mod_rate;
> >         unsigned int    is_de3 : 1;
> >         unsigned int    scanline_yuv;
> > +       unsigned int    scanline_rgb;
> 
> This quirk needs to be documented above in the comment.
> 
> Best regards,
> Jernej
> 
> >  };
> > 
> >  struct sun8i_mixer {
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> > b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c index f7d0b082d..30e6bde92
> > 100644
> > --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> > +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> > @@ -188,8 +188,7 @@ static int sun8i_vi_layer_update_coord(struct
> > sun8i_mixer *mixer, int channel, src_h = vn;
> >                 }
> > 
> > -               /* it seems that every RGB scaler has buffer for
> > 2048 
> pixels */
> > -               scanline = subsampled ? mixer->cfg->scanline_yuv : 
> 2048;
> > +               scanline = subsampled ? mixer->cfg->scanline_yuv :
> > mixer->cfg->scanline_rgb;
> > 
> >                 if (src_w > scanline) {
> >                         DRM_DEBUG_DRIVER("Using horizontal coarse 
> scaling\n");
> 
> 
> 
> 
> 


