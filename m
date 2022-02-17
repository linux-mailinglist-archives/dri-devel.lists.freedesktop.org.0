Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D414B9CCE
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 11:13:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1559610F053;
	Thu, 17 Feb 2022 10:13:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78D1310F053;
 Thu, 17 Feb 2022 10:13:36 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id y7so1639580oih.5;
 Thu, 17 Feb 2022 02:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FVhqmkH6yc31MloKbV/NsodtEi0k7Jmsk5XVPv0CBzk=;
 b=Vo1V1cH5WWS/Rldjvk0N7Q8JDm1Uad2uP3jDgcyuHEOXedhkZOMxejMfFjVa5Cubt6
 U1eBSItErjVYqgOt+h5Ex6pdRJmYl6mwABclufO9w77bbSXcv1ch6UedDg+UfoILGENR
 /wA8hirqYV8zYA5gIzAFDxnyLgIGQHU5/udM7vJdiZR2hDD2m01ZriCiVIL2ue8Y8CmN
 IEpbJKv1zIPQFlEeojUtE9DgQS3+MVv3KBlfUeYL0aD4fY7hEWpsndcf3c6YwG3ZxclH
 +kjUZ+ZbS7cJ/qSu9Id7eNbbIkmTSllXAlEFqsrcI4n8ztcNfSrqwKee74Re5hskuQ6a
 76hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FVhqmkH6yc31MloKbV/NsodtEi0k7Jmsk5XVPv0CBzk=;
 b=2b6h7SB7JbkbNsbWYKai2J5War2OYNhsnUQIZmapHhag/4l/QRLbGdKbu2Q2A6HY7i
 WXxYFMweARov7cbgVhN1H8OoiNn5MLNmvbW8CBnjj41S3Eh6t9p/qFpYLfsIEFZp+BXy
 mZkzZ6deVtNMYvEwK6b9gS1gs3QQn3A4XUq8yipUGDxl1/Dafhuk+FGbgIK473mDZ/5Y
 PZxlea1WiYvrGVJGQCYOutENOJey02q7dHIn2SFAOvAbsldqLVTD4RzAvlH6LFm1knIC
 FrECBEBMW4wTXAZc0hxi7HxmuO0uG4O5KEnMGF+Eg9RmWUPn5rlHoaxWxivolGiAIKFo
 LwuA==
X-Gm-Message-State: AOAM531MZ6pk7neq6hu9psKCYBTkrn2VH51gHKZ8/MoXLHEvBsFbwscb
 86YLnhsDDqCrYFvPSyMzGYxycnnU7oMXHFCIJ78=
X-Google-Smtp-Source: ABdhPJyaOqfQDKcFfPHx4hBWWA9Y6opcSZuE49en9BS0Q2xUMsYy9e0p9OD+i2zArzALhou6jM77HogzK9E0aRQETYk=
X-Received: by 2002:a05:6808:188b:b0:2d4:70f2:3cfa with SMTP id
 bi11-20020a056808188b00b002d470f23cfamr824941oib.168.1645092815615; Thu, 17
 Feb 2022 02:13:35 -0800 (PST)
MIME-Version: 1.0
References: <20220217090440.4468-1-qiang.yu@amd.com>
 <5d3fdd2c-e74a-49f4-2b28-32c06483236f@amd.com>
 <CAKGbVbtLTBJPF5eTu4rABUTBa8eqjQvqjo1AEUrzgPgYgCREuA@mail.gmail.com>
 <dac70c05-e712-d2e3-2267-278380895f1e@amd.com>
In-Reply-To: <dac70c05-e712-d2e3-2267-278380895f1e@amd.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Thu, 17 Feb 2022 18:13:24 +0800
Message-ID: <CAKGbVbvtLbDiKrX80-dMnipdLkTE+FP=g_mx37e12fuMtA1Y4Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: check vm bo eviction valuable at last
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
 Qiang Yu <qiang.yu@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 17, 2022 at 5:46 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 17.02.22 um 10:40 schrieb Qiang Yu:
