Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4568267E922
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 16:12:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DF7210E9B0;
	Fri, 27 Jan 2023 15:12:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 756C610E99A
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 15:12:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id E0E31CE291D
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 15:12:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3557C433AA
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 15:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674832338;
 bh=XEGrj08mrGc6T/CEgbRHQGd2YGIb4XomZMq/krxPioc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NE7iOLypBK0VcyoXe938Wrub/Dw5KzL7dSr6El5xLMjFDdDwRIPzcnb+RnFl1DtR4
 zGKUbwkZUSDBwoNhnLnciBA2uFF3bwTK1gnIasFfpIKr/mtB4yhOjWYYnOTsRZT5Jp
 1o+734IVEyh++hTgc3TLwfQv34XrT54Ip0EG8+3tetxKa4A359ip3Ehvu7DMyVqjWh
 4r7bfZr3KRlXZHsFJm47FxEOMa0EkDWPOBS/DB8Tig1jfugQ814tNJDL2x7s3zbC+K
 lLG0wk7i3F7AJlWLNjiOJV3nzAa+Wqrcg2t110cjECkctz+1+EyjVYeM/ggu2PUuCN
 hjnKH0Nwe32EQ==
Received: by mail-lf1-f44.google.com with SMTP id br9so8635058lfb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 07:12:18 -0800 (PST)
X-Gm-Message-State: AFqh2krXYbOutbzvmmkg8cR0FyPeOzgVjoj3qT4jgj2Bg4RVTlZEmkbF
 3avO6NvEoXFVuD2HZuUEZuaw5th/MSoZj2857A==
X-Google-Smtp-Source: AMrXdXsMmkgRBQo0TFynmEJqLTZw81aRoOnst7MOnAoZNQlO8IkeJrvkMJCE/StM8437PfU6MBsslI61mZGCWtvv18g=
X-Received: by 2002:a05:6512:1043:b0:4ca:f9e4:c410 with SMTP id
 c3-20020a056512104300b004caf9e4c410mr2228287lfb.97.1674832336570; Fri, 27 Jan
 2023 07:12:16 -0800 (PST)
MIME-Version: 1.0
References: <20221122143949.3493104-1-nfraprado@collabora.com>
In-Reply-To: <20221122143949.3493104-1-nfraprado@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 27 Jan 2023 23:12:04 +0800
X-Gmail-Original-Message-ID: <CAAOTY__oFQ8DyAbdCyQEGAw7tFi+6AONiOHZxu_qJhT9MHNpoQ@mail.gmail.com>
Message-ID: <CAAOTY__oFQ8DyAbdCyQEGAw7tFi+6AONiOHZxu_qJhT9MHNpoQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: Clean dangling pointer on bind error path
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-kernel@vger.kernel.org,
 Daniel Kurtz <djkurtz@chromium.org>, Mao Huang <littlecvr@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Nicolas:

N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com> =E6=96=BC 2022=E5=B9=
=B411=E6=9C=8822=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8810:39=E5=AF=
=AB=E9=81=93=EF=BC=9A
>
> mtk_drm_bind() can fail, in which case drm_dev_put() is called,
> destroying the drm_device object. However a pointer to it was still
> being held in the private object, and that pointer would be passed along
> to DRM in mtk_drm_sys_prepare() if a suspend were triggered at that
> point, resulting in a panic. Clean the pointer when destroying the
> object in the error path to prevent this from happening.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT817=
3.")
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
>
> ---
>
> Changes in v2:
> - Added Fixes tag
>
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 39a42dc8fb85..a21ff1b3258c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -514,6 +514,7 @@ static int mtk_drm_bind(struct device *dev)
>  err_deinit:
>         mtk_drm_kms_deinit(drm);
>  err_free:
> +       private->drm =3D NULL;
>         drm_dev_put(drm);
>         return ret;
>  }
> --
> 2.38.1
>
