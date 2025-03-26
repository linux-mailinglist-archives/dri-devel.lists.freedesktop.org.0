Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD04A70E66
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 02:23:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D93D10E09E;
	Wed, 26 Mar 2025 01:23:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="beOej1Ik";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA5210E09E
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 01:23:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1742952190; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=DQBxuP8yg1Fun9ghnAopfik+fTSE2qB8zjUwtloNmi7O7Esdn5uQA4S6Yakx3/8M2jTOy6fVQE4edvVjutBgtqDqT+Yu/N4AaLej3a83rjqP7ctdyffttI2yCw6ZCVawES7clUJqi+9d6NPWMKl22OiKd03azvNGVeha51OERas=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1742952190;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=NW9f+bZKrYG4W4EGpkQjKSRjNSJ3MN6IiH7LLUom2xs=; 
 b=IpUOMOqkUA2XL8A+TClmJ7CeQXTA2TJ+sE2nOe1eEJYgQDKFlEe6kj41iwqRJmslH0YwFwFW8hbTanuzZNHju+KfifZ+OsmK4xmqyFbYcB+FtreylAEYPswzqyUYDARtqyhoOHDaciK7XzBKPRGvs4dra/uWSk/OOLT+SFp14as=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742952190; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=NW9f+bZKrYG4W4EGpkQjKSRjNSJ3MN6IiH7LLUom2xs=;
 b=beOej1IkmDldd4HRa8P09RUb+VCnxw62wVKj2RZDKt7WNTnS99CniNpeVi9+52z+
 9OBMEgpFj/bxWtYG4rPwbpKe0QYKhgaW2e8RnbkARviNyd1momkVwbdUQ6fRie3OZyt
 GyWrrMEw/CjOKlAu4A8mLuemmzX2cYbmBNhpnk1Q=
Received: by mx.zohomail.com with SMTPS id 1742952187876559.010850757304;
 Tue, 25 Mar 2025 18:23:07 -0700 (PDT)
Message-ID: <314238f1-9c89-4dab-a338-a40765076fd9@collabora.com>
Date: Wed, 26 Mar 2025 04:23:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/virtio: Fix flickering issue seen with imported
 dmabufs
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>
References: <20250325201021.1315080-1-vivek.kasireddy@intel.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250325201021.1315080-1-vivek.kasireddy@intel.com>
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

On 3/25/25 23:10, Vivek Kasireddy wrote:
> We need to save the reservation object pointer associated with the
> imported dmabuf in the newly created GEM object to allow
> drm_gem_plane_helper_prepare_fb() to extract the exclusive fence
> from it and attach it to the plane state during prepare phase.
> This is needed to ensure that drm_atomic_helper_wait_for_fences()
> correctly waits for the relevant fences (move, etc) associated with
> the reservation object, thereby implementing proper synchronization.
> 
> Otherwise, artifacts or slight flickering can be seen when apps
> are dragged across the screen when running Gnome (Wayland). This
> problem is mostly seen with dGPUs in the case where the FBs are
> allocated in VRAM but need to be migrated to System RAM as they
> are shared with virtio-gpu.
> 
> Fixes: ca77f27a2665 ("drm/virtio: Import prime buffers from other devices as guest blobs")
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Cc: Gurchetan Singh <gurchetansingh@chromium.org>
> Cc: Chia-I Wu <olvaffe@gmail.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_prime.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
> index fe6a0b018571..ceb0401a000b 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_prime.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
> @@ -332,6 +332,7 @@ struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
>  	}
>  
>  	obj->import_attach = attach;
> +	obj->resv = buf->resv;
>  	get_dma_buf(buf);
>  
>  	ret = virtgpu_dma_buf_init_obj(dev, bo, attach);

Will be better to set obj->resv before drm_gem_private_object_init()
since it checks whether obj->resv was pre-inited. I'll change it while
applying, thanks.

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry
