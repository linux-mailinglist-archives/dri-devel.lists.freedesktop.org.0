Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CAF9C3BB4
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 11:10:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B2010E468;
	Mon, 11 Nov 2024 10:10:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="a95MbUAR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39DE710E468
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 10:10:20 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-37f52925fc8so2765471f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 02:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1731319818; x=1731924618; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Yv3YwTXOczDtXXdhFrD86DjvxxjThR2nviRCa9EpNLI=;
 b=a95MbUARrXTRsIKDHR14V5+g6nZOBdRgw8oIRfsES4D27nviREfqONjxlDd2oWSVaM
 U7lhjZE280FaciRg7kZoZ8Ks3+JsszICiA4+MGnnlG6OX9F1t8ST3zorQ70IjcOF4LbN
 uHX+TfV2mH2jBntumB5T4ZcO8hNQvdPgpUJWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731319818; x=1731924618;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Yv3YwTXOczDtXXdhFrD86DjvxxjThR2nviRCa9EpNLI=;
 b=t5Jmlgv0B1gquAfGEOn9eUdxrXNP0EP7jRsX58Qq8iDiUcxL0Dj4hZmKUEQHy9amJP
 pmK5Fa6vx+2LcZtCamcE+J0wh4DUKLzfysZyotDK1jf28fJlPSjTldHmjW2MQ+I6LvR5
 BczeYUQ1ox1fdcg9PMM3yVK1WIAOM7qXtmBdyLHF+blwpA6zl0dNLUvpSoAw14D/yAQd
 g2agLofgBTgZg3UGcU5elMS85v+AjNNziD6eQmaPy0iHcSOJBlaa8yJBVLG/iDylVyUj
 5c7lugYTrrccYWYnob0VEV3RowJEKo9q3hXBwlLBaTQC3oum9o/LqWiGr2wWuYMZw1tR
 rg5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhdvsalvhU6rLFZRiwWtsUKdSFP15F5TsNOSSW9qTToppdorXWjBvTMC9dVl0DtCcBNM4RqV8K1ZE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyd26GNIyPF/jRsIQlzdY4/gS/P1lmZ4aWg6OLiCP4hasbJdHYd
 gQ8HRT10VMwftI7fYzODY1u2k3AW8EvD+mJPYxJscPW67QQVADV48c7VGUNt20c=
X-Google-Smtp-Source: AGHT+IF8DFAXrC78cRw1tAHxhEIgoA/Ey2TAWrUIHsj6ClNNxbnK+njeXHnWh8Nk49eJVtVAt/aHCA==
X-Received: by 2002:a05:6000:2a04:b0:381:f595:f4da with SMTP id
 ffacd0b85a97d-381f595f566mr6350943f8f.0.1731319818150; 
 Mon, 11 Nov 2024 02:10:18 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed97fe9bsm12419211f8f.35.2024.11.11.02.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2024 02:10:17 -0800 (PST)
Date: Mon, 11 Nov 2024 11:10:15 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Huang Rui <ray.huang@amd.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, matthew.auld@intel.com,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v6 2/8] drm/ttm: Add ttm_bo_access
Message-ID: <ZzHYB4MBJmVjk-AR@phenom.ffwll.local>
References: <02ec3d6a-4727-4535-a384-4c6789fa4ef4@gmail.com>
 <ZylBWVjlW+GDYy5M@lstrano-desk.jf.intel.com>
 <c76830ae-c6f9-47a2-8087-32d9f7c3df2c@amd.com>
 <ZyplgNBaZ93UUdxY@lstrano-desk.jf.intel.com>
 <88ceb558-89d1-4d10-be8a-9ce2f3178fa5@amd.com>
 <ZyuKTFxCD0SusZpt@lstrano-desk.jf.intel.com>
 <34d18085-7e23-4632-9287-65eff6651bba@amd.com>
 <ZyugmXt7v+JeKuN9@lstrano-desk.jf.intel.com>
 <85859dc3-cca3-4396-8c75-a726437fb81e@amd.com>
 <173131201749.35893.6727423786823542880@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <173131201749.35893.6727423786823542880@jlahtine-mobl.ger.corp.intel.com>
X-Operating-System: Linux phenom 6.10.6-amd64 
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

On Mon, Nov 11, 2024 at 10:00:17AM +0200, Joonas Lahtinen wrote:
> Back from some time off and will try to answer below.
> 
> Adding Dave and Sima as this topic has been previously discussed to some
> extent and will be good to reach common understanding about what the
> series is trying to do and what is the difference to the AMD debugging
> model.

I chatted about this thread a bit on irc with folks, and I think an
orthogonal issue is the question, what should be in ttm-utils? I've asked
Matt to type up a DOC patch once we have some consensus, since imo the
somewhat lackluster documentation situation for ttm is also somewhat a
cause for these big threads on various different topics. Aside from the
fact that gpu memory management is just hard.

