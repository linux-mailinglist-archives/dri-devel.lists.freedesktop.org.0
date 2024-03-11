Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1998781FE
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 15:49:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E7DD10EECD;
	Mon, 11 Mar 2024 14:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="qR4welYx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 988D810EF6E
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 14:49:02 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id
 2adb3069b0e04-51320ca689aso3486017e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 07:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1710168540; x=1710773340;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zpfGHxA1PabP1hCenx1VwHSbIypoKxL1F/oTa27ISfA=;
 b=qR4welYx08mCldaNVJTUmPrwKPL1ZPotUkajww+9y800E9f3T1NLy6x7hyYzeQ8amG
 R3vdOupZwWqjf17gmllxepvFgplT/YF7Y5zap5imTX5nQAAJ4Hl2kcKqqAlxLlFlnryG
 AAzidWA8hFvQ4m+Tp4DBpnPZ4Rnqq94sw+Z3z7f+scSR5om9gShBskCoTUHtCGCSiyAc
 BWIINfEgpQjRkHy1iU+s2ijX8ijNMWFBFUwEQxzaWG9uaUFe98LcGdUP95/imh6cJ8Fz
 2XM1ZHEi4+wuwBLChcrMpFQxEVDesBbCfI2NwLGOaq44wsB/QaIihPUAlQuU393atA3+
 dm7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710168540; x=1710773340;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zpfGHxA1PabP1hCenx1VwHSbIypoKxL1F/oTa27ISfA=;
 b=veGEH8+6hg1deOpyvj5A7+YTLk+mYIcs1xLuBrUdtaHtcNOy9Gum4knDNQcuwOgvcq
 Q9AAKdaMACuqJ8t7gOn636w4uYRM4cLloFfZYyRwkPpNzuvprhRbPGsMQIMgvYlQyell
 PKfxlwita7Zyv60ij0cbhnhtmaTX1IC2eC7sHc/Ugx+4VMCzDNDlgYPXW8AVqDsVUwRK
 YT1EFvPCVnPgFnwQV0NyTVX4z/m0gBLkikrkAYxVaktN1NcSv1/S+hXjd0scwt47BQ49
 fJC30XCKD/Dzswx4cY26L5LJUVBggGYzy2glCoSndY8Xl1Z40gdD0Sn8ncH+qKb5vTmp
 iFmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4Vf1rCaxQjRPaRpzVexZFh536Xy1YPkjUwIcsX31b/J54qbPxEy02Q0gwHJJqgByFevQ3k6NzV0qABsXdez4H68MJKeFkJ+27kEum66KT
X-Gm-Message-State: AOJu0Yz320+CPWiTzoj3FThFWV6vqwUbvPpxTfD3tZ0RtojoLQ9R1fbw
 MhBd68lE2WiTNUlHo9aYPBymQAc74wEo5MW8jdQRZWRIhyP8/1ZeoVgKvNmFcdQ=
X-Google-Smtp-Source: AGHT+IHvUBmzELnj+Th5cNn8BaNlPRGmV3i5sO+CErWw4n3ueCtGw6IPwj4EL/RMLJOc0cIsBgvpdw==
X-Received: by 2002:a05:6512:a95:b0:513:b3f0:33e2 with SMTP id
 m21-20020a0565120a9500b00513b3f033e2mr383910lfu.42.1710168540133; 
 Mon, 11 Mar 2024 07:49:00 -0700 (PDT)
Received: from [192.168.0.101] ([84.65.0.132])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a5d424c000000b0033e48db23bdsm6623783wrr.100.2024.03.11.07.48.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Mar 2024 07:48:59 -0700 (PDT)
Message-ID: <81c7b2c3-564a-4946-832b-5394cd19a7b7@ursulin.net>
Date: Mon, 11 Mar 2024 14:48:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Proposal to add CRIU support to DRM render nodes
Content-Language: en-GB
To: Felix Kuehling <felix.kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 criu@openvz.org
Cc: "Errabolu, Ramesh" <Ramesh.Errabolu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <03a9977c-2044-40c7-9688-9ab326abb81c@amd.com>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <03a9977c-2044-40c7-9688-9ab326abb81c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


Hi Felix,

