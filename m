Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5380E749AE2
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 13:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8625510E4F0;
	Thu,  6 Jul 2023 11:39:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA43210E4EF
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 11:39:07 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3fbea14700bso5762615e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 04:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688643544; x=1691235544;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HiX0kM9yAvsqqQQcFgblcf3ys13s7viaphie1EL1uOE=;
 b=pQtrCkQbZkFdoLEQ2lrwbmLRAQXkBikr+SYkCsnZJKTiV+WdTB7d/O51bih6j1gf3f
 mWBOTXXGqgnrKps5pCYHLrjeQ5cPvMIJmZSm+59Jogg1DmZcCC5r+fODIxpxR41ms2au
 qMkKw3uslXLBvg7xgPA1JQTNiZSH5MLLSHcnU1ay9HrPEf2Xdx0E1hgVadWmBCralmz7
 t2u512+TSnaDVeqLvSbJbO5llzNQttgG2HawIy0ON0MF1He+76+m1EhGq9g4q6XlOZx9
 mzBHhBdcJ38Q4OtIA7TzfFoFgOf31oVPurR4LQp0lkYxrspDM16cNMnYEV4NIentXAjs
 n/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688643544; x=1691235544;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HiX0kM9yAvsqqQQcFgblcf3ys13s7viaphie1EL1uOE=;
 b=CcNJs16WoYUJ4qmICuN/u/cxtewsq+k5483mN3dzwwZPvDnDy83FJYiSIV92WhccDp
 B2foNf6RCh9OFMc+OIhCmIuCcS0tyYtcJImL4zitgut/19v9jz4Xv7k1p5JD05/7sIqA
 KaBR/C881NUJojnQ86hMD5goGiFpQQ2doRa8H8L2VeEpX1mYnVWqJdZqXRmPQv3hak4c
 E2w4CYI96uNzO3mu4I1BL6lRmavMpvV0IYUFb/JhsXrU9xD/hCqQwFWvUOUwkQ6m/X4E
 Xr2ozK6HnQdX6v+kHDUMPyQe2OBhOpa0em0L1/u8uU5z9JSH1XtfxlpRA4tF+rxfs6a3
 EYxg==
X-Gm-Message-State: ABy/qLZl7IGkcUmmwQYrs0ocKY8lEgAFMar6+haXL+27brb2qyY1NdJw
 Mpvd6Uyerpg9b1MNnfqVXls=
X-Google-Smtp-Source: APBJJlGVQmlrHpXi8l/4jbLYNHmIbdD92pYW9Owm3df69yA1z94eteFsOfVszAadDxRftyQAm4MNDA==
X-Received: by 2002:a05:6000:136f:b0:30e:3f54:f8c9 with SMTP id
 q15-20020a056000136f00b0030e3f54f8c9mr1158666wrz.10.1688643543915; 
 Thu, 06 Jul 2023 04:39:03 -0700 (PDT)
Received: from [192.168.0.32] ([37.222.243.26])
 by smtp.gmail.com with ESMTPSA id
 v18-20020a5d6792000000b003063a92bbf5sm1651041wru.70.2023.07.06.04.39.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 04:39:02 -0700 (PDT)
Message-ID: <78b023a0-ce6d-80e2-c8d0-d3d6fde1c928@gmail.com>
Date: Thu, 6 Jul 2023 13:39:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/mediatek: Fix potential memory leak if vmap() fail
Content-Language: en-US, ca-ES, es-ES
To: Sui Jingfeng <suijingfeng@loongson.cn>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230626185801.684451-1-suijingfeng@loongson.cn>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230626185801.684451-1-suijingfeng@loongson.cn>
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
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 26/06/2023 20:58, Sui Jingfeng wrote:
> Also return -ENOMEM if such a failure happens, the implement should take
> responsibility for the error handling.
> 
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_gem.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> index a25b28d3ee90..9f364df52478 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> @@ -247,7 +247,11 @@ int mtk_drm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
>   
>   	mtk_gem->kvaddr = vmap(mtk_gem->pages, npages, VM_MAP,
>   			       pgprot_writecombine(PAGE_KERNEL));
> -
> +	if (!mtk_gem->kvaddr) {
> +		kfree(sgt);
> +		kfree(mtk_gem->pages);
> +		return -ENOMEM;
> +	}

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

>   out:
>   	kfree(sgt);
>   	iosys_map_set_vaddr(map, mtk_gem->kvaddr);