> > On Thu, Feb 17, 2022 at 5:15 PM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Am 17.02.22 um 10:04 schrieb Qiang Yu:
> >>> Workstation application ANSA/META get this error dmesg:
> >>> [drm:amdgpu_gem_va_ioctl [amdgpu]] *ERROR* Couldn't update BO_VA (-16=
)
> >>>
> >>> This is caused by:
> >>> 1. create a 256MB buffer in invisible VRAM
> >>> 2. CPU map the buffer and access it causes vm_fault and try to move
> >>>      it to visible VRAM
> >>> 3. force visible VRAM space and traverse all VRAM bos to check if
> >>>      evicting this bo is valuable
> >>> 4. when checking a VM bo (in invisible VRAM), amdgpu_vm_evictable()
> >>>      will set amdgpu_vm->evicting, but latter due to not in visible
> >>>      VRAM, won't really evict it so not add it to amdgpu_vm->evicted
> >>> 5. before next CS to clear the amdgpu_vm->evicting, user VM ops
> >>>      ioctl will pass amdgpu_vm_ready() (check amdgpu_vm->evicted)
> >>>      but fail in amdgpu_vm_bo_update_mapping() (check
> >>>      amdgpu_vm->evicting) and get this error log
> >>>
> >>> This error won't affect functionality as next CS will finish the
> >>> waiting VM ops. But we'd better make the amdgpu_vm->evicting
> >>> correctly reflact the vm status and clear the error log.
> >> Well NAK, that is intentional behavior.
> >>
> >> The VM page tables where considered for eviction, so setting the flag =
is
> >> correct even when the page tables later on are not actually evicted.
> >>
> > But this will unnecessarily stop latter user VM ops in ioctl before CS
> > even when the VM bos are not evicted.
> > Won't this have any negative effect when could do better?
>
> No, this will have a positive effect. See the VM was already considered
> for eviction because it is idle.
>
> Updating it immediately doesn't necessarily make sense, we should wait
> with that until its next usage.
>
> Additional to that this patch doesn't really fix the problem, it just
> mitigates it.
>
> Eviction can fail later on for a couple of reasons and we absolutely
> need to check the flag instead of the list in amdgpu_vm_ready().
The flag only for both flag and list? Looks like should be both as
the list indicate some vm page table need to be updated and could
delay the user update with the same logic as you described above.

Regards,
Qiang

>
> Regards,
> Christian.
>
> >
> > Regards,
> > Qiang
> >
> >> What we should rather do is to fix amdgpu_vm_ready() to take a look at
> >> the flag instead of the linked list.
> >>
> >> Regards,
> >> Christian.
> >>
> >>> Signed-off-by: Qiang Yu <qiang.yu@amd.com>
> >>> ---
> >>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 85 ++++++++++++++-------=
----
> >>>    1 file changed, 47 insertions(+), 38 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_ttm.c
> >>> index 5a32ee66d8c8..88a27911054f 100644
> >>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> >>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> >>> @@ -1306,45 +1306,11 @@ uint64_t amdgpu_ttm_tt_pte_flags(struct amdgp=
u_device *adev, struct ttm_tt *ttm,
> >>>        return flags;
> >>>    }
> >>>
> >>> -/*
> >>> - * amdgpu_ttm_bo_eviction_valuable - Check to see if we can evict a =
buffer
> >>> - * object.
> >>> - *
> >>> - * Return true if eviction is sensible. Called by ttm_mem_evict_firs=
t() on
> >>> - * behalf of ttm_bo_mem_force_space() which tries to evict buffer ob=
jects until
> >>> - * it can find space for a new object and by ttm_bo_force_list_clean=
() which is
> >>> - * used to clean out a memory space.
> >>> - */
> >>> -static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object=
 *bo,
