Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 244F327C52C
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 13:32:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A12DC6E19C;
	Tue, 29 Sep 2020 11:32:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D62956E19C
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 11:32:41 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id d4so4254193wmd.5
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 04:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=tGMJ7GVkeAFWhwklNX8q4MMO9DEZLUfLqlWZ+es11OI=;
 b=J6vmhf+oXvvhuxEPn8uDOf52JTTGLK/xOZdafejtYf7iREXsavi3JjwCxoe+UVBN2Q
 Dpcuomw6toqs2/vuufkqlCpaWFO9TFwCvEqELkIjnGA/MDxxcIZDyqT2Gjgv4Ts41nuC
 1A6l8iZc0h+A+2Qn+Z5YU22EogfRwtDlk/wek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=tGMJ7GVkeAFWhwklNX8q4MMO9DEZLUfLqlWZ+es11OI=;
 b=qLXRU51nKGjWzDy+vari4OyLglaXErFIdOKIe79BSvPtY6Ig3tD0XFhjuX6n2fKi3V
 ZLgtRJ+STSLwvJ7GaBq0NwJspckOqWN5521ayXN65dd7I+o36DzgyI3HATt08yeBs694
 M8czmvfJnCynbg1GURT5MfRmwxKryYBb7okEVhUUHyrWNyJdDASyN96/bGPrOtfUDM2X
 0wwUoZVxg5VHlvCFzP1I5G0sfBf1Z+CScflk/cxgOYSgj9ZR5RGIYm7Cn3MetS5HfjMy
 JHeYfKJ6fda3yrzuDSvTjFyPb90KOAitK9V27tL+06dKHdhEa+PPKV+hOdSEB6iehv/1
 WN9w==
X-Gm-Message-State: AOAM531mFywYCKc/ewSDMzKrKRrY/mu7eRZ/+YkOKmAJmrHQRKn/wCqa
 bpEpT43nPJoTUCL9Tu8IrP5GGA==
X-Google-Smtp-Source: ABdhPJy3iK0lSS5BZxQhS1aK4W49kdpy1pX30hl9WQLKR2yaMBqSZY+SJF+BmVWYUcCk5nN4bEiIQg==
X-Received: by 2002:a1c:59c3:: with SMTP id n186mr4140832wmb.32.1601379160369; 
 Tue, 29 Sep 2020 04:32:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a83sm4943839wmh.48.2020.09.29.04.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 04:32:39 -0700 (PDT)
Date: Tue, 29 Sep 2020 13:32:37 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/9] drm/format-helper: Pass destination pitch to
 drm_fb_memcpy_dstclip()
Message-ID: <20200929113237.GN438822@phenom.ffwll.local>
References: <20200625120011.16168-1-tzimmermann@suse.de>
 <20200625120011.16168-2-tzimmermann@suse.de>
 <20200629084044.GL3278063@phenom.ffwll.local>
 <89cff54c-789f-02fd-4939-35956b51cb56@suse.de>
 <CAKMK7uESYkP4Fa9mrN5dxT1bDxkHxhHkBF4FbosiOiyMzYJ=Bg@mail.gmail.com>
 <35822c4b-7821-7b33-d6ce-cfe51a85ff74@suse.de>
 <CAKMK7uGem0wKdmRwmk-ztNZbVW6UFmnPkXWSxicRG1S+8VszbA@mail.gmail.com>
 <a4cd3180-b21d-7464-ad63-5b616acf2c7a@suse.de>
 <20200929091906.GJ438822@phenom.ffwll.local>
 <637b470f-48a1-e7cd-d484-7a5e7ce13391@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <637b470f-48a1-e7cd-d484-7a5e7ce13391@suse.de>
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

On Tue, Sep 29, 2020 at 11:39:21AM +0200, Thomas Zimmermann wrote:
> Hi
> =

