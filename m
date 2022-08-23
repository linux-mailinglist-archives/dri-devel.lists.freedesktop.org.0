Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA4A59CE8B
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 04:31:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54422A9FB5;
	Tue, 23 Aug 2022 02:30:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37EFFA9F96
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 02:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=zffW8Lsyp3cRBNb29LrtUIepUivLrp6J7Y14E2p56ZA=; b=gPhNpilya0ATGyVMwhHpAyRQmR
 pzTe/uukd8Ld+upONgXxSMeuskztJiyCV3Rz7F21eGpy5iU5yZRSfM0m4Oy1OgDrnY/KmH5hKhc2J
 /tQGHBufFHbKjn+KPv4cw8AV47qkzgskhnJ0E61PyzSXO5DR91iBGKh89GZ6D0uFfW2rDAtAVkS5C
 dS//DwbkQ6pd52lRPefQLTXfr2MI2qF2vmXe3z2+rD7WIbMK1nSt274j7qVnVvUtAGka1w3yJmgxh
 vOOwCnfLFLOgC4gf/X2lr3M9oFa1MYwEH2jw0f52dcyLQhpgLRWFgOEzHQVejfMoIrAcdGJaMLWy7
 Jpiq23XA==;
Received: from [2601:1c0:6280:3f0::a6b3]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1oQJgG-000PV4-5a; Tue, 23 Aug 2022 02:30:16 +0000
Message-ID: <50c85455-91ae-c517-15da-251445f4127a@infradead.org>
Date: Mon, 22 Aug 2022 19:30:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH -next] drm/hisilicon/hibmc: Fix COMPILE_TEST building
 without MMU
Content-Language: en-US
To: YueHaibing <yuehaibing@huawei.com>, xinliang.liu@linaro.org,
 tiantao6@hisilicon.com, jstultz@google.com, kong.kongxinwei@hisilicon.com,
 puck.chen@hisilicon.com, airlied@linux.ie, daniel@ffwll.ch,
 tzimmermann@suse.de, javierm@redhat.com
References: <20220823020920.11008-1-yuehaibing@huawei.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220823020920.11008-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/22/22 19:09, YueHaibing wrote:
> WARNING: unmet direct dependencies detected for DRM_TTM
>   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
>   Selected by [y]:
>   - DRM_TTM_HELPER [=y] && HAS_IOMEM [=y] && DRM [=y]
>   - DRM_HISI_HIBMC [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && (ARM64 || COMPILE_TEST [=y])
> 
> Add missing MMU dependency to fix this.
> 
> Fixes: a0f25a6bb319 ("drm/hisilicon/hibmc: Allow to be built if COMPILE_TEST is enabled")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/Kconfig b/drivers/gpu/drm/hisilicon/hibmc/Kconfig
> index 073adfe438dd..e5ef1b573732 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/Kconfig
> +++ b/drivers/gpu/drm/hisilicon/hibmc/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config DRM_HISI_HIBMC
>  	tristate "DRM Support for Hisilicon Hibmc"
> -	depends on DRM && PCI && (ARM64 || COMPILE_TEST)
> +	depends on DRM && PCI && (ARM64 || COMPILE_TEST) && MMU
>  	select DRM_KMS_HELPER
>  	select DRM_VRAM_HELPER
>  	select DRM_TTM

Yes, or this one from April 8, 2022:
https://lore.kernel.org/lkml/20220409030504.16089-1-rdunlap@infradead.org/

thanks.

-- 
~Randy
