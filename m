Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E38278CF877
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 06:38:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF2F910F852;
	Mon, 27 May 2024 04:38:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="afyy0cyt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4967610F852
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 04:38:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1A1476108A
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 04:38:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 914C4C4AF0B
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 04:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716784695;
 bh=6IacDSA331WDJCmgAXz+7uyzyFmY9XJJszdZAzteIhQ=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=afyy0cytWcIqw9emc+8VUZeurDI3LCx/dFcD64Hxgp8gqQ7U6lanAdrkTSegtiwhH
 sFG6jVQ47A91x2x/sJRzwBjad3aiTnBTWMNtK9CF+yjQfdxo60UR2TI/DcEWmIGIKg
 PhHiAp7DFYUybsCmRR2e2cKWj5Gx2hZUg9ubFQbuUn0CnliM55S6FHr0K4VNTDLyxG
 wsxkgWiwz/tmYKQ4lDb+PcIyi13UIYh7Ksmy2DqLJ55zL+iaSJt4ea/+UjNAcMN/9B
 sWCJXBCiwhamrnfvAjmlQ//pyx7eBeJn2wYiF46fDGBCjV9h2i8JCHOfYcKfOQCQe1
 /EpV93tVgyVJw==
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2e73359b900so74297281fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2024 21:38:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWHU3vqwlNY7wG7u1bJdCwM5EtRwiA7vY1hYwVMHCeV+r9DjcsJPuizRrsMqrzrxSytSekvOXwNzw9v0jVCaecfc8D0eE6U43BdO/0hQoOI
X-Gm-Message-State: AOJu0YzSJXfi+hVikTwI8Ep6wKpJcmMa31tnlYMrKrK7ilPzPCEFJxVZ
 ifwrosOaj+yNmhfAvU8S1yjZpGHriSR8mQG/lazpYc6hmb1QqgTynTsH0/K37aBFHvVp2RY4T7o
 OiXvArFWn1I4YGwuJOzM5yuUXv4w=
X-Google-Smtp-Source: AGHT+IGjrHFHsZ9tmyPSaUxkwYd4Npht2+QF0TJ6wi8gmagtuKuANSbtuWVM6wGY+0dXyjAjpIkdHCNisdkXmxAIA3k=
X-Received: by 2002:a2e:9215:0:b0:2e2:f6e6:ada2 with SMTP id
 38308e7fff4ca-2e95b096df8mr59157451fa.8.1716784693818; Sun, 26 May 2024
 21:38:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240502103848.5845-1-shawn.sung@mediatek.com>
 <20240502103848.5845-6-shawn.sung@mediatek.com>
 <CAC=S1ngUh-o107YM8zEu-ebaP7+eaO1x6SsZ6OeRxrH5YgFKxw@mail.gmail.com>
In-Reply-To: <CAC=S1ngUh-o107YM8zEu-ebaP7+eaO1x6SsZ6OeRxrH5YgFKxw@mail.gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 27 May 2024 12:38:01 +0800
X-Gmail-Original-Message-ID: <CAGb2v67TZSoQnEMhUNKhnbkwK2=9yCPcwnLD-iHuRp6=Y2ez2Q@mail.gmail.com>
Message-ID: <CAGb2v67TZSoQnEMhUNKhnbkwK2=9yCPcwnLD-iHuRp6=Y2ez2Q@mail.gmail.com>
Subject: Re: [PATCH v7 05/18] drm/mediatek: Set DRM mode configs accordingly
To: Fei Shao <fshao@chromium.org>
Cc: Shawn Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Bibby Hsieh <bibby.hsieh@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 "Nancy . Lin" <nancy.lin@mediatek.com>, Sean Paul <sean@poorly.run>, 
 Jason Chen <jason-ch.chen@mediatek.corp-partner.google.com>, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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
