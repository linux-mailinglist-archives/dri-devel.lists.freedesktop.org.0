Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A14F837261D
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 09:01:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06CD86EA86;
	Tue,  4 May 2021 07:01:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 897666EA86;
 Tue,  4 May 2021 07:01:26 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id zg3so11501814ejb.8;
 Tue, 04 May 2021 00:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=feWU1prEGzYZUSUKUDYThfwALf/8cvwMjNFZkGj8DAI=;
 b=UI7mgXcKflE8PSqokDMEA2Xfc+YZvEByzhL8gcTy2FElFHkF4fNPwJle6axIYx2n5J
 MarF1qUgOcHM2lHN4YPPXr3RdSVs9a/vM1Ho0VMqxiq5ObV7v16tNxjXl5drZMRjZ5ov
 ePrRTeXeLBnuTTPFvZiAG4ft4nLfAaaZIYWbPWSyKCjvSNGVHSKwGbnw4JVsMojoUhCE
 CXTr2loNC7EnbuEH7xMM0JjlruSCU/LjBKcdassd+PzS5A5xl9xrkpjASZDuHTSj/VTg
 orVqXcIePv6wA8FGlxrRu62GGwXyegvwlLBKmeXGMfMFDrViSp+UcerZRrhjH3xL8mRv
 H6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=feWU1prEGzYZUSUKUDYThfwALf/8cvwMjNFZkGj8DAI=;
 b=ed2MqRk2Am7fDDkHOcnUtnzaVTuzYjFI+AmTQ9nTkng8ibY1rgrl7zL3y1Hl+So/Zm
 99BTPwk068FS2Fx7BUZ2MjdyTb5bSg0Iiu/4/d5fOMdgxenzv/CICZurXxEt4CP21ubk
 xuwqLGlLUbpai5OdSN7xiGfr11I/0wwEjRLa/BijCIfGI1Btl3wxC/8PFFSDnFq2GluE
 D+Fq5R15LfXfqsGLoG83LgJ8HuKA1sbEbY0LRWvcc4VKA1WFWKS0UTG9VKAZpI6qFeoa
 sx1tCIV8diJCEFZN2lBm6Cz5VcUC03/OwZ3yhlu4AeO3dhyGRZ243f4Rahqr/Koxlv3L
 Zixw==
X-Gm-Message-State: AOAM530hYY/89iI6ZBYbTa+RFwbe2pC6N8do4KOaC78Wpm3L2yYHMEvF
 muHH6ewdjOGFI5vDwThcC9TwiRUWYbk=
X-Google-Smtp-Source: ABdhPJxlaJorsGrXUViQOVr0WlDUt47v+XcfHP1VEqt9pJqNQVd6j4cNU+f5mpJZ4IjKeQhX2JppYg==
X-Received: by 2002:a17:906:b6c5:: with SMTP id
 ec5mr20448902ejb.290.1620111685110; 
 Tue, 04 May 2021 00:01:25 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:b6e2:f801:3cd:9deb?
 ([2a02:908:1252:fb60:b6e2:f801:3cd:9deb])
 by smtp.gmail.com with ESMTPSA id z7sm4689976edi.39.2021.05.04.00.01.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 May 2021 00:01:24 -0700 (PDT)
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 Jason Ekstrand <jason@jlekstrand.net>
References: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
 <YIfFC3YST0cfzd3l@phenom.ffwll.local>
 <CAAxE2A6APcJBwnbq58HOqc5bkHMsrzpiNnrso85kfBkRowwz+g@mail.gmail.com>
 <fada1543-612d-369e-765c-f90b718c2cfa@gmail.com>
 <CAPM=9tzz2u_qUXU9LMvtH_NDr1_wzunPo7Mt6NkrwAuowWTp7Q@mail.gmail.com>
 <CAAxE2A55Te6DjabYH8ELyfM03x2ZDaLsCsNC4Zqkrq0ExdpeHA@mail.gmail.com>
 <153487a3-082b-faf7-2a4d-ae15993b2a5d@gmail.com>
 <d6fbc1a3-ee69-d53e-0a60-9a313be19cac@daenzer.net>
 <CAAxE2A5V2YPRnPSue6cjsMWiWHoabmBiFEAsPXykO5-CCyunwQ@mail.gmail.com>
 <CADnq5_N7Wi0qzMmyVMY_PqM=BBF8mH7o1jcGRYNYB-StsM4uOA@mail.gmail.com>
 <CAOFGe961tB38dE=gzte4OTGNMOpUsW2ikrB03+t=eh4pDYFh5g@mail.gmail.com>
 <CAP+8YyGkP2n9v2mJM5UH4NJrA6bE9+2Bgs1-6HrPPPMCrFz9dw@mail.gmail.com>
 <CAOFGe94JAO0OBiiwp8+hd=XCsrGLA1fVxqxePtPdHFg+YBB0dg@mail.gmail.com>
 <CAAxE2A50Lg+ehW3LSiTnvGRqHTR8tW77V7wES1PaCnbHVkzMug@mail.gmail.com>
 <CAAxE2A6NCTFsV6oH=AL=S=P1p0xYF0To8T_THpUO2ypdo0dyBw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <1bd8105b-4a2a-2ad9-0b3c-a81590282f2e@gmail.com>
