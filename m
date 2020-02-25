Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3622E16F91C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 09:09:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 069B76E1A8;
	Wed, 26 Feb 2020 08:08:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs31.siol.net [185.57.226.222])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A606EB90
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 18:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id 98BFF524A96;
 Tue, 25 Feb 2020 19:50:06 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id OIDBOTbewRWl; Tue, 25 Feb 2020 19:50:06 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id 2F4BF524A94;
 Tue, 25 Feb 2020 19:50:06 +0100 (CET)
Received: from jernej-laptop.localnet (cpe-194-152-20-232.static.triera.net
 [194.152.20.232]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Postfix) with ESMTPA id 93601524A8B;
 Tue, 25 Feb 2020 19:50:03 +0100 (CET)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Maxime Ripard <maxime@cerno.tech>, Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 6/7] drm/sun4i: de2: Don't return de2_fmt_info struct
Date: Tue, 25 Feb 2020 19:50:03 +0100
Message-ID: <12462592.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <CAGb2v64g7Q4e+ic08pA7tbamgToOjyYzuzqP0bpqBZjRuRUrPA@mail.gmail.com>
References: <20200224173901.174016-1-jernej.skrabec@siol.net>
 <20200225083448.6upblnctjjrbarje@gilmour.lan>
 <CAGb2v64g7Q4e+ic08pA7tbamgToOjyYzuzqP0bpqBZjRuRUrPA@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 26 Feb 2020 08:08:26 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

Dne torek, 25. februar 2020 ob 09:52:18 CET je Chen-Yu Tsai napisal(a):
> On Tue, Feb 25, 2020 at 4:35 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > Hi,
> > 
> > On Mon, Feb 24, 2020 at 06:39:00PM +0100, Jernej Skrabec wrote:
> > > Now that de2_fmt_info contains only DRM <-> HW format mapping, it
> > > doesn't make sense to return pointer to structure when searching by DRM
> > > format. Rework that to return only HW format instead.
> > > 
> > > This doesn't make any functional change.
> > > 
> > > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > > ---
> > > 
> > >  drivers/gpu/drm/sun4i/sun8i_mixer.c    | 15 +++++++++++----
> > >  drivers/gpu/drm/sun4i/sun8i_mixer.h    |  7 +------
> > >  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 10 +++++-----
> > >  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 12 ++++++------
> > >  4 files changed, 23 insertions(+), 21 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > > b/drivers/gpu/drm/sun4i/sun8i_mixer.c index e078ec96de2d..56cc037fd312
> > > 100644
> > > --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > > +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > > @@ -27,6 +27,11 @@
> > > 
> > >  #include "sun8i_vi_layer.h"
> > >  #include "sunxi_engine.h"
> > > 
> > > +struct de2_fmt_info {
> > > +     u32     drm_fmt;
> > > +     u32     de2_fmt;
> > > +};
> > > +
> > > 
> > >  static const struct de2_fmt_info de2_formats[] = {
> > >  
> > >       {
> > >       
> > >               .drm_fmt = DRM_FORMAT_ARGB8888,
> > > 
> > > @@ -230,15 +235,17 @@ static const struct de2_fmt_info de2_formats[] = {
> > > 
> > >       },
> > >  
> > >  };
> > > 
> > > -const struct de2_fmt_info *sun8i_mixer_format_info(u32 format)
> > > +int sun8i_mixer_drm_format_to_hw(u32 format, u32 *hw_format)
> > > 
> > >  {
> > >  
> > >       unsigned int i;
> > >       
> > >       for (i = 0; i < ARRAY_SIZE(de2_formats); ++i)
> > > 
> > > -             if (de2_formats[i].drm_fmt == format)
> > > -                     return &de2_formats[i];
> > > +             if (de2_formats[i].drm_fmt == format) {
> > > +                     *hw_format = de2_formats[i].de2_fmt;
> > > +                     return 0;
> > > +             }
> > > 
> > > -     return NULL;
> > > +     return -EINVAL;
> > > 
> > >  }
> > 
> > I'm not too sure about that one. It breaks the consistency with the
> > other functions, and I don't really see a particular benefit to it?
> 

I don't have strong opinion about this patch. It can be dropped.

> I guess we could just define an "invalid" value, and have the function
> return that if can't find a match? I'm guessing 0x0 is valid, so maybe
> 0xffffffff or 0xdeadbeef ?
> 
> That would keep consistency with everything else all the while
> removing the level of indirection you wanted to.

I modeled this after 
static int sun4i_backend_drm_format_to_layer(u32 format, u32 *mode);
from sun4i_backend.c.

What consistency do you have in mind?

> 
> ChenYu
> 
> > The rest of the series is
> > Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!

Best regards,
Jernej

> > 
> > Maxime




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
