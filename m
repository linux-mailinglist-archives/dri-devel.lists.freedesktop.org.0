Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F2C4B9DD4
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 11:58:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4237C10EBE0;
	Thu, 17 Feb 2022 10:58:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78EB110EBE1;
 Thu, 17 Feb 2022 10:58:18 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 w10-20020a4ae08a000000b0031bdf7a6d76so4331046oos.10; 
 Thu, 17 Feb 2022 02:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lLWDb1QANHeU0tDITDX2Se5UlYYAadlTb8UAohw65dA=;
 b=Y+BsR2AKN3IsoVIAqgYdXR9oWZCzTrGtgv1QKFf8KIDJ92fjMFo+xA1vcxDKaJJ6Np
 MA2Uiui9yMA+flwSXX2WeGyMFy49VTnUduZ5IqHQFAYdKN3OlBlAF9DvqpiNxkRlBk0Z
 OvOxYjZ3Wmp92Ggms4wajwO7c+DcIq76xFMsdoL2bXPMgQimqeQpHxPS7xALJcx8uivK
 T/+eN5fesr5QZgImLUCZP2OpOnguBckm/nvHHQPt/bmdVHgwRgSGUI1HvSGBySUEQvrC
 VRQSjNUexnRHIk3L0iQTWwJaM6MElh2NM0BR4/I4EBUE353dWbUGCOBLWFIG0NQvMYEL
 +uNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lLWDb1QANHeU0tDITDX2Se5UlYYAadlTb8UAohw65dA=;
 b=qAXYENaJ5WDQzuuJ0i5S4VazqG6Zrnk8eQIv9vc/OUsi5n94HHDHZLBvK1cRTNQ7VP
 Gr7UWnmfAiKzKGn/9xIz557LOscgCgd8NXkc6n3lpxi9lrrTAEFEIDKIiyPBLiKSZX92
 gv3glsbST1F1gukcVinDaa0bduiwLqCPmdvYRZ3ogBXWauH3nMqef1sWKNu/2o9a/weJ
 QhFxEXjMdEpbHBzdyyA0g5JfnmePtElW38vm08pLYJfi2ieqq6UXc0ht6ReEJkWsHYdg
 kGy8yx6opVkdsI4lnIaf9W9pkz3kItFUxUb8H63D+cfwtf53pt3w2Y/u0F3Ja7tf1d5U
 Om/g==
X-Gm-Message-State: AOAM533zXdiOWc2qX7Mh4MPzhKr5s6Ljb656KvaZj66sv0YwJ3hgbz5j
 MQFibZcPB9kbsnkS5QovvI4+O9yWAiA9CxNglQs=
X-Google-Smtp-Source: ABdhPJw1/7GKnKJYHkYeUjjSIqHHSSDLZrcsK2N+dSmEPyM7eId8BbBcs0vwEbBpPaYjIi8138ARe5f3y+BlWGKRzWU=
X-Received: by 2002:a05:6870:d205:b0:d3:52c0:2ba3 with SMTP id
 g5-20020a056870d20500b000d352c02ba3mr719256oac.96.1645095497621; Thu, 17 Feb
 2022 02:58:17 -0800 (PST)
MIME-Version: 1.0
References: <20220217090440.4468-1-qiang.yu@amd.com>
 <5d3fdd2c-e74a-49f4-2b28-32c06483236f@amd.com>
 <CAKGbVbtLTBJPF5eTu4rABUTBa8eqjQvqjo1AEUrzgPgYgCREuA@mail.gmail.com>
 <dac70c05-e712-d2e3-2267-278380895f1e@amd.com>
 <CAKGbVbvtLbDiKrX80-dMnipdLkTE+FP=g_mx37e12fuMtA1Y4Q@mail.gmail.com>
 <ca27a9c6-f390-a938-dd66-ac23f3b44dc4@amd.com>
In-Reply-To: <ca27a9c6-f390-a938-dd66-ac23f3b44dc4@amd.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Thu, 17 Feb 2022 18:58:06 +0800
Message-ID: <CAKGbVbv4UFCybS_OFj5UkDgevbrB5qe3pv+0nHv9WdefYhy6Ww@mail.gmail.com>
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

