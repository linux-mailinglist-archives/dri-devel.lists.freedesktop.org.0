Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52932A4C976
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 18:29:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44BB710E4C7;
	Mon,  3 Mar 2025 17:29:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Evfmqh1B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9807A10E4B0
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 17:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741022981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fknoquM4HNPBtsYGt0/DMnFH0+dEPH8rOlkay8lH1H4=;
 b=Evfmqh1BSG0AxWre3f6ojhB82hcZlK902kVCjTiXuN9i3TPKYl2Dyyc3bAOEA8JCrNYke3
 OOTs3Owz1W2vjG+8dRvTp5wHQf2Y5/1Kjb8IxtyHiXv6ZqKT0SKifCuxw/WGinurwXpasN
 02sIRf4V7XZkDx8JuUm/b+8gy4xvIuY=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-222-FYzlPP6wM9-dLKwLf9luPQ-1; Mon, 03 Mar 2025 12:29:32 -0500
X-MC-Unique: FYzlPP6wM9-dLKwLf9luPQ-1
X-Mimecast-MFC-AGG-ID: FYzlPP6wM9-dLKwLf9luPQ_1741022971
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-6f2793679ebso56066717b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 09:29:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741022971; x=1741627771;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fknoquM4HNPBtsYGt0/DMnFH0+dEPH8rOlkay8lH1H4=;
 b=b9iS1a0Fa7LHvpmm8ZDYElr7HLXtV5rvPYhuwxUNc9RvIljwHGqS9A3RmzGjSWrv40
 NIgqNBXkEZAT1nPzvR6jLzqa8rzvjChV8b4Yj+ZCPG/fnv+kcmf3wTZwrK9RIJWAwkdd
 o7nUvDbGOilDejKB6UaZe4+Jryiw6j0dwWxq1ScpGn1gwpF/lZXlHBvfblTeO40fFTqu
 L1JHLeHXNt7nEGjv/jkZKW0so9UFdO6+raYJVonQ2n0LqU7IDYJVibcyicAyVtxJXS0a
 rhKdna/0isjq/poPB3PyYG0EBU0p8udnSVt+1hrCiLGA6uA6O/TtgluU/GtL+yJ368LR
 dogw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7KjE04oK73Z3S/Rj5nOi1s3VNvutZDuzfjMhd3Oc7qfCDDWvRxJ2fiDPUOfCg26pJMitPuhCQiLw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWpduEq/JHrK92Vn+UiOeDpMvn4AKo9EpHFUVu6p+93mq5MJpM
 EGDP80XdkP8dI3bd+PeLTZebI/HegJHcAzTMaRel+CcotIIJqmHd3S/YWUnnCajxmIkoyHViod7
 /qRoBbCOrmR4k4WpVigoieshQujj1rZ8SODnruFSrKwXvr9JbAKH4BUjCj5s0E84pGoJhFuDs8H
 qKyGeOiInVVh+3/6BoyzDsvSLXyrbi7hkcDy4uKweH
X-Gm-Gg: ASbGncuvPKWh5Cy9S7oFSf9mojrXa51K+TnPlGF3TNOfUE0Vy4w2BEoFLMXW8CuLT3k
 2LTCTK8p3Ifi5yvkcYZDngwNQgoe5qElfPX2UCQdQnKsOT2iwSuNGkeokkDIX0KaIUjpEA/4=
X-Received: by 2002:a05:690c:6912:b0:6fd:3fd0:6f4d with SMTP id
 00721157ae682-6fd4a0bd6d5mr197126537b3.26.1741022971464; 
 Mon, 03 Mar 2025 09:29:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEitH9aEWJ+qG/9z4a5kdmAZQKGZ+U/x7f6AMH3AjCMHyi0yDTUtDSbkw1Iw4XvHtAqN3hS5a439MFySru2o+8=
X-Received: by 2002:a05:690c:6912:b0:6fd:3fd0:6f4d with SMTP id
 00721157ae682-6fd4a0bd6d5mr197126027b3.26.1741022971048; Mon, 03 Mar 2025
 09:29:31 -0800 (PST)
MIME-Version: 1.0
References: <20250225-memory-drm-misc-next-v1-0-9d0e8761107a@redhat.com>
 <20250225-memory-drm-misc-next-v1-7-9d0e8761107a@redhat.com>
 <24958ae8-6153-4798-abeb-e770d66ca8e4@foss.st.com>
