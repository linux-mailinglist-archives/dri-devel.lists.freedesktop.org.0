Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AD03B1B4E
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 15:38:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4FCB6E8E4;
	Wed, 23 Jun 2021 13:38:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0390189FEA
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 13:38:44 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id r12so3436151ioa.7
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 06:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pbUycUN2rLw/NpVnHTIINetmdItB8ttstk1+aiKBgsI=;
 b=dBBJPAqrXkKWSND+v1EL2tus27yTDJPdFsHwNGt83YekplISakyk6r63tgTzokXwjl
 ahb3TlHilV23gBBNK99qmug87Vg8QzXVaLnn1BVMd3ReQKn/g1sGT/xH0tJmsUm00Qow
 aY9PQUWyJnyZFMlymGL9uSIwyK7CfvlvWQgQuWdtyNhm8YFYCsogTGNi33nNdG1c0qzI
 q7s1mH61NP6unfToNoXDJ/tQqGR7dJtSiLB4mlK6jYzM56zhsZwALAFkY/VulDVMnMQR
 Xfs1Xsjtsls+2M2+hnROYU0StIWPfQk10F8XIE8HB6VfycxUEcL1pF5CPs2jav24s0to
 2kqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pbUycUN2rLw/NpVnHTIINetmdItB8ttstk1+aiKBgsI=;
 b=Y3gqxvy7L06eRWXxO3aDOOFx5/5ZqoCVS6IBiD07B8jQtvV4yb5u8a54V5w2XhJxrB
 6kVejNbpvchEkUOBn8DfIh1x5VI/rxGQvRT3xPsuf5PSeCH+reHr8MZG928bBmXxTZKq
 MfJ/1tYP/Tcwe6bWV/2uAI/3Jcr6EgpJldGxqcBjn6drz94hnqdb4+Wlh7stBsM8XP/e
 gdrpEeojLHDKWNtOHekJaUfzkdyeGdvd1vmODq88M4BfIuyzcen13LDlJyKPnZBn6j4I
 WQ3eSn6J0vOMBeejcy9Pa0q5++EPEwPbEY19urHxAq+JP/3VcbgF09iwpiZ8m8ry2g0+
 Qn8Q==
X-Gm-Message-State: AOAM533Tcl7MIIE1oLDSiMtRAIuU9hf/tp/VqoLofqcondtVH+EC9wYE
 0qPomeGX6hWIfwv7mdWE1yLASbBCqMZKt4AYMVpTUA==
X-Google-Smtp-Source: ABdhPJxyvGrbQ2FKDblt/MdAvighHagEciQVyyHFv/qmVSXPRKwn5bAoCENV10JBsnt+9ZJ5zgZgRhsNGgy0+22w9Z4=
X-Received: by 2002:a02:ca4a:: with SMTP id i10mr8988384jal.141.1624455524349; 
 Wed, 23 Jun 2021 06:38:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
 <20210622165511.3169559-16-daniel.vetter@ffwll.ch>
 <CAP+8YyHPLpe6jM7gz3ZNL3QqdHiCdL0P5cVMS7ddNgBSJmutSA@mail.gmail.com>
 <CAKMK7uGOrro7-2+OVJse3CcuZO66kreq-XjL45Ay5vhL=2TZvQ@mail.gmail.com>
 <3bf45006-4256-763d-601b-3a25a7057820@amd.com>
In-Reply-To: <3bf45006-4256-763d-601b-3a25a7057820@amd.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Wed, 23 Jun 2021 15:38:39 +0200
Message-ID: <CAP+8YyH1xyYVfEkYVudCn+=jyiWxoZgDndrcSLM0Qq=E9_GDKg@mail.gmail.com>
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
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Kevin Wang <kevin1.wang@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Chen Li <chenli@uniontech.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 mesa-dev <mesa-dev@lists.freedesktop.org>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Dennis Li <Dennis.Li@amd.com>, Deepak R Varma <mh12gx2825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 23, 2021 at 2:59 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 23.06.21 um 14:18 schrieb Daniel Vetter:
> > On Wed, Jun 23, 2021 at 11:45 AM Bas Nieuwenhuizen
> > <bas@basnieuwenhuizen.nl> wrote:
> >> On Tue, Jun 22, 2021 at 6:55 PM Daniel Vetter <daniel.vetter@ffwll.ch>=
 wrote:
> >>> WARNING: Absolutely untested beyond "gcc isn't dying in agony".
> >>>
> >>> Implicit fencing done properly needs to treat the implicit fencing
> >>> slots like a funny kind of IPC mailbox. In other words it needs to be
> >>> explicitly. This is the only way it will mesh well with explicit
> >>> fencing userspace like vk, and it's also the bare minimum required to
> >>> be able to manage anything else that wants to use the same buffer on
> >>> multiple engines in parallel, and still be able to share it through
> >>> implicit sync.
> >>>
> >>> amdgpu completely lacks such an uapi. Fix this.
> >>>
> >>> Luckily the concept of ignoring implicit fences exists already, and
> >>> takes care of all the complexities of making sure that non-optional
> >>> fences (like bo moves) are not ignored. This support was added in
> >>>
> >>> commit 177ae09b5d699a5ebd1cafcee78889db968abf54
> >>> Author: Andres Rodriguez <andresx7@gmail.com>
> >>> Date:   Fri Sep 15 20:44:06 2017 -0400
> >>>
> >>>      drm/amdgpu: introduce AMDGPU_GEM_CREATE_EXPLICIT_SYNC v2
> >>>
> >>> Unfortuantely it's the wrong semantics, because it's a bo flag and
> >>> disables implicit sync on an allocated buffer completely.
> >>>
> >>> We _do_ want implicit sync, but control it explicitly. For this we
> >>> need a flag on the drm_file, so that a given userspace (like vulkan)
> >>> can manage the implicit sync slots explicitly. The other side of the
> >>> pipeline (compositor, other process or just different stage in a medi=
a
> >>> pipeline in the same process) can then either do the same, or fully
> >>> participate in the implicit sync as implemented by the kernel by
> >>> default.
> >>>
> >>> By building on the existing flag for buffers we avoid any issues with
> >>> opening up additional security concerns - anything this new flag here
> >>> allows is already.
> >>>
> >>> All drivers which supports this concept of a userspace-specific
> >>> opt-out of implicit sync have a flag in their CS ioctl, but in realit=
y
> >>> that turned out to be a bit too inflexible. See the discussion below,
> >>> let's try to do a bit better for amdgpu.
> >>>
> >>> This alone only allows us to completely avoid any stalls due to
> >>> implicit sync, it does not yet allow us to use implicit sync as a
> >>> strange form of IPC for sync_file.
> >>>
> >>> For that we need two more pieces:
> >>>
> >>> - a way to get the current implicit sync fences out of a buffer. Coul=
d
> >>>    be done in a driver ioctl, but everyone needs this, and generally =
a
> >>>    dma-buf is involved anyway to establish the sharing. So an ioctl o=
n
> >>>    the dma-buf makes a ton more sense:
> >>>
> >>>    https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Flore.kernel.org%2Fdri-devel%2F20210520190007.534046-4-jason%40jlekstrand.=
net%2F&amp;data=3D04%7C01%7Cchristian.koenig%40amd.com%7Cf026055f523d4e4df9=
5b08d936410e39%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637600475351085=
536%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1=
haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DgUnM8%2Fulx%2B%2BDLxByO%2F0V3cLqt%2F=
c2unWjizEpptQqM8g%3D&amp;reserved=3D0
> >>>
> >>>    Current drivers in upstream solves this by having the opt-out flag
> >>>    on their CS ioctl. This has the downside that very often the CS
> >>>    which must actually stall for the implicit fence is run a while
> >>>    after the implicit fence point was logically sampled per the api
> >>>    spec (vk passes an explicit syncobj around for that afaiui), and s=
o
> >>>    results in oversync. Converting the implicit sync fences into a
> >>>    snap-shot sync_file is actually accurate.
> >>>
> >>> - Simillar we need to be able to set the exclusive implicit fence.
> >>>    Current drivers again do this with a CS ioctl flag, with again the
> >>>    same problems that the time the CS happens additional dependencies
> >>>    have been added. An explicit ioctl to only insert a sync_file (whi=
le
> >>>    respecting the rules for how exclusive and shared fence slots must
> >>>    be update in struct dma_resv) is much better. This is proposed her=
e:
> >>>
> >>>    https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Flore.kernel.org%2Fdri-devel%2F20210520190007.534046-5-jason%40jlekstrand.=
net%2F&amp;data=3D04%7C01%7Cchristian.koenig%40amd.com%7Cf026055f523d4e4df9=
5b08d936410e39%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637600475351085=
536%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1=
haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DwFGNyeL1YSpkebf1L1DDb2euihf1fvmR9G8c=
fywrpVU%3D&amp;reserved=3D0
> >>>
> >>> These three pieces together allow userspace to fully control implicit
> >>> fencing and remove all unecessary stall points due to them.
> >>>
> >>> Well, as much as the implicit fencing model fundamentally allows:
> >>> There is only one set of fences, you can only choose to sync against
> >>> only writers (exclusive slot), or everyone. Hence suballocating
> >>> multiple buffers or anything else like this is fundamentally not
> >>> possible, and can only be fixed by a proper explicit fencing model.
> >>>
> >>> Aside from that caveat this model gets implicit fencing as closely to
> >>> explicit fencing semantics as possible:
> >>>
> >>> On the actual implementation I opted for a simple setparam ioctl, no
> >>> locking (just atomic reads/writes) for simplicity. There is a nice
> >>> flag parameter in the VM ioctl which we could use, except:
> >>> - it's not checked, so userspace likely passes garbage
> >>> - there's already a comment that userspace _does_ pass garbage in the
> >>>    priority field
> >>> So yeah unfortunately this flag parameter for setting vm flags is
> >>> useless, and we need to hack up a new one.
> >>>
> >>> v2: Explain why a new SETPARAM (Jason)
> >>>
> >>> v3: Bas noticed I forgot to hook up the dependency-side shortcut. We
> >>> need both, or this doesn't do much.
> >>>
> >>> v4: Rebase over the amdgpu patch to always set the implicit sync
> >>> fences.
> >> So I think there is still a case missing in this implementation.
> >> Consider these 3 cases
> >>
> >> (format: a->b: b waits on a. Yes, I know arrows are hard)
> >>
> >> explicit->explicit: This doesn't wait now, which is good
> >> Implicit->explicit: This doesn't wait now, which is good
> >> explicit->implicit : This still waits as the explicit submission still
> >> adds shared fences and most things that set an exclusive fence for
> >> implicit sync will hence wait on it.
> >>
> >> This is probably good enough for what radv needs now but also sounds
> >> like a risk wrt baking in new uapi behavior that we don't want to be
> >> the end result.
> >>
> >> Within AMDGPU this is probably solvable in two ways:
> >>
> >> 1) Downgrade AMDGPU_SYNC_NE_OWNER to AMDGPU_SYNC_EXPLICIT for shared f=
ences.
> > I'm not sure that works. I think the right fix is that radeonsi also
> > switches to this model, with maybe a per-bo CS flag to set indicate
> > write access, to cut down on the number of ioctls that are needed
> > otherwise on shared buffers. This per-bo flag would essentially select
> > between SYNC_NE_OWNER and SYNC_EXPLICIT on a per-buffer basis.
>
> Yeah, but I'm still not entirely sure why that approach isn't sufficient?
>
> Problem with the per context or per vm flag is that you then don't get
> any implicit synchronization any more when another process starts using
> the buffer.

