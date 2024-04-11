Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2BF8A14AC
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 14:31:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF7C10EF89;
	Thu, 11 Apr 2024 12:31:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="qwmnSSbh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB06910EF89
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 12:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1712838688;
 bh=zmevCFhXx6ZuzMCYAfjpOwI5DJ6QN9bdg4fgOkPUdqo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qwmnSSbhoBchnoBCuYnXfp2/6Jh3cN8jMBjFqh9AFIsoZwin9j3UUiUbk6U6zjoEQ
 ADrLiHD5rMU5plZ6/8l4lXNooe6j1yW+63uH8y6vLZsWmjKI63swv3aSnEFvsr72qr
 ZM27KFJFjzxFVaS/O97bQ1y/DEGFITe5vyUY/KTwAnyBtRuvfLBx9HzWPCLVf9cIyh
 8UyhB6kp/XbNKpXQTbtuXeQqzjalp11cbrYLoABsvl3yV+/LEsTBieN3d4WgPJ9VAo
 6SCIJRqaWzK/6Mg7ZArxaxnbDriu93Qt21D0GAYu6yS2qrbZGPI/P03AZWkqEPye1L
 xqhzxE9rPH8Qw==
Received: from [100.109.49.129] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0B7C537813C0;
 Thu, 11 Apr 2024 12:31:26 +0000 (UTC)
Message-ID: <6ca1e5de-2188-466f-a05c-ba190702d7a5@collabora.com>
Date: Thu, 11 Apr 2024 15:31:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/virtio: add driver_priv validation in
 virtio_gpu_create_context
To: Maxim Korotkov <korotkov.maxim.s@gmail.com>,
 David Airlie <airlied@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>, Ivan Kapranov <i.kapranov@securitycode.ru>,
 lvc-project@linuxtesting.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240328134351.298050-1-korotkov.maxim.s@gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20240328134351.298050-1-korotkov.maxim.s@gmail.com>
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

On 3/28/24 16:43, Maxim Korotkov wrote:
> The pointer file->driver_priv was dereferenced without checking
> against NULL, but in the "virtio_gpu_transfer_to_host_ioctl" function
> it was checked against NULL after calling virtio_gpu_create_context
> function.
> 
> Found by Security Code and Linux Verification Center(linuxtesting.org)
> Fixes: 72b48ae800da ("drm/virtio: enqueue virtio_gpu_create_context after the first 3D ioctl")
> Signed-off-by: Maxim Korotkov <korotkov.maxim.s@gmail.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> index e4f76f315550..98fe9ad4ed15 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -64,6 +64,9 @@ void virtio_gpu_create_context(struct drm_device *dev, struct drm_file *file)
>  	struct virtio_gpu_device *vgdev = dev->dev_private;
>  	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
>  
> +	if (!vfpriv)
> +		return;
> +
>  	mutex_lock(&vfpriv->context_lock);
>  	if (vfpriv->context_created)
>  		goto out_unlock;

NULL check in virtio_gpu_transfer_to_host_ioctl() is bogus, vfpriv can't
be NULL there.

-- 
Best regards,
Dmitry

