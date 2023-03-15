Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AB26BB508
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 14:46:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B06210E035;
	Wed, 15 Mar 2023 13:46:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E25310E035;
 Wed, 15 Mar 2023 13:46:11 +0000 (UTC)
Received: from [192.168.2.157] (109-252-120-116.nat.spd-mgts.ru
 [109.252.120.116])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 412A9660304F;
 Wed, 15 Mar 2023 13:46:08 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1678887969;
 bh=S7oMT+PnbB3xBWVnAIzMs8C9/GOguaN9/toBE5JWi0k=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=gewkZxzIseoBmVjBQv37+rtA79+YTRKddLzUxVcFgkn4OUHvf3ubYpuD5XfM5sLjK
 RkQ8O4+2GC/cjKLBgrb1Pf3d8FGwz66wnX2T9PIEk+uKvUbl6MehPSk5y0LIib2IQ6
 EnTVD3/Ad85TT0VylXhnOnwZVGZj8FnBUiV8576e7rLn88KxNNibd0xzm9UwzNXUE/
 r53GtJ6tmTYFEgbo+LlCdf8PadwShgjLH82lPEix+uJretm4No84PYYkLa3OJepcrR
 477yaS9CGhw982HofdRDqqCchT8Bby3Dx2ANsy/fnDoxEvET/NlkObJIAJRXXMSqB6
 IcaeNALWxL7Ow==
Message-ID: <6b5644cf-6229-f99b-d429-a45d724493ee@collabora.com>
Date: Wed, 15 Mar 2023 16:46:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v13 01/10] drm/shmem-helper: Switch to reservation lock
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Herring <robh@kernel.org>
References: <20230314022659.1816246-1-dmitry.osipenko@collabora.com>
 <20230314022659.1816246-2-dmitry.osipenko@collabora.com>
In-Reply-To: <20230314022659.1816246-2-dmitry.osipenko@collabora.com>
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
Cc: intel-gfx@lists.freedesktop.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/14/23 05:26, Dmitry Osipenko wrote:
> @@ -633,7 +605,10 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
>  		return ret;
>  	}
>  
> +	dma_resv_lock(shmem->base.resv, NULL);
>  	ret = drm_gem_shmem_get_pages(shmem);
> +	dma_resv_unlock(shmem->base.resv);

Intel CI reported locking problem [1] here. It actually was also
reported for v12, but I missed that report because of the other noisy
reports.

[1]
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_114671v2/shard-snb5/igt@prime_vgem@sync@rcs0.html

The test does the following:

1. creates vgem
2. export it do dmabuf
3. mmaps dmabuf

There is an obvious deadlock there. The DRM code assumes that mmap() is
unlocked, while for dma-buf it's locked. I'll see how to fix it for v14.

-- 
Best regards,
Dmitry

