Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D38C57DBF72
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 18:56:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF3E010E356;
	Mon, 30 Oct 2023 17:56:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8721710E356
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 17:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698688579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jID4tHn08elPgxyEfgPPpsaNGXgYjbJIfQQivheYoJA=;
 b=IGEZxgtFsoTQVZifa67MukJaOjnGgX+2lzCusSxZXzaY80dX6gRVcvQmlqBHLexW3l30q6
 fYcE8axiujoHnIVvS0ZvB7usRKEXSaIwwhiqG34Xx33/ODrujVitcrgZZyqNUxf1nl+bD7
 s5Tuwksf5VQt2gNvKWnRUTnZxoGkAKI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-368-EuuYGwnCMXak9aHFkom_dA-1; Mon, 30 Oct 2023 13:56:18 -0400
X-MC-Unique: EuuYGwnCMXak9aHFkom_dA-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-9a681c3470fso325915266b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 10:56:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698688577; x=1699293377;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jID4tHn08elPgxyEfgPPpsaNGXgYjbJIfQQivheYoJA=;
 b=hHPQsmulaYbWAYFEFIdLYgJLnYEbMT66vAvzFDOvgVHZ2kdk6ndtAY9O5lAhuIXCaF
 XI5V9ZC0L6EZYqIPkvA3xqtJJwJPk6qc2YEV2G5CFtq7xI2pPf28K9UGu5lM3EToWKKR
 9zJqIQotck4og/Y3HOQloQCmLe/Ghu4vHU0lNxGLcrVAHZ3gsNicUxLlIxPdFl4Ns6KZ
 AK2qYnGStK1iGDu1/UY7dSCXuC/b6kRtnoU8RnJpz23JDFZ7Db5F/ZxRCbsdMHCGqy8s
 G/COsv/sZPbFMUMwrPkMjOcHDdRqgk3dfq8XjGreUq6vldHNNKguuB8REqEEm7pr6bly
 8dGA==
X-Gm-Message-State: AOJu0Yy/Ey88yyc7r1jSTwHvnxog1ZAPKPAFjiCixJ75UWGEg1PMhUCp
 7ybhEg/zzV5RqNNoqY6LYmzQwFIxipciH5TdELBAnHcImyLT3yF0eWFe06AdI/Kpyo1cM2MhYa5
 eYKpJEnX1ZVVdIMtXk7Kcd43xTbE2
X-Received: by 2002:a17:907:5cb:b0:9c7:4d98:981f with SMTP id
 wg11-20020a17090705cb00b009c74d98981fmr9323684ejb.33.1698688577527; 
 Mon, 30 Oct 2023 10:56:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHta2EvUdvONbbXJhn7uzmdCtadwlpKyQSt2TctdAA1qIy3OrRjRPFTFxdj21KlkgQwIZDZlQ==
X-Received: by 2002:a17:907:5cb:b0:9c7:4d98:981f with SMTP id
 wg11-20020a17090705cb00b009c74d98981fmr9323670ejb.33.1698688577095; 
 Mon, 30 Oct 2023 10:56:17 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 x22-20020a1709064a9600b009c751e41ebasm6456036eju.141.2023.10.30.10.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 10:56:16 -0700 (PDT)
Date: Mon, 30 Oct 2023 18:56:14 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH drm-misc-next v3] drm/sched: implement dynamic job-flow
 control
Message-ID: <ZT/uPhLK7gan61Ns@pollux>
References: <20231026161431.5934-1-dakr@redhat.com>
 <0bc79ae3-04fe-4e85-9fd0-e8b281148390@amd.com>
 <20231027093238.2ff8172e@collabora.com>
 <ff389793-1226-49fd-b599-07dbda0b97be@amd.com>
 <20231027093943.3f0ae992@collabora.com>
 <98988459-25a8-4ee0-89d4-cb816cbc5bef@amd.com>
 <20231027102237.0cdb85af@collabora.com>
 <190e3ab7-6440-4d41-a79f-5dd4b7d3ca52@amd.com>
 <20231027121707.414810d6@collabora.com>
 <ffb8ff87-a555-42d2-aef1-a21069282227@amd.com>
