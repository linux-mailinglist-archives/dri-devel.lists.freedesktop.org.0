Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA817A9302
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 11:22:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8BD10E048;
	Thu, 21 Sep 2023 09:22:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92B2A10E048
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 09:22:54 +0000 (UTC)
Received: from [192.168.0.125] (unknown [82.76.24.202])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: ehristev)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 542A566072EE;
 Thu, 21 Sep 2023 10:22:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695288173;
 bh=5h61+8nLC/rHN8t6PmIBUe2/aZ2dOAIEsl5dm5eSgJA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Dzv0gpQSDo0rKOZzDlhbND/2kK6VC1bMm0YlWY+r9vdq/Sfg2whf1875ZtdTQwOks
 cg0jKDZaJ87PPpjE4cgeq2G2kaw3ybXKOb4HF+EkTwlzlhu69qyisPOAgw/Ek8YgaA
 r2ILSPR22QLBi767iiaKmTBntRz7DSovd57aM5Tt2N2d3XixEOrz9vs5eftTeUW0ls
 aV0vcUGCtqZLJ43Yn6sowhzHcyIkjB13XAppWge1fr/FBMMSq88G5U1D7Uau42E+NV
 k05eDgRjS9fftNKPYsvV9+g4c6fs3Y6fWs+ccTlofX+ujDI/ueRmwuh6rc4OL/De5X
 MJI+pV4OOqlBg==
Message-ID: <3a9a9d52-0db9-360e-55f7-78753428ee7f@collabora.com>
Date: Thu, 21 Sep 2023 12:22:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 1/2] drm/mediatek: fix kernel oops if no crtc is found
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230905084922.3908121-1-mwalle@kernel.org>
From: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <20230905084922.3908121-1-mwalle@kernel.org>
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Nancy . Lin" <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, Stu Hsieh <stu.hsieh@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/5/23 11:49, Michael Walle wrote:
> drm_crtc_from_index(0) might return NULL if there are no CRTCs
> registered at all which will lead to a kernel oops in
> mtk_drm_crtc_dma_dev_get(). Add the missing return value check.
> 
> Fixes: 0d9eee9118b7 ("drm/mediatek: Add drm ovl_adaptor sub driver for MT8195")
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

I tried this patch as well, hit the crash during my tests. I also 
reviewed your changes

Tested-by: Eugen Hristev <eugen.hristev@collabora.com>
Reviewed-by: Eugen Hristev <eugen.hristev@collabora.com>

Eugen

> ---
> v4:
>   - collected tags
> v3:
>   - none
> v2:
>   - collected tags
>   - fixed typos
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 93552d76b6e7..2c582498817e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -420,6 +420,7 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>   	struct mtk_drm_private *private = drm->dev_private;
>   	struct mtk_drm_private *priv_n;
>   	struct device *dma_dev = NULL;
> +	struct drm_crtc *crtc;
>   	int ret, i, j;
>   
>   	if (drm_firmware_drivers_only())
> @@ -494,7 +495,9 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>   	}
>   
>   	/* Use OVL device for all DMA memory allocations */
> -	dma_dev = mtk_drm_crtc_dma_dev_get(drm_crtc_from_index(drm, 0));
> +	crtc = drm_crtc_from_index(drm, 0);
> +	if (crtc)
> +		dma_dev = mtk_drm_crtc_dma_dev_get(crtc);
>   	if (!dma_dev) {
>   		ret = -ENODEV;
>   		dev_err(drm->dev, "Need at least one OVL device\n");

