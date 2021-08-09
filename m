Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B643E4628
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 15:09:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 493A5898F1;
	Mon,  9 Aug 2021 13:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3344D899A5;
 Mon,  9 Aug 2021 13:09:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 06B8861004;
 Mon,  9 Aug 2021 13:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628514551;
 bh=YzG7BnFCln4Yyp6LxrxvxeyUMj5GmzMjIhVfIPMKSYc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=B8pvYpwPzQ18zhH2+y0BGlUA/OJhSA/B0e0InC/nca080ep3tJvTyYkjw4iA0bIXy
 YJkfsyL7WJqFEvGlYZsDdfkS8W4gkzs2dxMYwyXUt2VpcSaAsgcNhIj8ai/6CAVUZ2
 ldHAUzQEOhshkYgfdQv79fOgiKArwiLUzaIB6uXf33e9Dwx6fJNaNUWADrL3Q2AY27
 Bl9LecINy6PsqQyvEgFzW02xNT9GIlS0Tp9TuaVC5l/yfox0JcJblrMOq9WQey5+Yx
 UjWS8SLAwRaq9m1jBvtg7XtqOaG9lvGylZ+m8LNCf4Md/cmndcHE0D+U5Qp6wYUHub
 B20Q3cXMUBSvw==
Received: by mail-wr1-f52.google.com with SMTP id k29so8563403wrd.7;
 Mon, 09 Aug 2021 06:09:10 -0700 (PDT)
X-Gm-Message-State: AOAM530HpmV+f8Lh1ZWrTeqml6bwZ6koMhJehP2RdxsiCeeG/g/Hr4PY
 pnLbIq1I4YazeQco2P15ALRqmfHsVz9MYathnA==
X-Google-Smtp-Source: ABdhPJzottn9lR1w4Ou5tspJmaMhExuHvfqLuRluAKs7dQZoer2iHn4k6bWFWu6HusN3FgH38v3t3o0558IoBlRW8NU=
X-Received: by 2002:a17:906:4156:: with SMTP id
 l22mr6919385ejk.75.1628514539014; 
 Mon, 09 Aug 2021 06:08:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210625082222.3845-1-tzimmermann@suse.de>
 <20210625082222.3845-14-tzimmermann@suse.de>
In-Reply-To: <20210625082222.3845-14-tzimmermann@suse.de>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 9 Aug 2021 21:08:48 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8Y7VZm2JWtPXVGfsPQ-j72wMULQJHCHdmQEV+a=TyW1Q@mail.gmail.com>
Message-ID: <CAAOTY_8Y7VZm2JWtPXVGfsPQ-j72wMULQJHCHdmQEV+a=TyW1Q@mail.gmail.com>
Subject: Re: [PATCH v4 13/27] drm/mediatek: Don't set struct
 drm_device.irq_enabled
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui.Pan@amd.com, james.qian.wang@arm.com, liviu.dudau@arm.com, 
 mihail.atanassov@arm.com, brian.starkey@arm.com, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 krzysztof.kozlowski@canonical.com, xinliang.liu@linaro.org, 
 tiantao6@hisilicon.com, john.stultz@linaro.org, kong.kongxinwei@hisilicon.com, 
 puck.chen@hisilicon.com, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 NXP Linux Team <linux-imx@nxp.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, 
 Tomi Valkeinen <tomba@kernel.org>, Sandy Huang <hjc@rock-chips.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, jonathanh@nvidia.com, 
 Jyri Sarha <jyri.sarha@iki.fi>, emma@anholt.net,
 linux-graphics-maintainer@vmware.com, 
 zackr@vmware.com, hyun.kwon@xilinx.com, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, michal.simek@xilinx.com, 
 jani.nikula@linux.intel.com, rodrigo.vivi@intel.com, 
 Russell King <linux@armlinux.org.uk>, kieran.bingham+renesas@ideasonboard.com, 
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, amd-gfx@lists.freedesktop.org, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-samsung-soc@vger.kernel.org, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 nouveau@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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

Hi, Thomas:

Thomas Zimmermann <tzimmermann@suse.de> =E6=96=BC 2021=E5=B9=B46=E6=9C=8825=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=884:22=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> The field drm_device.irq_enabled is only used by legacy drivers
> with userspace modesetting. Don't set it in mediatek.
>

Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index b46bdb8985da..9b60bec33d3b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -270,12 +270,6 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>                 goto err_component_unbind;
>         }
>
> -       /*
> -        * We don't use the drm_irq_install() helpers provided by the DRM
> -        * core, so we need to set this manually in order to allow the
> -        * DRM_IOCTL_WAIT_VBLANK to operate correctly.
> -        */
> -       drm->irq_enabled =3D true;
>         ret =3D drm_vblank_init(drm, MAX_CRTC);
>         if (ret < 0)
>                 goto err_component_unbind;
> --
> 2.32.0
>
