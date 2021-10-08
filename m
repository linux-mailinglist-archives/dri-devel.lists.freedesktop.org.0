Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 587404264CA
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 08:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB31D6E0A2;
	Fri,  8 Oct 2021 06:43:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142FB6E0A2
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Oct 2021 06:43:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="207257647"
X-IronPort-AV: E=Sophos;i="5.85,356,1624345200"; d="scan'208";a="207257647"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 23:43:19 -0700
X-IronPort-AV: E=Sophos;i="5.85,356,1624345200"; d="scan'208";a="713634192"
Received: from lenovo-x280.ger.corp.intel.com (HELO [10.249.254.98])
 ([10.249.254.98])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 23:43:18 -0700
Message-ID: <571f25bb979922f84c12cd0e98ab5870c9f63448.camel@linux.intel.com>
Subject: Re: [RFC PATCH 1/2] drm/amdgpu: Move dma_resv waiting outside the
 notifier lock
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 dri-devel@lists.freedesktop.org
Date: Fri, 08 Oct 2021 08:43:16 +0200
In-Reply-To: <d56974c3-c887-2086-5e7f-ba46a7f82319@amd.com>
References: <20211007132630.495184-1-thomas.hellstrom@linux.intel.com>
 <20211007132630.495184-2-thomas.hellstrom@linux.intel.com>
 <d56974c3-c887-2086-5e7f-ba46a7f82319@amd.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Christian,

On Thu, 2021-10-07 at 16:57 +0200, Christian König wrote:
> Am 07.10.21 um 15:26 schrieb Thomas Hellström:
> > While the range notifier is executing, we have the write-side mmu
> > interval
> > seqlock, and mmu_interval_read_retry() is always returning true,
> > which means that if amdgpu_cs_submit grabs the notifier lock during
> > the
> > fence wait, it will retry anyway when checking the userptr validity
> > and block when retrying in mmu_interval_read_begin().
> > (See the extensive comments in mmu_interval_read_begin())
> > 
> > Hence we can release the notifier lock before the fence wait and
> > avoid
> > a device-wide command submission block during invalidation.
> 
> First of all I'm not convinced that this works and second blocking
> the 
> CS while an MMU invalidation is underway is completely intentional.
> 
> In other words when for example fork() is called in parallel with a
> CS 
> the CS should be blocked until the invalidation caused by the fork() 
> operation is completed and *NOT* risk that the CS succeeds and adds 
> another dependency to the MMU invalidation.

The point is that command submission can't succeed since while the
notifer runs, we have the write-side seqlock. It's released when the
notifier ends, and we can rely on that. The following will happen:

Thread1              		Thread 2

enter_cs();          		enter_invalidation();
		     		notifier_lock()
	             		update_seqno();
                     		notifier_unlock();
notifier_lock();     		fence_wait();
validate_userptr();
(invalid_seqno)
notifier_unlock();
(retry)
mmu_interval_read_begin();
(blocks)
				fence_signal();
				(notifier ends)
				mn_itree_inv_end();
(unblocks, new seqno);
enter_cs();
(succeeds)

So the difference is that you block only CS that affect that particular
userptr, not CS across the entire device.

So for the sake of discussion, is there a particular situation where
you see a race that might happen here?

Thanks,
Thomas


> 
> Christian.
> 
> > 
> > Cc: Christian König <christian.koenig@amd.com>
> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
> > index 4b153daf283d..d3d340a6129c 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
> > @@ -75,9 +75,10 @@ static bool amdgpu_mn_invalidate_gfx(struct
> > mmu_interval_notifier *mni,
> >   
> >         mmu_interval_set_seq(mni, cur_seq);
> >   
> > +       mutex_unlock(&adev->notifier_lock);
> > +
> >         r = dma_resv_wait_timeout(bo->tbo.base.resv, true, false,
> >                                   MAX_SCHEDULE_TIMEOUT);
> > -       mutex_unlock(&adev->notifier_lock);
> >         if (r <= 0)
> >                 DRM_ERROR("(%ld) failed to wait for user bo\n", r);
> >         return true;
> 


