Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4524E3FC9EB
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 16:38:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 021146E0AC;
	Tue, 31 Aug 2021 14:38:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 058316E0A5
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 14:38:17 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 d22-20020a1c1d16000000b002e7777970f0so2310624wmd.3
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 07:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=7mKGUzoUi2LxYEDg/PxTc7r5h0wMohxhEpd5mwYT0mQ=;
 b=fxjhVJ3qz13kN0Q+u53Grm3DC75EMQBCFRLDdyFk56ygZ9kJTUWj9gCHy+OFyEsEgC
 Xw0lqBJrwutofFJk4YhtL35uCfQWO0eeD8CmEQOeUI4axsAMtnT9qxEPF058JR5d763F
 8cScmbhfgyJQcfJM66NbLp5qBZTlH/39w8nFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=7mKGUzoUi2LxYEDg/PxTc7r5h0wMohxhEpd5mwYT0mQ=;
 b=eO3tbrOjophFTPEmKZGgT+NUQaJzT3Rh3nAQMGeGYQmUpbJ4aQwcUpVtbjmLrEKvIK
 ip6KAlSeNOAbHEUsO3iTb4E7p5xxQLXlT7HVqU13GsUr4tjR50LXIvAzYkfzKsILMZQC
 o7SJvTg3OiIYIC4vNeGC4mQMenZxwkTvHlIYD0MtEvuzvj3FskdF0b+1e4OI2zlaCqQk
 kIcHg7GO6ZYKA51axD34J/xXii5MneDrAN+51+D7R/NivadjlYTZ3dRrU58VLPWLxUui
 ZhiWs3QO51+BafGwGf7bvlBm9R4LfYOqGT2+pzF0p0MmqGjJDN239h0YynOvjrTRMyR/
 KSFA==
X-Gm-Message-State: AOAM530QDU/qPS8T9hn7juKjceRiv+VTbijRQjS79vtWDcD8fb94ae+x
 sIyDbmk3ml8uywzksritd7uMlOe/t3kaQA==
X-Google-Smtp-Source: ABdhPJxf5R+5x/hbVsBu0B3G0FnfwTpdLRgNeNOf3ZmF97J2xM3h9bHZy/snsr4GPEF9OutJcJCmXw==
X-Received: by 2002:a05:600c:3591:: with SMTP id
 p17mr4739990wmq.134.1630420695471; 
 Tue, 31 Aug 2021 07:38:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 129sm2629935wmz.26.2021.08.31.07.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 07:38:14 -0700 (PDT)
Date: Tue, 31 Aug 2021 16:38:13 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Monk Liu <Monk.Liu@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jingwen chen <jingwen.chen@amd.com>
Subject: Re: [PATCH 2/2] drm/sched: serialize job_timeout and scheduler
Message-ID: <YS4+1evCjyCA50iP@phenom.ffwll.local>
References: <1630406139-19621-1-git-send-email-Monk.Liu@amd.com>
 <1630406139-19621-2-git-send-email-Monk.Liu@amd.com>
 <29be989b-c2a5-69b3-f0b8-2df52f50047f@amd.com>
 <YS42tI6qAUb3yqOk@phenom.ffwll.local>
 <11d6acb1-ce9f-372e-3993-232379436e4b@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <11d6acb1-ce9f-372e-3993-232379436e4b@amd.com>
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

