Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A67365FD2
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 20:54:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 016A26E8AA;
	Tue, 20 Apr 2021 18:54:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E2C489E0E
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 18:54:04 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 k14-20020a9d7dce0000b02901b866632f29so36736476otn.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 11:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZpwNimZViYeKtG/b8eep7IvEOAm1XOWwzg5Vn3hbcv0=;
 b=NAuuucltSiKjHvCIENh8yenu12Ji1x3uE20933SOAUy40xfZywb6nrsE/srl7RCM5R
 lMDsTdR+zEOwfZ7OXPLnaNX4kMTc8ANLEkY+Glwp6blgv/PvRNT3VmZWH1xUGG9ze+vz
 PjxCibQHq/j3SNTJbKppCNbpvMeYZ/XDiLa2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZpwNimZViYeKtG/b8eep7IvEOAm1XOWwzg5Vn3hbcv0=;
 b=tQfst+9YRCxwGAMLErUK06MjxByp+GzOYAgip/NBOIJVgTX3iDM4nwwKbunBbYCpWV
 AZP3JvadVjFbfrKkax/p54t4PQ2rVEVd0UyLbruClcKTiihTdOk0SY/zbz1bbo0e+s9i
 V7l0KePUgdb/szam8W4KOS12D6Hxwk6O3RdWzk3VrgVam2VI39FYKzcD/JlYACbloOK8
 E5Slvcq5JomFsLLmc8DKqfWYgp2PWHtLFjJDgZ9GZoG2OyrbokeS8iXAIW4oi+K0YwqN
 7+qIF50sueMhTD3TpDEq3e/Ym3zbxUfIFoQszUcHJdAxjlhy/ORqcjX/giQ6d4IJ9y4J
 a2EQ==
X-Gm-Message-State: AOAM531/lhWEtr6IRs3mSvrgJ1Rjvkrwnh0AdM9GCllixq1268RLqjeR
 +9BcUaDuuhhmEyegrkux5vUeU0fLrgSt57t4I8TYerzVtlM=
X-Google-Smtp-Source: ABdhPJzk8ugQvqe6CQn8Qrk3wO3ROwlNJTs6W9VbPnug+0d66uDTOm7FehSbCEBisLdFOmRqOrz0R5ZYAa59x9kntlk=
X-Received: by 2002:a9d:10a:: with SMTP id 10mr19921304otu.188.1618944843718; 
 Tue, 20 Apr 2021 11:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
 <CAPj87rMn_gabTdZpHGQVa16Log8xFe8fvhcL_WSC6tyOMvmY=w@mail.gmail.com>
 <CAOFGe96c1SxHiUBzapbVFx1h0aOwF=X8hcStVZmrw4OjrrG+Zg@mail.gmail.com>
 <CAPj87rPSW13nxz2n5E+n0JYcwGR3mFWJAG2kYaaoav7A-ZVD2g@mail.gmail.com>
