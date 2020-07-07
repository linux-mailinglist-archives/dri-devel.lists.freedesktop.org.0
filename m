Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3636121676B
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 09:27:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 749A76E5CE;
	Tue,  7 Jul 2020 07:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57BC36E0E2
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 02:31:36 +0000 (UTC)
Received: from kevin (unknown [IPv6:2600:1700:4540:6a60::14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: alyssa)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A06422A481D;
 Tue,  7 Jul 2020 03:31:32 +0100 (BST)
Date: Mon, 6 Jul 2020 22:31:28 -0400
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: Re: [PATCH] drm/panfrost: fix ref count leak in panfrost_job_hw_submit
Message-ID: <20200707023128.GA16527@kevin>
References: <20200614062730.46489-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200614062730.46489-1-navid.emamdoost@gmail.com>
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
 emamd001@umn.edu, smccaman@umn.edu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

On Sun, Jun 14, 2020 at 01:27:30AM -0500, Navid Emamdoost wrote:
> in panfrost_job_hw_submit, pm_runtime_get_sync is called which
> increments the counter even in case of failure, leading to incorrect
> ref count. In case of failure, decrement the ref count before returning.
> 
> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_job.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 7914b1570841..89ac84667eb1 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -147,11 +147,10 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
>  
>  	ret = pm_runtime_get_sync(pfdev->dev);
>  	if (ret < 0)
> -		return;
> +		goto out;
>  
>  	if (WARN_ON(job_read(pfdev, JS_COMMAND_NEXT(js)))) {
> -		pm_runtime_put_sync_autosuspend(pfdev->dev);
> -		return;
> +		goto out;
>  	}
>  
>  	cfg = panfrost_mmu_as_get(pfdev, &job->file_priv->mmu);
> @@ -184,6 +183,9 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
>  				job, js, jc_head);
>  
>  	job_write(pfdev, JS_COMMAND_NEXT(js), JS_COMMAND_START);
> +out:
> +	pm_runtime_put_sync_autosuspend(pfdev->dev);
> +	return;
>  }
>  
>  static void panfrost_acquire_object_fences(struct drm_gem_object **bos,
> -- 
> 2.17.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
