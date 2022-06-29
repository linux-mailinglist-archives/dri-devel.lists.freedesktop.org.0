Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DE755F6F7
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 08:44:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59F9311276A;
	Wed, 29 Jun 2022 06:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16922113F6E;
 Wed, 29 Jun 2022 06:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 8D3F940CDE;
 Wed, 29 Jun 2022 08:43:50 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.11
X-Spam-Level: 
X-Spam-Status: No, score=-2.11 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Authentication-Results: ste-pvt-msa1.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9zVOpFpqurBe; Wed, 29 Jun 2022 08:43:49 +0200 (CEST)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id E77D240CD6;
 Wed, 29 Jun 2022 08:43:48 +0200 (CEST)
Received: from [192.168.0.209] (h-155-4-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 828A9360677;
 Wed, 29 Jun 2022 08:43:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1656485028; bh=lhOYNGqGisf/E17sgFrN5FIY96Ihx7G/tMj3K5gKxzw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DVzFW+KJOPDbhjAKm9CdyTI6VMdeTr0f9r1dPaIWy8TRfcE8pBAwRUNbgXu1Aq9X1
 erEdsBm3Wj/SnXDmI7gS7vo2eW2qpK2lNzlxt8GkPEpfs1zIWUKHVE5z74qTdZHYis
 3s7ooaxnN+paDWie6SRxEe77bEmvdZI0xGv/hSFU=
Message-ID: <6f2b0b7a-0031-dfe2-8ce2-191b940064b0@shipmail.org>
Date: Wed, 29 Jun 2022 08:43:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v6 08/22] drm/virtio: Unlock reservations on
 dma_resv_reserve_fences() error
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Qiang Yu <yuq825@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Thierry Reding
 <thierry.reding@gmail.com>, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
References: <20220526235040.678984-1-dmitry.osipenko@collabora.com>
 <20220526235040.678984-9-dmitry.osipenko@collabora.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <20220526235040.678984-9-dmitry.osipenko@collabora.com>
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/27/22 01:50, Dmitry Osipenko wrote:
> Unlock reservations on dma_resv_reserve_fences() error to fix recursive
> locking of the reservations when this error happens.
Fixes:
> Cc: stable@vger.kernel.org

With that fixed,

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>   drivers/gpu/drm/virtio/virtgpu_gem.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
> index 580a78809836..7db48d17ee3a 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_gem.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
> @@ -228,8 +228,10 @@ int virtio_gpu_array_lock_resv(struct virtio_gpu_object_array *objs)
>   
>   	for (i = 0; i < objs->nents; ++i) {
>   		ret = dma_resv_reserve_fences(objs->objs[i]->resv, 1);
> -		if (ret)
> +		if (ret) {
> +			virtio_gpu_array_unlock_resv(objs);
>   			return ret;
> +		}
>   	}
>   	return ret;
>   }
