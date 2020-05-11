Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F39D1CE5AB
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 22:36:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C2AC897E7;
	Mon, 11 May 2020 20:36:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C08218929C;
 Mon, 11 May 2020 20:36:20 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id r16so9192779edw.5;
 Mon, 11 May 2020 13:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1uYG9e4dVm6PWRoL8m/kIoqP3zhS97zMzITiZZkfVo8=;
 b=TsuiNVSyuVdgW/EOzGASz9Q20Ckfj8RkQ+7t6+K55MZvuz5looNlvY2UVaTiu4R7SX
 RSXam1aHMNhP1jHAnq5ySmGP9uVuKt9OMtP5D6/BBZk/0jDoDd27QodPfH2c8fdfqlB5
 k1k7ulQCJnd+duACVn752X2Q8GTSOF2nrvDlAJjbkn0vICeXl6yUbNBy5rgxzZaVDENS
 j6z+P5ADfDcau3xp6mHV0P9kN9eHCe1pbal8KmOjZ8/oHatHc8LOr3yslCouXWD5fC19
 DCrz26wwRFkxxuycZ2Vl77jnp3OEm/4hPwa0L9LOmIGQEsvJl+tS4TEl/Sn2NA/3S5dC
 8dBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1uYG9e4dVm6PWRoL8m/kIoqP3zhS97zMzITiZZkfVo8=;
 b=kQG+KM8g2wUHx9Bg+HhCJRa3J1IGmDhyeU5diVK0SewCBR7DqXkI03niMxw+4s/dWC
 1223psd1RX1VcAiwYQt4kS+7tMuX9BuovkP48JkxczXj07W6IjJzIYarcispkUEdYGCd
 15N9Onfl7pG5dS+OzG5jX0A4UUluGVdYCoDPR8WTZNPjryM1p/263t/f2RORFGG2Ni9l
 ZYfegFLXnPTws0dRt7CbL9jr35onDhgTREAe1xc78fHP/Z+WNO7Bk+DWjRrZWWEHSncD
 CMpUJm8yShmRwcPvjw2N70Sr6U/RNqZGut3UQKftELc++KRJncA2aJzZ5WwVOA+JejAQ
 O23A==
X-Gm-Message-State: AGi0PuYrHK92rxOoBvQeQIB+CrbEGGtpwoG1JGfrTckd7aJByaLCmXhH
 oe1i9bbzgsxwywNVj9D8puucPmEPnaOhbbMmyA7aT2qH
X-Google-Smtp-Source: APiQypJd2EfcwETUCT/8L023guh6ESXaqu8nohL13MgmMY+BO2wuzIUOXD9NKuPFyN2oza0kbWSA/6s1ReCwUv+XQNE=
X-Received: by 2002:a50:d7c7:: with SMTP id m7mr15478740edj.101.1589229379271; 
 Mon, 11 May 2020 13:36:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
 <20200511093554.211493-2-daniel.vetter@ffwll.ch>
 <CAF6AEGuy050MWGxHk48i2f4XqKuF-9q9+FD3N8z55s6sQ+CALQ@mail.gmail.com>
 <CAKMK7uEq1vPPB9AaXb-Me6FG_pwGdRwzu87jNGquHexDRHMowg@mail.gmail.com>
In-Reply-To: <CAKMK7uEq1vPPB9AaXb-Me6FG_pwGdRwzu87jNGquHexDRHMowg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 11 May 2020 13:36:38 -0700
Message-ID: <CAF6AEGuGH1-5mhtwfCC=pMe+DtLHGQxhfibJuMSDsDusMmeaEg@mail.gmail.com>
Subject: Re: [PATCH 1/9] drm/msm: Don't call dma_buf_vunmap without _vmap
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Sean Paul <sean@poorly.run>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 11, 2020 at 8:29 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> On Mon, May 11, 2020 at 5:24 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Mon, May 11, 2020 at 2:36 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > >
> > > I honestly don't exactly understand what's going on here, but the
> > > current code is wrong for sure: It calls dma_buf_vunmap without ever
> > > calling dma_buf_vmap.
> > >
> > > What I'm not sure about is whether the WARN_ON is correct:
> > > - msm imports dma-buf using drm_prime_sg_to_page_addr_arrays. Which is
> > >   a pretty neat layering violation of how you shouldn't peek behind
> > >   the curtain of the dma-buf exporter, but par for course. Note that
> > >   all the nice new helpers don't (and we should probably have a bit a
> > >   warning about this in the kerneldoc).
> > >
> > > - but then in the get_vaddr() in msm_gem.c, and that seems to happily
> > >   wrap a vmap() around any object with ->pages set (so including
> > >   imported dma-buf)
> > >
> > > - I'm not seeing any guarantees that userspace can't use an imported
> > >   dma-buf for e.g. MSM_SUBMIT_CMD_BUF in a5xx_submit_in_rb, so no
> > >   guarantees that an imported dma-buf won't end up with a ->vaddr set.
> >
> > fwiw, a5xx_submit_in_rb() isn't a "normal" path (build-time disabled
> > by default, and restricted to sudo).. it really only exists to
> > simplify poking at fw.
> >
> > There could be vmap's in the msm_gem_submit path, however.  If we
> > don't, we should probably just disallow using an imported dma-buf as
> > cmdstream.. I don't think there is any sane reason to permit that.  We
> > should probably also disallow get_vaddr() on imported buffers.
>
> Yeah if that's possible and won't blow up (I can't test) I think it'd
> be best. Something like
> if (bo->import_attach) return NULL; should do the trick I think.
> Should I type that up as v2 of this?

Sure.  It should probably be something like

  if (obj->import_attach)
    return ERR_PTR(-ESOMETHING)

looks like the gem-submit path handles an IS_ERR() return

BR,
-R


> -Daniel
>
> >
> > BR,
> > -R
> >
> > >
> > > But even if that WARN_ON is wrong, cleaning up a vmap() done by msm by
> > > calling dma_buf_vmap is the wrong thing to do.
> > >
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > Cc: Rob Clark <robdclark@gmail.com>
> > > Cc: Sean Paul <sean@poorly.run>
> > > Cc: linux-arm-msm@vger.kernel.org
> > > Cc: freedreno@lists.freedesktop.org
> > > ---
> > >  drivers/gpu/drm/msm/msm_gem.c | 3 +--
> > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> > > index 5a6a79fbc9d6..3305a457960e 100644
> > > --- a/drivers/gpu/drm/msm/msm_gem.c
> > > +++ b/drivers/gpu/drm/msm/msm_gem.c
> > > @@ -907,8 +907,7 @@ static void free_object(struct msm_gem_object *msm_obj)
> > >         put_iova(obj);
> > >
> > >         if (obj->import_attach) {
> > > -               if (msm_obj->vaddr)
> > > -                       dma_buf_vunmap(obj->import_attach->dmabuf, msm_obj->vaddr);
> > > +               WARN_ON(msm_obj->vaddr);
> > >
> > >                 /* Don't drop the pages for imported dmabuf, as they are not
> > >                  * ours, just free the array we allocated:
> > > --
> > > 2.26.2
> > >
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
