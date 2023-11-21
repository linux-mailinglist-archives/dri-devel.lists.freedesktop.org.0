Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 293767F2B1F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 11:59:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D409110E2DC;
	Tue, 21 Nov 2023 10:59:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB79310E2DC
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 10:59:19 +0000 (UTC)
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 61B9466072F6;
 Tue, 21 Nov 2023 10:59:17 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700564358;
 bh=hLDTvtjHXdN1UWZwGnLWI4X4zJiWHH+M2Ta83yfqwfo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gAvj6e7dR5Diin4goCICBXZjFF0Mbi7wDy70vPr2MNWXzA9tHviIkY3PWf86K/pvy
 Q8WDKjMTWUL5RqPnWYw07zhdKrpVX8GioYG3k5iIYOX3CFRji0z2lDf8BnuxMrod2H
 LM908JjgUDU4b0bAT+bhXKkuEeWodKrXiRKvt3IvN06Ye6B3AL7mfoU7q40/wIRqVE
 asPetWPduA2+TQQ3nZ5N87ylwqDjQOosNtsDQ9YSiVw/MNqEUtYMIsm2DkiFCgwCeF
 tud5BpwDx8qo2EuUduEn7ApiU8e/RaV6WQqB1tFdZV4ZNySVIF/3hmmBd3GE9fbRx7
 Ml/4gYS9CYO4g==
Message-ID: <8fd1affd-936d-415e-9f1f-b0415b68ddb6@collabora.com>
Date: Tue, 21 Nov 2023 11:59:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: dp: Add phy_mtk_dp module as pre-dependency
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20231120202837.396760-1-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231120202837.396760-1-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Guillaume Ranquet <granquet@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Markus Schneider-Pargmann <msp@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Bo-Chen Chen <rex-bc.chen@mediatek.com>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 20/11/23 21:28, Nícolas F. R. A. Prado ha scritto:
> The mtk_dp driver registers a phy device which is handled by the
> phy_mtk_dp driver and assumes that the phy probe will complete
> synchronously, proceeding to make use of functionality exposed by that
> driver right away. This assumption however is false when the phy driver
> is built as a module, causing the mtk_dp driver to fail probe in this
> case.
> 
> Add the phy_mtk_dp module as a pre-dependency to the mtk_dp module to
> ensure the phy module has been loaded before the dp, so that the phy
> probe happens synchrounously and the mtk_dp driver can probe
> successfully even with the phy driver built as a module.
> 

You forgot a Suggested-by here :-P

> Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

It's fine anyway; being the best solution that we can use:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> 
> ---
> 
>   drivers/gpu/drm/mediatek/mtk_dp.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
> index e4c16ba9902d..2136a596efa1 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -2818,3 +2818,4 @@ MODULE_AUTHOR("Markus Schneider-Pargmann <msp@baylibre.com>");
>   MODULE_AUTHOR("Bo-Chen Chen <rex-bc.chen@mediatek.com>");
>   MODULE_DESCRIPTION("MediaTek DisplayPort Driver");
>   MODULE_LICENSE("GPL");
> +MODULE_SOFTDEP("pre: phy_mtk_dp");

