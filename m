Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D71FF6A0E01
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 17:28:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE8610E21B;
	Thu, 23 Feb 2023 16:28:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A5D10E21B
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 16:28:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A989161744;
 Thu, 23 Feb 2023 16:28:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD26C433EF;
 Thu, 23 Feb 2023 16:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677169710;
 bh=QNtwL+3aQI5NX8KHQuxRVNJuJdxCfz9xgbVF4PuC1B4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ecOScmMnD4FY54PQcTo/sUh3wM/bq5x1gw2ldgd1gw3GsMiqGMHcx0hQYQ6U4hBej
 JmDyZ/Tx/1Qq6N0Hg17t9W2gweAb3BddapdcI/ALIUxvRBHfrvLcAJBSsOWAbu0fnC
 W14+vs8BlJ71JMPpCahFLIAWbKCnPLUmMkEAtp5w6825yBsUda4LMq9B4bG9xNMfcw
 CVVgYVBhmI4PeoxciEBACllNI08VRVitgE7xwwY2RSeLpNshH0H6Q/1qGVi8gTEhuA
 qunB88ExeofQLMfkFWy/9ZOpGNkuYSTulZCZOf2e0uu2yRzsX+EEqYlLb/zFlYUlnW
 2q/C8GezC7vtw==
Date: Thu, 23 Feb 2023 09:28:28 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] gpu: host1x: fix uninitialized variable use
Message-ID: <Y/eULFO4jbivQ679@dev-arch.thelio-3990X>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-tegra@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thierry, Daniel, and David,

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

Apologies if this has been reported already or has a solution in
progress but mainline is now broken because this change got separated
from the change it is fixing:

https://github.com/ClangBuiltLinux/continuous-integration2/actions/runs/4249931209/jobs/7391912774
https://storage.tuxsuite.com/public/clangbuiltlinux/continuous-integration2/builds/2M7y9HpiXB13qiC2mkHMyeZOcLW/build.log

I see this change sitting in the drm-tegra tree [1], which is getting
merged into -next, so it is fixed there, which is why we did not notice
any issues until the drm-next tree was merged into mainline. Can this be
fast tracked to Linus to unbreak clang builds with -Werror?

[1]: https://gitlab.freedesktop.org/drm/tegra/-/commit/b9930311641cf2ed905a84aabe27e8f3868aee4a

Cheers,
Nathan
