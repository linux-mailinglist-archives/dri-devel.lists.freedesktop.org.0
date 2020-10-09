Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECB4288403
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 09:54:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD126EC6F;
	Fri,  9 Oct 2020 07:54:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85B9C6EC6F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 07:54:55 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id y9so32689qvk.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 00:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nJVCJIrDMcYNbThERkU3I1bvdWzLRwtq/qq14NyZ9S0=;
 b=IlnrkyjWt6lJyj9SN3tFQ2hhVavOsjOPqONXvcHDky4h6z740xEgb787GGmoagXtf5
 vTBKpF8sr9IxjCd3z1ltKIa8ZJxJ5TksDY8TfWbsZTkYdO+ydrVxqkNwhg/LmsLPGwXi
 LAOa2Q3f9g3QMNRLbofNpQ1ZwNFWoHhMlI4J4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nJVCJIrDMcYNbThERkU3I1bvdWzLRwtq/qq14NyZ9S0=;
 b=QkIJJu7XEqZ1TwHvBAqNHXuDNEeC9Yn31yd5gCXrafmQn4vdI5xe6r8CaaACvVjNgn
 x+lWm4yj6XEMzfmKpeeViEmbozilMDo2+Fj2osxCXn5e1PHmAk4T/tVAhq1n4uOd3We5
 G3wndvuY0q2yqN+b5MSP/Z/nGbhuDa3FwyoyuycrOFkpE4VCgpMxbnfTjT6XBNWM+9ze
 AJceGa6XC01fFS9UhU5XqlFctCeyRgNIhZpqjZA9giNWBr92vFJKU/On5Qf83By6zzme
 lS3KLDvvTQqh3n5G7GTDpDGKhCIWA8zL3C8eRUi7HiEtVkq3mTuUo5JTD700nkR6mD+Z
 A42w==
X-Gm-Message-State: AOAM531BGLVOX9nWZZi+gKsIAuYEUvo1hJAKyzUGGdjRE6nyElMNT6ud
 4YouESzsi7Z8B5AHUzkP76kYg1xr1clJO4zhW9w=
X-Google-Smtp-Source: ABdhPJzlDUJipCJ9OYZ3/ltCZjn3+bPAxZxsG/38fXSejf9ukBkyEora6nsNVz8tW4sZA+vE6Kzefaz2zpX3dzHy0WI=
X-Received: by 2002:a0c:90f1:: with SMTP id p104mr11789501qvp.16.1602230094606; 
 Fri, 09 Oct 2020 00:54:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200522135246.10134-1-tzimmermann@suse.de>
 <20200522135246.10134-5-tzimmermann@suse.de>
In-Reply-To: <20200522135246.10134-5-tzimmermann@suse.de>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 9 Oct 2020 07:54:42 +0000
Message-ID: <CACPK8XcGOAjocCMp9ubgQpfiBaqSj61i_frSU7ZdiKO_uSt-hQ@mail.gmail.com>
Subject: Re: [PATCH 04/21] drm/aspeed: Set driver CMA functions with
 DRM_GEM_CMA_DRIVER_OPS
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, narmstrong@baylibre.com,
 David Airlie <airlied@linux.ie>, liviu.dudau@arm.com, philippe.cornu@st.com,
 paul@crapouillou.net, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 mihail.atanassov@arm.com, Sam Ravnborg <sam@ravnborg.org>,
 alexandre.torgue@st.com, Marek Vasut <marex@denx.de>, abrodkin@synopsys.com,
 Ludovic Desroches <ludovic.desroches@microchip.com>, xinliang.liu@linaro.org,
 kong.kongxinwei@hisilicon.com, tomi.valkeinen@ti.com, james.qian.wang@arm.com,
 NXP Linux Team <linux-imx@nxp.com>, puck.chen@hisilicon.com,
 Sascha Hauer <s.hauer@pengutronix.de>, alison.wang@nxp.com, jsarha@ti.com,
 Chen-Yu Tsai <wens@csie.org>, vincent.abriou@st.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 dri-devel@lists.freedesktop.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 yannick.fertre@st.com, kieran.bingham+renesas@ideasonboard.com,
 Kevin Hilman <khilman@baylibre.com>, zourongrong@gmail.com,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 22 May 2020 at 13:52, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> DRM_GEM_CMA_DRIVER_OPS sets the functions in struct drm_driver
> to their defaults. No functional changes are made.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

I just found this in my inbox. I assume it has not been applied as you
were after a review.

Reviewed-by: Joel Stanley <joel@jms.id.au>

I will apply it to drm-misc-next.

Cheers,

Joel

> ---
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> index 6b27242b9ee3c..1167ff78e24a3 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> @@ -188,12 +188,7 @@ DEFINE_DRM_GEM_CMA_FOPS(fops);
>
>  static struct drm_driver aspeed_gfx_driver = {
>         .driver_features        = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> -       .gem_create_object      = drm_cma_gem_create_object_default_funcs,
> -       .dumb_create            = drm_gem_cma_dumb_create,
> -       .prime_handle_to_fd     = drm_gem_prime_handle_to_fd,
> -       .prime_fd_to_handle     = drm_gem_prime_fd_to_handle,
> -       .gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table,
> -       .gem_prime_mmap         = drm_gem_prime_mmap,
> +       DRM_GEM_CMA_DRIVER_OPS,
>         .fops = &fops,
>         .name = "aspeed-gfx-drm",
>         .desc = "ASPEED GFX DRM",
> --
> 2.26.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
