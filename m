Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C721758CF4
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 07:17:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B5410E3F0;
	Wed, 19 Jul 2023 05:17:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDBD410E3F0;
 Wed, 19 Jul 2023 05:17:24 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4fb7769f15aso10695069e87.0; 
 Tue, 18 Jul 2023 22:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689743842; x=1692335842;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Gx9Abb9INC5EOsKVb3k5BkOEXlQkiI5XeDiYpmyACHE=;
 b=ik0PA+XyZ6EQ/iPxbOeyzFxJOT6AEKqgv5X0qSAxZFf6BrQMhiytm4lEtObYr+z1l/
 R92CB3J7nufWgv5X2vd+cyfYhE6bbuzh/GF6h0IH+Y/rZ3/Xz0ir/bGe6mdoms6oKgpv
 Od8BWJq6L7EI4PmPQuWh7mZlCyrLj2anYmaZxz9LpoqNqFCWpV5oQ5gH2gJo5uScvgQa
 XL2URV7ieiRCuHfm6vjzslUUwcLeqYr4Q/4oY+q7CHOc1LEAJrZpNLwJhlf7mR17RT/A
 IRRRQTrK9PDvyXojw1qbLs//XPiEdJvCdpOG4IBDLs74Wh0wk22Br0ILtgdRywnFSqrR
 O6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689743842; x=1692335842;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gx9Abb9INC5EOsKVb3k5BkOEXlQkiI5XeDiYpmyACHE=;
 b=hy7oc3pMGS7pBa7bV5ZzzQUcVN47s6NRFTDmC2+r4n1JUCVBdoKpIiknzRgNtR7Kec
 DJBWD/LoThtTA3LJcfDdSXfruuzX8gdEYZVL16S9kvjQj8gSxWqA5eoldE2dtPCFFQMg
 XFk6aCb+0jaCFA/k9jUZ8jary7LB5E7k7VOBLti0/i2QEDYzVYtZViiiuhOh2XjXREwz
 GN/4fsKXSKRItdlv6mOkjrK2pau0i9kxqcOgueD4CmIL3Z4lZk7BNWlH9MF3dtBMZeQu
 C67PE82tSGdLdMlBLEqnPTiCSraXzfltzNUhvoPdwOmzI+5yDrQBnX0yfs65i7JP/eC7
 8KCg==
X-Gm-Message-State: ABy/qLbW4yOJ9YCrtWxYfJ1VZvkjRyaI7wUt0zEMm80u28rkK1Dh0Ub5
 tzWaof3dZykKQdJSKjioTjSFOOe7fZair+W6hX4=
X-Google-Smtp-Source: APBJJlG4kEIE9+L4K9I3qpDvgrniK4lv3rFr3CmpqBIzXWyBnGue4o8nlEF85TgW7NuQkBwv9nyNeQ3tvFDxxDTDqSE=
X-Received: by 2002:a19:6703:0:b0:4f9:7aee:8dc5 with SMTP id
 b3-20020a196703000000b004f97aee8dc5mr10604774lfc.19.1689743842233; Tue, 18
 Jul 2023 22:17:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230707215851.590754-1-lyude@redhat.com>
