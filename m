Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B69D65F07D
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 16:51:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C87C810E0F9;
	Thu,  5 Jan 2023 15:51:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F8010E0F9
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 15:51:17 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id q9so7801092pgq.5
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 07:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vehu6SibZXNd9DBSH45bbZRoxaXZLO9oW66VfFNAj1w=;
 b=FoT/fjUuC3jmFUKcOiBh1sLiiDp9LD1QAEHg0FAKePgPp96awgCBe1K+I+PTwQfbCq
 MGGId+pH8XvNw1fbMX7YTVZCCpNJzLVJLU3RzI95G3vU472DHKlDIzWL1vIPLLqtvCI8
 dQbQJsB2+QSoeKQx7OYmuC/bzboSWcOK4f6xM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vehu6SibZXNd9DBSH45bbZRoxaXZLO9oW66VfFNAj1w=;
 b=pqodtm2wgajoUnAMiN4VFtW/Cm4IgwBH2p3LxUTkMeL4GkJM0ZpAT44mvnS+m/ypes
 hfpWTCRrGabihoC3muyN/fK9KOaJGtoQg+varrS5dcbSpf2Xw/hrpmh1aK4Fg3EgH22/
 rLMS1It37bPWBwklZ5eTS2cJ0YaXhtxDPx1rPIMDG/W6X5FMNt7LhOgssXsWxk++NqCv
 lVXtIarMNRbKEP2Wddn97DmH7N2bgJN8q45HqjUVcSJXd1z85K5iTC9BVThaW4E7d1Ue
 NH+fagtTxwJ1goh1AnrXudUR0yyelt2Nd2Hmu55wj6DZLdt/TUt3fCcPaQr9lEF9RV/U
 w3FA==
X-Gm-Message-State: AFqh2krah23/MyB+3sU7j3n/0Nh9MvGTQJF0r6570IAfVuirJirtGmMv
 x2uxPSIeqvq3nZ3tLFaBiV8Zzr26MBK+7sQT/5qMSw==
X-Google-Smtp-Source: AMrXdXtzSr9b1UM1qAhXqA+WWM6oaRyyybWfzNmLPWOIwCP6O0fMxDEpHTWnPtHV+GDjtQzSbdEvghenD8Xuf5wZVLg=
X-Received: by 2002:a65:674e:0:b0:479:27db:27b4 with SMTP id
 c14-20020a65674e000000b0047927db27b4mr2485267pgu.454.1672933876791; Thu, 05
 Jan 2023 07:51:16 -0800 (PST)
MIME-Version: 1.0
References: <20230103125322.855089-1-mcanal@igalia.com>
 <de3c30a2-d9c6-cf5c-d4bc-e90bd3993f6b@suse.de>
 <Y7brvC7lvhtQCeU/@phenom.ffwll.local>
 <87a69797-9d8e-fdf3-19fb-34d85311bdb5@suse.de>
In-Reply-To: <87a69797-9d8e-fdf3-19fb-34d85311bdb5@suse.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 5 Jan 2023 16:51:04 +0100
Message-ID: <CAKMK7uGYtv2enSPYWDGc3aT4XVg9BTgzPGKVDwjQruBPDssmhg@mail.gmail.com>
Subject: Re: [PATCH] drm/gem: Check for valid formats
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 5 Jan 2023 at 16:43, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 05.01.23 um 16:24 schrieb Daniel Vetter:
> > On Tue, Jan 03, 2023 at 02:16:30PM +0100, Thomas Zimmermann wrote:
> >> Hi,
> >>
> >> thanks for the follow-up patch.
> >>
> >> Am 03.01.23 um 13:53 schrieb Ma=C3=ADra Canal:
> >>> Currently, drm_gem_fb_create() doesn't check if the pixel format is
> >>> supported, which can lead to the acceptance of invalid pixel formats
> >>> e.g. the acceptance of invalid modifiers. Therefore, add a check for
> >>> valid formats on drm_gem_fb_create().
> >>>
> >>> Moreover, note that this check is only valid for atomic drivers,
> >>> because, for non-atomic drivers, checking drm_any_plane_has_format() =
is
> >>> not possible since the format list for the primary plane is fake, and
> >>> we'd therefor reject valid formats.
> >>>
> >>> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> >>> ---
> >>>    Documentation/gpu/todo.rst                   | 7 ++-----
> >>>    drivers/gpu/drm/drm_gem_framebuffer_helper.c | 9 +++++++++
> >>>    2 files changed, 11 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> >>> index 1f8a5ebe188e..68bdafa0284f 100644
> >>> --- a/Documentation/gpu/todo.rst
> >>> +++ b/Documentation/gpu/todo.rst
> >>> @@ -276,11 +276,8 @@ Various hold-ups:
> >>>    - Need to switch to drm_fbdev_generic_setup(), otherwise a lot of =
the custom fb
> >>>      setup code can't be deleted.
> >>> -- Many drivers wrap drm_gem_fb_create() only to check for valid form=
ats. For
> >>> -  atomic drivers we could check for valid formats by calling
> >>> -  drm_plane_check_pixel_format() against all planes, and pass if any=
 plane