MIME-Version: 1.0
In-Reply-To: <ffb8ff87-a555-42d2-aef1-a21069282227@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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
Cc: matthew.brost@intel.com, luben.tuikov@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, faith@gfxstrand.net,
 Boris Brezillon <boris.brezillon@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On Mon, Oct 30, 2023 at 08:38:45AM +0100, Christian König wrote:
> Hi Boris,
> 
> Am 27.10.23 um 12:17 schrieb Boris Brezillon:
> > Hi Christian,
> > 
> > On Fri, 27 Oct 2023 11:06:44 +0200
> > Christian König <christian.koenig@amd.com> wrote:
> > 
> > > Am 27.10.23 um 10:22 schrieb Boris Brezillon:
> > > > On Fri, 27 Oct 2023 09:44:13 +0200
> > > > Christian König<christian.koenig@amd.com>  wrote:
> > > > > Am 27.10.23 um 09:39 schrieb Boris Brezillon:
> > > > > > On Fri, 27 Oct 2023 09:35:01 +0200
> > > > > > Christian König<christian.koenig@amd.com>   wrote:
> > > > > > > Am 27.10.23 um 09:32 schrieb Boris Brezillon:
> > > > > > > > On Fri, 27 Oct 2023 09:22:12 +0200
> > > > > > > > Christian König<christian.koenig@amd.com>   wrote:
> > > > > > > > > > +
> > > > > > > > > > +	/**
> > > > > > > > > > +	 * @update_job_credits: Called once the scheduler is considering this
> > > > > > > > > > +	 * job for execution.
> > > > > > > > > > +	 *
> > > > > > > > > > +	 * Drivers may use this to update the job's submission credits, which is
> > > > > > > > > > +	 * useful to e.g. deduct the number of native fences which have been
> > > > > > > > > > +	 * signaled meanwhile.
> > > > > > > > > > +	 *
> > > > > > > > > > +	 * The callback must either return the new number of submission credits
> > > > > > > > > > +	 * for the given job, or zero if no update is required.
> > > > > > > > > > +	 *
> > > > > > > > > > +	 * This callback is optional.
> > > > > > > > > > +	 */
> > > > > > > > > > +	u32 (*update_job_credits)(struct drm_sched_job *sched_job);
> > > > > > > > > Why do we need an extra callback for this?
> > > > > > > > > 
> > > > > > > > > Just document that prepare_job() is allowed to reduce the number of
> > > > > > > > > credits the job might need.
> > > > > > > > ->prepare_job() is called only once if the returned fence is NULL, but
> > > > > > > > we need this credit-update to happen every time a job is considered for
> > > > > > > > execution by the scheduler.
> > > > > > > But the job is only considered for execution once. How do you see that
> > > > > > > this is called multiple times?
> > > > > > Nope, it's not. If drm_sched_can_queue() returns false, the scheduler
> > > > > > will go look for another entity that has a job ready for execution, and
> > > > > > get back to this entity later, and test drm_sched_can_queue() again.
> > > > > > Basically, any time drm_sched_can_queue() is called, the job credits
> > > > > > update should happen, so we have an accurate view of how many credits
> > > > > > this job needs.
> > > > > Well, that is the handling which I already rejected because it creates
> > > > > unfairness between processes. When you consider the credits needed
> > > > > *before* scheduling jobs with a lower credit count are always preferred
> > > > > over jobs with a higher credit count.
> > > > My bad, it doesn't pick another entity when an entity with a
> > > > ready job that doesn't fit the queue is found, it just bails out from
> > > > drm_sched_rq_select_entity_rr() and returns NULL (AKA: no ready entity
> > > > found). But we still want to update the job credits before checking if
> > > > the job fits or not (next time this entity is tested).
> > > Why? I only see a few possibility here:
> > > 
> > > 1. You need to wait for submissions to the same scheduler to finish
> > > before the one you want to push to the ring.
> > >       This case can be avoided by trying to cast the dependency fences to
> > > drm_sched_fences and looking if they are already scheduled.
> > > 
> > > 2. You need to wait for submissions to a different scheduler instance
> > > and in this case you should probably return that as dependency instead.
> > It's already described as a dependency, but native dependency waits are
> > deferred to the FW (we wait on scheduled to run the job, not finished).
> > The thing is, after ->prepare_job() returned NULL (no non-native deps
> > remaining), and before ->run_job() gets called, there might be several
> > of these native deps that get signaled, and we're still considering
> > job->submission_credits as unchanged, when each of these signalled
> > fence could have reduced the job credits, potentially allowing it to be
> > submitted sooner.
> 
> Ah, ok that at least clears up your intentions here.
> 
> Question is if that is really that important for you? I mean you just seem
> to fill up more of the ring buffer.
> 
> > 
> > > So to me it looks like when prepare_job() is called because it is
> > > selected as next job for submission you should already know how many
> > > credits it needs.
> > You know how many credits it needs when ->prepare_job() is called, but
> > if this number is too high, the entity will not be picked, and next
> > time it's checked, you'll still consider the job credits at the time
> > ->prepare_job() was called, which might differ from the current job
> > credits (signalled native fences might have been signalled in the
> > meantime, and they could be evicted).
> > 
> > > > > What you can do is to look at the credits of a job *after* it was picked
> > > > > up for scheduling so that you can scheduler more jobs.
> > > > Sure, but then you might further delay your job if something made it
> > > > smaller (ie. native fences got signaled) between ->prepare_job() and
> > > > drm_sched_can_queue(). And any new drm_sched_can_queue() test would
> > > > just see the old credits value.
> > > > 
> > > > Out of curiosity, what are you worried about with this optional
> > > > ->update_job_credits() call in the drm_sched_can_queue() path? Is the
> > > > if (sched->update_job_credits) overhead considered too high for drivers
> > > > that don't need it?
> > > Since the dma_fences are also used for resource management the scheduler
> > > is vital for correct system operation.
> > > 
> > > We had massively problems because people tried to over-optimize the
> > > dma_fence handling which lead to very hard to narrow down memory
> > > corruptions.
> > > 
> > > So for every change you come up here you need to have a very very good
> > > justification. And just saving a bit size of your ring buffer is
> > > certainly not one of them.
> > I fail to see how calling ->update_job_credits() changes the scheduler
> > behavior or how it relates to the sort memory corruption you're
> > referring to.
> 
> Yeah, you are right that's not even remotely related.
> 
> > And yes, we can live with the overhead of making jobs
> > slightly bigger than they actually are, thus potentially delaying their
> > execution. It's just that I don't quite understand the rational behind
> > this conservatism, as I don't really see what negative impact this extra
> > ->update_job_credits() call in the credit checking path has, other than
> > the slight overhead of an if-check for drivers that don't need it.
> 
> From experience it showed that we should not make the scheduler more
> complicated than necessary. And I still think that the ring buffers only
> need to be filled enough to keep the hardware busy.

Right, and this callback contributes to exactly that.

I don't really think there is much to worry about in terms of introducing more
complexity. The implementation behind this callback is fairly trivial - it's
simply called right before we check whether a job fits on the ring, to fetch
the job's actual size.

I would agree if the implementation of that would be bulky, tricky and asking
for a compromise. But, since it actually is simple and straight forward I really
think that if we implement some kind of dynamic job-flow control it should be
implemented as acurate as possible rather than doing it half-baked.

> 
> If this here has some measurable positive effect then yeah we should
> probably do it, but as long as it's only nice to have I have some objections
> to that.

Can't answer this, since Nouveau doesn't support native fence waits. However, I
guess it depends on how many native fences a job carries. So, if we'd have two
jobs with each of them carrying a lot of native fences, but not a lot of actual
work, I can very well imagine that over-accounting can have a measureable
impact.

I just wonder if we really want to ask for real measurements given that the
optimization is rather trivial and cheap and we already have enough evidence
that it makes sense conceptually.

- Danilo

> 
> Regards,
> Christian.
> 
> > 
> > Regards,
> > 
> > Boris
> 

