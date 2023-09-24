Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C09807ACA13
	for <lists+dri-devel@lfdr.de>; Sun, 24 Sep 2023 16:40:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF6FD10E0CC;
	Sun, 24 Sep 2023 14:40:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E851110E0CC
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 14:40:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 66596B80B04
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 14:40:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82816C433CD
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 14:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695566422;
 bh=9GRsckWSSu1mlk9vmJKy9J27I3v7LoT+WjbT3ntqne0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gCcVsK/CkNAlyMVqWnN4VPt1kzjPoqNo5oo6alEewEruR12Pzpino4CvWoSEgGcO9
 /Rr00Y0Eua09CO0vZ47JpQ4ZfAewqtiIQGn/ievdlfg+l9gA/P2JsZHOpSKtYjcmOi
 Z2VSOmKGDykY20pTAlF+gU2khzpEQXGzvE14e7FGIPHLrPivhJKHpyhKUxNoN90hAI
 o+ys+PbAVXHqOPxaoUULYRreT4jz+eKeyLE6ta0PKw+hQjdRkLKw2FRyl60crpglhM
 ds1KF+m+Nz2BsZ8sDZPAq6SCGYEYWmhz3fQP7DoMYDeD7lQboBTJQR0YEZi4kMkgrs
 pkb6lmrpQ3Izg==
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2bfea381255so80683921fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 07:40:22 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx+xNElrk8Z6T2zkEUMAtte0UisWB3Vu1dmJZB0ZGf09QIiuv3P
 FLlyTayr2vsnor+9G1A0ZeEbEDkWbsPm4mZ11w==
X-Google-Smtp-Source: AGHT+IHgb7dlF3spUK7WjEovMRqe4TqCew31OFnTTbuiTomARpVLNlO+VuNaMI73R08m9JXOZ3UuaIZrHQ9jk6PBkA0=
X-Received: by 2002:ac2:5f97:0:b0:503:200f:47a9 with SMTP id
 r23-20020ac25f97000000b00503200f47a9mr3453499lfe.15.1695566420722; Sun, 24
 Sep 2023 07:40:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230914131058.2472260-1-jani.nikula@intel.com>
In-Reply-To: <20230914131058.2472260-1-jani.nikula@intel.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 24 Sep 2023 22:40:04 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-Vn9eN+OjSWjo=WTrSasJs6h_N93PQgVAUU-NDeQ438Q@mail.gmail.com>
Message-ID: <CAAOTY_-Vn9eN+OjSWjo=WTrSasJs6h_N93PQgVAUU-NDeQ438Q@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek/dp: fix memory leak on ->get_edid callback
 error path
To: Jani Nikula <jani.nikula@intel.com>
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
 Guillaume Ranquet <granquet@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Markus Schneider-Pargmann <msp@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, stable@vger.kernel.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Bo-Chen Chen <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Jani:

Jani Nikula <jani.nikula@intel.com> =E6=96=BC 2023=E5=B9=B49=E6=9C=8814=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=889:13=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Setting new_edid to NULL leaks the buffer.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort drive=
r")
> Cc: Markus Schneider-Pargmann <msp@baylibre.com>
> Cc: Guillaume Ranquet <granquet@baylibre.com>
> Cc: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Cc: CK Hu <ck.hu@mediatek.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: <stable@vger.kernel.org> # v6.1+
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> ---
>
> UNTESTED
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index 2cb47f663756..8fc6eff68e30 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -2049,6 +2049,7 @@ static struct edid *mtk_dp_get_edid(struct drm_brid=
ge *bridge,
>          */
>         if (mtk_dp_parse_capabilities(mtk_dp)) {
>                 drm_err(mtk_dp->drm_dev, "Can't parse capabilities\n");
> +               kfree(new_edid);
>                 new_edid =3D NULL;
>         }
>
> --
> 2.39.2
>
