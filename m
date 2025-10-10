Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1BFBCE56A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 21:15:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF11C10EC7C;
	Fri, 10 Oct 2025 19:15:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.b="pAzpKwey";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 362 seconds by postgrey-1.36 at gabe;
 Fri, 10 Oct 2025 19:15:47 UTC
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com
 [95.215.58.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA89A10EC7E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 19:15:47 +0000 (UTC)
Message-ID: <39a7f9a7-b97c-4851-9a00-ab926967d7c8@postmarketos.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
 s=key1; t=1760123383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5diY5uCD/YJY9STm/+KyjBx0wU7pxgCFd8nIteFoVMY=;
 b=pAzpKweyoRoyM4yCIeWDl+NK4p7K4nEciI1EWaopPgazh1rJOMj3tIk+Mt+fORGTErLvwn
 g+GQIRULpCJfAj5DSygRokNrSZa4dUsoGxDmH5CqtiRRdAcgLhts8VnedT0Cl8v0Ul5Z1+
 w6rZ0ylVguxwCo6hDvvV1pz5LW+SW3dDRLtO4L2PpTdTcd56AIQPSHGh/fPVBklxxjrcQa
 uBBEsqxXLzoShWQ0uBbsrPQYqXceDeIwxewVE5LebOOlMvRYK49ioAOo8GQ2f8Dy+utGkE
 gaDsJMxDJ3+Be4P/kwozftD9wUKm7VVOvZsurer5/B/AMnOCE0CMScEEPQJP/g==
Date: Fri, 10 Oct 2025 22:09:38 +0300
MIME-Version: 1.0
Subject: Re: [PATCH v2] drm/msm: make sure last_fence is always updated
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251010-close_fence_wait_fix-v2-1-adb332dbff65@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Alexey Minnekhanov <alexeymin@postmarketos.org>
In-Reply-To: <20251010-close_fence_wait_fix-v2-1-adb332dbff65@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

On 10.10.2025 17:39, Anna Maniscalco wrote:
> Update last_fence in the vm-bind path instead of kernel managed path.
> 
> last_fence is used to wait for work to finish in vm_bind contexts but not
> used for kernel managed contexts.
> 
> This fixes a bug where last_fence is not waited on context close leading
> to faults as resources are freed while in use.
> 
> Fixes: 92395af63a99 ("drm/msm: Add VM_BIND submitqueue")
> ---
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---
> Changes in v2:
> - Only update last_fence on vm_bind path
> - Link to v1: https://lore.kernel.org/r/20251010-close_fence_wait_fix-v1-1-fd3e394dcadd@gmail.com
> ---
>   drivers/gpu/drm/msm/msm_gem_submit.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 3ab3b27134f93b01236fec5833a18a6e2ad2cf5e..75d9f357437006ff261db148901e176eae670d41 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -414,6 +414,11 @@ static void submit_attach_object_fences(struct msm_gem_submit *submit)
>   					 submit->user_fence,
>   					 DMA_RESV_USAGE_BOOKKEEP,
>   					 DMA_RESV_USAGE_BOOKKEEP);
> +
> +		last_fence = vm->last_fence;
> +		vm->last_fence = dma_fence_unwrap_merge(submit->user_fence, last_fence);
> +		dma_fence_put(last_fence);
> +
>   		return;
>   	}
>   
> @@ -427,10 +432,6 @@ static void submit_attach_object_fences(struct msm_gem_submit *submit)
>   			dma_resv_add_fence(obj->resv, submit->user_fence,
>   					   DMA_RESV_USAGE_READ);
>   	}
> -
> -	last_fence = vm->last_fence;
> -	vm->last_fence = dma_fence_unwrap_merge(submit->user_fence, last_fence);
> -	dma_fence_put(last_fence);
>   }
>   
>   static int submit_bo(struct msm_gem_submit *submit, uint32_t idx,
> 
> ---
> base-commit: b5bad77e1e3c7249e4c0c88f98477e1ee7669b63
> change-id: 20251009-close_fence_wait_fix-00e1c2521eee
> 
> Best regards,

Hi!

Since 6.17 I'm seeing gpu faults that were not present in 6.16, they
look like [1].

I was hoping this patch can fix it, because faults go away if I comment
out put_iova_spaces() inside msm_gem_close(), and this patch mentions
close path and faults together, ... but no. Perhaps something else is
wrong somewhere?

[1] https://paste.sr.ht/~minlexx/09a9b3d4bfff3e7be3e96cd88fe8cf34621cb655

--
Regards,
Alexey Minnekhanov

