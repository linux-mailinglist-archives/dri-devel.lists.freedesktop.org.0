Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EDC365EE4
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 20:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B07476E88C;
	Tue, 20 Apr 2021 18:00:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 262856E88C;
 Tue, 20 Apr 2021 18:00:30 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id g5so52903121ejx.0;
 Tue, 20 Apr 2021 11:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=Dy70cHeXSdpse9s/ZNZkH5VB+dL4MFlfxd+1tavevYA=;
 b=M3pvGih8na9G8QsgERSEgkACur+zTlJ3sJN3gWgXt5XlhCjxUhArJiUukXj3SM/u9Z
 3UaQgGOch2KYKaFgYfijEk2DqqcJkeruM3GIXPkv2olR7I4hLHfDgQJ1hSzjxgPCkxrl
 y4p44kvOid22QKvtW36OEF0ZuNsmBPeBBUkSxNFQVTkOG/gW+qIKmI+HlSzwo6otB0qr
 QON2JPoTkCRGfS5TIKCVz0cjERfD7ml/VuNwUYWNcaCVsjQLOKf+bzhPVJm60XJXUhcP
 8U/7x/U168Qv3lDr5HeZKa9yIXRTxmDxS5s8zZHisXtFqWLOL0MJVvqB8NJ7gEmAJ0GE
 y75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=Dy70cHeXSdpse9s/ZNZkH5VB+dL4MFlfxd+1tavevYA=;
 b=HzguHuOvWMf11qXbNIL4W/0X1lXLKTREgYVDJwiSJ6vYq8GTrTy4ZCOsZktlPLm167
 Uvok1GfRsFohyk8p9B1dFbWOk7LnlCrDP3N20FA+gnIWJDUdWJgU71LZ9MQO/f8Q/4xJ
 3ot4x6WmJ2nBYH44w7zBSGkwgc/9QP1OmTIs8HD1UFWeDCU8GDtfaGdYhNP5OE1R363j
 W0YAcgnzA/Vsj8EQkDn/uY/+mkqH77ulzf5AD5yrvfbd9ZA5MjxR3+s4C8S4xmmBGIB1
 EaB36BctpRIkl7HXBYiD7fJlQ5X7kqiGOA6ZGwhG//LRSWZQ0DVqgMR5XS7yL3q7LXxz
 817A==
X-Gm-Message-State: AOAM5325nELWSVgK/CD+mHL33s4PF39T8/lVanUx/UwMdo+R05JvIHZB
 I/VUnGT77S3E9/LZX5Oa8izgegvCRDo=
X-Google-Smtp-Source: ABdhPJyw8O0DWnTJAJ5wE6mPzFu4SLXgol9eysaBz0U7msrypWixW8bhVIM09W8cerk2ZVyNp2MBHA==
X-Received: by 2002:a17:907:1c08:: with SMTP id
 nc8mr29290602ejc.378.1618941629048; 
 Tue, 20 Apr 2021 11:00:29 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:9c49:d085:887d:2485?
 ([2a02:908:1252:fb60:9c49:d085:887d:2485])
 by smtp.gmail.com with ESMTPSA id u24sm16558392edt.85.2021.04.20.11.00.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 11:00:28 -0700 (PDT)
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
To: Daniel Stone <daniel@fooishbar.org>, Jason Ekstrand <jason@jlekstrand.net>
References: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
 <CAPj87rMn_gabTdZpHGQVa16Log8xFe8fvhcL_WSC6tyOMvmY=w@mail.gmail.com>
 <CAOFGe96c1SxHiUBzapbVFx1h0aOwF=X8hcStVZmrw4OjrrG+Zg@mail.gmail.com>
 <CAPj87rPSW13nxz2n5E+n0JYcwGR3mFWJAG2kYaaoav7A-ZVD2g@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <2ee6acde-5643-0597-017b-7e20bd1a704d@gmail.com>
Date: Tue, 20 Apr 2021 20:00:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAPj87rPSW13nxz2n5E+n0JYcwGR3mFWJAG2kYaaoav7A-ZVD2g@mail.gmail.com>
Content-Language: en-US
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
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1999806660=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============1999806660==
Content-Type: multipart/alternative;
 boundary="------------34956018A8A21DAA6EBA040A"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------34956018A8A21DAA6EBA040A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



