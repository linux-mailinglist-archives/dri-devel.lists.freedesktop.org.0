Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEE0AF82CF
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 23:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5311110E1D5;
	Thu,  3 Jul 2025 21:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="J5Sew1aU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 441F910E1D5;
 Thu,  3 Jul 2025 21:46:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 479B461151;
 Thu,  3 Jul 2025 21:46:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE67AC4CEE3;
 Thu,  3 Jul 2025 21:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751579163;
 bh=DND6ypZfJW+LP5qSzA92mo8thEqaa5SJ5DhQjncboNM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=J5Sew1aUoL+l+Okn9IX2fl/Ei7ojqpR/54JehsrtofRn2OyznQDFK178zZOqZVw7j
 yAE70oYQvGdzzXYmX9f7vmMeagB4LEaTUuHvgmXrvu/HZU+iz5dWLwZRBhpValAXgm
 j2LAmxnsqXs4SgjJdla7x/tcvk4T383NuJ/l+RxzcKSNXNQjusnkaw8dh+RLVZMzaY
 jme7wLni/f71nWubyGAiN1ap5VBF79K2n1PlzAcW9uBNLMVic/c1b2GS8jkqdIKNvL
 X2heniAwleYHyTPi0L6LJrbG0sk9QYv4TNtdYbs4Li9Ce52//pUlf+IlwuQwxkhZIx
 mAhkf+llS4qrA==
Message-ID: <3bdcc576-5c5a-4735-9e6f-e56ead2270b8@kernel.org>
Date: Thu, 3 Jul 2025 23:46:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nouveau/gsp: add a 50ms delay between fbsr and driver
 unload rpcs
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, Ben Skeggs <bskeggs@nvidia.com>
References: <20250702232707.175679-1-airlied@gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250702232707.175679-1-airlied@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/3/25 1:27 AM, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> This fixes a bunch of command hangs after runtime suspend/resume.
> 
> This fixes a regression caused by code movement in the commit below,
> the commit seems to just change timings enough to cause this to happen
> now, and adding the sleep seems to avoid it.
> 
> I've spent some time trying to root cause it to no great avail,
> it seems like a bug on the firmware side, but it could be a bug
> in our rpc handling that I can't find.
> 
> Either way, we should land the workaround to fix the problem,
> while we continue to work out the root cause.

I think we should add a TODO above the msleep(); what do you think would be a
good comment here?

I can add it when applying the patch if you want.

> Signed-off-by: Dave Airlie <airlied@redhat.com>
> Cc: Ben Skeggs <bskeggs@nvidia.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Fixes: 21b039715ce9 ("drm/nouveau/gsp: add hals for fbsr.suspend/resume()")
> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> index baf42339f93e..ff362a6d9f5c 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> @@ -1744,6 +1744,9 @@ r535_gsp_fini(struct nvkm_gsp *gsp, bool suspend)
>   			nvkm_gsp_sg_free(gsp->subdev.device, &gsp->sr.sgt);
>   			return ret;
>   		}
> +
> +		/* without this Turing ends up resetting all channels after resume. */
> +		msleep(50);
>   	}
>   
>   	ret = r535_gsp_rpc_unloading_guest_driver(gsp, suspend);

