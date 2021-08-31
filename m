Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B88E93FC7C0
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 14:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0461389C6C;
	Tue, 31 Aug 2021 12:59:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7040B89C6C
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 12:59:06 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id z4so27545744wrr.6
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 05:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GjgE1dFQ4edJ2v2xHPe4TXgqcSr49ue1mbAkTOPjv74=;
 b=ZUYsZ29QMPbBf9l6ZMTp2RIE2kWanliC4hDcCXgqRstqmgseZ0sa9W5ZCxLvGP6Xle
 SUx3I5xd2A0O540+fiR5g1scFuFE+at0mUdj6arosfSdwnfrBDyk+5oKWA0DX0J+GIBB
 5lmBzRGEaRDyhZ7Is8Nd6i2j0mkXPFAEDEfhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GjgE1dFQ4edJ2v2xHPe4TXgqcSr49ue1mbAkTOPjv74=;
 b=Ilyp+itxSzpaVqMfWcWt7e50zSB8NuEZ+16K1VXufzwyjleK0afeXgGAMVcc85sS3I
 ykBJ1CLlNw5GhfkKxe1OWBaY+nqV+Pcasqeq1l471trH2HvHHgssv6g8pQOLuQS55AyY
 d4X+qGU/xArW32LxmPdd4LgFkb2h3QyfzfWy/ZNNfe3dTGxguQBdKd1XIpi1aQ7C8drq
 q23AecJATKF2Lu6o4gfD5earBqC99NwRSQxI5yGsJek8JneZKu6BqV3Gua/xLj0+1Rof
 dMw9MJKSpOyXhwHXeXJzUp8N643v9PPmedXZPXponoyXEpFHZKYnpJGgU8DLRm/PkY4i
 J6nA==
X-Gm-Message-State: AOAM533WLNRcGIZG6z7rSj8MYP5pE9Dvu4NI7bIJfwLx/OsfBzdNtED/
 A5ukSGi9FqVR3J8UbGpIvWwuaQ==
X-Google-Smtp-Source: ABdhPJxfFSaHSLUaelLcEP0tNYSLCg+cj/6FLyt9gjCnVBmviUCT0iX/bUurdbH7SReQ9bw/ZIy/aQ==
X-Received: by 2002:a5d:456d:: with SMTP id a13mr31454642wrc.364.1630414744978; 
 Tue, 31 Aug 2021 05:59:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j207sm2665547wmj.40.2021.08.31.05.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 05:59:04 -0700 (PDT)
Date: Tue, 31 Aug 2021 14:59:02 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Monk Liu <Monk.Liu@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jingwen chen <jingwen.chen@amd.com>
Subject: Re: [PATCH 2/2] drm/sched: serialize job_timeout and scheduler
Message-ID: <YS4nlkpjeitiwFy1@phenom.ffwll.local>
References: <1630406139-19621-1-git-send-email-Monk.Liu@amd.com>
 <1630406139-19621-2-git-send-email-Monk.Liu@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1630406139-19621-2-git-send-email-Monk.Liu@amd.com>
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

Can we please have some actual commit message here, with detailed
explanation of the race/bug/whatever, how you fix it and why this is the
best option?

On Tue, Aug 31, 2021 at 06:35:39PM +0800, Monk Liu wrote:
> tested-by: jingwen chen <jingwen.chen@amd.com>
> Signed-off-by: Monk Liu <Monk.Liu@amd.com>
> Signed-off-by: jingwen chen <jingwen.chen@amd.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 24 ++++--------------------
>  1 file changed, 4 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index ecf8140..894fdb24 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -319,19 +319,17 @@ static void drm_sched_job_timedout(struct work_struct *work)
>  	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
>  
>  	/* Protects against concurrent deletion in drm_sched_get_cleanup_job */
> +	if (!__kthread_should_park(sched->thread))

This is a __ function, i.e. considered internal, and it's lockless atomic,
i.e. unordered. And you're not explaining why this works.

Iow it's probably buggy, and an just unconditionally parking the kthread
is probably the right thing to do. If it's not the right thing to do,
there's a bug here for sure.
-Daniel

> +		kthread_park(sched->thread);
> +
>  	spin_lock(&sched->job_list_lock);
>  	job = list_first_entry_or_null(&sched->pending_list,
>  				       struct drm_sched_job, list);
>  
>  	if (job) {
> -		/*
> -		 * Remove the bad job so it cannot be freed by concurrent
> -		 * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
> -		 * is parked at which point it's safe.
> -		 */
> -		list_del_init(&job->list);
>  		spin_unlock(&sched->job_list_lock);
>  
> +		/* vendor's timeout_job should call drm_sched_start() */
>  		status = job->sched->ops->timedout_job(job);
>  
>  		/*
> @@ -393,20 +391,6 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>  	kthread_park(sched->thread);
>  
>  	/*
> -	 * Reinsert back the bad job here - now it's safe as
> -	 * drm_sched_get_cleanup_job cannot race against us and release the
> -	 * bad job at this point - we parked (waited for) any in progress
> -	 * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
> -	 * now until the scheduler thread is unparked.
> -	 */
> -	if (bad && bad->sched == sched)
> -		/*
> -		 * Add at the head of the queue to reflect it was the earliest
> -		 * job extracted.
> -		 */
> -		list_add(&bad->list, &sched->pending_list);
> -
> -	/*
>  	 * Iterate the job list from later to  earlier one and either deactive
>  	 * their HW callbacks or remove them from pending list if they already
>  	 * signaled.
> -- 
> 2.7.4
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
