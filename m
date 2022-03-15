Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3CB4D9BC7
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 14:05:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA8D10E460;
	Tue, 15 Mar 2022 13:05:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEBD510E462
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 13:05:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id EE84C1F415A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647349504;
 bh=b7ZAtAzK1nmdrxrEfagaapYt3BcO4V9nmCc81ZlA8+s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UpTmq7KjH1lO5fZ8TVawUj8c5D3flmcQqfy+Xh2LeKvmX/PNoL4xP3Q07QB90NfV4
 /d6U6S51BoASb6nVFrBSD4EYOowNwhPAbeS1FjMy129p5rNF+5kNFafpKBF3F+5zwM
 cVbgSR240nMYYtje9zeZ5dCfHaCuPkAsOOtXkiSA6ztnB8df9B2/5yij1kR/h359hq
 ABBQuqjl0uvpPptAHOHG3v9vBcabi/EPKN20FWf5/33FyhKJKPZQM3KEz6Li5b9PsS
 JVJbB+tzccrIxRs0/0Z+YIB9RsFJS0xhKPvQWYyuyC9/WWWUmRrWqH6y0RyxYw87HZ
 Jn1AayjVUOU6A==
Message-ID: <1b6f21ce-1677-9d6e-f036-973a7f98a298@collabora.com>
Date: Tue, 15 Mar 2022 16:05:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 1/8] drm/virtio: Correct drm_gem_shmem_get_sg_table()
 error handling
Content-Language: en-US
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Emil Velikov <emil.l.velikov@gmail.com>
References: <20220314224253.236359-1-dmitry.osipenko@collabora.com>
 <20220314224253.236359-2-dmitry.osipenko@collabora.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220314224253.236359-2-dmitry.osipenko@collabora.com>
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
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 dri-devel@lists.freedesktop.org, Dmitry Osipenko <digetx@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/15/22 01:42, Dmitry Osipenko wrote:
> drm_gem_shmem_get_sg_table() never ever returned NULL on error. Correct
> the error handling to avoid crash on OOM.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_object.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
> index f293e6ad52da..bea7806a3ae3 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -168,9 +168,11 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
>  	 * since virtio_gpu doesn't support dma-buf import from other devices.
>  	 */
>  	shmem->pages = drm_gem_shmem_get_sg_table(&bo->base);
> -	if (!shmem->pages) {
> +	ret = PTR_ERR(shmem->pages);

This actually needs to be PTR_ERR_OR_ZERO. This code is changed to use
drm_gem_shmem_get_pages_sgt()+IS_ERR() by the further patch, so I just
missed the typo previously. I'll correct it in v3.