> >>> -  supports the format. For non-atomic that's not possible since like=
 the format
> >>> -  list for the primary plane is fake and we'd therefor reject valid =
formats.
> >>> +- Need to switch to drm_gem_fb_create(), as now drm_gem_fb_create() =
checks for
> >>> +  valid formats for atomic drivers.
> >>>    - Many drivers subclass drm_framebuffer, we'd need a embedding com=
patible
> >>>      version of the varios drm_gem_fb_create functions. Maybe called
> >>> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/g=
pu/drm/drm_gem_framebuffer_helper.c
> >>> index e93533b86037..b8a615a138cd 100644
> >>> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> >>> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> >>> @@ -9,6 +9,7 @@
> >>>    #include <linux/module.h>
> >>>    #include <drm/drm_damage_helper.h>
> >>> +#include <drm/drm_drv.h>
> >>>    #include <drm/drm_fourcc.h>
> >>>    #include <drm/drm_framebuffer.h>
> >>>    #include <drm/drm_gem.h>
> >>> @@ -164,6 +165,14 @@ int drm_gem_fb_init_with_funcs(struct drm_device=
 *dev,
> >>>             return -EINVAL;
> >>>     }
> >>> +   if (drm_drv_uses_atomic_modeset(dev) &&
> >>> +       !drm_any_plane_has_format(dev, mode_cmd->pixel_format,
> >>> +                                 mode_cmd->modifier[0])) {
> >>
> >> Because this is a generic helper, it has to handle the odd cases as we=
ll.
> >> Here we cannot assume modifier[0], because there's a modifier for each=
 pixel
> >> plane in multi-plane formats. (That's a different type of plane than t=
he
> >> struct plane we're passing in.) If one combination isn't supported, th=
e
> >> helper should fail.
> >
> > This was a mistake in the addfb2 design, we later rectified that all
> > modifiers must match. This is because the modifier itsel can change the
> > number of planes (for aux compression planes and stuff like that).
> >
> > The full drm format description is the (drm_fourcc, drm_format_modifier=
)
> > pair.
>
> Does this mean that only modifier[0] will ever contain a valid value, OR
> that all modifiers[i] have to contain the same value?

All must have the same, addfb checks for that. See framebuffer_check()
-Daniel

>
> Best regards
> Thomas
>
> >
> > This should be documented somewhere already, if not, good idea to updat=
e
> > addfb docs (or make them happen in the first place).
> > -Daniel
> >
> >>
> >> We get the number of pixel planes from the format info. So the correct
> >> implementation is something like that
> >>
> >> if (drm_drv_uses_atomic_modeset())) {
> >>      for (i =3D 0; i < info->num_planes; ++i) {
> >>              if (!drm_any_plane_has_format(dev, pixel_format, \
> >>                              modifier[i]) {
> >>                      drm_dbg_kms(dev, "error msg");
> >>                      return -EINVAL;
> >>              }
> >>          }
> >> }
> >>
> >>
> >>> +           drm_dbg(dev, "Unsupported pixel format %p4cc / modifier 0=
x%llx\n",
> >>
> >> drm_dbg() is for drivers. Use drm_dbg_kms() please.
> >>
> >> Best regards
> >> Thomas
> >>
> >>
> >>> +                   &mode_cmd->pixel_format, mode_cmd->modifier[0]);
> >>> +           return -EINVAL;
> >>> +   }
> >>> +
> >>>     for (i =3D 0; i < info->num_planes; i++) {
> >>>             unsigned int width =3D mode_cmd->width / (i ? info->hsub =
: 1);
> >>>             unsigned int height =3D mode_cmd->height / (i ? info->vsu=
b : 1);
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
