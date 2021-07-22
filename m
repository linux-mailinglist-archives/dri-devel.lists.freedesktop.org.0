Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD4E3D1ACD
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 02:42:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 700226E05F;
	Thu, 22 Jul 2021 00:42:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AEF26E05F
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 00:42:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D309361287
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 00:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626914572;
 bh=5gUuCHYoyXnxCTWjadK1ob5ANKNp6RQJVZAT7k9rS0o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FYHaJgCwwBDQfKT43ZcZrVpiPXWAlknCbCDxwcwgOkS3OV8dfY5fbxqlE9xftqXFn
 QYFKzhtAgo2xkQSyuN0UtgqJMgtyyb8RX9M4ECyz9a7x0y+Mk7ylts6oCUVc64H6BE
 4Evov4uuMQEhK40iWmj0oPxH0RbnxKdw8h0SZaB2IjvC1nIHjfwc/2XGT/KfZNzfyA
 gc9tcVs/52Qxaw1x5j6MsmoTOvuoXeihwyQNj4A8qkLUCXeIbzL7X7/GWMktU0sc7z
 GyhMvv9zdIKPjJxW71g9Id+XQ8RKvCVL6g3AuuCXgd0e+v+qj/bvtzaiZVZAtNh25o
 r7/+87x19VhNQ==
Received: by mail-ej1-f46.google.com with SMTP id dt7so5858565ejc.12
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 17:42:52 -0700 (PDT)
X-Gm-Message-State: AOAM532nIw6RX6tDic3ZckxnO9jhJFzX+YInMsw/Dai/3LtAowEt1pBs
 zh8vZCxteDNQlkPwwMuhVkJB3EXBp787vdPlxQ==
X-Google-Smtp-Source: ABdhPJyKf32KGYOx7/x5mSfSzBsftSabCd3owtHAjkGVEslJ3jlOd7OwePiukXqfZBwKpfVyyVggxJVBTrUCUsVgD+I=
X-Received: by 2002:a17:906:27da:: with SMTP id
 k26mr41548451ejc.267.1626914571435; 
 Wed, 21 Jul 2021 17:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210712080736.116435-1-linux@fw-web.de>
In-Reply-To: <20210712080736.116435-1-linux@fw-web.de>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 22 Jul 2021 08:42:40 +0800
X-Gmail-Original-Message-ID: <CAAOTY__rhehy6CG=A-0bEqn1-mCLh-xsz9UQ6dntCC69z4nvgw@mail.gmail.com>
Message-ID: <CAAOTY__rhehy6CG=A-0bEqn1-mCLh-xsz9UQ6dntCC69z4nvgw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: dpi: fix NULL dereference in
 mtk_dpi_bridge_atomic_check
To: Frank Wunderlich <linux@fw-web.de>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Frank:

Frank Wunderlich <linux@fw-web.de> =E6=96=BC 2021=E5=B9=B47=E6=9C=8812=E6=
=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=884:08=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: Frank Wunderlich <frank-w@public-files.de>
>
> bridge->driver_private is not set (NULL) so use bridge_to_dpi(bridge)
> like it's done in bridge_atomic_get_output_bus_fmts

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: ec8747c52434 ("drm/mediatek: dpi: Add bus format negotiation")
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediate=
k/mtk_dpi.c
> index bced555648b0..a2eca1f66984 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -605,7 +605,7 @@ static int mtk_dpi_bridge_atomic_check(struct drm_bri=
dge *bridge,
>                                        struct drm_crtc_state *crtc_state,
>                                        struct drm_connector_state *conn_s=
tate)
>  {
> -       struct mtk_dpi *dpi =3D bridge->driver_private;
> +       struct mtk_dpi *dpi =3D bridge_to_dpi(bridge);
>         unsigned int out_bus_format;
>
>         out_bus_format =3D bridge_state->output_bus_cfg.format;
> --
> 2.25.1
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
