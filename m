Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 537EC5BC479
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 10:41:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6DF10E5AF;
	Mon, 19 Sep 2022 08:41:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB6B10E5D6
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 08:41:01 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id g5so41451511ybg.11
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 01:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=EMEe3EnrmTz4VXJwt3zNe2mWyBL9jqG4mEETorWmETg=;
 b=SoyqYVokxMm1uUEputqTB5NtFHq2AOYVphA3SiugU5Db88W1jAKad2wuq+xMWhwTie
 61GIwvjPhTrBhQacCpgFH7SI7SMmwzrSZ3qrkGOMSYTfu1XdCjF/o14QjtFup/T3p+OZ
 rValRdjjh5dz7Oh8DNgTLxaSEzUa2tfJncXvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=EMEe3EnrmTz4VXJwt3zNe2mWyBL9jqG4mEETorWmETg=;
 b=dJge6psn8mWRsuzSy1lCfqEzLO+8J4ZbiIROWyQEeEJ65eFrL/PXkerkTsIT9xHkwN
 25yYyp/vjKnnMu1ENAdUnv2e7r4E2zezHufutI2pVx2cXQjgklpZC2pK1Z4HUjTDmTzj
 7HdpP93Trf32sOzdgeiOuf1nu4zUGeSZpiKhC0GKjYxBWLUo92hxTUb+mZjVNmjDsPmK
 4a3BmFyDfGey8okUbV3l4In+R6X+0MPh+AAJ2MMKGoAXLxYiLY9xVQgPWuZYZtU+Nd/f
 KBvylzhnoSevJ43NMgo9OYqm3UBo9qibKEjsMQWIpzCIR1wXdWi3dIDwYB2QCgt2ZPdE
 2XgA==
X-Gm-Message-State: ACrzQf1OGlsG09QSBr//Hi4KY+y5q7mxA/nDjyxwJzuFt0XLv6AyPG8b
 7X5wh2TzDEm5FLcjIdh+Gmgdz7509MI1jzFQgGymTA==
X-Google-Smtp-Source: AMsMyM67MXm/lQa1tGGwV3xRvrukDuk9G5nv3c5F7slxubnSc3M0kXcOawAQvsxcSxx7dCi+CFAeJs1NlPue8RXoIMI=
X-Received: by 2002:a05:6902:1202:b0:6ae:4d4e:f7ea with SMTP id
 s2-20020a056902120200b006ae4d4ef7eamr14310764ybu.393.1663576860104; Mon, 19
 Sep 2022 01:41:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220804194325.1596554-1-nfraprado@collabora.com>
In-Reply-To: <20220804194325.1596554-1-nfraprado@collabora.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 19 Sep 2022 16:40:34 +0800
Message-ID: <CAJMQK-hOxxvkjgOxA6KLLUJxxBehHDQvRo-Y_FLMPLEfkoVMzA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: dsi: Move mtk_dsi_stop() call back to
 mtk_dsi_poweroff()
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
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
 Xinlei Lee <xinlei.lee@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 19, 2022 at 4:39 PM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> As the comment right before the mtk_dsi_stop() call advises,
> mtk_dsi_stop() should only be called after
> mtk_drm_crtc_atomic_disable(). That's because that function calls
> drm_crtc_wait_one_vblank(), which requires the vblank irq to be enabled.
>
> Previously mtk_dsi_stop(), being in mtk_dsi_poweroff() and guarded by a
> refcount, would only be called at the end of
> mtk_drm_crtc_atomic_disable(), through the call to mtk_crtc_ddp_hw_fini()=
.
> Commit cde7e2e35c28 ("drm/mediatek: Separate poweron/poweroff from
> enable/disable and define new funcs") moved the mtk_dsi_stop() call to
> mtk_output_dsi_disable(), causing it to be called before
> mtk_drm_crtc_atomic_disable(), and consequently generating vblank
> timeout warnings during suspend.
>
> Move the mtk_dsi_stop() call back to mtk_dsi_poweroff() so that we have
> a working vblank irq during mtk_drm_crtc_atomic_disable() and stop
> getting vblank timeout warnings.
>
> Fixes: cde7e2e35c28 ("drm/mediatek: Separate poweron/poweroff from enable=
/disable and define new funcs")
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
>
Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>

Tested on mt8183 jacuzzi and mt8186 that this patch fixes the vblank warnin=
g.

> ---
>
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index 9cc406e1eee1..f8ad59771551 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -685,6 +685,16 @@ static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
>         if (--dsi->refcount !=3D 0)
>                 return;
>
> +       /*
> +        * mtk_dsi_stop() and mtk_dsi_start() is asymmetric, since
> +        * mtk_dsi_stop() should be called after mtk_drm_crtc_atomic_disa=
ble(),
> +        * which needs irq for vblank, and mtk_dsi_stop() will disable ir=
q.
> +        * mtk_dsi_start() needs to be called in mtk_output_dsi_enable(),
> +        * after dsi is fully set.
> +        */
> +       mtk_dsi_stop(dsi);
> +
> +       mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500);
>         mtk_dsi_reset_engine(dsi);
>         mtk_dsi_lane0_ulp_mode_enter(dsi);
>         mtk_dsi_clk_ulp_mode_enter(dsi);
> @@ -735,17 +745,6 @@ static void mtk_output_dsi_disable(struct mtk_dsi *d=
si)
>         if (!dsi->enabled)
>                 return;
>
> -       /*
> -        * mtk_dsi_stop() and mtk_dsi_start() is asymmetric, since
> -        * mtk_dsi_stop() should be called after mtk_drm_crtc_atomic_disa=
ble(),
> -        * which needs irq for vblank, and mtk_dsi_stop() will disable ir=
q.
> -        * mtk_dsi_start() needs to be called in mtk_output_dsi_enable(),
> -        * after dsi is fully set.
> -        */
> -       mtk_dsi_stop(dsi);
> -
> -       mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500);
> -
>         dsi->enabled =3D false;
>  }
>
> --
> 2.37.1
>
