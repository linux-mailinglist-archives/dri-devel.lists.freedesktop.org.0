Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D914A9ACBF8
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 16:13:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFBEE89101;
	Wed, 23 Oct 2024 14:12:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="W+br8yx0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF5189101
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 14:12:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8AB86A44E2E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 14:12:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18C2DC4CEE6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 14:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729692770;
 bh=lT+2VpBy0BT7oY5bPbktSNUFx97M8RvIUrfH+KcF/Dc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=W+br8yx0K06VIfrfvTTPp6H8RvGMv96AxJZySLP4dlcJFUhpirDAHaTFpIcPpoz/A
 N6QCXxzTD4M+AcJ6ap7fC3t/tpBJY9/E8+TUs6f/aQ8mO3vyHnxuTnyRZBeSEqLC7v
 C4Oa5C156i+HZJokRBkMJJt24mfC3vO3F05rKjaRqv9MUjPFz1MPgH3M2T16szp2XJ
 GhibYZl4h9CkJ46uip0M/M5DD1w9HsHBWwm8TnGy9BHdQMRTJx5OmlfCvnKkdo8UET
 jHEf+ItWv3xYMXwUYmIgW34LPDtXlrCeKIY8d6+WpoV8SvGQqyFeDBZybAhztAPfPV
 uL0NgWplSc4bg==
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-7ea7e2ff5ceso5297707a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 07:12:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUHeTxq78+XGlvMTd4EATpEYyLvZXa8bUlk3CTFVa/KsKUefUxll3RrkyZlWmLGYLPIDEC1cBx+iVc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydP5LaNatt89Gq4os0fTDWDDze/KuyPAzPOvVGw1YQBW7ru4ZD
 S1DmuKOiwyMp3nnxtDTNg66k2u58y3bhFd3IdWAdFv7oX2WpshxdgBXU7uZx5oziSdKn3UQyVIO
 w2tOHZNqdMEFZKItZ6qiRWh7PVQ==
X-Google-Smtp-Source: AGHT+IFlsad2/fwPdFPf6XhOvIClD0wIrRQ18NzI0oBgziJzaXBbTh6qI7+JGmlilOHZTPE+QeviZQ7b6sPyVX5hBBk=
X-Received: by 2002:a05:6a21:3a41:b0:1d8:a247:945d with SMTP id
 adf61e73a8af0-1d978bef8bdmr2663185637.50.1729692769613; Wed, 23 Oct 2024
 07:12:49 -0700 (PDT)
MIME-Version: 1.0
References: <cc537bd6-837f-4c85-a37b-1a007e268310@stanley.mountain>
In-Reply-To: <cc537bd6-837f-4c85-a37b-1a007e268310@stanley.mountain>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 23 Oct 2024 22:13:10 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8kG67ns8OokhzujmH7UNM-O+4Aa=GruO_spLOALMeARA@mail.gmail.com>
Message-ID: <CAAOTY_8kG67ns8OokhzujmH7UNM-O+4Aa=GruO_spLOALMeARA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Fix potential NULL dereference in
 mtk_crtc_destroy()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org, 
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
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

Hi, Dan:

Dan Carpenter <dan.carpenter@linaro.org> =E6=96=BC 2024=E5=B9=B49=E6=9C=881=
2=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=884:45=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> In mtk_crtc_create(), if the call to mbox_request_channel() fails then we
> set the "mtk_crtc->cmdq_client.chan" pointer to NULL.  In that situation,
> we do not call cmdq_pkt_create().
>
> During the cleanup, we need to check if the "mtk_crtc->cmdq_client.chan"
> is NULL first before calling cmdq_pkt_destroy().  Calling
> cmdq_pkt_destroy() is unnecessary if we didn't call cmdq_pkt_create() and
> it will result in a NULL pointer dereference.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 7627122fd1c0 ("drm/mediatek: Add cmdq_handle in mtk_crtc")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_crtc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediat=
ek/mtk_crtc.c
> index 175b00e5a253..c15013792583 100644
> --- a/drivers/gpu/drm/mediatek/mtk_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
> @@ -127,9 +127,8 @@ static void mtk_crtc_destroy(struct drm_crtc *crtc)
>
>         mtk_mutex_put(mtk_crtc->mutex);
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> -       cmdq_pkt_destroy(&mtk_crtc->cmdq_client, &mtk_crtc->cmdq_handle);
> -
>         if (mtk_crtc->cmdq_client.chan) {
> +               cmdq_pkt_destroy(&mtk_crtc->cmdq_client, &mtk_crtc->cmdq_=
handle);
>                 mbox_free_channel(mtk_crtc->cmdq_client.chan);
>                 mtk_crtc->cmdq_client.chan =3D NULL;
>         }
> --
> 2.45.2
>
