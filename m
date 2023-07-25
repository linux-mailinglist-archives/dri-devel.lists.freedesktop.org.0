Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBCD761ED7
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 18:43:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75FEF10E167;
	Tue, 25 Jul 2023 16:43:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 871E010E152
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 16:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690303394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DumZqxaVyfmECX8MJn416CV8fns14ADEeMsPKD9aBjY=;
 b=FZTKRv+JztonGamG1WBzwH7NEuTlbQ9jbinmCdpmpt5JNf+aDM/+KmkjPZa4DDp7Vfgrlb
 mEswl1qwzu/25lNDnvBQu1Srm0DtKxLsbc/4iT6fnvIywmvssCcFUZGNt16XnRj4rPFCta
 bLiVGx1GLWPA85ZsfpqI3tK4/xTuiuw=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-3lJIJfDqOhyZLa3uSNjDkg-1; Tue, 25 Jul 2023 12:43:11 -0400
X-MC-Unique: 3lJIJfDqOhyZLa3uSNjDkg-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-4fe0800f960so785496e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 09:43:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690303390; x=1690908190;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DumZqxaVyfmECX8MJn416CV8fns14ADEeMsPKD9aBjY=;
 b=U/x31jBXtn91aXFiAf8KJZ+GPcqT12UsZM0GLUXdmnnHQNyN7ur5MQlWgtOr0PSKtu
 AQXAMnaRexcKkdpzxq9VSU7ZZRUwE3a1gjPRKRauq7BnFiSTZ6ceyh/E0O40W8wPuX73
 FHj4w/bWxyZlVQlTy7rWDr4NuuFcy7nyKk5sK5smI33jDaJstjnzk7K+1pjh0q5RCceh
 qS1YBmk8FPocUUYZ4KRPwsYstTY+X4mpa4pzdelmI8JRKEL3DGi90FzBOu+tnYBF/qb0
 jwk5xNFN51Eo7OqZ49GadrycvX8+Vz7EGGV6BF0dzZQf9QvGM4fvk5SellyA9x+d/z3J
 lyxw==
X-Gm-Message-State: ABy/qLZ5USKRSKdENF4GNjBZq1wSpbeSiL3ykyQoE2XL5AI550DU0CEi
 nLsRVQFI95nSkYZMQTc00C6b9kFf568fgDBXVyci+8zjRa/+cTeNxdo7w4gbhqpjnXZ35SokfcJ
 HQrzELjdU0lxaOoQq7QVvc5BFeDOF
X-Received: by 2002:ac2:41d6:0:b0:4fb:ca59:42d7 with SMTP id
 d22-20020ac241d6000000b004fbca5942d7mr6995127lfi.33.1690303389979; 
 Tue, 25 Jul 2023 09:43:09 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGXr14dAVQSWXE3vfq1e8pmsjMxBx83DZc37lbfZseo2qXC3gtSFL30CnkRMrXCtuvGkGwvdw==
X-Received: by 2002:ac2:41d6:0:b0:4fb:ca59:42d7 with SMTP id
 d22-20020ac241d6000000b004fbca5942d7mr6995106lfi.33.1690303389480; 
 Tue, 25 Jul 2023 09:43:09 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 h15-20020aa7c94f000000b0051d890b2407sm7692182edt.81.2023.07.25.09.43.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jul 2023 09:43:09 -0700 (PDT)
Message-ID: <75c86224-6183-07fe-da04-6a2101615a50@redhat.com>
Date: Tue, 25 Jul 2023 18:43:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH drm-misc-next v8 11/12] drm/nouveau: implement new VM_BIND
 uAPI
To: Faith Ekstrand <faith@gfxstrand.net>
References: <20230720001443.2380-1-dakr@redhat.com>
 <20230720001443.2380-12-dakr@redhat.com>
 <CAOFGe945tp344=g-++=EAT89t0qJHZ=3yeW-k9OTbGNJodvwAg@mail.gmail.com>
 <542203c6-781a-dc44-6fa1-13cd20ab9e21@redhat.com>
 <CAOFGe94sG5==GM+spcTihcAtMCoj2xZYpN8NsYE6CEckdHJ8rQ@mail.gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <CAOFGe94sG5==GM+spcTihcAtMCoj2xZYpN8NsYE6CEckdHJ8rQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: matthew.brost@intel.com, willy@infradead.org,
 dri-devel@lists.freedesktop.org, corbet@lwn.net, nouveau@lists.freedesktop.org,
 ogabbay@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, boris.brezillon@collabora.com, bskeggs@redhat.com,
 tzimmermann@suse.de, Liam.Howlett@oracle.com, bagasdotme@gmail.com,
 christian.koenig@amd.com, jason@jlekstrand.net, donald.robson@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/25/23 18:16, Faith Ekstrand wrote:
> On Mon, Jul 24, 2023 at 9:04 PM Danilo Krummrich <dakr@redhat.com 
> <mailto:dakr@redhat.com>> wrote:
> 
>     On 7/22/23 17:12, Faith Ekstrand wrote:
>      > On Wed, Jul 19, 2023 at 7:15 PM Danilo Krummrich <dakr@redhat.com
>     <mailto:dakr@redhat.com>
>      > <mailto:dakr@redhat.com <mailto:dakr@redhat.com>>> wrote:
>      >
>      >     This commit provides the implementation for the new uapi
>     motivated
>      >     by the
>      >     Vulkan API. It allows user mode drivers (UMDs) to:
>      >
>      >     1) Initialize a GPU virtual address (VA) space via the new
>      >         DRM_IOCTL_NOUVEAU_VM_INIT ioctl for UMDs to specify the
>     portion
>      >     of VA
>      >         space managed by the kernel and userspace, respectively.
>      >
>      >     2) Allocate and free a VA space region as well as bind and
>     unbind memory
>      >         to the GPUs VA space via the new
>     DRM_IOCTL_NOUVEAU_VM_BIND ioctl.
>      >         UMDs can request the named operations to be processed either
>      >         synchronously or asynchronously. It supports DRM syncobjs
>      >         (incl. timelines) as synchronization mechanism. The
>     management
>      >     of the
>      >         GPU VA mappings is implemented with the DRM GPU VA manager.
>      >
>      >     3) Execute push buffers with the new DRM_IOCTL_NOUVEAU_EXEC
>     ioctl. The
>      >         execution happens asynchronously. It supports DRM syncobj
>     (incl.
>      >         timelines) as synchronization mechanism. DRM GEM object
>     locking is
>      >         handled with drm_exec.
>      >
>      >     Both, DRM_IOCTL_NOUVEAU_VM_BIND and DRM_IOCTL_NOUVEAU_EXEC,
>     use the DRM
>      >     GPU scheduler for the asynchronous paths.
>      >
>      >
>      > IDK where the best place to talk about this is but this seems as
>     good as
>      > any.
>      >
>      > I've been looking into why the Vulkan CTS runs about 2x slower
>     for me on
>      > the new UAPI and I created a little benchmark to facilitate testing:
>      >
>      > https://gitlab.freedesktop.org/mesa/crucible/-/merge_requests/141
>     <https://gitlab.freedesktop.org/mesa/crucible/-/merge_requests/141>
>      >
>     <https://gitlab.freedesktop.org/mesa/crucible/-/merge_requests/141
>     <https://gitlab.freedesktop.org/mesa/crucible/-/merge_requests/141>>
>      >
>      > The test, roughly, does the following:
>      >   1. Allocates and binds 1000 BOs
>      >   2. Constructs a pushbuf that executes a no-op compute shader.
>      >   3. Does a single EXEC/wait combo to warm up the kernel
>      >   4. Loops 10,000 times, doing SYNCOBJ_RESET (fast), EXEC, and then
>      > SYNCOBJ_WAIT and times the loop
>      >
>      > Of course, there's a bit of userspace driver overhead but that's
>      > negledgable.
>      >
>      > If you drop the top patch which allocates 1k buffers, the submit
>     time on
>      > the old uAPI is 54 us/exec vs. 66 us/exec on the new UAPI. This
>     includes
>      > the time to do a SYNCOBJ_RESET (fast), EXEC, and SYNCOBJ_WAIT.The
>     Intel
>      > driver, by comparison, is 33us/exec so it's not syncobj overhead.
>     This
>      > is a bit concerning (you'd think the new thing would be faster)
>     but what
>      > really has me concerned is the 1k buffer case.
>      >
>      > If you include the top patch in the crucible MR, it allocates
>     1000 BOs
>      > and VM_BINDs them. All the binding is done before the warmup EXEC.
>      > Suddenly, the submit time jumps to 257 us/exec with the new UAPI.
>     The
>      > old UAPI is much worse (1134 us/exec) but that's not the point. Once
>      > we've done the first EXEC and created our VM bindings, the cost
>     per EXEC
>      > shouldn't change at all based on the number of BOs bound.  Part
>     of the
>      > point of VM_BIND is to get all that binding logic and BO walking
>     off the
>      > EXEC path.
>      >
>      > Normally, I wouldn't be too worried about a little performance
>     problem
>      > like this. This is the first implementation and we can improve it
>     later.
>      > I get that. However, I suspect the solution to this problem involves
>      > more UAPI and I want to make sure we have it all before we call
>     this all
>      > done and dusted and land it.
>      >
>      > The way AMD solves this problem as well as the new Xe driver for
>     Intel
>      > is to have a concept of internal vs. external BOs. Basically,
>     there's an
>      > INTERNAL bit specified somewhere in BO creation that has a few
>     userspace
>      > implications:
>      >   1. In the Xe world where VMs are objects, INTERNAL BOs are
>     assigned a
>      > VM on creation and can never be bound to any other VM.
>      >   2. Any attempt to export an INTERNAL BO via prime or a similar
>      > mechanism will fail with -EINVAL (I think?).
>      >
>      > Inside the kernel driver, all the internal BOs on a VM (or DRM
>     file in
>      > the case of nouveau/AMD since they don't have VM objects) share a
>     single
>      > dma_resv which allows you to avoid having to walk lists of BOs
>     and take
>      > locks on every exec. Instead, you can just look at the fences on the
>      > dma_resv for the VM. There's still a BO list associated with the
>     VM for
>      > external BOs but, in most Vulkan applications, there are less than a
>      > half dozen external BOs total.  Meanwhile, the hundreds or
>     thousands of
>      > BOs used entirely internally to the application basically count
>     as one
>      > BO when it comes to locking overhead.
> 
>     I am aware of that and I have some WIP patches [1] to generalize a
>     common dma-resv within the GPUVA manager which basically represents a
>     GPU-VM. It also keeps track of external GEM objects and evicted
>     objects,
>     such that on EXEC we only need to validate objects needing validation,
>     rather than all of them. Hence, it should be faster than with Daves
>     patch having a common dma-resv only.
> 
>     In [1] I also picked up Daves code to allow for noop jobs to be
>     submitted as well as the NOUVEAU_GEM_DOMAIN_NO_SHARE flag.
> 
>     This seems to work fine with yours and Daves latest mesa work
>     (670c301a9845a3fc795fd48a1e6714e75b388245).
> 
>     Your crucible bench.submit-latency test goes down to 51us on my machine
>     with those patches.
> 
>     I am unsure though, if we should aim for a common solution within the
>     GPUVA manager directly or if we should do it driver specific in a first
>     shot. I discussed this patch with Matt and I know that XE looks for
>     having a generalized solution as well. However, it surely needs some
>     more care and polish and feedback from other drivers perspective.
> 
>     [1]
>     https://gitlab.freedesktop.org/nouvelles/kernel/-/tree/new-uapi-drm-next-vm-resv <https://gitlab.freedesktop.org/nouvelles/kernel/-/tree/new-uapi-drm-next-vm-resv>
> 
>      >
>      > I'm not actually trying to dictate kernel driver design here. If one
>      > dma_resv doesn't work, fine. I don't care as long as EXEC scales.
>      > However, given that the solution in all the other drivers
>     involves a BO
>      > create flag nouveau doesn't have, we need to either add that or
>     prove
>      > that we can get EXEC to scale without it.
> 
>       From #nouveau:
> 
>     <gfxstrand> CTSing now
>     <gfxstrand> It looks like it's still going to take 1.5 hours.
> 
>     I may have an idea what could be the issue, let me explain.
> 
>     Currently, there is a single drm_gpu_scheduler having a
>     drm_sched_entity
>     per client (for VM_BIND jobs) and a drm_sched_entity per channel (for
>     EXEC jobs).
> 
>     For VM_BIND jobs the corresponding PT[E]s are allocated before the job
>     is pushed to the corresponding drm_sched_entity. The PT[E]s are
>     freed by
>     the schedulers free() callback pushing work to a single threaded
>     workqueue doing the actual free. (We can't do it in the free() callback
>     directly, since to free PT[E]s we need to hold a mutex we also need to
>     hold while allocating them.)
> 
>     Because of how the page table handling in Nouveau is implemented
>     currently there are some ordering restrictions when it comes to
>     allocating and freeing PT[E]s. For instance, we can't allocate PT[E]s
>     for sparse regions before the PT[E]s of previously removed memory
>     backed
>     mappings *within the same address range* aren't freed. The same applies
>     vice versa and for sparse mapping replacing sparse mapping. For memory
>     backed mappings (also for those within sparse regions) we do *not* have
>     such ordering requirements.
> 
>     So, let's assume userspace removes a sparse region A[0x0, 0x8000000]
>     and
>     asks for a couple of new memory backed mappings within or crossing this
>     range; the kernel needs to wait for A not only to be unmapped, but also
>     the backing PT[E]s to be freed before it can even allocate the PT[E]s
>     for the new memory backed mappings.
> 
>     Now, let's have a look what the gpu schedulers main loop does. Before
>     picking the next entity to schedule a job for, it tries to fetch the
>     first job from the pending_list and checks whether its dma-fence is
>     signaled already and whether the job can be cleaned up. Subsequent jobs
>     on the pending_list are not taken into consideration. Hence, it might
>     well be that the first job on the pending_list isn't signaled yet, but
>     subsequent jobs are and hence *could* be cleaned up.
> 
>     Normally, this shouldn't be a problem, since we wouldn't really care
>     *when* resources are cleaned up as long as they are eventually.
>     However,
>     with the ordering restrictions the page table handling gives us we
>     might
>     actually care about the "when".
> 
>     For instance, it could happen that the first job on the pending list is
>     a rather long running EXEC job (1) scheduled from client A on some
>     channel. The next job on the pending list could be a VM_BIND job (2)
>     from client B removing a sparse region, which is finished already
>     but is
>     blocked to be cleaned up until the EXEC job (1) from client A is
>     finished and cleaned up. Now, a subsequent VM_BIND job (3) from
>     client B
>     creating a new memory backed mapping in the same address range as the
>     sparse region removed by job (2) would need to wait for (2) to be
>     cleaned up. Ultimately, we can expect client B to submit an EXEC job
>     that needs to wait for the corresponding mappings to be created, namely
>     the VM_BIND job (3).
> 
>     Clearly in order to address this we need to rework the page table
>     handling in Nouveau to get rid of those ordering restrictions.
> 
>     Temporarily, we could also try to run a secondary drm_gpu_scheduler
>     instance, one for VM_BINDs and one for EXECs maybe...
> 
>     However, I would not expect this to be an issue in real applications,
>     especially if mesa takes a little care not to re-use certain address
>     space areas right away to avoid running into such wait conditions.
> 
>     For parallel VK CTS runs I could imagine that we run into such cases
>     from time to time though.
> 
> 
> Thanks for the detailed write-up! That would definitely explain it. If I 
> remember, I'll try to do a single-threaded run or two. If your theory is 
> correct, there should be no real perf difference when running 
> single-threaded. Those runs will take a long time, though, so I'll have 
> to run them over night. I'll let you know in a few days once I have the 
> results.

I can also push a separate branch where I just print out a warning 
whenever we run into such a condition including the time we were waiting 
for things to complete. I can probably push something later today.

> 
> If this theory holds, then I'm not concerned about the performance of 
> the API itself. It would still be good to see if we can find a way to 
> reduce the cross-process drag in the implementation but that's a perf 
> optimization we can do later.

 From the kernel side I think the only thing we could really do is to 
temporarily run a secondary drm_gpu_scheduler instance, one for VM_BINDs 
and one for EXECs until we got the new page table handling in place.

However, the UMD could avoid such conditions more effectively, since it 
controls the address space. Namely, avoid re-using the same region of 
the address space right away in certain cases. For instance, instead of 
replacing a sparse region A[0x0, 0x4000000] with a larger sparse region 
B[0x0, 0x8000000], replace it with B'[0x4000000, 0xC000000] if possible.

However, just mentioning this for completeness. The UMD surely shouldn't 
probably even temporarily work around such a kernel limitation.

Anyway, before doing any of those, let's see if the theory holds and 
we're actually running into such cases.

> 
> Does it actually matter? Yes, it kinda does. No, it probably doesn't 
> matter for games because you're typically only running one game at a 
> time. From a development PoV, however, if it makes CI take longer then 
> that slows down development and that's not good for the users, either.

Fully agree.

- Danilo

> 
> ~Faith
> 
>     - Danilo
> 
>      >
>      > ~Faith
>      >
> 

