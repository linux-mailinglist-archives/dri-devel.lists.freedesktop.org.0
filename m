Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C06A7497B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 12:48:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0286410E9F2;
	Fri, 28 Mar 2025 11:48:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oDeBYnut";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54D610E1AC;
 Fri, 28 Mar 2025 11:48:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 491C65C57E2;
 Fri, 28 Mar 2025 11:46:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88576C4CEE4;
 Fri, 28 Mar 2025 11:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743162521;
 bh=ubfo+6G4HyjsKC9Qt3QnXYGYKpuzAJVzYi8an+53eRM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oDeBYnutRbhSlImrMHaUNapXSWsPH8Ker34IgZ//2QTy1X2XnO4VIjic/vsgri0u4
 lgdtNIWuS1m6mzwD0NByNenm0aBtPV7oTgIpI3wKXvcwOl7e2T5D26P1xdKk3YCQK2
 B14D8DZOrDEEjOhlvvsUbElScE+3Ke6IgtGIcQl55vfj2bIL3mn92W76c3JRUXYzn7
 B+xS71+Kzxo0t4wtjXZsJnbZeYICpX8pb3LB+gx5cxBUKCdYOpslF7ZBSBrE3PNYLx
 JdnN4I8ayuN8NsXLL0iyfJel6AuAJZjr7IHhXR7YYfr+wh8m5M2RA3pI8RxDCXcrHL
 wnj5nXv1MaRzA==
Date: Fri, 28 Mar 2025 12:48:36 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: M Henning <mhenning@darkrefraction.com>
Cc: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/nouveau: DRM_NOUVEAU_SET_ZCULL_CTXSW_BUFFER
Message-ID: <Z-aMlNW2-MvjETXV@pollux>
References: <20250312213746.228042-1-mhenning@darkrefraction.com>
 <20250312213746.228042-3-mhenning@darkrefraction.com>
 <Z9xfoS89yimS1Sb3@pollux>
 <CAAgWFh2RtCwaKNinX9X4BjwNiaBj5BF_ypzbqoqV4LJgN4cPvg@mail.gmail.com>
 <Z-VZlIc3E8ZQQmXa@cassiopeiae>
 <CAAgWFh2F-MH_U1V6SY_Z3nWz0_meyvAcWjfUiEoXzpW697oi7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAgWFh2F-MH_U1V6SY_Z3nWz0_meyvAcWjfUiEoXzpW697oi7w@mail.gmail.com>
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

On Thu, Mar 27, 2025 at 03:01:54PM -0400, M Henning wrote:
> On Thu, Mar 27, 2025 at 9:58 AM Danilo Krummrich <dakr@kernel.org> wrote:
> >
> > On Fri, Mar 21, 2025 at 07:00:57PM -0400, M Henning wrote:
> > > This is a pointer in the gpu's virtual address space. It must be
> > > aligned according to ctxsw_align and be at least ctxsw_size bytes
> > > (where those values come from the nouveau_abi16_ioctl_get_zcull_info
> > > structure). I'll change the description to say that much.
> > >
> > > Yes, this is GEM-backed. I'm actually not entirely sure what the
> > > requirements are here, since this part is reverse-engineered. I think
> > > NOUVEAU_GEM_DOMAIN_VRAM and NOUVEAU_GEM_DOMAIN_GART are both okay. The
> > > proprietary driver allocates this buffer using
> > > NV_ESC_RM_VID_HEAP_CONTROL and sets attr = NVOS32_ATTR_LOCATION_ANY |
> > > NVOS32_ATTR_PAGE_SIZE_BIG | NVOS32_ATTR_PHYSICALITY_CONTIGUOUS, attr2
> > > = NVOS32_ATTR2_GPU_CACHEABLE_YES | NVOS32_ATTR2_ZBC_PREFER_NO_ZBC.
> >
> > (Please do not top post.)
> >
> > What I mean is how do you map the backing GEM into the GPU's virtual address
> > space? Since it's bound to a channel, I assume that it must be ensured it's
> > properly mapped when work is pushed to the channel. Is it mapped through
> > VM_BIND?
> 
> Yes. The userspace code for this is here:
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33861/diffs?commit_id=0c4baab863730f9fc8b417834ffcbb400f11d617
> It calls into the usual function for driver internal allocations
> (nvkmd_dev_alloc_mem) which calls VM_BIND internally.

BOs mapped through VM_BIND are prone to eviction, is this a problem here, or is
it fine if it is only ensured that this mapping is valid for the duration of
subsequent EXEC jobs?

Does the mapping need to be valid when DRM_NOUVEAU_SET_ZCULL_CTXSW_BUFFER is
called? If so, how is this ensured?

Can DRM_NOUVEAU_SET_ZCULL_CTXSW_BUFFER be called in between multiple
DRM_NOUVEAU_EXEC calls?

Does it maybe need an async mode, such as EXEC and VM_BIND? (To me it doesn't
seem to be the case, but those questions still need an answer.)

I also think we should document those things.

> I don't understand: why is this line of questioning important?

By sending those patches you ask me as the maintainer of the project to take
resposibility of your changes. In this case it even goes further. In fact, you
ask me to take resposibility of a new interface, which, since it is a uAPI, can
*never* be removed in the future after being released.

It is part of my job to act responsibly, which includes understanding what the
interface does, how it is intended to be used, whether it is sufficient for its
purpose or if it has any flaws.

> 
> > >
> > > On Thu, Mar 20, 2025 at 2:34 PM Danilo Krummrich <dakr@kernel.org> wrote:
> > > >
> > > > On Wed, Mar 12, 2025 at 05:36:15PM -0400, Mel Henning wrote:
> > > > > diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
> > > >
> > > > Same here, please split the uAPI change in a separate commit.
> > > >
> > > > > index 33361784eb4e..e9638f4dd7e6 100644
> > > > > --- a/include/uapi/drm/nouveau_drm.h
> > > > > +++ b/include/uapi/drm/nouveau_drm.h
> > > > > @@ -448,6 +448,20 @@ struct drm_nouveau_get_zcull_info {
> > > > >       __u32 ctxsw_align;
> > > > >  };
> > > > >
> > > > > +struct drm_nouveau_set_zcull_ctxsw_buffer {
> > > > > +     /**
> > > > > +      * @ptr: The virtual address for the buffer, or null to bind nothing
> > > > > +      */
> > > > > +     __u64 addr;
> > > >
> > > > What is this buffer? Is this a GEM object backed buffer? How is it mapped?
