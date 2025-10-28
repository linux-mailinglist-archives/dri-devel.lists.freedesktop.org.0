Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7602EC154A1
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 15:58:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7382610E0EE;
	Tue, 28 Oct 2025 14:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fKpHJDLw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E474210E0EE
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 14:58:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E4CB162002
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 14:58:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93632C116D0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 14:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761663512;
 bh=fgrnGbqm4nMPYm0YFueCTLn38xVSXMpZjjfyexFg4zU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fKpHJDLw+LdcON/i87zMt8WeFuLsLOkXCh8EaH+KceiRe9xB3NmNNEipNh06u89Qy
 AbqjbUQwBsH4cwpPlCHdRBkk9PFn/7DfhwH4wDXKj9w6C1tZEt3y3ZUiJWCH/WFiNw
 wuRNVHBpYpGjfgPS0713G9KL2KmLK817qGbDZUlo8sOcLtxCp2aLJQGxChIquDiQcy
 fj2U9lW2HSHWHA2eEH71FCQ37XgLZAwhPofn7BzXS5LFcnE+bQasacaEn/LkVXHexC
 GPwoVTWQz66mefaw9y9zjwlCNXEP4ixcVgZvMvMMxqtbsTY46dce7rKzABe6widukp
 ht3DHx+N8Nl9w==
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-26e68904f0eso65576735ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 07:58:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVQENe5g9zyDU0pxzh8c1Mo0yRR6DiJGYw6zZHio8FMw0zcJUDZNfGclLzadcQDRZTBpN7BJHkfb/k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXS8Mg7SYFd1qVW83evbZYHKFvQ4PCxsMMbmIWcsOLpNiBxIpe
 RffB7KBeYa3PUwtjdB/itFtiCLhfMHpKLWxZ5jsXdXdP9T+aiUnsg9a0OV9KWHUKS6LGBTpeUPt
 5Cc1pcZqqklae1+8rmCRRcnf3fsBiCQ==
X-Google-Smtp-Source: AGHT+IHme6RPgheMLj6a7fR8+m2u2gZ6x3MVu+ulovS2o0skDQiD/daH6FArZWmguxDIJ5KfNDpOra+vAhdzzjURlKs=
X-Received: by 2002:a17:902:dac4:b0:294:63ea:b570 with SMTP id
 d9443c01a7336-294cb65f622mr46857375ad.48.1761663512099; Tue, 28 Oct 2025
 07:58:32 -0700 (PDT)
MIME-Version: 1.0
References: <20251006093937.27869-1-johan@kernel.org>
In-Reply-To: <20251006093937.27869-1-johan@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 28 Oct 2025 14:58:18 +0000
X-Gmail-Original-Message-ID: <CAAOTY_9rf948byRD3_cCeXREeLt2jXHL2CZPAEUUvAVgJc3dBA@mail.gmail.com>
X-Gm-Features: AWmQ_bnhgsaxyx7-K3gUASFOVVQcGX3sTjPCy2q_RVuuZkcZXgMfDZNuqSDRMTE
Message-ID: <CAAOTY_9rf948byRD3_cCeXREeLt2jXHL2CZPAEUUvAVgJc3dBA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: fix device use-after-free on unbind
To: Johan Hovold <johan@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 CK Hu <ck.hu@mediatek.com>, 
 Ma Ke <make24@iscas.ac.cn>, Sjoerd Simons <sjoerd@collabora.com>, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

Johan Hovold <johan@kernel.org> =E6=96=BC 2025=E5=B9=B410=E6=9C=886=E6=97=
=A5 =E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=889:48=E5=AF=AB=E9=81=93=EF=BC=9A
>
> A recent change fixed device reference leaks when looking up drm
> platform device driver data during bind() but failed to remove a partial
> fix which had been added by commit 80805b62ea5b ("drm/mediatek: Fix
> kobject put for component sub-drivers").
>
> This results in a reference imbalance on component bind() failures and
> on unbind() which could lead to a user-after-free.
>
> Make sure to only drop the references after retrieving the driver data
> by effectively reverting the previous partial fix.
>
> Note that holding a reference to a device does not prevent its driver
> data from going away so there is no point in keeping the reference.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 1f403699c40f ("drm/mediatek: Fix device/node reference count leaks=
 in mtk_drm_get_all_drm_priv")
> Reported-by: Sjoerd Simons <sjoerd@collabora.com>
> Link: https://lore.kernel.org/r/20251003-mtk-drm-refcount-v1-1-3b3f2813b0=
db@collabora.com
> Cc: stable@vger.kernel.org
> Cc: Ma Ke <make24@iscas.ac.cn>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 384b0510272c..a94c51a83261 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -686,10 +686,6 @@ static int mtk_drm_bind(struct device *dev)
>         for (i =3D 0; i < private->data->mmsys_dev_num; i++)
>                 private->all_drm_private[i]->drm =3D NULL;
>  err_put_dev:
> -       for (i =3D 0; i < private->data->mmsys_dev_num; i++) {
> -               /* For device_find_child in mtk_drm_get_all_priv() */
> -               put_device(private->all_drm_private[i]->dev);
> -       }
>         put_device(private->mutex_dev);
>         return ret;
>  }
> @@ -697,18 +693,12 @@ static int mtk_drm_bind(struct device *dev)
>  static void mtk_drm_unbind(struct device *dev)
>  {
>         struct mtk_drm_private *private =3D dev_get_drvdata(dev);
> -       int i;
>
>         /* for multi mmsys dev, unregister drm dev in mmsys master */
>         if (private->drm_master) {
>                 drm_dev_unregister(private->drm);
>                 mtk_drm_kms_deinit(private->drm);
>                 drm_dev_put(private->drm);
> -
> -               for (i =3D 0; i < private->data->mmsys_dev_num; i++) {
> -                       /* For device_find_child in mtk_drm_get_all_priv(=
) */
> -                       put_device(private->all_drm_private[i]->dev);
> -               }
>                 put_device(private->mutex_dev);
>         }
>         private->mtk_drm_bound =3D false;
> --
> 2.49.1
>
