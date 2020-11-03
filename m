Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E592A3F35
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:45:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 274B66E85D;
	Tue,  3 Nov 2020 08:45:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C91A6E85D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 08:45:07 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id AEACD1F45388;
 Tue,  3 Nov 2020 08:45:05 +0000 (GMT)
Date: Tue, 3 Nov 2020 09:45:02 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] drm/panfrost: Fix module unload
Message-ID: <20201103094502.70de59c9@collabora.com>
In-Reply-To: <20201030145833.29006-1-steven.price@arm.com>
References: <20201030145833.29006-1-steven.price@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 30 Oct 2020 14:58:33 +0000
Steven Price <steven.price@arm.com> wrote:

> When unloading the call to pm_runtime_put_sync_suspend() will attempt to
> turn the GPU cores off, however panfrost_device_fini() will have turned
> the clocks off. This leads to the hardware locking up.
> 
> Instead don't call pm_runtime_put_sync_suspend() and instead simply mark
> the device as suspended using pm_runtime_set_suspended(). And also
> include this on the error path in panfrost_probe().
> 
> Fixes: aebe8c22a912 ("drm/panfrost: Fix possible suspend in panfrost_remove")
> Signed-off-by: Steven Price <steven.price@arm.com>

Queued to drm-misc-fixes.

Thanks,

Boris

> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 23513869500c..0ac8ad18fdc6 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -627,6 +627,7 @@ static int panfrost_probe(struct platform_device *pdev)
>  err_out1:
>  	pm_runtime_disable(pfdev->dev);
>  	panfrost_device_fini(pfdev);
> +	pm_runtime_set_suspended(pfdev->dev);
>  err_out0:
>  	drm_dev_put(ddev);
>  	return err;
> @@ -641,9 +642,9 @@ static int panfrost_remove(struct platform_device *pdev)
>  	panfrost_gem_shrinker_cleanup(ddev);
>  
>  	pm_runtime_get_sync(pfdev->dev);
> -	panfrost_device_fini(pfdev);
> -	pm_runtime_put_sync_suspend(pfdev->dev);
>  	pm_runtime_disable(pfdev->dev);
> +	panfrost_device_fini(pfdev);
> +	pm_runtime_set_suspended(pfdev->dev);
>  
>  	drm_dev_put(ddev);
>  	return 0;

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
