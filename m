Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 609786D93B7
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 12:10:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C820A10E080;
	Thu,  6 Apr 2023 10:09:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E163110E080
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 10:09:55 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-94706a972f3so12057766b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 03:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680775794; x=1683367794;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4HBKvH8V7M1lBLL5TQIDjgH0SCrQV4oywXFEheo/M70=;
 b=EF6N1aw9UhTUuKcVRiKpHKGK4m1zxumK3qFWPACifQF56rGgZ44CQ8ZbTX8Rq9ONoA
 RMKT0nt4HP6SKzokNUOAbBDCHl9p0Iv1JE8UTDuXk7J6nukc5V6nkj0YhBPSrnXPHQXm
 +LSUedZszZESoIabBZKRvGpNCvAHBITv4dLZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680775794; x=1683367794;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4HBKvH8V7M1lBLL5TQIDjgH0SCrQV4oywXFEheo/M70=;
 b=OqqfyWnyFZO9VlsdZ/i+YJ88wkdANA4CuJhEE6KEXWoO5Oe6xvg8/A86TM8Y8Px8vi
 b7LigkGhIT840iA0LCM7gSdBbi345KqKvI8VzazdUI1rVJHs5vxzZUHd2WfnMlst7PNz
 tL+H4bzhd3BylhlzwpziYGuvve7vED+kZqdU3ti+zOXddxhKdIg5/Z1mBL6YYAARZ8Q5
 2v21cEwbNjbQqneKR9GHgQLU90kQMprC4FWZDr9Gr6OQHB6ZBD/lvC3c2kZVCTRqri7X
 kEuxg69ZaKXFE7EhBkaw2mGmkgZVRh7oAztePQHy/MNL3TJ4Blll76GfrII5sS25lTXI
 L8Yg==
X-Gm-Message-State: AAQBX9fq+S7Axa+g2ljekpjdt2m04mijrLrdyI4/ZZI80+UkN00fU3Br
 ikREZFv89MpEKetDSt0k1Xp2dBXngaTMCXZ9IZY=
X-Google-Smtp-Source: AKy350YfLK7GO92UadMTpNYe6UJGW56bevN3Py0GBNmsZou3a6WpOMtNo+vxF8Qq2wudwIWP/dH7/Q==
X-Received: by 2002:a17:906:20d7:b0:930:aa02:f9cf with SMTP id
 c23-20020a17090620d700b00930aa02f9cfmr4146422ejc.2.1680775794027; 
 Thu, 06 Apr 2023 03:09:54 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 h12-20020a170906854c00b009476309c1d9sm601670ejy.125.2023.04.06.03.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 03:09:53 -0700 (PDT)
Date: Thu, 6 Apr 2023 12:09:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Asahi Lina <lina@asahilina.net>
Subject: Re: [Regression] drm/scheduler: track GPU active time per entity
Message-ID: <ZC6ab6LomidehGR3@phenom.ffwll.local>
Mail-Followup-To: Asahi Lina <lina@asahilina.net>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Dave Airlie <airlied@gmail.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, andrey.grodzovsky@amd.com,
 tvrtko.ursulin@linux.intel.com,
 Matthew Brost <matthew.brost@intel.com>, yuq825@gmail.com,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <3e00d8a9-b6c4-8202-4f2d-5a659c61d094@redhat.com>
 <2a84875dde6565842aa07ddb96245b7d939cb4fd.camel@pengutronix.de>
 <8b28151c-f2db-af3f-8dff-87dd5d57417b@amd.com>
 <3004a2bf-e725-643e-82af-8a217784e796@redhat.com>
 <013781a3-5abd-8c66-8a0a-dd36c9c487af@amd.com>
 <28d10733-b217-7ccc-4b8c-54bdc8249234@amd.com>
 <CAKMK7uFeeAaG8+1EutgMtmVANTb-acL0faEkJfUp1_35rSjaEg@mail.gmail.com>
 <24fe6e14-0d0a-f874-766d-e8d045d1e80e@asahilina.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <24fe6e14-0d0a-f874-766d-e8d045d1e80e@asahilina.net>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Matthew Brost <matthew.brost@intel.com>, andrey.grodzovsky@amd.com,
 Bagas Sanjaya <bagasdotme@gmail.com>, tvrtko.ursulin@linux.intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Luben Tuikov <luben.tuikov@amd.com>, Danilo Krummrich <dakr@redhat.com>,
 yuq825@gmail.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 06, 2023 at 06:05:11PM +0900, Asahi Lina wrote:
