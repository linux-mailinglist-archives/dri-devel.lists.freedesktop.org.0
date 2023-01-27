Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2840567F22B
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jan 2023 00:18:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0866210E0CE;
	Fri, 27 Jan 2023 23:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD8FD10E0CE
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 23:18:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 467D761B23;
 Fri, 27 Jan 2023 23:18:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDCC3C433EF;
 Fri, 27 Jan 2023 23:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674861502;
 bh=CXUhXt0vaAEeA5azgtYG8dHIkQ0F6fZe8brBxX+dbzw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RdC12Sna/LXNHYtASD7sP87NEW4wwxX8Vz0EVtsPp7oAEug9P8HXexyVQX2M9Yizf
 EmDCljirqWn6Ft2hO/w7PHtTWitdILR4YImeiDGo4haJZtl8kFs0bsssh1B2AQl1+f
 0eo0rLTSHbhLnSkgKnRaR3AnIDhlSH/dDc/rnT4apOoCPqPhljGUkdRp+OgXvInV/b
 GkHuz10SIfqHsv6YWvl9gh6VV/BbdtYFBlfwonDhXgtNcJCUy17esH5uetnzSlFLOP
 ESbEUs6re68CcDB4BlQrZunygZNWjXA7tBDJ1aXZP9b8rGkwoaKLClk7Bgn+VGVhO2
 Hi4NA8mERmjGg==
Date: Fri, 27 Jan 2023 16:18:20 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] gpu: host1x: fix uninitialized variable use
Message-ID: <Y9RbvPRP5Yw/fUMM@dev-arch.thelio-3990X>
References: <20230127221418.2522612-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230127221418.2522612-1-arnd@kernel.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Tom Rix <trix@redhat.com>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 27, 2023 at 11:14:00PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The error handling for platform_get_irq() failing no longer
> works after a recent change, clang now points this out with
> a warning:
> 
> drivers/gpu/host1x/dev.c:520:6: error: variable 'syncpt_irq' is uninitialized when used here [-Werror,-Wuninitialized]
>         if (syncpt_irq < 0)
>             ^~~~~~~~~~
> 
> Fix this by removing the variable and checking the correct
> error status.
> 
> Fixes: 625d4ffb438c ("gpu: host1x: Rewrite syncpoint interrupt handling")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I had the same diff pending but civic duty called today :)

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  drivers/gpu/host1x/dev.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
> index 4872d183d860..aae2efeef503 100644
> --- a/drivers/gpu/host1x/dev.c
> +++ b/drivers/gpu/host1x/dev.c
> @@ -487,7 +487,6 @@ static int host1x_get_resets(struct host1x *host)
>  static int host1x_probe(struct platform_device *pdev)
>  {
>  	struct host1x *host;
> -	int syncpt_irq;
>  	int err;
>  
>  	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
> @@ -517,8 +516,8 @@ static int host1x_probe(struct platform_device *pdev)
>  	}
>  
>  	host->syncpt_irq = platform_get_irq(pdev, 0);
> -	if (syncpt_irq < 0)
> -		return syncpt_irq;
> +	if (host->syncpt_irq < 0)
> +		return host->syncpt_irq;
>  
>  	mutex_init(&host->devices_lock);
>  	INIT_LIST_HEAD(&host->devices);
> -- 
> 2.39.0
> 
