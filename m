Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 229D83D3789
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 11:18:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42FAF6F95D;
	Fri, 23 Jul 2021 09:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D8D6F95D
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 09:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JtK3F4ur0xXfBHq8xF2md1hvbLFHPIXsScOT7FC0TmA=; b=14617pCIhQkbwxkrZKJUiAaqsS
 G73+8csRqRRchneM8D5h9nEY7r68bTusQyVhYoXRFixZhkZfQBBps9y+otlHNFp5vyFGEaKXvpqM7
 sOd5YDjjvOxGp5SIecm16We7x42yZtpxeql7roGROnm6QP3vJxHIs0L7Qx29LDG+zJDeE1onQu3uh
 NQznJUuvDO5ZfqDcIidnTtz5/MoWQ+kr4NXSzXpym/Sx0CEc++t8Sy4FoTgop9V3xN+TmprbPcMKW
 xnJ9512y5lS1uaRiywjTK/5SfqdlrlNFSwW/Xi8Il3szZMNmiBoGvA/RqhIxhXgwKJ7DIevM6EifA
 heWuK52w==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1m6rJc-0006dv-Rh; Fri, 23 Jul 2021 12:17:56 +0300
Subject: Re: [PATCH] gpu: host1x: select CONFIG_SYNC_FILE
To: Arnd Bergmann <arnd@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>
References: <20210723091424.1682193-1-arnd@kernel.org>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <0f4d1f0a-c313-a60e-6a72-fd4b0c757bc3@kapsi.fi>
Date: Fri, 23 Jul 2021 12:17:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210723091424.1682193-1-arnd@kernel.org>
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arnd,

I think the best fix for this is to just remove that function -- it is 
currently not used anywhere. I posted a patch to do that, but Thierry is 
currently on vacation so it hasn't been picked up yet.

thanks,
Mikko

On 7/23/21 12:14 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> With the addition of the DMA fence, the host1x driver now fails to
> build without the sync_file helper:
> 
> arm-linux-gnueabi-ld: drivers/gpu/host1x/fence.o: in function `host1x_fence_create_fd':
> fence.c:(.text+0x624): undefined reference to `sync_file_create'
> 
> Fixes: ad0529424def ("gpu: host1x: Add DMA fence implementation")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/gpu/host1x/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/host1x/Kconfig b/drivers/gpu/host1x/Kconfig
> index 6dab94adf25e..6f7ea1720a39 100644
> --- a/drivers/gpu/host1x/Kconfig
> +++ b/drivers/gpu/host1x/Kconfig
> @@ -3,6 +3,7 @@ config TEGRA_HOST1X
>   	tristate "NVIDIA Tegra host1x driver"
>   	depends on ARCH_TEGRA || (ARM && COMPILE_TEST)
>   	select IOMMU_IOVA
> +	select SYNC_FILE
>   	help
>   	  Driver for the NVIDIA Tegra host1x hardware.
>   
> 
