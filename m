Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 526496D917E
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 10:27:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F26510E0FA;
	Thu,  6 Apr 2023 08:27:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE6D10E0FA
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 08:27:17 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 ca22-20020a056830611600b006a3c1e2b6d2so144852otb.13
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 01:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680769636;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dWTNNL36dGpjiFKMl47ZkwX/x4GKWF0G3xfScmJLlBA=;
 b=h9p29Vd63NdAyJIqB3sowDNUqyRQ6f2/j1+MVsQUissPbJQxWF1vhIQE76EB2YeQjk
 vfkHTqngY3VIe93yeQXpgoxNGy1IFodm0hwCFAdQ6kiRIivdep06iKqSyGXrYN+ktdFh
 /c4p1x2GXcFv1ojntcLQYzrhpxUSxlOdtwOrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680769636;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dWTNNL36dGpjiFKMl47ZkwX/x4GKWF0G3xfScmJLlBA=;
 b=SlzBcXko27ns2n9agoPq35NhQbORZbiSzovd6gBAlqvuyTozoqJlkXHxTBubdogjCL
 eGT5B8wuaQTSnhQb3/wAgp8Oj9PqWfgVswPRW+pIq48BbkTE4A5maH1GYaqhxsj2B8sa
 9DNR3fJ3bu+aAG51WW9irvixnqVJD515KefqGPhZiLkpRDWaByOQ5xt5BZBHYJrFbwPv
 UIelIJeqcO5OfRXGmXb0kCXY1WpPSakOycCf1tJbIDJVRs1ZHVO7G2O9MlueIryIF+SR
 TP9qv0wnaB7hyqy5fDyzCjxXavbtYRJtCI+mOFe/Plr6WDPjs82HomxSwCjMa82VKUFG
 wqAg==
X-Gm-Message-State: AAQBX9eL4QIwB9rhJi7en8W4o+ULhn6TlOXJPf1WNoxXz4wkpXk0c9Nl
 J8LOmadrS01Yi5lDdruhd9DtFivYf2a0TpuJL5HEkg==
X-Google-Smtp-Source: AKy350aC0t+E8vwomijvP0MLnRIxVgPEPTfVNqh/Yo2W7cxRjAyW56XEwI8TCv6YQ9vtCz187tn8tUViDV8SylPM/mA=
X-Received: by 2002:a9d:1984:0:b0:69c:245b:7387 with SMTP id
 k4-20020a9d1984000000b0069c245b7387mr1894352otk.2.1680769636033; Thu, 06 Apr
 2023 01:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <3e00d8a9-b6c4-8202-4f2d-5a659c61d094@redhat.com>
 <2a84875dde6565842aa07ddb96245b7d939cb4fd.camel@pengutronix.de>
 <8b28151c-f2db-af3f-8dff-87dd5d57417b@amd.com>
 <3004a2bf-e725-643e-82af-8a217784e796@redhat.com>
 <013781a3-5abd-8c66-8a0a-dd36c9c487af@amd.com>
 <28d10733-b217-7ccc-4b8c-54bdc8249234@amd.com>
In-Reply-To: <28d10733-b217-7ccc-4b8c-54bdc8249234@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 6 Apr 2023 10:27:04 +0200
Message-ID: <CAKMK7uFeeAaG8+1EutgMtmVANTb-acL0faEkJfUp1_35rSjaEg@mail.gmail.com>
Subject: Re: [Regression] drm/scheduler: track GPU active time per entity
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 tvrtko.ursulin@linux.intel.com, lina@asahilina.net,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Luben Tuikov <luben.tuikov@amd.com>, Danilo Krummrich <dakr@redhat.com>,
 yuq825@gmail.com, Bagas Sanjaya <bagasdotme@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 6 Apr 2023 at 10:22, Christian K=C3=B6nig <christian.koenig@amd.com=
> wrote:
>
> Am 05.04.23 um 18:09 schrieb Luben Tuikov:
> > On 2023-04-05 10:05, Danilo Krummrich wrote:
> >> On 4/4/23 06:31, Luben Tuikov wrote:
> >>> On 2023-03-28 04:54, Lucas Stach wrote:
> >>>> Hi Danilo,
> >>>>
> >>>> Am Dienstag, dem 28.03.2023 um 02:57 +0200 schrieb Danilo Krummrich:
> >>>>> Hi all,
> >>>>>
> >>>>> Commit df622729ddbf ("drm/scheduler: track GPU active time per enti=
ty")
> >>>>> tries to track the accumulated time that a job was active on the GP=
U
> >>>>> writing it to the entity through which the job was deployed to the
> >>>>> scheduler originally. This is done within drm_sched_get_cleanup_job=
()
> >>>>> which fetches a job from the schedulers pending_list.
> >>>>>
> >>>>> Doing this can result in a race condition where the entity is alrea=
dy
> >>>>> freed, but the entity's newly added elapsed_ns field is still acces=
sed
> >>>>> once the job is fetched from the pending_list.
> >>>>>
> >>>>> After drm_sched_entity_destroy() being called it should be safe to =
free
> >>>>> the structure that embeds the entity. However, a job originally han=
ded
> >>>>> over to the scheduler by this entity might still reside in the
> >>>>> schedulers pending_list for cleanup after drm_sched_entity_destroy(=
)
> >>>>> already being called and the entity being freed. Hence, we can run =
into
> >>>>> a UAF.
> >>>>>
> >>>> Sorry about that, I clearly didn't properly consider this case.
> >>>>
> >>>>> In my case it happened that a job, as explained above, was just pic=
ked
> >>>>> from the schedulers pending_list after the entity was freed due to =
the
> >>>>> client application exiting. Meanwhile this freed up memory was alre=
ady
> >>>>> allocated for a subsequent client applications job structure again.
> >>>>> Hence, the new jobs memory got corrupted. Luckily, I was able to
> >>>>> reproduce the same corruption over and over again by just using
> >>>>> deqp-runner to run a specific set of VK test cases in parallel.
> >>>>>
> >>>>> Fixing this issue doesn't seem to be very straightforward though (u=
nless
> >>>>> I miss something), which is why I'm writing this mail instead of se=
nding
> >>>>> a fix directly.
> >>>>>
> >>>>> Spontaneously, I see three options to fix it:
> >>>>>
> >>>>> 1. Rather than embedding the entity into driver specific structures
> >>>>> (e.g. tied to file_priv) we could allocate the entity separately an=
d
> >>>>> reference count it, such that it's only freed up once all jobs that=
 were
