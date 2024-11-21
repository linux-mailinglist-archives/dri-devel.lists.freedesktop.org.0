Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA1E9D4A2F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 10:47:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A1610E8E7;
	Thu, 21 Nov 2024 09:47:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="gMn7qclb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B35F310E8E7;
 Thu, 21 Nov 2024 09:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+f/DS4eIhc6HJDHU7gW/93mS9sHoEQHIU8oWWCmNg0E=; b=gMn7qclbdFVAnDNBlsZg1SpwQ7
 9fka/v6UnK16oqpjoopcr6QWnUO26WS2iYyjYzCeqHZNASqkztfzzLz+wxOXc4JMxfhAvnAz4gdTP
 4+WKXe2aNEgfaaxXwe5EaAkb9AuqzdDNdV4IgPv9lo9ZV5jSZ5QYSa/CjTZbrPje5XAcfTH2I/unt
 8Nlr8+GBB1WG7hDtYRz/nVvOQ4uWphsu817xDAmK0JbBeR2rrMzBo9x773/UiUzrsee+K9tSMULKl
 NKORwsi2b751DJD36z6fiMXJ7G0KSBj7zKoAzRJZsGSXjN+skHxz41viDlsnoTVoYkoAb2/7XTryg
 pjREgyTg==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tE3mG-00ALcg-8Q; Thu, 21 Nov 2024 10:47:08 +0100
Message-ID: <d0c0802f-6fce-4112-a228-e484cebff383@igalia.com>
Date: Thu, 21 Nov 2024 09:47:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/etnaviv: Add fdinfo support for memory stats
To: Christian Gmeiner <christian.gmeiner@gmail.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, tursulin@igalia.com,
 Christian Gmeiner <cgmeiner@igalia.com>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241121092409.3859592-1-christian.gmeiner@gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20241121092409.3859592-1-christian.gmeiner@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 21/11/2024 09:24, Christian Gmeiner wrote:
> From: Christian Gmeiner <cgmeiner@igalia.com>
> 
> Use the new helper to export stats about memory usage.
> 
> Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
> ---
>   drivers/gpu/drm/etnaviv/etnaviv_drv.c | 12 +++++++++++-
>   drivers/gpu/drm/etnaviv/etnaviv_gem.c | 12 ++++++++++++
>   2 files changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> index 6500f3999c5f..35f47dd6367f 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -488,7 +488,16 @@ static const struct drm_ioctl_desc etnaviv_ioctls[] = {
>   	ETNA_IOCTL(PM_QUERY_SIG, pm_query_sig, DRM_RENDER_ALLOW),
>   };
>   
> -DEFINE_DRM_GEM_FOPS(fops);
> +static void etnaviv_show_fdinfo(struct drm_printer *p, struct drm_file *file)
> +{
> +	drm_show_memory_stats(p, file);
> +}
> +
> +static const struct file_operations fops = {
> +	.owner = THIS_MODULE,
> +	DRM_GEM_FOPS,
> +	.show_fdinfo = drm_show_fdinfo,
> +};
>   
>   static const struct drm_driver etnaviv_drm_driver = {
>   	.driver_features    = DRIVER_GEM | DRIVER_RENDER,
> @@ -498,6 +507,7 @@ static const struct drm_driver etnaviv_drm_driver = {
>   #ifdef CONFIG_DEBUG_FS
>   	.debugfs_init       = etnaviv_debugfs_init,
>   #endif
> +	.show_fdinfo        = etnaviv_show_fdinfo,
>   	.ioctls             = etnaviv_ioctls,
>   	.num_ioctls         = DRM_ETNAVIV_NUM_IOCTLS,
>   	.fops               = &fops,
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> index 5c0c9d4e3be1..e81c261b0017 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -527,6 +527,17 @@ void etnaviv_gem_obj_add(struct drm_device *dev, struct drm_gem_object *obj)
>   	mutex_unlock(&priv->gem_lock);
>   }
>   
> +static enum drm_gem_object_status etnaviv_gem_status(struct drm_gem_object *obj)
> +{
> +	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
> +	enum drm_gem_object_status status = 0;
> +
> +	if (etnaviv_obj->pages)
> +		status |= DRM_GEM_OBJECT_RESIDENT;
> +
> +	return status;

Or just:

return etnaviv_obj->pages ? DRM_GEM_OBJECT_RESIDENT : 0;

But it is inconsequential, or maybe even you plan to add purgeable at 
some point.

> +}
> +
>   static const struct vm_operations_struct vm_ops = {
>   	.fault = etnaviv_gem_fault,
>   	.open = drm_gem_vm_open,
> @@ -540,6 +551,7 @@ static const struct drm_gem_object_funcs etnaviv_gem_object_funcs = {
>   	.get_sg_table = etnaviv_gem_prime_get_sg_table,
>   	.vmap = etnaviv_gem_prime_vmap,
>   	.mmap = etnaviv_gem_mmap,
> +	.status = etnaviv_gem_status,
>   	.vm_ops = &vm_ops,
>   };
>  
Either way LGTM.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko
