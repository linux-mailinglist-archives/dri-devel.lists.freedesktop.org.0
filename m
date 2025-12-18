Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAF2CCB4FA
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 11:10:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 495B010EC78;
	Thu, 18 Dec 2025 10:10:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ly3VmBL5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0488B10EC78
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 10:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1766052615;
 bh=1vG3sm3zFKxD/Umg4+azYciFpdDn1Ub0LnJx0R8PAY8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ly3VmBL5kIw6wVyKqvlxVYbxyc3nTwI5wA+CmRewlnpFh38pJxLqCv7Fo2m/pX3Jp
 yFqO/PbqqT7elaR6IUzJNyH40pY4S3ims+AaCTpI2hqSVXAZLyEcj6mZ8tNUzTujjn
 hUWCmeo7T/RdsNJT8ciMGHsFEHbfBVLtfp0l54QbvE7XsYhGFMhW8MAlIN4u0RlItS
 HY28u9h4E11diWoOTtMCrz1pIKRFu9QsYk6ef+3iKSPqf/EvwClKaWs2ZCP3+boP1I
 /qrwcU1lFhjXWE9xkT/SYcC2DemmwLIaq/OEY+xLG7Jci9lW/IfkMj4pMq2/Wkx5pO
 77fnuwe1HpL2w==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3A1D217E1146;
 Thu, 18 Dec 2025 11:10:15 +0100 (CET)
Date: Thu, 18 Dec 2025 11:10:10 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: =?UTF-8?B?TG/Dr2M=?= Molinari <loic.molinari@collabora.com>, Steven
 Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/panthor: unlock on error in
 panthor_ioctl_bo_create()
Message-ID: <20251218111010.7de4c49f@fedora>
In-Reply-To: <aUOxxvXXtHHfFCcg@stanley.mountain>
References: <aUOxxvXXtHHfFCcg@stanley.mountain>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 18 Dec 2025 10:48:22 +0300
Dan Carpenter <dan.carpenter@linaro.org> wrote:

> Call drm_dev_exit() before returning -EINVAL.
> 
> Fixes: cd2c9c3015e6 ("drm/panthor: Add flag to map GEM object Write-Back Cacheable")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Queued to drm-misc-next.

> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 98d4e8d867ed..165dddfde6ca 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -923,8 +923,10 @@ static int panthor_ioctl_bo_create(struct drm_device *ddev, void *data,
>  	}
>  
>  	if ((args->flags & DRM_PANTHOR_BO_NO_MMAP) &&
> -	    (args->flags & DRM_PANTHOR_BO_WB_MMAP))
> -		return -EINVAL;
> +	    (args->flags & DRM_PANTHOR_BO_WB_MMAP)) {
> +		ret = -EINVAL;
> +		goto out_dev_exit;
> +	}
>  
>  	if (args->exclusive_vm_id) {
>  		vm = panthor_vm_pool_get_vm(pfile->vms, args->exclusive_vm_id);

