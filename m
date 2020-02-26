Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D20A716FB94
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 11:05:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 213FB6E42F;
	Wed, 26 Feb 2020 10:05:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E79C96E42F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 10:05:27 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id v2so1122824wrp.12
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 02:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=Al3H6KZgkGIqfcdoyxiez7m9SAUTRWEuD27a6Q2autQ=;
 b=j0M98yjaogcYjsgzW0y5ZqhH0fbl9VDStEvkaeoC/Q8KpdrZBUdsjqGDvtlGHy73Yv
 MbhkBqhePnuoVrcclW+uiVBJNmeFp5GrtpeC47jAkJa/XoMRzzcdwu/+jc3KPbbb7QYN
 s7YEp+3QBxlkwANz8hrslsSbxbtlszU3kIxWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=Al3H6KZgkGIqfcdoyxiez7m9SAUTRWEuD27a6Q2autQ=;
 b=K/OXpJkbCrioziG4HSZWZSlq0LzQNaJr1yWK9kGOF7L3tbBjpXuAExDDMcRt7LF6VZ
 gc+eQEMMWqY/x9PIyLX0Fd8e3xCnV/bkbckPVp48DoDOeUlC5RSdU2Kz39UD2Qp/KLCL
 Mor1xM7YACjykeFmqyNxOAstJgE29HSBCwKkVPY48nRxH73+MEe2U9A6NSRDJ2MWbKny
 rPGaSukMYR0FiRoTGu2BA+4RpgJVbUZGs37AvBXCn2I5TkXF7UUQjxpqH7Ixa8zEj9BS
 Z3THt9/8m9hVg9oNyuSVOH38xvyTuWhgeGLvl2ryfXf5CFA9v0XecDlGuqvpJiZp83rB
 zUow==
X-Gm-Message-State: APjAAAXEeYpgVIZhmknf5Wf5dOyz6kDDQL+a89m5g114VTydvXlDI2yL
 SDMB6Le5yD7TMDXxUR9lh+uG4A==
X-Google-Smtp-Source: APXvYqx4YFv94SVwpTw1EAbdnPvzNbZqxL94kJt3jNH24FAyl1JpVrm+58bVHWDTC6hYHA1gQNGYMQ==
X-Received: by 2002:adf:a114:: with SMTP id o20mr3560754wro.7.1582711526516;
 Wed, 26 Feb 2020 02:05:26 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w1sm2607819wro.72.2020.02.26.02.05.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 02:05:25 -0800 (PST)
Date: Wed, 26 Feb 2020 11:05:23 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] RFC: dma-buf: Add an API for importing and exporting
 sync files
Message-ID: <20200226100523.GQ2363188@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, 
 Jason Ekstrand <jason@jlekstrand.net>, airlied@redhat.com,
 jessehall@google.com, jajones@nvidia.com, bas@basnieuwenhuizen.nl,
 daniels@collabora.com, hoegsberg@google.com,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Chenbo Feng <fengc@google.com>,
 Greg Hackmann <ghackmann@google.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
References: <20200225235856.975366-1-jason@jlekstrand.net>
 <8066d8b2-dd6a-10ef-a7bb-2c18a0661912@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8066d8b2-dd6a-10ef-a7bb-2c18a0661912@amd.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Chenbo Feng <fengc@google.com>, daniels@collabora.com,
 daniel.vetter@ffwll.ch, jajones@nvidia.com, linux-kernel@vger.kernel.org,
 Greg Hackmann <ghackmann@google.com>, linaro-mm-sig@lists.linaro.org,
 hoegsberg@google.com, dri-devel@lists.freedesktop.org,
 Jason Ekstrand <jason@jlekstrand.net>, airlied@redhat.com,
 jessehall@google.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 26, 2020 at 10:16:05AM +0100, Christian K=F6nig wrote:
> Hi Jason,
> =

> Am 26.02.20 um 00:58 schrieb Jason Ekstrand:
> > Explicit synchronization is the future.  At least, that seems to be what
> > most userspace APIs are agreeing on at this point.  However, most of our
> > Linux APIs (both userspace and kernel UAPI) are currently built around
> > implicit synchronization with dma-buf.  While work is ongoing to change
> > many of the userspace APIs and protocols to an explicit synchronization
> > model, switching over piecemeal is difficult due to the number of
> > potential components involved.  On the kernel side, many drivers use
> > dma-buf including GPU (3D/compute), display, v4l, and others.  In
> > userspace, we have X11, several Wayland compositors, 3D drivers, compute
> > drivers (OpenCL etc.), media encode/decode, and the list goes on.
> > =

