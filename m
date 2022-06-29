Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4DA560C2C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 00:15:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBFEA10E6B6;
	Wed, 29 Jun 2022 22:15:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A0CB10E6B6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 22:15:41 +0000 (UTC)
Received: from [192.168.2.145] (109-252-118-164.nat.spd-mgts.ru
 [109.252.118.164])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 38C876601926;
 Wed, 29 Jun 2022 23:15:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1656540939;
 bh=bhZaA7/Smyh0XRFzLMtb69xiZ0vjfNMCv3A/P8IEc9A=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=GQAFeGCODBDvgPPPfTOVe6b1O0JI9XmFrldGCjBUVPpAve5u+tifIgw3p+z0dsSzn
 MsxeZ2Ls/EYGoOsHY1YAnAcveilANEz78hi5n/PG/HP0KZJLqMOtqzSVfBCyGkxQ50
 xVSwZ5CQMESPmzX2ZM+6zPRXJzxSRRU3mfxZLAe1CG+bnEaAVlLBUtfkY0p9pcyULc
 x0ib1AUlTSxC6M5gkhLw3zCsDw3SygmqdR9bI1xDJTZbQSAY0qqAPaCrq3jIxv29cS
 +tG2oDLZ12JWyDK6dNCjpDP151J9EGvoV503417rLmNtSbA7XoHSsryKTSATTIpHLW
 JmyGkm/q6YKxg==
Message-ID: <d2852b09-7613-3d6c-fec7-7cf9fdf959ed@collabora.com>
Date: Thu, 30 Jun 2022 01:15:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] drm/virtio: Fix NULL vs IS_ERR checking in
 virtio_gpu_object_shmem_init
Content-Language: en-US
To: Miaoqian Lin <linmq006@gmail.com>, David Airlie <airlied@linux.ie>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
References: <20220602104223.54527-1-linmq006@gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220602104223.54527-1-linmq006@gmail.com>
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

On 6/2/22 13:42, Miaoqian Lin wrote:
> Since drm_prime_pages_to_sg() function return error pointers.
> The drm_gem_shmem_get_sg_table() function returns error pointers too.
> Using IS_ERR() to check the return value to fix this.
> 
> Fixes: 2f2aa13724d5 ("drm/virtio: move virtio_gpu_mem_entry initialization to new function")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
> changes in v2:
> - Update Fixes tag.
> - rebase the working tree.
> v1 Link: https://lore.kernel.org/all/20211222072649.18169-1-linmq006@gmail.com/
> ---
>  drivers/gpu/drm/virtio/virtgpu_object.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
> index f293e6ad52da..1cc8f3fc8e4b 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -168,9 +168,9 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
>  	 * since virtio_gpu doesn't support dma-buf import from other devices.
>  	 */
>  	shmem->pages = drm_gem_shmem_get_sg_table(&bo->base);
> -	if (!shmem->pages) {
> +	if (IS_ERR(shmem->pages)) {
>  		drm_gem_shmem_unpin(&bo->base);
> -		return -EINVAL;
> +		return PTR_ERR(shmem->pages);
>  	}
>  
>  	if (use_dma_api) {

Sorry for noticing this late. This patch is incorrect because
shmem->pages must be NULLed on error, otherwise
virtio_gpu_cleanup_object() will crash :/

I also had a patch that fixes this problem [1] and it did it properly. I
see that this patch is in -next already, so will update my patch to fix
the fix now.

[1]
https://vanko.io/project/dri-devel/patch/20220526235040.678984-6-dmitry.osipenko@collabora.com/

-- 
Best regards,
Dmitry