On Thu, Feb 17, 2022 at 6:39 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
>
>
> Am 17.02.22 um 11:13 schrieb Qiang Yu:
> > On Thu, Feb 17, 2022 at 5:46 PM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Am 17.02.22 um 10:40 schrieb Qiang Yu:
> >>> On Thu, Feb 17, 2022 at 5:15 PM Christian K=C3=B6nig
> >>> <christian.koenig@amd.com> wrote:
> >>>> Am 17.02.22 um 10:04 schrieb Qiang Yu:
> >>>>> Workstation application ANSA/META get this error dmesg:
> >>>>> [drm:amdgpu_gem_va_ioctl [amdgpu]] *ERROR* Couldn't update BO_VA (-=
16)
> >>>>>
> >>>>> This is caused by:
> >>>>> 1. create a 256MB buffer in invisible VRAM
> >>>>> 2. CPU map the buffer and access it causes vm_fault and try to move
> >>>>>       it to visible VRAM
> >>>>> 3. force visible VRAM space and traverse all VRAM bos to check if
> >>>>>       evicting this bo is valuable
> >>>>> 4. when checking a VM bo (in invisible VRAM), amdgpu_vm_evictable()
> >>>>>       will set amdgpu_vm->evicting, but latter due to not in visibl=
e
> >>>>>       VRAM, won't really evict it so not add it to amdgpu_vm->evict=
ed
> >>>>> 5. before next CS to clear the amdgpu_vm->evicting, user VM ops
> >>>>>       ioctl will pass amdgpu_vm_ready() (check amdgpu_vm->evicted)
> >>>>>       but fail in amdgpu_vm_bo_update_mapping() (check
> >>>>>       amdgpu_vm->evicting) and get this error log
> >>>>>
> >>>>> This error won't affect functionality as next CS will finish the
> >>>>> waiting VM ops. But we'd better make the amdgpu_vm->evicting
> >>>>> correctly reflact the vm status and clear the error log.
> >>>> Well NAK, that is intentional behavior.
> >>>>
> >>>> The VM page tables where considered for eviction, so setting the fla=
g is
> >>>> correct even when the page tables later on are not actually evicted.
> >>>>
> >>> But this will unnecessarily stop latter user VM ops in ioctl before C=
S
> >>> even when the VM bos are not evicted.
> >>> Won't this have any negative effect when could do better?
> >> No, this will have a positive effect. See the VM was already considere=
d
> >> for eviction because it is idle.
> >>
> >> Updating it immediately doesn't necessarily make sense, we should wait
> >> with that until its next usage.
> >>
> >> Additional to that this patch doesn't really fix the problem, it just
> >> mitigates it.
> >>
> >> Eviction can fail later on for a couple of reasons and we absolutely
> >> need to check the flag instead of the list in amdgpu_vm_ready().
> > The flag only for both flag and list? Looks like should be both as
> > the list indicate some vm page table need to be updated and could
> > delay the user update with the same logic as you described above.
>
> I think checking the flag should be enough. The issue is that the list
> was there initially, but to avoid race conditions we added the flag with
> separate lock protection later on.
>
But list and flag does not align always, there are cases like
list-empty/flag-set (this problem) and list-non-empty/flag-unset (non-vm bo
eviction). If only check flag list-non-empty/flag-unset change behavior.

Regards,
Qiang

