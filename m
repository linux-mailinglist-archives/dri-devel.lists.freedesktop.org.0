Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE9C901CAA
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 10:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB2310E35D;
	Mon, 10 Jun 2024 08:14:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="mOnAwwTG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B92B110E35D
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 08:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1718007286;
 bh=hiymsBDkWx+5f+WbKRv/x3OWu8HZLGmoG8GTw35O2Qg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mOnAwwTGZ+Ixo/GyUOcrUmw/ItEwWb2jBikLWg+TG/bLU8YYLUxxU6f+6g2R3RWES
 CitorP61LjJpZ1+DtbgwvXtoVw2WMwX84DL0qmp/NKbsjaBM1159mTZhZZxZlQwa0P
 T8D8UO9YNZzIG8fmdqEcAhp5gHeg8iStd10x3sNRFzSz3hEQtpVYB4TznPavzLJN06
 gFbyt5UDrs3IP3xU2kecgb2UpBdhFKSQ10Tquhbu6P4BLcwGdE46Isg6wV/ZxSO7c/
 2nw0sbVb8uX3YQ6IQk0CegS3iLri1Zj4bA5UGY8Su7U2uW8YS+6JeoquD3Y24do1Yr
 Eg+SnN3LnShrA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7FA2A3780575;
 Mon, 10 Jun 2024 08:14:45 +0000 (UTC)
Message-ID: <3dd1631a-fbd0-44a5-8119-c03e8a186da0@collabora.com>
Date: Mon, 10 Jun 2024 10:14:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 05/16] drm/mediatek: Set DRM mode configs accordingly
To: Shawn Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, Sean Paul <sean@poorly.run>,
 Jason Chen <jason-ch.chen@mediatek.corp-partner.google.com>,
 Fei Shao <fshao@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20240606092635.27981-1-shawn.sung@mediatek.com>
 <20240606092635.27981-6-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240606092635.27981-6-shawn.sung@mediatek.com>
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

Il 06/06/24 11:26, Shawn Sung ha scritto:
> From: Hsiao Chien Sung <shawn.sung@mediatek.com>
> 
> Set DRM mode configs limitation according to the hardware capabilities
> and pass the IGT checks as below:
> 
> - The test "graphics.IgtKms.kms_plane" requires a frame buffer with
>    width of 4512 pixels (> 4096).
> - The test "graphics.IgtKms.kms_cursor_crc" checks if the cursor size is
>    defined, and run the test with cursor size from 1x1 to 512x512.
> 
> Please notice that the test conditions may change as IGT is updated.
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c | 22 ++++++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_drm_drv.h |  4 ++++
>   2 files changed, 26 insertions(+)
> 

..snip..

> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> index 78d698ede1bf..6cfa790e8df5 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> @@ -46,6 +46,10 @@ struct mtk_mmsys_driver_data {
>   	bool shadow_register;
>   	unsigned int mmsys_id;
>   	unsigned int mmsys_dev_num;
> +
> +	int max_width;
> +	int min_width;
> +	int min_height;

Only one nit here.

Since {min,max}_{width,height}:
  - Will never be negative; and
  - Will never need more than 16 bits; and
  - Are local to this driver and anyway copied to drm later

Can you please change them to unsigned 16-bits (u16)?

After which,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

>   };
>   
>   struct mtk_drm_private {


