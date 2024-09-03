Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1201969B12
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 13:01:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A0E210E468;
	Tue,  3 Sep 2024 11:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="CXJqY7LM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7520B10E43C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 08:13:29 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-374bb08d011so1964816f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 01:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1725351208; x=1725956008; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=UKE2JuPAE7V2eJFEom6L4FZ3LWYYkSeADg9P52N5iRc=;
 b=CXJqY7LMq3K0R49dL6o7Y8kT3aXUzVIpx3w+0uTsHPqopDtnIwTBZZNNEihfwPUQrW
 OAMcz3c3nHFQDcC6MXA6zVjz1k1tBVXHoLJzUDSomfnd9lFZh/9Wtxj1xsWDMMjSJiy4
 qN4C2ilTlUXOgM3BDm3++h1FLdZ1jYGgaVMOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725351208; x=1725956008;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UKE2JuPAE7V2eJFEom6L4FZ3LWYYkSeADg9P52N5iRc=;
 b=lVvuyB4eV5yMbny+FywSSl13jxJThvrbyv931/7Z7bxMVrihHc8tuQkXwdL8uZoLoF
 BG2c2Ok+XN2IXkrwT2xcctyHo9erP2arvB8kzV1l/Av6JhV2f8sMGJV7AFi24nCqgb+c
 A9ARn5f7vVowclHNb7bUGMfDLiukYBgU3xf0a/FJkMjDAh9WPd3wktt7c35b2t6IWe7V
 L0El8sLIoeA7zut5ui4b177tDcGRNZ46Vv2ESGQjWDZIRbYFqM7Dgh8J0HeZwe2zuLMW
 1agtMRvcQF2GqYCqQUwRCzpktS28GOHDXr35ckU5SrKDaM8jTV19zaZVsctIkqX7b7Jx
 94rA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHr4s/wTU8qtQUOR1vxtzicIcWvshDuFLNFMfkxKmzNF1RxJL7pPam9MMYsXICSTpyXs3YqwQZssA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysmrhEYCxkbv4JIwbp/cb+G+P8l2aWUtL3RKy8PJmNiW+UII+z
 Dut0j6BdMgEl8z8O7WRAeonrhQzPEgl0Q4PYQf7wOdmypM9UK/9UMENQuoXVDNvb/+xtoXCmQ0R
 M
X-Google-Smtp-Source: AGHT+IEf9psJAnuQpbgkcQjwX7xoBsVITuHlokyUZnVPPgZLNCDnPa0PBcsI9TA0ETXCZVxFuMmbaw==
X-Received: by 2002:a05:6000:2a7:b0:374:c6b8:50c3 with SMTP id
 ffacd0b85a97d-374c9460a68mr5417907f8f.32.1725351207504; 
 Tue, 03 Sep 2024 01:13:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374b6f7ef8esm10495499f8f.8.2024.09.03.01.13.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 01:13:27 -0700 (PDT)
Date: Tue, 3 Sep 2024 10:13:25 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
 kernel@collabora.com, Luben Tuikov <ltuikov89@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>
Subject: Re: [RFC PATCH] drm/sched: Fix a UAF on drm_sched_fence::sched
Message-ID: <ZtbFJRZKA4UghVai@phenom.ffwll.local>
References: <20240829171238.609481-1-boris.brezillon@collabora.com>
 <bdc018b8-3732-4123-a752-b4e0e7e150dc@amd.com>
 <ZtI9EMzHZW3DkHw/@DUT025-TGLU.fm.intel.com>
 <710b6946-ce8e-42ed-8df6-aa76bf0d5f3f@amd.com>
 <ZtW8aiIhBA5KBLR6@phenom.ffwll.local>
 <b6185b8e-148a-494e-a336-e4290c38b700@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b6185b8e-148a-494e-a336-e4290c38b700@amd.com>
X-Operating-System: Linux phenom 6.9.12-amd64 
X-Mailman-Approved-At: Tue, 03 Sep 2024 11:01:31 +0000
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