Am 20.04.21 um 19:44 schrieb Daniel Stone:
> Hi,
>
> On Tue, 20 Apr 2021 at 16:46, Jason Ekstrand <jason@jlekstrand.net 
> <mailto:jason@jlekstrand.net>> wrote:
>
>     It's still early in the morning here and I'm not awake yet so sorry if
>     this comes out in bits and pieces...
>
>
> No problem, it's helpful. If I weren't on this thread I'd be 
> attempting to put together a 73-piece chest of drawers whose 
> instructions are about as clear as this so far, so I'm in the right 
> head space anyway.
>
>     IMO, there are two problems being solved here which are related in
>     very subtle and tricky ways.  They're also, admittedly, driver
>     problems, not really winsys problems.  Unfortunately, they may have
>     winsys implications.
>
>
> Yeah ... bingo.
>
>     First, is better/real timelines for Vulkan and compute. [...]
>
>     We also want something like this for compute workloads. [...]
>
>
> Totally understand and agree with all of this. Memory fences seem like 
> a good and useful primitive here.

Completely agree.

>     The second biting issue is that, in the current kernel implementation
>     of dma-fence and dma_resv, we've lumped internal synchronization for
>     memory management together with execution synchronization for
>     userspace dependency tracking.  And we have no way to tell the
>     difference between the two internally.  Even if user space is passing
>     around sync_files and trying to do explicit sync, once you get inside
>     the kernel, they're all dma-fences and it can't tell the difference.
>
>
> Funny, because 'lumped [the two] together' is exactly the crux of my 
> issues ...
>
>     If we move
>
>
> Stop here, because ...
>
>     to a more userspace-controlled synchronization model with
>     wait-before-signal and no timeouts unless requested, regardless of the
>     implementation, it plays really badly dma-fence.  And, by "badly" I
>     mean the two are nearly incompatible.
>
>
> I would go further than that, and say completely, fundamentally, 
> conceptually, incompatible.

+1

>     From a user space PoV, it means
>     it's tricky to provide the finite time dma-fence guarantee. From a
>     kernel PoV, it's way worse.  Currently, the way dma-fence is
>     constructed, it's impossible to deadlock assuming everyone follows the
>     rules.  The moment we allow user space to deadlock itself and allow
>     those deadlocks to leak into the kernel, we have a problem. Even if
>     we throw in some timeouts, we still have a scenario where user space
>     has one linearizable dependency graph for execution synchronization
>     and the kernel has a different linearizable dependency graph for
>     memory management and, when you smash them together, you may have
>     cycles in your graph.
>
>     So how do we sort this all out?  Good question.  It's a hard problem.
>     Probably the hardest problem here is the second one: the intermixing
>     of synchronization types.  Solving that one is likely going to require
>     some user space re-plumbing because all the user space APIs we have
>     for explicit sync are built on dma-fence.
>
>
> Gotcha.
>
> Firstly, let's stop, as you say, lumping things together. Timeline 
> semaphores and compute's GPU-side spinlocks etc, are one thing. I 
> accept those now have a hard requirement on something like memory 
> fences, where any responsibility is totally abrogated. So let's run 
> with that in our strawman: Vulkan compute & graphics & transfer queues 
> all degenerate to something spinning (hopefully GPU-assisted gentle 
> spin) on a uint64 somewhere. The kernel has (in the general case) no 
> visibility or responsibility into these things. Fine - that's one side 
> of the story.

Exactly, yes.

>
> But winsys is something _completely_ different. Yes, you're using the 
> GPU to do things with buffers A, B, and C to produce buffer Z. Yes, 
> you're using vkQueuePresentKHR to schedule that work. Yes, Mutter's 
> composition job might depend on a Chromium composition job which 
> depends on GTA's render job which depends on GTA's compute job which 
> might take a year to complete. Mutter's composition job needs to 
> complete in 'reasonable' (again, FSVO) time, no matter what. The two 
> are compatible.
>
> How? Don't lump them together. Isolate them aggressively, and 
> _predictably_ in a way that you can reason about.
>
> What clients do in their own process space is their own 
> business. Games can deadlock themselves if they get wait-before-signal 
> wrong. Compute jobs can run for a year. Their problem. Winsys is not 
> that, because you're crossing every isolation boundary possible. 
> Process, user, container, VM - every kind of privilege boundary. Thus 
> far, dma_fence has protected us from the most egregious abuses by 
> guaranteeing bounded-time completion; it also acts as a sequencing 
> primitive, but from the perspective of a winsys person that's of 
> secondary importance, which is probably one of the bigger disconnects 
> between winsys people and GPU driver people.