Reply-To: wens@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 27, 2024 at 12:34=E2=80=AFPM Fei Shao <fshao@chromium.org> wrot=
e:
>
> Hi Shawn,
>
> On Thu, May 2, 2024 at 6:39=E2=80=AFPM Shawn Sung <shawn.sung@mediatek.co=
m> wrote:
> >
> > From: Hsiao Chien Sung <shawn.sung@mediatek.com>
> >
> > Set DRM mode configs limitation according to the hardware capabilities
> > and pass the IGT checks as below:
> >
> > - The test "graphics.IgtKms.kms_plane" requires a frame buffer with
> >   width of 4512 pixels (> 4096).
> > - The test "graphics.IgtKms.kms_cursor_crc" checks if the cursor size i=
s
> >   defined, and run the test with cursor size from 1x1 to 512x512.
> >
> > Please notice that the test conditions may change as IGT is updated.
> >
> > Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 22 ++++++++++++++++++++++
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.h |  4 ++++
> >  2 files changed, 26 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/m=
ediatek/mtk_drm_drv.c
> > index 8e047043202b4..c9cad3a827376 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > @@ -294,6 +294,9 @@ static const struct mtk_mmsys_driver_data mt8188_vd=
osys0_driver_data =3D {
> >         .conn_routes =3D mt8188_mtk_ddp_main_routes,
> >         .num_conn_routes =3D ARRAY_SIZE(mt8188_mtk_ddp_main_routes),
> >         .mmsys_dev_num =3D 2,
> > +       .max_width =3D 8191,
> > +       .min_width =3D 1,
> > +       .min_height =3D 1,
> >  };
> >
> >  static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data =3D=
 {
> > @@ -308,6 +311,9 @@ static const struct mtk_mmsys_driver_data mt8195_vd=
osys0_driver_data =3D {
> >         .main_path =3D mt8195_mtk_ddp_main,
> >         .main_len =3D ARRAY_SIZE(mt8195_mtk_ddp_main),
> >         .mmsys_dev_num =3D 2,
> > +       .max_width =3D 8191,
> > +       .min_width =3D 1,
> > +       .min_height =3D 1,
> >  };
> >
> >  static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data =
=3D {
> > @@ -315,6 +321,9 @@ static const struct mtk_mmsys_driver_data mt8195_vd=
osys1_driver_data =3D {
> >         .ext_len =3D ARRAY_SIZE(mt8195_mtk_ddp_ext),
> >         .mmsys_id =3D 1,
> >         .mmsys_dev_num =3D 2,
> > +       .max_width =3D 8191,
> > +       .min_width =3D 2, /* 2-pixel align when ethdr is bypassed */
> > +       .min_height =3D 1,
> >  };
> >
> >  static const struct of_device_id mtk_drm_of_ids[] =3D {
> > @@ -493,6 +502,15 @@ static int mtk_drm_kms_init(struct drm_device *drm=
)
> >                 for (j =3D 0; j < private->data->mmsys_dev_num; j++) {
> >                         priv_n =3D private->all_drm_private[j];
> >
> > +                       if (priv_n->data->max_width)
> > +                               drm->mode_config.max_width =3D priv_n->=
data->max_width;
> > +
> > +                       if (priv_n->data->min_width)
> > +                               drm->mode_config.min_width =3D priv_n->=
data->min_width;
> > +
> > +                       if (priv_n->data->min_height)
> > +                               drm->mode_config.min_height =3D priv_n-=
>data->min_height;
> > +
> >                         if (i =3D=3D CRTC_MAIN && priv_n->data->main_le=
n) {
> >                                 ret =3D mtk_crtc_create(drm, priv_n->da=
ta->main_path,
> >                                                       priv_n->data->mai=
n_len, j,
> > @@ -520,6 +538,10 @@ static int mtk_drm_kms_init(struct drm_device *drm=
)
> >                 }
> >         }
> >
> > +       /* IGT will check if the cursor size is configured */
> > +       drm->mode_config.cursor_width =3D drm->mode_config.max_width;
> > +       drm->mode_config.cursor_height =3D drm->mode_config.max_height;
>
> I think you shouldn't set the cursor size to the maximum plane size.
> As you mentioned in the commit message, IGT tests the cursor sizes
> from 1x1 to 512x512, so just setting them to 512 (with a macro) should
> be enough.
>
> Currently this tells the userspace "the supported cursor plane size is
> up to 4096x8191" on MT8195 and MT8188.
> That means the userspace may allocate a buffer with 4096*8191*4 ~=3D
> 128MB for the cursor plane in the worst case, and most of the buffer
> will be wasted.
> Note that the default value for DRM_CAP_CURSOR_WIDTH is 64.
>
> In practice, when applying this on the MT8188 Chromebook, I see the
> userspace allocates two 64MB buffers for the cursor plane.
> But if I limit the cursor size to 512, the userspace only allocates
> two 1MB buffers i.e. 126MB is optimized for the DMA buffer allocation.

That seems more like an issue of ChromeOS not doing the most optimal
thing though?

> Regards,
> Fei
>
>
> >
> > +
> >         /* Use OVL device for all DMA memory allocations */
> >         crtc =3D drm_crtc_from_index(drm, 0);
> >         if (crtc)
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/m=
ediatek/mtk_drm_drv.h
> > index 78d698ede1bf8..6cfa790e8df5c 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> > @@ -46,6 +46,10 @@ struct mtk_mmsys_driver_data {
> >         bool shadow_register;
> >         unsigned int mmsys_id;
> >         unsigned int mmsys_dev_num;
> > +
> > +       int max_width;
> > +       int min_width;
> > +       int min_height;
> >  };
> >
> >  struct mtk_drm_private {
> > --
> > 2.18.0
> >
