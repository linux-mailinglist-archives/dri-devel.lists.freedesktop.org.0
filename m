Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB3F27C0E3
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 11:19:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFA7891D9;
	Tue, 29 Sep 2020 09:19:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D86EB8902A
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 09:19:10 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id x14so4477763wrl.12
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 02:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=gXWaqDwdRvGiXmjumOvJQFS33RJ0J8YLLRBxnJq7s/Y=;
 b=FvLKXuRiCNStJIp1DDYoJEMe5btBGCxlvTy51k8ZvbhCN+6Kk+JOkX3UskyGjQLVtw
 vsQkynLq/P4P/XRTl8U846VTMfuJsGO6/2Oqfan0aMk8OH9FimvmKwcD8QjwpfQMIZ/+
 8dZkcL/BH0sNpTqeakk5KKUBLVSfRJn/qcJCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=gXWaqDwdRvGiXmjumOvJQFS33RJ0J8YLLRBxnJq7s/Y=;
 b=iMpcf5GGjLP/EcvKPEammiqGKf5LtA46dSxDpr3FDOtH968dLucJwkm6bpjyEBoJUg
 kWUaaFEro+xRueu4RSJQkQexNGpS9GWxuW4zNO+YwtgRC/2jsCRb0YsdsJl+eRSp2+Bu
 Hd0mkoF60wZZrAEzIdm2VQkw0VVzNHoqVSORlI82sG/zXxGgfOFpbOzRv781/q2JTUai
 cBU5kxzScQKcgZS4/dk/IlharoSC1K1hfRgSG7rqH/PHpg/rm+MBlzhONVrxhi5yLO5X
 /6Hdukx+WaMeepKuNMwqhanhqu62325sbbQhx/vrPE7WDLawiKOshfWcghWR/m1ds5fP
 P6tw==
X-Gm-Message-State: AOAM531sRilBeQXrkzXhjkcoP3i18OBVaO9njftnjBgf3gURaH8Z512d
 7cz8XE60EqyZ2L71DYoPE46HWA==
X-Google-Smtp-Source: ABdhPJyXAq+ZnLM2ARlkyd7CvW2H8BnXgD7/W/qLzge8/qnQ59ICxh/FQ9lWd1niVr7XHDfomLIM9A==
X-Received: by 2002:adf:de11:: with SMTP id b17mr3127536wrm.82.1601371149386; 
 Tue, 29 Sep 2020 02:19:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y68sm4776202wmd.39.2020.09.29.02.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 02:19:08 -0700 (PDT)
Date: Tue, 29 Sep 2020 11:19:06 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/9] drm/format-helper: Pass destination pitch to
 drm_fb_memcpy_dstclip()
Message-ID: <20200929091906.GJ438822@phenom.ffwll.local>
References: <20200625120011.16168-1-tzimmermann@suse.de>
 <20200625120011.16168-2-tzimmermann@suse.de>
 <20200629084044.GL3278063@phenom.ffwll.local>
 <89cff54c-789f-02fd-4939-35956b51cb56@suse.de>
 <CAKMK7uESYkP4Fa9mrN5dxT1bDxkHxhHkBF4FbosiOiyMzYJ=Bg@mail.gmail.com>
 <35822c4b-7821-7b33-d6ce-cfe51a85ff74@suse.de>
 <CAKMK7uGem0wKdmRwmk-ztNZbVW6UFmnPkXWSxicRG1S+8VszbA@mail.gmail.com>
 <a4cd3180-b21d-7464-ad63-5b616acf2c7a@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a4cd3180-b21d-7464-ad63-5b616acf2c7a@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Dave Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 28, 2020 at 11:13:06AM +0200, Thomas Zimmermann wrote:
> Hi
> =

> Am 28.09.20 um 10:53 schrieb Daniel Vetter:
> > On Mon, Sep 28, 2020 at 9:22 AM Thomas Zimmermann <tzimmermann@suse.de>=
 wrote:
> >>
> >> Hi
> >>
> >> Am 26.09.20 um 18:42 schrieb Daniel Vetter:
> >>> On Fri, Sep 25, 2020 at 4:55 PM Thomas Zimmermann <tzimmermann@suse.d=
e> wrote:
> >>>>
> >>>> Hi
> >>>>
> >>>> Am 29.06.20 um 10:40 schrieb Daniel Vetter:
> >>>>> On Thu, Jun 25, 2020 at 02:00:03PM +0200, Thomas Zimmermann wrote:
> >>>>>> The memcpy's destination buffer might have a different pitch than =
the
> >>>>>> source. Support different pitches as function argument.
> >>>>>>
> >>>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>>>>
> >>>>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >>>>>
> >>>>> But I do have questions ... why did we allocate a source drm_frameb=
uffer
> >>>>> with mismatching pitch? That sounds backwards, especially for simpl=
ekms.
> >>>>
> >>>> There's userspace that allocates framebuffers in tiles of 64x64 pixe=
ls.
> >>>> I think I've seen this with Gnome. So if you have a 800x600 display
> >>>> mode, the allocated framebuffer has a scanline pitch of 832 pixels a=
nd
> >>>> the final 32 pixels are ignored.
> >>>
> >>> At least with dumb buffer allocation ioctls userspace should not do
> >>> that. If it wants 800x600, it needs to allocate 800x600, not something
> >>
> >> That ship has sailed.
> > =

