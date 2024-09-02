Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FC59685F1
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 13:15:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E59610E298;
	Mon,  2 Sep 2024 11:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="FIWHAB+d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F9010E03C
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 11:15:17 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-42bfb50e4e6so17635075e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 04:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1725275716; x=1725880516; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fVd4vP9JIJYicWCVjUs1XJBKcH1XIzFW0QWJuYg4Ha8=;
 b=FIWHAB+dSGAGJL9We4sTzwM5x/4vv91OJyJpR7zS4JMNXeufgPwJ4Sk32yu/cxp6xq
 hv1W9M01SJJIWJnHQMuN93D6PBx1YH/tf+gNpJo95qxuF83O1DH50/iJ0KTRUehp52bI
 DMYrEZI74DTAQk7iJPibW+vnr8N/Mq/2fOIcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725275716; x=1725880516;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fVd4vP9JIJYicWCVjUs1XJBKcH1XIzFW0QWJuYg4Ha8=;
 b=j5yMcylsDrqQGcXGudKfIXp02m2hk/PJNeK8rVOmoZGd4me4H0zq8XmzmoMQMszzgB
 5zxAy5IHCueALyg8RYIce4MfMsJR26B4tZa9XqpzfMO9bzzoXwZzPxsoGNtbsmmIGtRC
 ejzwOa4zO3obkUMM6TZ6bkwnLhNsTHTWwy74eWyOcxkoRKt9N18khdAS7AwZG0AkL20Q
 pjR83toencmM3sijV+djUkXxwWlcE9ibld57NHZM+xy+Los6DxkjBKLhEOX3WMQN/fo4
 ZM7/Uu+mZHx33h+nbncMzFZ+jh82mp0P0FSqq2VOLT8q+r5knt8PEjb4a8VvAqKVwy8B
 uUKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVU77eOiKxb9l81+Bmcmi5SR6bQOq24+4YwKOh4Ikd1ObhX2x5O7vFolRsrlHd+Tu6l4ysIypqvsFE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxw/Wer9tsscQK17hx6wIpQgiMSGW+36QP2nwKTnTzyXMeVNa2Y
 yEjK8fbPE0SeOyFpVrlbeZDzVvXupkwtWR/uyc8c5JxkOhToa+zA7b7g7ugC4/o=
X-Google-Smtp-Source: AGHT+IGlzm2NeNfZUqBphsgTTnQB1lGSVh1xqm4fur/yWTD0ChITUwQQB8SlEENTvIj0CYDU0ZoP8Q==
X-Received: by 2002:a05:600c:1c12:b0:42b:afa7:801f with SMTP id
 5b1f17b1804b1-42bb27a9c91mr84929205e9.30.1725275715920; 
 Mon, 02 Sep 2024 04:15:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42c7f172be3sm50759925e9.36.2024.09.02.04.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 04:15:15 -0700 (PDT)
Date: Mon, 2 Sep 2024 13:15:13 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Philipp Stanner <pstanner@redhat.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 daniel.vetter@ffwll.ch, vitaly.prosyak@amd.com,
 dri-devel@lists.freedesktop.org, ltuikov89@gmail.com
Subject: Re: [PATCH 1/4] drm/sched: add optional errno to drm_sched_start()
Message-ID: <ZtWeQT_KToehsZ3o@phenom.ffwll.local>
References: <20240826122541.85663-1-christian.koenig@amd.com>
 <efade2855efe93dd66104d59e113b2a99ed2a8d2.camel@redhat.com>
 <9b46fa6d-37f4-4438-a2ab-c2109cb1ebd6@gmail.com>
 <7db2f831c86b3d73d99b8cf006e11a3546fa38d6.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7db2f831c86b3d73d99b8cf006e11a3546fa38d6.camel@redhat.com>
X-Operating-System: Linux phenom 6.9.12-amd64 
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

