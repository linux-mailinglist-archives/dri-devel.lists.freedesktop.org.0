Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D19497B1AE8
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 13:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87BAC10E60D;
	Thu, 28 Sep 2023 11:24:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF20D10E046;
 Thu, 28 Sep 2023 11:24:51 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 37EE76607336;
 Thu, 28 Sep 2023 12:24:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695900290;
 bh=W/205ZyIxCbiuSv0AgUlUg37VTFSi/1Fl14e/tpAOfY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gl3T4VSuuRiG/ynLxxA6IrAqaxfor42cWWcEVcvxZ3Yzu8t8onfQBM9hCu3VUp7Yc
 jWnPguYyzroEvrqkt/W2hgdw9lO+z7BqAeO4CPrxXIdo1y+oWrrpLPtyZI65Qs8yry
 hWzhdGK0SItMY1QvUk74lxc/SNu3NtrLy2TLZtJHfpM64iqxMlAHP6J9I6dHfRsq3U
 8+HnL51zlcvYJGjBatZLZK/QaQlwEeUMFNMQTTnThN1nOagYM2W92XNBL41yk835Kf
 zmzAaGSLuFu+bh7lje0KVVpREbFQar+xPs0h6ClDtYTfWfzRaNujx5LHnlH7lM82jw
 hn7kLc+HQ9yXQ==
Message-ID: <64367e0c-6ec9-8dfa-ab9c-51b530247f74@collabora.com>
Date: Thu, 28 Sep 2023 13:24:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v7 5/5] drm/panfrost: Implement generic DRM object RSS
 reporting function
Content-Language: en-US
To: =?UTF-8?Q?Adri=c3=a1n_Larumbe?= <adrian.larumbe@collabora.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, robh@kernel.org, steven.price@arm.com
References: <20230927213133.1651169-1-adrian.larumbe@collabora.com>
 <20230927213133.1651169-6-adrian.larumbe@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230927213133.1651169-6-adrian.larumbe@collabora.com>
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
Cc: tvrtko.ursulin@linux.intel.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 healych@amazon.com, boris.brezillon@collabora.com, kernel@collabora.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 27/09/23 23:29, Adrián Larumbe ha scritto:
> BO's RSS is updated every time new pages are allocated on demand and mapped
> for the object at GPU page fault's IRQ handler, but only for heap buffers.
> The reason this is unnecessary for non-heap buffers is that they are mapped
> onto the GPU's VA space and backed by physical memory in their entirety at
> BO creation time.
> 
> This calculation is unnecessary for imported PRIME objects, since heap
> buffers cannot be exported by our driver, and the actual BO RSS size is the
> one reported in its attached dmabuf structure.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>
> ---
>   drivers/gpu/drm/panfrost/panfrost_gem.c | 15 +++++++++++++++
>   drivers/gpu/drm/panfrost/panfrost_gem.h |  5 +++++
>   drivers/gpu/drm/panfrost/panfrost_mmu.c |  1 +
>   3 files changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
> index 7d8f83d20539..4365434b48db 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -208,6 +208,20 @@ static enum drm_gem_object_status panfrost_gem_status(struct drm_gem_object *obj
>   	return res;
>   }
>   
> +static size_t panfrost_gem_rss(struct drm_gem_object *obj)
> +{
> +	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
> +
> +	if (bo->is_heap) {
> +		return bo->heap_rss_size;
> +	} else if (bo->base.pages) {
> +		WARN_ON(bo->heap_rss_size);
> +		return bo->base.base.size;
> +	} else {
> +		return 0;
> +	}

I would do, instead...

......
	if (bo->is_heap) {
		return bo->heap_rss_size;
	} else if (bo->base.pages) {
		WARN_ON(bo->heap_rss_size);
		return bo->base.base.size;
	}

	return 0;
}

Apart from that,
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