On 06/12/2023 21:23, Felix Kuehling wrote:
> Executive Summary: We need to add CRIU support to DRM render nodes in 
> order to maintain CRIU support for ROCm application once they start 
> relying on render nodes for more GPU memory management. In this email 
> I'm providing some background why we are doing this, and outlining some 
> of the problems we need to solve to checkpoint and restore render node 
> state and shared memory (DMABuf) state. I have some thoughts on the API 
> design, leaning on what we did for KFD, but would like to get feedback 
> from the DRI community regarding that API and to what extent there is 
> interest in making that generic.
> 
> We are working on using DRM render nodes for virtual address mappings in 
> ROCm applications to implement the CUDA11-style VM API and improve 
> interoperability between graphics and compute. This uses DMABufs for 
> sharing buffer objects between KFD and multiple render node devices, as 
> well as between processes. In the long run this also provides a path to 
> moving all or most memory management from the KFD ioctl API to libdrm.
> 
> Once ROCm user mode starts using render nodes for virtual address 
> management, that creates a problem for checkpointing and restoring ROCm 
> applications with CRIU. Currently there is no support for checkpointing 
> and restoring render node state, other than CPU virtual address 
> mappings. Support will be needed for checkpointing GEM buffer objects 
> and handles, their GPU virtual address mappings and memory sharing 
> relationships between devices and processes.
> 
> Eventually, if full CRIU support for graphics applications is desired, 
> more state would need to be captured, including scheduler contexts and 
> BO lists. Most of this state is driver-specific.
> 
> After some internal discussions we decided to take our design process 
> public as this potentially touches DRM GEM and DMABuf APIs and may have 
> implications for other drivers in the future.
> 
> One basic question before going into any API details: Is there a desire 
> to have CRIU support for other DRM drivers?

This sounds like a very interesting feature on the overall, although I 
cannot answer on the last question here.

Funnily enough, it has a tiny relation to an i915 feature I recently 
implemented on Mesa's request, which is to be able to "upload" the GPU 
context from the GPU hang error state and replay the hanging request. It 
is kind of (at a stretch) a very special tiny subset of checkout and 
restore so I am not mentioning it as a curiosity.

And there is also another partical conceptual intersect with the (at the 
moment not yet upstream) i915 online debugger. This part being in the 
area of discovering and enumerating GPU resources beloning to the client.

I don't see an immediate design or code sharing opportunities though but 
just mentioning.

I did spend some time reading your plugin and kernel implementation out 
of curiousity and have some comments and questions.

> With that out of the way, some considerations for a possible DRM CRIU 
> API (either generic of AMDGPU driver specific): The API goes through 
> several phases during checkpoint and restore:
> 
> Checkpoint:
> 
>  1. Process-info (enumerates objects and sizes so user mode can allocate
>     memory for the checkpoint, stops execution on the GPU)
>  2. Checkpoint (store object metadata for BOs, queues, etc.)
>  3. Unpause (resumes execution after the checkpoint is complete)
> 
> Restore:
> 
>  1. Restore (restore objects, VMAs are not in the right place at this time)
>  2. Resume (final fixups after the VMAs are sorted out, resume execution)

Btw is check-pointing guaranteeing all relevant activity is idled? For 
instance dma_resv objects are free of fences which would need to 
restored for things to continue executing sensibly? Or how is that handled?

> For some more background about our implementation in KFD, you can refer 
> to this whitepaper: 
> https://github.com/checkpoint-restore/criu/blob/criu-dev/plugins/amdgpu/README.md
> 
> Potential objections to a KFD-style CRIU API in DRM render nodes, I'll 
> address each of them in more detail below:
> 
>   * Opaque information in the checkpoint data that user mode can't
>     interpret or do anything with
>   * A second API for creating objects (e.g. BOs) that is separate from
>     the regular BO creation API
>   * Kernel mode would need to be involved in restoring BO sharing
>     relationships rather than replaying BO creation, export and import
>     from user mode
> 
> # Opaque information in the checkpoint
> 
> This comes out of ABI compatibility considerations. Adding any new 
> objects or attributes to the driver/HW state that needs to be 
> checkpointed could potentially break the ABI of the CRIU 
> checkpoint/restore ioctl if the plugin needs to parse that information. 
> Therefore, much of the information in our KFD CRIU ioctl API is opaque. 
> It is written by kernel mode in the checkpoint, it is consumed by kernel 
> mode when restoring the checkpoint, but user mode doesn't care about the 
> contents or binary layout, so there is no user mode ABI to break. This 
> is how we were able to maintain CRIU support when we added the SVM API 
> to KFD without changing the CRIU plugin and without breaking our ABI.
> 
> Opaque information may also lend itself to API abstraction, if this 
> becomes a generic DRM API with driver-specific callbacks that fill in 
> HW-specific opaque data.

This feels sound in principle to me. Fundamentally the state is very 
hardware specfic, and/or driver version specific, so I don't see 
anything could be gained in practice by making it much less opaque. 
(Apart from making things more complicated.)

I was however unsure of the current split of how you dump buffer objects 
with some data in the defined bo structure, and some in completely 
opaque private data. Is there a benefit to that split, or maybe in other 
words, is there a benefit on having part transparent and part opaque for 
buffer objects?

