Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE67754B4F6
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 17:44:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B19F10F458;
	Tue, 14 Jun 2022 15:44:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EDA710F458
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 15:43:59 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id g25so17972122ejh.9
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 08:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3eL/7FwPzW9ivK7YHRI4TkFaUguB6w6HeKcSLDEypW8=;
 b=N++ntITmkFpJ5BjgNa94fH0g+PIe7Ax5U5V5aepsyES2DiFnPbBA/890qsuV8Nn9q4
 uejA0CUvNFmSpDoTFJgd7D+JTEou6vv/tSdCiWqkeBeMj+VtY+L0MDGkvopmKuEGaF7P
 7DeDe4mIPn5DqwntGcgLcOTZzfTMIl1ynZ/umfBqQl9Emw4+2adgCkOju//s+rFtglI8
 AyX9ptLKrA+jBPJGqJCObu26KG5hxC2tRC6UOEPFJyenYevfllxef5XwqnqObzkHefb5
 mpvC9273L4G6h+z0dmnq3B9c+R8nLl6eezI4bc3h9siJy4a36m0sjr1iBpcqCNfZoOJZ
 5X5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3eL/7FwPzW9ivK7YHRI4TkFaUguB6w6HeKcSLDEypW8=;
 b=rrZSSrmPmeXNWNIB7Ejw5yKaydjHS8GF2kyA7j+vI9cEZCMlizGkekE5x0zJptK2o6
 cCCZ3GJ+MMV3+7ov3JCutF+KSp3yVeSeDVwjZqKpMBFMgOXEijW32dVYDsCmo7u1aGbb
 GWXy5qswcndo3TgKmbIA+2lFXXCmNxVTNpON4B6LwiHsVAclFRDW6C5pZIOZa5m2jtPy
 xe/8DrJo2KLJYbgamZU6V7t843vpLz+a5KP4IE9jLoZvtXTf2Ggc+taqBFw0l3Pk0BTb
 YXPXYQUhLELPGij1LrlzXgf1XO6BLsnQELLyUagzynzULs8ojNyarWsrfGSnpWj1Vcyg
 bu0A==
X-Gm-Message-State: AOAM532Hz3a9xZKfNJG5D6K2EiIZIcBGVktm/nUT/6kSKAFSM8E/1hdW
 25xtIz0Exr7Tk32UOEt+Me2zhm+HTIwJO11Xhi/Upg==
X-Google-Smtp-Source: ABdhPJyp3hhvnjxWftcn7hrnQsNI15WLFKlbSSmQJ0tWkvXO9RIgnuUDsM2CfK5yA9Ym8W8Cf6mFnjfR1EB+3mNs3/o=
X-Received: by 2002:a17:906:649b:b0:711:fde7:be43 with SMTP id
 e27-20020a170906649b00b00711fde7be43mr5036963ejm.294.1655221437797; Tue, 14
 Jun 2022 08:43:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-19-maxime@cerno.tech>
In-Reply-To: <20220610092924.754942-19-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 14 Jun 2022 16:43:41 +0100
Message-ID: <CAPY8ntBwEiTKiSW+Bv55zVeFym1w_cU1_2OPF-=obP4RF++9kw@mail.gmail.com>
Subject: Re: [PATCH 18/64] drm/vc4: crtc: Switch to drmm_kzalloc
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 10 Jun 2022 at 10:30, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Our internal structure that stores the DRM entities structure is allocated
> through a device-managed kzalloc.
>
> This means that this will eventually be freed whenever the device is
> removed. In our case, the most like source of removal is that the main
> device is going to be unbound, and component_unbind_all() is being run.
>
> However, it occurs while the DRM device is still registered, which will
> create dangling pointers, eventually resulting in use-after-free.
>
> Switch to a DRM-managed allocation to keep our structure until the DRM
> driver doesn't need it anymore.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
> index 1f7e987e68aa..c74fa3d07561 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -1178,7 +1178,7 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
>         struct drm_crtc *crtc;
>         int ret;
>
> -       vc4_crtc = devm_kzalloc(dev, sizeof(*vc4_crtc), GFP_KERNEL);
> +       vc4_crtc = drmm_kzalloc(drm, sizeof(*vc4_crtc), GFP_KERNEL);
>         if (!vc4_crtc)
>                 return -ENOMEM;
>         crtc = &vc4_crtc->base;
> --
> 2.36.1
>
