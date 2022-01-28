Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C74A649F7C1
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 12:00:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88E1310E3A9;
	Fri, 28 Jan 2022 11:00:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8CA610E3A9
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 11:00:19 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 b12-20020a9d754c000000b0059eb935359eso5333796otl.8
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 03:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UlPx1lEarrQzCcaxJ9EoW5u1BqEraae+FnfdtBIs2ss=;
 b=N0brl5QY0Ij2PY3K/ex8hfYchybC5x80fjwgZKlL4gda7IVeaRi6kZDrf9ScVnvl/2
 BRtpuQo78G/tj75IjBO+JB+nvOOi7lPxj2FtW9XTya/D3B4P+W7j773pfmL8X6kzT4ok
 JatE0TBZl+kULCCANP9Zvjy4rt2qZt0IQAfCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UlPx1lEarrQzCcaxJ9EoW5u1BqEraae+FnfdtBIs2ss=;
 b=Hg9vA4KGW07/TW1mF9yXqZD59LPbW+vLYptE+l2l3k0lYnCTRPb2X3CYmafRQBPZTM
 9DuvkOtxnDjx5s4NlCo6ivx1QfRLhw3xWstvaRyvKB7aiv4uMxrRZ2VSWvOpRRM/8rsp
 KzzS1pDFxXAKU+ttSH+unFHF/6xIxLicbC/Y4JCQmft8nrxe+xtKWPePVx5scaUSR0mq
 iePW84gMc136L/q+gEGyRWErzZIig9aOFZ/jPYtiCxhnkFvlibfu2KoaP6sqgVnQVBHx
 yYfu/vdymQmvk9SgvdXrXZbo3vFOgqr2vSf3E7ijIqfQqw+f0vmqd9dqH7blS0C8aLGX
 3oHg==
X-Gm-Message-State: AOAM5317kkwaApn7LKgm0ewKJWDmWEjyh9knfAzBOwRShftSiVzmoE3m
 V9SD+ZXundRT50YWJDHyb8kB7zp0Qwnm45siFsMzwg==
X-Google-Smtp-Source: ABdhPJwRhnt6KfEtnemI/YKboxOW8VILMR2vXl+yHfoclQHK3THQCmmQKqrBbLovkb9SLbSgbRwaPaWfrLPpwCGpSrc=
X-Received: by 2002:a05:6830:2b25:: with SMTP id
 l37mr4351493otv.323.1643367618909; 
 Fri, 28 Jan 2022 03:00:18 -0800 (PST)
MIME-Version: 1.0
References: <20220127102621.30047-1-tzimmermann@suse.de>
 <YfKFP2DW/g6tXLQw@phenom.ffwll.local>
 <b3c508df-53ee-7fcd-2cdb-297d603a5f96@suse.de>
 <YfK0N21rJ69rclJE@phenom.ffwll.local>
 <b59ac6ae-f080-0a22-3ad6-e0de65ebf621@suse.de>
In-Reply-To: <b59ac6ae-f080-0a22-3ad6-e0de65ebf621@suse.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 28 Jan 2022 12:00:07 +0100
Message-ID: <CAKMK7uFNXooNYnrJ6-_nRh5jrOQrAdocUe88eT_fVRPg=svMSg@mail.gmail.com>
Subject: Re: [PATCH] drm/fb-helper: Mark screen buffers in system memory with
 FB_VIRTFB
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 27, 2022 at 4:18 PM Thomas Zimmermann <tzimmermann@suse.de> wro=
te:
>
> Hi
>
> Am 27.01.22 um 16:03 schrieb Daniel Vetter:
> > On Thu, Jan 27, 2022 at 12:58:30PM +0100, Thomas Zimmermann wrote:
> >> Hi
> >>
> >> Am 27.01.22 um 12:42 schrieb Daniel Vetter:
> >>> On Thu, Jan 27, 2022 at 11:26:21AM +0100, Thomas Zimmermann wrote:
> >>>> Mark screen buffers in system memory with FB_VIRTFB. Otherwise, the
> >>>> buffers are mmap'ed as I/O memory (i.e., VM_IO). For shadow buffers,
> >>>> also set the FB_READS_FAST hint.
> >>>
> >>> Maybe clarify that this only holds for the defio case, and since we h=
ave
> >>> our own shadow copy for that anyway it shouldn't matter. I'm also not=
 sure
