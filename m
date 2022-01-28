Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F72749FD4B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 16:58:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B17F10F190;
	Fri, 28 Jan 2022 15:58:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6445710F190
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 15:58:49 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 q19-20020a056830441300b0059a54d66106so6186036otv.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 07:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6hFQB4ADTDgwYoAX4+/m39DLH9lKtS8Ql8nKlJJr2nc=;
 b=W2DFFkcBZLUCaEjftlm381Hj760bVRbzzveUqStrD86ZPPDmIlDYYar2fIcpu4qsDg
 Y58ALqe8ol1sooWSu2yopcO9sQMpirBk7ThuR0n+SH6mIDr/Ut1lIFDdOqacb0+YckkB
 gtMz1H0aoxyKOxvED+jhZLvp82lbznI+tsId8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6hFQB4ADTDgwYoAX4+/m39DLH9lKtS8Ql8nKlJJr2nc=;
 b=P37bBb9e1XUjGeatQxL+f/kot8UJhywc6eICDTz/xqbD6xs4+fuWCZ9QcwM6U2el0M
 SdP33/isn/dbG5Y0PKhe8rK00yVu11AGco4qSQ/PVpS7i+gYpXvBShMfeMbCHWuOiNuf
 0Ny0i4FFRaFhb+WXfL/B4Upi5kGWs+vk+vfchTJ2ENlLT/xZ5F3K6f7ubvf0Pt8uTovb
 aVH2tsdFO1zZv8WPRP4BMrzJEdjp9W/ETg29W+DqPDSsUBzxfrsWsnDTyW/4Piaugmv/
 LVxTzZltFTnOjf+ZoD3XsgPDfXlwWcIWxb+Ls4Ox6hae2EJ9j9s59RJM4LYnHiZLr4B+
 OUEA==
X-Gm-Message-State: AOAM532ufvC2myba2bUfoy3DfcOCFqW6k+CmeeLsjnQwXxz/CrctEquf
 G4VE34F5MDTMsV5SZ+HAKE2Bzq6dVmptsNaB3lEz33Gbz+Q=
X-Google-Smtp-Source: ABdhPJwz0EIZKkOAdQMZFaiTQw4fFIo98+hjkF+0zwNG/Hq5e72N8kP4r+ULLpyVq5wij08SFTan9JvHHgzvWmQRzSc=
X-Received: by 2002:a05:6830:2691:: with SMTP id
 l17mr548443otu.323.1643385528603; 
 Fri, 28 Jan 2022 07:58:48 -0800 (PST)
MIME-Version: 1.0
References: <20220127102621.30047-1-tzimmermann@suse.de>
 <YfKFP2DW/g6tXLQw@phenom.ffwll.local>
 <b3c508df-53ee-7fcd-2cdb-297d603a5f96@suse.de>
 <YfK0N21rJ69rclJE@phenom.ffwll.local>
 <b59ac6ae-f080-0a22-3ad6-e0de65ebf621@suse.de>
 <CAKMK7uFNXooNYnrJ6-_nRh5jrOQrAdocUe88eT_fVRPg=svMSg@mail.gmail.com>
 <79173ff0-5e86-9761-a7f3-6c93d4d8bc11@suse.de>
In-Reply-To: <79173ff0-5e86-9761-a7f3-6c93d4d8bc11@suse.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 28 Jan 2022 16:58:37 +0100
Message-ID: <CAKMK7uGQedBMtQX6A6PYqKWY=2rxv4x1nhOYP4krnAD-1ucXdQ@mail.gmail.com>
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

On Fri, Jan 28, 2022 at 12:36 PM Thomas Zimmermann <tzimmermann@suse.de> wr=
ote:
>
> Hi
>
> Am 28.01.22 um 12:00 schrieb Daniel Vetter:
> > On Thu, Jan 27, 2022 at 4:18 PM Thomas Zimmermann <tzimmermann@suse.de>=
 wrote:
> >>
> >> Hi
> >>
> >> Am 27.01.22 um 16:03 schrieb Daniel Vetter:
> >>> On Thu, Jan 27, 2022 at 12:58:30PM +0100, Thomas Zimmermann wrote:
> >>>> Hi
> >>>>
> >>>> Am 27.01.22 um 12:42 schrieb Daniel Vetter:
> >>>>> On Thu, Jan 27, 2022 at 11:26:21AM +0100, Thomas Zimmermann wrote:
> >>>>>> Mark screen buffers in system memory with FB_VIRTFB. Otherwise, th=
e
> >>>>>> buffers are mmap'ed as I/O memory (i.e., VM_IO). For shadow buffer=
s,
> >>>>>> also set the FB_READS_FAST hint.
> >>>>>
> >>>>> Maybe clarify that this only holds for the defio case, and since we=
 have
