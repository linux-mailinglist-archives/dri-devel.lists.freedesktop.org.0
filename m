Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4819841C784
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 16:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 763346EA9E;
	Wed, 29 Sep 2021 14:57:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA03D6EA9E
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 14:57:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9005A61407
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 14:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632927432;
 bh=m2Q3ldX4i8hJz/lYMTrW/Tc7jkjEgA48T0avsrMIFb0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=I6t9M2nwemRwrQSICjKBtwpC+J4aoewq4SNgP0rGrTtaHnU3JsDefsOY5eJPtdY5U
 fDNckqOmXgH2mhRy7nLTKyY10trM3urnU9BvLOke/N1y/7mr2+v0TuL+r20vX1JCIO
 f2w/kyFDh/0RiV+srRjRxKPXa4+H3ACd/5osE4TvRPz05tSRjvHuuXI9cjklYJNuu8
 KpMte6W842e6WFwGtaExsSLjfkhNNudfaNW4foVCKLwlQuvL63hwwRanEbsTfsjaZw
 LPeERERdu2uOYSF2wk2lmTT6QlAfsvrxdXJF5EunlrHqHnAYd6To/vCLIvvm7cJue4
 /mzZvQJwu4dlQ==
Received: by mail-ed1-f43.google.com with SMTP id bd28so9660974edb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 07:57:12 -0700 (PDT)
X-Gm-Message-State: AOAM531hq7/QykaNRnbv2CgsAfMES5SUV7BxfxNb4Zbc4DjyxV1joRML
 XBB9vgkFY/FsdC4fcDilYsAfXvJqR5C0vvG+Mg==
X-Google-Smtp-Source: ABdhPJy2oIyAhlML1lKHkEI+GYb7Xf5WZ4jL2sSq+xZsFvjhx2y5gie/l/Dq825/3UzuJiV9rAUHrF0xKV//SQBZD0k=
X-Received: by 2002:a17:906:7ac4:: with SMTP id
 k4mr178848ejo.430.1632927358007; 
 Wed, 29 Sep 2021 07:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210929070235.4290-1-jason-jh.lin@mediatek.com>
 <20210929070235.4290-4-jason-jh.lin@mediatek.com>
In-Reply-To: <20210929070235.4290-4-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 29 Sep 2021 22:55:46 +0800
X-Gmail-Original-Message-ID: <CAAOTY__XmEYNbQJh0o-V-DS7F-_s1a9m54+FuOMwHGBCwx55Wg@mail.gmail.com>
Message-ID: <CAAOTY__XmEYNbQJh0o-V-DS7F-_s1a9m54+FuOMwHGBCwx55Wg@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/mediatek: Fix cursor plane is not config when
 primary is updating
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 fshao@chromium.org, 
 Nancy Lin <nancy.lin@mediatek.com>, singo.chang@mediatek.com
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

Hi, Jason:

jason-jh.lin <jason-jh.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B49=E6=9C=882=
9=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=883:02=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> If cursor plane has updated but primary plane config task is not
> finished, mtk_drm_crtc_update_config will call mbox_flush() to clear
> all task in current GCE thread and let cursor plane re-send a new
> GCE task with cursor + primary plane config to replace the unfinished
> GCE task.
>
> So the plane config flag should not be cleared when mailbox callback
> with a error status.
>
> Fixes: 9efb16c2fdd6 ("drm/mediatek: Clear pending flag when cmdq packet i=
s done")
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/me=
diatek/mtk_drm_crtc.c
> index 06342df2a0be..fb0d9424acec 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -281,6 +281,9 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void =
*mssg)
>         struct mtk_crtc_state *state;
>         unsigned int i;
>
> +       if (data->sta !=3D 0)

data->sta is now the standard error code, so data->sta < 0 is an error.

Regards,
Chun-Kuang.

> +               return;
> +
>         state =3D to_mtk_crtc_state(mtk_crtc->base.state);
>
>         state->pending_config =3D false;
> --
> 2.18.0
>