Finally somebody who understands me :)

Well the question is then how do we get winsys and your own process 
space together then?

>
> Anyway, one of the great things about winsys (there are some! trust 
> me) is we don't need to be as hopelessly general as for game engines, 
> nor as hyperoptimised. We place strict demands on our clients, and we 
> literally kill them every single time they get something wrong in a 
> way that's visible to us. Our demands on the GPU are so embarrassingly 
> simple that you can run every modern desktop environment on GPUs which 
> don't have unified shaders. And on certain platforms who don't share 
> tiling formats between texture/render-target/scanout ... and it all 
> still runs fast enough that people don't complain.

Ignoring everything below since that is the display pipeline I'm not 
really interested in. My concern is how to get the buffer from the 
client to the server without allowing the client to get the server into 
trouble?

My thinking is still to use timeouts to acquire texture locks. E.g. when 
the compositor needs to access texture it grabs a lock and if that lock 
isn't available in less than 20ms whoever is holding it is killed hard 
and the lock given to the compositor.

It's perfectly fine if a process has a hung queue, but if it tries to 
send buffers which should be filled by that queue to the compositor it 
just gets a corrupted window content.

Regards,
Christian.

>
> We're happy to bear the pain of being the ones setting strict and 
> unreasonable expectations. To me, this 'present ioctl' falls into the 
> uncanny valley of the kernel trying to bear too much of the weight to 
> be tractable, whilst not bearing enough of the weight to be useful for 
> winsys.
>
> So here's my principles for a counter-strawman:
>
> Remove the 'return fence'. Burn it with fire, do not look back. Modern 
> presentation pipelines are not necessarily 1:1, they are not 
> necessarily FIFO (as opposed to mailbox), and they are not necessarily 
> round-robin either. The current proposal provides no tangible benefits 
> to modern userspace, and fixing that requires either hobbling 
> userspace to remove capability and flexibility (ironic given that the 
> motivation for this is all about userspace flexibility?), or pushing 
> so much complexity into the kernel that we break it forever (you can't 
> compile Mutter's per-frame decision tree into eBPF).
>
> Give us a primitive representing work completion, so we can keep 
> optimistically pipelining operations. We're happy to pass around 
> explicit-synchronisation tokens (dma_fence, drm_syncobj, drm_newthing, 
> whatever it is): plumbing through a sync token to synchronise 
> compositor operations against client operations in both directions is 
> just a matter of boring typing.
>
> Make that primitive something that is every bit as usable across 
> subsystems as it is across processes. It should be a lowest common 
> denominator for middleware that ultimately provokes GPU execbuf, KMS 
> commit, and media codec ops; currently that would be both wait and 
> signal for all of VkSemaphore, EGLSyncKHR, KMS fence, V4L (D)QBUF, and 
> VA-API {en,de}code ops. It must be exportable to and importable from 
> an FD, which can be poll()ed on and read(). GPU-side visibility for 
> late binding is nice, but not at all essential.
>
> Make that primitive complete in 'reasonable' time, no matter what. 
> There will always be failures in extremis, no matter what the design: 
> absent hard-realtime principles from hardware all the way up to 
> userspace, something will always be able to fail somewhere: 
> non-terminating GPU work, actual GPU hang/reset, GPU queue DoSed, CPU 
> scheduler, I/O DoSed. As long as the general case is bounded-time 
> completion, each of these can be mitigated separately as long as 
> userspace has enough visibility into the underlying mechanics, and 
> cares enough to take meaningful action on it.
>
> And something more concrete:
>
> dma_fence.
>
> This already has all of the properties described above. Kernel-wise, 
> it already devolves to CPU-side signaling when it crosses device 
> boundaries. We need to support it roughly forever since it's been 
> plumbed so far and so wide. Any primitive which is acceptable for 
> winsys-like usage which crosses so many 
> device/subsystem/process/security boundaries has to meet the same 
> requirements. So why reinvent something which looks so similar, and 
> has the same requirements of the kernel babysitting completion, 
> providing little to no benefit for that difference?
>
> It's not usable for complex usecases, as we've established, but winsys 
> is not that usecase. We can draw a hard boundary between the two 
> worlds. For example, a client could submit an infinitely deep CS -> 
> VS/FS/etc job chain with potentially-infinite completion, with the FS 
> output being passed to the winsys for composition. Draw the line 
> post-FS: export a dma_fence against FS completion. But instead of this 
> being based on monitoring the _fence_ per se, base it on monitoring 
> the job; if the final job doesn't retire in reasonable time, signal 
> the fence and signal (like, SIGKILL, or just tear down the context and 
> permanently -EIO, whatever) the client. Maybe for future hardware that 
> would be the same thing - the kernel setting a timeout and comparing a 
> read on a particular address against a particular value - but the 
> 'present fence' proposal seems like it requires exactly this anyway.
>
> That to me is the best compromise. We allow clients complete arbitrary 
> flexibility, but as soon as they vkQueuePresentKHR, they're crossing a 
> boundary out of happy fun GPU land and into strange hostile winsys 
> land. We've got a lot of practice at being the bad guys who hate users 
> and are always trying to ruin their dreams, so we'll happily wear the 
> impact of continuing to do that. In doing so, we collectively don't 
> have to invent a third new synchronisation primitive (to add to 
> dma_fence and drm_syncobj) and a third new synchronisation model 
> (implicit sync, explicit-but-bounded sync, 
> explicit-and-maybe-unbounded sync) to support this, and we don't have 
> to do an NT4 where GDI was shoved into the kernel.
>
> It doesn't help with the goal of ridding dma_fence from the kernel, 
> but it does very clearly segregate the two worlds. Drawing that hard 
> boundary would allow drivers to hyperoptimise for clients which want 
> to be extremely clever and agile and quick because they're sailing so 
> close to the wind that they cannot bear the overhead of dma_fence, 
> whilst also providing the guarantees we need when crossing isolation 
> boundaries. In the latter case, the overhead of bouncing into a 
> less-optimised primitive is totally acceptable because it's not even 
> measurable: vkQueuePresentKHR requires client CPU activity -> kernel 
> IPC -> compositor CPU activity -> wait for repaint cycle -> prepare 
> scene -> composition, against which dma_fence overhead isn't and will 
> never be measurable (even if it doesn't cross device/subsystem 
> boundaries, which it probably does). And the converse for 
> vkAcquireNextImageKHR.
>
> tl;dr: we don't need to move winsys into the kernel, winsys and 
> compute don't need to share sync primitives, the client/winsys 
> boundary does need to have a sync primitive does need strong and 
> onerous guarantees, and that transition can be several orders of 
> magnitude less efficient than intra-client sync primitives
>
> Shoot me down. :)
>
> Cheers,
> Daniel
>
> _______________________________________________
> mesa-dev mailing list
> mesa-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/mesa-dev