In-Reply-To: <24958ae8-6153-4798-abeb-e770d66ca8e4@foss.st.com>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Mon, 3 Mar 2025 12:29:19 -0500
X-Gm-Features: AQ5f1Johe5mKdrN6JeFaOimn0fTUub6Bmoa-niuGqxRMqBj6fp0gOenjXNq9T2I
Message-ID: <CAN9Xe3Q8=_Tz51i6gxNM6445p-rhNiK7B5Ljcga8g_Nn676dCQ@mail.gmail.com>
Subject: Re: [PATCH RESEND 07/12] drm/sti: move to
 devm_platform_ioremap_resource() usage
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: Joel Stanley <joel@jms.id.au>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>, Xinliang Liu <xinliang.liu@linaro.org>, 
 Tian Tao <tiantao6@hisilicon.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, 
 John Stultz <jstultz@google.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Marek Vasut <marex@denx.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Jonathan Corbet <corbet@lwn.net>, 
 linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, 
 linux-doc@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TrRjKsGi_uG9J-U-k8JiwM2ujdQ5ziTKooRsgIRJYmI_1741022971
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000bc509b062f737f75"
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

--000000000000bc509b062f737f75
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 5:19=E2=80=AFAM Raphael Gallais-Pou <
raphael.gallais-pou@foss.st.com> wrote:

>
> On 2/25/25 23:20, Anusha Srivatsa wrote:
> > Replace platform_get_resource/_byname + devm_ioremap
> > with just devm_platform_ioremap_resource()
> >
> > Used Coccinelle to do this change. SmPl patch:
> >
> > @rule@
> > identifier res;
> > expression ioremap;
> > identifier pdev;
> > constant mem;
> > expression name;
> > @@
> > -struct resource *res;
> > ...
> > -res =3D platform_get_resource_byname(pdev,mem,name);
> > <...
> > -if (!res) {
> > -...
> > -}
> > ...>
> > -ioremap =3D devm_ioremap(...);
> > +ioremap =3D devm_platform_ioremap_resource_byname(pdev,name);
> >
> > and
> > @rule_2@
> > identifier res;
> > expression ioremap;
> > identifier pdev;
> > @@
> > -struct resource *res;
> > ...
> > -res =3D platform_get_resource(pdev,...);
> > <...
> > -if (!res) {
> > -...
> > -}
> > ...>
> > -ioremap =3D devm_ioremap(...);
> > +ioremap =3D devm_platform_ioremap_resource(pdev,0);
> >
> > v2: Fix compilation error.
>
>
> Hi Anusha,
>
>
> You did not take into account my comment regarding the changelog. :-)
>
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#co=
mmentary
>
> While the commit summary do not specify the version, this changelog
> suggests
> that the version of your series as been incremented.
> If this is a v2, then a version descriptor should be applied to the
> patchset.
>
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#su=
bject-line
>
> Hi  Raphael,

That is correct. While this patch is a v2, there is another patch or two in
the same series that is on v4 when it got acked and reviewed. Having
patches belonging to the same series with different version prefixes seemed
odd when I sent the series. Hence added what exactly changed in the commit
log.

Anusha


