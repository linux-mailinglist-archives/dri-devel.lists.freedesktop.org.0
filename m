Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D8E3C5E90
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 16:47:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1475189CA1;
	Mon, 12 Jul 2021 14:47:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D7B89CA1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 14:47:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 01C3F611C0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 14:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626101251;
 bh=GNc7iEYnBjS+TNAD0DgnhNoeKiMhXXlDvGKvY8DoZQs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hfzOTcL4oK1IocXnx1Wq7lqzjwGJwnbHvjCA3/7lrwqKbAJ/ScbvxhKybAAaQ/Gi6
 4KqLLt9Q9s+DD5gcsJObTWDN23anRPJYI22GiDJjj+tfSK9ePDv7wk0OKb/aPBo79a
 0oCLEMOU/AJiY4MFIlbWzHNzzGdhnBCEILwbyY4LGVptCpVjAgDjisuNqzHSGp5l2q
 1MgzktbTqbyMNF44av/NHwXX6DKmKeelHjbsMCXq+alV734bnq0HCcNDC7YLg1dnZG
 Eq3lebipgdKtxN7aZ8uZdA4zWYjbtyIpuqEUwnM9Ji1sUAD3Q6MqaUsKcEstj2QYuo
 l2A8RNOg9eb1Q==
Received: by mail-ej1-f51.google.com with SMTP id hr1so35143106ejc.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 07:47:30 -0700 (PDT)
X-Gm-Message-State: AOAM533fXml8pLO/c0eZm3qRNET/XyGF3fBJp9Ac9k0/OcS4P9V7n0Vd
 XyOCjMS9l4gsU8y+Vd9Dpq4r8P3dm9X9/6w7Gw==
X-Google-Smtp-Source: ABdhPJz9wP8zZM8xJ1hflPWLyv4neAHs8saPkzoZPDHElB1yvcecZ7bIL4bSeSE95OMDgqTedtJuc4UOl39QeqziLFw=
X-Received: by 2002:a17:907:62a1:: with SMTP id
 nd33mr53383549ejc.303.1626101249542; 
 Mon, 12 Jul 2021 07:47:29 -0700 (PDT)
MIME-Version: 1.0
References: <1625986431-27399-1-git-send-email-yongqiang.niu@mediatek.com>
 <1625986431-27399-2-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1625986431-27399-2-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 12 Jul 2021 22:47:18 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-15k_Fq4svKfaKukuYxc4DRfqP1kRudR9wgSrkc-+ZoQ@mail.gmail.com>
Message-ID: <CAAOTY_-15k_Fq4svKfaKukuYxc4DRfqP1kRudR9wgSrkc-+ZoQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/mediatek: adjust rdma fifo threshold calculate
 formula
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
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
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 DTML <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Yongqiang:

Yongqiang Niu <yongqiang.niu@mediatek.com> =E6=96=BC 2021=E5=B9=B47=E6=9C=
=8811=E6=97=A5 =E9=80=B1=E6=97=A5 =E4=B8=8B=E5=8D=882:54=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> the orginal formula will caused rdma fifo threshold config overflow
> and no one could come out a solution for all SoC,
> set threshold to 70% of max fifo size to make sure it will
> not overflow, and 70% is a empirical value

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/m=
ediatek/mtk_disp_rdma.c
> index f123fc0..f1f6a2e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> @@ -164,10 +164,10 @@ void mtk_rdma_config(struct device *dev, unsigned i=
nt width,
>         /*
>          * Enable FIFO underflow since DSI and DPI can't be blocked.
>          * Keep the FIFO pseudo size reset default of 8 KiB. Set the
> -        * output threshold to 6 microseconds with 7/6 overhead to
> -        * account for blanking, and with a pixel depth of 4 bytes:
> +        * output threshold to 70% of max fifo size to make sure the
> +        * threhold will not overflow
>          */
> -       threshold =3D width * height * vrefresh * 4 * 7 / 1000000;
> +       threshold =3D rdma_fifo_size * 7 / 10;
>         reg =3D RDMA_FIFO_UNDERFLOW_EN |
>               RDMA_FIFO_PSEUDO_SIZE(rdma_fifo_size) |
>               RDMA_OUTPUT_VALID_FIFO_THRESHOLD(threshold);
> --
> 1.8.1.1.dirty
>