In-Reply-To: <20230707215851.590754-1-lyude@redhat.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Wed, 19 Jul 2023 15:17:10 +1000
Message-ID: <CACAvsv743W4i8ad=orgoUy+Hox0z2CL9rXw18od-oeiB=b25Xg@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/nvkm/dp: Add hack to fix DP 1.3+ DPCD issues
To: Lyude Paul <lyude@redhat.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 8 Jul 2023 at 07:59, Lyude Paul <lyude@redhat.com> wrote:
>
> Currently we use the drm_dp_dpcd_read_caps() helper in the DRM side of
> nouveau in order to read the DPCD of a DP connector, which makes sure we do
> the right thing and also check for extended DPCD caps. However, it turns
> out we're not currently doing this on the nvkm side since we don't have
> access to the drm_dp_aux structure there - which means that the DRM side of
> the driver and the NVKM side can end up with different DPCD capabilities
> for the same connector.
>
> Ideally to fix this, we want to start setting up the drm_dp_aux device in
> NVKM before we've made contact with the DRM side - which should be pretty
> easy to accomplish (I'm already working on it!). Until then however, let's
> workaround this problem by porting a copy of drm_dp_read_dpcd_caps() into
> NVKM - which should fix this issue.
I wouldn't worry about this.  I'm moving basically everything to the
DRM side of the driver for the GSP work anyway.

Ben.
>
> Issue: https://gitlab.freedesktop.org/drm/nouveau/-/issues/211
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c | 48 ++++++++++++++++++-
>  1 file changed, 47 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
> index 40c8ea43c42f..b8ac66b4a2c4 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
> @@ -26,6 +26,8 @@
>  #include "head.h"
>  #include "ior.h"
>
> +#include <drm/display/drm_dp.h>
> +
>  #include <subdev/bios.h>
>  #include <subdev/bios/init.h>
>  #include <subdev/gpio.h>
> @@ -634,6 +636,50 @@ nvkm_dp_enable_supported_link_rates(struct nvkm_outp *outp)
>         return outp->dp.rates != 0;
>  }
>
> +/* XXX: This is a big fat hack, and this is just drm_dp_read_dpcd_caps()
> + * converted to work inside nvkm. This is a temporary holdover until we start
> + * passing the drm_dp_aux device through NVKM
> + */
> +static int
> +nvkm_dp_read_dpcd_caps(struct nvkm_outp *outp)
> +{
> +       struct nvkm_i2c_aux *aux = outp->dp.aux;
> +       u8 dpcd_ext[DP_RECEIVER_CAP_SIZE];
> +       int ret;
> +
> +       ret = nvkm_rdaux(aux, DPCD_RC00_DPCD_REV, outp->dp.dpcd, DP_RECEIVER_CAP_SIZE);
> +       if (ret < 0)
> +               return ret;
> +
> +       /*
> +        * Prior to DP1.3 the bit represented by
> +        * DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT was reserved.
> +        * If it is set DP_DPCD_REV at 0000h could be at a value less than
> +        * the true capability of the panel. The only way to check is to
> +        * then compare 0000h and 2200h.
> +        */
> +       if (!(outp->dp.dpcd[DP_TRAINING_AUX_RD_INTERVAL] &
> +             DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT))
> +               return 0;
> +
> +       ret = nvkm_rdaux(aux, DP_DP13_DPCD_REV, dpcd_ext, sizeof(dpcd_ext));
> +       if (ret < 0)
> +               return ret;
> +
> +       if (outp->dp.dpcd[DP_DPCD_REV] > dpcd_ext[DP_DPCD_REV]) {
> +               OUTP_DBG(outp, "Extended DPCD rev less than base DPCD rev (%d > %d)\n",
> +                        outp->dp.dpcd[DP_DPCD_REV], dpcd_ext[DP_DPCD_REV]);
> +               return 0;
> +       }
> +
> +       if (!memcmp(outp->dp.dpcd, dpcd_ext, sizeof(dpcd_ext)))
> +               return 0;
> +
> +       memcpy(outp->dp.dpcd, dpcd_ext, sizeof(dpcd_ext));
> +
> +       return 0;
> +}
> +
>  void
>  nvkm_dp_enable(struct nvkm_outp *outp, bool auxpwr)
>  {
> @@ -689,7 +735,7 @@ nvkm_dp_enable(struct nvkm_outp *outp, bool auxpwr)
>                         memset(outp->dp.lttpr, 0x00, sizeof(outp->dp.lttpr));
>                 }
>
> -               if (!nvkm_rdaux(aux, DPCD_RC00_DPCD_REV, outp->dp.dpcd, sizeof(outp->dp.dpcd))) {
> +               if (!nvkm_dp_read_dpcd_caps(outp)) {
>                         const u8 rates[] = { 0x1e, 0x14, 0x0a, 0x06, 0 };
>                         const u8 *rate;
>                         int rate_max;
> --
> 2.40.1
>