> >>> how much the memcpy gains us compared to just redrawing ...
> >>>
> >>> What's the motivation here, or just something you spotted?
> >>
> >> Correctness mostly. fbdev's fbdefio tests for (the absence of) this fl=
ag and
> >> sets VM_IO accordingly.
> >>
> >> It's actually for userspace. Maybe userspace tests these flags as well=
 and
> >> can optimize memcpy pattern for different types of caching. But I woul=
dn't
> >> expect it TBH.
> >
> > Hm I thought so too, but the #define is in the internal header, not the
> > uapi header. And I don't see any ioctl code in fbmem.c that would shove
> > fb_info->flags to userspace. That's why I wondered why you care about
> > this? Or did I miss something somewhere?
>
> You didn't.  I just grepped it myself and the only user of VIRTFB is the
> mmap code in fb_deferio.c, which (not) sets VM_IO. READS_FAST is unused.
> I'd then set the former, but not the latter. Ok?

Well READS_FAST might become used again, if/when the accel code is
back. So I'd more keep that part, and leave the VIRTFB one alone,
since you never set that for the defio case. I'm also not sure how
that even works, since defio relies on struct page being present
underneath, and you defo don't have struct page for VM_IO cases. So it
all looks rather fishy. Or I'm still massively misunderstanding it
all?
-Daniel

>
> Best regards
> Thomas
>
> > -Daniel
> >
> >>
> >> Best regards
> >> Thomas
> >>
> >>> -Daniel
> >>>
> >>>>
> >>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>>> ---
> >>>>    drivers/gpu/drm/drm_fb_helper.c | 9 ++++++---
> >>>>    1 file changed, 6 insertions(+), 3 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_f=
b_helper.c
> >>>> index ed43b987d306..f15127a32f7a 100644
> >>>> --- a/drivers/gpu/drm/drm_fb_helper.c
> >>>> +++ b/drivers/gpu/drm/drm_fb_helper.c
> >>>> @@ -2346,6 +2346,7 @@ static int drm_fb_helper_generic_probe(struct =
drm_fb_helper *fb_helper,
> >>>>            fbi->fbops =3D &drm_fbdev_fb_ops;
> >>>>            fbi->screen_size =3D sizes->surface_height * fb->pitches[=
0];
> >>>>            fbi->fix.smem_len =3D fbi->screen_size;
> >>>> +  fbi->flags =3D FBINFO_DEFAULT;
> >>>>            drm_fb_helper_fill_info(fbi, fb_helper, sizes);
> >>>> @@ -2353,19 +2354,21 @@ static int drm_fb_helper_generic_probe(struc=
t drm_fb_helper *fb_helper,
> >>>>                    fbi->screen_buffer =3D vzalloc(fbi->screen_size);
> >>>>                    if (!fbi->screen_buffer)
> >>>>                            return -ENOMEM;
> >>>> +          fbi->flags |=3D FBINFO_VIRTFB | FBINFO_READS_FAST;
> >>>>                    fbi->fbdefio =3D &drm_fbdev_defio;
> >>>> -
> >>>>                    fb_deferred_io_init(fbi);
> >>>>            } else {
> >>>>                    /* buffer is mapped for HW framebuffer */
> >>>>                    ret =3D drm_client_buffer_vmap(fb_helper->buffer,=
 &map);
> >>>>                    if (ret)
> >>>>                            return ret;
> >>>> -          if (map.is_iomem)
> >>>> +          if (map.is_iomem) {
> >>>>                            fbi->screen_base =3D map.vaddr_iomem;
> >>>> -          else
> >>>> +          } else {
> >>>>                            fbi->screen_buffer =3D map.vaddr;
> >>>> +                  fbi->flags |=3D FBINFO_VIRTFB;
> >>>> +          }
> >>>>                    /*
> >>>>                     * Shamelessly leak the physical address to user-=
space. As
> >>>> --
> >>>> 2.34.1
> >>>>
> >>>
> >>
> >> --
> >> Thomas Zimmermann
> >> Graphics Driver Developer
> >> SUSE Software Solutions Germany GmbH
> >> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> >> (HRB 36809, AG N=C3=BCrnberg)
> >> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
> >
> >
> >
> >
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