> Regards,
> Christian.
>
> >
> > Regards,
> > Qiang
> >
> >> Regards,
> >> Christian.
> >>
> >>> Regards,
> >>> Qiang
> >>>
> >>>> What we should rather do is to fix amdgpu_vm_ready() to take a look =
at
> >>>> the flag instead of the linked list.
> >>>>
> >>>> Regards,
> >>>> Christian.
> >>>>
> >>>>> Signed-off-by: Qiang Yu <qiang.yu@amd.com>
> >>>>> ---
> >>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 85 ++++++++++++++----=
-------
> >>>>>     1 file changed, 47 insertions(+), 38 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_ttm.c
> >>>>> index 5a32ee66d8c8..88a27911054f 100644
> >>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> >>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> >>>>> @@ -1306,45 +1306,11 @@ uint64_t amdgpu_ttm_tt_pte_flags(struct amd=
gpu_device *adev, struct ttm_tt *ttm,
> >>>>>         return flags;
> >>>>>     }
> >>>>>
> >>>>> -/*
> >>>>> - * amdgpu_ttm_bo_eviction_valuable - Check to see if we can evict =
a buffer
> >>>>> - * object.
> >>>>> - *
> >>>>> - * Return true if eviction is sensible. Called by ttm_mem_evict_fi=
rst() on
> >>>>> - * behalf of ttm_bo_mem_force_space() which tries to evict buffer =
objects until
> >>>>> - * it can find space for a new object and by ttm_bo_force_list_cle=
an() which is
> >>>>> - * used to clean out a memory space.
> >>>>> - */
> >>>>> -static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_obje=
ct *bo,
> >>>>> -                                         const struct ttm_place *p=
lace)
> >>>>> +static bool amdgpu_ttm_mem_eviction_valuable(struct ttm_buffer_obj=
ect *bo,
> >>>>> +                                          const struct ttm_place *=
place)
> >>>>>     {
> >>>>>         unsigned long num_pages =3D bo->resource->num_pages;
> >>>>>         struct amdgpu_res_cursor cursor;
> >>>>> -     struct dma_resv_list *flist;
> >>>>> -     struct dma_fence *f;
> >>>>> -     int i;
> >>>>> -
> >>>>> -     /* Swapout? */
> >>>>> -     if (bo->resource->mem_type =3D=3D TTM_PL_SYSTEM)
> >>>>> -             return true;
> >>>>> -
> >>>>> -     if (bo->type =3D=3D ttm_bo_type_kernel &&
> >>>>> -         !amdgpu_vm_evictable(ttm_to_amdgpu_bo(bo)))
> >>>>> -             return false;
> >>>>> -
> >>>>> -     /* If bo is a KFD BO, check if the bo belongs to the current =
process.
> >>>>> -      * If true, then return false as any KFD process needs all it=
s BOs to
> >>>>> -      * be resident to run successfully
> >>>>> -      */
> >>>>> -     flist =3D dma_resv_shared_list(bo->base.resv);
> >>>>> -     if (flist) {
> >>>>> -             for (i =3D 0; i < flist->shared_count; ++i) {
> >>>>> -                     f =3D rcu_dereference_protected(flist->shared=
[i],
> >>>>> -                             dma_resv_held(bo->base.resv));
> >>>>> -                     if (amdkfd_fence_check_mm(f, current->mm))
> >>>>> -                             return false;
> >>>>> -             }
> >>>>> -     }
> >>>>>
> >>>>>         switch (bo->resource->mem_type) {
> >>>>>         case AMDGPU_PL_PREEMPT:
> >>>>> @@ -1377,10 +1343,53 @@ static bool amdgpu_ttm_bo_eviction_valuable=
(struct ttm_buffer_object *bo,
> >>>>>                 return false;
> >>>>>
> >>>>>         default:
> >>>>> -             break;
> >>>>> +             return ttm_bo_eviction_valuable(bo, place);
> >>>>>         }
> >>>>> +}
> >>>>>
> >>>>> -     return ttm_bo_eviction_valuable(bo, place);
> >>>>> +/*
> >>>>> + * amdgpu_ttm_bo_eviction_valuable - Check to see if we can evict =
a buffer
> >>>>> + * object.
> >>>>> + *
> >>>>> + * Return true if eviction is sensible. Called by ttm_mem_evict_fi=
rst() on
> >>>>> + * behalf of ttm_bo_mem_force_space() which tries to evict buffer =
objects until
> >>>>> + * it can find space for a new object and by ttm_bo_force_list_cle=
an() which is
> >>>>> + * used to clean out a memory space.
> >>>>> + */
> >>>>> +static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_obje=
ct *bo,
> >>>>> +                                         const struct ttm_place *p=
lace)
> >>>>> +{
> >>>>> +     struct dma_resv_list *flist;
> >>>>> +     struct dma_fence *f;
> >>>>> +     int i;
> >>>>> +
> >>>>> +     /* Swapout? */
> >>>>> +     if (bo->resource->mem_type =3D=3D TTM_PL_SYSTEM)
> >>>>> +             return true;
> >>>>> +
> >>>>> +     /* If bo is a KFD BO, check if the bo belongs to the current =
process.
> >>>>> +      * If true, then return false as any KFD process needs all it=
s BOs to
> >>>>> +      * be resident to run successfully
> >>>>> +      */
> >>>>> +     flist =3D dma_resv_shared_list(bo->base.resv);
> >>>>> +     if (flist) {
> >>>>> +             for (i =3D 0; i < flist->shared_count; ++i) {
> >>>>> +                     f =3D rcu_dereference_protected(flist->shared=
[i],
> >>>>> +                             dma_resv_held(bo->base.resv));
> >>>>> +                     if (amdkfd_fence_check_mm(f, current->mm))
> >>>>> +                             return false;
> >>>>> +             }
> >>>>> +     }
> >>>>> +
> >>>>> +     /* Check by different mem type. */
> >>>>> +     if (!amdgpu_ttm_mem_eviction_valuable(bo, place))
> >>>>> +             return false;
> >>>>> +
> >>>>> +     /* VM bo should be checked at last because it will mark VM ev=
icting. */
> >>>>> +     if (bo->type =3D=3D ttm_bo_type_kernel)
> >>>>> +             return amdgpu_vm_evictable(ttm_to_amdgpu_bo(bo));
> >>>>> +
> >>>>> +     return true;
> >>>>>     }
> >>>>>
> >>>>>     static void amdgpu_ttm_vram_mm_access(struct amdgpu_device *ade=
v, loff_t pos,
>