Date: Tue, 4 May 2021 09:01:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAAxE2A6NCTFsV6oH=AL=S=P1p0xYF0To8T_THpUO2ypdo0dyBw@mail.gmail.com>
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
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0915621305=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0915621305==
Content-Type: multipart/alternative;
 boundary="------------E875424550CBD01F4198D505"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------E875424550CBD01F4198D505
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Unfortunately as I pointed out to Daniel as well this won't work 100% 
reliable either.

See the signal on the ring buffer needs to be protected by manipulation 
from userspace so that we can guarantee that the hardware really has 
finished executing when it fires.

Protecting memory by immediate page table updates is a good first step, 
but unfortunately not sufficient (and we would need to restructure large 
parts of the driver to make this happen).

On older hardware we often had the situation that for reliable 
invalidation we need the guarantee that every previous operation has 
finished executing. It's not so much of a problem when the next 
operation has already started, since then we had the opportunity to do 
things in between the last and the next operation. Just see cache 
invalidation and VM switching for example.

Additional to that it doesn't really buy us anything, e.g. there is not 
much advantage to this. Writing the ring buffer in userspace and then 
ringing in the kernel has the same overhead as doing everything in the 
kernel in the first place.

Christian.

Am 04.05.21 um 05:11 schrieb Marek Olšák:
> Proposal for a new CS ioctl, kernel pseudo code:
>
> lock(&global_lock);
> serial = get_next_serial(dev);
> add_wait_command(ring, serial - 1);
> add_exec_cmdbuf(ring, user_cmdbuf);
> add_signal_command(ring, serial);
> *ring->doorbell = FIRE;
> unlock(&global_lock);
>
> See? Just like userspace submit, but in the kernel without 
> concurrency/preemption. Is this now safe enough for dma_fence?
>
> Marek
>
> On Mon, May 3, 2021 at 4:36 PM Marek Olšák <maraeo@gmail.com 
> <mailto:maraeo@gmail.com>> wrote:
>
>     What about direct submit from the kernel where the process still
>     has write access to the GPU ring buffer but doesn't use it? I
>     think that solves your preemption example, but leaves a potential
>     backdoor for a process to overwrite the signal commands, which
>     shouldn't be a problem since we are OK with timeouts.
>
>     Marek
>
>     On Mon, May 3, 2021 at 11:23 AM Jason Ekstrand
>     <jason@jlekstrand.net <mailto:jason@jlekstrand.net>> wrote:
>
>         On Mon, May 3, 2021 at 10:16 AM Bas Nieuwenhuizen
>         <bas@basnieuwenhuizen.nl <mailto:bas@basnieuwenhuizen.nl>> wrote:
>         >
>         > On Mon, May 3, 2021 at 5:00 PM Jason Ekstrand
>         <jason@jlekstrand.net <mailto:jason@jlekstrand.net>> wrote:
>         > >
>         > > Sorry for the top-post but there's no good thing to reply
>         to here...
>         > >
>         > > One of the things pointed out to me recently by Daniel
>         Vetter that I
>         > > didn't fully understand before is that dma_buf has a very
>         subtle
>         > > second requirement beyond finite time completion:  Nothing
>         required
>         > > for signaling a dma-fence can allocate memory. Why? 
>         Because the act
>         > > of allocating memory may wait on your dma-fence.  This, as
>         it turns
>         > > out, is a massively more strict requirement than finite time
>         > > completion and, I think, throws out all of the proposals
>         we have so
>         > > far.
>         > >
>         > > Take, for instance, Marek's proposal for userspace
>         involvement with
>         > > dma-fence by asking the kernel for a next serial and the
>         kernel
>         > > trusting userspace to signal it.  That doesn't work at all if
>         > > allocating memory to trigger a dma-fence can blow up. 
>         There's simply
>         > > no way for the kernel to trust userspace to not do
>         ANYTHING which
>         > > might allocate memory.  I don't even think there's a way
>         userspace can
>         > > trust itself there.  It also blows up my plan of moving
>         the fences to
>         > > transition boundaries.
>         > >
>         > > Not sure where that leaves us.
>         >
>         > Honestly the more I look at things I think
>         userspace-signalable fences
>         > with a timeout sound like they are a valid solution for
>         these issues.
>         > Especially since (as has been mentioned countless times in
>         this email
>         > thread) userspace already has a lot of ways to cause
>         timeouts and or
>         > GPU hangs through GPU work already.
>         >
>         > Adding a timeout on the signaling side of a dma_fence would
>         ensure:
>         >
>         > - The dma_fence signals in finite time
>         > -  If the timeout case does not allocate memory then memory
>         allocation
>         > is not a blocker for signaling.
>         >
>         > Of course you lose the full dependency graph and we need to
>         make sure
>         > garbage collection of fences works correctly when we have
>         cycles.
>         > However, the latter sounds very doable and the first sounds
>         like it is
>         > to some extent inevitable.
>         >
>         > I feel like I'm missing some requirement here given that we
>         > immediately went to much more complicated things but can't
>         find it.
>         > Thoughts?
>
>         Timeouts are sufficient to protect the kernel but they make
>         the fences
>         unpredictable and unreliable from a userspace PoV.  One of the big
>         problems we face is that, once we expose a dma_fence to userspace,
>         we've allowed for some pretty crazy potential dependencies that
>         neither userspace nor the kernel can sort out.  Say you have
>         marek's
>         "next serial, please" proposal and a multi-threaded application.
>         Between time time you ask the kernel for a serial and get a
>         dma_fence
>         and submit the work to signal that serial, your process may get
>         preempted, something else shoved in which allocates memory,
>         and then
>         we end up blocking on that dma_fence.  There's no way
>         userspace can
>         predict and defend itself from that.
>
>         So I think where that leaves us is that there is no safe place to
>         create a dma_fence except for inside the ioctl which submits
>         the work
>         and only after any necessary memory has been allocated. That's a
>         pretty stiff requirement.  We may still be able to interact with
>         userspace a bit more explicitly but I think it throws any
>         notion of
>         userspace direct submit out the window.
>
>         --Jason
>
>
>         > - Bas
>         > >
>         > > --Jason
>         > >
>         > > On Mon, May 3, 2021 at 9:42 AM Alex Deucher
>         <alexdeucher@gmail.com <mailto:alexdeucher@gmail.com>> wrote:
>         > > >
>         > > > On Sat, May 1, 2021 at 6:27 PM Marek Olšák
>         <maraeo@gmail.com <mailto:maraeo@gmail.com>> wrote:
>         > > > >
>         > > > > On Wed, Apr 28, 2021 at 5:07 AM Michel Dänzer
>         <michel@daenzer.net <mailto:michel@daenzer.net>> wrote:
>         > > > >>
>         > > > >> On 2021-04-28 8:59 a.m., Christian König wrote:
>         > > > >> > Hi Dave,
>         > > > >> >
>         > > > >> > Am 27.04.21 um 21:23 schrieb Marek Olšák:
>         > > > >> >> Supporting interop with any device is always
>         possible. It depends on which drivers we need to interoperate
>         with and update them. We've already found the path forward for
>         amdgpu. We just need to find out how many other drivers need
>         to be updated and evaluate the cost/benefit aspect.
>         > > > >> >>
>         > > > >> >> Marek
>         > > > >> >>
>         > > > >> >> On Tue, Apr 27, 2021 at 2:38 PM Dave Airlie
>         <airlied@gmail.com <mailto:airlied@gmail.com>
>         <mailto:airlied@gmail.com <mailto:airlied@gmail.com>>> wrote:
>         > > > >> >>
>         > > > >> >>     On Tue, 27 Apr 2021 at 22:06, Christian König
>         > > > >> >>     <ckoenig.leichtzumerken@gmail.com
>         <mailto:ckoenig.leichtzumerken@gmail.com>
>         <mailto:ckoenig.leichtzumerken@gmail.com
>         <mailto:ckoenig.leichtzumerken@gmail.com>>> wrote:
>         > > > >> >>     >
>         > > > >> >>     > Correct, we wouldn't have synchronization
>         between device with and without user queues any more.
>         > > > >> >>     >
>         > > > >> >>     > That could only be a problem for A+I Laptops.
>         > > > >> >>
>         > > > >> >>     Since I think you mentioned you'd only be
>         enabling this on newer
>         > > > >> >>     chipsets, won't it be a problem for A+A where
>         one A is a generation
>         > > > >> >>     behind the other?
>         > > > >> >>
>         > > > >> >
>         > > > >> > Crap, that is a good point as well.
>         > > > >> >
>         > > > >> >>
>         > > > >> >>     I'm not really liking where this is going btw,
>         seems like a ill
>         > > > >> >>     thought out concept, if AMD is really going
>         down the road of designing
>         > > > >> >>     hw that is currently Linux incompatible, you
>         are going to have to
>         > > > >> >>     accept a big part of the burden in bringing
>         this support in to more
>         > > > >> >>     than just amd drivers for upcoming generations
>         of gpu.
>         > > > >> >>
>         > > > >> >
>         > > > >> > Well we don't really like that either, but we have
>         no other option as far as I can see.
>         > > > >>
>         > > > >> I don't really understand what "future hw may remove
>         support for kernel queues" means exactly. While the
>         per-context queues can be mapped to userspace directly, they
>         don't *have* to be, do they? I.e. the kernel driver should be
>         able to either intercept userspace access to the queues, or in
>         the worst case do it all itself, and provide the existing
>         synchronization semantics as needed?
>         > > > >>
>         > > > >> Surely there are resource limits for the per-context
>         queues, so the kernel driver needs to do some kind of
>         virtualization / multi-plexing anyway, or we'll get sad user
>         faces when there's no queue available for <current hot game>.
>         > > > >>
>         > > > >> I'm probably missing something though, awaiting
>         enlightenment. :)
>         > > > >
>         > > > >
>         > > > > The hw interface for userspace is that the ring buffer
>         is mapped to the process address space alongside a doorbell
>         aperture (4K page) that isn't real memory, but when the CPU
>         writes into it, it tells the hw scheduler that there are new
>         GPU commands in the ring buffer. Userspace inserts all the
>         wait, draw, and signal commands into the ring buffer and then
>         "rings" the doorbell. It's my understanding that the ring
>         buffer and the doorbell are always mapped in the same GPU
>         address space as the process, which makes it very difficult to
>         emulate the current protected ring buffers in the kernel. The
>         VMID of the ring buffer is also not changeable.
>         > > > >
>         > > >
>         > > > The doorbell does not have to be mapped into the
>         process's GPU virtual
>         > > > address space.  The CPU could write to it directly. 
>         Mapping it into
>         > > > the GPU's virtual address space would allow you to have
>         a device kick
>         > > > off work however rather than the CPU. E.g., the GPU
>         could kick off
>         > > > it's own work or multiple devices could kick off work
>         without CPU
>         > > > involvement.
>         > > >
>         > > > Alex
>         > > >
>         > > >
>         > > > > The hw scheduler doesn't do any synchronization and it
>         doesn't see any dependencies. It only chooses which queue to
>         execute, so it's really just a simple queue manager handling
>         the virtualization aspect and not much else.
>         > > > >
>         > > > > Marek
>         > > > > _______________________________________________
>         > > > > dri-devel mailing list
>         > > > > dri-devel@lists.freedesktop.org
>         <mailto:dri-devel@lists.freedesktop.org>
>         > > > >
>         https://lists.freedesktop.org/mailman/listinfo/dri-devel
>         <https://lists.freedesktop.org/mailman/listinfo/dri-devel>
>         > > > _______________________________________________
>         > > > mesa-dev mailing list
>         > > > mesa-dev@lists.freedesktop.org
>         <mailto:mesa-dev@lists.freedesktop.org>
>         > > > https://lists.freedesktop.org/mailman/listinfo/mesa-dev
>         <https://lists.freedesktop.org/mailman/listinfo/mesa-dev>
>         > > _______________________________________________
>         > > dri-devel mailing list
>         > > dri-devel@lists.freedesktop.org
>         <mailto:dri-devel@lists.freedesktop.org>
>         > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>         <https://lists.freedesktop.org/mailman/listinfo/dri-devel>
>


