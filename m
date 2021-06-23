Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4D73B1B8A
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 15:49:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 922446E8E8;
	Wed, 23 Jun 2021 13:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05DA36E8E6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 13:49:23 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id a133so1180352oib.13
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 06:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FSJdN+lLR7hunBLH7o5XHKX0Ex1ftt2L4C8UubYSgAQ=;
 b=jFibmn7BB3JRLsz62fs/jiDpIzMrcz1sEVxgn3g3RpuZo6BifC7rDAD9J9xgJ0HIi1
 XNXAWCJdwrZTtAUTmdTDZZCYbWLrtEvjpPy1OIPKyoaEOfZXaaYIeLg/XJtK2J8StW2A
 optsPIsWyHkzt3SQGp0/b87dDqDE0rPHfvZKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FSJdN+lLR7hunBLH7o5XHKX0Ex1ftt2L4C8UubYSgAQ=;
 b=YZKw4zQRX07bhaomi2pjsbng/idw1lTyXFXhm0x5KYs1xnxN4uEpbzpo2lv24c5E97
 bx6C14qgqD5gOTojuxp4nyX2JyB15RVYWLrvZGaCpZimtL5kGLvIhExAsCL/dJN7xPp2
 y2oUd6F1XyFBuG6CjHYWwJvL0Z4ge4QNhJPUoZdS+8EVcrqu6yfPZ1gbXxVJVzEA/IE+
 5+Rp7wn+IdCUEVAgtZun1smQ4Tt1ooQjeGN42tJ9eQjx01wjDz7mLdPPkhbYXp66Jt7P
 kAygIw1+1saLw31St72+r7LZ+3kODZctvx3S+vR+DTLZbpyOLDmaK93KLvs/ik0UryxA
 c+/Q==
X-Gm-Message-State: AOAM531CmL8TMzdSUWTFP5kApu0ZcMUgLJgvxS1v8kziViQ9QB8JiXOj
 GEgwuAniGCbiQfseAtER94Iou+tv3Pt4tqZZJxdCPw==
X-Google-Smtp-Source: ABdhPJyi7ytKjEIsOyBxnbJ4eF06clmnIZfRsXYdHiW9T7An0RJDzroU8W07EQQ+ku3KNKGjXw2rJsKrHlFuXt7AEMc=
X-Received: by 2002:aca:1a0c:: with SMTP id a12mr3189094oia.14.1624456162292; 
 Wed, 23 Jun 2021 06:49:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
 <20210622165511.3169559-16-daniel.vetter@ffwll.ch>
 <CAP+8YyHPLpe6jM7gz3ZNL3QqdHiCdL0P5cVMS7ddNgBSJmutSA@mail.gmail.com>
 <CAKMK7uGOrro7-2+OVJse3CcuZO66kreq-XjL45Ay5vhL=2TZvQ@mail.gmail.com>
 <3bf45006-4256-763d-601b-3a25a7057820@amd.com>
 <CAP+8YyH1xyYVfEkYVudCn+=jyiWxoZgDndrcSLM0Qq=E9_GDKg@mail.gmail.com>
 <421cb10d-92a7-0780-3d38-d4cabd008c0c@amd.com>
In-Reply-To: <421cb10d-92a7-0780-3d38-d4cabd008c0c@amd.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 23 Jun 2021 15:49:10 +0200
Message-ID: <CAKMK7uEjc+tZCKB8Yu3_zAjOgYLPBhnYebHOXgxpFaSunuPCfA@mail.gmail.com>
Subject: Re: [PATCH 15/15] RFC: drm/amdgpu: Implement a proper implicit
 fencing uapi
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Stone <daniels@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Kevin Wang <kevin1.wang@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Chen Li <chenli@uniontech.com>, Alex Deucher <alexander.deucher@amd.com>,
 mesa-dev <mesa-dev@lists.freedesktop.org>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Dennis Li <Dennis.Li@amd.com>, Deepak R Varma <mh12gx2825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 23, 2021 at 3:44 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 23.06.21 um 15:38 schrieb Bas Nieuwenhuizen:
> > On Wed, Jun 23, 2021 at 2:59 PM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Am 23.06.21 um 14:18 schrieb Daniel Vetter:
> >>> On Wed, Jun 23, 2021 at 11:45 AM Bas Nieuwenhuizen
> >>> <bas@basnieuwenhuizen.nl> wrote:
> >>>> On Tue, Jun 22, 2021 at 6:55 PM Daniel Vetter <daniel.vetter@ffwll.c=
h> wrote:
> >>>>> WARNING: Absolutely untested beyond "gcc isn't dying in agony".
> >>>>>
> >>>>> Implicit fencing done properly needs to treat the implicit fencing
> >>>>> slots like a funny kind of IPC mailbox. In other words it needs to =
be
> >>>>> explicitly. This is the only way it will mesh well with explicit
> >>>>> fencing userspace like vk, and it's also the bare minimum required =
to
> >>>>> be able to manage anything else that wants to use the same buffer o=
n
> >>>>> multiple engines in parallel, and still be able to share it through
> >>>>> implicit sync.
> >>>>>
> >>>>> amdgpu completely lacks such an uapi. Fix this.
> >>>>>
> >>>>> Luckily the concept of ignoring implicit fences exists already, and
> >>>>> takes care of all the complexities of making sure that non-optional
> >>>>> fences (like bo moves) are not ignored. This support was added in
> >>>>>
> >>>>> commit 177ae09b5d699a5ebd1cafcee78889db968abf54
> >>>>> Author: Andres Rodriguez <andresx7@gmail.com>
> >>>>> Date:   Fri Sep 15 20:44:06 2017 -0400
> >>>>>
> >>>>>       drm/amdgpu: introduce AMDGPU_GEM_CREATE_EXPLICIT_SYNC v2
> >>>>>
> >>>>> Unfortuantely it's the wrong semantics, because it's a bo flag and
> >>>>> disables implicit sync on an allocated buffer completely.
> >>>>>
> >>>>> We _do_ want implicit sync, but control it explicitly. For this we
> >>>>> need a flag on the drm_file, so that a given userspace (like vulkan=
)
> >>>>> can manage the implicit sync slots explicitly. The other side of th=
e
> >>>>> pipeline (compositor, other process or just different stage in a me=
dia
> >>>>> pipeline in the same process) can then either do the same, or fully
> >>>>> participate in the implicit sync as implemented by the kernel by
> >>>>> default.
> >>>>>
> >>>>> By building on the existing flag for buffers we avoid any issues wi=
th
> >>>>> opening up additional security concerns - anything this new flag he=
re
> >>>>> allows is already.
> >>>>>
> >>>>> All drivers which supports this concept of a userspace-specific
> >>>>> opt-out of implicit sync have a flag in their CS ioctl, but in real=
ity
> >>>>> that turned out to be a bit too inflexible. See the discussion belo=
w,
> >>>>> let's try to do a bit better for amdgpu.
> >>>>>
> >>>>> This alone only allows us to completely avoid any stalls due to
> >>>>> implicit sync, it does not yet allow us to use implicit sync as a
> >>>>> strange form of IPC for sync_file.
> >>>>>
> >>>>> For that we need two more pieces:
> >>>>>
> >>>>> - a way to get the current implicit sync fences out of a buffer. Co=
uld
> >>>>>     be done in a driver ioctl, but everyone needs this, and general=
ly a
> >>>>>     dma-buf is involved anyway to establish the sharing. So an ioct=
l on
> >>>>>     the dma-buf makes a ton more sense:
> >>>>>
> >>>>>     https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Flore.kernel.org%2Fdri-devel%2F20210520190007.534046-4-jason%40jlekstra=
nd.net%2F&amp;data=3D04%7C01%7Cchristian.koenig%40amd.com%7Ca401fc4551f045c=
95d8808d9364c38f6%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637600523287=
217723%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6=
Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DL8KCz8711Y2qZx0%2FJWT6HSg4o6OMhn%=
2BC4U2IR06nViE%3D&amp;reserved=3D0
> >>>>>
> >>>>>     Current drivers in upstream solves this by having the opt-out f=
lag
> >>>>>     on their CS ioctl. This has the downside that very often the CS
> >>>>>     which must actually stall for the implicit fence is run a while
> >>>>>     after the implicit fence point was logically sampled per the ap=
i
> >>>>>     spec (vk passes an explicit syncobj around for that afaiui), an=
d so
> >>>>>     results in oversync. Converting the implicit sync fences into a
> >>>>>     snap-shot sync_file is actually accurate.
> >>>>>
> >>>>> - Simillar we need to be able to set the exclusive implicit fence.
> >>>>>     Current drivers again do this with a CS ioctl flag, with again =
the
> >>>>>     same problems that the time the CS happens additional dependenc=
ies
> >>>>>     have been added. An explicit ioctl to only insert a sync_file (=
while
> >>>>>     respecting the rules for how exclusive and shared fence slots m=
ust
> >>>>>     be update in struct dma_resv) is much better. This is proposed =
here:
> >>>>>
> >>>>>     https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Flore.kernel.org%2Fdri-devel%2F20210520190007.534046-5-jason%40jlekstra=
nd.net%2F&amp;data=3D04%7C01%7Cchristian.koenig%40amd.com%7Ca401fc4551f045c=
95d8808d9364c38f6%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637600523287=
227719%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6=
Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D8Ws%2B573T5rj9Bs08%2BQB5CbIAsWgo3=
6hYiH%2Fd0dPcJeg%3D&amp;reserved=3D0
> >>>>>
> >>>>> These three pieces together allow userspace to fully control implic=
it
> >>>>> fencing and remove all unecessary stall points due to them.
> >>>>>
> >>>>> Well, as much as the implicit fencing model fundamentally allows:
> >>>>> There is only one set of fences, you can only choose to sync agains=
t
> >>>>> only writers (exclusive slot), or everyone. Hence suballocating
> >>>>> multiple buffers or anything else like this is fundamentally not
> >>>>> possible, and can only be fixed by a proper explicit fencing model.
> >>>>>
> >>>>> Aside from that caveat this model gets implicit fencing as closely =
to
> >>>>> explicit fencing semantics as possible:
> >>>>>
> >>>>> On the actual implementation I opted for a simple setparam ioctl, n=
o
> >>>>> locking (just atomic reads/writes) for simplicity. There is a nice
> >>>>> flag parameter in the VM ioctl which we could use, except:
> >>>>> - it's not checked, so userspace likely passes garbage
> >>>>> - there's already a comment that userspace _does_ pass garbage in t=
he
> >>>>>     priority field
> >>>>> So yeah unfortunately this flag parameter for setting vm flags is
> >>>>> useless, and we need to hack up a new one.
> >>>>>
> >>>>> v2: Explain why a new SETPARAM (Jason)
> >>>>>
> >>>>> v3: Bas noticed I forgot to hook up the dependency-side shortcut. W=
e
> >>>>> need both, or this doesn't do much.
> >>>>>
> >>>>> v4: Rebase over the amdgpu patch to always set the implicit sync
> >>>>> fences.
> >>>> So I think there is still a case missing in this implementation.
> >>>> Consider these 3 cases
> >>>>
> >>>> (format: a->b: b waits on a. Yes, I know arrows are hard)
> >>>>
> >>>> explicit->explicit: This doesn't wait now, which is good
> >>>> Implicit->explicit: This doesn't wait now, which is good
> >>>> explicit->implicit : This still waits as the explicit submission sti=
ll
> >>>> adds shared fences and most things that set an exclusive fence for
> >>>> implicit sync will hence wait on it.
> >>>>
> >>>> This is probably good enough for what radv needs now but also sounds
> >>>> like a risk wrt baking in new uapi behavior that we don't want to be
> >>>> the end result.
> >>>>
> >>>> Within AMDGPU this is probably solvable in two ways:
> >>>>
> >>>> 1) Downgrade AMDGPU_SYNC_NE_OWNER to AMDGPU_SYNC_EXPLICIT for shared=
 fences.
