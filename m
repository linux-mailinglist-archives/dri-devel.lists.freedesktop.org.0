Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A95D4192B8
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 13:05:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC6E89F61;
	Mon, 27 Sep 2021 11:05:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E005089F5F
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 11:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nJQ1BkmcJgtaIwRlKcokXRfC6gNMO5CdBJPnyuOf53w=; b=ETGI5ST7Fk0Ca0VBgc+bUlOMve
 ngBRm0m+VxplDf0ax2M+3bhEZkfEw7kciX1JZUA8CUrGrSojBSHqFmK4GjVcKrDYWfcW0tME/dczI
 Ik6+QEIf2aFB5yJauyZyp8HwZs7ozW450pqDDgH1kJArySYY1/+okkFQ8l0beK/HxOhzRkAjcmW/M
 7vpNjvGFpvoXmI1w/SH2kjyhki3RwHZWbp+rSN25hMtQCqcT7BecwU77TBqvtAzWF6qMCDbPM0WhL
 eI9jNib9gvE8PuVmv/nFCrUmJ0zMHl6s5qLWUV9nYeTlPzF9vSy5Dd9CK1VeYNrOlU2oS9RrBcjz5
 BCdra1ag==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1mUoRO-0004rX-Ow; Mon, 27 Sep 2021 14:04:58 +0300
Subject: Re: [PATCH] gpu: host1x: select CONFIG_DMA_SHARED_BUFFER
To: Arnd Bergmann <arnd@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>
Cc: Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210927093705.458573-1-arnd@kernel.org>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <84acd54f-ba9b-576c-8a49-da6245f063b2@kapsi.fi>
Date: Mon, 27 Sep 2021 14:04:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210927093705.458573-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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

On 9/27/21 12:36 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Linking fails when dma-buf is disabled:
> 
> ld.lld: error: undefined symbol: dma_fence_release
>>>> referenced by fence.c
>>>>                gpu/host1x/fence.o:(host1x_syncpt_fence_enable_signaling) in archive drivers/built-in.a
>>>> referenced by fence.c
>>>>                gpu/host1x/fence.o:(host1x_fence_signal) in archive drivers/built-in.a
>>>> referenced by fence.c
>>>>                gpu/host1x/fence.o:(do_fence_timeout) in archive drivers/built-in.a
> 
> Fixes: 687db2207b1b ("gpu: host1x: Add DMA fence implementation")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/gpu/host1x/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/host1x/Kconfig b/drivers/gpu/host1x/Kconfig
> index 6dab94adf25e..6815b4db17c1 100644
> --- a/drivers/gpu/host1x/Kconfig
> +++ b/drivers/gpu/host1x/Kconfig
> @@ -2,6 +2,7 @@
>   config TEGRA_HOST1X
>   	tristate "NVIDIA Tegra host1x driver"
>   	depends on ARCH_TEGRA || (ARM && COMPILE_TEST)
> +	select DMA_SHARED_BUFFER
>   	select IOMMU_IOVA
>   	help
>   	  Driver for the NVIDIA Tegra host1x hardware.
> 

Thanks!

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
