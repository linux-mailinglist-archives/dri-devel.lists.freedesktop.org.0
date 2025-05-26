Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2706AC428E
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 17:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB2E510E3AB;
	Mon, 26 May 2025 15:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="WfZ1TXlu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B808A10E3A2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 15:48:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1748274499; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=naFkj9zmjJ2xcCm8fV/FlsMk8/dkeMOcl1YwlHmZX7ds/XoeeYF1klyHunWpoq0qG/M+W2tatyAX1Ym4HlpAk0pcX6ydAiQoGV5cziCIKpF8gvpSEECvP0v5OtJi2CwOQMTQR57gedDcVsD0xmPLX4hj6wvfYOSn82k50OoKCbk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1748274499;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=7u8vO7Ws768JnzmKvh2GmG4PF4lJ+CEAJNx0uPhyhQE=; 
 b=PUCvEeiZ+HlRLeM5uZhsKIKqMkZ6GGJs6i5MmTEKThCw+crouqHwC1MTIpAYfYmAHmCyHs6aEEi4WMyF9qcmekXci8tMOHOJxWgsUFTBVovV+AbQEor2AyQMm2fAFuNhViKUyZlcOO0fzlK+tuiLJWEc0A9yX0eRQKSVgDvXHV4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1748274499; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=7u8vO7Ws768JnzmKvh2GmG4PF4lJ+CEAJNx0uPhyhQE=;
 b=WfZ1TXlusW0K9YtTSApB3YEK7QfvL25+JrmhothPBfSMvMZG06jBawJPNenNuQbA
 FBa6IxiJkTYRgxuBtQndDvVU8npG7NhqrQlfJ/7lUN7ml6WdX6PSnSDnarekr1OjSVb
 rvaaUNot1I4/xqu0jB/ZPyKmB9mSDKxK+LKUt/Iw=
Received: by mx.zohomail.com with SMTPS id 1748274498096817.1869686603382;
 Mon, 26 May 2025 08:48:18 -0700 (PDT)
Message-ID: <28c64a39-1deb-4e0e-a395-2b243019ae70@collabora.com>
Date: Mon, 26 May 2025 18:48:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/virtio: implement virtio_gpu_shutdown
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Eric Auger
 <eric.auger@redhat.com>, David Airlie <airlied@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>
References: <20250507082821.2710706-1-kraxel@redhat.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250507082821.2710706-1-kraxel@redhat.com>
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

On 5/7/25 11:28, Gerd Hoffmann wrote:
> Calling drm_dev_unplug() is the drm way to say the device
> is gone and can not be accessed any more.
> 
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Tested-by: Eric Auger <eric.auger@redhat.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
> index e32e680c7197..71c6ccad4b99 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> @@ -130,10 +130,10 @@ static void virtio_gpu_remove(struct virtio_device *vdev)
>  
>  static void virtio_gpu_shutdown(struct virtio_device *vdev)
>  {
> -	/*
> -	 * drm does its own synchronization on shutdown.
> -	 * Do nothing here, opt out of device reset.
> -	 */
> +	struct drm_device *dev = vdev->priv;
> +
> +	/* stop talking to the device */
> +	drm_dev_unplug(dev);
>  }
>  
>  static void virtio_gpu_config_changed(struct virtio_device *vdev)

Could you please describe whether this patch is fixing a specific
problem or it's a generic improvement for avoiding potential problems on
shutdown.

-- 
Best regards,
Dmitry

