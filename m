Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E373FC7E1
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 15:08:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF4F689EA6;
	Tue, 31 Aug 2021 13:08:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD8389E9E
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 13:08:35 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id t15so21407831wrg.7
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 06:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=wXDmcDBTd2H3ARcd/cZIFyo7FbtO0F5pLy17lY5r46w=;
 b=dyRIntM+MLpdVii3NsbghIQPginBP+TP3ERYG9rAaR1zz3MlwCM5H0qxn7iPVo05HJ
 hCq52tsAU5LvKP1zfMYKVMS8tFUkViKIHsn2zmibC7yQCsIeYl9XqpzGWSplpNl1LuzO
 ibE720/jboj7RTfuRBFVzygwcrT2L25kZr3LU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wXDmcDBTd2H3ARcd/cZIFyo7FbtO0F5pLy17lY5r46w=;
 b=O5doVWmsXgnCTjV6ccFirt7YE1/KujwB64H4Wk9RyTCQvS1Ux1aG+aC0eYVa25o5G0
 ZYr3DQ5O/P1/eAaxPjA91C0f0Tn4vqdYxgKYEhQp538fIrp6iRZfp3VX0/1SezwPidT6
 Vid6v7YaSP7rGay743XlVVxQxE9BdXLJUgT9QMGH9N4VhC7NjmL7GTJuU8jmH4ouJPp1
 qOi5rKveIhePosQ0RTDln0f+TnXTSc8sbnLKPewxiJkU0aYDXukNu9IJK88G3cHxjcXp
 tNe3Nyeq9KgdWmwpD3HCjoAqCQ/pJ1CxQPhoOhhA4dXSijjtxbKYn7l9si17VkEi7nzz
 WHkg==
X-Gm-Message-State: AOAM530AE/RxYwLUmbkCJD+Q4mBOLoEGNtAmj3P5xOQkbSL2AFOjnT/m
 hOn0/0GCafGFCLeUbUiVZyldsQ==
X-Google-Smtp-Source: ABdhPJw8QFyFJzKObDdmwI2AO7gLMA38M2Tz1nNVPK5DOvxNOgTz2MF4AhkpMdxtz+VBrKXaMyoT5g==
X-Received: by 2002:adf:9063:: with SMTP id h90mr31927611wrh.121.1630415314371; 
 Tue, 31 Aug 2021 06:08:34 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c14sm2402158wme.6.2021.08.31.06.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 06:08:33 -0700 (PDT)
Date: Tue, 31 Aug 2021 15:08:31 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "Liu, Monk" <Monk.Liu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/sched: fix the bug of time out calculation(v3)
Message-ID: <YS4pz4SZBLPyllG+@phenom.ffwll.local>
References: <1629953731-14629-1-git-send-email-Monk.Liu@amd.com>
 <20419179-ee90-45aa-f4b8-b6bcb20a9c52@amd.com>
 <cc01416c-c04e-a716-f617-71351c1ad06a@amd.com>
 <BL1PR12MB5269AAC2FA518CF85724C85D84C89@BL1PR12MB5269.namprd12.prod.outlook.com>
 <257202a9-a670-5b89-f98d-01855b6e41cf@amd.com>
 <da180d36-b5dd-733e-3721-3333b0cf405e@gmail.com>
 <9bb9b448-ea93-e8f9-818e-c6d27d4a8264@amd.com>
 <8171ae25-72b6-7400-6969-61885ca5094b@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8171ae25-72b6-7400-6969-61885ca5094b@amd.com>
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

On Fri, Aug 27, 2021 at 08:30:32PM +0200, Christian König wrote:
> Yeah, that's what I meant with that the start of processing a job is a bit
> swampy defined.
> 
> Jobs overload, but we simply don't have another good indicator that a job
> started except that the previous one completed.
> 
> It's still better than starting the timer when pushing the job to the ring
> buffer, because that is completely off.

Not sure this matters that much really in practice, and in some cases we
might want to actually just reset it all if the built up backlog is way
too long.

For anything that really runs way too long you want preempt-ctx/revoke
fences anyway, not end-of-cs fences with tdr.
-Daniel

