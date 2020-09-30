Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAD527E5BD
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 11:55:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D57D6E039;
	Wed, 30 Sep 2020 09:55:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B5656E039
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 09:55:46 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j2so1064722wrx.7
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 02:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=QnJosaKk+6UlgjPbZmsy+2/c8gwAv95gBGvvrsjNxEg=;
 b=eT9cqWNgDxAhVmLEzVeN5IAAnwRLaybn8Mw9iEkk16/nBoIH2EO+om9rA1o9iTl2A+
 b3pC94nsrkanU9ZVS+jp50g4xt7tyJV8pijzVboQKo0nr+Ph6t1pgySRTqV1BDcss6hH
 ys1OUca6Z1XZq45Hy8JxEIia8LP5mrsHYGJtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=QnJosaKk+6UlgjPbZmsy+2/c8gwAv95gBGvvrsjNxEg=;
 b=Juwc+tsQSVzCCcAcVfDyotsU4OpBFAuei0XK6zI1dPaebMtA3fh+Rf9TL/F6AqcWkN
 gVL5qKdMzFuS2d1LqTYQ8Zot6tMgl8AtKYHbMKKC3H8lhirzTiUTfMxvUOB6E6Oekzo9
 DEelhLfPj46la7l7MLWVMG4ApPgSPgBfX/G3LolzyesMh+XQs0OEXl2E2l4k75cP0eFO
 3kdfJqxnsJZ745JG66lPdwzXFr52i3PE84IRqebBUll0ERbh1a7Q5Ge7IRPovH2yPNJT
 YKt8ok4qHeJlNudSvnDrHu5rDRXSG9laA8ymcQ73NC+ffYEeIGGXtilNu8YoFhY46P04
 zqpA==
X-Gm-Message-State: AOAM531jhvaSxYwqW/JTQRlAfsKVATMGfFNzSwtkehFmsDa3LLEFPwt6
 45dBygd7srcJfzvcHJ5MH+DsWQ==
X-Google-Smtp-Source: ABdhPJzwgGtmE4gHk7un+VHQGLY1/OmHMFNtHzY+QeRZgyppjz9cdlSzmPs669vfGphmd66u+lMFrw==
X-Received: by 2002:adf:edd2:: with SMTP id v18mr2173577wro.242.1601459745199; 
 Wed, 30 Sep 2020 02:55:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x10sm1832792wmi.37.2020.09.30.02.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 02:55:44 -0700 (PDT)
Date: Wed, 30 Sep 2020 11:55:42 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH 3/3] RFC: dma-buf: Add an API for importing and exporting
 sync files (v5)
Message-ID: <20200930095542.GY438822@phenom.ffwll.local>
Mail-Followup-To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 Jason Ekstrand <jason@jlekstrand.net>,
 Chenbo Feng <fengc@google.com>, daniels@collabora.com,
 jajones@nvidia.com, linux-kernel@vger.kernel.org,
 Greg Hackmann <ghackmann@google.com>,
 linaro-mm-sig@lists.linaro.org, hoegsberg@google.com,
 dri-devel@lists.freedesktop.org, jessehall@google.com,
 airlied@redhat.com, christian.koenig@amd.com,
 linux-media@vger.kernel.org
References: <20200311034351.1275197-3-jason@jlekstrand.net>
 <20200317212115.419358-1-jason@jlekstrand.net>
 <64eed158-22a8-10a7-7686-c972f8542649@daenzer.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <64eed158-22a8-10a7-7686-c972f8542649@daenzer.net>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: daniels@collabora.com, daniel.vetter@ffwll.ch, jajones@nvidia.com,
 Chenbo Feng <fengc@google.com>, linux-kernel@vger.kernel.org,
 Greg Hackmann <ghackmann@google.com>, linaro-mm-sig@lists.linaro.org,
 hoegsberg@google.com, dri-devel@lists.freedesktop.org,
 Jason Ekstrand <jason@jlekstrand.net>, airlied@redhat.com,
 jessehall@google.com, christian.koenig@amd.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 30, 2020 at 11:39:06AM +0200, Michel D=E4nzer wrote:
> On 2020-03-17 10:21 p.m., Jason Ekstrand wrote:
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

> > v2 (Jason Ekstrand):
> >   - Use a wrapper dma_fence_array of all fences including the new one
> >     when importing an exclusive fence.
> > =

> > v3 (Jason Ekstrand):
> >   - Lock around setting shared fences as well as exclusive
> >   - Mark SIGNAL_SYNC_FILE as a read-write ioctl.
> >   - Initialize ret to 0 in dma_buf_wait_sync_file
> > =

> > v4 (Jason Ekstrand):
> >   - Use the new dma_resv_get_singleton helper
> > =

> > v5 (Jason Ekstrand):
> >   - Rename the IOCTLs to import/export rather than wait/signal
> >   - Drop the WRITE flag and always get/set the exclusive fence
> > =

> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> =

> What's the status of this? DMA_BUF_IOCTL_EXPORT_SYNC_FILE would be useful
> for Wayland compositors to wait for client buffers to become ready without
> being prone to getting delayed by later HW access to them, so it would be
> nice to merge that at least (if DMA_BUF_IOCTL_IMPORT_SYNC_FILE is still
> controversial).

I think the missing bits are just the usual stuff
- igt testcases
- userspace using the new ioctls
- review of the entire pile

I don't think there's any fundamental objections aside from "no one ever
pushed this over the finish line".

Cheers, Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