> >>>>> our own shadow copy for that anyway it shouldn't matter. I'm also n=
ot sure
> >>>>> how much the memcpy gains us compared to just redrawing ...
> >>>>>
> >>>>> What's the motivation here, or just something you spotted?
> >>>>
> >>>> Correctness mostly. fbdev's fbdefio tests for (the absence of) this =
flag and
> >>>> sets VM_IO accordingly.
> >>>>
> >>>> It's actually for userspace. Maybe userspace tests these flags as we=
ll and
> >>>> can optimize memcpy pattern for different types of caching. But I wo=
uldn't
> >>>> expect it TBH.
> >>>
> >>> Hm I thought so too, but the #define is in the internal header, not t=
he
> >>> uapi header. And I don't see any ioctl code in fbmem.c that would sho=
ve
> >>> fb_info->flags to userspace. That's why I wondered why you care about
> >>> this? Or did I miss something somewhere?
> >>
> >> You didn't.  I just grepped it myself and the only user of VIRTFB is t=
he
> >> mmap code in fb_deferio.c, which (not) sets VM_IO. READS_FAST is unuse=
d.
> >> I'd then set the former, but not the latter. Ok?
> >
> > Well READS_FAST might become used again, if/when the accel code is
>
> Ok.
>
> > back. So I'd more keep that part, and leave the VIRTFB one alone,
> > since you never set that for the defio case. I'm also not sure how
> > that even works, since defio relies on struct page being present
> > underneath, and you defo don't have struct page for VM_IO cases. So it
> > all looks rather fishy. Or I'm still massively misunderstanding it
> > all?
>
> We only set the VIRTFB flag if we use our internal shadow buffer, which
> is allocate via vzalloc() in drm_fb_helper_generic_probe(). Of course,
> the shadow buffer is regular memory and not an I/O range.
>
> The fbdefio on this buffer is completely implemented by the fbdev
> susbystem, which uses pages (i.e., no VM_PFNMAP flag). See
> https://elixir.bootlin.com/linux/latest/source/drivers/video/fbdev/core/f=
b_defio.c#L165
> for the respective mmap code.  Our GEM code never even knows that an
> mmap call has taken place. It just sees the occasional damage updates
> that fbdevio generates. Setting VIRTFB on the shadow buffer's memory is
> the right thing to do IMHO.

Oh dear I read that test inverted and thought if we do nothing, then
we wouldn't get VM_IO. Imo if you explain this in the commit message
(and maybe in a comment like "make sure defio mmap does not set VM_IO"
then this has my Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Also I guess this should have a cc: stable since I guess without it
it'll go boom on a bunch of the more obscure architectures ...

I'm not sure the 2nd part that sets VIRTFB for other parts makes sense
since mmap is fully under our control for that case. Imo drop it, but
also I'm ok if you keep it.

Also I guess yet another reason to just pull the defio stuff into our
fbdev emulation layer, because we're just fighting a questionable
midlayer here :-)
-Daniel

>
> Best regards
> Thomas
>
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
> >>>> Best regards
> >>>> Thomas
> >>>>
> >>>>> -Daniel
> >>>>>
> >>>>>>
> >>>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>>>>> ---
> >>>>>>     drivers/gpu/drm/drm_fb_helper.c | 9 ++++++---
> >>>>>>     1 file changed, 6 insertions(+), 3 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm=
_fb_helper.c
> >>>>>> index ed43b987d306..f15127a32f7a 100644
> >>>>>> --- a/drivers/gpu/drm/drm_fb_helper.c
> >>>>>> +++ b/drivers/gpu/drm/drm_fb_helper.c
> >>>>>> @@ -2346,6 +2346,7 @@ static int drm_fb_helper_generic_probe(struc=
t drm_fb_helper *fb_helper,
> >>>>>>             fbi->fbops =3D &drm_fbdev_fb_ops;
> >>>>>>             fbi->screen_size =3D sizes->surface_height * fb->pitch=
es[0];
> >>>>>>             fbi->fix.smem_len =3D fbi->screen_size;
> >>>>>> +  fbi->flags =3D FBINFO_DEFAULT;
> >>>>>>             drm_fb_helper_fill_info(fbi, fb_helper, sizes);
> >>>>>> @@ -2353,19 +2354,21 @@ static int drm_fb_helper_generic_probe(str=
uct drm_fb_helper *fb_helper,
> >>>>>>                     fbi->screen_buffer =3D vzalloc(fbi->screen_siz=
e);
> >>>>>>                     if (!fbi->screen_buffer)
> >>>>>>                             return -ENOMEM;
> >>>>>> +          fbi->flags |=3D FBINFO_VIRTFB | FBINFO_READS_FAST;
> >>>>>>                     fbi->fbdefio =3D &drm_fbdev_defio;
> >>>>>> -
> >>>>>>                     fb_deferred_io_init(fbi);
> >>>>>>             } else {
> >>>>>>                     /* buffer is mapped for HW framebuffer */
> >>>>>>                     ret =3D drm_client_buffer_vmap(fb_helper->buff=
er, &map);
> >>>>>>                     if (ret)
> >>>>>>                             return ret;
> >>>>>> -          if (map.is_iomem)
> >>>>>> +          if (map.is_iomem) {
> >>>>>>                             fbi->screen_base =3D map.vaddr_iomem;
> >>>>>> -          else
> >>>>>> +          } else {
> >>>>>>                             fbi->screen_buffer =3D map.vaddr;
> >>>>>> +                  fbi->flags |=3D FBINFO_VIRTFB;
> >>>>>> +          }
> >>>>>>                     /*
> >>>>>>                      * Shamelessly leak the physical address to us=
er-space. As
> >>>>>> --
> >>>>>> 2.34.1
> >>>>>>
> >>>>>
> >>>>
> >>>> --
> >>>> Thomas Zimmermann
> >>>> Graphics Driver Developer
> >>>> SUSE Software Solutions Germany GmbH
> >>>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> >>>> (HRB 36809, AG N=C3=BCrnberg)
> >>>> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
> >>>
> >>>
> >>>
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
