Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C43419E70B
	for <lists+dri-devel@lfdr.de>; Sat,  4 Apr 2020 20:25:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 872846E186;
	Sat,  4 Apr 2020 18:25:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D547F6E186
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Apr 2020 18:25:50 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59DB6312;
 Sat,  4 Apr 2020 20:25:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1586024749;
 bh=PTvG/2khhxzZNEwEyrtZBzHyBxkv0ac/83/7I+tYhbM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JR2f8h6iYWY6ClzcUb+sEA1UtC1yRBJOVANHPgrx0pb73Kn9CCUFBafCsUUIocB/p
 xeMUol5K41vluJiKD/kFX38+rRQIn3HJSAiY/z36cjwo0wUZsAm6cD1z9iTr7muSq3
 ght3/2QROPC0lx53IXQLIAbSJtIou58XVoz35s/g=
Date: Sat, 4 Apr 2020 21:25:40 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] drm: rcar-du: Create immutable zpos property for primary
 planes
Message-ID: <20200404182540.GC4875@pendragon.ideasonboard.com>
References: <20200402104035.13497-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdXwUEuct=Pr29aGJuj1cgDmCEZFDm1JEx5-+zP-02n+mw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdXwUEuct=Pr29aGJuj1cgDmCEZFDm1JEx5-+zP-02n+mw@mail.gmail.com>
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
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomohito Esaki <etom@igel.co.jp>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

On Thu, Apr 02, 2020 at 01:12:51PM +0200, Geert Uytterhoeven wrote:
> On Thu, Apr 2, 2020 at 12:42 PM Laurent Pinchart wrote:
> > The R-Car DU driver creates a zpos property, ranging from 1 to 7, for
> > all the overlay planes, but leaves the primary plane without a zpos
> > property. The DRM/KMS API doesn't clearly specify if this is acceptable,
> > of it the property is mandatory for all planes when exposed for some of
> > the planes. Nonetheless, weston v8.0 has been reported to have trouble
> > handling this situation.
> >
> > The DRM core offers support for immutable zpos properties. Creating an
> > immutable zpos property set to 0 for the primary planes seems to be a
> > good way forward, as it shouldn't introduce any regression, and can fix
> > the issue. Do so.
> >
> > Reported-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Thanks for your patch!
> 
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> > @@ -785,13 +785,15 @@ int rcar_du_planes_init(struct rcar_du_group *rgrp)
> >
> >                 drm_plane_create_alpha_property(&plane->plane);
> >
> > -               if (type == DRM_PLANE_TYPE_PRIMARY)
> > -                       continue;
> > -
> > -               drm_object_attach_property(&plane->plane.base,
> > -                                          rcdu->props.colorkey,
> > -                                          RCAR_DU_COLORKEY_NONE);
> > -               drm_plane_create_zpos_property(&plane->plane, 1, 1, 7);
> > +               if (type == DRM_PLANE_TYPE_PRIMARY) {
> > +                       drm_plane_create_zpos_immutable_property(&plane->plane,
> > +                                                                0);
> > +               } else {
> > +                       drm_object_attach_property(&plane->plane.base,
> > +                                                  rcdu->props.colorkey,
> > +                                                  RCAR_DU_COLORKEY_NONE);
> > +                       drm_plane_create_zpos_property(&plane->plane, 1, 1, 7);
> > +               }
> >         }
> >
> >         return 0;
> 
> This is very similar to Esaki-san's patch[*] posted yesterday.

Thank you for pointing me to it, I had missed that patch.

> However, there's one big difference: your patch doesn't update
> rcar_du_vsp_init(). Isn't that needed?
> 
> [*] "[PATCH] drm: rcar-du: Set primary plane zpos immutably at initializing"
>     https://lore.kernel.org/linux-renesas-soc/20200401061100.7379-1-etom@igel.co.jp/

My bad. I've sent a v2 of Esaki-san's patch to CC the dri-devel mailing
list, and have applied it to my tree.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