On Tue, Aug 31, 2021 at 10:20:40AM -0400, Andrey Grodzovsky wrote:
> 
> On 2021-08-31 10:03 a.m., Daniel Vetter wrote:
> > On Tue, Aug 31, 2021 at 09:53:36AM -0400, Andrey Grodzovsky wrote:
> > > It's says patch [2/2] but i can't find patch 1
> > > 
> > > On 2021-08-31 6:35 a.m., Monk Liu wrote:
> > > > tested-by: jingwen chen <jingwen.chen@amd.com>
> > > > Signed-off-by: Monk Liu <Monk.Liu@amd.com>
> > > > Signed-off-by: jingwen chen <jingwen.chen@amd.com>
> > > > ---
> > > >    drivers/gpu/drm/scheduler/sched_main.c | 24 ++++--------------------
> > > >    1 file changed, 4 insertions(+), 20 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > > > index ecf8140..894fdb24 100644
> > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > @@ -319,19 +319,17 @@ static void drm_sched_job_timedout(struct work_struct *work)
> > > >    	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
> > > >    	/* Protects against concurrent deletion in drm_sched_get_cleanup_job */
> > > > +	if (!__kthread_should_park(sched->thread))
> > > > +		kthread_park(sched->thread);
> > > > +
> > > 
> > > As mentioned before, without serializing against other TDR handlers from
> > > other
> > > schedulers you just race here against them, e.g. you parked it now but
> > > another
> > > one in progress will unpark it as part of calling  drm_sched_start for other
> > > rings[1]
> > > Unless I am missing something since I haven't found patch [1/2]
> > > 
> > > [1] - https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Flatest%2Fsource%2Fdrivers%2Fgpu%2Fdrm%2Famd%2Famdgpu%2Famdgpu_device.c%23L5041&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7Cc697c75898664f678f4b08d96c8820e7%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637660154199259544%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=1Y8Tuh2fLtexYsGrmQD2ITTSIfUVJmqTylwgMryDjxw%3D&amp;reserved=0
> > You need to have your own wq and run all your tdr work on the same wq if
> > your reset has any cross-engine impact.
> 
> 
> IMHO what is problematic in serializing vs. locking (with trylock and bail
> out like we do in [1]) is for multiple TO events arising from same reason
> like maybe one job just waits for another and once first is hanged the
> second will also appear to be hanged triggering it's own TO event.
> In this case multiple TOs event will trigger multiple resets if we serialize
> but if we use lock with trylock the second one will quietly bail out.
> 
> [1] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c#L4903

Hm so I guess a single wq here, that will hold up all other TO. And they
should recheck whether the job is moving meanwhile.

Also unless you use hw semaphores the job shouldn't even start before the
deps are singalled, so not sure how this goes wrong?

The vm_id flush stuff can make things a bit more fun for your specific
case, but in your specific case you have to run all TO handlers on the
same ordered workqueue anyway (because trying to paper over this in other
ways doesn't work imo).

So I think this should all work, no need for tricky cross-scheduler
locking.
-Daniel

> 
> Andrey
> 
> 
> > 
> > See
> > 
> > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdri.freedesktop.org%2Fdocs%2Fdrm%2Fgpu%2Fdrm-mm.html%23c.drm_sched_backend_ops&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7Cc697c75898664f678f4b08d96c8820e7%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637660154199259544%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=tLjFaN7mREYjjydxHszbQlTk3lwH4bQtBDVzHFHvPJg%3D&amp;reserved=0
> > 
> > for the ->timeout_job callback docs. I thought I brought this up already?
> > -Daniel
> 
> 
> Yes, this discussion is a continuation of your comment about serializing, I
> mentioned before that you proposed it.
> 
> Andrey
> 
> 
> > 
> > > Andrey
> > > 
> > > 
> > > >    	spin_lock(&sched->job_list_lock);
> > > >    	job = list_first_entry_or_null(&sched->pending_list,
> > > >    				       struct drm_sched_job, list);
> > > >    	if (job) {
> > > > -		/*
> > > > -		 * Remove the bad job so it cannot be freed by concurrent
> > > > -		 * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
> > > > -		 * is parked at which point it's safe.
> > > > -		 */
> > > > -		list_del_init(&job->list);
> > > >    		spin_unlock(&sched->job_list_lock);
> > > > +		/* vendor's timeout_job should call drm_sched_start() */
> > > >    		status = job->sched->ops->timedout_job(job);
> > > >    		/*
> > > > @@ -393,20 +391,6 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
> > > >    	kthread_park(sched->thread);
> > > >    	/*
> > > > -	 * Reinsert back the bad job here - now it's safe as
> > > > -	 * drm_sched_get_cleanup_job cannot race against us and release the
> > > > -	 * bad job at this point - we parked (waited for) any in progress
> > > > -	 * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
> > > > -	 * now until the scheduler thread is unparked.
> > > > -	 */
> > > > -	if (bad && bad->sched == sched)
> > > > -		/*
> > > > -		 * Add at the head of the queue to reflect it was the earliest
> > > > -		 * job extracted.
> > > > -		 */
> > > > -		list_add(&bad->list, &sched->pending_list);
> > > > -
> > > > -	/*
> > > >    	 * Iterate the job list from later to  earlier one and either deactive
> > > >    	 * their HW callbacks or remove them from pending list if they already
> > > >    	 * signaled.

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
