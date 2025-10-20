Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C31BF00E5
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 10:57:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E67A10E333;
	Mon, 20 Oct 2025 08:57:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8B75E10E32A
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 08:57:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A67D1063;
 Mon, 20 Oct 2025 01:57:16 -0700 (PDT)
Received: from [10.57.36.117] (unknown [10.57.36.117])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC8B63F66E;
 Mon, 20 Oct 2025 01:57:21 -0700 (PDT)
Message-ID: <6c01f00b-7be3-451e-8429-2c5036dfe103@arm.com>
Date: Mon, 20 Oct 2025 09:57:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/10] drm/panthor: Factor out GPU_ID register read
 into separate function
To: Karunika Choo <karunika.choo@arm.com>, dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20251014094337.1009601-1-karunika.choo@arm.com>
 <20251014094337.1009601-2-karunika.choo@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251014094337.1009601-2-karunika.choo@arm.com>
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

On 14/10/2025 10:43, Karunika Choo wrote:
> Split the GPU_ID register read into its own helper function. The GPU_ID
> value will be used to enable architecture-specific behaviours, which may
> also affect how other registers (such as those used for gpu_info) are
> read.
> 
> This change separates the read operation so that subsequent code can
> depend on the intermediate result of processing the GPU_ID.
> 
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>

I'd be very tempted to squash this into the next commit and simple read
the GPU ID at the beginning of panthor_hw_bind_device(). Is there any
reason not to?

Steve

> ---
>  drivers/gpu/drm/panthor/panthor_hw.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
> index 4f2858114e5e..326a9db0b5c2 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.c
> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
> @@ -62,7 +62,6 @@ static void panthor_gpu_info_init(struct panthor_device *ptdev)
>  {
>  	unsigned int i;
>  
> -	ptdev->gpu_info.gpu_id = gpu_read(ptdev, GPU_ID);
>  	ptdev->gpu_info.csf_id = gpu_read(ptdev, GPU_CSF_ID);
>  	ptdev->gpu_info.gpu_rev = gpu_read(ptdev, GPU_REVID);
>  	ptdev->gpu_info.core_features = gpu_read(ptdev, GPU_CORE_FEATURES);
> @@ -117,8 +116,23 @@ static void panthor_hw_info_init(struct panthor_device *ptdev)
>  		 ptdev->gpu_info.tiler_present);
>  }
>  
> +static int panthor_hw_gpu_id_init(struct panthor_device *ptdev)
> +{
> +	ptdev->gpu_info.gpu_id = gpu_read(ptdev, GPU_ID);
> +	if (!ptdev->gpu_info.gpu_id)
> +		return -ENXIO;
> +
> +	return 0;
> +}
> +
>  int panthor_hw_init(struct panthor_device *ptdev)
>  {
> +	int ret = 0;
> +
> +	ret = panthor_hw_gpu_id_init(ptdev);
> +	if (ret)
> +		return ret;
> +
>  	panthor_hw_info_init(ptdev);
>  
>  	return 0;