On Mon, Sep 02, 2024 at 04:18:33PM +0200, Christian König wrote:
> Am 02.09.24 um 15:23 schrieb Daniel Vetter:
> > On Mon, Sep 02, 2024 at 12:43:45PM +0200, Christian König wrote:
> > > Am 30.08.24 um 23:43 schrieb Matthew Brost:
> > > > On Fri, Aug 30, 2024 at 10:14:18AM +0200, Christian König wrote:
> > > > > Am 29.08.24 um 19:12 schrieb Boris Brezillon:
> > > > > > dma_fence objects created by an entity might outlive the
> > > > > > drm_gpu_scheduler this entity was bound to if those fences are retained
> > > > > > by other other objects, like a dma_buf resv. This means that
> > > > > > drm_sched_fence::sched might be invalid when the resv is walked, which
> > > > > > in turn leads to a UAF when dma_fence_ops::get_timeline_name() is called.
> > > > > > 
> > > > > > This probably went unnoticed so far, because the drm_gpu_scheduler had
> > > > > > the lifetime of the drm_device, so, unless you were removing the device,
> > > > > > there were no reasons for the scheduler to be gone before its fences.
> > > > > Nope, that is intentional design. get_timeline_name() is not safe to be
> > > > > called after the fence signaled because that would causes circular
> > > > > dependency problems.
> > So I don't think knowlingly crashing in debugfs is ok. debugfs can break
> > stuff like secure boot, and if you go about things very wrongly it can
> > upset the kernel (like touching pci mappings from userspace can). But just
> > going boom due to a race essentially means debugfs is unusable. Because
> > there's no way to avoid the boom with dma_fence:
> > 
> > - they're guaranteed to signal in finite time (unless driver bugs)
> > 
> > - the moment they've signalled looking too closely at them is undefined
> >    behaviour.
> > 
> > > > I'm quite sure happens, ftrace for example can and will call
> > > > get_timeline_name in trace_dma_fence_destroy which is certainly after
> > > > the fence is signaled. There are likely other cases too - this just
> > > > quickly came to mind.
> > > Good point, completely forgotten about ftrace.
> > > 
> > > > > E.g. when you have hardware fences it can happen that fences reference a
> > > > > driver module (for the function printing the name) and the module in turn
> > > > > keeps fences around.
> > > > > 
> > > > I am almost positive without this patch this problematic in Xe or any
> > > > driver in which schedulers are tied to IOCTLs rather than kernel module.
> > > > 
> > > > In Xe 'fence->sched' maps to an xe_exec_queue which can be freed once
> > > > the destroy exec queue IOCTL is called and all jobs are free'd (i.e.
> > > > 'fence' signals). The fence could be live on after in dma-resv objects,
> > > > drm syncobjs, etc...
> > > > 
> > > > I know this issue has been raised before and basically NACK'd but I have
> > > > a strong opinion this is valid and in fact required.
> > > I've NACK'd automatically signaling pending fences on destruction of the
> > > scheduler (that reminds me that I wanted to add a warning for that) and
> > > copying the name into every scheduler fence.
> > > 
> > > As long as we don't do any of that I'm perfectly fine fixing this issue. The
> > > approach of creating a reference counted object for the name looks rather
> > > valid to me.
> > > 
> > > Especially since we then pretty much get the module references correct for
> > > free as well.
> > So I think the issue is much, much bigger, and there's more. And the
> > issue is I think a fundamental design issue of dma_fence itself, not
> > individual users.
> 
> IIRC both Alex and me pointed out this issue on the very first dma_fence
> code and nobody really cared.

I guess way back then we didn't really sort out any of the hotunplug
issues, and there wasn't any fw ctx schedulers at least on our horizons
yet. Thin excuse, I know ...

> >   I think at the core it's two constraints:
> > 
> > - dma_fence can stick around practically forever in varios container
> >    objects. We only garbage collect when someone looks, and not even then
> >    consistently.
> > 
> > - fences are meant to be cheap, so they do not have the big refcount going
> >    on like other shared objects like dma_buf
> > 
> > Specifically there's also no refcounting on the module itself with the
> > ->owner and try_module_get stuff. So even if we fix all these issues on
> > the data structure lifetime side of things, you might still oops calling
> > into dma_fence->ops->release.
> > 
> > Oops.
> 
> Yes, exactly that. I'm a bit surprised that you realize that only now :)
> 
> We have the issue for at least 10 years or so and it pops up every now and
> then on my desk because people complain that unloading amdgpu crashes.

Yeah I knew about the issue. The new idea that popped into my mind is that
I think we cannot plug this properly unless we do it in dma_fence.c for
everyone, and essentially reshape the lifetime rules for that from yolo
to something actually well-defined.

Kinda similar work to how dma_resv locking rules and fence book-keeping
were unified to something that actually works across drivers ...
 
> > I think the complete solution is if we change this code all so that core
> > dma-fence.c code guarantees to never ever again call into any driver code
> > after dma_fence_signal has been called, and takes over the final kfree_rcu
> > itself. But that's a giantic change. But I think it's the only way to
> > really fix this mess:
> > 
> > - drivers will clean up any of their own references in a timely fashion,
> >    so no more accidentally lingering gpu context or vms and the bo they
> >    have mapped lying around.
> > 
> > - there's no lifetime or other use-after-free issues anywhere for fences
> >    anymore
> > 
> > Downside is that some of the debugging stuff becomes a bit less useful.
> > But e.g. tracepoints could just dump the timeline once at creation or when
> > signalling, and so you don't need to dump it anymore when freeing. And a
> > signalled fence is generally not a problem anymore, so in a compositor
> > that's also all fine (iirc you can get at some of this stuff through the
> > sync_file interfaces too).
> > 
> > The other downside is that it's a huge pile of work, but I don't think we
> > can get to an actually solid design with less headaches and pain ...
> > 
> > Thoughts?
> 
> The alternative is to use the scheduler fence(s) to decouple hardware fences
> from the containers. That would be rather cheap to implement.
> 
> The only downside would be that the scheduler module probably keeps loaded
> forever once used. But at least I can live with that.

Yeah I think interim it's an ok stop-gap. But aside from keeping the
scheduler code pinned forever I think there's some more things:

- I'm not sure we can do it, without digging into dma_fence.c locking
  internals too much.

- It defacto means you can use dma_fence that are fence containers and
  drm_sched_job_fence, and nothing else. And drivers will get this wrong
  and do dma_fence ad-hoc for stuff like tlb flushing, or pte writing, and
  whatever else, that won't necessairly go through a drm_sched.

So not great imo, and hence why I've shifted towards that we should fix
this in dma_fence.c code for everyone.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
