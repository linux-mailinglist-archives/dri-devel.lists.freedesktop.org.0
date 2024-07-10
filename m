Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A732492D134
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 14:02:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5876A10E17D;
	Wed, 10 Jul 2024 12:02:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="M7N0JbUq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A2310E767
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 12:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1720612944;
 bh=N5cfTQaboV7BMNjSFWJkZ8/Yiw9vmeDA/9AlCrU3oK4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=M7N0JbUqUZ2vQHTAx3dh9Ud6rzzPLnHVUsgPGi6zrUKhxER+HUuqzuo07vIUVC0tl
 JNNQ12nb3lIElhmLWwJH5AOdg/FpzaTfTwU6SA8ZrGjgnjF2eVFOmcIjP+OI8ibb/A
 Xzy70b1LdLTsHwJogNsR6WXpCKgEGKJ1NO1PGNfc7TIPa0mzAUazUDUU1M1W9ODuCs
 W6uVjDO8j6vZNUY9p7YsJTEFCmInqu6fhNDv0KKRYu42R/Ef5jm1gP/6Z45Dli3tae
 hmV8L2mwIKtRK3u9aCZA6L+Fsi3rVooVZGRcH2FQnJn9tjN9dCN1nbQ3rkbaHbvqxb
 QBKfhAawMRoeQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 54DCF3781185;
 Wed, 10 Jul 2024 12:02:23 +0000 (UTC)
Message-ID: <d6517e21-8f6f-44e9-b7ac-93e0860a5e7a@collabora.com>
Date: Wed, 10 Jul 2024 14:02:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] drm/mediatek: Support "Pre-multiplied" blending in
 OVL
To: shawn.sung@mediatek.com, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>,
 CK Hu <ck.hu@mediatek.com>
References: <20240710-alpha-blending-v3-0-289c187f9c6f@mediatek.com>
 <20240710-alpha-blending-v3-3-289c187f9c6f@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240710-alpha-blending-v3-3-289c187f9c6f@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Il 10/07/24 10:52, Hsiao Chien Sung via B4 Relay ha scritto:
> From: Hsiao Chien Sung <shawn.sung@mediatek.com>
> 
> Support "Pre-multiplied" alpha blending mode on in OVL.
> Before this patch, only the "coverage" mode is supported.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 32 +++++++++++++++++++++++++-------
>   1 file changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index add671c38613..89b439dcf3a6 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -56,8 +56,12 @@
>   #define GMC_THRESHOLD_HIGH	((1 << GMC_THRESHOLD_BITS) / 4)
>   #define GMC_THRESHOLD_LOW	((1 << GMC_THRESHOLD_BITS) / 8)
>   
> +#define OVL_CON_CLRFMT_MAN	BIT(23)
>   #define OVL_CON_BYTE_SWAP	BIT(24)
> -#define OVL_CON_MTX_YUV_TO_RGB	(6 << 16)
> +
> +/* OVL_CON_RGB_SWAP works only if OVL_CON_CLRFMT_MAN is enabled */
> +#define OVL_CON_RGB_SWAP	BIT(25)
> +
>   #define OVL_CON_CLRFMT_RGB	(1 << 12)
>   #define OVL_CON_CLRFMT_ARGB8888	(2 << 12)
>   #define OVL_CON_CLRFMT_RGBA8888	(3 << 12)
> @@ -65,6 +69,11 @@
>   #define OVL_CON_CLRFMT_BGRA8888	(OVL_CON_CLRFMT_ARGB8888 | OVL_CON_BYTE_SWAP)
>   #define OVL_CON_CLRFMT_UYVY	(4 << 12)
>   #define OVL_CON_CLRFMT_YUYV	(5 << 12)
> +#define OVL_CON_MTX_YUV_TO_RGB	(6 << 16)
> +#define OVL_CON_CLRFMT_PARGB8888 ((3 << 12) | OVL_CON_CLRFMT_MAN)


Shouldn't this be (OVL_CON_CLRFMT_RGBA8888 | OVL_CON_CLRFMT_MAN) ??

That's getting written to the same register, so I'd guess this is like that; but
then, if it is like that, why is it PARGB888 and not PRGBA888?!

Regards,
Angelo


