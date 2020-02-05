Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0B61532D6
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 15:28:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C21D06E9B0;
	Wed,  5 Feb 2020 14:28:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5D3F76E9AD
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 14:28:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B38C31B;
 Wed,  5 Feb 2020 06:28:39 -0800 (PST)
Received: from arm.com (e112269-lin.cambridge.arm.com [10.1.195.32])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A7223F68E;
 Wed,  5 Feb 2020 06:28:37 -0800 (PST)
Date: Wed, 5 Feb 2020 14:28:33 +0000
From: Steven Price <steven.price@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 2/2] drm/panfrost: Propagate panfrost_fence_create()
 errors to the scheduler
Message-ID: <20200205142833.GA31873@arm.com>
References: <20200204143504.135388-1-boris.brezillon@collabora.com>
 <20200204143504.135388-2-boris.brezillon@collabora.com>
 <184d57ff-9193-ce08-c248-5c1de801fa6a@arm.com>
 <20200205152155.2dee52a8@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200205152155.2dee52a8@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Icecream95 <ixn@keemail.me>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <Robin.Murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 05, 2020 at 02:21:55PM +0000, Boris Brezillon wrote:
> On Wed, 5 Feb 2020 13:47:55 +0000
> Steven Price <steven.price@arm.com> wrote:
> 
> > On 04/02/2020 14:35, Boris Brezillon wrote:
> > > ->job_run() can return an ERR_PTR() if somethings fails. Let's  
> > > propagate the error returned by panfrost_fence_create() instead of
> > > returning NULL.
> > > 
> > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>  
> > 
> > In your previous posting[1] you also handled the case where
> > job->base.s_fence->finished.error is non-zero. Is there a good reason to
> > drop that?
> 
> [2] has been applied in the meantime: returning NULL now preserves
> the finished.error field.

Ah, I'd missed that - looks good.

Thanks,

Steve

> 
> > 
> > [1] https://patchwork.kernel.org/patch/11267153/
> 
> [2]https://patchwork.kernel.org/patch/11218399/
> 
> > 
> > But this change on its own stands, so:
> > 
> > Reviewed-by: Steven Price <steven.price@arm.com>
> > 
> > > ---
> > >  drivers/gpu/drm/panfrost/panfrost_job.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> > > index b0716e49eeca..242147b36d8e 100644
> > > --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> > > +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> > > @@ -349,7 +349,7 @@ static struct dma_fence *panfrost_job_run(struct drm_sched_job *sched_job)
> > >  
> > >  	fence = panfrost_fence_create(pfdev, slot);
> > >  	if (IS_ERR(fence))
> > > -		return NULL;
> > > +		return fence;
> > >  
> > >  	if (job->done_fence)
> > >  		dma_fence_put(job->done_fence);
> > >   
> > 
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
