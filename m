Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D20A36DEF61
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 10:50:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A85BE10E00E;
	Wed, 12 Apr 2023 08:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2000B10E73C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 08:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681289413; x=1712825413;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sjdVDVvmBGfUrCQ/z6GYrb8bwWL/C6fbPQ7QtcEff1s=;
 b=bqBX8UA5FOGDWDdYpBkmjEtmdmNgoIyNPGpPBXS2AtH1pW+6AH4aSzJE
 Ej/pbkfqFMoOBJiRh9idPu8xIMiC8UE4Scdg9b7A+Tv9mBXsXmz/mtwX1
 Xl77DP/gErWWcBn3FUPrAJ7V8jPoblT6jL2if5BSGiY66mRG0qkDx5SwZ
 zYfBCkpVb7K8KPH074HzDY0EHOB6mxJZG+OA3bKxNuDpKDulQs5LEDB0z
 VrLNTW9yzRNGEY1YIMi1uqUqEtag6Caaey/Xzjhgi5WEOaS8gF9ivHs3r
 6AXl5XJSVbAlGFjZeWUKObbnfLyyqKy64xUhsf5CwzrVf40n+wFLqOSOw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="342596201"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; d="scan'208";a="342596201"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 01:50:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="1018670710"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; d="scan'208";a="1018670710"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 01:50:09 -0700
Date: Wed, 12 Apr 2023 10:50:07 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/2] accel/ivpu: Add dma fence to command buffers only
Message-ID: <20230412085007.GA3108596@linux.intel.com>
References: <20230331113603.2802515-1-stanislaw.gruszka@linux.intel.com>
 <20230331113603.2802515-2-stanislaw.gruszka@linux.intel.com>
 <ZC75/q34YnDDsGpB@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZC75/q34YnDDsGpB@phenom.ffwll.local>
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
Cc: Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 06, 2023 at 06:57:34PM +0200, Daniel Vetter wrote:
> On Fri, Mar 31, 2023 at 01:36:02PM +0200, Stanislaw Gruszka wrote:
> > From: Karol Wachowski <karol.wachowski@linux.intel.com>
> > 
> > Currently job->done_fence is added to every BO handle within a job. If job
> > handle (command buffer) is shared between multiple submits, KMD will add
> > the fence in each of them. Then bo_wait_ioctl() executed on command buffer
> > will exit only when all jobs containing that handle are done.
> > 
> > This creates deadlock scenario for user mode driver in case when job handle
> > is added as dependency of another job, because bo_wait_ioctl() of first job
> > will wait until second job finishes, and second job can not finish before
> > first one.
> > 
> > Having fences added only to job buffer handle allows user space to execute
> > bo_wait_ioctl() on the job even if it's handle is submitted with other job.
> > 
> > Fixes: cd7272215c44 ("accel/ivpu: Add command buffer submission logic")
> > Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> > Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> 
> Uh this is confused on a lot of levels ...
> 
> Frist having a new driver which uses the dma_resv/bo implicit fencing for
> umd synchronization is not great at all. The modern way of doing is:
> - in/out dependencies are handling with drm_syncobj
> - userspace waits on the drm_syncobj, not with a driver-private wait ioctl
>   on a specific bo

We have synobj on our TODO list, will work on it.

> The other issue is that the below starts to fall over once you do dynamic
> memory management, for that case you _always_ have to install a fence.
> 
> Now fear not, there's a solution here:
> - you always install a fence (i.e. revert this patch), but by default is a
>   DMA_RESV_USAGE_BOOKKEEP fence. See the kerneldoc for enum dma_resv_usage
>   for what that means.
> - only for the special job bo you set the DMA_RESV_USAGE_READ flag. You
>   want read because really that's what the gpu is doing for the job bo.
> - the bo_wait ioctl then waits for write access internally

In our case VPU can write to command buffer (there is special context
save area), so I think keeping USAGE_WRITE is appropriate.

> Should result in the same uapi as your patch here, but without abusing
> dma_resv in a way that'll go boom.
> 
> Note that userspace can get at the dma_resv READ/WRITE fences through
> ioctls on a dma-buf, so which one you pick here is uabi relevant.
> bo-as-job-fence is USAGE_READ.
> 
> Please take care of this in -next.

Sure.

Regards
Stanislaw
