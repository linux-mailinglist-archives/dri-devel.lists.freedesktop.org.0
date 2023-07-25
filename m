Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC14B760B01
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 08:56:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3787910E38F;
	Tue, 25 Jul 2023 06:56:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5285F10E38F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 06:56:06 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8712F6606FD7;
 Tue, 25 Jul 2023 07:56:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1690268164;
 bh=B4Byh9ztSQBLozB08jxTQ6IcvGQk5cwwMnDRTpet4ig=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PW54ktHcjqrBPTv0tI6unfrXFYCCnATCyFw8O02cwFKsJpyT3ENNQ+JiXyfVkExkZ
 s5H4M3zT3CbmYa0kHt2O0jJ0sVXZ7c/VGmg/OuQmyxllE63kRZZesNWhMwYRL7t1vI
 36SkTWC+Ny4lh4bRTShHR0tou2K7lSGL/bfA2GIiqU7WH3mHNK79DrUW+K1EAkSTC5
 i2KcQapFUZCG1r6N347dWGOP3eW64CQpQrFWB4qMMcFk9/e8qKrd4hhM4K4p/gBVOl
 XBpdXvb5qkAs77wdlzqbQbT+MWJyegjsrCC//xuxLW9yOdnF2+LDxS4JLgsZys4Rrf
 N/W7v4lW7NIIw==
Message-ID: <cfd6f9f1-5b7a-8a60-a9f5-08d6aa64c720@collabora.com>
Date: Tue, 25 Jul 2023 08:56:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND] drm/mediatek: Add valid modifier check
Content-Language: en-US
To: Justin Green <greenjustin@chromium.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20230724175839.675911-1-greenjustin@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230724175839.675911-1-greenjustin@chromium.org>
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
Cc: justin.yeh@mediatek.com, chunkuang.hu@kernel.org, jason-jh.lin@mediatek.com,
 wenst@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 24/07/23 19:58, Justin Green ha scritto:
> Add a check to mtk_drm_mode_fb_create() that rejects any modifier that
> is not the AFBC mode supported by MT8195's display overlays.
> 
> Tested by booting ChromeOS and verifying the UI works, and by running
> the ChromeOS kms_addfb_basic binary, which has a test called
> "addfb25-bad-modifier" that attempts to create a framebuffer with the
> modifier DRM_FORMAT_MOD_INVALID and verifies the ADDFB2 ioctl returns
> EINVAL.
> 
> Signed-off-by: Justin Green <greenjustin@chromium.org>
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index cd5b18ef7951..2096e8a794ad 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -51,6 +51,13 @@ mtk_drm_mode_fb_create(struct drm_device *dev,
>   	if (info->num_planes != 1)
>   		return ERR_PTR(-EINVAL);
>   
> +	if (cmd->modifier[0] &&
> +	    cmd->modifier[0] != DRM_FORMAT_MOD_ARM_AFBC(
> +					AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |
> +					AFBC_FORMAT_MOD_SPLIT |
> +					AFBC_FORMAT_MOD_SPARSE))
> +		return ERR_PTR(-EINVAL);

Would it make more sense to commmonize function mtk_plane_format_mod_supported()
and call that one here instead?

Regards,
Angelo

> +
>   	return drm_gem_fb_create(dev, file, cmd);
>   }
>   