> Regards,
> Rapha=C3=ABl
>
> >
> > Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> > Cc: Alain Volmat <alain.volmat@foss.st.com>
> > Reviewed-by: Maxime Ripard <mripard@kernel.org>
> > Acked-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> > ---
> >  drivers/gpu/drm/sti/sti_compositor.c | 10 +---------
> >  drivers/gpu/drm/sti/sti_dvo.c        | 10 +---------
> >  drivers/gpu/drm/sti/sti_hda.c        |  9 +--------
> >  drivers/gpu/drm/sti/sti_hdmi.c       | 11 +----------
> >  drivers/gpu/drm/sti/sti_hqvdp.c      | 10 +---------
> >  drivers/gpu/drm/sti/sti_tvout.c      | 10 +---------
> >  drivers/gpu/drm/sti/sti_vtg.c        | 10 +---------
> >  7 files changed, 7 insertions(+), 63 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/sti/sti_compositor.c
> b/drivers/gpu/drm/sti/sti_compositor.c
> > index
> 063f82d23d80c4ba83624a0066a18416a2b37351..7aefce6706ba2cd7d97a33228c9b981=
2edecf06f
> 100644
> > --- a/drivers/gpu/drm/sti/sti_compositor.c
> > +++ b/drivers/gpu/drm/sti/sti_compositor.c
> > @@ -177,7 +177,6 @@ static int sti_compositor_probe(struct
> platform_device *pdev)
> >       struct device_node *np =3D dev->of_node;
> >       struct device_node *vtg_np;
> >       struct sti_compositor *compo;
> > -     struct resource *res;
> >       unsigned int i;
> >
> >       compo =3D devm_kzalloc(dev, sizeof(*compo), GFP_KERNEL);
> > @@ -194,14 +193,7 @@ static int sti_compositor_probe(struct
> platform_device *pdev)
> >
> >       memcpy(&compo->data, of_match_node(compositor_of_match, np)->data=
,
> >              sizeof(struct sti_compositor_data));
> > -
> > -     /* Get Memory ressources */
> > -     res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > -     if (res =3D=3D NULL) {
> > -             DRM_ERROR("Get memory resource failed\n");
> > -             return -ENXIO;
> > -     }
> > -     compo->regs =3D devm_ioremap(dev, res->start, resource_size(res))=
;
> > +     compo->regs =3D devm_platform_ioremap_resource(pdev, 0);
> >       if (compo->regs =3D=3D NULL) {
> >               DRM_ERROR("Register mapping failed\n");
> >               return -ENXIO;
> > diff --git a/drivers/gpu/drm/sti/sti_dvo.c
> b/drivers/gpu/drm/sti/sti_dvo.c
> > index
> 4dcddd02629b6a1052be8fb8333bd3aa17c083c5..c877298a7f2bad171724eca4d43ea62=
2db4c81cd
> 100644
> > --- a/drivers/gpu/drm/sti/sti_dvo.c
> > +++ b/drivers/gpu/drm/sti/sti_dvo.c
> > @@ -511,7 +511,6 @@ static int sti_dvo_probe(struct platform_device
> *pdev)
> >  {
> >       struct device *dev =3D &pdev->dev;
> >       struct sti_dvo *dvo;
> > -     struct resource *res;
> >       struct device_node *np =3D dev->of_node;
> >
> >       DRM_INFO("%s\n", __func__);
> > @@ -523,14 +522,7 @@ static int sti_dvo_probe(struct platform_device
> *pdev)
> >       }
> >
> >       dvo->dev =3D pdev->dev;
> > -
> > -     res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM,
> "dvo-reg");
> > -     if (!res) {
> > -             DRM_ERROR("Invalid dvo resource\n");
> > -             return -ENOMEM;
> > -     }
> > -     dvo->regs =3D devm_ioremap(dev, res->start,
> > -                     resource_size(res));
> > +     dvo->regs =3D devm_platform_ioremap_resource_byname(pdev, "dvo-re=
g");
> >       if (!dvo->regs)
> >               return -ENOMEM;
> >
> > diff --git a/drivers/gpu/drm/sti/sti_hda.c
> b/drivers/gpu/drm/sti/sti_hda.c
> > index
> 14fdc00d2ba03d4f96ba407ac8e576decb6f32c0..3ca3abb80d425901f4c031edfd327a7=
70d624e1c
> 100644
> > --- a/drivers/gpu/drm/sti/sti_hda.c
> > +++ b/drivers/gpu/drm/sti/sti_hda.c
> > @@ -750,14 +750,7 @@ static int sti_hda_probe(struct platform_device
> *pdev)
> >               return -ENOMEM;
> >
> >       hda->dev =3D pdev->dev;
> > -
> > -     /* Get resources */
> > -     res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM,
> "hda-reg");
> > -     if (!res) {
> > -             DRM_ERROR("Invalid hda resource\n");
> > -             return -ENOMEM;
> > -     }
> > -     hda->regs =3D devm_ioremap(dev, res->start, resource_size(res));
> > +     hda->regs =3D devm_platform_ioremap_resource_byname(pdev, "hda-re=
g");
> >       if (!hda->regs)
> >               return -ENOMEM;
> >
> > diff --git a/drivers/gpu/drm/sti/sti_hdmi.c
> b/drivers/gpu/drm/sti/sti_hdmi.c
> > index
> 164a34d793d86f114394048667ae3189e1c39242..c64ce7a1ef58b9ce4429edd368269be=
a87d86984
> 100644
> > --- a/drivers/gpu/drm/sti/sti_hdmi.c
> > +++ b/drivers/gpu/drm/sti/sti_hdmi.c
> > @@ -1380,7 +1380,6 @@ static int sti_hdmi_probe(struct platform_device
> *pdev)
> >       struct device *dev =3D &pdev->dev;
> >       struct sti_hdmi *hdmi;
> >       struct device_node *np =3D dev->of_node;
> > -     struct resource *res;
> >       struct device_node *ddc;
> >       int ret;
> >
> > @@ -1399,15 +1398,7 @@ static int sti_hdmi_probe(struct platform_device
> *pdev)
> >       }
> >
> >       hdmi->dev =3D pdev->dev;
> > -
> > -     /* Get resources */
> > -     res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM,
> "hdmi-reg");
> > -     if (!res) {
> > -             DRM_ERROR("Invalid hdmi resource\n");
> > -             ret =3D -ENOMEM;
> > -             goto release_adapter;
> > -     }
> > -     hdmi->regs =3D devm_ioremap(dev, res->start, resource_size(res));
> > +     hdmi->regs =3D devm_platform_ioremap_resource_byname(pdev,
> "hdmi-reg");
> >       if (!hdmi->regs) {
> >               ret =3D -ENOMEM;
> >               goto release_adapter;
> > diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c
> b/drivers/gpu/drm/sti/sti_hqvdp.c
> > index
> 0f658709c9d0d398c4eed65202443db9d0b41f8c..420395598d119a403d531211022e600=
5d6a2bd59
> 100644
> > --- a/drivers/gpu/drm/sti/sti_hqvdp.c
> > +++ b/drivers/gpu/drm/sti/sti_hqvdp.c
> > @@ -1356,7 +1356,6 @@ static int sti_hqvdp_probe(struct platform_device
> *pdev)
> >       struct device *dev =3D &pdev->dev;
> >       struct device_node *vtg_np;
> >       struct sti_hqvdp *hqvdp;
> > -     struct resource *res;
> >
> >       DRM_DEBUG_DRIVER("\n");
> >
> > @@ -1367,14 +1366,7 @@ static int sti_hqvdp_probe(struct platform_devic=
e
> *pdev)
> >       }
> >
> >       hqvdp->dev =3D dev;
> > -
> > -     /* Get Memory resources */
> > -     res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > -     if (!res) {
> > -             DRM_ERROR("Get memory resource failed\n");
> > -             return -ENXIO;
> > -     }
> > -     hqvdp->regs =3D devm_ioremap(dev, res->start, resource_size(res))=
;
> > +     hqvdp->regs =3D devm_platform_ioremap_resource(pdev, 0);
> >       if (!hqvdp->regs) {
> >               DRM_ERROR("Register mapping failed\n");
> >               return -ENXIO;
> > diff --git a/drivers/gpu/drm/sti/sti_tvout.c
> b/drivers/gpu/drm/sti/sti_tvout.c
> > index
> af6c06f448c4819def8cc0d0836e30f991529690..0bebe815f5e7567f84388af93723a6f=
a7d2cc7a2
> 100644
> > --- a/drivers/gpu/drm/sti/sti_tvout.c
> > +++ b/drivers/gpu/drm/sti/sti_tvout.c
> > @@ -838,7 +838,6 @@ static int sti_tvout_probe(struct platform_device
> *pdev)
> >       struct device *dev =3D &pdev->dev;
> >       struct device_node *node =3D dev->of_node;
> >       struct sti_tvout *tvout;
> > -     struct resource *res;
> >
> >       DRM_INFO("%s\n", __func__);
> >
> > @@ -850,14 +849,7 @@ static int sti_tvout_probe(struct platform_device
> *pdev)
> >               return -ENOMEM;
> >
> >       tvout->dev =3D dev;
> > -
> > -     /* get memory resources */
> > -     res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM,
> "tvout-reg");
> > -     if (!res) {
> > -             DRM_ERROR("Invalid glue resource\n");
> > -             return -ENOMEM;
> > -     }
> > -     tvout->regs =3D devm_ioremap(dev, res->start, resource_size(res))=
;
> > +     tvout->regs =3D devm_platform_ioremap_resource_byname(pdev,
> "tvout-reg");
> >       if (!tvout->regs)
> >               return -ENOMEM;
> >
> > diff --git a/drivers/gpu/drm/sti/sti_vtg.c
> b/drivers/gpu/drm/sti/sti_vtg.c
> > index
> 5ba469b711b5318e9e9e6d8df127fb8933d1fac1..b5353fe774d72fd629ecd3ef75a5d28=
17ca8617f
> 100644
> > --- a/drivers/gpu/drm/sti/sti_vtg.c
> > +++ b/drivers/gpu/drm/sti/sti_vtg.c
> > @@ -380,20 +380,12 @@ static int vtg_probe(struct platform_device *pdev=
)
> >  {
> >       struct device *dev =3D &pdev->dev;
> >       struct sti_vtg *vtg;
> > -     struct resource *res;
> >       int ret;
> >
> >       vtg =3D devm_kzalloc(dev, sizeof(*vtg), GFP_KERNEL);
> >       if (!vtg)
> >               return -ENOMEM;
> > -
> > -     /* Get Memory ressources */
> > -     res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > -     if (!res) {
> > -             DRM_ERROR("Get memory resource failed\n");
> > -             return -ENOMEM;
> > -     }
> > -     vtg->regs =3D devm_ioremap(dev, res->start, resource_size(res));
> > +     vtg->regs =3D devm_platform_ioremap_resource(pdev, 0);
> >       if (!vtg->regs) {
> >               DRM_ERROR("failed to remap I/O memory\n");
> >               return -ENOMEM;
> >
>
>

--000000000000bc509b062f737f75
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 26,=
 2025 at 5:19=E2=80=AFAM Raphael Gallais-Pou &lt;<a href=3D"mailto:raphael.=
gallais-pou@foss.st.com">raphael.gallais-pou@foss.st.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
On 2/25/25 23:20, Anusha Srivatsa wrote:<br>
&gt; Replace platform_get_resource/_byname + devm_ioremap<br>
&gt; with just devm_platform_ioremap_resource()<br>
&gt;<br>
&gt; Used Coccinelle to do this change. SmPl patch:<br>
&gt;<br>
&gt; @rule@<br>
&gt; identifier res;<br>
&gt; expression ioremap;<br>
&gt; identifier pdev;<br>
&gt; constant mem;<br>
&gt; expression name;<br>
&gt; @@<br>
&gt; -struct resource *res;<br>
&gt; ...<br>
&gt; -res =3D platform_get_resource_byname(pdev,mem,name);<br>
&gt; &lt;...<br>
&gt; -if (!res) {<br>
&gt; -...<br>
&gt; -}<br>
&gt; ...&gt;<br>
&gt; -ioremap =3D devm_ioremap(...);<br>
&gt; +ioremap =3D devm_platform_ioremap_resource_byname(pdev,name);<br>
&gt;<br>
&gt; and<br>
&gt; @rule_2@<br>
&gt; identifier res;<br>
&gt; expression ioremap;<br>
&gt; identifier pdev;<br>
&gt; @@<br>
&gt; -struct resource *res;<br>
&gt; ...<br>
&gt; -res =3D platform_get_resource(pdev,...);<br>
&gt; &lt;...<br>
&gt; -if (!res) {<br>
&gt; -...<br>
&gt; -}<br>
&gt; ...&gt;<br>
&gt; -ioremap =3D devm_ioremap(...);<br>
&gt; +ioremap =3D devm_platform_ioremap_resource(pdev,0);<br>
&gt;<br>
&gt; v2: Fix compilation error.<br>
<br>
<br>
Hi Anusha,=C2=A0<br>
<br>
<br>
You did not take into account my comment regarding the changelog. :-)<br>
<a href=3D"https://www.kernel.org/doc/html/latest/process/submitting-patche=
s.html#commentary" rel=3D"noreferrer" target=3D"_blank">https://www.kernel.=
org/doc/html/latest/process/submitting-patches.html#commentary</a><br>
<br>
While the commit summary do not specify the version, this changelog suggest=
s<br>
that the version of your series as been incremented.<br>
If this is a v2, then a version descriptor should be applied to the patchse=
t.<br>
<a href=3D"https://www.kernel.org/doc/html/latest/process/submitting-patche=
s.html#subject-line" rel=3D"noreferrer" target=3D"_blank">https://www.kerne=
l.org/doc/html/latest/process/submitting-patches.html#subject-line</a><br>
<br></blockquote><div>Hi=C2=A0 Raphael,</div><div><br></div><div>That is co=
rrect. While this patch is a v2, there is another patch or two in the same =
series that is on v4 when it got acked and reviewed. Having patches belongi=
ng to the same series with different version prefixes seemed odd when I sen=
t the series. Hence added what exactly changed in the commit log.</div><div=
><br></div><div>Anusha</div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
Regards,<br>
Rapha=C3=ABl<br>
<br>
&gt;<br>
&gt; Cc: Raphael Gallais-Pou &lt;<a href=3D"mailto:raphael.gallais-pou@foss=
.st.com" target=3D"_blank">raphael.gallais-pou@foss.st.com</a>&gt;<br>
&gt; Cc: Alain Volmat &lt;<a href=3D"mailto:alain.volmat@foss.st.com" targe=
t=3D"_blank">alain.volmat@foss.st.com</a>&gt;<br>
&gt; Reviewed-by: Maxime Ripard &lt;<a href=3D"mailto:mripard@kernel.org" t=
arget=3D"_blank">mripard@kernel.org</a>&gt;<br>
&gt; Acked-by: Raphael Gallais-Pou &lt;<a href=3D"mailto:rgallaispou@gmail.=
com" target=3D"_blank">rgallaispou@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Anusha Srivatsa &lt;<a href=3D"mailto:asrivats@redhat.c=
om" target=3D"_blank">asrivats@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/sti/sti_compositor.c | 10 +---------<br>
&gt;=C2=A0 drivers/gpu/drm/sti/sti_dvo.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 +-=
--------<br>
&gt;=C2=A0 drivers/gpu/drm/sti/sti_hda.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 9 +--------<br>
&gt;=C2=A0 drivers/gpu/drm/sti/sti_hdmi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 +-=
---------<br>
&gt;=C2=A0 drivers/gpu/drm/sti/sti_hqvdp.c=C2=A0 =C2=A0 =C2=A0 | 10 +------=
---<br>
&gt;=C2=A0 drivers/gpu/drm/sti/sti_tvout.c=C2=A0 =C2=A0 =C2=A0 | 10 +------=
---<br>
&gt;=C2=A0 drivers/gpu/drm/sti/sti_vtg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 +-=
--------<br>
&gt;=C2=A0 7 files changed, 7 insertions(+), 63 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/sti/sti_compositor.c b/drivers/gpu/drm/st=
i/sti_compositor.c<br>
&gt; index 063f82d23d80c4ba83624a0066a18416a2b37351..7aefce6706ba2cd7d97a33=
228c9b9812edecf06f 100644<br>
&gt; --- a/drivers/gpu/drm/sti/sti_compositor.c<br>
&gt; +++ b/drivers/gpu/drm/sti/sti_compositor.c<br>
&gt; @@ -177,7 +177,6 @@ static int sti_compositor_probe(struct platform_de=
vice *pdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_node *np =3D dev-&gt;of_node;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_node *vtg_np;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sti_compositor *compo;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct resource *res;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int i;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0compo =3D devm_kzalloc(dev, sizeof(*compo), =
GFP_KERNEL);<br>
&gt; @@ -194,14 +193,7 @@ static int sti_compositor_probe(struct platform_d=
evice *pdev)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(&amp;compo-&gt;data, of_match_node(co=
mpositor_of_match, np)-&gt;data,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(struct sti_comp=
ositor_data));<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0/* Get Memory ressources */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0res =3D platform_get_resource(pdev, IORESOURCE_ME=
M, 0);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (res =3D=3D NULL) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;Get m=
emory resource failed\n&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENXIO;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0compo-&gt;regs =3D devm_ioremap(dev, res-&gt;star=
t, resource_size(res));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0compo-&gt;regs =3D devm_platform_ioremap_resource=
(pdev, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (compo-&gt;regs =3D=3D NULL) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;=
Register mapping failed\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENXIO;<b=
r>
&gt; diff --git a/drivers/gpu/drm/sti/sti_dvo.c b/drivers/gpu/drm/sti/sti_d=
vo.c<br>
&gt; index 4dcddd02629b6a1052be8fb8333bd3aa17c083c5..c877298a7f2bad171724ec=
a4d43ea622db4c81cd 100644<br>
&gt; --- a/drivers/gpu/drm/sti/sti_dvo.c<br>
&gt; +++ b/drivers/gpu/drm/sti/sti_dvo.c<br>
&gt; @@ -511,7 +511,6 @@ static int sti_dvo_probe(struct platform_device *p=
dev)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;pdev-&gt;dev;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sti_dvo *dvo;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct resource *res;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_node *np =3D dev-&gt;of_node;<=
br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_INFO(&quot;%s\n&quot;, __func__);<br>
&gt; @@ -523,14 +522,7 @@ static int sti_dvo_probe(struct platform_device *=
pdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dvo-&gt;dev =3D pdev-&gt;dev;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0res =3D platform_get_resource_byname(pdev, IORESO=
URCE_MEM, &quot;dvo-reg&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (!res) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;Inval=
id dvo resource\n&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0dvo-&gt;regs =3D devm_ioremap(dev, res-&gt;start,=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0resource_size(res));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dvo-&gt;regs =3D devm_platform_ioremap_resource_b=
yname(pdev, &quot;dvo-reg&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!dvo-&gt;regs)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<=
br>
&gt;=C2=A0 <br>
&gt; diff --git a/drivers/gpu/drm/sti/sti_hda.c b/drivers/gpu/drm/sti/sti_h=
da.c<br>
&gt; index 14fdc00d2ba03d4f96ba407ac8e576decb6f32c0..3ca3abb80d425901f4c031=
edfd327a770d624e1c 100644<br>
&gt; --- a/drivers/gpu/drm/sti/sti_hda.c<br>
&gt; +++ b/drivers/gpu/drm/sti/sti_hda.c<br>
&gt; @@ -750,14 +750,7 @@ static int sti_hda_probe(struct platform_device *=
pdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<=
br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0hda-&gt;dev =3D pdev-&gt;dev;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0/* Get resources */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0res =3D platform_get_resource_byname(pdev, IORESO=
URCE_MEM, &quot;hda-reg&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (!res) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;Inval=
id hda resource\n&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0hda-&gt;regs =3D devm_ioremap(dev, res-&gt;start,=
 resource_size(res));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0hda-&gt;regs =3D devm_platform_ioremap_resource_b=
yname(pdev, &quot;hda-reg&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!hda-&gt;regs)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<=
br>
&gt;=C2=A0 <br>
&gt; diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_=
hdmi.c<br>
&gt; index 164a34d793d86f114394048667ae3189e1c39242..c64ce7a1ef58b9ce4429ed=
d368269bea87d86984 100644<br>
&gt; --- a/drivers/gpu/drm/sti/sti_hdmi.c<br>
&gt; +++ b/drivers/gpu/drm/sti/sti_hdmi.c<br>
&gt; @@ -1380,7 +1380,6 @@ static int sti_hdmi_probe(struct platform_device=
 *pdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;pdev-&gt;dev;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sti_hdmi *hdmi;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_node *np =3D dev-&gt;of_node;<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct resource *res;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_node *ddc;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt;=C2=A0 <br>
&gt; @@ -1399,15 +1398,7 @@ static int sti_hdmi_probe(struct platform_devic=
e *pdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0hdmi-&gt;dev =3D pdev-&gt;dev;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0/* Get resources */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0res =3D platform_get_resource_byname(pdev, IORESO=
URCE_MEM, &quot;hdmi-reg&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (!res) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;Inval=
id hdmi resource\n&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -ENOMEM;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto release_adapter;=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0hdmi-&gt;regs =3D devm_ioremap(dev, res-&gt;start=
, resource_size(res));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0hdmi-&gt;regs =3D devm_platform_ioremap_resource_=
byname(pdev, &quot;hdmi-reg&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!hdmi-&gt;regs) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -ENOMEM;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto release_ada=
pter;<br>
&gt; diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti=
_hqvdp.c<br>
&gt; index 0f658709c9d0d398c4eed65202443db9d0b41f8c..420395598d119a403d5312=
11022e6005d6a2bd59 100644<br>
&gt; --- a/drivers/gpu/drm/sti/sti_hqvdp.c<br>
&gt; +++ b/drivers/gpu/drm/sti/sti_hqvdp.c<br>
&gt; @@ -1356,7 +1356,6 @@ static int sti_hqvdp_probe(struct platform_devic=
e *pdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;pdev-&gt;dev;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_node *vtg_np;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sti_hqvdp *hqvdp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct resource *res;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DEBUG_DRIVER(&quot;\n&quot;);<br>
&gt;=C2=A0 <br>
&gt; @@ -1367,14 +1366,7 @@ static int sti_hqvdp_probe(struct platform_devi=
ce *pdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0hqvdp-&gt;dev =3D dev;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0/* Get Memory resources */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0res =3D platform_get_resource(pdev, IORESOURCE_ME=
M, 0);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (!res) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;Get m=
emory resource failed\n&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENXIO;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0hqvdp-&gt;regs =3D devm_ioremap(dev, res-&gt;star=
t, resource_size(res));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0hqvdp-&gt;regs =3D devm_platform_ioremap_resource=
(pdev, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!hqvdp-&gt;regs) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;=
Register mapping failed\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENXIO;<b=
r>
&gt; diff --git a/drivers/gpu/drm/sti/sti_tvout.c b/drivers/gpu/drm/sti/sti=
_tvout.c<br>
&gt; index af6c06f448c4819def8cc0d0836e30f991529690..0bebe815f5e7567f84388a=
f93723a6fa7d2cc7a2 100644<br>
&gt; --- a/drivers/gpu/drm/sti/sti_tvout.c<br>
&gt; +++ b/drivers/gpu/drm/sti/sti_tvout.c<br>
&gt; @@ -838,7 +838,6 @@ static int sti_tvout_probe(struct platform_device =
*pdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;pdev-&gt;dev;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_node *node =3D dev-&gt;of_node=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sti_tvout *tvout;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct resource *res;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_INFO(&quot;%s\n&quot;, __func__);<br>
&gt;=C2=A0 <br>
&gt; @@ -850,14 +849,7 @@ static int sti_tvout_probe(struct platform_device=
 *pdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<=
br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tvout-&gt;dev =3D dev;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0/* get memory resources */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0res =3D platform_get_resource_byname(pdev, IORESO=
URCE_MEM, &quot;tvout-reg&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (!res) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;Inval=
id glue resource\n&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0tvout-&gt;regs =3D devm_ioremap(dev, res-&gt;star=
t, resource_size(res));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tvout-&gt;regs =3D devm_platform_ioremap_resource=
_byname(pdev, &quot;tvout-reg&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!tvout-&gt;regs)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<=
br>
&gt;=C2=A0 <br>
&gt; diff --git a/drivers/gpu/drm/sti/sti_vtg.c b/drivers/gpu/drm/sti/sti_v=
tg.c<br>
&gt; index 5ba469b711b5318e9e9e6d8df127fb8933d1fac1..b5353fe774d72fd629ecd3=
ef75a5d2817ca8617f 100644<br>
&gt; --- a/drivers/gpu/drm/sti/sti_vtg.c<br>
&gt; +++ b/drivers/gpu/drm/sti/sti_vtg.c<br>
&gt; @@ -380,20 +380,12 @@ static int vtg_probe(struct platform_device *pde=
v)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;pdev-&gt;dev;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sti_vtg *vtg;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct resource *res;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0vtg =3D devm_kzalloc(dev, sizeof(*vtg), GFP_=
KERNEL);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!vtg)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<=
br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0/* Get Memory ressources */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0res =3D platform_get_resource(pdev, IORESOURCE_ME=
M, 0);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (!res) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;Get m=
emory resource failed\n&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0vtg-&gt;regs =3D devm_ioremap(dev, res-&gt;start,=
 resource_size(res));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vtg-&gt;regs =3D devm_platform_ioremap_resource(p=
dev, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!vtg-&gt;regs) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;=
failed to remap I/O memory\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<=
br>
&gt;<br>
<br>
</blockquote></div></div>

--000000000000bc509b062f737f75--