--------------34956018A8A21DAA6EBA040A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">Am 20.04.21 um 19:44 schrieb Daniel
      Stone:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAPj87rPSW13nxz2n5E+n0JYcwGR3mFWJAG2kYaaoav7A-ZVD2g@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">Hi,</div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Tue, 20 Apr 2021 at
            16:46, Jason Ekstrand &lt;<a
              href="mailto:jason@jlekstrand.net" moz-do-not-send="true">jason@jlekstrand.net</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">It's still early in the
            morning here and I'm not awake yet so sorry if<br>
            this comes out in bits and pieces...<br>
          </blockquote>
          <div><br>
          </div>
          <div>No problem, it's helpful. If I weren't on this thread I'd
            be attempting to put together a 73-piece chest of drawers
            whose instructions are about as clear as this so far, so I'm
            in the right head space anyway.</div>
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            IMO, there are two problems being solved here which are
            related in<br>
            very subtle and tricky ways.  They're also, admittedly,
            driver<br>
            problems, not really winsys problems.  Unfortunately, they
            may have<br>
            winsys implications.<br>
          </blockquote>
          <div><br>
          </div>
          <div>Yeah ... bingo.</div>
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            First, is better/real timelines for Vulkan and compute. 
            [...]<br>
            <br>
            We also want something like this for compute workloads. 
            [...]<br>
          </blockquote>
          <div><br>
          </div>
          <div>Totally understand and agree with all of this. Memory
            fences seem like a good and useful primitive here.</div>
        </div>
      </div>
    </blockquote>
    <br>
    Completely agree.<br>
    <br>
    <blockquote type="cite"
