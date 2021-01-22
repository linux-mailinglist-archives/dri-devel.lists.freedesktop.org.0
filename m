Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C62630049E
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 14:55:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FAEA89C98;
	Fri, 22 Jan 2021 13:55:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E843989C98
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 13:55:02 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id p5so6003159oif.7
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 05:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VXLHixBiJpq4dDQEs6Gtzm6NcpCMBkU8X2Af5+47SP8=;
 b=fRMpTwPjIHUaiFQn3JWCshKMbvL/9jw9UTg2r5aLKcTL6wI8i5Aeh+fcc5fL/Qw2dr
 5mbSk7k9MXRDR/3PFkmwZsS9bakHodMpF6ufpYOGwwr3Kkxpe7KZY5pWhLhMuKeqOhYu
 Jj0Eb+R39koAF7xKwpPGpp19H95FqvvjmmP2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VXLHixBiJpq4dDQEs6Gtzm6NcpCMBkU8X2Af5+47SP8=;
 b=ablhK9n/zTNb82MixBHfhO8hPt0jWa0SRQ6aR2K6X6096KlA8EiNzqaS7Gb5kb6aPV
 tyEV6ePkvAm+83AYrF7eAeXkO6mxK5XmKtHVf9e+NJt1ACWPd0zSio/3xa38h6J6xZey
 99K3dISAGMg001EZy4yBiUP0d93lzRopktEtdEaOfGGkRYpMx0VJwtQGcmkHSIf50ps3
 +1o72ylrhb1SRS42CmMi29+GljWV1nNGvOqAvsNZCVkwqK1i7R42GugMj2kdu11MZqrC
 H0TdRErzlRrW5bkLh3T74HRPnq7kGeGgvOtB3+DgyfGzAKjFFk+8nJQgoadGbIt9TPbM
 1RNA==
X-Gm-Message-State: AOAM532yakR8Cir6e0rQ7iuI87VpbvPwOnXjNFdS9TpRBGI5Jj+o5WcE
 xvJXe0es1r5fCihvoXsS8BakZgNGN9tqQNRcVs35cg==
X-Google-Smtp-Source: ABdhPJwW4KEp6S+mGGfS/0Lx+8OAYX5f6OO9aCFkx+hayuV7D2MQb1meuWL+LmKrJUAXW2513f7/HixYeilJ9rFPIxk=
X-Received: by 2002:aca:1906:: with SMTP id l6mr3220663oii.101.1611323702207; 
 Fri, 22 Jan 2021 05:55:02 -0800 (PST)
MIME-Version: 1.0
References: <20210120111240.2509679-1-kraxel@redhat.com>
 <20210120111240.2509679-3-kraxel@redhat.com>
 <a4187459-1dbd-e799-fba4-bf7021de831b@suse.de>
 <20210122133545.acloe4ytgp6r4iql@sirius.home.kraxel.org>
In-Reply-To: <20210122133545.acloe4ytgp6r4iql@sirius.home.kraxel.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 22 Jan 2021 14:54:51 +0100
Message-ID: <CAKMK7uHeQt6VPkm0ufuVVxdGQkmq3+1vrDERzZS54rtcVhJRAw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] drm/qxl: unpin release objects
To: Gerd Hoffmann <kraxel@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 22, 2021 at 2:35 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Fri, Jan 22, 2021 at 09:13:42AM +0100, Thomas Zimmermann wrote:
> > Hi
> >
> > Am 20.01.21 um 12:12 schrieb Gerd Hoffmann:
> > > Balances the qxl_create_bo(..., pinned=true, ...);
> > > call in qxl_release_bo_alloc().
> > >
> > > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > > ---
> > >   drivers/gpu/drm/qxl/qxl_release.c | 1 +
> > >   1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
> > > index 0fcfc952d5e9..add979cba11b 100644
> > > --- a/drivers/gpu/drm/qxl/qxl_release.c
> > > +++ b/drivers/gpu/drm/qxl/qxl_release.c
> > > @@ -166,6 +166,7 @@ qxl_release_free_list(struct qxl_release *release)
> > >             entry = container_of(release->bos.next,
> > >                                  struct qxl_bo_list, tv.head);
> > >             bo = to_qxl_bo(entry->tv.bo);
> > > +           bo->tbo.pin_count = 0; /* ttm_bo_unpin(&bo->tbo); */
> >
> > This code looks like a workaround or a bug.
> >
> > AFAICT the only place with pre-pinned BO is qdev->dumb_shadow_bo. Can you
> > remove the pinned flag entirely and handle pinning as part of
> > dumb_shadow_bo's code.
>
> No, the release objects are pinned too, and they must be
> pinned (qxl commands are in there, and references are
> placed in the qxl rings, so allowing them to roam is
> a non-starter).
>
> > if (pin_count)
> >     ttm_bo_unpin();
> > WARN_ON(pin_count); /* should always be 0 now */
>
> Well, the pin_count is 1 at this point.
> No need for the if().
>
> Just calling ttm_bo_unpin() here makes lockdep unhappy.

How does that one splat? But yeah if that's a problem should be
explained in the comment. I'd then also only do a pin_count--; to make
sure you can still catch other pin leaks if you have them. Setting it
to 0 kinda defeats the warning.
-Daniel

>
> Not calling ttm_bo_unpin() makes ttm_bo_release() throw
> a WARN() because of the pin.
>
> Clearing pin_count (which is how ttm fixes things up
> in the error path) works.
>
> I'm open to better ideas.
>
> take care,
>   Gerd
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