> >>>>> deployed through this entity are fetched from the schedulers pendin=
g list.
> >>>>>
> >>>> My vote is on this or something in similar vain for the long term. I
> >>>> have some hope to be able to add a GPU scheduling algorithm with a b=
it
> >>>> more fairness than the current one sometime in the future, which
> >>>> requires execution time tracking on the entities.
> >>> Danilo,
> >>>
> >>> Using kref is preferable, i.e. option 1 above.
> >> I think the only real motivation for doing that would be for generical=
ly
> >> tracking job statistics within the entity a job was deployed through. =
If
> >> we all agree on tracking job statistics this way I am happy to prepare=
 a
> >> patch for this option and drop this one:
> >> https://lore.kernel.org/all/20230331000622.4156-1-dakr@redhat.com/T/#u
> > Hmm, I never thought about "job statistics" when I preferred using kref=
 above.
> > The reason kref is attractive is because one doesn't need to worry abou=
t
> > it--when the last user drops the kref, the release is called to do
> > housekeeping. If this never happens, we know that we have a bug to debu=
g.
>
> Yeah, reference counting unfortunately have some traps as well. For
> example rarely dropping the last reference from interrupt context or
> with some unexpected locks help when the cleanup function doesn't expect
> that is a good recipe for problems as well.
>
> > Regarding the patch above--I did look around the code, and it seems saf=
e,
> > as per your analysis, I didn't see any reference to entity after job su=
bmission,
> > but I'll comment on that thread as well for the record.
>
> Reference counting the entities was suggested before. The intentionally
> avoided that so far because the entity might be the tip of the iceberg
> of stuff you need to keep around.
>
> For example for command submission you also need the VM and when you
> keep the VM alive you also need to keep the file private alive....

Yeah refcounting looks often like the easy way out to avoid
use-after-free issue, until you realize you've just made lifetimes
unbounded and have some enourmous leaks: entity keeps vm alive, vm
keeps all the bo alives, somehow every crash wastes more memory
because vk_device_lost means userspace allocates new stuff for
everything.

If possible a lifetime design where lifetimes have hard bounds and you
just borrow a reference under a lock (or some other ownership rule) is
generally much more solid. But also much harder to design correctly
:-/

> Additional to that we have some ugly inter dependencies between tearing
> down an application (potential with a KILL signal from the OOM killer)
> and backward compatibility for some applications which render something
> and quit before the rendering is completed in the hardware.

Yeah I think that part would also be good to sort out once&for all in
drm/sched, because i915 has/had the same struggle.
-Daniel

>
> Regards,
> Christian.
>
> >
> > Regards,
> > Luben
> >
> >> Christian mentioned amdgpu tried something similar to what Lucas tried
> >> running into similar trouble, backed off and implemented it in another
> >> way - a driver specific way I guess?
> >>
> >>> Lucas, can you shed some light on,
> >>>
> >>> 1. In what way the current FIFO scheduling is unfair, and
> >>> 2. shed some details on this "scheduling algorithm with a bit
> >>> more fairness than the current one"?
> >>>
> >>> Regards,
> >>> Luben
> >>>
> >>>>> 2. Somehow make sure drm_sched_entity_destroy() does block until al=
l
> >>>>> jobs deployed through this entity were fetched from the schedulers
> >>>>> pending list. Though, I'm pretty sure that this is not really desir=
able.
> >>>>>
> >>>>> 3. Just revert the change and let drivers implement tracking of GPU
> >>>>> active times themselves.
> >>>>>
> >>>> Given that we are already pretty late in the release cycle and etnav=
iv
> >>>> being the only driver so far making use of the scheduler elapsed tim=
e
> >>>> tracking I think the right short term solution is to either move the
> >>>> tracking into etnaviv or just revert the change for now. I'll have a
> >>>> look at this.
> >>>>
> >>>> Regards,
> >>>> Lucas
> >>>>
> >>>>> In the case of just reverting the change I'd propose to also set a =
jobs
> >>>>> entity pointer to NULL  once the job was taken from the entity, suc=
h
> >>>>> that in case of a future issue we fail where the actual issue resid=
es
> >>>>> and to make it more obvious that the field shouldn't be used anymor=
e
> >>>>> after the job was taken from the entity.
> >>>>>
> >>>>> I'm happy to implement the solution we agree on. However, it might =
also
> >>>>> make sense to revert the change until we have a solution in place. =
I'm
> >>>>> also happy to send a revert with a proper description of the proble=
m.
> >>>>> Please let me know what you think.
> >>>>>
> >>>>> - Danilo
> >>>>>
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
