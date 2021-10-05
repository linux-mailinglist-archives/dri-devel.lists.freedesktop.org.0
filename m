Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A2D4227C4
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 15:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB1089A34;
	Tue,  5 Oct 2021 13:27:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3329489A34
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 13:27:42 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id a3so26185032oid.6
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 06:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=j/c4EnSyar9A0QJvTmw4gU1nHv/rG0S2zwY51ipiG9Q=;
 b=XryJoE5fUviW9HsbWR/4qFdtDFMtt2mg5lzIrDw9cSlD1Y1TrpsXAGFLuxwNI+XEtS
 D8Ds5ogoixvRwBBqYu0oozE252PDXD+wOg7QVMZL07Qsg1PDlyAq0rW0gUliHc/mDaZv
 ktj5Co151NcPIQmOWFUfGgkROwOqAy/VWz0nyeDvJAjiIEUL8Y51+ZODEeNyAgUm7qW9
 R5LEbkuErfmGkiuHxuuZZGyOtl7STflE/q5vcbHycY/2OzK90O8pJxaaGbMsUU/ieSDR
 3nkNd3a0E3WpIBAWiEKoWpZVxc/sCIH6G538ecTT91nt6Y0X9t+NOK2RL/Lwhw147wlm
 TYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=j/c4EnSyar9A0QJvTmw4gU1nHv/rG0S2zwY51ipiG9Q=;
 b=SP2PzxFTlKuxHQ4vtEJjdd/GcFRtJrfzrtggzbZ/w5qHqBdNbRhw62BUk0b6+YfuH1
 THqyG1bglXy77tgAs/l99YG/clurUKY6P95V69SMu8NNKgf0ABqY2q3KMgBtTTlN0nvS
 ADgS/XuY+UbaLT5sZEunmbMIrZ8uoqQURaH2C1uDV997dqp3yd2cd5AKC2BB3z2raIFN
 oRcnzQ/RJi2pcKkN9+yLyVB9W4hfjPJ3Z07VpzrrDfKvjxsLux5yDc0+k9C9feJqjpKr
 1nCOarf+DVA8dzOyC55KzIrPV2UrHMGSlI1VpF00qJit9GHDmMa1Dmpb/0FLdBc3oBdM
 eeqQ==
X-Gm-Message-State: AOAM530h3a4V0ZyQGyRC0e3375ZvJxHckQF2CM1/PeJzWbJOXJOftBfr
 vdIB+IlG5x+fRZ0AGyOuiE6Ehv1BCppzwvgQFII=
X-Google-Smtp-Source: ABdhPJyner6BldIDA1gDazCrrujRQA7VK7iQvSSyU4xzAj8nG2F3I5aKdA6K2l4djwMmK1qwdOyaiJl0xzRAZnKpKLU=
X-Received: by 2002:aca:ab4d:: with SMTP id u74mr2477294oie.120.1633440461489; 
 Tue, 05 Oct 2021 06:27:41 -0700 (PDT)
MIME-Version: 1.0
References: <20211005070355.7680-1-tzimmermann@suse.de>
In-Reply-To: <20211005070355.7680-1-tzimmermann@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 5 Oct 2021 09:27:30 -0400
Message-ID: <CADnq5_MYM4ce7tn0W_Aa7qzCqX3O3qqu=P5Dtf89sHtnyt+Ysw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/fbdev: Clamp fbdev surface size if too large
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@linux.ie>, 
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 kernel@amanoeldawod.com, dirty.ice.hu@gmail.com, michael+lkml@stapelberg.ch, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Maxime Ripard <maxime@cerno.tech>, "for 3.8" <stable@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 5, 2021 at 3:04 AM Thomas Zimmermann <tzimmermann@suse.de> wrot=
e:
>
> Clamp the fbdev surface size of the available maximumi height to avoid
> failing to init console emulation. An example error is shown below.
>
>   bad framebuffer height 2304, should be >=3D 768 && <=3D 768
>   [drm] Initialized simpledrm 1.0.0 20200625 for simple-framebuffer.0 on =
minor 0
>   simple-framebuffer simple-framebuffer.0: [drm] *ERROR* fbdev: Failed to=
 setup generic emulation (ret=3D-22)
>
> This is especially a problem with drivers that have very small screen
> sizes and cannot over-allocate at all.
>
> v2:
>         * reduce warning level (Ville)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 11e8f5fd223b ("drm: Add simpledrm driver")
> Reported-by: Amanoel Dawod <kernel@amanoeldawod.com>
> Reported-by: Zolt=C3=A1n K=C5=91v=C3=A1g=C3=B3 <dirty.ice.hu@gmail.com>
> Reported-by: Michael Stapelberg <michael+lkml@stapelberg.ch>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v5.14+

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/drm_fb_helper.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_hel=
per.c
> index 6860223f0068..3b5661cf6c2b 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -1508,6 +1508,7 @@ static int drm_fb_helper_single_fb_probe(struct drm=
_fb_helper *fb_helper,
>  {
>         struct drm_client_dev *client =3D &fb_helper->client;
>         struct drm_device *dev =3D fb_helper->dev;
> +       struct drm_mode_config *config =3D &dev->mode_config;
>         int ret =3D 0;
>         int crtc_count =3D 0;
>         struct drm_connector_list_iter conn_iter;
> @@ -1665,6 +1666,11 @@ static int drm_fb_helper_single_fb_probe(struct dr=
m_fb_helper *fb_helper,
>         /* Handle our overallocation */
>         sizes.surface_height *=3D drm_fbdev_overalloc;
>         sizes.surface_height /=3D 100;
> +       if (sizes.surface_height > config->max_height) {
> +               drm_dbg_kms(dev, "Fbdev over-allocation too large; clampi=
ng height to %d\n",
> +                           config->max_height);
> +               sizes.surface_height =3D config->max_height;
> +       }
>
>         /* push down into drivers */
>         ret =3D (*fb_helper->funcs->fb_probe)(fb_helper, &sizes);
> --
> 2.33.0
>
