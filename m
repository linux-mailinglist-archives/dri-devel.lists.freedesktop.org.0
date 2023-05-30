Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B52AB7170A1
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 00:22:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4AAF10E430;
	Tue, 30 May 2023 22:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DCE410E430
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 22:21:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 83D4263493;
 Tue, 30 May 2023 22:21:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78E71C433D2;
 Tue, 30 May 2023 22:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685485314;
 bh=KIc/pp1lOWtTgIyst2JNrfoGv5WLci5gKABpg1IBUx8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lrm6iAfkq5oCiLKo3eLSlvibhpItzBRgAlKYT1IbbWm4DhfffmNQ5Kbkc5IMBT+dQ
 z/BlERcBVmq+eA3PmJ925+zx3TlxlFkZYRtmlegS3m6V74SYfGu/9bg/UOaydE+2wA
 UE2jROuXxcjlOZuPyXn+MNvP036ABcil7TWUoev531/tJhsptWY1FlLboQPsOy8m4Z
 XE7Wuy52mG5UcB2uKJXLZt3fVOMRmQ9DSaEWmQluiaaOHmtoNLJzzQf8novuLLn8D0
 WHk1ok406k2DSu0ootecDRmT8bcqBgN4vn8yYuw25dS45x9pReZlAdQ7zrErXV+q8f
 MknRyZ6XAPF+A==
Date: Wed, 31 May 2023 00:21:50 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Min Li <lm0963hack@gmail.com>
Subject: Re: [PATCH] drm/exynos: fix race condition UAF in
 exynos_g2d_exec_ioctl
Message-ID: <20230530222150.24oogloda6wtvpvm@intel.intel>
References: <20230526130131.16521-1-lm0963hack@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230526130131.16521-1-lm0963hack@gmail.com>
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
Cc: linux-samsung-soc@vger.kernel.org, alim.akhtar@samsung.com,
 sw0312.kim@samsung.com, krzysztof.kozlowski@linaro.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kyungmin.park@samsung.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Min,

On Fri, May 26, 2023 at 09:01:31PM +0800, Min Li wrote:
> If it is async, runqueue_node is freed in g2d_runqueue_worker on another
> worker thread. So in extreme cases, if g2d_runqueue_worker runs first, and
> then executes the following if statement, there will be use-after-free.
> 
> Signed-off-by: Min Li <lm0963hack@gmail.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_g2d.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> index ec784e58da5c..414e585ec7dd 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> @@ -1335,7 +1335,7 @@ int exynos_g2d_exec_ioctl(struct drm_device *drm_dev, void *data,
>  	/* Let the runqueue know that there is work to do. */
>  	queue_work(g2d->g2d_workq, &g2d->runqueue_work);
>  
> -	if (runqueue_node->async)
> +	if (req->async)

did you actually hit this? If you did, then the fix is not OK.

Andi

>  		goto out;
>  
>  	wait_for_completion(&runqueue_node->complete);
> -- 
> 2.34.1
> 
