Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BD56F540A
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 11:11:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 528AF10E211;
	Wed,  3 May 2023 09:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E49B10E211;
 Wed,  3 May 2023 09:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683105101; x=1714641101;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yZdDxF7eM2/0DaJdrpLaz+vSoS07hfHOMx2AFF1OeTM=;
 b=ZlxfqmhP0GtMqNps8JIe86VXSChnecBASJBRT3GqdYvqhyt3l9UZIEaT
 7CeKI7BYZn8r3xQpZuQaJEJuvN7Myj2J96SjWcXjinpwBz5uqeDHgvOpP
 wxV9Up3o9bH3sxZnpQpVoi4hQqQ+vlCU5PJ+pT0Mc+VxbnkSlj5o4l6GX
 cBhNDdHc7ROhG5eoeMs99EIZKXV4VuWgQxYg7wBBX9FpQH4m88roiPFdv
 HDDElvg3hIKx7XofGIgotHHnJiDsjkJiiE/2jHhq++wQY7kUAetfj55D/
 UlcTcEWTFrYzOz7NJgd8pQEz72A5+TZAJ3n5QwYbuXkqpKRflSHz4F4Yr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="337745867"
X-IronPort-AV: E=Sophos;i="5.99,246,1677571200"; d="scan'208";a="337745867"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 02:11:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="674010950"
X-IronPort-AV: E=Sophos;i="5.99,246,1677571200"; d="scan'208";a="674010950"
Received: from skallurr-mobl1.ger.corp.intel.com (HELO [10.249.254.212])
 ([10.249.254.212])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 02:11:35 -0700
Message-ID: <888841c4-7bd4-8174-7786-033715c995c6@linux.intel.com>
Date: Wed, 3 May 2023 11:11:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [Intel-xe] [RFC PATCH 3/4] drm/ttm: Handle -EAGAIN in
 ttm_resource_alloc as -ENOSPC.
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org, cgroups@vger.kernel.org,
 intel-xe@lists.freedesktop.org
References: <20230503083500.645848-1-maarten.lankhorst@linux.intel.com>
 <20230503083500.645848-4-maarten.lankhorst@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230503083500.645848-4-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Zefan Li <lizefan.x@bytedance.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Johannes Weiner <hannes@cmpxchg.org>,
 Tejun Heo <tj@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Maarten

On 5/3/23 10:34, Maarten Lankhorst wrote:
> This allows the drm cgroup controller to return no space is available..
>
> XXX: This is a hopeless simplification that changes behavior, and
> returns -ENOSPC even if we could evict ourselves from the current
> cgroup.
>
> Ideally, the eviction code becomes cgroup aware, and will force eviction
> from the current cgroup or its parents.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Thinking of the shrinker analogy, do non-cgroup aware shrinkers just 
shrink blindly or do they reject shrinking like this patch when a cgroup 
limit is reached?

/Thomas


> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index bd5dae4d1624..e057d5d8f09a 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -731,6 +731,8 @@ static int ttm_bo_mem_force_space(struct ttm_buffer_object *bo,
>   		ret = ttm_resource_alloc(bo, place, mem);
>   		if (likely(!ret))
>   			break;
> +		if (ret == -EAGAIN)
> +			return -ENOSPC;
>   		if (unlikely(ret != -ENOSPC))
>   			return ret;
>   		ret = ttm_mem_evict_first(bdev, man, place, ctx,
> @@ -783,7 +785,7 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
>   
>   		type_found = true;
>   		ret = ttm_resource_alloc(bo, place, mem);
> -		if (ret == -ENOSPC)
> +		if (ret == -ENOSPC || ret == -EAGAIN)
>   			continue;
>   		if (unlikely(ret))
>   			goto error;