cite="mid:CAPj87rPSW13nxz2n5E+n0JYcwGR3mFWJAG2kYaaoav7A-ZVD2g@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            The second biting issue is that, in the current kernel
            implementation<br>
            of dma-fence and dma_resv, we've lumped internal
            synchronization for<br>
            memory management together with execution synchronization
            for<br>
            userspace dependency tracking.  And we have no way to tell
            the<br>
            difference between the two internally.  Even if user space
            is passing<br>
            around sync_files and trying to do explicit sync, once you
            get inside<br>
            the kernel, they're all dma-fences and it can't tell the
            difference.<br>
          </blockquote>
          <div><br>
          </div>
          <div>Funny, because 'lumped [the two] together' is exactly the
            crux of my issues ...</div>
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            If we move</blockquote>
          <div><br>
          </div>
          <div>Stop here, because ...</div>
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">to a more
            userspace-controlled synchronization model with<br>
            wait-before-signal and no timeouts unless requested,
            regardless of the<br>
            implementation, it plays really badly dma-fence.  And, by
            "badly" I<br>
            mean the two are nearly incompatible.</blockquote>
          <div><br>
          </div>
          <div>I would go further than that, and say completely,
            fundamentally, conceptually, incompatible.</div>
        </div>
      </div>
    </blockquote>
    <br>
    +1<br>
    <br>
    <blockquote type="cite"
cite="mid:CAPj87rPSW13nxz2n5E+n0JYcwGR3mFWJAG2kYaaoav7A-ZVD2g@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">From a user space PoV, it
            means<br>
            it's tricky to provide the finite time dma-fence guarantee. 
            From a<br>
            kernel PoV, it's way worse.  Currently, the way dma-fence is<br>
            constructed, it's impossible to deadlock assuming everyone
            follows the<br>
            rules.  The moment we allow user space to deadlock itself
            and allow<br>
            those deadlocks to leak into the kernel, we have a problem. 
            Even if<br>
            we throw in some timeouts, we still have a scenario where
            user space<br>
            has one linearizable dependency graph for execution
            synchronization<br>
            and the kernel has a different linearizable dependency graph
            for<br>
            memory management and, when you smash them together, you may
            have<br>
            cycles in your graph.<br>
            <br>
            So how do we sort this all out?  Good question.  It's a hard
            problem.<br>
            Probably the hardest problem here is the second one: the
            intermixing<br>
            of synchronization types.  Solving that one is likely going
            to require<br>
            some user space re-plumbing because all the user space APIs
            we have<br>
            for explicit sync are built on dma-fence.<br>
          </blockquote>
          <div><br>
          </div>
          <div>Gotcha.</div>
          <div><br>
          </div>
          <div>Firstly, let's stop, as you say, lumping things together.
            Timeline semaphores and compute's GPU-side spinlocks etc,
            are one thing. I accept those now have a hard requirement on
            something like memory fences, where any responsibility is
            totally abrogated. So let's run with that in our strawman:
            Vulkan compute &amp; graphics &amp; transfer queues all
            degenerate to something spinning (hopefully GPU-assisted
            gentle spin) on a uint64 somewhere. The kernel has (in the
            general case) no visibility or responsibility into these
            things. Fine - that's one side of the story.</div>
        </div>
      </div>
    </blockquote>
    <br>
    Exactly, yes.<br>
    <br>
    <blockquote type="cite"
cite="mid:CAPj87rPSW13nxz2n5E+n0JYcwGR3mFWJAG2kYaaoav7A-ZVD2g@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <div>But winsys is something _completely_ different. Yes,
            you're using the GPU to do things with buffers A, B, and C
            to produce buffer Z. Yes, you're using vkQueuePresentKHR to
            schedule that work. Yes, Mutter's composition job might
            depend on a Chromium composition job which depends on GTA's
            render job which depends on GTA's compute job which might
            take a year to complete. Mutter's composition job needs to
            complete in 'reasonable' (again, FSVO) time, no matter what.
            The two are compatible.</div>
          <div><br>
          </div>
          <div>How? Don't lump them together. Isolate them
            aggressively, and _predictably_ in a way that you can reason
            about.</div>
          <div><br>
          </div>
          <div>What clients do in their own process space is their own
            business. Games can deadlock themselves if they get
            wait-before-signal wrong. Compute jobs can run for a year.
            Their problem. Winsys is not that, because you're crossing
            every isolation boundary possible. Process, user, container,
            VM - every kind of privilege boundary. Thus far, dma_fence
            has protected us from the most egregious abuses by
            guaranteeing bounded-time completion; it also acts as a
            sequencing primitive, but from the perspective of a winsys
            person that's of secondary importance, which is probably one
            of the bigger disconnects between winsys people and GPU
            driver people.</div>
        </div>
      </div>
    </blockquote>
    <br>
    Finally somebody who understands me :)<br>
    <br>
    Well the question is then how do we get winsys and your own process
    space together then?<br>
    <br>
    <blockquote type="cite"
