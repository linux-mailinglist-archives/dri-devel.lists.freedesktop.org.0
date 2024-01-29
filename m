Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE158400EE
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 10:09:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 276B010EF03;
	Mon, 29 Jan 2024 09:09:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF8C10EF03
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 09:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706519349;
 bh=3eVGnHQarUvvYEP93Efg52JEWCK+33R/xQvbNmpvJBY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=tMLn71ODKx6DF+vSa8/KkoIvMDRiO6FIg+NwQjJDxf4wBpUl+EchCZYCM4DeLemAq
 xZ+yncKFM0IqFGN43pSSOGBQpz0DDzQJYdVwnv93RSgQISVR+cpvh/wLapwQ6zXDde
 8DjxsK1mdT9CztY4apxWZugMfum2F1dPagdplBPYyPb6Ir1DdtDfsWIO9tlIuDlr99
 B6zywy/V/MhPGItatLHPzi5/lbF86zr/PW4fuobLrebAv9HO0c8HZ+SgoLnOJn5LEf
 DV+l5hZ7+0eS05Hxr3bNuELW043fqkei8ypbnzmr9R+b/mz4s41C8LO/iLyvdubSmN
 O9mubjbsLTzHw==
Received: from [100.109.49.129] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 97BA437814A4;
 Mon, 29 Jan 2024 09:09:08 +0000 (UTC)
Message-ID: <9eea9580-744a-4b04-97a1-11e86565b895@collabora.com>
Date: Mon, 29 Jan 2024 12:09:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] drm/virtio: set segment size for virtio_gpu device
Content-Language: en-US
To: Sebastian Ott <sebott@redhat.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
References: <7258a4cc-da16-5c34-a042-2a23ee396d56@redhat.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <7258a4cc-da16-5c34-a042-2a23ee396d56@redhat.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/23/24 21:14, Sebastian Ott wrote:
> drm/virtio: set segment size for virtio_gpu device
> 
> Set the segment size of the virtio_gpu device to the value
> used by the drm helpers when allocating sg lists to fix the
> following complaint from DMA_API debug code:
> DMA-API: virtio-pci 0000:07:00.0: mapping sg segment longer than device
> claims to support [len=262144] [max=65536]
> 
> Signed-off-by: Sebastian Ott <sebott@redhat.com>
> ---
>   drivers/gpu/drm/virtio/virtgpu_drv.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c
> b/drivers/gpu/drm/virtio/virtgpu_drv.c
> index 4334c7608408..74b2cb3295af 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> @@ -94,6 +94,7 @@ static int virtio_gpu_probe(struct virtio_device *vdev)
>               goto err_free;
>       }
> 
> +    dma_set_max_seg_size(dev->dev, dma_max_mapping_size(dev->dev) ? :
> UINT_MAX);
>       ret = virtio_gpu_init(vdev, dev);
>       if (ret)
>           goto err_free;

Added stable tag and applied to misc-fixes. Please use `git send-email`
next time. Thanks

-- 
Best regards,
Dmitry