On the uapi/design aspect, I think this would serve well with a patch to
drm-uapi.rst that adds a debugging section? At least once we have some
rough consensus across drivers, and more importantly userspace in the form
of gdb upstream (at least I'm not aware of any other upstream debugger
patches, I think amd's rocm stuff is also gdb-only).

Some wash-up thoughts from me below, but consider them fairly irrelevant
since I think the main driver for these big questions here should be
gdb/userspace.

> Quoting Christian König (2024-11-07 11:44:33)
> > Am 06.11.24 um 18:00 schrieb Matthew Brost:
> > 
> >     [SNIP]
> > 
> >     This is not a generic interface that anyone can freely access. The same
> >     permissions used by ptrace are checked when opening such an interface.
> >     See [1] [2].
> > 
> >     [1] https://patchwork.freedesktop.org/patch/617470/?series=136572&rev=2
> >     [2] https://patchwork.freedesktop.org/patch/617471/?series=136572&rev=2
> > 
> > 
> > Thanks a lot for those pointers, that is exactly what I was looking for.
> > 
> > And yeah, it is what I feared. You are re-implementing existing functionality,
> > but see below.
> 
> Could you elaborate on what this "existing functionality" exactly is?
> I do not think this functionality exists at this time.
> 
> The EU debugging architecture for Xe specifically avoids the need for GDB
> to attach with ptrace to the CPU process or interfere with the CPU process for
> the debugging via parasitic threads or so.
> 
> Debugger connection is opened to the DRM driver for given PID (which uses the
> ptrace may access check for now) after which the all DRM client of that
> PID are exposed to the debugger process.
> 
> What we want to expose via that debugger connection is the ability for GDB to
> read/write the different GPU VM address spaces (ppGTT for Intel GPUs) just like
> the EU threads would see them. Note that the layout of the ppGTT is
> completely up to the userspace driver to setup and is mostly only partially
> equal to the CPU address space.
> 
> Specifically as part of reading/writing the ppGTT for debugging purposes,
> there are deep flushes needed: for example flushing instruction cache
> when adding/removing breakpoints.
> 
> Maybe that will explain the background. I elaborate on this at the end some more.
> 
> >             kmap/vmap are used everywhere in the DRM subsystem to access BOs, so I’m
> >             failing to see the problem with adding a simple helper based on existing
> >             code.
> > 
> >         What#s possible and often done is to do kmap/vmap if you need to implement a
> >         CPU copy for scanout for example or for copying/validating command buffers.
> >         But that usually requires accessing the whole BO and has separate security
> >         checks.
> > 
> >         When you want to access only a few bytes of a BO that sounds massively like
> >         a peek/poke like interface and we have already rejected that more than once.
> >         There even used to be standardized GEM IOCTLs for that which have been
> >         removed by now.
> 
> Referring to the explanation at top: These IOCTL are not for the debugging target
> process to issue. The peek/poke interface is specifically for GDB only
> to facilitate the emulation of memory reads/writes on the GPU address
> space as they were done by EUs themselves. And to recap: for modifying
> instructions for example (add/remove breakpoint), extra level of cache flushing is
> needed which is not available to regular userspace.
> 
> I specifically discussed with Sima on the difference before moving forward with this
> design originally. If something has changed since then, I'm of course happy to rediscuss.
> 
> However, if this code can't be added, not sure how we would ever be able
> to implement core dumps for GPU threads/memory?
> 
> >         If you need to access BOs which are placed in not CPU accessible memory then
> >         implement the access callback for ptrace, see amdgpu_ttm_access_memory for
> >         an example how to do this.
> 
> As also mentioned above, we don't work via ptrace at all when it comes
> to debugging the EUs. The only thing used for now is the ptrace_may_access to
> implement similar access restrictions as ptrace has. This can be changed
> to something else if needed.
> 
> >     Ptrace access via vm_operations_struct.access → ttm_bo_vm_access.
> > 
> >     This series renames ttm_bo_vm_access to ttm_bo_access, with no code changes.
> > 
> >     The above function accesses a BO via kmap if it is in SYSTEM / TT,
> >     which is existing code.
> > 
> >     This function is only exposed to user space via ptrace permissions.
> 
> Maybe this sentence is what caused the confusion.
> 
> Userspace is never exposed with peek/poke interface, only the debugger
> connection which is its own FD.
> 
> >     In this series, we implement a function [3] similar to
> >     amdgpu_ttm_access_memory for the TTM vfunc access_memory. What is
> >     missing is non-visible CPU memory access, similar to
> >     amdgpu_ttm_access_memory_sdma. This will be addressed in a follow-up and
> >     was omitted in this series given its complexity.
> > 
> >     So, this looks more or less identical to AMD's ptrace implementation,
> >     but in GPU address space. Again, I fail to see what the problem is here.
> >     What am I missing?
> > 
> > 
> > The main question is why can't you use the existing interfaces directly?
> 
> We're not working on the CPU address space or BOs. We're working
> strictly on the GPU address space as would be seen by an EU thread if it
> accessed address X.
> 
> > Additional to the peek/poke interface of ptrace Linux has the pidfd_getfd
> > system call, see here https://man7.org/linux/man-pages/man2/pidfd_getfd.2.html.
> > 
> > The pidfd_getfd() allows to dup() the render node file descriptor into your gdb
> > process. That in turn gives you all the access you need from gdb, including
> > mapping BOs and command submission on behalf of the application.
> 
> We're not operating on the CPU address space nor are we operating on BOs
> (there is no concept of BO in the EU debug interface). Each VMA in the VM
> could come from anywhere, only the start address and size matter. And
> neither do we need to interfere with the command submission of the
> process under debug.
> 
> > As far as I can see that allows for the same functionality as the eudebug
> > interface, just without any driver specific code messing with ptrace
> > permissions and peek/poke interfaces.
> > 
> > So the question is still why do you need the whole eudebug interface in the
> > first place? I might be missing something, but that seems to be superfluous
> > from a high level view.
> 
> Recapping from above. It is to allow the debugging of EU threads per DRM
> client, completely independent of the CPU process. If ptrace_may_acces
> is the sore point, we could consider other permission checks, too. There
> is no other connection to ptrace in this architecture as single
> permission check to know if PID is fair game to access by debugger
> process.
> 
> Why no parasitic thread or ptrace: Going forward, binding the EU debugging to
> the DRM client would also pave way for being able to extend core kernel generated
> core dump with each DRM client's EU thread/memory dump. We have similar
> feature called "Offline core dump" enabled in the downstream public
> trees for i915, where we currently attach the EU thread dump to i915 error state
> and then later combine i915 error state with CPU core dump file with a
> tool.
> 
> This is relatively little amount of extra code, as this baseline series
> already introduces GDB the ability to perform the necessary actions.
> It's just the matter of kernel driver calling: "stop all threads", then
> copying the memory map and memory contents for GPU threads, just like is
> done for CPU threads.
> 
> With parasitic thread injection, not sure if there is such way forward,
> as it would seem to require to inject quite abit more logic to core kernel?
> 
> > It's true that the AMD KFD part has still similar functionality, but that is
> > because of the broken KFD design of tying driver state to the CPU process
> > (which makes it inaccessible for gdb even with imported render node fd).
> > 
> > Both Sima and I (and partially Dave as well) have pushed back on the KFD
> > approach. And the long term plan is to get rid of such device driver specific
> > interface which re-implement existing functionality just differently.
> 
> Recapping, this series is not adding it back. The debugger connection
> is a separate FD from the DRM one, with separate IOCTL set. We don't allow
> the DRM FD any new operations based on ptrace is attached or not. We
> don't ever do that check even.
> 
> We only restrict the opening of the debugger connection to given PID with
> ptrace_may_access check for now. That can be changed to something else,
> if necessary.

Yeah I think unnecessarily tying gpu processes to cpu processes is a bad
thing, least because even today all the svm discussions we have still hit
clear use-cases, where a 1:1 match is not wanted (like multiple gpu svm
sections with offsets). Not even speaking of all the gpu usecases where
the gpu vm space is still entirely independent of the cpu side.

So that's why I think this entirely separate approach looks like the right
one, with ptrace_may_access as the access control check to make sure we
match ptrace on the cpu side.

But there's very obviously a bikeshed to be had on what the actual uapi
should look like, especially how gdb opens up a gpu debug access fd. But I
also think that's not much on drm to decide, but whatever gdb wants. And
then we aim for some consistency on that lookup/access control part
(ideally, I might be missing some reasons why this is a bad idea) across
drm drivers.

> > So you need to have a really really good explanation why the eudebug interface
> > is actually necessary.
> 
> TL;DR The main point is to decouple the debugging of the EU workloads from the
> debugging of the CPU process. This avoids the interference with the CPU process with
> parasitic thread injection. Further this also allows generating a core dump
> without any GDB connected. There are also many other smaller pros/cons
> which can be discussed but for the context of this patch, this is the
> main one.
> 
> So unlike parasitic thread injection, we don't unlock any special IOCTL for
> the process under debug to be performed by the parasitic thread, but we
> allow the minimal set of operations to be performed by GDB as if those were
> done on the EUs themselves.
> 
> One can think of it like the minimal subset of ptrace but for EU threads,
> not the CPU threads. And thus, building on this it's possible to extend
> the core kernel generated core dumps with DRM specific extension which
> would contain the EU thread/memory dump.

It might be good to document (in that debugging doc patch probably) why
thread injection is not a great option, and why the tradeoffs for
debugging are different than for for checkpoint/restore, where with CRIU
we landed on doing most of this in userspace, and often requiring
injection threads to make it all work.

Cheers, Sima

> 
> Regards, Joonas
> 
> > 
> > Regards,
> > Christian.
> > 
> > 
> > 
> >     Matt
> > 
> >     [3] https://patchwork.freedesktop.org/patch/622520/?series=140200&rev=6
> > 
> > 
> >         Regards,
> >         Christian.
> > 
> > 
> >             Matt
> > 
> > 
> >                 Regards,
> >                 Christian.
> >

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
