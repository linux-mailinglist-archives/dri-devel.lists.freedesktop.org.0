Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79502964948
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 16:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E2E10E6F7;
	Thu, 29 Aug 2024 14:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IXCxsIij";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 312C710E6F7
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 14:57:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 606DFA4411E
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 14:57:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE35C4CEC9
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 14:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724943459;
 bh=77GZ3QzaWVWSIhtGl6NhqkeP6FIDiOftlrdOL+sQSfw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IXCxsIijxUX/8BlxE4wUwVpkDDZPGZE9b2TUSGTOSni2Hu78alR/djQiMtZnQVhB0
 8wFS0l6/gylyIqYoqPTJCyjybjCq0aq72vjtu1XRHAkF+oK4wbI4CAdN2yaz2HPSbI
 5AF4xUklzO5vLWZRZuVQ5qb5HwJNH4i/1tUWQr+xVNdIR14gZ3HJ15e2+39VF1hKI6
 lyZG5fdUN6TftBMjrh+wrKOFRy6Lp8XJdduhr5D2EArIoi9AUUyolhhzJB/5Ip5vfJ
 5dalhgT/FghRSBJgQZKaDBMd48gki3+17ofaGHTkMk+GoPRejpGiGYMtyhRJfuWBN9
 roZkJFd3nU04Q==
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-7cd835872ceso495849a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 07:57:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUymi7IWbO3weR8T8E1JbwHKKlLKjkyH5C+KQy3gWk+g43DLxCnKamMc8tuFgxm/pLeDeYAsvNAKXQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeZde5pmDGmXV58AuCDrXKS4CbCBKGCT0V/72nxElCV4evCtz+
 yxP1C5EcI/el4oUc64ioW+5NGH2JI0vcHDiCGFu71LBUzVCiMswt9ENt0GMlUrSRe/NVeU8Mpvv
 nxJAJlH8J9NLUD/X6XbGErYsbtA==
X-Google-Smtp-Source: AGHT+IHbbf11aBEzm+xsp/uTtv2EomAhCmlwdvkMwIl7kiohHuf6+VCO/ZMXf47TFVKkRpa1ddvlFhJUARNVpXA5tY0=
X-Received: by 2002:a05:6a20:c89c:b0:1c0:ef24:4125 with SMTP id
 adf61e73a8af0-1cce101e0a0mr3244740637.26.1724943459001; Thu, 29 Aug 2024
 07:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240828101511.3269822-1-fshao@chromium.org>
In-Reply-To: <20240828101511.3269822-1-fshao@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 29 Aug 2024 22:57:52 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9K5wb_d-DbFnDKDUPdSkt9Tt8ObbVc6eErehpO1SNbvw@mail.gmail.com>
Message-ID: <CAAOTY_9K5wb_d-DbFnDKDUPdSkt9Tt8ObbVc6eErehpO1SNbvw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Use spin_lock_irqsave() for CRTC event lock
To: Fei Shao <fshao@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bibby Hsieh <bibby.hsieh@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
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

Hi, Fei:

Fei Shao <fshao@chromium.org> =E6=96=BC 2024=E5=B9=B48=E6=9C=8828=E6=97=A5 =
=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=886:16=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Use the state-aware spin_lock_irqsave() and spin_unlock_irqrestore()
> to avoid unconditionally re-enabling the local interrupts.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Fixes: 411f5c1eacfe ("drm/mediatek: handle events when enabling/disabling=
 crtc")
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
>
>  drivers/gpu/drm/mediatek/mtk_crtc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediat=
ek/mtk_crtc.c
> index 6f34f573e127..42f47086f414 100644
> --- a/drivers/gpu/drm/mediatek/mtk_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
> @@ -449,6 +449,7 @@ static void mtk_crtc_ddp_hw_fini(struct mtk_crtc *mtk=
_crtc)
>  {
>         struct drm_device *drm =3D mtk_crtc->base.dev;
>         struct drm_crtc *crtc =3D &mtk_crtc->base;
> +       unsigned long flags;
>         int i;
>
>         for (i =3D 0; i < mtk_crtc->ddp_comp_nr; i++) {
> @@ -480,10 +481,10 @@ static void mtk_crtc_ddp_hw_fini(struct mtk_crtc *m=
tk_crtc)
>         pm_runtime_put(drm->dev);
>
>         if (crtc->state->event && !crtc->state->active) {
> -               spin_lock_irq(&crtc->dev->event_lock);
> +               spin_lock_irqsave(&crtc->dev->event_lock, flags);
>                 drm_crtc_send_vblank_event(crtc, crtc->state->event);
>                 crtc->state->event =3D NULL;
> -               spin_unlock_irq(&crtc->dev->event_lock);
> +               spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
>         }
>  }
>
> --
> 2.46.0.295.g3b9ea8a38a-goog
>
