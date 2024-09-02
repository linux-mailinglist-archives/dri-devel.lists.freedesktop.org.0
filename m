Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4868D9688A9
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 15:24:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA4310E2E0;
	Mon,  2 Sep 2024 13:24:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Xx0gDhvG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57EED10E2C7
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 13:23:58 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-374c4d4f219so995867f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 06:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1725283437; x=1725888237; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=efPl15V1l+5u4/RChdECm6cvCDhAA6NVnZS5yiPoaNI=;
 b=Xx0gDhvGwvhNcJlm+vdpdh/T1wQsDJb1RwB9wF8yG/WouvHx7nGJxLajeRsfMpks9c
 oom/slWrAX2ll839U0nJRNNm0q5v+ZfxsyhltSyI3haGQCu1r8D6NufRxG8zYmtW1oGL
 y7JcK/jkPorTC5NPQ5At8OSqh0NI/BQaROQDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725283437; x=1725888237;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=efPl15V1l+5u4/RChdECm6cvCDhAA6NVnZS5yiPoaNI=;
 b=rDBkFl5WWm1uhMvItaoYRrW6dZCaVkevODtsaDmASGj4QGUPBpcy5/PDCp1HXT8ojF
 cl3gBLKBEWCxM7sSDbTrYLbRGMRMoHgF4MRC1CO1ucfG8ZrwSReI1Xrv5JJm6ziYS6ej
 o8kyk84y9xLMC2GWzKntc0TaC6HloURWlmqD99xty5hMpKJ3nzZj2hIJd4qp4ndC3x1B
 SJr2YR6C3XQ3q7swj4UQjYOlDKeBmRMdzY62RAI8w3VgiDTdI8CxPNQmN5Bs0ca0C8RD
 d5YBaFHtOasq1bylBhuFa6Lyuv3eWLFTWXu3hRDk5VjopjVzpM493fOxlg0GqRzs9J3E
 cT2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzE+4Wj3WMucNikehO05kJ9zxHD5a7qAhq+hfAWoSa6fIE3DxabUXR71c8ZqsTUXT2vJV1MAVytwI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNNr4QDIMT4VZBOnwW63mZklO5p2M7V3fWlouprwywQLATlat6
 docy+RXoXuvJyK8way24tQCO2iYNZZBTevCZxhjcw6cZ4vy9zZO6W4RT/W/XQc8=
X-Google-Smtp-Source: AGHT+IGzbkYNVk3PW4YGoaTL6XpqatAYEXjpOymBN51E3+tBcMskuszvDCRg9UxgYCL5Yxy5lEJjtQ==
X-Received: by 2002:a5d:4e01:0:b0:374:bd03:ab7c with SMTP id
 ffacd0b85a97d-374eccc299bmr8905f8f.33.1725283436421; 
 Mon, 02 Sep 2024 06:23:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c5792acbsm4707601f8f.76.2024.09.02.06.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 06:23:56 -0700 (PDT)
Date: Mon, 2 Sep 2024 15:23:54 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
 kernel@collabora.com, Luben Tuikov <ltuikov89@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>
Subject: Re: [RFC PATCH] drm/sched: Fix a UAF on drm_sched_fence::sched
Message-ID: <ZtW8aiIhBA5KBLR6@phenom.ffwll.local>
References: <20240829171238.609481-1-boris.brezillon@collabora.com>
 <bdc018b8-3732-4123-a752-b4e0e7e150dc@amd.com>
 <ZtI9EMzHZW3DkHw/@DUT025-TGLU.fm.intel.com>
 <710b6946-ce8e-42ed-8df6-aa76bf0d5f3f@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <710b6946-ce8e-42ed-8df6-aa76bf0d5f3f@amd.com>
X-Operating-System: Linux phenom 6.9.12-amd64 
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