> > This patch provides a path forward by allowing userspace to manually
> > manage the fences attached to a dma-buf.  Alternatively, one can think
> > of this as making dma-buf's implicit synchronization simply a carrier
> > for an explicit fence.  This is accomplished by adding two IOCTLs to
> > dma-buf for importing and exporting a sync file to/from the dma-buf.
> > This way a userspace component which is uses explicit synchronization,
> > such as a Vulkan driver, can manually set the write fence on a buffer
> > before handing it off to an implicitly synchronized component such as a
> > Wayland compositor or video encoder.  In this way, each of the different
> > components can be upgraded to an explicit synchronization model one at a
> > time as long as the userspace pieces connecting them are aware of it and
> > import/export fences at the right times.
> > =

> > There is a potential race condition with this API if userspace is not
> > careful.  A typical use case for implicit synchronization is to wait for
> > the dma-buf to be ready, use it, and then signal it for some other
> > component.  Because a sync_file cannot be created until it is guaranteed
> > to complete in finite time, userspace can only signal the dma-buf after
> > it has already submitted the work which uses it to the kernel and has
> > received a sync_file back.  There is no way to atomically submit a
> > wait-use-signal operation.  This is not, however, really a problem with
> > this API so much as it is a problem with explicit synchronization
> > itself.  The way this is typically handled is to have very explicit
> > ownership transfer points in the API or protocol which ensure that only
> > one component is using it at any given time.  Both X11 (via the PRESENT
> > extension) and Wayland provide such ownership transfer points via
> > explicit present and idle messages.
> > =

> > The decision was intentionally made in this patch to make the import and
> > export operations IOCTLs on the dma-buf itself rather than as a DRM
> > IOCTL.  This makes it the import/export operation universal across all
> > components which use dma-buf including GPU, display, v4l, and others.
> > It also means that a userspace component can do the import/export
> > without access to the DRM fd which may be tricky to get in cases where
> > the client communicates with DRM via a userspace API such as OpenGL or
> > Vulkan.  At a future date we may choose to add direct import/export APIs
> > to components such as drm_syncobj to avoid allocating a file descriptor
> > and going through two ioctls.  However, that seems to be something of a
> > micro-optimization as import/export operations are likely to happen at a
> > rate of a few per frame of rendered or decoded video.
> > =

> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > ---
> > =

> > This is marked as an RFC because I intend it to start a discussion about
> > how to solve a problem.  The current patch compiles but that's it for n=
ow.
> > I'll be writing IGT tests and Vulkan driver patches which exercise it o=
ver
> > the next couple of days.  In the mean time, feel free to tell me why you
> > think this is a great and/or terrible idea. :-)
> =

> For the exporting part I think it is an absolutely great idea because it
> simplifies compatibility with explicit sync quite a bit.
> =

> But for the importing part it is a clear NAK at the moment. See we can't
> allow userspace to mess with DMA-buf fences in that way because it rips o=
pen
> a security hole you can push an elephant through.
> =

> Just imagine that you access some DMA-buf with a shader and that operation
> is presented as a fence on the DMA-bufs reservation object. And now you c=
an
> go ahead and replace that fence and free up the memory.
> =

> Tricking the Linux kernel into allocating page tables in that freed memory
> is trivial and that's basically it you can overwrite page tables with your
> shader and gain access to all of system memory :)
> =

> What we could do is to always make sure that the added fences will comple=
te
> later than the already existing ones, but that is also rather tricky to g=
et
> right. I wouldn't do that if we don't have a rather big use case for this.

I think the main use-case for adding a fence is adding a write fence for
vk winsys buffers, which run without any sync at all. So essentially what
we'd do is promote one of the read fences which are already attached to be
the write fence.

But yeah making sure we don't break any of the dma_resv guarantees about
how these fences works is going to be somewhat tricky. Probably can reuse
a big chunk of the fence container work we've done for syncobj timelines,
since they have some of the same issues of having to chain fences to not
break the world.
-Daniel

> =

> Regards,
> Christian.
> =

> > =

> > --Jason
> [SNIP]

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
