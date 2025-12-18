Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C90D9CCB05E
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 09:56:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 362FC10E271;
	Thu, 18 Dec 2025 08:55:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ig0mTM9I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F302010E271
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 08:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1766048139;
 bh=x2XJtBGwsRJl5nu4YWRn4RoWFF95goqIyI2zNi68T+o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ig0mTM9I9/tZubSTxKPi06oM6NdyiFrpJLjiaC4uMzW5ztgTgFIJXGVpIP5NpNU6g
 yJ0HPULdZcIJnBwHwVD6KEfo8NHrPV06riMJgWvZB/La6T9LZPgi9U3Egq77ms3r4+
 Ljji4Q01j/eZ9YrlrtUCMtN/gIVaVZFHBO00bNTNT79HC1M6BOZ7G/zJrchvHJUZqE
 x8mSshaBKqJC2dkO9sYnPF2xpzE0lkV68Rn3mlouAuhfQnTZOC8lvnTtcqYRuEZLDJ
 gENfXZyb1Mwyz5I6Jc71UyARln/bdQKh4tM/DPFzHv5Wi4+K3UQUqb7n+dbNcO/Pr5
 OWIkNFgWKO54Q==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id DBD9F17E0C21;
 Thu, 18 Dec 2025 09:55:38 +0100 (CET)
Date: Thu, 18 Dec 2025 09:55:34 +0100
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
Message-ID: <20251218095534.3ad4ad87@fedora>
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

Oops.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> 
> Fixes: cd2c9c3015e6 ("drm/panthor: Add flag to map GEM object Write-Back Cacheable")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
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

