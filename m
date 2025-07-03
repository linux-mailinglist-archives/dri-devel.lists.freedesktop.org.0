Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A2FAF81BC
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 22:06:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB4B10E1CA;
	Thu,  3 Jul 2025 20:06:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="v31CKCEF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com
 [91.218.175.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0634110E1CA
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 20:06:14 +0000 (UTC)
Date: Thu, 3 Jul 2025 13:06:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1751573171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=98sE5XXwek1MXD7aoZozn8TLYGtPuiUoHcJivbZOev0=;
 b=v31CKCEFw9QRak606ceHaDT5VDVf68+LhfFxkTxliLPhqLmxvSw0N3vkaffrOAO2MxZP22
 pUNxw3hHk3TepfPXK1oh3PPokw2B94I+51VveWFh/ydiJYxJl1H7EU2rHIbMBA1NI6Dtjd
 FHC+7sX7YTVj4NoaCqjKMWmhsw7SNRs=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: David Airlie <airlied@redhat.com>, Dave Airlie <airlied@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Johannes Weiner <hannes@cmpxchg.org>, 
 Dave Chinner <david@fromorbit.com>, Kairui Song <kasong@tencent.com>
Subject: Re: [PATCH 17/17] amdgpu: add support for memory cgroups
Message-ID: <jsmwlcpgsmhkwohao6t5eu3mhypumuqp2pvtbxxkkchivbg4vp@i4pcdsq5xflq>
References: <20250630045005.1337339-1-airlied@gmail.com>
 <20250630045005.1337339-18-airlied@gmail.com>
 <wejb2ykaltp5gtufrzz3mwp43hrxugzuubclt4amrpr4koznan@cb7dfmnvik6a>
 <CAMwc25rPTiTshBMvHeGr=8kwC+MJdSA=UdKucybTwSxbuWvk4A@mail.gmail.com>
 <3b5t4djauhnbvhqjwuktrcphlvahpdyi2b6j3ktoapakxcvpgz@zjpokeykiwy7>
 <0b887b01-6de3-4633-86f7-20f5b43eeb35@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0b887b01-6de3-4633-86f7-20f5b43eeb35@amd.com>
X-Migadu-Flow: FLOW_OUT
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

On Thu, Jul 03, 2025 at 08:15:09PM +0200, Christian König wrote:
> On 03.07.25 19:58, Shakeel Butt wrote:
> > On Thu, Jul 03, 2025 at 12:53:44PM +1000, David Airlie wrote:
> >> On Thu, Jul 3, 2025 at 2:03 AM Shakeel Butt <shakeel.butt@linux.dev> wrote:
> >>>
> >>> On Mon, Jun 30, 2025 at 02:49:36PM +1000, Dave Airlie wrote:
> >>>> From: Dave Airlie <airlied@redhat.com>
> >>>>
> >>>> This adds support for adding a obj cgroup to a buffer object,
> >>>> and passing in the placement flags to make sure it's accounted
> >>>> properly.
> >>>>
> >>>> Signed-off-by: Dave Airlie <airlied@redhat.com>
> >>>> ---
> >>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    |  2 ++
> >>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 13 +++++++++----
> >>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  1 +
> >>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  2 ++
> >>>>  4 files changed, 14 insertions(+), 4 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> >>>> index e5e33a68d935..d250183bab03 100644
> >>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> >>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> >>>> @@ -198,6 +198,7 @@ static void amdgpu_gem_object_free(struct drm_gem_object *gobj)
> >>>>       struct amdgpu_bo *aobj = gem_to_amdgpu_bo(gobj);
> >>>>
> >>>>       amdgpu_hmm_unregister(aobj);
> >>>> +     obj_cgroup_put(aobj->tbo.objcg);
> >>>>       ttm_bo_put(&aobj->tbo);
> >>>>  }
> >>>>
> >>>> @@ -225,6 +226,7 @@ int amdgpu_gem_object_create(struct amdgpu_device *adev, unsigned long size,
> >>>>       bp.domain = initial_domain;
> >>>>       bp.bo_ptr_size = sizeof(struct amdgpu_bo);
> >>>>       bp.xcp_id_plus1 = xcp_id_plus1;
> >>>> +     bp.objcg = get_obj_cgroup_from_current();
> >>>
> >>> In what context this function is called? Is that the same for
> >>> ttm_pool_alloc_page()? Is remote charging happening in
> >>> ttm_pool_alloc_page()?
> >>>
> >>
> >> No, this function is called from userspace ioctl paths that allocate
> >> GPU objects (GEM objects).
> >>
> >> The objects are lazily allocated, so this might not trigger any pages
> >> being bound to the object, until it is populated, either via mapping +
> >> page faults or by being used in a GPU command submission, which is
> >> when the ttm_pool_alloc_page happens.
> >>
> > 
> > For the mapping + page fault or GPU command submission, can there be a
> > case where 'current' is not in the same cgroup as the task which has
> > called amdgpu_gem_object_create() through ioctl? Can the allocation
> > happen in kthread or workqueue or irq?
> 
> Yes, in some use cases that is actually the most common way of ending up in the memory allocation.
> 
> Background is that the first one who touches it actually does the allocation.

Do you mean a task in cgroup A does amdgpu_gem_object_create() and then
the actual allocation can happen in the task in cgroup B?

> 
> BTW: It might be a good idea to not only limit the amount of memory you actually have allocated, but also how much you wanted to allocate.

Do you mean accounting and limiting the reservations? Something like
what hugetlb cgroup provides?
