Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 105659B64D4
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 14:54:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A001010E7AE;
	Wed, 30 Oct 2024 13:54:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3586C10E7AD
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 13:53:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 536FF11FB
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 06:54:29 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5E5943F7A6
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 06:53:59 -0700 (PDT)
Date: Wed, 30 Oct 2024 13:53:54 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 Christopher Healy <healych@amazon.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v3 3/3] drm/panthor: Report innocent group kill
Message-ID: <ZyI6csWDbv2oqYwE@e110455-lin.cambridge.arm.com>
References: <20241029152912.270346-1-boris.brezillon@collabora.com>
 <20241029152912.270346-4-boris.brezillon@collabora.com>
 <20241029171933.51a0e328@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241029171933.51a0e328@collabora.com>
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

On Tue, Oct 29, 2024 at 05:19:33PM +0100, Boris Brezillon wrote:
> On Tue, 29 Oct 2024 16:29:12 +0100
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> 
> > Groups can be killed during a reset even though they did nothing wrong.
> > That usually happens when the FW is put in a bad state by other groups,
> > resulting in group suspension failures when the reset happens.
> > 
> > If we end up in that situation, flag the group innocent and report
> > innocence through a new DRM_PANTHOR_GROUP_STATE flag.
> > 
> > Bump the minor driver version to reflect the uAPI change.
> > 
> > Changes in v3:
> > - Actually report innocence to userspace
> > 
> > Changes in v2:
> > - New patch
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >  drivers/gpu/drm/panthor/panthor_drv.c   |  2 +-
> >  drivers/gpu/drm/panthor/panthor_sched.c | 18 ++++++++++++++++++
> >  include/uapi/drm/panthor_drm.h          |  9 +++++++++
> >  3 files changed, 28 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> > index ac7e53f6e3f0..f1dff7e0173d 100644
> > --- a/drivers/gpu/drm/panthor/panthor_drv.c
> > +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> 
> Forgot to update the changelog with:
> 
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1493,6 +1493,7 @@ static void panthor_debugfs_init(struct drm_minor
> *minor)
>   * - 1.1 - adds DEV_QUERY_TIMESTAMP_INFO query
>   * - 1.2 - adds DEV_QUERY_GROUP_PRIORITIES_INFO query
>   *       - adds PANTHOR_GROUP_PRIORITY_REALTIME priority
> + * - 1.3 - adds DRM_PANTHOR_GROUP_STATE_INNOCENT flag
>   */
> 
> I'll send a v4 addressing that, but I'll probably queue the first two
> patches to drm-misc-fixes first.

You can also add my R-b and push the whole series.

Best regards,
Liviu

> 
> > @@ -1507,7 +1507,7 @@ static const struct drm_driver panthor_drm_driver = {
> >  	.desc = "Panthor DRM driver",
> >  	.date = "20230801",
> >  	.major = 1,
> > -	.minor = 2,
> > +	.minor = 3,
> >  
> >  	.gem_create_object = panthor_gem_create_object,
> >  	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
> > diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> > index ef4bec7ff9c7..97ed5fe5a191 100644
> > --- a/drivers/gpu/drm/panthor/panthor_sched.c
> > +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> > @@ -610,6 +610,16 @@ struct panthor_group {
> >  	 */
> >  	bool timedout;
> >  
> > +	/**
> > +	 * @innocent: True when the group becomes unusable because the group suspension
> > +	 * failed during a reset.
> > +	 *
> > +	 * Sometimes the FW was put in a bad state by other groups, causing the group
> > +	 * suspension happening in the reset path to fail. In that case, we consider the
> > +	 * group innocent.
> > +	 */
> > +	bool innocent;
> > +
> >  	/**
> >  	 * @syncobjs: Pool of per-queue synchronization objects.
> >  	 *
> > @@ -2690,6 +2700,12 @@ void panthor_sched_suspend(struct panthor_device *ptdev)
> >  			u32 csg_id = ffs(slot_mask) - 1;
> >  			struct panthor_csg_slot *csg_slot = &sched->csg_slots[csg_id];
> >  
> > +			/* If the group was still usable before that point, we consider
> > +			 * it innocent.
> > +			 */
> > +			if (group_can_run(csg_slot->group))
> > +				csg_slot->group->innocent = true;
> > +
> >  			/* We consider group suspension failures as fatal and flag the
> >  			 * group as unusable by setting timedout=true.
> >  			 */
> > @@ -3570,6 +3586,8 @@ int panthor_group_get_state(struct panthor_file *pfile,
> >  		get_state->state |= DRM_PANTHOR_GROUP_STATE_FATAL_FAULT;
> >  		get_state->fatal_queues = group->fatal_queues;
> >  	}
> > +	if (group->innocent)
> > +		get_state->state |= DRM_PANTHOR_GROUP_STATE_INNOCENT;
> >  	mutex_unlock(&sched->lock);
> >  
> >  	group_put(group);
> > diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> > index 87c9cb555dd1..b99763cbae48 100644
> > --- a/include/uapi/drm/panthor_drm.h
> > +++ b/include/uapi/drm/panthor_drm.h
> > @@ -923,6 +923,15 @@ enum drm_panthor_group_state_flags {
> >  	 * When a group ends up with this flag set, no jobs can be submitted to its queues.
> >  	 */
> >  	DRM_PANTHOR_GROUP_STATE_FATAL_FAULT = 1 << 1,
> > +
> > +	/**
> > +	 * @DRM_PANTHOR_GROUP_STATE_INNOCENT: Group was killed during a reset caused by other
> > +	 * groups.
> > +	 *
> > +	 * This flag can only be set if DRM_PANTHOR_GROUP_STATE_TIMEDOUT is set and
> > +	 * DRM_PANTHOR_GROUP_STATE_FATAL_FAULT is not.
> > +	 */
> > +	DRM_PANTHOR_GROUP_STATE_INNOCENT = 1 << 2,
> >  };
> >  
> >  /**
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
