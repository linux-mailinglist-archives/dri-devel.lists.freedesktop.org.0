Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F79A8C746B
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 12:12:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8280110EC4F;
	Thu, 16 May 2024 10:12:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="U4jJXRQE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10FC510EC4F
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 10:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1715854321;
 bh=fJVijZDsk7G+N5ZyDazIeeDuEW47pTV5GN2yegKbc4s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=U4jJXRQEQ9NqrEbULaHQIdf6/LNc1tjtq9H0VDDd+AWcnVMH0yoqF1hM9h3BYYsrO
 jmTs0f+wdu4NNZF8aUQ37jo4tY5jGlupeOt0silOa73/mVBuLZK8fpib56bgU9/mxk
 hKECjqfE+bnd0ah2bzSZmtNwMw2IVBGDJgHFzw3jH2kB7fM2uMUOK/bYxzpuCDY5ov
 Y8HmqA03vGqdBQb3FEF7U+CWLdIiecb23ypUyYhLcUUTLP3d6u5vil1hR5Le0RfDb0
 xXG7jNYW21Qd71b0yl1I2wIH35KRecTOi+qBEOEmh8RRr9kKd+kVOrljGHLE1N0uyF
 CaqBGh//bGyfQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4A61C3780C13;
 Thu, 16 May 2024 10:12:01 +0000 (UTC)
Message-ID: <671f4976-46e6-4873-98b2-89df896e4a4f@collabora.com>
Date: Thu, 16 May 2024 12:12:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/mediatek: Convert to platform remove callback
 returning void
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <cover.1712681770.git.u.kleine-koenig@pengutronix.de>
 <4a64dfbfbcfdf9b7cd46bc8026223e69a4b453b4.1712681770.git.u.kleine-koenig@pengutronix.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <4a64dfbfbcfdf9b7cd46bc8026223e69a4b453b4.1712681770.git.u.kleine-koenig@pengutronix.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 09/04/24 19:02, Uwe Kleine-König ha scritto:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_padding.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_padding.c b/drivers/gpu/drm/mediatek/mtk_padding.c
> index 0d6451c149b6..9f92b720aaae 100644
> --- a/drivers/gpu/drm/mediatek/mtk_padding.c
> +++ b/drivers/gpu/drm/mediatek/mtk_padding.c
> @@ -137,10 +137,9 @@ static int mtk_padding_probe(struct platform_device *pdev)
>   	return 0;
>   }
>   
> -static int mtk_padding_remove(struct platform_device *pdev)
> +static void mtk_padding_remove(struct platform_device *pdev)
>   {
>   	component_del(&pdev->dev, &mtk_padding_component_ops);
> -	return 0;
>   }
>   
>   static const struct of_device_id mtk_padding_driver_dt_match[] = {
> @@ -151,7 +150,7 @@ MODULE_DEVICE_TABLE(of, mtk_padding_driver_dt_match);
>   
>   struct platform_driver mtk_padding_driver = {
>   	.probe		= mtk_padding_probe,
> -	.remove		= mtk_padding_remove,
> +	.remove_new	= mtk_padding_remove,
>   	.driver		= {
>   		.name	= "mediatek-disp-padding",
>   		.owner	= THIS_MODULE,