In-Reply-To: <CAPj87rPSW13nxz2n5E+n0JYcwGR3mFWJAG2kYaaoav7A-ZVD2g@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 20 Apr 2021 20:53:52 +0200
Message-ID: <CAKMK7uHyTiFWwQWdxVk1am+KoFA9DsTnJ658CAhzBYOyg7AdsA@mail.gmail.com>
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
To: Daniel Stone <daniel@fooishbar.org>
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
Cc: ML Mesa-dev <mesa-dev@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 20, 2021 at 7:45 PM Daniel Stone <daniel@fooishbar.org> wrote:
>
> Hi,
>
> On Tue, 20 Apr 2021 at 16:46, Jason Ekstrand <jason@jlekstrand.net> wrote:
>>
>> It's still early in the morning here and I'm not awake yet so sorry if
>> this comes out in bits and pieces...
>
>
> No problem, it's helpful. If I weren't on this thread I'd be attempting to put together a 73-piece chest of drawers whose instructions are about as clear as this so far, so I'm in the right head space anyway.
>
>>
>> IMO, there are two problems being solved here which are related in
>> very subtle and tricky ways.  They're also, admittedly, driver
>> problems, not really winsys problems.  Unfortunately, they may have
>> winsys implications.
>
>
> Yeah ... bingo.
>
>>
>> First, is better/real timelines for Vulkan and compute.  [...]
>>
>> We also want something like this for compute workloads.  [...]
>
>
> Totally understand and agree with all of this. Memory fences seem like a good and useful primitive here.
>
>>
>> The second biting issue is that, in the current kernel implementation
>> of dma-fence and dma_resv, we've lumped internal synchronization for
>> memory management together with execution synchronization for
>> userspace dependency tracking.  And we have no way to tell the
>> difference between the two internally.  Even if user space is passing
>> around sync_files and trying to do explicit sync, once you get inside
>> the kernel, they're all dma-fences and it can't tell the difference.
>
>
> Funny, because 'lumped [the two] together' is exactly the crux of my issues ...
>
>>
>> If we move
>
>
> Stop here, because ...
>
>>
>> to a more userspace-controlled synchronization model with
>> wait-before-signal and no timeouts unless requested, regardless of the
>> implementation, it plays really badly dma-fence.  And, by "badly" I
>> mean the two are nearly incompatible.
>
>
> I would go further than that, and say completely, fundamentally, conceptually, incompatible.
>
>>
>> From a user space PoV, it means
>> it's tricky to provide the finite time dma-fence guarantee.  From a
>> kernel PoV, it's way worse.  Currently, the way dma-fence is
>> constructed, it's impossible to deadlock assuming everyone follows the
>> rules.  The moment we allow user space to deadlock itself and allow
>> those deadlocks to leak into the kernel, we have a problem.  Even if
>> we throw in some timeouts, we still have a scenario where user space
>> has one linearizable dependency graph for execution synchronization
>> and the kernel has a different linearizable dependency graph for
>> memory management and, when you smash them together, you may have
>> cycles in your graph.
>>
>> So how do we sort this all out?  Good question.  It's a hard problem.
>> Probably the hardest problem here is the second one: the intermixing
>> of synchronization types.  Solving that one is likely going to require
>> some user space re-plumbing because all the user space APIs we have
>> for explicit sync are built on dma-fence.
>
>
> Gotcha.
>
> Firstly, let's stop, as you say, lumping things together. Timeline semaphores and compute's GPU-side spinlocks etc, are one thing. I accept those now have a hard requirement on something like memory fences, where any responsibility is totally abrogated. So let's run with that in our strawman: Vulkan compute & graphics & transfer queues all degenerate to something spinning (hopefully GPU-assisted gentle spin) on a uint64 somewhere. The kernel has (in the general case) no visibility or responsibility into these things. Fine - that's one side of the story.
>
> But winsys is something _completely_ different. Yes, you're using the GPU to do things with buffers A, B, and C to produce buffer Z. Yes, you're using vkQueuePresentKHR to schedule that work. Yes, Mutter's composition job might depend on a Chromium composition job which depends on GTA's render job which depends on GTA's compute job which might take a year to complete. Mutter's composition job needs to complete in 'reasonable' (again, FSVO) time, no matter what. The two are compatible.
>
> How? Don't lump them together. Isolate them aggressively, and _predictably_ in a way that you can reason about.
>
> What clients do in their own process space is their own business. Games can deadlock themselves if they get wait-before-signal wrong. Compute jobs can run for a year. Their problem. Winsys is not that, because you're crossing every isolation boundary possible. Process, user, container, VM - every kind of privilege boundary. Thus far, dma_fence has protected us from the most egregious abuses by guaranteeing bounded-time completion; it also acts as a sequencing primitive, but from the perspective of a winsys person that's of secondary importance, which is probably one of the bigger disconnects between winsys people and GPU driver people.
>
> Anyway, one of the great things about winsys (there are some! trust me) is we don't need to be as hopelessly general as for game engines, nor as hyperoptimised. We place strict demands on our clients, and we literally kill them every single time they get something wrong in a way that's visible to us. Our demands on the GPU are so embarrassingly simple that you can run every modern desktop environment on GPUs which don't have unified shaders. And on certain platforms who don't share tiling formats between texture/render-target/scanout ... and it all still runs fast enough that people don't complain.
>
> We're happy to bear the pain of being the ones setting strict and unreasonable expectations. To me, this 'present ioctl' falls into the uncanny valley of the kernel trying to bear too much of the weight to be tractable, whilst not bearing enough of the weight to be useful for winsys.
>
> So here's my principles for a counter-strawman:
>
> Remove the 'return fence'. Burn it with fire, do not look back. Modern presentation pipelines are not necessarily 1:1, they are not necessarily FIFO (as opposed to mailbox), and they are not necessarily round-robin either. The current proposal provides no tangible benefits to modern userspace, and fixing that requires either hobbling userspace to remove capability and flexibility (ironic given that the motivation for this is all about userspace flexibility?), or pushing so much complexity into the kernel that we break it forever (you can't compile Mutter's per-frame decision tree into eBPF).
>
> Give us a primitive representing work completion, so we can keep optimistically pipelining operations. We're happy to pass around explicit-synchronisation tokens (dma_fence, drm_syncobj, drm_newthing, whatever it is): plumbing through a sync token to synchronise compositor operations against client operations in both directions is just a matter of boring typing.
>
> Make that primitive something that is every bit as usable across subsystems as it is across processes. It should be a lowest common denominator for middleware that ultimately provokes GPU execbuf, KMS commit, and media codec ops; currently that would be both wait and signal for all of VkSemaphore, EGLSyncKHR, KMS fence, V4L (D)QBUF, and VA-API {en,de}code ops. It must be exportable to and importable from an FD, which can be poll()ed on and read(). GPU-side visibility for late binding is nice, but not at all essential.
>
> Make that primitive complete in 'reasonable' time, no matter what. There will always be failures in extremis, no matter what the design: absent hard-realtime principles from hardware all the way up to userspace, something will always be able to fail somewhere: non-terminating GPU work, actual GPU hang/reset, GPU queue DoSed, CPU scheduler, I/O DoSed. As long as the general case is bounded-time completion, each of these can be mitigated separately as long as userspace has enough visibility into the underlying mechanics, and cares enough to take meaningful action on it.
>
> And something more concrete:
>
> dma_fence.
>
> This already has all of the properties described above. Kernel-wise, it already devolves to CPU-side signaling when it crosses device boundaries. We need to support it roughly forever since it's been plumbed so far and so wide. Any primitive which is acceptable for winsys-like usage which crosses so many device/subsystem/process/security boundaries has to meet the same requirements. So why reinvent something which looks so similar, and has the same requirements of the kernel babysitting completion, providing little to no benefit for that difference?
>
> It's not usable for complex usecases, as we've established, but winsys is not that usecase. We can draw a hard boundary between the two worlds. For example, a client could submit an infinitely deep CS -> VS/FS/etc job chain with potentially-infinite completion, with the FS output being passed to the winsys for composition. Draw the line post-FS: export a dma_fence against FS completion. But instead of this being based on monitoring the _fence_ per se, base it on monitoring the job; if the final job doesn't retire in reasonable time, signal the fence and signal (like, SIGKILL, or just tear down the context and permanently -EIO, whatever) the client. Maybe for future hardware that would be the same thing - the kernel setting a timeout and comparing a read on a particular address against a particular value - but the 'present fence' proposal seems like it requires exactly this anyway.