> Am 29.09.20 um 11:19 schrieb Daniel Vetter:
> > On Mon, Sep 28, 2020 at 11:13:06AM +0200, Thomas Zimmermann wrote:
> >> Hi
> >>
> >> Am 28.09.20 um 10:53 schrieb Daniel Vetter:
> >>> On Mon, Sep 28, 2020 at 9:22 AM Thomas Zimmermann <tzimmermann@suse.d=
e> wrote:
> >>>>
> >>>> Hi
> >>>>
> >>>> Am 26.09.20 um 18:42 schrieb Daniel Vetter:
> >>>>> On Fri, Sep 25, 2020 at 4:55 PM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> >>>>>>
> >>>>>> Hi
> >>>>>>
> >>>>>> Am 29.06.20 um 10:40 schrieb Daniel Vetter:
> >>>>>>> On Thu, Jun 25, 2020 at 02:00:03PM +0200, Thomas Zimmermann wrote:
> >>>>>>>> The memcpy's destination buffer might have a different pitch tha=
n the
> >>>>>>>> source. Support different pitches as function argument.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>>>>>>
> >>>>>>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >>>>>>>
> >>>>>>> But I do have questions ... why did we allocate a source drm_fram=
ebuffer
> >>>>>>> with mismatching pitch? That sounds backwards, especially for sim=
plekms.
> >>>>>>
> >>>>>> There's userspace that allocates framebuffers in tiles of 64x64 pi=
xels.
> >>>>>> I think I've seen this with Gnome. So if you have a 800x600 display
> >>>>>> mode, the allocated framebuffer has a scanline pitch of 832 pixels=
 and
> >>>>>> the final 32 pixels are ignored.
> >>>>>
> >>>>> At least with dumb buffer allocation ioctls userspace should not do
> >>>>> that. If it wants 800x600, it needs to allocate 800x600, not someth=
ing
> >>>>
> >>>> That ship has sailed.
> >>>
> >>> Not really, right now that ship is simply leaking and sinking. If we
> >>> decide to patch this up from the kernel side, then indeed it has
> >>> sailed. And I'm not sure that's a good idea.
> >>
> >> We have code in at least cirrus, ast and mgag200 to support this. And
> >> userspace has been behaving like this since at least when I got involv=
ed
> >> (2017).
> > =

> > Hm where do these drivers copy stuff around and rematch the stride?
> =

> They don't. These drivers adopt their HW stride to match whatever
> userspace framebuffers tell them. [1] And that's because userspace gives
> them framebuffer sizes like 832*640. And then they do a memcpy with the
> given width.
> =

> My sole point here was that userspace already relies on this behavior.

Yeah but the problem is, if we support this through copying, then we rob
userspace of the change to do something better.

I guess the reason that userspace aligns to 64b is because of i915 gbm
(iirc 64b is the requirement for being able to render, or maybe it's the
requirement for scanout). So you get zero-copy buffer sharing.

But if the kernel now does copies on its own, without telling userspace,
then we might end up with a fairly crappy path. It might not matter much
for old devices like this one, but for cases where we really care about
zero-copy it does. And unlike the kernel userspace can perhaps do the
copying using a different gpu for these cases.

So that's kinda why I'm vary of rolling this out at large scale. Since
once we've done it, we cannot ever undo it since that breaks existing
userspace on existing hardware. Which means even if we fix userspace to
have a better/different fallback that uses a correctly sized buffer and
maybe even a gpu copy, that code wont run because the kernel papers over
the problem with a dog-slow re-stride cpu copy.
-Daniel

> =

> Best regards
> Thomas
> =

> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/gpu/drm/tiny/cirrus.c#n285
> =

> > =

> >>>>> else. The driver is supposed to apply any rounding necessary for the
> >>>>> size. Or is this a buffer allocated somewhere else and then shared?
> >>>>
> >>>> I don't quite remember where exactly this was implemented. It was no=
t a
> >>>> shared buffer, though. IIRC the buffer allocation code in one of the
> >>>> libs rounded the size towards multiples of 64. I remember thinking t=
hat
> >>>> it was probably done for tiled rendering.
> >>>
> >>> Yeah, but you don't do rendering on dumb buffers. Like ever. So this
> >>> smells like a userspace bug.
> >>
> >> It's also part of the software rendering. It is not a bug, but
> >> implemented deliberately in one of the userspace components that
> >> allocates framebuffers (but I cannot remember which one.)
> > =

> > I think it would be good to document this.
> > =

> > We already fake xrgb8888 everywhere because userspace is not flexible
> > enough, I guess having to fake 64b stride support everywhere isn't that
> > much worse.
> > =

