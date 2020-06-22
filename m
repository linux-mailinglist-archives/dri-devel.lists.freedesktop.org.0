Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1897F20340B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 11:53:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F03C6E158;
	Mon, 22 Jun 2020 09:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBFED6E158
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 09:53:50 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g21so10622879wmg.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 02:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=da/rWF6IM3WIRw4mLLFoyv/VXRRoLUiTbUT3BEQDGjQ=;
 b=DLRoIw10WsF3wfdgbiTbnguAAnKdrm5bqDxsR7uy3BtPYiGKZ2XPAYf0a7NVkgwjXI
 XxMxkCVdxS3SRO2nYyp/7LBb5VsKsBY1k/2FzLXMGQTMxakyfNapUi9Ly1QzvLFFGWdc
 ru+9eE9sMVn7wV9VPjXAsYYfZnYZNcXTqsLns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=da/rWF6IM3WIRw4mLLFoyv/VXRRoLUiTbUT3BEQDGjQ=;
 b=qowRrzfXUnbo/hwS4eb5HqKCZ9ffiNbbDJn/TmOYs6wGGBIBakjS2RCbMHd0cMofj/
 Uao+a2xCe1BTToTArVCf9bQNwjpMVsNwteIKtuPBoGUXRzsuSpNEy9zgvn64CENiWeAD
 x+rqwZcylah1I8rb2bypY/qlPvLSA4eagObCnFu6/0Dt/BLKK2zN8asRr/TWhNbc1njZ
 7ouxeicke/YMWbHEnZbKpHp/ekDVJZVoqglmWJyt0fhsrR3cTtNtbaNaMv9blkX6mpFv
 nGj1uulGgbKMsydcpC0v+9kQ6ySdpwtd9VmMiNON4qnpta0o9Y7n3UJtKIP0f3FPuBb6
 h2Eg==
X-Gm-Message-State: AOAM530RHQSj0WA+Tag1Bm1z4aegcoYxmsVxFBUJ3OeMYxfmAfjh+g/J
 nTV4001xdi5WiUpf/pE+FfHsJg==
X-Google-Smtp-Source: ABdhPJyko0GW1Oasc/DM3Rvn65NSYkyQ0GuxiVLR82w8L1ZtAM9F51O5v04YGNdG07q2LpwTPMU5AA==
X-Received: by 2002:a1c:32c4:: with SMTP id y187mr17811548wmy.79.1592819627717; 
 Mon, 22 Jun 2020 02:53:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a10sm17481942wrm.21.2020.06.22.02.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 02:53:47 -0700 (PDT)
Date: Mon, 22 Jun 2020 11:53:45 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Subject: Re: [PATCH v2 8/8] drm/amdgpu: Prevent any job recoveries after
 device is unplugged.
Message-ID: <20200622095345.GF20149@phenom.ffwll.local>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-9-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1592719388-13819-9-git-send-email-andrey.grodzovsky@amd.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, ckoenig.leichtzumerken@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 21, 2020 at 02:03:08AM -0400, Andrey Grodzovsky wrote:
> No point to try recovery if device is gone, just messes up things.
> 
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 16 ++++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c |  8 ++++++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 6932d75..5d6d3d9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -1129,12 +1129,28 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>  	return ret;
>  }
>  
> +static void amdgpu_cancel_all_tdr(struct amdgpu_device *adev)
> +{
> +	int i;
> +
> +	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
> +		struct amdgpu_ring *ring = adev->rings[i];
> +
> +		if (!ring || !ring->sched.thread)
> +			continue;
> +
> +		cancel_delayed_work_sync(&ring->sched.work_tdr);
> +	}
> +}

I think this is a function that's supposed to be in drm/scheduler, not
here. Might also just be your cleanup code being ordered wrongly, or your
split in one of the earlier patches not done quite right.
-Daniel

> +
>  static void
>  amdgpu_pci_remove(struct pci_dev *pdev)
>  {
>  	struct drm_device *dev = pci_get_drvdata(pdev);
> +	struct amdgpu_device *adev = dev->dev_private;
>  
>  	drm_dev_unplug(dev);
> +	amdgpu_cancel_all_tdr(adev);
>  	ttm_bo_unmap_virtual_address_space(&adev->mman.bdev);
>  	amdgpu_driver_unload_kms(dev);
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index 4720718..87ff0c0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -28,6 +28,8 @@
>  #include "amdgpu.h"
>  #include "amdgpu_trace.h"
>  
> +#include <drm/drm_drv.h>
> +
>  static void amdgpu_job_timedout(struct drm_sched_job *s_job)
>  {
>  	struct amdgpu_ring *ring = to_amdgpu_ring(s_job->sched);
> @@ -37,6 +39,12 @@ static void amdgpu_job_timedout(struct drm_sched_job *s_job)
>  
>  	memset(&ti, 0, sizeof(struct amdgpu_task_info));
>  
> +	if (drm_dev_is_unplugged(adev->ddev)) {
> +		DRM_INFO("ring %s timeout, but device unplugged, skipping.\n",
> +					  s_job->sched->name);
> +		return;
> +	}
> +
>  	if (amdgpu_ring_soft_recovery(ring, job->vmid, s_job->s_fence->parent)) {
>  		DRM_ERROR("ring %s timeout, but soft recovered\n",
>  			  s_job->sched->name);
> -- 
> 2.7.4
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