> On 06/04/2023 17.27, Daniel Vetter wrote:
> > On Thu, 6 Apr 2023 at 10:22, Christian König <christian.koenig@amd.com> wrote:
> > > 
> > > Am 05.04.23 um 18:09 schrieb Luben Tuikov:
> > > > On 2023-04-05 10:05, Danilo Krummrich wrote:
> > > > > On 4/4/23 06:31, Luben Tuikov wrote:
> > > > > > On 2023-03-28 04:54, Lucas Stach wrote:
> > > > > > > Hi Danilo,
> > > > > > > 
> > > > > > > Am Dienstag, dem 28.03.2023 um 02:57 +0200 schrieb Danilo Krummrich:
> > > > > > > > Hi all,
> > > > > > > > 
> > > > > > > > Commit df622729ddbf ("drm/scheduler: track GPU active time per entity")
> > > > > > > > tries to track the accumulated time that a job was active on the GPU
> > > > > > > > writing it to the entity through which the job was deployed to the
> > > > > > > > scheduler originally. This is done within drm_sched_get_cleanup_job()
> > > > > > > > which fetches a job from the schedulers pending_list.
> > > > > > > > 
> > > > > > > > Doing this can result in a race condition where the entity is already
> > > > > > > > freed, but the entity's newly added elapsed_ns field is still accessed
> > > > > > > > once the job is fetched from the pending_list.
> > > > > > > > 
> > > > > > > > After drm_sched_entity_destroy() being called it should be safe to free
> > > > > > > > the structure that embeds the entity. However, a job originally handed
> > > > > > > > over to the scheduler by this entity might still reside in the
> > > > > > > > schedulers pending_list for cleanup after drm_sched_entity_destroy()
> > > > > > > > already being called and the entity being freed. Hence, we can run into
> > > > > > > > a UAF.
> > > > > > > > 
> > > > > > > Sorry about that, I clearly didn't properly consider this case.
> > > > > > > 
> > > > > > > > In my case it happened that a job, as explained above, was just picked
> > > > > > > > from the schedulers pending_list after the entity was freed due to the
> > > > > > > > client application exiting. Meanwhile this freed up memory was already
> > > > > > > > allocated for a subsequent client applications job structure again.
> > > > > > > > Hence, the new jobs memory got corrupted. Luckily, I was able to
> > > > > > > > reproduce the same corruption over and over again by just using
> > > > > > > > deqp-runner to run a specific set of VK test cases in parallel.
> > > > > > > > 
> > > > > > > > Fixing this issue doesn't seem to be very straightforward though (unless
> > > > > > > > I miss something), which is why I'm writing this mail instead of sending
> > > > > > > > a fix directly.
> > > > > > > > 
> > > > > > > > Spontaneously, I see three options to fix it:
> > > > > > > > 
> > > > > > > > 1. Rather than embedding the entity into driver specific structures
> > > > > > > > (e.g. tied to file_priv) we could allocate the entity separately and
> > > > > > > > reference count it, such that it's only freed up once all jobs that were
> > > > > > > > deployed through this entity are fetched from the schedulers pending list.
> > > > > > > > 
> > > > > > > My vote is on this or something in similar vain for the long term. I
> > > > > > > have some hope to be able to add a GPU scheduling algorithm with a bit
> > > > > > > more fairness than the current one sometime in the future, which
> > > > > > > requires execution time tracking on the entities.
> > > > > > Danilo,
> > > > > > 
> > > > > > Using kref is preferable, i.e. option 1 above.
> > > > > I think the only real motivation for doing that would be for generically
> > > > > tracking job statistics within the entity a job was deployed through. If
> > > > > we all agree on tracking job statistics this way I am happy to prepare a
> > > > > patch for this option and drop this one:
> > > > > https://lore.kernel.org/all/20230331000622.4156-1-dakr@redhat.com/T/#u
> > > > Hmm, I never thought about "job statistics" when I preferred using kref above.
> > > > The reason kref is attractive is because one doesn't need to worry about
> > > > it--when the last user drops the kref, the release is called to do
> > > > housekeeping. If this never happens, we know that we have a bug to debug.
> > > 
> > > Yeah, reference counting unfortunately have some traps as well. For
> > > example rarely dropping the last reference from interrupt context or
> > > with some unexpected locks help when the cleanup function doesn't expect
> > > that is a good recipe for problems as well.
> > > 
> > > > Regarding the patch above--I did look around the code, and it seems safe,
> > > > as per your analysis, I didn't see any reference to entity after job submission,
> > > > but I'll comment on that thread as well for the record.
> > > 
> > > Reference counting the entities was suggested before. The intentionally
> > > avoided that so far because the entity might be the tip of the iceberg
> > > of stuff you need to keep around.
> > > 
> > > For example for command submission you also need the VM and when you
> > > keep the VM alive you also need to keep the file private alive....
> > 
> > Yeah refcounting looks often like the easy way out to avoid
> > use-after-free issue, until you realize you've just made lifetimes
> > unbounded and have some enourmous leaks: entity keeps vm alive, vm
> > keeps all the bo alives, somehow every crash wastes more memory
> > because vk_device_lost means userspace allocates new stuff for
> > everything.
> 
> Refcounting everywhere has been working well for us, so well that so far all
> the oopses we've hit have been... drm_sched bugs like this one, not anything
> in the driver. But at least in Rust you have the advantage that you can't
> just forget a decref in a rarely-hit error path (or worse, forget an incref
> somewhere important)... ^^
> 
> > If possible a lifetime design where lifetimes have hard bounds and you
> > just borrow a reference under a lock (or some other ownership rule) is
> > generally much more solid. But also much harder to design correctly
> > :-/
> > 
> > > Additional to that we have some ugly inter dependencies between tearing
> > > down an application (potential with a KILL signal from the OOM killer)
> > > and backward compatibility for some applications which render something
> > > and quit before the rendering is completed in the hardware.
> > 
> > Yeah I think that part would also be good to sort out once&for all in
> > drm/sched, because i915 has/had the same struggle.
> > -Daniel
> > 
> 
> Is this really a thing? I think that's never going to work well for explicit
> sync, since the kernel doesn't even know what BOs it has to keep alive for a
> job... I guess it could keep the entire file and all of its objects/VMs/etc
> alive until all of its submissions complete but... ewww.
> 
> Our Mesa implementation synchronously waits for all jobs on context destroy
> for this reason, but if you just kill the app, yeah, you get faults as
> running GPU jobs have BOs yanked out from under them. Kill loops make for a
> good way of testing fault handling...

You wind down the entire thing on file close? Like
- stop all context
- tear down all context
- tear down all vm
- tear down all obj

Just winding things down in a random order and then letting gpu fault
handling sort out the mess doesn't strike me as particularly clean design
...

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
