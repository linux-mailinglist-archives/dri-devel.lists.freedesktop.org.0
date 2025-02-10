Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5A9A2F294
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 17:08:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C705B10E1CC;
	Mon, 10 Feb 2025 16:08:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="fuUahoBE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FAB710E1CC
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 16:08:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1739203712; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=P2gY5tl3uLkatbuI6+rEwk1wrEoYl/sH+zxT21GTnwJ7oR8ojQd8Z7boyp7hxELkoPpzKy8XE7UO25t9sykei4rIVzkvr/moylmsCHX3fd6ZEHMq5plMB7UIQMporz4kxKIw8BchQblBOq7RgD+uKXJn2K2GxkaHxFupWCHkdso=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1739203712;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=+ob1WuK6xNBwD3y6k/heRw1f5sBx51V2zEStLR7x4Vc=; 
 b=n9ofU8b98Fzc7tL19FwICapAJAP0AbC54wsuBUi4/6tFAqLLp298j02PBSrkj5mSkvQxt7XBVc27VHcJShAHvWbVnjjEZp6jdYFpiUe4EO+W7lu34zVQymcV/33OmprHAsl9/9bvOx7R3N/UWRQ0aaBQKCCVw/tMHX7Ag0olKK8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739203712; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=+ob1WuK6xNBwD3y6k/heRw1f5sBx51V2zEStLR7x4Vc=;
 b=fuUahoBEzWnJqq+Vl0QTwhYm74g89FW4u6CX4mcsO3e6lGYo2sRetOR9/AVSl003
 79Qt+kDMZcTxaCg9K4X5rGz43UVIyfi0UDilR9ybvbnPolCHPnPTpNuslyMr9aLZhA8
 1CUkazzQtknrHRglQOWkHASho+kxNFvn21FB0crU=
Received: by mx.zohomail.com with SMTPS id 1739203709782958.0465672894181;
 Mon, 10 Feb 2025 08:08:29 -0800 (PST)
Date: Mon, 10 Feb 2025 16:08:26 +0000
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/panthor: Replace sleep locks with spinlocks in
 fdinfo path
Message-ID: <ddnsckbpr2fcxby4i2o5xyrt3pdhornzbrvlbivuvzlyhgg66q@ejhkiz33sewn>
References: <20250210124203.124191-1-adrian.larumbe@collabora.com>
 <2ec2a848-90f4-49bc-aaaf-8eb256f271db@ursulin.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2ec2a848-90f4-49bc-aaaf-8eb256f271db@ursulin.net>
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

Hi Tvrtko,

[18153.770244] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:562
[18153.771059] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 203412, name: cat
[18153.771757] preempt_count: 1, expected: 0
[18153.772164] RCU nest depth: 0, expected: 0
[18153.772538] INFO: lockdep is turned off.
[18153.772898] CPU: 4 UID: 0 PID: 203412 Comm: cat Tainted: G        W          6.14.0-rc1-panthor-next-rk3588-fdinfo+ #1
[18153.772906] Tainted: [W]=WARN
[18153.772908] Hardware name: Radxa ROCK 5B (DT)
[18153.772911] Call trace:
[18153.772913]  show_stack+0x24/0x38 (C)
[18153.772927]  dump_stack_lvl+0x3c/0x98
[18153.772935]  dump_stack+0x18/0x24
[18153.772941]  __might_resched+0x298/0x2b0
[18153.772948]  __might_sleep+0x6c/0xb0
[18153.772953]  __mutex_lock_common+0x7c/0x1950
[18153.772962]  mutex_lock_nested+0x38/0x50
[18153.772969]  panthor_fdinfo_gather_group_samples+0x80/0x138 [panthor]
[18153.773042]  panthor_show_fdinfo+0x80/0x228 [panthor]
[18153.773109]  drm_show_fdinfo+0x1a4/0x1e0 [drm]
[18153.773397]  seq_show+0x274/0x358
[18153.773404]  seq_read_iter+0x1d4/0x630
[18153.773411]  seq_read+0x148/0x1a0
[18153.773416]  vfs_read+0x114/0x3e0
[18153.773423]  ksys_read+0x90/0x110
[18153.773429]  __arm64_sys_read+0x50/0x70
[18153.773435]  invoke_syscall+0x60/0x178
[18153.773442]  el0_svc_common+0x104/0x148
[18153.773447]  do_el0_svc+0x3c/0x58
[18153.773453]  el0_svc+0x50/0xa8
[18153.773459]  el0t_64_sync_handler+0x78/0x108
[18153.773465]  el0t_64_sync+0x198/0x1a0