> > Not really, right now that ship is simply leaking and sinking. If we
> > decide to patch this up from the kernel side, then indeed it has
> > sailed. And I'm not sure that's a good idea.
> =

> We have code in at least cirrus, ast and mgag200 to support this. And
> userspace has been behaving like this since at least when I got involved
> (2017).

Hm where do these drivers copy stuff around and rematch the stride?

> >>> else. The driver is supposed to apply any rounding necessary for the
> >>> size. Or is this a buffer allocated somewhere else and then shared?
> >>
> >> I don't quite remember where exactly this was implemented. It was not a
> >> shared buffer, though. IIRC the buffer allocation code in one of the
> >> libs rounded the size towards multiples of 64. I remember thinking that
> >> it was probably done for tiled rendering.
> > =

> > Yeah, but you don't do rendering on dumb buffers. Like ever. So this
> > smells like a userspace bug.
> =

> It's also part of the software rendering. It is not a bug, but
> implemented deliberately in one of the userspace components that
> allocates framebuffers (but I cannot remember which one.)

I think it would be good to document this.

We already fake xrgb8888 everywhere because userspace is not flexible
enough, I guess having to fake 64b stride support everywhere isn't that
much worse.

But it's definitely not great either :-/
-Daniel

> =

> Best regards
> Thomas
> =

> > =

> > If it's for shared buffers then I think that sounds more reasonable.
> > -Daniel
> > =