> >>> I'm not sure that works. I think the right fix is that radeonsi also
> >>> switches to this model, with maybe a per-bo CS flag to set indicate
> >>> write access, to cut down on the number of ioctls that are needed
> >>> otherwise on shared buffers. This per-bo flag would essentially selec=
t
> >>> between SYNC_NE_OWNER and SYNC_EXPLICIT on a per-buffer basis.
> >> Yeah, but I'm still not entirely sure why that approach isn't sufficie=
nt?
> >>
> >> Problem with the per context or per vm flag is that you then don't get
> >> any implicit synchronization any more when another process starts usin=
g
> >> the buffer.
> > That is exactly what I want for Vulkan :)
>
> Yeah, but as far as I know this is not something we can do.
>
> See we have use cases like screen capture and debug which rely on that
> behavior.

They will keep working, if (and only if) the vulkan side sets the
winsys fences correctly. Also, everything else in vulkan aside from
winsys is explicitly not synced at all, you have to import drm syncobj
timeline on the gl side.

> The only thing we can do is to say on a per buffer flag that a buffer
> should not participate in implicit sync at all.

Nah, this doesn't work. Because it's not a global decision, is a local
decision for the rendered. Vulkan wants to control implicit sync
explicitly, and the kernel can't force more synchronization. If a
buffer is shared as a winsys buffer between vulkan client and gl using
compositor, then you _have_ to use implicit sync on it. But vk needs
to set the fences directly (and if the app gets it wrong, you get
misrendering, but that is the specified behavour of vulkan).
-Daniel

