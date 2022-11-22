Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB003633813
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 10:12:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8CE10E3BA;
	Tue, 22 Nov 2022 09:12:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2347210E3BA
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 09:12:12 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E202B6602AC7;
 Tue, 22 Nov 2022 09:12:09 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1669108330;
 bh=XQs9y9qnM68EyMoHPrxiDgq88Oc9TnrG2mdHxwEI2sQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CVkZzf1bm1eq3dnFoEDL8E2t9w+rllcHe6eClLcXsHRs+VHN3hKPjLV5NNgxlWMET
 eCx0667iQP4uhsgDs0Ept2jcZ+WRzK2yvZ+iscJPNmW3/3ygNLS+BSQh90MtVLdVD/
 MWNJoQHV0S4QC2P5aJ+ftzSDFA4sDFr9UU6JgqR+1Qse4U7PDJb3mdOK0v1Ea5O1oX
 dYDT2WE7ySmP1NVyuln3YcUSAec7mQqv7o+88+519dSNMboAtN0GUhGifNWE0UzpW4
 Y4O/McoElEA37GpxO7TJ9v+kFSWtsRDMXUk/tTthX6tDSzp7UWo/Uz+SgOZx2FgzhS
 /s9t1wFc4bXNg==
Message-ID: <1ff98f52-93e1-d375-47ae-30b74068ea5b@collabora.com>
Date: Tue, 22 Nov 2022 10:12:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] drm/mediatek: Clean dangling pointer on bind error path
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20221121223717.3429913-1-nfraprado@collabora.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221121223717.3429913-1-nfraprado@collabora.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 21/11/22 23:37, Nícolas F. R. A. Prado ha scritto:
> mtk_drm_bind() can fail, in which case drm_dev_put() is called,
> destroying the drm_device object. However a pointer to it was still
> being held in the private object, and that pointer would be passed along
> to DRM in mtk_drm_sys_prepare() if a suspend were triggered at that
> point, resulting in a panic. Clean the pointer when destroying the
> object in the error path to prevent this from happening.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 

Fixes tag please! :-)

Cheers,
Angelo

> ---
> 
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 39a42dc8fb85..a21ff1b3258c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -514,6 +514,7 @@ static int mtk_drm_bind(struct device *dev)
>   err_deinit:
>   	mtk_drm_kms_deinit(drm);
>   err_free:
> +	private->drm = NULL;
>   	drm_dev_put(drm);
>   	return ret;
>   }