> >>
> >> Best regards
> >> Thomas
> >>
> >>> -Daniel
> >>>
> >>>> In regular drivers, we can handle this with the VGA offset register =
[1]
> >>>> or some equivalent. That's obviously not an option with simplekms, so
> >>>> the different pitch is required.
> >>>>
> >>>> Best regards
> >>>> Thomas
> >>>>
> >>>> [1]
> >>>> https://web.stanford.edu/class/cs140/projects/pintos/specs/freevga/v=
ga/crtcreg.htm#13
> >>>>
> >>>>>
> >>>>> Would be good to add the reasons why we need this to the commit mes=
sage,
> >>>>> I'm sure I'll discover it later on eventually.
> >>>>> -Daniel
> >>>>>
> >>>>>> ---
> >>>>>>  drivers/gpu/drm/drm_format_helper.c    | 9 +++++----
> >>>>>>  drivers/gpu/drm/mgag200/mgag200_mode.c | 2 +-
> >>>>>>  drivers/gpu/drm/tiny/cirrus.c          | 2 +-
> >>>>>>  include/drm/drm_format_helper.h        | 2 +-
> >>>>>>  4 files changed, 8 insertions(+), 7 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm=
/drm_format_helper.c
> >>>>>> index c043ca364c86..8d5a683afea7 100644
> >>>>>> --- a/drivers/gpu/drm/drm_format_helper.c
> >>>>>> +++ b/drivers/gpu/drm/drm_format_helper.c
> >>>>>> @@ -52,6 +52,7 @@ EXPORT_SYMBOL(drm_fb_memcpy);
> >>>>>>  /**
> >>>>>>   * drm_fb_memcpy_dstclip - Copy clip buffer
> >>>>>>   * @dst: Destination buffer (iomem)
> >>>>>> + * @dst_pitch: Number of bytes between two consecutive scanlines =
within dst
> >>>>>>   * @vaddr: Source buffer
> >>>>>>   * @fb: DRM framebuffer
> >>>>>>   * @clip: Clip rectangle area to copy
> >>>>>> @@ -59,12 +60,12 @@ EXPORT_SYMBOL(drm_fb_memcpy);
> >>>>>>   * This function applies clipping on dst, i.e. the destination is=
 a
> >>>>>>   * full (iomem) framebuffer but only the clip rect content is cop=
ied over.
> >>>>>>   */
> >>>>>> -void drm_fb_memcpy_dstclip(void __iomem *dst, void *vaddr,
> >>>>>> -                       struct drm_framebuffer *fb,
> >>>>>> +void drm_fb_memcpy_dstclip(void __iomem *dst, unsigned int dst_pi=
tch,
> >>>>>> +                       void *vaddr, struct drm_framebuffer *fb,
> >>>>>>                         struct drm_rect *clip)
> >>>>>>  {
> >>>>>>      unsigned int cpp =3D fb->format->cpp[0];
> >>>>>> -    unsigned int offset =3D clip_offset(clip, fb->pitches[0], cpp=
);
> >>>>>> +    unsigned int offset =3D clip_offset(clip, dst_pitch, cpp);
> >>>>>>      size_t len =3D (clip->x2 - clip->x1) * cpp;
> >>>>>>      unsigned int y, lines =3D clip->y2 - clip->y1;
> >>>>>>
> >>>>>> @@ -73,7 +74,7 @@ void drm_fb_memcpy_dstclip(void __iomem *dst, vo=
id *vaddr,
> >>>>>>      for (y =3D 0; y < lines; y++) {
> >>>>>>              memcpy_toio(dst, vaddr, len);
> >>>>>>              vaddr +=3D fb->pitches[0];
> >>>>>> -            dst +=3D fb->pitches[0];
> >>>>>> +            dst +=3D dst_pitch;
> >>>>>>      }
> >>>>>>  }
> >>>>>>  EXPORT_SYMBOL(drm_fb_memcpy_dstclip);
> >>>>>> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/=
drm/mgag200/mgag200_mode.c
> >>>>>> index f16bd278ab7e..7d4f3a62d885 100644
> >>>>>> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> >>>>>> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> >>>>>> @@ -1586,7 +1586,7 @@ mgag200_handle_damage(struct mga_device *mde=
v, struct drm_framebuffer *fb,
> >>>>>>      if (drm_WARN_ON(dev, !vmap))
> >>>>>>              return; /* BUG: SHMEM BO should always be vmapped */
> >>>>>>
> >>>>>> -    drm_fb_memcpy_dstclip(mdev->vram, vmap, fb, clip);
> >>>>>> +    drm_fb_memcpy_dstclip(mdev->vram, fb->pitches[0], vmap, fb, c=
lip);
> >>>>>>
> >>>>>>      drm_gem_shmem_vunmap(fb->obj[0], vmap);
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/=
cirrus.c
> >>>>>> index 744a8e337e41..2dd9e5e31e3d 100644
> >>>>>> --- a/drivers/gpu/drm/tiny/cirrus.c
> >>>>>> +++ b/drivers/gpu/drm/tiny/cirrus.c
> >>>>>> @@ -327,7 +327,7 @@ static int cirrus_fb_blit_rect(struct drm_fram=
ebuffer *fb,
> >>>>>>              goto out_dev_exit;
> >>>>>>
> >>>>>>      if (cirrus->cpp =3D=3D fb->format->cpp[0])
> >>>>>> -            drm_fb_memcpy_dstclip(cirrus->vram,
> >>>>>> +            drm_fb_memcpy_dstclip(cirrus->vram, fb->pitches[0],
> >>>>>>                                    vmap, fb, rect);
> >>>>>>
> >>>>>>      else if (fb->format->cpp[0] =3D=3D 4 && cirrus->cpp =3D=3D 2)
> >>>>>> diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_for=
mat_helper.h
> >>>>>> index 5f9e37032468..2b5036a5fbe7 100644
> >>>>>> --- a/include/drm/drm_format_helper.h
> >>>>>> +++ b/include/drm/drm_format_helper.h
> >>>>>> @@ -11,7 +11,7 @@ struct drm_rect;
> >>>>>>
> >>>>>>  void drm_fb_memcpy(void *dst, void *vaddr, struct drm_framebuffer=
 *fb,
> >>>>>>                 struct drm_rect *clip);
> >>>>>> -void drm_fb_memcpy_dstclip(void __iomem *dst, void *vaddr,
> >>>>>> +void drm_fb_memcpy_dstclip(void __iomem *dst, unsigned int dst_pi=
tch, void *vaddr,
> >>>>>>                         struct drm_framebuffer *fb,
> >>>>>>                         struct drm_rect *clip);
> >>>>>>  void drm_fb_swab(void *dst, void *src, struct drm_framebuffer *fb,
> >>>>>> --
> >>>>>> 2.27.0
> >>>>>>
> >>>>>
> >>>>
> >>>> --
> >>>> Thomas Zimmermann
> >>>> Graphics Driver Developer
> >>>> SUSE Software Solutions Germany GmbH
> >>>> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> >>>> (HRB 36809, AG N=FCrnberg)
> >>>> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> >>>>
> >>>
> >>>
> >>
> >> --
> >> Thomas Zimmermann
> >> Graphics Driver Developer
> >> SUSE Software Solutions Germany GmbH
> >> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> >> (HRB 36809, AG N=FCrnberg)
> >> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> >>
> > =

> > =

> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> =





-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