>
> Regards,
> Christian.
>
> >>> The current amdgpu uapi just doesn't allow any other model without an
> >>> explicit opt-in. So current implicit sync userspace just has to
> >>> oversync, there's not much choice.
> >>>
> >>>> 2) Have an EXPLICIT fence owner that is used for explicit submission=
s
> >>>> that is ignored by AMDGPU_SYNC_NE_OWNER.
> >>>>
> >>>> But this doesn't solve cross-driver interactions here.
> >>> Yeah cross-driver is still entirely unsolved, because
> >>> amdgpu_bo_explicit_sync() on the bo didn't solve that either.
> >> Hui? You have lost me. Why is that still unsolved?
> > The part we're trying to solve with this patch is Vulkan should not
> > participate in any implicit sync at all wrt submissions (and then
> > handle the implicit sync for WSI explicitly using the fence
> > import/export stuff that Jason wrote). As long we add shared fences to
> > the dma_resv we participate in implicit sync (at the level of an
> > implicit sync read) still, at least from the perspective of later jobs
> > waiting on these fences.
> >
> >> Regards,
> >> Christian.
> >>
> >>> -Daniel
> >>>
> >>>>> Cc: mesa-dev@lists.freedesktop.org
> >>>>> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> >>>>> Cc: Dave Airlie <airlied@gmail.com>
> >>>>> Cc: Rob Clark <robdclark@chromium.org>
> >>>>> Cc: Kristian H. Kristensen <hoegsberg@google.com>
> >>>>> Cc: Michel D=C3=A4nzer <michel@daenzer.net>
> >>>>> Cc: Daniel Stone <daniels@collabora.com>
> >>>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> >>>>> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> >>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
> >>>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> >>>>> Cc: Deepak R Varma <mh12gx2825@gmail.com>
> >>>>> Cc: Chen Li <chenli@uniontech.com>
> >>>>> Cc: Kevin Wang <kevin1.wang@amd.com>
> >>>>> Cc: Dennis Li <Dennis.Li@amd.com>
> >>>>> Cc: Luben Tuikov <luben.tuikov@amd.com>
> >>>>> Cc: linaro-mm-sig@lists.linaro.org
> >>>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> >>>>> ---
> >>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  |  7 +++++--
> >>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 21 +++++++++++++++++++=
++
> >>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  |  6 ++++++
> >>>>>    include/uapi/drm/amdgpu_drm.h           | 10 ++++++++++
> >>>>>    4 files changed, 42 insertions(+), 2 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_cs.c
> >>>>> index 65df34c17264..c5386d13eb4a 100644
> >>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> >>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> >>>>> @@ -498,6 +498,7 @@ static int amdgpu_cs_parser_bos(struct amdgpu_c=
s_parser *p,
> >>>>>           struct amdgpu_bo *gds;
> >>>>>           struct amdgpu_bo *gws;
> >>>>>           struct amdgpu_bo *oa;
> >>>>> +       bool no_implicit_sync =3D READ_ONCE(fpriv->vm.no_implicit_s=
ync);
> >>>>>           int r;
> >>>>>
> >>>>>           INIT_LIST_HEAD(&p->validated);
> >>>>> @@ -577,7 +578,8 @@ static int amdgpu_cs_parser_bos(struct amdgpu_c=
s_parser *p,
> >>>>>
> >>>>>                   e->bo_va =3D amdgpu_vm_bo_find(vm, bo);
> >>>>>
> >>>>> -               if (bo->tbo.base.dma_buf && !amdgpu_bo_explicit_syn=
c(bo)) {
> >>>>> +               if (bo->tbo.base.dma_buf &&
> >>>>> +                   !(no_implicit_sync || amdgpu_bo_explicit_sync(b=
o))) {
> >>>>>                           e->chain =3D dma_fence_chain_alloc();
> >>>>>                           if (!e->chain) {
> >>>>>                                   r =3D -ENOMEM;
> >>>>> @@ -649,6 +651,7 @@ static int amdgpu_cs_sync_rings(struct amdgpu_c=
s_parser *p)
> >>>>>    {
> >>>>>           struct amdgpu_fpriv *fpriv =3D p->filp->driver_priv;
> >>>>>           struct amdgpu_bo_list_entry *e;
> >>>>> +       bool no_implicit_sync =3D READ_ONCE(fpriv->vm.no_implicit_s=
ync);
> >>>>>           int r;
> >>>>>
> >>>>>           list_for_each_entry(e, &p->validated, tv.head) {
> >>>>> @@ -656,7 +659,7 @@ static int amdgpu_cs_sync_rings(struct amdgpu_c=
s_parser *p)
> >>>>>                   struct dma_resv *resv =3D bo->tbo.base.resv;
> >>>>>                   enum amdgpu_sync_mode sync_mode;
> >>>>>
> >>>>> -               sync_mode =3D amdgpu_bo_explicit_sync(bo) ?
> >>>>> +               sync_mode =3D no_implicit_sync || amdgpu_bo_explici=
t_sync(bo) ?
> >>>>>                           AMDGPU_SYNC_EXPLICIT : AMDGPU_SYNC_NE_OWN=
ER;
> >>>>>                   r =3D amdgpu_sync_resv(p->adev, &p->job->sync, re=
sv, sync_mode,
> >>>>>                                        &fpriv->vm);
> >>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_drv.c
> >>>>> index c080ba15ae77..f982626b5328 100644
> >>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> >>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> >>>>> @@ -1724,6 +1724,26 @@ int amdgpu_file_to_fpriv(struct file *filp, =
struct amdgpu_fpriv **fpriv)
> >>>>>           return 0;
> >>>>>    }
> >>>>>
> >>>>> +int amdgpu_setparam_ioctl(struct drm_device *dev, void *data,
> >>>>> +                         struct drm_file *filp)
> >>>>> +{
> >>>>> +       struct drm_amdgpu_setparam *setparam =3D data;
> >>>>> +       struct amdgpu_fpriv *fpriv =3D filp->driver_priv;
> >>>>> +
> >>>>> +       switch (setparam->param) {
> >>>>> +       case AMDGPU_SETPARAM_NO_IMPLICIT_SYNC:
> >>>>> +               if (setparam->value)
> >>>>> +                       WRITE_ONCE(fpriv->vm.no_implicit_sync, true=
);
> >>>>> +               else
> >>>>> +                       WRITE_ONCE(fpriv->vm.no_implicit_sync, fals=
e);
> >>>>> +               break;
> >>>>> +       default:
> >>>>> +               return -EINVAL;
> >>>>> +       }
> >>>>> +
> >>>>> +       return 0;
> >>>>> +}
> >>>>> +
> >>>>>    const struct drm_ioctl_desc amdgpu_ioctls_kms[] =3D {
> >>>>>           DRM_IOCTL_DEF_DRV(AMDGPU_GEM_CREATE, amdgpu_gem_create_io=
ctl, DRM_AUTH|DRM_RENDER_ALLOW),
> >>>>>           DRM_IOCTL_DEF_DRV(AMDGPU_CTX, amdgpu_ctx_ioctl, DRM_AUTH|=
DRM_RENDER_ALLOW),
> >>>>> @@ -1742,6 +1762,7 @@ const struct drm_ioctl_desc amdgpu_ioctls_kms=
[] =3D {
> >>>>>           DRM_IOCTL_DEF_DRV(AMDGPU_GEM_VA, amdgpu_gem_va_ioctl, DRM=
_AUTH|DRM_RENDER_ALLOW),
> >>>>>           DRM_IOCTL_DEF_DRV(AMDGPU_GEM_OP, amdgpu_gem_op_ioctl, DRM=
_AUTH|DRM_RENDER_ALLOW),
> >>>>>           DRM_IOCTL_DEF_DRV(AMDGPU_GEM_USERPTR, amdgpu_gem_userptr_=
ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> >>>>> +       DRM_IOCTL_DEF_DRV(AMDGPU_SETPARAM, amdgpu_setparam_ioctl, D=
RM_AUTH|DRM_RENDER_ALLOW),
> >>>>>    };
> >>>>>
> >>>>>    static const struct drm_driver amdgpu_kms_driver =3D {
> >>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_vm.h
> >>>>> index ddb85a85cbba..0e8c440c6303 100644
> >>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> >>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> >>>>> @@ -321,6 +321,12 @@ struct amdgpu_vm {
> >>>>>           bool                    bulk_moveable;
> >>>>>           /* Flag to indicate if VM is used for compute */
> >>>>>           bool                    is_compute_context;
> >>>>> +       /*
> >>>>> +        * Flag to indicate whether implicit sync should always be =
skipped on
> >>>>> +        * this context. We do not care about races at all, userspa=
ce is allowed
> >>>>> +        * to shoot itself with implicit sync to its fullest liking=
.
> >>>>> +        */
> >>>>> +       bool no_implicit_sync;
> >>>>>    };
> >>>>>
> >>>>>    struct amdgpu_vm_manager {
> >>>>> diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgp=
u_drm.h
> >>>>> index 0cbd1540aeac..9eae245c14d6 100644
> >>>>> --- a/include/uapi/drm/amdgpu_drm.h
> >>>>> +++ b/include/uapi/drm/amdgpu_drm.h
> >>>>> @@ -54,6 +54,7 @@ extern "C" {
> >>>>>    #define DRM_AMDGPU_VM                  0x13
> >>>>>    #define DRM_AMDGPU_FENCE_TO_HANDLE     0x14
> >>>>>    #define DRM_AMDGPU_SCHED               0x15
> >>>>> +#define DRM_AMDGPU_SETPARAM            0x16
> >>>>>
> >>>>>    #define DRM_IOCTL_AMDGPU_GEM_CREATE    DRM_IOWR(DRM_COMMAND_BASE=
 + DRM_AMDGPU_GEM_CREATE, union drm_amdgpu_gem_create)
> >>>>>    #define DRM_IOCTL_AMDGPU_GEM_MMAP      DRM_IOWR(DRM_COMMAND_BASE=
 + DRM_AMDGPU_GEM_MMAP, union drm_amdgpu_gem_mmap)
> >>>>> @@ -71,6 +72,7 @@ extern "C" {
> >>>>>    #define DRM_IOCTL_AMDGPU_VM            DRM_IOWR(DRM_COMMAND_BASE=
 + DRM_AMDGPU_VM, union drm_amdgpu_vm)
> >>>>>    #define DRM_IOCTL_AMDGPU_FENCE_TO_HANDLE DRM_IOWR(DRM_COMMAND_BA=
SE + DRM_AMDGPU_FENCE_TO_HANDLE, union drm_amdgpu_fence_to_handle)
> >>>>>    #define DRM_IOCTL_AMDGPU_SCHED         DRM_IOW(DRM_COMMAND_BASE =
+ DRM_AMDGPU_SCHED, union drm_amdgpu_sched)
> >>>>> +#define DRM_IOCTL_AMDGPU_SETPARAM      DRM_IOW(DRM_COMMAND_BASE + =
DRM_AMDGPU_SETPARAM, struct drm_amdgpu_setparam)
> >>>>>
> >>>>>    /**
> >>>>>     * DOC: memory domains
> >>>>> @@ -306,6 +308,14 @@ union drm_amdgpu_sched {
> >>>>>           struct drm_amdgpu_sched_in in;
> >>>>>    };
> >>>>>
> >>>>> +#define AMDGPU_SETPARAM_NO_IMPLICIT_SYNC       1
> >>>>> +
> >>>>> +struct drm_amdgpu_setparam {
> >>>>> +       /* AMDGPU_SETPARAM_* */
> >>>>> +       __u32   param;
> >>>>> +       __u32   value;
> >>>>> +};
> >>>>> +
> >>>>>    /*
> >>>>>     * This is not a reliable API and you should expect it to fail f=
or any
> >>>>>     * number of reasons and have fallback path that do not use user=
ptr to
> >>>>> --
> >>>>> 2.32.0.rc2
> >>>>>
> >>>
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
