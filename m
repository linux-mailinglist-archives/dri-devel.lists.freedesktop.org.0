Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 959C51E67CB
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 18:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B1B6E16F;
	Thu, 28 May 2020 16:50:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4596E16F
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 16:50:50 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id g129so1164603vsc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 09:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f5YqV7XjlDM8vbF9Dfpav+WtGNd+4VB6sph5ZdA7tyU=;
 b=b92CI57gDW8+Q4Pa+tbZIJTtAkQCMy3BHm33U6jLex0gxfliqop5T0LskBwZb6M4Qx
 41v+FknbeJ7EmimwOpu/0JkdwT5/PC3OHReL8Ith2FKxrniYRL4kBginVD7MlVjcBVmz
 UgQFIOx03sAlnhGvmE+q5899q/4kIYQd2ieAxIW+lKajQOAlLUeICFcFEzM9RUeZ/veq
 60EklUeuoGHKQP0bgnYbxH3gHPN6vnkSyPY/l5D69P9dWL3kizp9BVN5yjtPh9Wzph9K
 VTBQd/WLiqjlCHGWivtYAyGbV9J8tyx/+n78UtQF/i+vwNdE7E/zmfYi21yD30SRY6lg
 RtBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f5YqV7XjlDM8vbF9Dfpav+WtGNd+4VB6sph5ZdA7tyU=;
 b=IxvOmGymohsxB5/M+cFVsl/2LECOIeWy60pfccf7pjej9LXKmCB3Hq2Bn80rXFv9Ri
 rMlkE5YTLvkPNiS0QThr4lxMmSc9Ty7rtznPf+znLlgVPfp/XdIas1HSPTmw1XC+diFU
 fOLzzivaWEpJChzSZrSmFWj0kYMKdQzhgzV/e5fLWKria7FQfdChWVO5T69NuejHBwGL
 N5v/2RdT9me91foH4qdU2/oJMw00xEb9MCmoz2qQ9yo0wolPbfYBcdeIH+SmTStGG1dY
 FhgKZ+ttAN2qCLfs0L1YpS4Ljguaw8/0GViNfjkYkbmetoHhhEVnr73boaX9c0b6xylE
 QThA==
X-Gm-Message-State: AOAM530IfB80JgwVOgXZofDO2+fZUm2ucDyR2CUuvxYxXfchu2976CgL
 mB0/ObesrE7K44t/Q+eDIXbSyXnUfoKMkMu48jCaog==
X-Google-Smtp-Source: ABdhPJwqdlOfJtH5bVZK6pkMsucBTkyJlbHzRfgIPu02D161OXw0zV8xZe2IaUB9XCjtmm0HB/2J5Otk29c9nWHd75o=
X-Received: by 2002:a67:71c2:: with SMTP id m185mr2876118vsc.186.1590684649107; 
 Thu, 28 May 2020 09:50:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200505160329.2976059-1-emil.l.velikov@gmail.com>
In-Reply-To: <20200505160329.2976059-1-emil.l.velikov@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 28 May 2020 17:47:41 +0100
Message-ID: <CACvgo53nBpP_cHp=kvBQJnCacdqPfOVxbTf1_x=KhiCyNzbWuQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/dsi: use stack buffer in mipi_dsi_dcs_write()
To: ML dri-devel <dri-devel@lists.freedesktop.org>
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
Cc: Jani Nikula <jani.nikula@intel.com>, Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 5 May 2020 at 17:05, Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> Currently the function heap allocates when we have any payload. Where in
> many case the payload is 1 byte - ouch.
>
> From casual observation, vast majority of the payloads are smaller than
> 8 bytes - so use a stack array tx[8] to avoid the senseless kmalloc and
> kfree dance.
>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
> index 55531895dde6..b96d5b4629d7 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -748,26 +748,26 @@ ssize_t mipi_dsi_dcs_write(struct mipi_dsi_device *dsi, u8 cmd,
>  {
>         ssize_t err;
>         size_t size;
> +       u8 stack_tx[8];
>         u8 *tx;
>
> -       if (len > 0) {
> -               size = 1 + len;
> -
> +       size = 1 + len;
> +       if (len > ARRAY_SIZE(stack_tx) - 1) {
>                 tx = kmalloc(size, GFP_KERNEL);
>                 if (!tx)
>                         return -ENOMEM;
> -
> -               /* concatenate the DCS command byte and the payload */
> -               tx[0] = cmd;
> -               memcpy(&tx[1], data, len);
>         } else {
> -               tx = &cmd;
> -               size = 1;
> +               tx = stack_tx;
>         }
>
> +       /* concatenate the DCS command byte and the payload */
> +       tx[0] = cmd;
> +       if (data)
> +               memcpy(&tx[1], data, len);
> +
>         err = mipi_dsi_dcs_write_buffer(dsi, tx, size);
>
> -       if (len > 0)
> +       if (tx != stack_tx)
>                 kfree(tx);
>
>         return err;
> --

Thierry, others - humble ping.
Can you check through the series?

Thanks
Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