That is exactly what I want for Vulkan :)
>
> > The current amdgpu uapi just doesn't allow any other model without an
> > explicit opt-in. So current implicit sync userspace just has to
> > oversync, there's not much choice.
> >
> >> 2) Have an EXPLICIT fence owner that is used for explicit submissions
> >> that is ignored by AMDGPU_SYNC_NE_OWNER.
> >>
> >> But this doesn't solve cross-driver interactions here.
> > Yeah cross-driver is still entirely unsolved, because
> > amdgpu_bo_explicit_sync() on the bo didn't solve that either.
>
> Hui? You have lost me. Why is that still unsolved?

The part we're trying to solve with this patch is Vulkan should not
participate in any implicit sync at all wrt submissions (and then
handle the implicit sync for WSI explicitly using the fence
import/export stuff that Jason wrote). As long we add shared fences to
the dma_resv we participate in implicit sync (at the level of an
implicit sync read) still, at least from the perspective of later jobs
waiting on these fences.

>
> Regards,
> Christian.
>
> > -Daniel
> >
> >>> Cc: mesa-dev@lists.freedesktop.org
> >>> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> >>> Cc: Dave Airlie <airlied@gmail.com>
> >>> Cc: Rob Clark <robdclark@chromium.org>
> >>> Cc: Kristian H. Kristensen <hoegsberg@google.com>
> >>> Cc: Michel D=C3=A4nzer <michel@daenzer.net>
> >>> Cc: Daniel Stone <daniels@collabora.com>
> >>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> >>> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> >>> Cc: Alex Deucher <alexander.deucher@amd.com>
> >>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> >>> Cc: Deepak R Varma <mh12gx2825@gmail.com>
> >>> Cc: Chen Li <chenli@uniontech.com>
> >>> Cc: Kevin Wang <kevin1.wang@amd.com>
> >>> Cc: Dennis Li <Dennis.Li@amd.com>
> >>> Cc: Luben Tuikov <luben.tuikov@amd.com>
> >>> Cc: linaro-mm-sig@lists.linaro.org
> >>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> >>> ---
> >>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  |  7 +++++--
> >>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 21 +++++++++++++++++++++
> >>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  |  6 ++++++
> >>>   include/uapi/drm/amdgpu_drm.h           | 10 ++++++++++
> >>>   4 files changed, 42 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_cs.c
> >>> index 65df34c17264..c5386d13eb4a 100644
> >>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> >>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> >>> @@ -498,6 +498,7 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_=
parser *p,
> >>>          struct amdgpu_bo *gds;
> >>>          struct amdgpu_bo *gws;
> >>>          struct amdgpu_bo *oa;
> >>> +       bool no_implicit_sync =3D READ_ONCE(fpriv->vm.no_implicit_syn=
c);
> >>>          int r;
> >>>
> >>>          INIT_LIST_HEAD(&p->validated);
> >>> @@ -577,7 +578,8 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_=
parser *p,
> >>>
> >>>                  e->bo_va =3D amdgpu_vm_bo_find(vm, bo);
> >>>
> >>> -               if (bo->tbo.base.dma_buf && !amdgpu_bo_explicit_sync(=
bo)) {
> >>> +               if (bo->tbo.base.dma_buf &&
> >>> +                   !(no_implicit_sync || amdgpu_bo_explicit_sync(bo)=
)) {
> >>>                          e->chain =3D dma_fence_chain_alloc();
> >>>                          if (!e->chain) {
> >>>                                  r =3D -ENOMEM;
> >>> @@ -649,6 +651,7 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_=
parser *p)
> >>>   {
> >>>          struct amdgpu_fpriv *fpriv =3D p->filp->driver_priv;
> >>>          struct amdgpu_bo_list_entry *e;
> >>> +       bool no_implicit_sync =3D READ_ONCE(fpriv->vm.no_implicit_syn=
c);
> >>>          int r;
> >>>
> >>>          list_for_each_entry(e, &p->validated, tv.head) {
> >>> @@ -656,7 +659,7 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_=
parser *p)
> >>>                  struct dma_resv *resv =3D bo->tbo.base.resv;
> >>>                  enum amdgpu_sync_mode sync_mode;
> >>>
> >>> -               sync_mode =3D amdgpu_bo_explicit_sync(bo) ?
> >>> +               sync_mode =3D no_implicit_sync || amdgpu_bo_explicit_=
sync(bo) ?
> >>>                          AMDGPU_SYNC_EXPLICIT : AMDGPU_SYNC_NE_OWNER;
> >>>                  r =3D amdgpu_sync_resv(p->adev, &p->job->sync, resv,=
 sync_mode,
> >>>                                       &fpriv->vm);
> >>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_drv.c
> >>> index c080ba15ae77..f982626b5328 100644
> >>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> >>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> >>> @@ -1724,6 +1724,26 @@ int amdgpu_file_to_fpriv(struct file *filp, st=
ruct amdgpu_fpriv **fpriv)
> >>>          return 0;
> >>>   }
> >>>
> >>> +int amdgpu_setparam_ioctl(struct drm_device *dev, void *data,
> >>> +                         struct drm_file *filp)
> >>> +{
> >>> +       struct drm_amdgpu_setparam *setparam =3D data;
> >>> +       struct amdgpu_fpriv *fpriv =3D filp->driver_priv;
> >>> +
> >>> +       switch (setparam->param) {
> >>> +       case AMDGPU_SETPARAM_NO_IMPLICIT_SYNC:
> >>> +               if (setparam->value)
> >>> +                       WRITE_ONCE(fpriv->vm.no_implicit_sync, true);
> >>> +               else
> >>> +                       WRITE_ONCE(fpriv->vm.no_implicit_sync, false)=
;
> >>> +               break;
> >>> +       default:
> >>> +               return -EINVAL;
> >>> +       }
> >>> +
> >>> +       return 0;
> >>> +}
> >>> +
> >>>   const struct drm_ioctl_desc amdgpu_ioctls_kms[] =3D {
> >>>          DRM_IOCTL_DEF_DRV(AMDGPU_GEM_CREATE, amdgpu_gem_create_ioctl=
, DRM_AUTH|DRM_RENDER_ALLOW),
> >>>          DRM_IOCTL_DEF_DRV(AMDGPU_CTX, amdgpu_ctx_ioctl, DRM_AUTH|DRM=
_RENDER_ALLOW),
> >>> @@ -1742,6 +1762,7 @@ const struct drm_ioctl_desc amdgpu_ioctls_kms[]=
 =3D {
> >>>          DRM_IOCTL_DEF_DRV(AMDGPU_GEM_VA, amdgpu_gem_va_ioctl, DRM_AU=
TH|DRM_RENDER_ALLOW),
> >>>          DRM_IOCTL_DEF_DRV(AMDGPU_GEM_OP, amdgpu_gem_op_ioctl, DRM_AU=
TH|DRM_RENDER_ALLOW),
> >>>          DRM_IOCTL_DEF_DRV(AMDGPU_GEM_USERPTR, amdgpu_gem_userptr_ioc=
tl, DRM_AUTH|DRM_RENDER_ALLOW),
> >>> +       DRM_IOCTL_DEF_DRV(AMDGPU_SETPARAM, amdgpu_setparam_ioctl, DRM=
_AUTH|DRM_RENDER_ALLOW),
> >>>   };
> >>>
> >>>   static const struct drm_driver amdgpu_kms_driver =3D {
> >>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_vm.h
> >>> index ddb85a85cbba..0e8c440c6303 100644
> >>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> >>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> >>> @@ -321,6 +321,12 @@ struct amdgpu_vm {
> >>>          bool                    bulk_moveable;
> >>>          /* Flag to indicate if VM is used for compute */
> >>>          bool                    is_compute_context;
> >>> +       /*
> >>> +        * Flag to indicate whether implicit sync should always be sk=
ipped on
> >>> +        * this context. We do not care about races at all, userspace=
 is allowed
> >>> +        * to shoot itself with implicit sync to its fullest liking.
> >>> +        */
> >>> +       bool no_implicit_sync;
> >>>   };
> >>>
> >>>   struct amdgpu_vm_manager {
> >>> diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_=
drm.h
> >>> index 0cbd1540aeac..9eae245c14d6 100644
> >>> --- a/include/uapi/drm/amdgpu_drm.h
> >>> +++ b/include/uapi/drm/amdgpu_drm.h
> >>> @@ -54,6 +54,7 @@ extern "C" {
> >>>   #define DRM_AMDGPU_VM                  0x13
> >>>   #define DRM_AMDGPU_FENCE_TO_HANDLE     0x14
> >>>   #define DRM_AMDGPU_SCHED               0x15
> >>> +#define DRM_AMDGPU_SETPARAM            0x16
> >>>
> >>>   #define DRM_IOCTL_AMDGPU_GEM_CREATE    DRM_IOWR(DRM_COMMAND_BASE + =
DRM_AMDGPU_GEM_CREATE, union drm_amdgpu_gem_create)
> >>>   #define DRM_IOCTL_AMDGPU_GEM_MMAP      DRM_IOWR(DRM_COMMAND_BASE + =
DRM_AMDGPU_GEM_MMAP, union drm_amdgpu_gem_mmap)
> >>> @@ -71,6 +72,7 @@ extern "C" {
> >>>   #define DRM_IOCTL_AMDGPU_VM            DRM_IOWR(DRM_COMMAND_BASE + =
DRM_AMDGPU_VM, union drm_amdgpu_vm)
> >>>   #define DRM_IOCTL_AMDGPU_FENCE_TO_HANDLE DRM_IOWR(DRM_COMMAND_BASE =
+ DRM_AMDGPU_FENCE_TO_HANDLE, union drm_amdgpu_fence_to_handle)
> >>>   #define DRM_IOCTL_AMDGPU_SCHED         DRM_IOW(DRM_COMMAND_BASE + D=
RM_AMDGPU_SCHED, union drm_amdgpu_sched)
> >>> +#define DRM_IOCTL_AMDGPU_SETPARAM      DRM_IOW(DRM_COMMAND_BASE + DR=
M_AMDGPU_SETPARAM, struct drm_amdgpu_setparam)
> >>>
> >>>   /**
> >>>    * DOC: memory domains
> >>> @@ -306,6 +308,14 @@ union drm_amdgpu_sched {
> >>>          struct drm_amdgpu_sched_in in;
> >>>   };
> >>>
> >>> +#define AMDGPU_SETPARAM_NO_IMPLICIT_SYNC       1
> >>> +
> >>> +struct drm_amdgpu_setparam {
> >>> +       /* AMDGPU_SETPARAM_* */
> >>> +       __u32   param;
> >>> +       __u32   value;
> >>> +};
> >>> +
> >>>   /*
> >>>    * This is not a reliable API and you should expect it to fail for =
any
> >>>    * number of reasons and have fallback path that do not use userptr=
 to
> >>> --
> >>> 2.32.0.rc2
> >>>
> >
> >
>