On Mon, Sep 02, 2024 at 09:01:48AM +0200, Philipp Stanner wrote:
> On Fri, 2024-08-30 at 15:15 +0200, Christian König wrote:
> > Am 28.08.24 um 11:30 schrieb Philipp Stanner:
> > > On Mon, 2024-08-26 at 14:25 +0200, Christian König wrote:
> > > > The current implementation of drm_sched_start uses a hardcoded
> > > > -ECANCELED to dispose of a job when the parent/hw fence is NULL.
> > > > This results in drm_sched_job_done being called with -ECANCELED
> > > > for
> > > > each job with a NULL parent in the pending list, making it
> > > > difficult
> > > > to distinguish between recovery methods, whether a queue reset or
> > > > a
> > > > full GPU reset was used.
> > > > 
> > > > To improve this, we first try a soft recovery for timeout jobs
> > > > and
> > > > use the error code -ENODATA. If soft recovery fails, we proceed
> > > > with
> > > > a queue reset, where the error code remains -ENODATA for the job.
> > > > Finally, for a full GPU reset, we use error codes -ECANCELED or
> > > > -ETIME. This patch adds an error code parameter to
> > > > drm_sched_start,
> > > > allowing us to differentiate between queue reset and GPU reset
> > > > failures. This enables user mode and test applications to
> > > > validate
> > > > the expected correctness of the requested operation. After a
> > > > successful queue reset, the only way to continue normal operation
> > > > is
> > > > to call drm_sched_job_done with the specific error code -ENODATA.
> > > > 
> > > > v1: Initial implementation by Jesse utilized
> > > > amdgpu_device_lock_reset_domain
> > > >      and amdgpu_device_unlock_reset_domain to allow user mode to
> > > > track
> > > >      the queue reset status and distinguish between queue reset
> > > > and
> > > >      GPU reset.
> > > > v2: Christian suggested using the error codes -ENODATA for queue
> > > > reset
> > > >      and -ECANCELED or -ETIME for GPU reset, returned to
> > > >      amdgpu_cs_wait_ioctl.
> > > > v3: To meet the requirements, we introduce a new function
> > > >      drm_sched_start_ex with an additional parameter to set
> > > >      dma_fence_set_error, allowing us to handle the specific
> > > > error
> > > >      codes appropriately and dispose of bad jobs with the
> > > > selected
> > > >      error code depending on whether it was a queue reset or GPU
> > > > reset.
> > > > v4: Alex suggested using a new name,
> > > > drm_sched_start_with_recovery_error,
> > > >      which more accurately describes the function's purpose.
> > > >      Additionally, it was recommended to add documentation
> > > > details
> > > >      about the new method.
> > > > v5: Fixed declaration of new function
> > > > drm_sched_start_with_recovery_error.(Alex)
> > > > v6 (chk): rebase on upstream changes, cleanup the commit message,
> > > >            drop the new function again and update all callers,
> > > >            apply the errno also to scheduler fences with hw
> > > > fences
> > > > 
> > > > Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> > > > Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> > > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > > ---
> > > >   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c | 2 +-
> > > >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c          | 4 ++--
> > > >   drivers/gpu/drm/etnaviv/etnaviv_sched.c             | 2 +-
> > > >   drivers/gpu/drm/imagination/pvr_queue.c             | 4 ++--
> > > >   drivers/gpu/drm/lima/lima_sched.c                   | 2 +-
> > > >   drivers/gpu/drm/nouveau/nouveau_sched.c             | 2 +-
> > > >   drivers/gpu/drm/panfrost/panfrost_job.c             | 2 +-
> > > >   drivers/gpu/drm/panthor/panthor_mmu.c               | 2 +-
> > > >   drivers/gpu/drm/scheduler/sched_main.c              | 7 ++++---
> > > >   drivers/gpu/drm/v3d/v3d_sched.c                     | 2 +-
> > > >   include/drm/gpu_scheduler.h                         | 2 +-
> > > >   11 files changed, 16 insertions(+), 15 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> > > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> > > > index 2320df51c914..18135d8235f9 100644
> > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> > > > @@ -300,7 +300,7 @@ static int
> > > > suspend_resume_compute_scheduler(struct amdgpu_device *adev, bool
> > > > sus
> > > >   			if (r)
> > > >   				goto out;
> > > >   		} else {
> > > > -			drm_sched_start(&ring->sched);
> > > > +			drm_sched_start(&ring->sched, 0);
> > > >   		}
> > > >   	}
> > > >   
> > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > > index 1cd7d355689c..5891312e44ea 100644
> > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > > @@ -5879,7 +5879,7 @@ int amdgpu_device_gpu_recover(struct
> > > > amdgpu_device *adev,
> > > >   			if (!amdgpu_ring_sched_ready(ring))
> > > >   				continue;
> > > >   
> > > > -			drm_sched_start(&ring->sched);
> > > > +			drm_sched_start(&ring->sched, 0);
> > > >   		}
> > > >   
> > > >   		if
> > > > (!drm_drv_uses_atomic_modeset(adev_to_drm(tmp_adev)) &&
> > > > !job_signaled)
> > > > @@ -6374,7 +6374,7 @@ void amdgpu_pci_resume(struct pci_dev
> > > > *pdev)
> > > >   		if (!amdgpu_ring_sched_ready(ring))
> > > >   			continue;
> > > >   
> > > > -		drm_sched_start(&ring->sched);
> > > > +		drm_sched_start(&ring->sched, 0);
> > > >   	}
> > > >   
> > > >   	amdgpu_device_unset_mp1_state(adev);
> > > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > > > b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > > > index ab9ca4824b62..23ced5896c7c 100644
> > > > --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > > > @@ -72,7 +72,7 @@ static enum drm_gpu_sched_stat
> > > > etnaviv_sched_timedout_job(struct drm_sched_job
> > > >   
> > > >   	drm_sched_resubmit_jobs(&gpu->sched);
> > > >   
> > > > -	drm_sched_start(&gpu->sched);
> > > > +	drm_sched_start(&gpu->sched, 0);
> > > >   	return DRM_GPU_SCHED_STAT_NOMINAL;
> > > >   
> > > >   out_no_timeout:
> > > > diff --git a/drivers/gpu/drm/imagination/pvr_queue.c
> > > > b/drivers/gpu/drm/imagination/pvr_queue.c
> > > > index 20cb46012082..c4f08432882b 100644
> > > > --- a/drivers/gpu/drm/imagination/pvr_queue.c
> > > > +++ b/drivers/gpu/drm/imagination/pvr_queue.c
> > > > @@ -782,7 +782,7 @@ static void pvr_queue_start(struct pvr_queue
> > > > *queue)
> > > >   		}
> > > >   	}
> > > >   
> > > > -	drm_sched_start(&queue->scheduler);
> > > > +	drm_sched_start(&queue->scheduler, 0);
> > > >   }
> > > >   
> > > >   /**
> > > > @@ -842,7 +842,7 @@ pvr_queue_timedout_job(struct drm_sched_job
> > > > *s_job)
> > > >   	}
> > > >   	mutex_unlock(&pvr_dev->queues.lock);
> > > >   
> > > > -	drm_sched_start(sched);
> > > > +	drm_sched_start(sched, 0);
> > > >   
> > > >   	return DRM_GPU_SCHED_STAT_NOMINAL;
> > > >   }
> > > > diff --git a/drivers/gpu/drm/lima/lima_sched.c
> > > > b/drivers/gpu/drm/lima/lima_sched.c
> > > > index 1a944edb6ddc..b40c90e97d7e 100644
> > > > --- a/drivers/gpu/drm/lima/lima_sched.c
> > > > +++ b/drivers/gpu/drm/lima/lima_sched.c
> > > > @@ -463,7 +463,7 @@ static enum drm_gpu_sched_stat
> > > > lima_sched_timedout_job(struct drm_sched_job *job
> > > >   	lima_pm_idle(ldev);
> > > >   
> > > >   	drm_sched_resubmit_jobs(&pipe->base);
> > > > -	drm_sched_start(&pipe->base);
> > > > +	drm_sched_start(&pipe->base, 0);
> > > >   
> > > >   	return DRM_GPU_SCHED_STAT_NOMINAL;
> > > >   }
> > > > diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c
> > > > b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > > > index eb6c3f9a01f5..4412f2711fb5 100644
> > > > --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> > > > +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > > > @@ -379,7 +379,7 @@ nouveau_sched_timedout_job(struct
> > > > drm_sched_job
> > > > *sched_job)
> > > >   	else
> > > >   		NV_PRINTK(warn, job->cli, "Generic job
> > > > timeout.\n");
> > > >   
> > > > -	drm_sched_start(sched);
> > > > +	drm_sched_start(sched, 0);
> > > >   
> > > >   	return stat;
> > > >   }
> > > > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c
> > > > b/drivers/gpu/drm/panfrost/panfrost_job.c
> > > > index df49d37d0e7e..d140800606bf 100644
> > > > --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> > > > +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> > > > @@ -727,7 +727,7 @@ panfrost_reset(struct panfrost_device *pfdev,
> > > >   
> > > >   	/* Restart the schedulers */
> > > >   	for (i = 0; i < NUM_JOB_SLOTS; i++)
> > > > -		drm_sched_start(&pfdev->js->queue[i].sched);
> > > > +		drm_sched_start(&pfdev->js->queue[i].sched, 0);
> > > >   
> > > >   	/* Re-enable job interrupts now that everything has been
> > > > restarted. */
> > > >   	job_write(pfdev, JOB_INT_MASK,
> > > > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c
> > > > b/drivers/gpu/drm/panthor/panthor_mmu.c
> > > > index d47972806d50..e630cdf47f99 100644
> > > > --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> > > > +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> > > > @@ -827,7 +827,7 @@ static void panthor_vm_stop(struct panthor_vm
> > > > *vm)
> > > >   
> > > >   static void panthor_vm_start(struct panthor_vm *vm)
> > > >   {
> > > > -	drm_sched_start(&vm->sched);
> > > > +	drm_sched_start(&vm->sched, 0);
> > > >   }
> > > >   
> > > >   /**
> > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > > index ab53ab486fe6..f093616fe53c 100644
> > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > @@ -674,9 +674,10 @@ EXPORT_SYMBOL(drm_sched_stop);
> > > >    * drm_sched_start - recover jobs after a reset
> > > >    *
> > > >    * @sched: scheduler instance
> > > > + * @errno: error to set on the pending fences
> > > >    *
> > > >    */
> > > > -void drm_sched_start(struct drm_gpu_scheduler *sched)
> > > > +void drm_sched_start(struct drm_gpu_scheduler *sched, int errno)
> > > >   {
> > > >   	struct drm_sched_job *s_job, *tmp;
> > > >   
> > > > @@ -691,13 +692,13 @@ void drm_sched_start(struct
> > > > drm_gpu_scheduler
> > > > *sched)
> > > >   		atomic_add(s_job->credits, &sched-
> > > > >credit_count);
> > > >   
> > > >   		if (!fence) {
> > > > -			drm_sched_job_done(s_job, -ECANCELED);
> > > > +			drm_sched_job_done(s_job, errno ?: -
> > > > ECANCELED);
> > > >   			continue;
> > > >   		}
> > > >   
> > > >   		if (dma_fence_add_callback(fence, &s_job->cb,
> > > >   					  
> > > > drm_sched_job_done_cb))
> > > > -			drm_sched_job_done(s_job, fence->error);
> > > > +			drm_sched_job_done(s_job, fence->error
> > > > ?:
> > > > errno);
> > > >   	}
> > > >   
> > > >   	drm_sched_start_timeout_unlocked(sched);
> > > > diff --git a/drivers/gpu/drm/v3d/v3d_sched.c
> > > > b/drivers/gpu/drm/v3d/v3d_sched.c
> > > > index fd29a00b233c..b6a89171824b 100644
> > > > --- a/drivers/gpu/drm/v3d/v3d_sched.c
> > > > +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> > > > @@ -663,7 +663,7 @@ v3d_gpu_reset_for_timeout(struct v3d_dev
> > > > *v3d,
> > > > struct drm_sched_job *sched_job)
> > > >   
> > > >   	/* Unblock schedulers and restart their jobs. */
> > > >   	for (q = 0; q < V3D_MAX_QUEUES; q++) {
> > > > -		drm_sched_start(&v3d->queue[q].sched);
> > > > +		drm_sched_start(&v3d->queue[q].sched, 0);
> > > >   	}
> > > >   
> > > >   	mutex_unlock(&v3d->reset_lock);
> > > > diff --git a/include/drm/gpu_scheduler.h
> > > > b/include/drm/gpu_scheduler.h
> > > > index fe8edb917360..a8d19b10f9b8 100644
> > > > --- a/include/drm/gpu_scheduler.h
> > > > +++ b/include/drm/gpu_scheduler.h
> > > > @@ -579,7 +579,7 @@ bool drm_sched_wqueue_ready(struct
> > > > drm_gpu_scheduler *sched);
> > > >   void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched);
> > > >   void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched);
> > > >   void drm_sched_stop(struct drm_gpu_scheduler *sched, struct
> > > > drm_sched_job *bad);
> > > > -void drm_sched_start(struct drm_gpu_scheduler *sched);
> > > > +void drm_sched_start(struct drm_gpu_scheduler *sched, int
> > > > errno);
> > > I personally only recently started using the scheduler and many
> > > things
> > > were quite confusing.
> > > 
> > > In particular, I thought it's not good to call this function
> > > drm_sched_start(), because that implies to new users / programmers
> > > that
> > > this function is supposed to start the scheduler.
> > > 
> > > Accordingly, drm_sched_stop() sounds as if it's intended to be used
> > > on
> > > scheduler teardown. "Alright, I'll stop the scheduler with
> > > drm_sched_stop(), then can safely call drm_sched_entity_destroy()
> > > and
> > > then tear it down completely through drm_sched_fini()".
> > > 
> > > Now the comments make it obvious that those start and stop
> > > functions
> > > are more intended for error recovery.
> > > 
> > > So my stance is that start should be called, e.g.,
> > > drm_sched_restart()
> > > or perhaps drm_sched_recover_start().
> > > 
> > > So since you're already touching all the lines where the function
> > > is
> > > used, this might be a good opportunity to improve the name, too.
> > > 
> > > If that's deemed desirable.
> > 
> > Yeah completely agree.
> > 
> > We also had people incorrectly thinking that they should call 
> > drm_sched_stop/start on suspend/resume resulting in a system which 
> > didn't come up again after resume.
> > 
> > How about we call it drm_sched_suspend_before_reset() and 
> > drm_sched_resume_after_reset()?
> 
> Yes, that sounds bullet-proof to me :)
> 
> One might also consider drm_sched_start()'s function summary "recover
> jobs after a reset". Maybe have a sentence about what "recover" means
> would help there, too.

Yeah, with that team drm_sched_reset_prepare/recover might also be a good
function pair. suspend/resume could be mixed up with runtime or system
suspend/resume, leading with reset feels better to me.
-Sima

> 
> 
> Regards,
> P.
> 
> 
> > 
> > Thanks,
> > Christian.
> > 
> > > 
> > > P.
> > > 
> > > 
> > > >   void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
> > > >   void drm_sched_increase_karma(struct drm_sched_job *bad);
> > > >   void drm_sched_reset_karma(struct drm_sched_job *bad);
> > 
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
