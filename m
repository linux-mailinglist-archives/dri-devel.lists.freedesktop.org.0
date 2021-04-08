Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FAA358003
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 11:56:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B4D6EA5C;
	Thu,  8 Apr 2021 09:56:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE3E66EA5B;
 Thu,  8 Apr 2021 09:56:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF61761157;
 Thu,  8 Apr 2021 09:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617875774;
 bh=qJxRS7vx1sXE6xcXQMcJdpuIhDNb8doWc5nvVib8CKg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KZ/oVYIMYnAgYH6QJVktZeIA6/aSYiWme3mBgwnkCxayRdrH5xziAm66YyvKrRth7
 7v9gmEr4vet9wOPetc8R4/QVlcGIuJddziUeRsFMPVcGZa22P9mvPmv43q1B6aD+Js
 Z0e/fme4iIuOE27WCM3w3jK+/81p4DNorwJ+lgUEckK3vbax8fc4dOwWS9QFQ50bHB
 QomrNySbhnrnJqtGC3+M/ApvRrBBJ3ceKHuJulDCYWyiIvtQy3nj4mRUzMnqnyL+hH
 vDqGLXtnBvDVuKNFVaO2Flj0rH/To18bMy5Xeu6DijPGj4p0ZU4/aKk0Y4ceO01yyY
 OTrdegR9Enwbw==
Date: Thu, 8 Apr 2021 12:56:02 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 1/2] drivers/video/fbdev: don't select DMA_CMA
Message-ID: <YG7TMt0cgGucCPUX@kernel.org>
References: <20210408092011.52763-1-david@redhat.com>
 <20210408092011.52763-2-david@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210408092011.52763-2-david@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Andrew Jeffery <andrew@aj.id.au>,
 Randy Dunlap <rdunlap@infradead.org>, etnaviv@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Michal Simek <michal.simek@xilinx.com>, linux-mm@kvack.org,
 Joel Stanley <joel@jms.id.au>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Peter Collingbourne <pcc@google.com>, Masahiro Yamada <masahiroy@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 08, 2021 at 11:20:10AM +0200, David Hildenbrand wrote:
> Random drivers should not override a user configuration of core knobs
> (e.g., CONFIG_DMA_CMA=n). Use "imply" instead, to still respect
> dependencies and manual overrides.
> 
> "This is similar to "select" as it enforces a lower limit on another
>  symbol except that the "implied" symbol's value may still be set to n
>  from a direct dependency or with a visible prompt."
> 
> Implying DRM_CMA should be sufficient, as that depends on CMA.

	  ^ DMA_CMA ?

> Note: If this is a real dependency, we should use "depends on DMA_CMA"
> instead -  but I assume the driver can work without CMA just fine --
> esp. when we wouldn't have HAVE_DMA_CONTIGUOUS or CMA right now.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  drivers/video/fbdev/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> index 4f02db65dede..d37cd5341e1b 100644
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -2186,7 +2186,7 @@ config FB_HYPERV
>  	select FB_CFB_COPYAREA
>  	select FB_CFB_IMAGEBLIT
>  	select FB_DEFERRED_IO
> -	select DMA_CMA if HAVE_DMA_CONTIGUOUS && CMA
> +	imply DMA_CMA
>  	help
>  	  This framebuffer driver supports Microsoft Hyper-V Synthetic Video.
>  
> -- 
> 2.30.2
> 

-- 
Sincerely yours,
Mike.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
