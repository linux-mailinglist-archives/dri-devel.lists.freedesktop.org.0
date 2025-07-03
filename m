Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C963DAF7F7B
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 19:58:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257B610E1BA;
	Thu,  3 Jul 2025 17:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="ASETi4vW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com
 [91.218.175.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5149F8999E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 17:58:27 +0000 (UTC)
Date: Thu, 3 Jul 2025 10:58:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1751565505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Fj6KQclZqeFpLN0gNLDvbr5suNhr7xIeUAIdEMiKF8=;
 b=ASETi4vWcvHEzx3XHwii/YSR4SXC9Sj4YcHmcUNyhYZluQHNo7k1vculs7t0mdTUbMY2w9
 R0QWVOQXEL9eNyq+3XVFgXukCmefvP1ebFWAecD9d2m4E67UP4YxZUkHF3q4wUGWO2NepZ
 9v2om1BSV5Er8cV5BCaRGzxgtMVJ0w4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: David Airlie <airlied@redhat.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>, 
 Christian Koenig <christian.koenig@amd.com>, Dave Chinner <david@fromorbit.com>,
 Kairui Song <kasong@tencent.com>
Subject: Re: [PATCH 17/17] amdgpu: add support for memory cgroups
Message-ID: <3b5t4djauhnbvhqjwuktrcphlvahpdyi2b6j3ktoapakxcvpgz@zjpokeykiwy7>
References: <20250630045005.1337339-1-airlied@gmail.com>
 <20250630045005.1337339-18-airlied@gmail.com>
 <wejb2ykaltp5gtufrzz3mwp43hrxugzuubclt4amrpr4koznan@cb7dfmnvik6a>
 <CAMwc25rPTiTshBMvHeGr=8kwC+MJdSA=UdKucybTwSxbuWvk4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMwc25rPTiTshBMvHeGr=8kwC+MJdSA=UdKucybTwSxbuWvk4A@mail.gmail.com>
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

On Thu, Jul 03, 2025 at 12:53:44PM +1000, David Airlie wrote:
> On Thu, Jul 3, 2025 at 2:03 AM Shakeel Butt <shakeel.butt@linux.dev> wrote:
> >
> > On Mon, Jun 30, 2025 at 02:49:36PM +1000, Dave Airlie wrote:
> > > From: Dave Airlie <airlied@redhat.com>
> > >
> > > This adds support for adding a obj cgroup to a buffer object,
> > > and passing in the placement flags to make sure it's accounted
> > > properly.
> > >
> > > Signed-off-by: Dave Airlie <airlied@redhat.com>
> > > ---
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    |  2 ++
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 13 +++++++++----
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  1 +
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  2 ++
> > >  4 files changed, 14 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > > index e5e33a68d935..d250183bab03 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > > @@ -198,6 +198,7 @@ static void amdgpu_gem_object_free(struct drm_gem_object *gobj)
> > >       struct amdgpu_bo *aobj = gem_to_amdgpu_bo(gobj);
> > >
> > >       amdgpu_hmm_unregister(aobj);
> > > +     obj_cgroup_put(aobj->tbo.objcg);
> > >       ttm_bo_put(&aobj->tbo);
> > >  }
> > >
> > > @@ -225,6 +226,7 @@ int amdgpu_gem_object_create(struct amdgpu_device *adev, unsigned long size,
> > >       bp.domain = initial_domain;
> > >       bp.bo_ptr_size = sizeof(struct amdgpu_bo);
> > >       bp.xcp_id_plus1 = xcp_id_plus1;
> > > +     bp.objcg = get_obj_cgroup_from_current();
> >
> > In what context this function is called? Is that the same for
> > ttm_pool_alloc_page()? Is remote charging happening in
> > ttm_pool_alloc_page()?
> >
> 
> No, this function is called from userspace ioctl paths that allocate
> GPU objects (GEM objects).
> 
> The objects are lazily allocated, so this might not trigger any pages
> being bound to the object, until it is populated, either via mapping +
> page faults or by being used in a GPU command submission, which is
> when the ttm_pool_alloc_page happens.
> 

For the mapping + page fault or GPU command submission, can there be a
case where 'current' is not in the same cgroup as the task which has
called amdgpu_gem_object_create() through ioctl? Can the allocation
happen in kthread or workqueue or irq?
