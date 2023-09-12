Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6880679D276
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 15:34:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96AE710E23B;
	Tue, 12 Sep 2023 13:34:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ECA910E24E
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 13:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694525686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pqnHcd3R5pX3HjoiMUrseh/pBypspTaW+C/5GBo0BG4=;
 b=bvu8YfxEihRPELq9GpoRJZdK2Lce9hmrfEEtfI1ejxdazkHELA61slFigQBFomCueXOVQw
 /T2ZYoGh1Oz4ZLby3L5DIiq7QmOTRTwQoU/VM0WXfD+x/3MDS8uufcP1uZaBd4VhT9Z5Bk
 N5CYC9m95k0dn0j2nxcX1yyorQJdPMM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-VMmNcE6IMzuBEpY_7ay91w-1; Tue, 12 Sep 2023 09:34:45 -0400
X-MC-Unique: VMmNcE6IMzuBEpY_7ay91w-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-52a38baa269so3877668a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 06:34:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694525684; x=1695130484;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pqnHcd3R5pX3HjoiMUrseh/pBypspTaW+C/5GBo0BG4=;
 b=HoYVuNXzwSC2DmoThHe4dXi2FSfJ5ggHOtHIudpowXSWmS9LuFOcz4cMCG4JV7//cl
 4M5lNK6Xk5rNi54e38/TeeDmV3sdo6h3T/R4YmtY8jAenXX0irJgFogr2opWML+skZDQ
 KGirogoLIhrmDKA77ZnxYOMvsyKzVCgdnFuw6r1Pvh6oiyli+XePSAK7p9ID6CGc3psi
 8oNx96F2awlZxBU8K2OhH99gBKeNOUwLxakwgdtzx7dgE7u6N1uNdon4yUQC/Gthl/iD
 SiuYz7Y0L/O0UH6APBWyfL7Tmn/NgWkDdXe3VJ7m656x9bNiS6NygZtUK4aiK+QRozzi
 svhA==
X-Gm-Message-State: AOJu0YxjpJVB1FgWjwxyea3902KAmcOnbhsKOCX7rCZpiksKpSPtAaIw
 skDqylBOxAnIq6heX3CPifzsmYoNt3IrPxO7GM1D1TMtY4VpAKnm3fv26IZHwWCM3e97XHdoZR9
 jESRir0kFYiTV9rf96pTn28s8yBEmPLzhrj08
X-Received: by 2002:a05:6402:d4f:b0:52f:6641:4ed9 with SMTP id
 ec15-20020a0564020d4f00b0052f66414ed9mr4647290edb.41.1694525684450; 
 Tue, 12 Sep 2023 06:34:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFElDKt7AOIKlbZ7xRPQ3IEj/Di9+ufb6RIf9ow31XQqgGHZL1Z1DLZp4iLuLIwDd+rCfwsaw==
X-Received: by 2002:a05:6402:d4f:b0:52f:6641:4ed9 with SMTP id
 ec15-20020a0564020d4f00b0052f66414ed9mr4647275edb.41.1694525684169; 
 Tue, 12 Sep 2023 06:34:44 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 bm5-20020a0564020b0500b0052e7e1931e2sm5934148edb.57.2023.09.12.06.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 06:34:43 -0700 (PDT)
Date: Tue, 12 Sep 2023 15:34:41 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 4/9] drm/sched: Split free_job into own work item
Message-ID: <ZQBo8YbjFigHyKc5@pollux>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-5-matthew.brost@intel.com>
 <ZOfh6o2EaGuIqZVe@pollux>
 <ZOgYu1fZQUHeneJC@DUT025-TGLU.fm.intel.com>
 <6ae84066-b690-1562-0598-4694b022c960@amd.com>
 <ZOiuWcFDImBvJtnO@DUT025-TGLU.fm.intel.com>
 <ee56b9ee-36c7-5935-c319-c8d1ad412c7c@amd.com>
 <20230912152705.70064f9f@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20230912152705.70064f9f@collabora.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, robdclark@chromium.org,
 sarah.walker@imgtec.com, thomas.hellstrom@linux.intel.com,
 ketil.johnsen@arm.com, lina@asahilina.net, Liviu.Dudau@arm.com,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 luben.tuikov@amd.com, donald.robson@imgtec.com,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 12, 2023 at 03:27:05PM +0200, Boris Brezillon wrote:
> On Fri, 25 Aug 2023 15:45:49 +0200
> Christian König <christian.koenig@amd.com> wrote:
> 
> > >>>> I tried this patch with Nouveau and found a race condition:
> > >>>>
> > >>>> In drm_sched_run_job_work() the job is added to the pending_list via
> > >>>> drm_sched_job_begin(), then the run_job() callback is called and the scheduled
> > >>>> fence is signaled.
> > >>>>
> > >>>> However, in parallel drm_sched_get_cleanup_job() might be called from
> > >>>> drm_sched_free_job_work(), which picks the first job from the pending_list and
> > >>>> for the next job on the pending_list sets the scheduled fence' timestamp field.  
> > >> Well why can this happen in parallel? Either the work items are scheduled to
> > >> a single threaded work queue or you have protected the pending list with
> > >> some locks.
> > >>  
> > > Xe uses a single-threaded work queue, Nouveau does not (desired
> > > behavior).
> > >
> > > The list of pending jobs is protected by a lock (safe), the race is:
> > >
> > > add job to pending list
> > > run_job
> > > signal scheduled fence
> > >
> > > dequeue from pending list
> > > free_job
> > > update timestamp
> > >
> > > Once a job is on the pending list its timestamp can be accessed which
> > > can blow up if scheduled fence isn't signaled or more specifically unless
> > > DMA_FENCE_FLAG_TIMESTAMP_BIT is set.  
> 
> I'm a bit lost. How can this lead to a NULL deref? Timestamp is a
> ktime_t embedded in dma_fence, and finished/scheduled are both
> dma_fence objects embedded in drm_sched_fence. So, unless
> {job,next_job}->s_fence is NULL, or {job,next_job} itself is NULL, I
> don't really see where the NULL deref is. If s_fence is NULL, that means
> drm_sched_job_init() wasn't called (unlikely to be detected that late),
> or ->free_job()/drm_sched_job_cleanup() was called while the job was
> still in the pending list. I don't really see a situation where job
> could NULL to be honest.

I think the problem here was that a dma_fence' timestamp field is within a union
together with it's cb_list list_head [1]. If a timestamp is set before the fence
is actually signalled, dma_fence_signal_timestamp_locked() will access the
cb_list to run the particular callbacks registered to this dma_fence. However,
writing the timestap will overwrite this list_head since it's a union, hence
we'd try to dereference the timestamp while iterating the list.

[1] https://elixir.bootlin.com/linux/latest/source/include/linux/dma-fence.h#L87

> 
> While I agree that updating the timestamp before the fence has been
> flagged as signaled/timestamped is broken (timestamp will be
> overwritten when dma_fence_signal(scheduled) is called) I don't see a
> situation where it would cause a NULL/invalid pointer deref. So I
> suspect there's another race causing jobs to be cleaned up while
> they're still in the pending_list.
> 
> > 
> > Ah, that problem again. No that is actually quite harmless.
> > 
> > You just need to double check if the DMA_FENCE_FLAG_TIMESTAMP_BIT is 
> > already set and if it's not set don't do anything.
> 