On Mon, Sep 02, 2024 at 12:43:45PM +0200, Christian König wrote:
> Am 30.08.24 um 23:43 schrieb Matthew Brost:
> > On Fri, Aug 30, 2024 at 10:14:18AM +0200, Christian König wrote:
> > > Am 29.08.24 um 19:12 schrieb Boris Brezillon:
> > > > dma_fence objects created by an entity might outlive the
> > > > drm_gpu_scheduler this entity was bound to if those fences are retained
> > > > by other other objects, like a dma_buf resv. This means that
> > > > drm_sched_fence::sched might be invalid when the resv is walked, which
> > > > in turn leads to a UAF when dma_fence_ops::get_timeline_name() is called.
> > > > 
> > > > This probably went unnoticed so far, because the drm_gpu_scheduler had
> > > > the lifetime of the drm_device, so, unless you were removing the device,
> > > > there were no reasons for the scheduler to be gone before its fences.
> > > Nope, that is intentional design. get_timeline_name() is not safe to be
> > > called after the fence signaled because that would causes circular
> > > dependency problems.

So I don't think knowlingly crashing in debugfs is ok. debugfs can break
stuff like secure boot, and if you go about things very wrongly it can
upset the kernel (like touching pci mappings from userspace can). But just
going boom due to a race essentially means debugfs is unusable. Because
there's no way to avoid the boom with dma_fence:

- they're guaranteed to signal in finite time (unless driver bugs)

- the moment they've signalled looking too closely at them is undefined
  behaviour.

> > I'm quite sure happens, ftrace for example can and will call
> > get_timeline_name in trace_dma_fence_destroy which is certainly after
> > the fence is signaled. There are likely other cases too - this just
> > quickly came to mind.
> 
> Good point, completely forgotten about ftrace.
> 
> > > E.g. when you have hardware fences it can happen that fences reference a
> > > driver module (for the function printing the name) and the module in turn
> > > keeps fences around.
> > > 
> > I am almost positive without this patch this problematic in Xe or any
> > driver in which schedulers are tied to IOCTLs rather than kernel module.
> > 
> > In Xe 'fence->sched' maps to an xe_exec_queue which can be freed once
> > the destroy exec queue IOCTL is called and all jobs are free'd (i.e.
> > 'fence' signals). The fence could be live on after in dma-resv objects,
> > drm syncobjs, etc...
> > 
> > I know this issue has been raised before and basically NACK'd but I have
> > a strong opinion this is valid and in fact required.
> 
> I've NACK'd automatically signaling pending fences on destruction of the
> scheduler (that reminds me that I wanted to add a warning for that) and
> copying the name into every scheduler fence.
> 
> As long as we don't do any of that I'm perfectly fine fixing this issue. The
> approach of creating a reference counted object for the name looks rather
> valid to me.
> 
> Especially since we then pretty much get the module references correct for
> free as well.

So I think the issue is much, much bigger, and there's more. And the
issue is I think a fundamental design issue of dma_fence itself, not
individual users. I think at the core it's two constraints:

- dma_fence can stick around practically forever in varios container
  objects. We only garbage collect when someone looks, and not even then
  consistently.

- fences are meant to be cheap, so they do not have the big refcount going
  on like other shared objects like dma_buf

Specifically there's also no refcounting on the module itself with the
->owner and try_module_get stuff. So even if we fix all these issues on
the data structure lifetime side of things, you might still oops calling
into dma_fence->ops->release.

Oops.

I think the complete solution is if we change this code all so that core
dma-fence.c code guarantees to never ever again call into any driver code
after dma_fence_signal has been called, and takes over the final kfree_rcu
itself. But that's a giantic change. But I think it's the only way to
really fix this mess:

- drivers will clean up any of their own references in a timely fashion,
  so no more accidentally lingering gpu context or vms and the bo they
  have mapped lying around.

- there's no lifetime or other use-after-free issues anywhere for fences
  anymore

Downside is that some of the debugging stuff becomes a bit less useful.
But e.g. tracepoints could just dump the timeline once at creation or when
signalling, and so you don't need to dump it anymore when freeing. And a
signalled fence is generally not a problem anymore, so in a compositor
that's also all fine (iirc you can get at some of this stuff through the
sync_file interfaces too).

The other downside is that it's a huge pile of work, but I don't think we
can get to an actually solid design with less headaches and pain ...

Thoughts?

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
