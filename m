Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FDF53652A
	for <lists+dri-devel@lfdr.de>; Fri, 27 May 2022 17:56:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BED2410FD3D;
	Fri, 27 May 2022 15:56:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92AE010FD3D;
 Fri, 27 May 2022 15:56:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 3D3D51F463CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653667011;
 bh=n5RHKvs6olD8LksjT484qw9Rh0JisRhUIQ7ggPkOqx4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q6kTO5Ap+i5kmaF5um389IzxbauaGndK+JrcD4hEezqh4whcGeSqpoC5zDuWw57KI
 8fh+bDAIu8408A79BVtUamQIZPLFV90q8BABnbTh44p5m/jr3XQRDvEP68ncgCedK7
 iWk55rkqi/komv0pBkw1cQB5acBLw5+u+DvpIejXBAgHDD4NeyeS1JVK49uoVmHCS2
 mbrHXxwVcX6JnH811NUonPSSXnHqfm2ChKbnZSgvS/P41yiK/z0a3BBHsiTV5+ccK9
 oLlgD/Myd6w2UL6nCNj7WWOM5ohWFrt2ikdxXL5RtRt+P5YoENL4mecu8Xj8kkWW7F
 NZnyFvgN0M2lA==
Date: Fri, 27 May 2022 11:56:36 -0400
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v6 04/22] drm/panfrost: Fix shrinker list corruption by
 madvise IOCTL
Message-ID: <YpD0tCuCd7HzwWg6@maud>
References: <20220526235040.678984-1-dmitry.osipenko@collabora.com>
 <20220526235040.678984-5-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220526235040.678984-5-dmitry.osipenko@collabora.com>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Steven Price <steven.price@arm.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 virtualization@lists.linux-foundation.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, amd-gfx@lists.freedesktop.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>, Qiang Yu <yuq825@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Robin Murphy <robin.murphy@arm.com>,
 Christian K??nig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

On Fri, May 27, 2022 at 02:50:22AM +0300, Dmitry Osipenko wrote:
> Calling madvise IOCTL twice on BO causes memory shrinker list corruption
> and crashes kernel because BO is already on the list and it's added to
> the list again, while BO should be removed from from the list before it's
> re-added. Fix it.
> 
> Cc: stable@vger.kernel.org
> Fixes: 013b65101315 ("drm/panfrost: Add madvise and shrinker support")
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 087e69b98d06..b1e6d238674f 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -433,8 +433,8 @@ static int panfrost_ioctl_madvise(struct drm_device *dev, void *data,
>  
>  	if (args->retained) {
>  		if (args->madv == PANFROST_MADV_DONTNEED)
> -			list_add_tail(&bo->base.madv_list,
> -				      &pfdev->shrinker_list);
> +			list_move_tail(&bo->base.madv_list,
> +				       &pfdev->shrinker_list);
>  		else if (args->madv == PANFROST_MADV_WILLNEED)
>  			list_del_init(&bo->base.madv_list);
>  	}
> -- 
> 2.35.3
> 