> > But it's definitely not great either :-/
> > -Daniel
> > =

> >>
> >> Best regards
> >> Thomas
> >>
> >>>
> >>> If it's for shared buffers then I think that sounds more reasonable.
> >>> -Daniel
> >>>
> >>>>
> >>>> Best regards
> >>>> Thomas
> >>>>
> >>>>> -Daniel
> >>>>>
> >>>>>> In regular drivers, we can handle this with the VGA offset registe=
r [1]
> >>>>>> or some equivalent. That's obviously not an option with simplekms,=
 so
> >>>>>> the different pitch is required.
> >>>>>>
> >>>>>> Best regards
> >>>>>> Thomas
> >>>>>>
> >>>>>> [1]
> >>>>>> https://web.stanford.edu/class/cs140/projects/pintos/specs/freevga=
/vga/crtcreg.htm#13
> >>>>>>
> >>>>>>>
> >>>>>>> Would be good to add the reasons why we need this to the commit m=
essage,
> >>>>>>> I'm sure I'll discover it later on eventually.
> >>>>>>> -Daniel
> >>>>>>>
> >>>>>>>> ---
> >>>>>>>>  drivers/gpu/drm/drm_format_helper.c    | 9 +++++----
> >>>>>>>>  drivers/gpu/drm/mgag200/mgag200_mode.c | 2 +-
> >>>>>>>>  drivers/gpu/drm/tiny/cirrus.c          | 2 +-
> >>>>>>>>  include/drm/drm_format_helper.h        | 2 +-
> >>>>>>>>  4 files changed, 8 insertions(+), 7 deletions(-)
> >>>>>>>>
> >>>>>>>> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/d=
rm/drm_format_helper.c
> >>>>>>>> index c043ca364c86..8d5a683afea7 100644
> >>>>>>>> --- a/drivers/gpu/drm/drm_format_helper.c
> >>>>>>>> +++ b/drivers/gpu/drm/drm_format_helper.c
> >>>>>>>> @@ -52,6 +52,7 @@ EXPORT_SYMBOL(drm_fb_memcpy);
> >>>>>>>>  /**
> >>>>>>>>   * drm_fb_memcpy_dstclip - Copy clip buffer
> >>>>>>>>   * @dst: Destination buffer (iomem)
> >>>>>>>> + * @dst_pitch: Number of bytes between two consecutive scanline=
s within dst
> >>>>>>>>   * @vaddr: Source buffer
> >>>>>>>>   * @fb: DRM framebuffer
> >>>>>>>>   * @clip: Clip rectangle area to copy
> >>>>>>>> @@ -59,12 +60,12 @@ EXPORT_SYMBOL(drm_fb_memcpy);
> >>>>>>>>   * This function applies clipping on dst, i.e. the destination =
is a
> >>>>>>>>   * full (iomem) framebuffer but only the clip rect content is c=
opied over.
> >>>>>>>>   */
> >>>>>>>> -void drm_fb_memcpy_dstclip(void __iomem *dst, void *vaddr,
> >>>>>>>> -                       struct drm_framebuffer *fb,
> >>>>>>>> +void drm_fb_memcpy_dstclip(void __iomem *dst, unsigned int dst_=
pitch,
> >>>>>>>> +                       void *vaddr, struct drm_framebuffer *fb,
> >>>>>>>>                         struct drm_rect *clip)
> >>>>>>>>  {
> >>>>>>>>      unsigned int cpp =3D fb->format->cpp[0];
> >>>>>>>> -    unsigned int offset =3D clip_offset(clip, fb->pitches[0], c=
pp);
> >>>>>>>> +    unsigned int offset =3D clip_offset(clip, dst_pitch, cpp);
> >>>>>>>>      size_t len =3D (clip->x2 - clip->x1) * cpp;
> >>>>>>>>      unsigned int y, lines =3D clip->y2 - clip->y1;
> >>>>>>>>
> >>>>>>>> @@ -73,7 +74,7 @@ void drm_fb_memcpy_dstclip(void __iomem *dst, =
void *vaddr,
> >>>>>>>>      for (y =3D 0; y < lines; y++) {
> >>>>>>>>              memcpy_toio(dst, vaddr, len);
> >>>>>>>>              vaddr +=3D fb->pitches[0];
> >>>>>>>> -            dst +=3D fb->pitches[0];
> >>>>>>>> +            dst +=3D dst_pitch;
> >>>>>>>>      }
> >>>>>>>>  }
> >>>>>>>>  EXPORT_SYMBOL(drm_fb_memcpy_dstclip);
> >>>>>>>> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gp=
u/drm/mgag200/mgag200_mode.c
> >>>>>>>> index f16bd278ab7e..7d4f3a62d885 100644
> >>>>>>>> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> >>>>>>>> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> >>>>>>>> @@ -1586,7 +1586,7 @@ mgag200_handle_damage(struct mga_device *m=
dev, struct drm_framebuffer *fb,
> >>>>>>>>      if (drm_WARN_ON(dev, !vmap))
> >>>>>>>>              return; /* BUG: SHMEM BO should always be vmapped */
> >>>>>>>>
> >>>>>>>> -    drm_fb_memcpy_dstclip(mdev->vram, vmap, fb, clip);
> >>>>>>>> +    drm_fb_memcpy_dstclip(mdev->vram, fb->pitches[0], vmap, fb,=
 clip);
> >>>>>>>>
> >>>>>>>>      drm_gem_shmem_vunmap(fb->obj[0], vmap);
> >>>>>>>>
> >>>>>>>> diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tin=
y/cirrus.c
> >>>>>>>> index 744a8e337e41..2dd9e5e31e3d 100644
> >>>>>>>> --- a/drivers/gpu/drm/tiny/cirrus.c
> >>>>>>>> +++ b/drivers/gpu/drm/tiny/cirrus.c
> >>>>>>>> @@ -327,7 +327,7 @@ static int cirrus_fb_blit_rect(struct drm_fr=
amebuffer *fb,
> >>>>>>>>              goto out_dev_exit;
> >>>>>>>>
> >>>>>>>>      if (cirrus->cpp =3D=3D fb->format->cpp[0])
> >>>>>>>> -            drm_fb_memcpy_dstclip(cirrus->vram,
> >>>>>>>> +            drm_fb_memcpy_dstclip(cirrus->vram, fb->pitches[0],
> >>>>>>>>                                    vmap, fb, rect);
> >>>>>>>>
> >>>>>>>>      else if (fb->format->cpp[0] =3D=3D 4 && cirrus->cpp =3D=3D =
2)
> >>>>>>>> diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_f=
ormat_helper.h
> >>>>>>>> index 5f9e37032468..2b5036a5fbe7 100644
> >>>>>>>> --- a/include/drm/drm_format_helper.h
> >>>>>>>> +++ b/include/drm/drm_format_helper.h
> >>>>>>>> @@ -11,7 +11,7 @@ struct drm_rect;
> >>>>>>>>
> >>>>>>>>  void drm_fb_memcpy(void *dst, void *vaddr, struct drm_framebuff=
er *fb,
> >>>>>>>>                 struct drm_rect *clip);
> >>>>>>>> -void drm_fb_memcpy_dstclip(void __iomem *dst, void *vaddr,
> >>>>>>>> +void drm_fb_memcpy_dstclip(void __iomem *dst, unsigned int dst_=
pitch, void *vaddr,
> >>>>>>>>                         struct drm_framebuffer *fb,
> >>>>>>>>                         struct drm_rect *clip);
> >>>>>>>>  void drm_fb_swab(void *dst, void *src, struct drm_framebuffer *=
fb,
> >>>>>>>> --
> >>>>>>>> 2.27.0
> >>>>>>>>
> >>>>>>>
> >>>>>>
> >>>>>> --
> >>>>>> Thomas Zimmermann
> >>>>>> Graphics Driver Developer
> >>>>>> SUSE Software Solutions Germany GmbH
> >>>>>> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> >>>>>> (HRB 36809, AG N=FCrnberg)
> >>>>>> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> >>>>>>
> >>>>>
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
> >> -- =

> >> Thomas Zimmermann
> >> Graphics Driver Developer
> >> SUSE Software Solutions Germany GmbH
> >> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> >> (HRB 36809, AG N=FCrnberg)
> >> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> >>
> > =

> > =

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