> 
> Christian.
> 
> Am 27.08.21 um 20:22 schrieb Andrey Grodzovsky:
> > As I mentioned to Monk before - what about cases such as in this test - https://gitlab.freedesktop.org/mesa/drm/-/commit/bc21168fa924d3fc4a000492e861f50a1a135b25
> > 
> > Here you don't have serialized sequence where when jobs finishes
> > processing and second starts, they execute together  concurrently - for
> > those cases seems
> > to me restarting the timer for the second job from scratch will let it
> > hang much longer then allowed by TO value.
> > 
> > Andrey
> > 
> > On 2021-08-27 10:29 a.m., Christian König wrote:
> > > I don't think that makes sense.
> > > 
> > > See we don't want to start the time when the job is inserted into
> > > the ring buffer, but rather when it starts processing.
> > > 
> > > Starting processing is a bit swampy defined, but just starting the
> > > timer when the previous job completes should be fine enough.
> > > 
> > > Christian.
> > > 
> > > Am 27.08.21 um 15:57 schrieb Andrey Grodzovsky:
> > > > The TS represents the point in time when the job was inserted
> > > > into the pending list.
> > > > I don't think it matters when it actually starts to be
> > > > processed, what matters is when this job was inserted into
> > > > pending list because right at that point you arm the TO timer
> > > > (when no other is running already)
> > > > and so when the previous job completes and you cancel and rearm
> > > > again you can use that TS from the next job in pending list to
> > > > calculate how much time has actually left for it to run before
> > > > TDR must be initiated
> > > > and not just give it again full TO value to run even if it has
> > > > already been running for a while.
> > > > 
> > > > Also, i am not sure also about the assumption that what we
> > > > measure is processing by HW, what we measure is from the moment
> > > > it was scheduled to ring to the moment the job completed (EOP
> > > > event). At least that what our TDR timer measures and so it
> > > > makes sense to set the TS at this point.
> > > > 
> > > > Andrey
> > > > 
> > > > On 2021-08-27 3:20 a.m., Liu, Monk wrote:
> > > > > [AMD Official Use Only]
> > > > > 
> > > > > what is that 'ts' representing for ? it looks to me the
> > > > > jiffies that it get scheduled to the ring,  but a job
> > > > > scheduled to the ring doesn't represent it's being processed
> > > > > by hw.
> > > > > 
> > > > > Thanks
> > > > > 
> > > > > ------------------------------------------
> > > > > Monk Liu | Cloud-GPU Core team
> > > > > ------------------------------------------
> > > > > 
> > > > > -----Original Message-----
> > > > > From: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
> > > > > Sent: Friday, August 27, 2021 4:14 AM
> > > > > To: Liu, Monk <Monk.Liu@amd.com>;
> > > > > amd-gfx@lists.freedesktop.org; Koenig, Christian
> > > > > <Christian.Koenig@amd.com>
> > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > Subject: Re: [PATCH] drm/sched: fix the bug of time out
> > > > > calculation(v3)
> > > > > 
> > > > > Attached quick patch for per job TTL calculation to make
> > > > > more precises next timer expiration. It's on top of the
> > > > > patch in this thread. Let me know if this makes sense.
> > > > > 
> > > > > Andrey
> > > > > 
> > > > > On 2021-08-26 10:03 a.m., Andrey Grodzovsky wrote:
> > > > > > On 2021-08-26 12:55 a.m., Monk Liu wrote:
> > > > > > > issue:
> > > > > > > in cleanup_job the cancle_delayed_work will cancel a TO timer even
> > > > > > > the its corresponding job is still running.
> > > > > > > 
> > > > > > > fix:
> > > > > > > do not cancel the timer in cleanup_job, instead do the cancelling
> > > > > > > only when the heading job is signaled, and if there is a "next" job
> > > > > > > we start_timeout again.
> > > > > > > 
> > > > > > > v2:
> > > > > > > further cleanup the logic, and do the TDR timer cancelling if the
> > > > > > > signaled job is the last one in its scheduler.
> > > > > > > 
> > > > > > > v3:
> > > > > > > change the issue description
> > > > > > > remove the cancel_delayed_work in the begining of the cleanup_job
> > > > > > > recover the implement of drm_sched_job_begin.
> > > > > > > 
> > > > > > > TODO:
> > > > > > > 1)introduce pause/resume scheduler in job_timeout to serial the
> > > > > > > handling of scheduler and job_timeout.
> > > > > > > 2)drop the bad job's del and insert in scheduler due to above
> > > > > > > serialization (no race issue anymore with the serialization)
> > > > > > > 
> > > > > > > Signed-off-by: Monk Liu <Monk.Liu@amd.com>
> > > > > > > ---
> > > > > > >    drivers/gpu/drm/scheduler/sched_main.c | 25
> > > > > > > ++++++++++---------------
> > > > > > >    1 file changed, 10 insertions(+), 15 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > index a2a9536..ecf8140 100644
> > > > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > @@ -676,13 +676,7 @@ drm_sched_get_cleanup_job(struct
> > > > > > > drm_gpu_scheduler *sched)
> > > > > > >    {
> > > > > > >        struct drm_sched_job *job, *next;
> > > > > > >    -    /*
> > > > > > > -     * Don't destroy jobs while the timeout worker is running OR
> > > > > > > thread
> > > > > > > -     * is being parked and hence assumed to not touch pending_list
> > > > > > > -     */
> > > > > > > -    if ((sched->timeout != MAX_SCHEDULE_TIMEOUT &&
> > > > > > > -        !cancel_delayed_work(&sched->work_tdr)) ||
> > > > > > > -        kthread_should_park())
> > > > > > > +    if (kthread_should_park())
> > > > > > >            return NULL;
> > > > > > 
> > > > > > I actually don't see why we need to keep the above, on the other side
> > > > > > (in drm_sched_stop) we won't touch the pending list
> > > > > > anyway until sched
> > > > > > thread came to full stop (kthread_park). If you do see a reason why
> > > > > > this needed then a comment should be here i think.
> > > > > > 
> > > > > > Andrey
> > > > > > 
> > > > > > 
> > > > > > > spin_lock(&sched->job_list_lock);
> > > > > > > @@ -693,17 +687,21 @@ drm_sched_get_cleanup_job(struct
> > > > > > > drm_gpu_scheduler *sched)
> > > > > > >        if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
> > > > > > >            /* remove job from pending_list */
> > > > > > >            list_del_init(&job->list);
> > > > > > > +
> > > > > > > +        /* cancel this job's TO timer */
> > > > > > > +        cancel_delayed_work(&sched->work_tdr);
> > > > > > >            /* make the scheduled timestamp more accurate */
> > > > > > >            next = list_first_entry_or_null(&sched->pending_list,
> > > > > > >                            typeof(*next), list);
> > > > > > > -        if (next)
> > > > > > > +
> > > > > > > +        if (next) {
> > > > > > >                next->s_fence->scheduled.timestamp =
> > > > > > > job->s_fence->finished.timestamp;
> > > > > > > -
> > > > > > > +            /* start TO timer for next job */
> > > > > > > +            drm_sched_start_timeout(sched);
> > > > > > > +        }
> > > > > > >        } else {
> > > > > > >            job = NULL;
> > > > > > > -        /* queue timeout for next job */
> > > > > > > -        drm_sched_start_timeout(sched);
> > > > > > >        }
> > > > > > >          spin_unlock(&sched->job_list_lock);
> > > > > > > @@ -791,11 +789,8 @@ static int drm_sched_main(void *param)
> > > > > > >                          (entity =
> > > > > > > drm_sched_select_entity(sched))) ||
> > > > > > >                         kthread_should_stop());
> > > > > > >    -        if (cleanup_job) {
> > > > > > > +        if (cleanup_job)
> > > > > > >                sched->ops->free_job(cleanup_job);
> > > > > > > -            /* queue timeout for next job */
> > > > > > > -            drm_sched_start_timeout(sched);
> > > > > > > -        }
> > > > > > >              if (!entity)
> > > > > > >                continue;
> > > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
