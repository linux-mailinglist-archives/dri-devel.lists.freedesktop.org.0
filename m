Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9405A4B207
	for <lists+dri-devel@lfdr.de>; Sun,  2 Mar 2025 15:09:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C3410E059;
	Sun,  2 Mar 2025 14:00:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="McIGGuoZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECCC810E059
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 14:00:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 615CF611C8
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 14:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CA14C4CEF2
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 14:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740924029;
 bh=Av/PzBkOyruXRWKNi7XdeiMIEbdI1P2Bm67kdtg1gjg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=McIGGuoZ7gMk2Glgi+BCFR2gGNhEJVNnMtxtb7FuX2X0QS1okoEknf61jVDXoKwNn
 0nXZNH4n0Hpw4bRx3eyjRFFcF7EgEfBpg4uKzmjNYeB0JZuRxWWmNW0flo+PSESd23
 ztxe4Hw3qOelY7Gk8DnI5p1dH69WjRuOjVbGpmDty5zBYI/mFQEQzT2/F8qlZeyO+F
 1ymkoVUztYhkV2Ji7jOVozFBNwTvJilnMIOVRltO/p5JsSVPOXsxop3m5J2AZp+US8
 U1r5Igo4WtrAV+Nowb+QnB8neIzzYFnkX+l2S1ARK2cnpywKVgWZOf5RH2pGHc7vAs
 KsWaqJKxxnP3w==
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2238e884f72so11881085ad.3
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Mar 2025 06:00:29 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVbEQLrIZND4unfGHkisvCTuQnIxCdtzIOlZHwm+06XDCAiHYoT8PeLwfgmmHjzprB1LPr2YRwHNzE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxzn7XChbYZ5NO2qHmWI/mI3BgAnKJi9rfo/voeSxBSwRSpsPb/
 JGkISQReSBlHcjHhpTneALMFk4oWlH4A/3sV3AhF11C9+jPaUZV04kbfPRZob0IbkWWeKNjD3rq
 XuxS/zSav9psiEKHN4IW30ewdKA==
X-Google-Smtp-Source: AGHT+IG1UW/aTlTM1yyIsxH6m8pGtzQb2LXGDtI6T8t/hEX8x0qb7qhCvRhbTMRAi2KttaGOcJDuH66GaQNNrad3F3Y=
X-Received: by 2002:a17:903:244d:b0:216:6901:d588 with SMTP id
 d9443c01a7336-22368f75980mr127122725ad.15.1740924028832; Sun, 02 Mar 2025
 06:00:28 -0800 (PST)
MIME-Version: 1.0
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
 <20250217154836.108895-9-angelogioacchino.delregno@collabora.com>
 <CAAOTY_8kxxaj+jum6CkJGHKrpjiX_cNt4FT345yET8GWR2QSFA@mail.gmail.com>
In-Reply-To: <CAAOTY_8kxxaj+jum6CkJGHKrpjiX_cNt4FT345yET8GWR2QSFA@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 2 Mar 2025 22:01:15 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9tjf8xw8n9euVK1OH7LLopNYwx5qzLJpQyQ+sKfVH6og@mail.gmail.com>
X-Gm-Features: AQ5f1Jo2Tbkh_sgx6kIGT6QdCzyACy__75IjpU71fY-nThmkgmTkCzBPqTB7-MQ
Message-ID: <CAAOTY_9tjf8xw8n9euVK1OH7LLopNYwx5qzLJpQyQ+sKfVH6og@mail.gmail.com>
Subject: Re: [PATCH v7 08/43] drm/mediatek: mtk_dpi: Support AFIFO 1T1P output
 and conversion
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 p.zabel@pengutronix.de, 
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, matthias.bgg@gmail.com, ck.hu@mediatek.com, 
 jitao.shi@mediatek.com, jie.qiu@mediatek.com, junzhi.zhao@mediatek.com, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
 dmitry.baryshkov@linaro.org, lewis.liao@mediatek.com, 
 ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com, 
 jason-jh.lin@mediatek.com
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

Chun-Kuang Hu <chunkuang.hu@kernel.org> =E6=96=BC 2025=E5=B9=B43=E6=9C=882=
=E6=97=A5 =E9=80=B1=E6=97=A5 =E4=B8=8B=E5=8D=887:29=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Hi, Angelo:
>
> AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=
=96=BC
> 2025=E5=B9=B42=E6=9C=8817=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=881=
1:49=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > On some SoCs, like MT8195 and MT8188, the DPI's FIFO controller
> > (afifo) supports outputting either one or two pixels per round
> > regardless of the input being 1T1P or 1T2P.
> >
> > Add a `output_1pixel` member to struct mtk_dpi_conf which, if
> > set, will enable outputting one pixel per clock.
> >
> > In case the input is two pixel per clock (1T2P), the AFIFO HW
> > will automatically (and internally) convert it to 1T1P.
>
> Applied to mediatek-drm-next [1], thanks.
>
> [1] https://web.git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linu=
x.git/log/?h=3Dmediatek-drm-next

Fix build error then apply. Be care of patch quality.

Regards,
Chun-Kuang.

>
> Regards,
> Chun-Kuang.
>
> >
> > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dpi.c | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/media=
tek/mtk_dpi.c
> > index 9f83e82437dd..e12dc73ed79c 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -147,6 +147,8 @@ struct mtk_dpi_factor {
> >   * @edge_cfg_in_mmsys: If the edge configuration for DPI's output need=
s to be set in MMSYS.
> >   * @clocked_by_hdmi: HDMI IP outputs clock to dpi_pixel_clk input cloc=
k, needed
> >   *                  for DPI registers access.
> > + * @output_1pixel: Enable outputting one pixel per round; if the input=
 is two pixel per
> > + *                 round, the DPI hardware will internally transform i=
t to 1T1P.
> >   */
> >  struct mtk_dpi_conf {
> >         const struct mtk_dpi_factor *dpi_factor;
> > @@ -168,6 +170,7 @@ struct mtk_dpi_conf {
> >         u32 pixels_per_iter;
> >         bool edge_cfg_in_mmsys;
> >         bool clocked_by_hdmi;
> > +       bool output_1pixel;
> >  };
> >
> >  static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val, u32=
 mask)
> > @@ -653,7 +656,13 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi=
 *dpi,
> >         if (dpi->conf->support_direct_pin) {
> >                 mtk_dpi_config_yc_map(dpi, dpi->yc_map);
> >                 mtk_dpi_config_2n_h_fre(dpi);
> > -               mtk_dpi_dual_edge(dpi);
> > +
> > +               /* DPI can connect to either an external bridge or the =
internal HDMI encoder */
> > +               if (dpi->conf->output_1pixel)
> > +                       mtk_dpi_mask(dpi, DPI_CON, DPI_OUTPUT_1T1P_EN, =
DPI_OUTPUT_1T1P_EN);
> > +               else
> > +                       mtk_dpi_dual_edge(dpi);
> > +
> >                 mtk_dpi_config_disable_edge(dpi);
> >         }
> >         if (dpi->conf->input_2p_en_bit) {
> > --
> > 2.48.1
> >
