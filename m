Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB89EAE38BA
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 10:42:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E6DE10E2B9;
	Mon, 23 Jun 2025 08:42:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 338AC10E1D5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 08:42:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F6F8113E;
 Mon, 23 Jun 2025 01:42:13 -0700 (PDT)
Received: from [10.57.29.183] (unknown [10.57.29.183])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2305D3F63F;
 Mon, 23 Jun 2025 01:42:30 -0700 (PDT)
Message-ID: <f76f56af-91dd-49ce-bf7d-f42dba07eeaa@arm.com>
Date: Mon, 23 Jun 2025 09:42:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] panthor: set owner field for driver fops
To: Chia-I Wu <olvaffe@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250620235053.164614-1-olvaffe@gmail.com>
 <20250620235053.164614-2-olvaffe@gmail.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250620235053.164614-2-olvaffe@gmail.com>
Content-Type: text/plain; charset=UTF-8
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

On 21/06/2025 00:50, Chia-I Wu wrote:
> It allows us to get rid of manual try_module_get / module_put.
> 
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 1116f2d2826ee..775a66c394544 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1400,14 +1400,9 @@ panthor_open(struct drm_device *ddev, struct drm_file *file)
>  	struct panthor_file *pfile;
>  	int ret;
>  
> -	if (!try_module_get(THIS_MODULE))
> -		return -EINVAL;
> -
>  	pfile = kzalloc(sizeof(*pfile), GFP_KERNEL);
> -	if (!pfile) {
> -		ret = -ENOMEM;
> -		goto err_put_mod;
> -	}
> +	if (!pfile)
> +		return -ENOMEM;
>  
>  	pfile->ptdev = ptdev;
>  	pfile->user_mmio.offset = DRM_PANTHOR_USER_MMIO_OFFSET;
> @@ -1439,9 +1434,6 @@ panthor_open(struct drm_device *ddev, struct drm_file *file)
>  
>  err_free_file:
>  	kfree(pfile);
> -
> -err_put_mod:
> -	module_put(THIS_MODULE);
>  	return ret;
>  }
>  
> @@ -1454,7 +1446,6 @@ panthor_postclose(struct drm_device *ddev, struct drm_file *file)
>  	panthor_vm_pool_destroy(pfile);
>  
>  	kfree(pfile);
> -	module_put(THIS_MODULE);
>  }
>  
>  static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
> @@ -1555,6 +1546,7 @@ static void panthor_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>  }
>  
>  static const struct file_operations panthor_drm_driver_fops = {
> +	.owner = THIS_MODULE,
>  	.open = drm_open,
>  	.release = drm_release,
>  	.unlocked_ioctl = drm_ioctl,

