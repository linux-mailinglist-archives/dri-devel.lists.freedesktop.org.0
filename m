Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D961CDEF9
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 17:29:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0F389AB7;
	Mon, 11 May 2020 15:29:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0640689AB7
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 15:29:08 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id j16so15397469oih.10
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 08:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jr8BqxYa5N2UQFIWCH+ZeFGjIUjI6K0QpaYQti5dmF0=;
 b=Lg++tOm6IwiIzgdNtd59XFNZ5Rmlo64vDv1d4OxItcq8FR+s48C8JwmCXbAKorjZ6J
 YMSEEwHXoSig7JadxHN8PtMZuZemoD+1KjSnSKqfgM2CBbOHJslVSimDSF7trCKxPCQU
 IZR0vJPAXGKhAKd75Zi+m8C4aIcjuV9t7jzbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jr8BqxYa5N2UQFIWCH+ZeFGjIUjI6K0QpaYQti5dmF0=;
 b=WLrQmOYXFEp7SzAib7En2LUkS9CSpweGULKvSW7sZHK+cHpinZ88C3b6z8ipAnh5Lt
 CIRVt8l+Ty8gur16CHaRv2AjsqfBAqGHTXn67VHzIZwzRP3dDcC/VexLE84OPWVUCkof
 HFDwhNC1kZdVRG6sLYQc5kTWGimN/L5RjmUN9GRan07S58mK/JMu5JGhLxBT0ekDX4X3
 FYxxyQTt9ZtCt7SbwOxCNR84j2dU/gGc7TvPUfaq0fPDTiHdXCbOlQ11KLkio2UsuDym
 LUzBqhb2ZfG2IHIc96tt9BIQ7hzp3Jgl1maJ5153J+P1Yfh1ZkXyA+wVy60Yvqmo3PsO
 6dCQ==
X-Gm-Message-State: AGi0PuYjOSC+tguL98ruMlVqSHSVA07armwghd2mjadP25SnyXvzdx5u
 GnL+p1E8yV9ASFooV9yjm/O+4K2KacR3PD1w4IuVjQ==
X-Google-Smtp-Source: APiQypKoTHn0cJuzKGjhu51d/sGUsrkJZ4SrSZew0vSiBm3gQMc/ep2bCh/uj8x3VtDMZyNngfdYdPlUlBeH3a6m4Zs=
X-Received: by 2002:aca:2113:: with SMTP id 19mr11528686oiz.128.1589210947246; 
 Mon, 11 May 2020 08:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
 <20200511093554.211493-2-daniel.vetter@ffwll.ch>
 <CAF6AEGuy050MWGxHk48i2f4XqKuF-9q9+FD3N8z55s6sQ+CALQ@mail.gmail.com>
In-Reply-To: <CAF6AEGuy050MWGxHk48i2f4XqKuF-9q9+FD3N8z55s6sQ+CALQ@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 11 May 2020 17:28:56 +0200
Message-ID: <CAKMK7uEq1vPPB9AaXb-Me6FG_pwGdRwzu87jNGquHexDRHMowg@mail.gmail.com>
Subject: Re: [PATCH 1/9] drm/msm: Don't call dma_buf_vunmap without _vmap
To: Rob Clark <robdclark@gmail.com>
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

On Mon, May 11, 2020 at 5:24 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Mon, May 11, 2020 at 2:36 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > I honestly don't exactly understand what's going on here, but the
> > current code is wrong for sure: It calls dma_buf_vunmap without ever
> > calling dma_buf_vmap.
> >
> > What I'm not sure about is whether the WARN_ON is correct:
> > - msm imports dma-buf using drm_prime_sg_to_page_addr_arrays. Which is
> >   a pretty neat layering violation of how you shouldn't peek behind
> >   the curtain of the dma-buf exporter, but par for course. Note that
> >   all the nice new helpers don't (and we should probably have a bit a
> >   warning about this in the kerneldoc).
> >
> > - but then in the get_vaddr() in msm_gem.c, and that seems to happily
> >   wrap a vmap() around any object with ->pages set (so including
> >   imported dma-buf)
> >
> > - I'm not seeing any guarantees that userspace can't use an imported
> >   dma-buf for e.g. MSM_SUBMIT_CMD_BUF in a5xx_submit_in_rb, so no
> >   guarantees that an imported dma-buf won't end up with a ->vaddr set.
>
> fwiw, a5xx_submit_in_rb() isn't a "normal" path (build-time disabled
> by default, and restricted to sudo).. it really only exists to
> simplify poking at fw.
>
> There could be vmap's in the msm_gem_submit path, however.  If we
> don't, we should probably just disallow using an imported dma-buf as
> cmdstream.. I don't think there is any sane reason to permit that.  We
> should probably also disallow get_vaddr() on imported buffers.

Yeah if that's possible and won't blow up (I can't test) I think it'd
be best. Something like
if (bo->import_attach) return NULL; should do the trick I think.
Should I type that up as v2 of this?
-Daniel

>
> BR,
> -R
>
> >
> > But even if that WARN_ON is wrong, cleaning up a vmap() done by msm by
> > calling dma_buf_vmap is the wrong thing to do.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: freedreno@lists.freedesktop.org
> > ---
> >  drivers/gpu/drm/msm/msm_gem.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> > index 5a6a79fbc9d6..3305a457960e 100644
> > --- a/drivers/gpu/drm/msm/msm_gem.c
> > +++ b/drivers/gpu/drm/msm/msm_gem.c
> > @@ -907,8 +907,7 @@ static void free_object(struct msm_gem_object *msm_obj)
> >         put_iova(obj);
> >
> >         if (obj->import_attach) {
> > -               if (msm_obj->vaddr)
> > -                       dma_buf_vunmap(obj->import_attach->dmabuf, msm_obj->vaddr);
> > +               WARN_ON(msm_obj->vaddr);
> >
> >                 /* Don't drop the pages for imported dmabuf, as they are not
> >                  * ours, just free the array we allocated:
> > --
> > 2.26.2
> >



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
