Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CF32CDB68
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 17:39:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA776EB73;
	Thu,  3 Dec 2020 16:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28746EB73
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 16:39:37 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id l4so2819501oii.4
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Dec 2020 08:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=77vctl4dWxdrgEMXlMd4GIgDppT00p1Hbkr925ijqBE=;
 b=cTn668FDRvyHPw5XUB+ZeX0rZERlVKTGHjtXGWeI8Q37CBpJlJU7B//c2JCVW2jKUr
 zP7yukOue5qQt/AaIQBw0mxHPci+UUblty6yGjuQ3HTfOK2elDOsLtZneywmm4PVrEyJ
 Ie53BmAr5LFr8uHgFcumPbQ5X4kuRzAT6KxZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=77vctl4dWxdrgEMXlMd4GIgDppT00p1Hbkr925ijqBE=;
 b=MFXdVNf9c/ykXp9JSwIZaQpvW4NMX4j7qP+Mejp71ZqTr7s9vK8c4yozp3WMsPKCHR
 9jnPP/qVjlinEqLM6b6ffR1HyZTAQCzEhS1Dj8YCd3BCreWasi3w6bb3E5/LMOxbpKdF
 Re0ajhKhBUNlGmQ8+25fWgJUCaDEqmscSx72QlYoOArN+yFhbAwuP1M5w0YqYqvhO4Zh
 SIXVeML7hsPQNw6KsiiwDnlssJcvrXkK1YvnRGBQumqe6OSSjM9WnK0UKvTZdnL/AGnL
 DRRsOW+OSJngK/KHqY1vf2/D/tSrnvX1XnbWREf8oSG7oKGjCba660jCUJDCr/orPUVP
 cGiA==
X-Gm-Message-State: AOAM531SD/Yn+v5rTLngrq8vxM+84UyeZyJyRFzQT++jHeJHVomegdgT
 0JkplzEcjflS3zw+xIJkxPL4oZ16+q6pK+5ekAT9Qg==
X-Google-Smtp-Source: ABdhPJx1vxrvYOB+icZnIcSfpB5MlI5l8ra5SPaX6r27Su/2FSepiwln9iKH+6uHQm3VowvObDnQF95MjTdDlG/uRm0=
X-Received: by 2002:aca:47cf:: with SMTP id u198mr3548oia.14.1607013576964;
 Thu, 03 Dec 2020 08:39:36 -0800 (PST)
MIME-Version: 1.0
References: <20201203144248.418281-1-hslester96@gmail.com>
 <e6ebb634-4cb5-34d4-c661-4cebbe2fdbf1@axentia.se>
In-Reply-To: <e6ebb634-4cb5-34d4-c661-4cebbe2fdbf1@axentia.se>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 3 Dec 2020 17:39:25 +0100
Message-ID: <CAKMK7uE3Mr2aOEvdnVrQWE=xc-8OQ1vkv9MdURaMVPHXKF5jwQ@mail.gmail.com>
Subject: Re: [PATCH] drm/fb-helper: Add missed unlocks in setcmap_legacy()
To: Peter Rosin <peda@axentia.se>
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
Cc: David Airlie <airlied@linux.ie>, Chuhong Yuan <hslester96@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 3, 2020 at 5:11 PM Peter Rosin <peda@axentia.se> wrote:
>
> Hi!
>
> On 2020-12-03 15:42, Chuhong Yuan wrote:
> > setcmap_legacy() does not call drm_modeset_unlock_all() in some exits,
> > add the missed unlocks with goto to fix it.
> >
> > Fixes: 964c60063bff ("drm/fb-helper: separate the fb_setcmap helper into atomic and legacy paths")
> > Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
>
> Yup, my patch fumbled the locking. Sorry, and thanks for cleaning up my mess!
>
> Acked-by: Peter Rosin <peda@axentia.se>
>
> (Spelled that as Ached-by at first, what does that mean??)

Merged already before I've seen your ack here (and we don't rebase so
can't add it now), thanks for the patch and all.
-Daniel

>
> Cheers,
> Peter
>
> > ---
> >  drivers/gpu/drm/drm_fb_helper.c | 15 ++++++++++-----
> >  1 file changed, 10 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> > index 1543d9d10970..8033467db4be 100644
> > --- a/drivers/gpu/drm/drm_fb_helper.c
> > +++ b/drivers/gpu/drm/drm_fb_helper.c
> > @@ -923,11 +923,15 @@ static int setcmap_legacy(struct fb_cmap *cmap, struct fb_info *info)
> >       drm_modeset_lock_all(fb_helper->dev);
> >       drm_client_for_each_modeset(modeset, &fb_helper->client) {
> >               crtc = modeset->crtc;
> > -             if (!crtc->funcs->gamma_set || !crtc->gamma_size)
> > -                     return -EINVAL;
> > +             if (!crtc->funcs->gamma_set || !crtc->gamma_size) {
> > +                     ret = -EINVAL;
> > +                     goto out;
> > +             }
> >
> > -             if (cmap->start + cmap->len > crtc->gamma_size)
> > -                     return -EINVAL;
> > +             if (cmap->start + cmap->len > crtc->gamma_size) {
> > +                     ret = -EINVAL;
> > +                     goto out;
> > +             }
> >
> >               r = crtc->gamma_store;
> >               g = r + crtc->gamma_size;
> > @@ -940,8 +944,9 @@ static int setcmap_legacy(struct fb_cmap *cmap, struct fb_info *info)
> >               ret = crtc->funcs->gamma_set(crtc, r, g, b,
> >                                            crtc->gamma_size, NULL);
> >               if (ret)
> > -                     return ret;
> > +                     goto out;
> >       }
> > +out:
> >       drm_modeset_unlock_all(fb_helper->dev);
> >
> >       return ret;
> >



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