cite="mid:CAPj87rPSW13nxz2n5E+n0JYcwGR3mFWJAG2kYaaoav7A-ZVD2g@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <div>Anyway, one of the great things about winsys (there are
            some! trust me) is we don't need to be as hopelessly general
            as for game engines, nor as hyperoptimised. We place strict
            demands on our clients, and we literally kill them every
            single time they get something wrong in a way that's visible
            to us. Our demands on the GPU are so embarrassingly simple
            that you can run every modern desktop environment on GPUs
            which don't have unified shaders. And on certain platforms
            who don't share tiling formats between
            texture/render-target/scanout ... and it all still runs fast
            enough that people don't complain.</div>
        </div>
      </div>
    </blockquote>
    <br>
    Ignoring everything below since that is the display pipeline I'm not
    really interested in. My concern is how to get the buffer from the
    client to the server without allowing the client to get the server
    into trouble?<br>
    <br>
    My thinking is still to use timeouts to acquire texture locks. E.g.
    when the compositor needs to access texture it grabs a lock and if
    that lock isn't available in less than 20ms whoever is holding it is
    killed hard and the lock given to the compositor.<br>
    <br>
    It's perfectly fine if a process has a hung queue, but if it tries
    to send buffers which should be filled by that queue to the
    compositor it just gets a corrupted window content.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite"
cite="mid:CAPj87rPSW13nxz2n5E+n0JYcwGR3mFWJAG2kYaaoav7A-ZVD2g@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <div>We're happy to bear the pain of being the ones setting
            strict and unreasonable expectations. To me, this 'present
            ioctl' falls into the uncanny valley of the kernel trying to
            bear too much of the weight to be tractable, whilst not
            bearing enough of the weight to be useful for winsys.</div>
          <div><br>
          </div>
          <div>So here's my principles for a counter-strawman:</div>
          <div><br>
          </div>
          <div>Remove the 'return fence'. Burn it with fire, do not look
            back. Modern presentation pipelines are not necessarily 1:1,
            they are not necessarily FIFO (as opposed to mailbox), and
            they are not necessarily round-robin either. The current
            proposal provides no tangible benefits to modern userspace,
            and fixing that requires either hobbling userspace to remove
            capability and flexibility (ironic given that the motivation
            for this is all about userspace flexibility?), or pushing so
            much complexity into the kernel that we break it forever
            (you can't compile Mutter's per-frame decision tree into
            eBPF).</div>
          <div><br>
          </div>
          <div>Give us a primitive representing work completion, so we
            can keep optimistically pipelining operations. We're happy
            to pass around explicit-synchronisation tokens (dma_fence,
            drm_syncobj, drm_newthing, whatever it is): plumbing through
            a sync token to synchronise compositor operations against
            client operations in both directions is just a matter of
            boring typing.</div>
          <div><br>
          </div>
          <div>Make that primitive something that is every bit as usable
            across subsystems as it is across processes. It should be a
            lowest common denominator for middleware that ultimately
            provokes GPU execbuf, KMS commit, and media codec ops;
            currently that would be both wait and signal for all
            of VkSemaphore, EGLSyncKHR, KMS fence, V4L (D)QBUF, and
            VA-API {en,de}code ops. It must be exportable to and
            importable from an FD, which can be poll()ed on and read().
            GPU-side visibility for late binding is nice, but not at all
            essential.</div>
          <div><br>
          </div>
          <div>Make that primitive complete in 'reasonable' time, no
            matter what. There will always be failures in extremis, no
            matter what the design: absent hard-realtime principles from
            hardware all the way up to userspace, something will always
            be able to fail somewhere: non-terminating GPU work, actual
            GPU hang/reset, GPU queue DoSed, CPU scheduler, I/O DoSed.
            As long as the general case is bounded-time completion, each
            of these can be mitigated separately as long as userspace
            has enough visibility into the underlying mechanics, and
            cares enough to take meaningful action on it.</div>
          <div><br>
          </div>
          <div>And something more concrete:</div>
          <div><br>
          </div>
          <div>dma_fence.</div>
          <div><br>
          </div>
          <div>This already has all of the properties described above.
            Kernel-wise, it already devolves to CPU-side signaling when
            it crosses device boundaries. We need to support it roughly
            forever since it's been plumbed so far and so wide. Any
            primitive which is acceptable for winsys-like usage which
            crosses so many device/subsystem/process/security boundaries
            has to meet the same requirements. So why reinvent something
            which looks so similar, and has the same requirements of the
            kernel babysitting completion, providing little to no
            benefit for that difference?</div>
          <div><br>
          </div>
          <div>It's not usable for complex usecases, as we've
            established, but winsys is not that usecase. We can draw a
            hard boundary between the two worlds. For example, a client
            could submit an infinitely deep CS -&gt; VS/FS/etc job chain
            with potentially-infinite completion, with the FS output
            being passed to the winsys for composition. Draw the line
            post-FS: export a dma_fence against FS completion. But
            instead of this being based on monitoring the _fence_ per
            se, base it on monitoring the job; if the final job doesn't
            retire in reasonable time, signal the fence and signal
            (like, SIGKILL, or just tear down the context and
            permanently -EIO, whatever) the client. Maybe for future
            hardware that would be the same thing - the kernel setting a
            timeout and comparing a read on a particular address against
            a particular value - but the 'present fence' proposal seems
            like it requires exactly this anyway.</div>
          <div><br>
          </div>
          <div>That to me is the best compromise. We allow clients
            complete arbitrary flexibility, but as soon as they
            vkQueuePresentKHR, they're crossing a boundary out of happy
            fun GPU land and into strange hostile winsys land. We've got
            a lot of practice at being the bad guys who hate users and
            are always trying to ruin their dreams, so we'll happily
            wear the impact of continuing to do that. In doing so, we
            collectively don't have to invent a third new
            synchronisation primitive (to add to dma_fence and
            drm_syncobj) and a third new synchronisation model (implicit
            sync, explicit-but-bounded sync,
            explicit-and-maybe-unbounded sync) to support this, and we
            don't have to do an NT4 where GDI was shoved into the
            kernel.</div>
          <div><br>
          </div>
          <div>It doesn't help with the goal of ridding dma_fence from
            the kernel, but it does very clearly segregate the two
            worlds. Drawing that hard boundary would allow drivers to
            hyperoptimise for clients which want to be extremely clever
            and agile and quick because they're sailing so close to the
            wind that they cannot bear the overhead of dma_fence, whilst
            also providing the guarantees we need when crossing
            isolation boundaries. In the latter case, the overhead of
            bouncing into a less-optimised primitive is totally
            acceptable because it's not even measurable:
            vkQueuePresentKHR requires client CPU activity -&gt; kernel
            IPC -&gt; compositor CPU activity -&gt; wait for repaint
            cycle -&gt; prepare scene -&gt; composition, against which
            dma_fence overhead isn't and will never be measurable (even
            if it doesn't cross device/subsystem boundaries, which it
            probably does). And the converse for vkAcquireNextImageKHR.</div>
          <div><br>
          </div>
          <div>tl;dr: we don't need to move winsys into the kernel,
            winsys and compute don't need to share sync primitives, the
            client/winsys boundary does need to have a sync primitive
            does need strong and onerous guarantees, and that transition
            can be several orders of magnitude less efficient than
            intra-client sync primitives</div>
          <div><br>
          </div>
          <div>Shoot me down. :)</div>
          <div><br>
          </div>
          <div>Cheers,</div>
          <div>Daniel </div>
        </div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
mesa-dev mailing list
<a class="moz-txt-link-abbreviated" href="mailto:mesa-dev@lists.freedesktop.org">mesa-dev@lists.freedesktop.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/mesa-dev">https://lists.freedesktop.org/mailman/listinfo/mesa-dev</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------34956018A8A21DAA6EBA040A--

--===============1999806660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1999806660==--