To slightly touch upon the question of whether this could become a 
generic DRM API. It feels it would be hard to do it from the start. What 
sounds more feasible is if/when generic looking helpers can be spotted 
while developing the RFC then potentially structure the code they can 
easily be promoted to shared/common at some future moment.

> # Second API for creating objects
> 
> Creating BOs and other objects when restoring a checkpoint needs more 
> information than the usual BO alloc and similar APIs provide. For 
> example, we need to restore BOs with the same GEM handles so that user 
> mode can continue using those handles after resuming execution. If BOs 
> are shared through DMABufs without dynamic attachment, we need to 
> restore pinned BOs as pinned. Validation of virtual addresses and 
> handling MMU notifiers must be suspended until the virtual address space 
> is restored. For user mode queues we need to save and restore a lot of 
> queue execution state so that execution can resume cleanly.

This also sounds justified to me. Restore creating all internal objects 
is definitely special and sounds better to add uapi to create them 
directly with the correct properties, than to add uapi to adjust 
internal properties after creation. And in case you would always need 
some new uapi - so at least to adjust after creation. At which point you 
may have both in one. Internally implementation can be split or common, 
whatever makes sense for a given object type, but new uapi definitely 
sounds is required.
> # Restoring buffer sharing relationships
> 
> Different GEM handles in different render nodes and processes can refer 
> to the same underlying shared memory, either by directly pointing to the 
> same GEM object, or by creating an import attachment that may get its SG 
> tables invalidated and updated dynamically through dynamic attachment 
> callbacks. In the latter case it's obvious, who is the exporter and who 
> is the importer. In the first case, either one could be the exporter, 
> and it's not clear who would need to create the BO and who would need to 

To see if I follow the former case correctly.

This could be two clients A and B, where B has imported a dma-buf shared 
BO from A and has since closed the dma-buf fd? Which results in a single 
BO with reference count of 2 and obj->import_attach unset. History of 
who created the object is lost.

In fact it could even be that two imported objects remain (clients A, B 
and C) and A, who originally created the BO, has since fully released 
it. So any kind of "creator" tracking if added wouldn't be fully 
reliable either.

> import it when restoring the checkpoint. To further complicate things, 
> multiple processes in a checkpoint get restored concurrently. So there 
> is no guarantee that an exporter has restored a shared BO at the time an 
> importer is trying to restore its import.
> 
> A proposal to deal with these problems would be to treat importers and 
> exporters the same. Whoever restores first, ends up creating the BO and 
> potentially attaching to it. The other process(es) can find BOs that 
> were already restored by another process by looking it up with a unique 
> ID that could be based on the DMABuf inode number. An alternative would 
> be a two-pass approach that needs to restore BOs on two passes:
> 
>  1. Restore exported BOs
>  2. Restore imports
> 
> With some inter-process synchronization in CRIU itself between these two 
> passes. This may require changes in the core CRIU, outside our plugin. 
> Both approaches depend on identifying BOs with some unique ID that could 
> be based on the DMABuf inode number in the checkpoint. However, we would 
> need to identify the processes in the same restore session, possibly 
> based on parent/child process relationships, to create a scope where 
> those IDs are valid during restore.

If my understanding above is on the right track, then I think this is 
the only thing which can be done (for all scenarios).

I also *think* it would be safe. At least at the moment I cannot think 
what could go wrong. Semantics are that it doesn't really matter who 
created the object.

> Finally, we would also need to checkpoint and restore DMABuf file 
> descriptors themselves. These are anonymous file descriptors. The CRIU 
> plugin could probably be taught to recreate them from the original 
> exported BO based on the inode number that could be queried with fstat 
> in the checkpoint. It would need help from the render node CRIU API to 
> find the right BO from the inode, which may be from a different process 
> in the same restore session.

This part feels like it is breaking the component separation a bit 
because even for buffers fully owned by amdgpu, strictly speaking the 
dma-buf fd is not. At least my understanding from the above is that you 
propose to attempt to import the fd, from the kernel side, during the 
checkpoint process? Like:

Checkpoint:

CRIU for each anon fd:
   amdgpu_plugin(fd)
     -> attempt in kernel dma buf import (passes fd to kernel via ioctl?)
         -> is it ours? (no -> error)
             -> create a record mapping fd number to amdgpu BO

Restore:

for each dma-buf fd record:
    create BO if does not exists
    export BO to same fd
    close BO handle if not in regular BO handle records

Or since you mention lookup by inode, that would need to be 
dmabuf_plugin so it can lookup inodes in the private mount space. 
However how would it co-operate with amdgpu_plugin is not clear to me.

Regards,

Tvrtko
