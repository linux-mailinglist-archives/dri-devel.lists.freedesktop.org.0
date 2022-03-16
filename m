Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 310304DB0D8
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 14:16:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15CD710E565;
	Wed, 16 Mar 2022 13:16:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C980310E4CA;
 Wed, 16 Mar 2022 13:16:49 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 rm8-20020a17090b3ec800b001c55791fdb1so2374153pjb.1; 
 Wed, 16 Mar 2022 06:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XuhhHCKxaOgbTQv9Uy857FzzCOKPf1qmVJ5c5SZcYAw=;
 b=Xviz1at0O82s6tRm//1wWVVDHHs70XihVhiWVnSDNLnmSdK2Tby17TUExWO7H1590C
 MV4UAKPB9rvkZqT51/J0QB01p1MPM1yDIWQOdNq6tN+mQ7Dxd55gTq7WfGWAEzRZhYuI
 cJWoiDJrdP68P+PHe6fQq2p4KM0hzqDVv06pbif9E9WbdL6liIWpr1fB10o54Q0kyWxV
 hABEr/gnGOLy9SxO3W7jwDK1CbRwry3bUme0dRdhtrVUoFuwWhYCFh0ojnrBUdmfHJcl
 AxijjdComxb4wCLG/VW0T1ujg7+0oU61Etv6kWZNqMCS7RW6BKgqhMneQUddZc7Twbsm
 inng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XuhhHCKxaOgbTQv9Uy857FzzCOKPf1qmVJ5c5SZcYAw=;
 b=GJn7l4O5ZHgaTvoMVkpVHQlyEgdnOgETrlz8Q2crps0y1rm3XiPGgahSwVHLy55RIM
 4Uimap4ZxHrni7Lb4HnKh8WYslV1SxrfqgcNEypQenIcSYEFDAB7RS2MwVLdATMdm5zJ
 l3WR7woCeEMSE9AA3fynS8dFts7f9NjHoAHFNuaZekxn6xfVLKwor6a+lHafd+QdjyYc
 g2Eho6hTKT/VvcDQAA3MMMBopv2tP35GqfrC8UDU8EvRk5X53JWxtT8fXVZyw2HJVRQj
 HE3ugvCVVpXvPgDaQe6f0LZgWyWvixfABE/IQMpwVEJ+djhK5q05mXz0BCVRyvVusCno
 9C9A==
X-Gm-Message-State: AOAM530+B6+luxCqw5Gt101uKXZvSEA2p09yWSRYLeFnbtq/cXSw4Voe
 1HRvpsB5GXdstSHP/p3cjwWpc2Odgd6CzT71a1rcxyMY
X-Google-Smtp-Source: ABdhPJw/it96sRoj6a6aMK+ZBIPEW+aa4lh6PVDs8dRFg2tVEF+f4l4UANtSVoKL5nfbL6ivGkqUQ+tRsqmFl2AAnDQ=
X-Received: by 2002:a17:90a:8d08:b0:1c6:5ada:9919 with SMTP id
 c8-20020a17090a8d0800b001c65ada9919mr2921199pjo.90.1647436609341; Wed, 16 Mar
 2022 06:16:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
 <20220218100403.7028-8-ville.syrjala@linux.intel.com>
In-Reply-To: <20220218100403.7028-8-ville.syrjala@linux.intel.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Wed, 16 Mar 2022 14:16:38 +0100
Message-ID: <CAMeQTsYau89fJMexXunByjE3BCKybNBhzDzZqsF82TAQc9=65A@mail.gmail.com>
Subject: Re: [PATCH 07/22] drm/gma500: Use drm_mode_copy()
To: Ville Syrjala <ville.syrjala@linux.intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 18, 2022 at 11:04 AM Ville Syrjala
<ville.syrjala@linux.intel.com> wrote:
>
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> struct drm_display_mode embeds a list head, so overwriting
> the full struct with another one will corrupt the list
> (if the destination mode is on a list). Use drm_mode_copy()
> instead which explicitly preserves the list head of
> the destination mode.
>
> Even if we know the destination mode is not on any list
> using drm_mode_copy() seems decent as it sets a good
> example. Bad examples of not using it might eventually
> get copied into code where preserving the list head
> actually matters.
>
> Obviously one case not covered here is when the mode
> itself is embedded in a larger structure and the whole
> structure is copied. But if we are careful when copying
> into modes embedded in structures I think we can be a
> little more reassured that bogus list heads haven't been
> propagated in.
>
> @is_mode_copy@
> @@
> drm_mode_copy(...)
> {
> ...
> }
>
> @depends on !is_mode_copy@
> struct drm_display_mode *mode;
> expression E, S;
> @@
> (
> - *mode =3D E
> + drm_mode_copy(mode, &E)
> |
> - memcpy(mode, E, S)
> + drm_mode_copy(mode, E)
> )
>
> @depends on !is_mode_copy@
> struct drm_display_mode mode;
> expression E;
> @@
> (
> - mode =3D E
> + drm_mode_copy(&mode, &E)
> |
> - memcpy(&mode, E, S)
> + drm_mode_copy(&mode, E)
> )
>
> @@
> struct drm_display_mode *mode;
> @@
> - &*mode
> + mode
>
> Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Looks good. Thanks!
Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

> ---
>  drivers/gpu/drm/gma500/oaktrail_crtc.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/oaktrail_crtc.c b/drivers/gpu/drm/gma=
500/oaktrail_crtc.c
> index 36c7c2686c90..79fc602b35bc 100644
> --- a/drivers/gpu/drm/gma500/oaktrail_crtc.c
> +++ b/drivers/gpu/drm/gma500/oaktrail_crtc.c
> @@ -385,12 +385,8 @@ static int oaktrail_crtc_mode_set(struct drm_crtc *c=
rtc,
>         if (!gma_power_begin(dev, true))
>                 return 0;
>
> -       memcpy(&gma_crtc->saved_mode,
> -               mode,
> -               sizeof(struct drm_display_mode));
> -       memcpy(&gma_crtc->saved_adjusted_mode,
> -               adjusted_mode,
> -               sizeof(struct drm_display_mode));
> +       drm_mode_copy(&gma_crtc->saved_mode, mode);
> +       drm_mode_copy(&gma_crtc->saved_adjusted_mode, adjusted_mode);
>
>         list_for_each_entry(connector, &mode_config->connector_list, head=
) {
>                 if (!connector->encoder || connector->encoder->crtc !=3D =
crtc)
> --
> 2.34.1
>
