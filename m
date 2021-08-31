Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 990003FC951
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 16:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22CA889FC3;
	Tue, 31 Aug 2021 14:03:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00CE189BAE
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 14:03:36 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id u9so27867368wrg.8
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 07:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=06uLh/LerTKW7N9aJQacbCqa4SbGSUiczdfVSnFq9TY=;
 b=Nd09bB+nM8FXA3XLER9R/+vOHKkE7PjGgnYuzIutdoP5O+mLst5Swc8PgMBfAdiMLl
 QicgYDiZCj0DvNq08gTuMfxc0QuzGJjcu1PQIBp9nlHksg5cPDQ1qCXWoFYtO44c6JAN
 +vBJAsGANtbHdwS1lcufbETsr32v8h+QzhSh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=06uLh/LerTKW7N9aJQacbCqa4SbGSUiczdfVSnFq9TY=;
 b=SwHQkWS7fYiCoYQheBOOB3tBdco5a5bA+2av9qPq39H3AKYit+sA2UjIdOXUGxAnGf
 5igs/YlA0WQz716kjysyYZ52DAa8iM1Lh9noh2dlSa3CjYfILuUnXBOzuONWxHFu0UNz
 ohDY06StQVN6ZZrKYiCPy1UkvnN8vZz1vq+s1LZANIfn9JEXH6/bLhZwN0kTAO1jOMck
 itS0g5FFTOMrV24o9FLWFDgQ9VyBX0Cx0HNWcU8US5GLcVR483rgnIcPai0f+lxvvJ6J
 +VXzNUDQg+sBEHdIAtIrlkWSS8+uJRE8ZKPPyBTNZXfmkp7xcCd6uDa7wWJxBdPq7+yU
 3lNA==
X-Gm-Message-State: AOAM5306TA0vmc19Ay7r9+b5QmUenbmJfqFZuOva9EtamZ09k2ZjjW2m
 KDZWyoGBrb1zKEnVTBcYLcQWoA==
X-Google-Smtp-Source: ABdhPJxzF0VkWonK+Ia276V1pqC0u0sROiCA57523MvRBQ5CfkRFsFluMm9/lPhJPHvBLxSaYKTYbQ==
X-Received: by 2002:adf:eb02:: with SMTP id s2mr31564197wrn.294.1630418615584; 
 Tue, 31 Aug 2021 07:03:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h16sm18537538wre.52.2021.08.31.07.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 07:03:34 -0700 (PDT)
Date: Tue, 31 Aug 2021 16:03:32 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Cc: Monk Liu <Monk.Liu@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, jingwen chen <jingwen.chen@amd.com>
Subject: Re: [PATCH 2/2] drm/sched: serialize job_timeout and scheduler
Message-ID: <YS42tI6qAUb3yqOk@phenom.ffwll.local>
References: <1630406139-19621-1-git-send-email-Monk.Liu@amd.com>
 <1630406139-19621-2-git-send-email-Monk.Liu@amd.com>
 <29be989b-c2a5-69b3-f0b8-2df52f50047f@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <29be989b-c2a5-69b3-f0b8-2df52f50047f@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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

On Tue, Aug 31, 2021 at 09:53:36AM -0400, Andrey Grodzovsky wrote:
> It's says patch [2/2] but i can't find patch 1
> 
> On 2021-08-31 6:35 a.m., Monk Liu wrote:
> > tested-by: jingwen chen <jingwen.chen@amd.com>
> > Signed-off-by: Monk Liu <Monk.Liu@amd.com>
> > Signed-off-by: jingwen chen <jingwen.chen@amd.com>
> > ---
> >   drivers/gpu/drm/scheduler/sched_main.c | 24 ++++--------------------
> >   1 file changed, 4 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index ecf8140..894fdb24 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -319,19 +319,17 @@ static void drm_sched_job_timedout(struct work_struct *work)
> >   	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
> >   	/* Protects against concurrent deletion in drm_sched_get_cleanup_job */
> > +	if (!__kthread_should_park(sched->thread))
> > +		kthread_park(sched->thread);
> > +
> 
> 
> As mentioned before, without serializing against other TDR handlers from
> other
> schedulers you just race here against them, e.g. you parked it now but
> another
> one in progress will unpark it as part of calling  drm_sched_start for other
> rings[1]
> Unless I am missing something since I haven't found patch [1/2]
> 
> [1] - https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c#L5041

You need to have your own wq and run all your tdr work on the same wq if
your reset has any cross-engine impact.

See

https://dri.freedesktop.org/docs/drm/gpu/drm-mm.html#c.drm_sched_backend_ops

for the ->timeout_job callback docs. I thought I brought this up already?
-Daniel

> 
> Andrey
> 
> 
> >   	spin_lock(&sched->job_list_lock);
> >   	job = list_first_entry_or_null(&sched->pending_list,
> >   				       struct drm_sched_job, list);
> >   	if (job) {
> > -		/*
> > -		 * Remove the bad job so it cannot be freed by concurrent
> > -		 * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
> > -		 * is parked at which point it's safe.
> > -		 */
> > -		list_del_init(&job->list);
> >   		spin_unlock(&sched->job_list_lock);
> > +		/* vendor's timeout_job should call drm_sched_start() */
> >   		status = job->sched->ops->timedout_job(job);
> >   		/*
> > @@ -393,20 +391,6 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
> >   	kthread_park(sched->thread);
> >   	/*
> > -	 * Reinsert back the bad job here - now it's safe as
> > -	 * drm_sched_get_cleanup_job cannot race against us and release the
> > -	 * bad job at this point - we parked (waited for) any in progress
> > -	 * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
> > -	 * now until the scheduler thread is unparked.
> > -	 */
> > -	if (bad && bad->sched == sched)
> > -		/*
> > -		 * Add at the head of the queue to reflect it was the earliest
> > -		 * job extracted.
> > -		 */
> > -		list_add(&bad->list, &sched->pending_list);
> > -
> > -	/*
> >   	 * Iterate the job list from later to  earlier one and either deactive
> >   	 * their HW callbacks or remove them from pending list if they already
> >   	 * signaled.

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
