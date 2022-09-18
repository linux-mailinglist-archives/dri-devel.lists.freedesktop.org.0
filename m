Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5955BBB9D
	for <lists+dri-devel@lfdr.de>; Sun, 18 Sep 2022 06:33:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 805B310E3DF;
	Sun, 18 Sep 2022 04:32:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9937610E3DF
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Sep 2022 04:32:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D8CB061243
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Sep 2022 04:32:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E12CC433D6
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Sep 2022 04:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663475554;
 bh=eM/QQQyukAm+XDVeiBT7gGoM5l7VFfdhk5Bm7ROWEdQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SZKRRMjt8D0ds+0o4jQfDeDLuNMEVbYhWGfQduOMBba6Tyxen36J+XRRDS1jQCUsG
 oyk6AEwWBlh875ulYgRpDVgmWBjMj47DMPA2g9VCdVunWKNdQJ+/KfBfukrMr/E2Vj
 WiG2AMp4e+QUeQUPRWx2V4av/Okw4Ya39Rx4nOgecASpDa+SPKtPOg/bWjth7cZpqG
 7P7A8rkjm364pE8xNYwFjIUkuUJCV030DV2Pmi/2sUk2x9IgvQH6W+JBYeSirrUrMx
 1wDIwVRBC5VhI9qzTojR9srZq5gzs/4hJR4iR0gSaJA6zpVXiuF/8PBFdxTKhqU6YH
 3gyxqSI1hkyZQ==
Received: by mail-ot1-f44.google.com with SMTP id
 r13-20020a056830418d00b0065601df69c0so12286121otu.7
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Sep 2022 21:32:34 -0700 (PDT)
X-Gm-Message-State: ACrzQf16AjhVhZdRxIID1dr8XjCXVEVfJw0Tr+JtRtoTSIyte6erOsFO
 zoJTcY7qKio9qh8geONYxBmxGvDOwd2p0qQAFw==
X-Google-Smtp-Source: AMsMyM5lCD6u07Sps3gffTwk531S2XxDTgJmBJz+g7D+eRtOqwZIMdUqFL+Yn4Cdx4x2A+ifxluvekYLL60ONhN94q4=
X-Received: by 2002:a05:6830:6999:b0:61d:26f8:94c1 with SMTP id
 cy25-20020a056830699900b0061d26f894c1mr5511290otb.278.1663475553315; Sat, 17
 Sep 2022 21:32:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220914140031.18578-1-allen-kh.cheng@mediatek.com>
In-Reply-To: <20220914140031.18578-1-allen-kh.cheng@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 18 Sep 2022 12:32:22 +0800
X-Gmail-Original-Message-ID: <CAAOTY_92F5WgCedZOvg_qtkHLorTCXiWtuGgoJ=9gRryYHi7TQ@mail.gmail.com>
Message-ID: <CAAOTY_92F5WgCedZOvg_qtkHLorTCXiWtuGgoJ=9gRryYHi7TQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm: mediatek: Fix display vblank timeout when disable
 dsi
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Xinlei Lee <xinlei.lee@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Allen:

Allen-KH Cheng <allen-kh.cheng@mediatek.com> =E6=96=BC 2022=E5=B9=B49=E6=9C=
=8814=E6=97=A5 =E9=80=B1=E4=B8=89 =E6=99=9A=E4=B8=8A10:00=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> From: Xinlei Lee <xinlei.lee@mediatek.com>
>
> Dsi is turned off at bridge.disable, causing crtc to wait for vblank
> timeout. It is necessary to add count protection to turn off dsi and
> turn off at post_disable.

If turn off dsi in post_disable(), you should turn on dsi in pre_enable().

There is another patch fix this problem [1], do you have any comment
on that patch?

[1] http://lists.infradead.org/pipermail/linux-mediatek/2022-August/046713.=
html

Regards,
Chun-Kuang.

>
> Fixes: cde7e2e35c28 ("drm/mediatek: Separate poweron/poweroff from enable=
/disable and define new funcs")
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Co-developed-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
> Change in v1:
>   * Rebase to kernel/git/chunkuang.hu/linux.git, mediatek-drm-fixes
>     [Allen-KH Cheng <allen-kh.cheng@mediatek.com>]
> ---
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index 5b624e0f5b0a..e30f4244c001 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -768,14 +768,6 @@ static void mtk_dsi_bridge_mode_set(struct drm_bridg=
e *bridge,
>         drm_display_mode_to_videomode(adjusted, &dsi->vm);
>  }
>
> -static void mtk_dsi_bridge_atomic_disable(struct drm_bridge *bridge,
> -                                         struct drm_bridge_state *old_br=
idge_state)
> -{
> -       struct mtk_dsi *dsi =3D bridge_to_dsi(bridge);
> -
> -       mtk_output_dsi_disable(dsi);
> -}
> -
>  static void mtk_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
>                                          struct drm_bridge_state *old_bri=
dge_state)
>  {
> @@ -803,13 +795,15 @@ static void mtk_dsi_bridge_atomic_post_disable(stru=
ct drm_bridge *bridge,
>  {
>         struct mtk_dsi *dsi =3D bridge_to_dsi(bridge);
>
> +       if (dsi->refcount =3D=3D 1)
> +               mtk_output_dsi_disable(dsi);
> +
>         mtk_dsi_poweroff(dsi);
>  }
>
>  static const struct drm_bridge_funcs mtk_dsi_bridge_funcs =3D {
>         .attach =3D mtk_dsi_bridge_attach,
>         .atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
> -       .atomic_disable =3D mtk_dsi_bridge_atomic_disable,
>         .atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_st=
ate,
>         .atomic_enable =3D mtk_dsi_bridge_atomic_enable,
>         .atomic_pre_enable =3D mtk_dsi_bridge_atomic_pre_enable,
> @@ -829,6 +823,9 @@ void mtk_dsi_ddp_stop(struct device *dev)
>  {
>         struct mtk_dsi *dsi =3D dev_get_drvdata(dev);
>
> +       if (dsi->refcount =3D=3D 1)
> +               mtk_output_dsi_disable(dsi);
> +
>         mtk_dsi_poweroff(dsi);
>  }
>
> --
> 2.18.0
>