On 10.02.2025 15:52, Tvrtko Ursulin wrote:
> On 10/02/2025 12:41, Adrián Larumbe wrote:
> > Panthor's fdinfo handler is routed through the /proc file system, which
> > executes in an atomic context. That means we cannot use mutexes because
> > they might sleep.
> 
> Have the debug splat at hand? I am thinking it is not because of fdinfo reads,
> which are allowed to sleep, but has to be something else.
> 
> Regards,
> 
> Tvrtko
> 
> > This bug was uncovered by enabling some of the kernel's mutex-debugging
> > features:
> > 
> > CONFIG_DEBUG_RT_MUTEXES=y
> > CONFIG_DEBUG_MUTEXES=y
> > 
> > Replace Panthor's group fdinfo data mutex with a guarded spinlock.
> > 
> > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> > Fixes: e16635d88fa0 ("drm/panthor: add DRM fdinfo support")
> > ---
> >   drivers/gpu/drm/panthor/panthor_sched.c | 26 ++++++++++++-------------
> >   1 file changed, 12 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> > index 0b93bf83a9b2..7a267d1efeb6 100644
> > --- a/drivers/gpu/drm/panthor/panthor_sched.c
> > +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> > @@ -9,6 +9,7 @@
> >   #include <drm/panthor_drm.h>
> >   #include <linux/build_bug.h>
> > +#include <linux/cleanup.h>
> >   #include <linux/clk.h>
> >   #include <linux/delay.h>
> >   #include <linux/dma-mapping.h>
> > @@ -631,10 +632,10 @@ struct panthor_group {
> >   		struct panthor_gpu_usage data;
> >   		/**
> > -		 * @lock: Mutex to govern concurrent access from drm file's fdinfo callback
> > -		 * and job post-completion processing function
> > +		 * @fdinfo.lock: Spinlock to govern concurrent access from drm file's fdinfo
> > +		 * callback and job post-completion processing function
> >   		 */
> > -		struct mutex lock;
> > +		spinlock_t lock;
> >   		/** @fdinfo.kbo_sizes: Aggregate size of private kernel BO's held by the group. */
> >   		size_t kbo_sizes;
> > @@ -910,8 +911,6 @@ static void group_release_work(struct work_struct *work)
> >   						   release_work);
> >   	u32 i;
> > -	mutex_destroy(&group->fdinfo.lock);
> > -
> >   	for (i = 0; i < group->queue_count; i++)
> >   		group_free_queue(group, group->queues[i]);
> > @@ -2861,12 +2860,12 @@ static void update_fdinfo_stats(struct panthor_job *job)
> >   	struct panthor_job_profiling_data *slots = queue->profiling.slots->kmap;
> >   	struct panthor_job_profiling_data *data = &slots[job->profiling.slot];
> > -	mutex_lock(&group->fdinfo.lock);
> > -	if (job->profiling.mask & PANTHOR_DEVICE_PROFILING_CYCLES)
> > -		fdinfo->cycles += data->cycles.after - data->cycles.before;
> > -	if (job->profiling.mask & PANTHOR_DEVICE_PROFILING_TIMESTAMP)
> > -		fdinfo->time += data->time.after - data->time.before;
> > -	mutex_unlock(&group->fdinfo.lock);
> > +	scoped_guard(spinlock, &group->fdinfo.lock) {
> > +		if (job->profiling.mask & PANTHOR_DEVICE_PROFILING_CYCLES)
> > +			fdinfo->cycles += data->cycles.after - data->cycles.before;
> > +		if (job->profiling.mask & PANTHOR_DEVICE_PROFILING_TIMESTAMP)
> > +			fdinfo->time += data->time.after - data->time.before;
> > +	}
> >   }
> >   void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile)
> > @@ -2880,12 +2879,11 @@ void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile)
> >   	xa_lock(&gpool->xa);
> >   	xa_for_each(&gpool->xa, i, group) {
> > -		mutex_lock(&group->fdinfo.lock);
> > +		guard(spinlock)(&group->fdinfo.lock);
> >   		pfile->stats.cycles += group->fdinfo.data.cycles;
> >   		pfile->stats.time += group->fdinfo.data.time;
> >   		group->fdinfo.data.cycles = 0;
> >   		group->fdinfo.data.time = 0;
> > -		mutex_unlock(&group->fdinfo.lock);
> >   	}
> >   	xa_unlock(&gpool->xa);
> >   }
> > @@ -3531,7 +3529,7 @@ int panthor_group_create(struct panthor_file *pfile,
> >   	mutex_unlock(&sched->reset.lock);
> >   	add_group_kbo_sizes(group->ptdev, group);
> > -	mutex_init(&group->fdinfo.lock);
> > +	spin_lock_init(&group->fdinfo.lock);
> >   	return gid;
> > 
> > base-commit: 2eca617f12586abff62038db1c14cb3aa60a15aa
> > prerequisite-patch-id: 7e787ce5973b5fc7e9f69f26aa4d7e5ec03d5caa
> > prerequisite-patch-id: 03a619b8c741444b28435850e23d9ec463171c13
> > prerequisite-patch-id: 290e1053f8bf4a8b80fb037a87cae7e096b5aa96
> > prerequisite-patch-id: bc49bb8c29905650fb4788acc528bb44013c0240
> > prerequisite-patch-id: 46cab4c980824c03e5164afc43085fec23e1cba5
