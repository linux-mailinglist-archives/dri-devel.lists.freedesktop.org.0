Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE51141DAC1
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 15:12:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 068E96EB88;
	Thu, 30 Sep 2021 13:12:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08F4E6EB88
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 13:12:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD5BD613A7
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 13:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633007535;
 bh=tmn4BbXKbxNZ0EBee9Cj9y0DfwstE28MZfJScaAzQBA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DOz6l0JPvlnGCx7pxlN5fyg2rBnOza4mMZ7wnNOLToA8VBDrSQGV98gty+VnvyCpP
 fWz/Ak8Tti/m/DnySmUqobkj2xAtFPmelwvfIEy0MSwe85lNuG73RpImLZop8PRBse
 BgbetPqy4D6EU33reOBSbKGccsuXe/p6RfTLQPjj0jfyNC3O94N0B7WK+dOLW7VOuX
 Db1PkWtVPYdRjFQHSXhrPJ4+LRW3TUmFHODgXj6VqJmCW8yuNye+4a3CpOx4Q44rww
 Td9Gs1X61Deia5H2PPPYg0hz+3dC4f1EKg7bF/4dTw/0czSpZGbxp/INOco0vT8E5I
 w28LKAifcoyuA==
Received: by mail-ed1-f48.google.com with SMTP id bd28so21834063edb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 06:12:15 -0700 (PDT)
X-Gm-Message-State: AOAM533QPuzDvs1jBAu8GPOxqGqYm7lUx/dAlL7VeLa6VvOUz5+eD6LM
 90w39OiVl/YgrX/VjUoE19hkR1aVeOIZVHbI2Q==
X-Google-Smtp-Source: ABdhPJzTgzKXplVDdgs4A4kIx4YRhy9CpZE0oMSC8hlIlknZBKVudawCQ4nfm82XLN5T4dpicwf+1KmANU1PzkR7hB8=
X-Received: by 2002:a17:906:3181:: with SMTP id
 1mr6983672ejy.388.1633007533447; 
 Thu, 30 Sep 2021 06:12:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210930024704.6966-1-jason-jh.lin@mediatek.com>
 <20210930024704.6966-4-jason-jh.lin@mediatek.com>
In-Reply-To: <20210930024704.6966-4-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 30 Sep 2021 21:12:02 +0800
X-Gmail-Original-Message-ID: <CAAOTY__51QPovSD2_DyBFPPMED1H0hGqxHQSdFWkL7nCngkX8g@mail.gmail.com>
Message-ID: <CAAOTY__51QPovSD2_DyBFPPMED1H0hGqxHQSdFWkL7nCngkX8g@mail.gmail.com>
Subject: Re: [v2 PATCH 3/3] drm/mediatek: Fix cursor plane is not config when
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

jason-jh.lin <jason-jh.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B49=E6=9C=883=
0=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8810:47=E5=AF=AB=E9=81=93=EF=
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

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

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
> index 274e5c67507d..b96dbc867890 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -281,6 +281,9 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void =
*mssg)
>         struct mtk_crtc_state *state;
>         unsigned int i;
>
> +       if (data->sta < 0)
> +               return;
> +
>         state =3D to_mtk_crtc_state(mtk_crtc->base.state);
>
>         state->pending_config =3D false;
> --
> 2.18.0
>
