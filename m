Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C96B01A8B
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 13:29:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B41910E27D;
	Fri, 11 Jul 2025 11:29:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="FQW26C9s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 200C810E27D;
 Fri, 11 Jul 2025 11:29:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1752233352; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=iYyOIYVrZatS2CofuSFt90KU4RwZD9SQ1eI5fyB+ErNyv84hzcMlpjz9dDzxOOd2x+RjlIoyY21EJUoL0oQY+wvNacgiEx3Z1vfPkDqi0O2ksM2jpTaHXuiFGotvjVILPjo/Xs1aTTpc89YJDEX3OGMxTnOZhxLIjPv4fi0YnA4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1752233352;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=57gYkWOIodci/rzLMJRT5FjRo8be6KH1VRtkOEb22+Y=; 
 b=NGC7YphbvyX9Q7d1nX56g2VfMyTeTRf4CeFaMLtcEA6tKy7xplAEJJZIpW90mgJdBbL8AmgVoE/47Zhbmq/KBE6WN+HNDpatEyJl/p23niVWxtjsqmNItYuqe13Gn/8JL4qNYYPksNP1peJ8xr+bpxH8loHv4AskaGNPx4FJJIo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752233352; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=57gYkWOIodci/rzLMJRT5FjRo8be6KH1VRtkOEb22+Y=;
 b=FQW26C9sjtEapx3TPrIk8nySMknK3rIc4ti5fluXZRNsbOmW9Y51spt5UeG0Ejr6
 2AVT1piXGFOwBeYIugodpQ/ifVm1Q2ipp/eNB2K3SD6GnWgkqlo1dYo/Cyg9g0928cE
 o9PWqX+SKiMB4teDHZjqZ77b41UGvGPsT/vaSuQ0=
Received: by mx.zohomail.com with SMTPS id 1752233350071649.1816103321455;
 Fri, 11 Jul 2025 04:29:10 -0700 (PDT)
Message-ID: <9058368a-0e5b-4cb5-a04f-6feaa80329a0@collabora.com>
Date: Fri, 11 Jul 2025 14:29:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] Revert "drm/virtio: Use dma_buf from GEM object
 instance"
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, christian.koenig@amd.com, torvalds@linux-foundation.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk, kraxel@redhat.com,
 christian.gmeiner@gmail.com, gurchetansingh@chromium.org, olvaffe@gmail.com,
 zack.rusin@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, virtualization@lists.linux.dev,
 intel-gfx@lists.freedesktop.org
References: <20250711093744.120962-1-tzimmermann@suse.de>
 <20250711093744.120962-4-tzimmermann@suse.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250711093744.120962-4-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

On 7/11/25 12:35, Thomas Zimmermann wrote:
> This reverts commit 415cb45895f43015515473fbc40563ca5eec9a7c.
> 
> Reverting because the fix-up commits are suspected to cause regressions.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Are the fixes and stable tags missing in the patches? AFAICT, the intent
is to fix stable 6.15 kernel regression.

> ---
>  drivers/gpu/drm/virtio/virtgpu_prime.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
> index 722cde5e2d86..97aaee26cb02 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_prime.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
> @@ -204,15 +204,16 @@ static void virtgpu_dma_buf_free_obj(struct drm_gem_object *obj)
>  {
>  	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
>  	struct virtio_gpu_device *vgdev = obj->dev->dev_private;
> +	struct dma_buf_attachment *attach = obj->import_attach;
>  
>  	if (drm_gem_is_imported(obj)) {
> -		struct dma_buf *dmabuf = bo->dma_buf;
> +		struct dma_buf *dmabuf = attach->dmabuf;

Nit: I'd write this as `dmabuf = obj->import_attach->dmabuf` for more
consistency with drm_gem_is_imported()

>  		dma_resv_lock(dmabuf->resv, NULL);
>  		virtgpu_dma_buf_unmap(bo);
>  		dma_resv_unlock(dmabuf->resv);
>  
> -		dma_buf_detach(dmabuf, obj->import_attach);
> +		dma_buf_detach(dmabuf, attach);
>  		dma_buf_put(dmabuf);
>  	}
>  

Acked-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry
