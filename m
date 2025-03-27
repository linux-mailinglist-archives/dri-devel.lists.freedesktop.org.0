Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71761A733B8
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 14:58:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4F0D10E8E4;
	Thu, 27 Mar 2025 13:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gGL2rZ/3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C03A010E8DB;
 Thu, 27 Mar 2025 13:58:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A74CB5C66B0;
 Thu, 27 Mar 2025 13:56:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE7DBC4CEDD;
 Thu, 27 Mar 2025 13:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743083928;
 bh=XzPi1F5SWwXKj7971VQiK+0IGADDRlyQ0aTFTKn+bMc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gGL2rZ/327aXTpediX2cwplMLST5kv1Z3VS0C7/mulCj00FyRK2/kexMQutKMT8u5
 5bEd0k7dmxXmRkePz7vgXSrWCSkADyrrTWW7yU1s3hIu5fz/RMbin2PLQMewXAmuNa
 jGD391Ewnk/Y9ScUb9yUMI4XQQIxbUViL3CcAF9CRHKpJcuTzetUAQSYfl82Y0U+2f
 GK6s+A53pbMg9DGIW3Ksuttpr+dMFGhY5NHIGVguDWGIwIbYpxkSpdR5Z7H9FIvUJr
 VXUoGRVMqPT/p6x1USE5gbDo/whfCwlYnqOVWtxr946jxdX5FhX1QrVHYDPZnJg76d
 laM7CFg1HnclA==
Date: Thu, 27 Mar 2025 14:58:44 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: M Henning <mhenning@darkrefraction.com>
Cc: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/nouveau: DRM_NOUVEAU_SET_ZCULL_CTXSW_BUFFER
Message-ID: <Z-VZlIc3E8ZQQmXa@cassiopeiae>
References: <20250312213746.228042-1-mhenning@darkrefraction.com>
 <20250312213746.228042-3-mhenning@darkrefraction.com>
 <Z9xfoS89yimS1Sb3@pollux>
 <CAAgWFh2RtCwaKNinX9X4BjwNiaBj5BF_ypzbqoqV4LJgN4cPvg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAgWFh2RtCwaKNinX9X4BjwNiaBj5BF_ypzbqoqV4LJgN4cPvg@mail.gmail.com>
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

On Fri, Mar 21, 2025 at 07:00:57PM -0400, M Henning wrote:
> This is a pointer in the gpu's virtual address space. It must be
> aligned according to ctxsw_align and be at least ctxsw_size bytes
> (where those values come from the nouveau_abi16_ioctl_get_zcull_info
> structure). I'll change the description to say that much.
> 
> Yes, this is GEM-backed. I'm actually not entirely sure what the
> requirements are here, since this part is reverse-engineered. I think
> NOUVEAU_GEM_DOMAIN_VRAM and NOUVEAU_GEM_DOMAIN_GART are both okay. The
> proprietary driver allocates this buffer using
> NV_ESC_RM_VID_HEAP_CONTROL and sets attr = NVOS32_ATTR_LOCATION_ANY |
> NVOS32_ATTR_PAGE_SIZE_BIG | NVOS32_ATTR_PHYSICALITY_CONTIGUOUS, attr2
> = NVOS32_ATTR2_GPU_CACHEABLE_YES | NVOS32_ATTR2_ZBC_PREFER_NO_ZBC.

(Please do not top post.)

What I mean is how do you map the backing GEM into the GPU's virtual address
space? Since it's bound to a channel, I assume that it must be ensured it's
properly mapped when work is pushed to the channel. Is it mapped through
VM_BIND?

> 
> On Thu, Mar 20, 2025 at 2:34 PM Danilo Krummrich <dakr@kernel.org> wrote:
> >
> > On Wed, Mar 12, 2025 at 05:36:15PM -0400, Mel Henning wrote:
> > > diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
> >
> > Same here, please split the uAPI change in a separate commit.
> >
> > > index 33361784eb4e..e9638f4dd7e6 100644
> > > --- a/include/uapi/drm/nouveau_drm.h
> > > +++ b/include/uapi/drm/nouveau_drm.h
> > > @@ -448,6 +448,20 @@ struct drm_nouveau_get_zcull_info {
> > >       __u32 ctxsw_align;
> > >  };
> > >
> > > +struct drm_nouveau_set_zcull_ctxsw_buffer {
> > > +     /**
> > > +      * @ptr: The virtual address for the buffer, or null to bind nothing
> > > +      */
> > > +     __u64 addr;
> >
> > What is this buffer? Is this a GEM object backed buffer? How is it mapped?
> >
> > > +
> > > +     /**
> > > +      * @channel: the channel to set the buffer on
> > > +      */
> > > +     __u32 channel;
> > > +
> > > +     __u32 pad;
> > > +};
> > > +
> > >  #define DRM_NOUVEAU_GETPARAM           0x00
> > >  #define DRM_NOUVEAU_SETPARAM           0x01 /* deprecated */
> > >  #define DRM_NOUVEAU_CHANNEL_ALLOC      0x02
> > > @@ -462,6 +476,7 @@ struct drm_nouveau_get_zcull_info {
> > >  #define DRM_NOUVEAU_VM_BIND            0x11
> > >  #define DRM_NOUVEAU_EXEC               0x12
> > >  #define DRM_NOUVEAU_GET_ZCULL_INFO     0x13
> > > +#define DRM_NOUVEAU_SET_ZCULL_CTXSW_BUFFER 0x14
> > >  #define DRM_NOUVEAU_GEM_NEW            0x40
> > >  #define DRM_NOUVEAU_GEM_PUSHBUF        0x41
> > >  #define DRM_NOUVEAU_GEM_CPU_PREP       0x42
> > > @@ -532,6 +547,7 @@ struct drm_nouveau_svm_bind {
> > >  #define DRM_IOCTL_NOUVEAU_EXEC               DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_EXEC, struct drm_nouveau_exec)
> > >
> > >  #define DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO     DRM_IOR (DRM_COMMAND_BASE + DRM_NOUVEAU_GET_ZCULL_INFO, struct drm_nouveau_get_zcull_info)
> > > +#define DRM_IOCTL_NOUVEAU_SET_ZCULL_CTXSW_BUFFER  DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_SET_ZCULL_CTXSW_BUFFER, struct drm_nouveau_set_zcull_ctxsw_buffer)
> > >  #if defined(__cplusplus)
> > >  }
> > >  #endif
> > > --
> > > 2.48.1
> > >
