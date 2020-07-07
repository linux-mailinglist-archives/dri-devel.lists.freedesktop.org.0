Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC55216761
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 09:27:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E8EB6E5C0;
	Tue,  7 Jul 2020 07:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B35156E1CE
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 02:31:54 +0000 (UTC)
Received: from kevin (unknown [IPv6:2600:1700:4540:6a60::14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: alyssa)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5FE532A4B80;
 Tue,  7 Jul 2020 03:31:51 +0100 (BST)
Date: Mon, 6 Jul 2020 22:31:47 -0400
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: Re: [PATCH] drm/panfrost: perfcnt: fix ref count leak in
 panfrost_perfcnt_enable_locked
Message-ID: <20200707023147.GB16527@kevin>
References: <20200614063619.44944-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200614063619.44944-1-navid.emamdoost@gmail.com>
X-Mailman-Approved-At: Tue, 07 Jul 2020 07:26:57 +0000
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
Cc: wu000273@umn.edu, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 David Airlie <airlied@linux.ie>, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 mccamant@cs.umn.edu, emamd001@umn.edu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

On Sun, Jun 14, 2020 at 01:36:19AM -0500, Navid Emamdoost wrote:
> in panfrost_perfcnt_enable_locked, pm_runtime_get_sync is called which
> increments the counter even in case of failure, leading to incorrect
> ref count. In case of failure, decrement the ref count before returning.
> 
> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_perfcnt.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> index 6913578d5aa7..92c64b20eb29 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> @@ -83,11 +83,13 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
>  
>  	ret = pm_runtime_get_sync(pfdev->dev);
>  	if (ret < 0)
> -		return ret;
> +		goto err_put_pm;
>  
>  	bo = drm_gem_shmem_create(pfdev->ddev, perfcnt->bosize);
> -	if (IS_ERR(bo))
> -		return PTR_ERR(bo);
> +	if (IS_ERR(bo)) {
> +		ret = PTR_ERR(bo);
> +		goto err_put_pm;
> +	}
>  
>  	/* Map the perfcnt buf in the address space attached to file_priv. */
>  	ret = panfrost_gem_open(&bo->base, file_priv);
> @@ -168,6 +170,8 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
>  	panfrost_gem_close(&bo->base, file_priv);
>  err_put_bo:
>  	drm_gem_object_put_unlocked(&bo->base);
> +err_put_pm:
> +	pm_runtime_put(pfdev->dev);
>  	return ret;
>  }
>  
> -- 
> 2.17.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