> >>> -                                         const struct ttm_place *pla=
ce)
> >>> +static bool amdgpu_ttm_mem_eviction_valuable(struct ttm_buffer_objec=
t *bo,
> >>> +                                          const struct ttm_place *pl=
ace)
> >>>    {
> >>>        unsigned long num_pages =3D bo->resource->num_pages;
> >>>        struct amdgpu_res_cursor cursor;
> >>> -     struct dma_resv_list *flist;
> >>> -     struct dma_fence *f;
> >>> -     int i;
> >>> -
> >>> -     /* Swapout? */
> >>> -     if (bo->resource->mem_type =3D=3D TTM_PL_SYSTEM)
> >>> -             return true;
> >>> -
> >>> -     if (bo->type =3D=3D ttm_bo_type_kernel &&
> >>> -         !amdgpu_vm_evictable(ttm_to_amdgpu_bo(bo)))
> >>> -             return false;
> >>> -
> >>> -     /* If bo is a KFD BO, check if the bo belongs to the current pr=
ocess.
> >>> -      * If true, then return false as any KFD process needs all its =
BOs to
> >>> -      * be resident to run successfully
> >>> -      */
> >>> -     flist =3D dma_resv_shared_list(bo->base.resv);
> >>> -     if (flist) {
> >>> -             for (i =3D 0; i < flist->shared_count; ++i) {
> >>> -                     f =3D rcu_dereference_protected(flist->shared[i=
],
> >>> -                             dma_resv_held(bo->base.resv));
> >>> -                     if (amdkfd_fence_check_mm(f, current->mm))
> >>> -                             return false;
> >>> -             }
> >>> -     }
> >>>
> >>>        switch (bo->resource->mem_type) {
> >>>        case AMDGPU_PL_PREEMPT:
> >>> @@ -1377,10 +1343,53 @@ static bool amdgpu_ttm_bo_eviction_valuable(s=
truct ttm_buffer_object *bo,
> >>>                return false;
> >>>
> >>>        default:
> >>> -             break;
> >>> +             return ttm_bo_eviction_valuable(bo, place);
> >>>        }
> >>> +}
> >>>
> >>> -     return ttm_bo_eviction_valuable(bo, place);
> >>> +/*
> >>> + * amdgpu_ttm_bo_eviction_valuable - Check to see if we can evict a =
buffer
> >>> + * object.
> >>> + *
> >>> + * Return true if eviction is sensible. Called by ttm_mem_evict_firs=
t() on
> >>> + * behalf of ttm_bo_mem_force_space() which tries to evict buffer ob=
jects until
> >>> + * it can find space for a new object and by ttm_bo_force_list_clean=
() which is
> >>> + * used to clean out a memory space.
> >>> + */
> >>> +static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object=
 *bo,
> >>> +                                         const struct ttm_place *pla=
ce)
> >>> +{
> >>> +     struct dma_resv_list *flist;
> >>> +     struct dma_fence *f;
> >>> +     int i;
> >>> +
> >>> +     /* Swapout? */
> >>> +     if (bo->resource->mem_type =3D=3D TTM_PL_SYSTEM)
> >>> +             return true;
> >>> +
> >>> +     /* If bo is a KFD BO, check if the bo belongs to the current pr=
ocess.
> >>> +      * If true, then return false as any KFD process needs all its =
BOs to
> >>> +      * be resident to run successfully
> >>> +      */
> >>> +     flist =3D dma_resv_shared_list(bo->base.resv);
> >>> +     if (flist) {
> >>> +             for (i =3D 0; i < flist->shared_count; ++i) {
> >>> +                     f =3D rcu_dereference_protected(flist->shared[i=
],
> >>> +                             dma_resv_held(bo->base.resv));
> >>> +                     if (amdkfd_fence_check_mm(f, current->mm))
> >>> +                             return false;
> >>> +             }
> >>> +     }
> >>> +
> >>> +     /* Check by different mem type. */
> >>> +     if (!amdgpu_ttm_mem_eviction_valuable(bo, place))
> >>> +             return false;
> >>> +
> >>> +     /* VM bo should be checked at last because it will mark VM evic=
ting. */
> >>> +     if (bo->type =3D=3D ttm_bo_type_kernel)
> >>> +             return amdgpu_vm_evictable(ttm_to_amdgpu_bo(bo));
> >>> +
> >>> +     return true;
> >>>    }
> >>>
> >>>    static void amdgpu_ttm_vram_mm_access(struct amdgpu_device *adev, =
loff_t pos,
>
