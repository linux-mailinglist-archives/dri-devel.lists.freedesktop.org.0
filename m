Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA857B1AEE
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 13:25:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2E110E61F;
	Thu, 28 Sep 2023 11:25:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E2110E612;
 Thu, 28 Sep 2023 11:24:58 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 986DC6607336;
 Thu, 28 Sep 2023 12:24:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695900297;
 bh=ZP5bzU9qHJFkcpD4ryCRgiOv6yn4kejJ1hx7JP4M180=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RpKwsv1q/Axijpdw4F3NEbjrqmJX1bYL5H527sEn8rtP0I8GU8fwU64RgC+zw12/q
 ZdrHBr+BO4uPFlwPkCfSKj0N0Roj30DrX97yNEDmNEXnUqOn6SiBIEhBlL/ZHiU9uW
 vtK2t7syFgIU//kiJGgyqlw25k4E000iRRkSP7OcaFLvDp9ZWc82eVEJOP7oA9e8MO
 08XMNUIvU4y4tNJxAmaphvloqp4e2N8T28lohaLrypzQ8Sl2zk7c2D8hrvvvOTLLTF
 xyGgsZP7EsIBP9mwjpbbkbKxeOBJc+D6kTMN0CpLfGXqMyVXts+jHltiqxRPKPlsX5
 dsqe6GFVrIpdw==
Message-ID: <8dcc52f5-0a52-c741-1db8-1473125a21ff@collabora.com>
Date: Thu, 28 Sep 2023 13:24:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v7 3/5] drm/panfrost: Add fdinfo support for memory stats
Content-Language: en-US
To: =?UTF-8?Q?Adri=c3=a1n_Larumbe?= <adrian.larumbe@collabora.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, robh@kernel.org, steven.price@arm.com
References: <20230927213133.1651169-1-adrian.larumbe@collabora.com>
 <20230927213133.1651169-4-adrian.larumbe@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230927213133.1651169-4-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: tvrtko.ursulin@linux.intel.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 healych@amazon.com, boris.brezillon@collabora.com, kernel@collabora.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 27/09/23 23:29, Adrián Larumbe ha scritto:
> A new DRM GEM object function is added so that drm_show_memory_stats can
> provide more accurate memory usage numbers.
> 
> Ideally, in panfrost_gem_status, the BO's purgeable flag would be checked
> after locking the driver's shrinker mutex, but drm_show_memory_stats takes
> over the drm file's object handle database spinlock, so there's potential
> for a race condition here.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>
> ---
>   drivers/gpu/drm/panfrost/panfrost_drv.c |  2 ++
>   drivers/gpu/drm/panfrost/panfrost_gem.c | 14 ++++++++++++++
>   2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 97e5bc4a82c8..b834777b409b 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -568,6 +568,8 @@ static void panfrost_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>   	struct panfrost_device *pfdev = dev->dev_private;
>   
>   	panfrost_gpu_show_fdinfo(pfdev, file->driver_priv, p);
> +
> +	drm_show_memory_stats(p, file);
>   }
>   
>   static const struct file_operations panfrost_drm_driver_fops = {
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
> index 3c812fbd126f..7d8f83d20539 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -195,6 +195,19 @@ static int panfrost_gem_pin(struct drm_gem_object *obj)
>   	return drm_gem_shmem_pin(&bo->base);
>   }
>   
> +static enum drm_gem_object_status panfrost_gem_status(struct drm_gem_object *obj)
> +{
> +	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
> +	enum drm_gem_object_status res = 0;

The initialization of `res` is redundant...

enum drm_gem_object_status res;
res = (bo->base.madv == PANFROST_MADV_DONTNEED) ? DRM_GEM_OBJECT_PURGEABLE : 0;

P.S.: 88 columns are generally fine, so this could also fit in one line.

After that,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> +
> +	res |= (bo->base.madv == PANFROST_MADV_DONTNEED) ?
> +		DRM_GEM_OBJECT_PURGEABLE : 0;
> +
> +	res |= (bo->base.pages) ? DRM_GEM_OBJECT_RESIDENT : 0;
> +
> +	return res;
> +}
> +
>   static const struct drm_gem_object_funcs panfrost_gem_funcs = {
>   	.free = panfrost_gem_free_object,
>   	.open = panfrost_gem_open,
> @@ -206,6 +219,7 @@ static const struct drm_gem_object_funcs panfrost_gem_funcs = {
>   	.vmap = drm_gem_shmem_object_vmap,
>   	.vunmap = drm_gem_shmem_object_vunmap,
>   	.mmap = drm_gem_shmem_object_mmap,
> +	.status = panfrost_gem_status,
>   	.vm_ops = &drm_gem_shmem_vm_ops,
>   };
>   