--------------E875424550CBD01F4198D505
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Unfortunately as I pointed out to Daniel as well this won't work
    100% reliable either.<br>
    <br>
    See the signal on the ring buffer needs to be protected by
    manipulation from userspace so that we can guarantee that the
    hardware really has finished executing when it fires.<br>
    <br>
    Protecting memory by immediate page table updates is a good first
    step, but unfortunately not sufficient (and we would need to
    restructure large parts of the driver to make this happen).<br>
    <br>
    On older hardware we often had the situation that for reliable
    invalidation we need the guarantee that every previous operation has
    finished executing. It's not so much of a problem when the next
    operation has already started, since then we had the opportunity to
    do things in between the last and the next operation. Just see cache
    invalidation and VM switching for example.<br>
    <br>
    Additional to that it doesn't really buy us anything, e.g. there is
    not much advantage to this. Writing the ring buffer in userspace and
    then ringing in the kernel has the same overhead as doing everything
    in the kernel in the first place.<br>
    <br>
    Christian.<br>
    <br>
    <div class="moz-cite-prefix">Am 04.05.21 um 05:11 schrieb Marek
      Olšák:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAAxE2A6NCTFsV6oH=AL=S=P1p0xYF0To8T_THpUO2ypdo0dyBw@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div>Proposal for a new CS ioctl, kernel pseudo code:</div>
        <div><br>
        </div>
        <div>lock(&amp;global_lock);</div>
        <div>serial = get_next_serial(dev);</div>
        <div>add_wait_command(ring, serial - 1);</div>
        <div>add_exec_cmdbuf(ring, user_cmdbuf);</div>
        <div>add_signal_command(ring, serial);</div>
        <div>*ring-&gt;doorbell = FIRE;<br>
        </div>
        <div>unlock(&amp;global_lock);</div>
        <div><br>
        </div>
        <div>See? Just like userspace submit, but in the kernel without
          concurrency/preemption. Is this now safe enough for dma_fence?<br>
        </div>
        <div><br>
        </div>
        <div>Marek<br>
        </div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Mon, May 3, 2021 at 4:36 PM
          Marek Olšák &lt;<a href="mailto:maraeo@gmail.com"
            moz-do-not-send="true">maraeo@gmail.com</a>&gt; wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
          <div dir="ltr">
            <div>What about direct submit from the kernel where the
              process still has write access to the GPU ring buffer but
              doesn't use it? I think that solves your preemption
              example, but leaves a potential backdoor for a process to
              overwrite the signal commands, which shouldn't be a
              problem since we are OK with timeouts.<br>
            </div>
            <div><br>
            </div>
            <div>Marek<br>
            </div>
          </div>
          <br>
          <div class="gmail_quote">
            <div dir="ltr" class="gmail_attr">On Mon, May 3, 2021 at
              11:23 AM Jason Ekstrand &lt;<a
                href="mailto:jason@jlekstrand.net" target="_blank"
                moz-do-not-send="true">jason@jlekstrand.net</a>&gt;
              wrote:<br>
            </div>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
              0.8ex;border-left:1px solid
              rgb(204,204,204);padding-left:1ex">On Mon, May 3, 2021 at
              10:16 AM Bas Nieuwenhuizen<br>
              &lt;<a href="mailto:bas@basnieuwenhuizen.nl"
                target="_blank" moz-do-not-send="true">bas@basnieuwenhuizen.nl</a>&gt;
              wrote:<br>
              &gt;<br>
              &gt; On Mon, May 3, 2021 at 5:00 PM Jason Ekstrand &lt;<a
                href="mailto:jason@jlekstrand.net" target="_blank"
                moz-do-not-send="true">jason@jlekstrand.net</a>&gt;
              wrote:<br>
              &gt; &gt;<br>
              &gt; &gt; Sorry for the top-post but there's no good thing
              to reply to here...<br>
              &gt; &gt;<br>
              &gt; &gt; One of the things pointed out to me recently by
              Daniel Vetter that I<br>
              &gt; &gt; didn't fully understand before is that dma_buf
              has a very subtle<br>
              &gt; &gt; second requirement beyond finite time
              completion:  Nothing required<br>
              &gt; &gt; for signaling a dma-fence can allocate memory. 
              Why?  Because the act<br>
              &gt; &gt; of allocating memory may wait on your
              dma-fence.  This, as it turns<br>
              &gt; &gt; out, is a massively more strict requirement than
              finite time<br>
              &gt; &gt; completion and, I think, throws out all of the
              proposals we have so<br>
              &gt; &gt; far.<br>
              &gt; &gt;<br>
              &gt; &gt; Take, for instance, Marek's proposal for
              userspace involvement with<br>
              &gt; &gt; dma-fence by asking the kernel for a next serial
              and the kernel<br>
              &gt; &gt; trusting userspace to signal it.  That doesn't
              work at all if<br>
              &gt; &gt; allocating memory to trigger a dma-fence can
              blow up.  There's simply<br>
              &gt; &gt; no way for the kernel to trust userspace to not
              do ANYTHING which<br>
              &gt; &gt; might allocate memory.  I don't even think
              there's a way userspace can<br>
              &gt; &gt; trust itself there.  It also blows up my plan of
              moving the fences to<br>
              &gt; &gt; transition boundaries.<br>
              &gt; &gt;<br>
              &gt; &gt; Not sure where that leaves us.<br>
              &gt;<br>
              &gt; Honestly the more I look at things I think
              userspace-signalable fences<br>
              &gt; with a timeout sound like they are a valid solution
              for these issues.<br>
              &gt; Especially since (as has been mentioned countless
              times in this email<br>
              &gt; thread) userspace already has a lot of ways to cause
              timeouts and or<br>
              &gt; GPU hangs through GPU work already.<br>
              &gt;<br>
              &gt; Adding a timeout on the signaling side of a dma_fence
              would ensure:<br>
              &gt;<br>
              &gt; - The dma_fence signals in finite time<br>
              &gt; -  If the timeout case does not allocate memory then
              memory allocation<br>
              &gt; is not a blocker for signaling.<br>
              &gt;<br>
              &gt; Of course you lose the full dependency graph and we
              need to make sure<br>
              &gt; garbage collection of fences works correctly when we
              have cycles.<br>
              &gt; However, the latter sounds very doable and the first
              sounds like it is<br>
              &gt; to some extent inevitable.<br>
              &gt;<br>
              &gt; I feel like I'm missing some requirement here given
              that we<br>
              &gt; immediately went to much more complicated things but
              can't find it.<br>
              &gt; Thoughts?<br>
              <br>
              Timeouts are sufficient to protect the kernel but they
              make the fences<br>
              unpredictable and unreliable from a userspace PoV.  One of
              the big<br>
              problems we face is that, once we expose a dma_fence to
              userspace,<br>
              we've allowed for some pretty crazy potential dependencies
              that<br>
              neither userspace nor the kernel can sort out.  Say you
              have marek's<br>
              "next serial, please" proposal and a multi-threaded
              application.<br>
              Between time time you ask the kernel for a serial and get
              a dma_fence<br>
              and submit the work to signal that serial, your process
              may get<br>
              preempted, something else shoved in which allocates
              memory, and then<br>
              we end up blocking on that dma_fence.  There's no way
              userspace can<br>
              predict and defend itself from that.<br>
              <br>
              So I think where that leaves us is that there is no safe
              place to<br>
              create a dma_fence except for inside the ioctl which
              submits the work<br>
              and only after any necessary memory has been allocated. 
              That's a<br>
              pretty stiff requirement.  We may still be able to
              interact with<br>
              userspace a bit more explicitly but I think it throws any
              notion of<br>
              userspace direct submit out the window.<br>
              <br>
              --Jason<br>
              <br>
              <br>
              &gt; - Bas<br>
              &gt; &gt;<br>
              &gt; &gt; --Jason<br>
              &gt; &gt;<br>
              &gt; &gt; On Mon, May 3, 2021 at 9:42 AM Alex Deucher &lt;<a
                href="mailto:alexdeucher@gmail.com" target="_blank"
                moz-do-not-send="true">alexdeucher@gmail.com</a>&gt;
              wrote:<br>
              &gt; &gt; &gt;<br>
              &gt; &gt; &gt; On Sat, May 1, 2021 at 6:27 PM Marek Olšák
              &lt;<a href="mailto:maraeo@gmail.com" target="_blank"
                moz-do-not-send="true">maraeo@gmail.com</a>&gt; wrote:<br>
              &gt; &gt; &gt; &gt;<br>
              &gt; &gt; &gt; &gt; On Wed, Apr 28, 2021 at 5:07 AM Michel
              Dänzer &lt;<a href="mailto:michel@daenzer.net"
                target="_blank" moz-do-not-send="true">michel@daenzer.net</a>&gt;
              wrote:<br>
              &gt; &gt; &gt; &gt;&gt;<br>
              &gt; &gt; &gt; &gt;&gt; On 2021-04-28 8:59 a.m., Christian
              König wrote:<br>
              &gt; &gt; &gt; &gt;&gt; &gt; Hi Dave,<br>
              &gt; &gt; &gt; &gt;&gt; &gt;<br>
              &gt; &gt; &gt; &gt;&gt; &gt; Am 27.04.21 um 21:23 schrieb
              Marek Olšák:<br>
              &gt; &gt; &gt; &gt;&gt; &gt;&gt; Supporting interop with
              any device is always possible. It depends on which drivers
              we need to interoperate with and update them. We've
              already found the path forward for amdgpu. We just need to
              find out how many other drivers need to be updated and
              evaluate the cost/benefit aspect.<br>
              &gt; &gt; &gt; &gt;&gt; &gt;&gt;<br>
              &gt; &gt; &gt; &gt;&gt; &gt;&gt; Marek<br>
              &gt; &gt; &gt; &gt;&gt; &gt;&gt;<br>
              &gt; &gt; &gt; &gt;&gt; &gt;&gt; On Tue, Apr 27, 2021 at
              2:38 PM Dave Airlie &lt;<a href="mailto:airlied@gmail.com"
                target="_blank" moz-do-not-send="true">airlied@gmail.com</a>
              &lt;mailto:<a href="mailto:airlied@gmail.com"
                target="_blank" moz-do-not-send="true">airlied@gmail.com</a>&gt;&gt;
              wrote:<br>
              &gt; &gt; &gt; &gt;&gt; &gt;&gt;<br>
              &gt; &gt; &gt; &gt;&gt; &gt;&gt;     On Tue, 27 Apr 2021
              at 22:06, Christian König<br>
              &gt; &gt; &gt; &gt;&gt; &gt;&gt;     &lt;<a
                href="mailto:ckoenig.leichtzumerken@gmail.com"
                target="_blank" moz-do-not-send="true">ckoenig.leichtzumerken@gmail.com</a>
              &lt;mailto:<a
                href="mailto:ckoenig.leichtzumerken@gmail.com"
                target="_blank" moz-do-not-send="true">ckoenig.leichtzumerken@gmail.com</a>&gt;&gt;
              wrote:<br>
              &gt; &gt; &gt; &gt;&gt; &gt;&gt;     &gt;<br>
              &gt; &gt; &gt; &gt;&gt; &gt;&gt;     &gt; Correct, we
              wouldn't have synchronization between device with and
              without user queues any more.<br>
              &gt; &gt; &gt; &gt;&gt; &gt;&gt;     &gt;<br>
              &gt; &gt; &gt; &gt;&gt; &gt;&gt;     &gt; That could only
              be a problem for A+I Laptops.<br>
              &gt; &gt; &gt; &gt;&gt; &gt;&gt;<br>
              &gt; &gt; &gt; &gt;&gt; &gt;&gt;     Since I think you
              mentioned you'd only be enabling this on newer<br>
              &gt; &gt; &gt; &gt;&gt; &gt;&gt;     chipsets, won't it be
              a problem for A+A where one A is a generation<br>
              &gt; &gt; &gt; &gt;&gt; &gt;&gt;     behind the other?<br>
              &gt; &gt; &gt; &gt;&gt; &gt;&gt;<br>
              &gt; &gt; &gt; &gt;&gt; &gt;<br>
              &gt; &gt; &gt; &gt;&gt; &gt; Crap, that is a good point as
              well.<br>
              &gt; &gt; &gt; &gt;&gt; &gt;<br>
              &gt; &gt; &gt; &gt;&gt; &gt;&gt;<br>
              &gt; &gt; &gt; &gt;&gt; &gt;&gt;     I'm not really liking
              where this is going btw, seems like a ill<br>
              &gt; &gt; &gt; &gt;&gt; &gt;&gt;     thought out concept,
              if AMD is really going down the road of designing<br>
              &gt; &gt; &gt; &gt;&gt; &gt;&gt;     hw that is currently
              Linux incompatible, you are going to have to<br>
              &gt; &gt; &gt; &gt;&gt; &gt;&gt;     accept a big part of
              the burden in bringing this support in to more<br>
              &gt; &gt; &gt; &gt;&gt; &gt;&gt;     than just amd drivers
              for upcoming generations of gpu.<br>
              &gt; &gt; &gt; &gt;&gt; &gt;&gt;<br>
              &gt; &gt; &gt; &gt;&gt; &gt;<br>
              &gt; &gt; &gt; &gt;&gt; &gt; Well we don't really like
              that either, but we have no other option as far as I can
              see.<br>
              &gt; &gt; &gt; &gt;&gt;<br>
              &gt; &gt; &gt; &gt;&gt; I don't really understand what
              "future hw may remove support for kernel queues" means
              exactly. While the per-context queues can be mapped to
              userspace directly, they don't *have* to be, do they? I.e.
              the kernel driver should be able to either intercept
              userspace access to the queues, or in the worst case do it
              all itself, and provide the existing synchronization
              semantics as needed?<br>
              &gt; &gt; &gt; &gt;&gt;<br>
              &gt; &gt; &gt; &gt;&gt; Surely there are resource limits
              for the per-context queues, so the kernel driver needs to
              do some kind of virtualization / multi-plexing anyway, or
              we'll get sad user faces when there's no queue available
              for &lt;current hot game&gt;.<br>
              &gt; &gt; &gt; &gt;&gt;<br>
              &gt; &gt; &gt; &gt;&gt; I'm probably missing something
              though, awaiting enlightenment. :)<br>
              &gt; &gt; &gt; &gt;<br>
              &gt; &gt; &gt; &gt;<br>
              &gt; &gt; &gt; &gt; The hw interface for userspace is that
              the ring buffer is mapped to the process address space
              alongside a doorbell aperture (4K page) that isn't real
              memory, but when the CPU writes into it, it tells the hw
              scheduler that there are new GPU commands in the ring
              buffer. Userspace inserts all the wait, draw, and signal
              commands into the ring buffer and then "rings" the
              doorbell. It's my understanding that the ring buffer and
              the doorbell are always mapped in the same GPU address
              space as the process, which makes it very difficult to
              emulate the current protected ring buffers in the kernel.
              The VMID of the ring buffer is also not changeable.<br>
              &gt; &gt; &gt; &gt;<br>
              &gt; &gt; &gt;<br>
              &gt; &gt; &gt; The doorbell does not have to be mapped
              into the process's GPU virtual<br>
              &gt; &gt; &gt; address space.  The CPU could write to it
              directly.  Mapping it into<br>
              &gt; &gt; &gt; the GPU's virtual address space would allow
              you to have a device kick<br>
              &gt; &gt; &gt; off work however rather than the CPU. 
              E.g., the GPU could kick off<br>
              &gt; &gt; &gt; it's own work or multiple devices could
              kick off work without CPU<br>
              &gt; &gt; &gt; involvement.<br>
              &gt; &gt; &gt;<br>
              &gt; &gt; &gt; Alex<br>
              &gt; &gt; &gt;<br>
              &gt; &gt; &gt;<br>
              &gt; &gt; &gt; &gt; The hw scheduler doesn't do any
              synchronization and it doesn't see any dependencies. It
              only chooses which queue to execute, so it's really just a
              simple queue manager handling the virtualization aspect
              and not much else.<br>
              &gt; &gt; &gt; &gt;<br>
              &gt; &gt; &gt; &gt; Marek<br>
              &gt; &gt; &gt; &gt;
              _______________________________________________<br>
              &gt; &gt; &gt; &gt; dri-devel mailing list<br>
              &gt; &gt; &gt; &gt; <a
                href="mailto:dri-devel@lists.freedesktop.org"
                target="_blank" moz-do-not-send="true">dri-devel@lists.freedesktop.org</a><br>
              &gt; &gt; &gt; &gt; <a
                href="https://lists.freedesktop.org/mailman/listinfo/dri-devel"
                rel="noreferrer" target="_blank" moz-do-not-send="true">https://lists.freedesktop.org/mailman/listinfo/dri-devel</a><br>
              &gt; &gt; &gt;
              _______________________________________________<br>
              &gt; &gt; &gt; mesa-dev mailing list<br>
              &gt; &gt; &gt; <a
                href="mailto:mesa-dev@lists.freedesktop.org"
                target="_blank" moz-do-not-send="true">mesa-dev@lists.freedesktop.org</a><br>
              &gt; &gt; &gt; <a
                href="https://lists.freedesktop.org/mailman/listinfo/mesa-dev"
                rel="noreferrer" target="_blank" moz-do-not-send="true">https://lists.freedesktop.org/mailman/listinfo/mesa-dev</a><br>
              &gt; &gt; _______________________________________________<br>
              &gt; &gt; dri-devel mailing list<br>
              &gt; &gt; <a
                href="mailto:dri-devel@lists.freedesktop.org"
                target="_blank" moz-do-not-send="true">dri-devel@lists.freedesktop.org</a><br>
              &gt; &gt; <a
                href="https://lists.freedesktop.org/mailman/listinfo/dri-devel"
                rel="noreferrer" target="_blank" moz-do-not-send="true">https://lists.freedesktop.org/mailman/listinfo/dri-devel</a><br>
            </blockquote>
          </div>
        </blockquote>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------E875424550CBD01F4198D505--

--===============0915621305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0915621305==--