Yeah return fence for flips/presents sounds unappealing. Android tried
it, we convinced them it's not great and they changed that.

> That to me is the best compromise. We allow clients complete arbitrary flexibility, but as soon as they vkQueuePresentKHR, they're crossing a boundary out of happy fun GPU land and into strange hostile winsys land. We've got a lot of practice at being the bad guys who hate users and are always trying to ruin their dreams, so we'll happily wear the impact of continuing to do that. In doing so, we collectively don't have to invent a third new synchronisation primitive (to add to dma_fence and drm_syncobj) and a third new synchronisation model (implicit sync, explicit-but-bounded sync, explicit-and-maybe-unbounded sync) to support this, and we don't have to do an NT4 where GDI was shoved into the kernel.
>
> It doesn't help with the goal of ridding dma_fence from the kernel, but it does very clearly segregate the two worlds. Drawing that hard boundary would allow drivers to hyperoptimise for clients which want to be extremely clever and agile and quick because they're sailing so close to the wind that they cannot bear the overhead of dma_fence, whilst also providing the guarantees we need when crossing isolation boundaries. In the latter case, the overhead of bouncing into a less-optimised primitive is totally acceptable because it's not even measurable: vkQueuePresentKHR requires client CPU activity -> kernel IPC -> compositor CPU activity -> wait for repaint cycle -> prepare scene -> composition, against which dma_fence overhead isn't and will never be measurable (even if it doesn't cross device/subsystem boundaries, which it probably does). And the converse for vkAcquireNextImageKHR.
>
> tl;dr: we don't need to move winsys into the kernel, winsys and compute don't need to share sync primitives, the client/winsys boundary does need to have a sync primitive does need strong and onerous guarantees, and that transition can be several orders of magnitude less efficient than intra-client sync primitives
>
> Shoot me down. :)

So I can mostly get behind this, except it's _not_ going to be
dma_fence. That thing has horrendous internal ordering constraints
within the kernel, and the one thing that doesn't allow you is to make
a dma_fence depend upon a userspace fence.

But what we can do is use the same currently existing container
objects like drm_syncobj or sync_file (timeline syncobj would fit best
tbh), and stuff a userspace fence behind it. The only trouble is that
currently timeline syncobj implement vulkan's spec, which means if you
build a wait-before-signal deadlock, you'll wait forever. Well until
the user ragequits and kills your process.

So for winsys we'd need to be able to specify the wait timeout
somewhere for waiting for that dma_fence to materialize (plus the
submit thread, but userspace needs that anyway to support timeline
syncobj) if you're importing an untrusted timeline syncobj. And I
think that's roughly it.

The fancy version would allow you to access the underlying memory
fence from the cmd streamer and do fancy conditional rendering and fun
stuff like that (pick old/new frame depending which one is ready), but
that's the fancy advanced compositor on top here. The "give me the
same thing as I get with dma_fence implicit sync today" would just
need the timeout for imporiting untrusted timeline syncobj.

So a vk extension, and also probably a gl extension for timeline
syncobj (not sure that exists already), which probably wants to
specify the reasonable timeout limit by default. Because that's more
the gl way of doing things.

Oh also I really don't want to support this for implicit sync, but
heck we could even do that. It would stall pretty bad because there's
no submit thread in userspace. But we could then optimize that with
some new dma-buf ioctl to get out the syncobj, kinda like what Jason
has already proposed for sync_file or so. And then userspace which has
a submit thread could handle it correctly.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
