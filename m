Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFC036C5C3
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 14:06:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB076E94E;
	Tue, 27 Apr 2021 12:06:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 807416E93D;
 Tue, 27 Apr 2021 12:06:05 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id i3so43944105edt.1;
 Tue, 27 Apr 2021 05:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=tNPbveeKspBLTwE6zKikLWyxT9ZVsz/VIuPHAwuRS8U=;
 b=RWAoQrm9HWqdOD7rO4WJ+WMheyyG53XyYC7WRF27V9MznG0AO2akoJVblpgSPAfZ3s
 IVdmMpfzxUPiyysUVMduN93nSQSj+duadJp/kqC+2ocN2NKEI0fuFgWIotE7gLEbPlLb
 GOc8UJbwK6b4oYtvGuaPy3s5kouW+QUa2X2/4psiZr55HxCfqfQqXNHp2ffGU9NunkSF
 cJWJLCXbWIEmX6JfbnQ5UaiLFTzT2wjLOLb74Ix/Ns9/TJax5lLz69T/HdXJ9gFV0c/w
 gSIyNNviJgB1DKSQwbThqniyTZuh99IC+cg0blU0NZTUYFcHSHaXFEyuHg0RuA9+gbL2
 1B4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=tNPbveeKspBLTwE6zKikLWyxT9ZVsz/VIuPHAwuRS8U=;
 b=dlL05vX76BJqpniY7dz8RKrzxdBD0XWtQuJZpyTkQCYvve0YR2fSQ5ZyvTn7v10OBe
 wpMO0kAyc4aC8rL5tqBdITJFTqhnlIfWYi0CeRbjz+hRQGLLrX5PmzE0GyJCkk9yoIZN
 xGxu2vbqimYOklPRcO7U+m1rzG6rQBlYzRpWgkppOwAA2mFHah6qaMMp9rzKMHSWpxUf
 spTjz+DWevaBsk1n8Z/Usr4Dx2xFV/NAfZwqlH4eF+bpzQgPNLb9uAfPdGddrYHN/tum
 3AY47Ttl0h79Ck1N/XlfiB/KaDcVbSIwYniqdlZMsF1Piv6O0bgxiSi/e80NrX2bX2Rp
 LIyQ==
X-Gm-Message-State: AOAM530PZPm9wq911eHKAysKKYbAor3/Z4VqnZQ7EZcDpU41l5x2HvKI
 N6BmfBVcorZG2rbAFJpHAo/0yT6RQOA=
X-Google-Smtp-Source: ABdhPJyFm5gPeJnnOMbESWIvA78QnrszNe04nvy/7G3U/fQ5XoGv2oX2QT0mv2rK5VjXKzejxpHVwg==
X-Received: by 2002:aa7:de8b:: with SMTP id j11mr3881356edv.363.1619525163711; 
 Tue, 27 Apr 2021 05:06:03 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:a79d:3e10:541f:6c50?
 ([2a02:908:1252:fb60:a79d:3e10:541f:6c50])
 by smtp.gmail.com with ESMTPSA id hc43sm13583908ejc.97.2021.04.27.05.06.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 05:06:03 -0700 (PDT)
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
 <CAPj87rMn_gabTdZpHGQVa16Log8xFe8fvhcL_WSC6tyOMvmY=w@mail.gmail.com>
 <CAOFGe96c1SxHiUBzapbVFx1h0aOwF=X8hcStVZmrw4OjrrG+Zg@mail.gmail.com>
 <CAPj87rPSW13nxz2n5E+n0JYcwGR3mFWJAG2kYaaoav7A-ZVD2g@mail.gmail.com>
 <CAKMK7uHyTiFWwQWdxVk1am+KoFA9DsTnJ658CAhzBYOyg7AdsA@mail.gmail.com>
 <CAPj87rM=qf78kUvys1irnR8Djh=CLjRdQJt1V4je82-=+yPWYw@mail.gmail.com>
 <CAKMK7uEAu4FgYwN9t9AMCqD2nVbkSRbGP3tST4nY1nKP26+vxA@mail.gmail.com>
 <CAPj87rOfv0w8jF4CO8PUHQXTfq+2GE=BDmRRWjOMkQ0wH3CPAA@mail.gmail.com>
 <CAAxE2A5pJ-D7AFbDJLKPDztr=yzOSDSm=3HrnJOWr3r96_KOQQ@mail.gmail.com>
 <YIfFC3YST0cfzd3l@phenom.ffwll.local>
 <CAAxE2A6APcJBwnbq58HOqc5bkHMsrzpiNnrso85kfBkRowwz+g@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <fada1543-612d-369e-765c-f90b718c2cfa@gmail.com>
Date: Tue, 27 Apr 2021 14:06:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAAxE2A6APcJBwnbq58HOqc5bkHMsrzpiNnrso85kfBkRowwz+g@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0027441916=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0027441916==
Content-Type: multipart/alternative;
 boundary="------------FAA7710A7490BF0C39D9677F"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------FAA7710A7490BF0C39D9677F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Correct, we wouldn't have synchronization between device with and 
without user queues any more.

That could only be a problem for A+I Laptops.

Memory management will just work with preemption fences which pause the 
user queues of a process before evicting something. That will be a 
dma_fence, but also a well known approach.

Christian.

Am 27.04.21 um 13:49 schrieb Marek Olšák:
> If we don't use future fences for DMA fences at all, e.g. we don't use 
> them for memory management, it can work, right? Memory management can 
> suspend user queues anytime. It doesn't need to use DMA fences. There 
> might be something that I'm missing here.
>
> What would we lose without DMA fences? Just inter-device 
> synchronization? I think that might be acceptable.
>
> The only case when the kernel will wait on a future fence is before a 
> page flip. Everything today already depends on userspace not hanging 
> the gpu, which makes everything a future fence.
>
> Marek
>
> On Tue., Apr. 27, 2021, 04:02 Daniel Vetter, <daniel@ffwll.ch 
> <mailto:daniel@ffwll.ch>> wrote:
>
>     On Mon, Apr 26, 2021 at 04:59:28PM -0400, Marek Olšák wrote:
>     > Thanks everybody. The initial proposal is dead. Here are some
>     thoughts on
>     > how to do it differently.
>     >
>     > I think we can have direct command submission from userspace via
>     > memory-mapped queues ("user queues") without changing window
>     systems.
>     >
>     > The memory management doesn't have to use GPU page faults like HMM.
>     > Instead, it can wait for user queues of a specific process to go
>     idle and
>     > then unmap the queues, so that userspace can't submit anything.
>     Buffer
>     > evictions, pinning, etc. can be executed when all queues are
>     unmapped
>     > (suspended). Thus, no BO fences and page faults are needed.
>     >
>     > Inter-process synchronization can use timeline semaphores.
>     Userspace will
>     > query the wait and signal value for a shared buffer from the
>     kernel. The
>     > kernel will keep a history of those queries to know which process is
>     > responsible for signalling which buffer. There is only the
>     wait-timeout
>     > issue and how to identify the culprit. One of the solutions is
>     to have the
>     > GPU send all GPU signal commands and all timed out wait commands
>     via an
>     > interrupt to the kernel driver to monitor and validate userspace
>     behavior.
>     > With that, it can be identified whether the culprit is the
>     waiting process
>     > or the signalling process and which one. Invalid signal/wait
>     parameters can
>     > also be detected. The kernel can force-signal only the
>     semaphores that time
>     > out, and punish the processes which caused the timeout or used
>     invalid
>     > signal/wait parameters.
>     >
>     > The question is whether this synchronization solution is robust
>     enough for
>     > dma_fence and whatever the kernel and window systems need.
>
>     The proper model here is the preempt-ctx dma_fence that amdkfd uses
>     (without page faults). That means dma_fence for synchronization is
>     doa, at
>     least as-is, and we're back to figuring out the winsys problem.
>
>     "We'll solve it with timeouts" is very tempting, but doesn't work.
>     It's
>     akin to saying that we're solving deadlock issues in a locking
>     design by
>     doing a global s/mutex_lock/mutex_lock_timeout/ in the kernel. Sure it
>     avoids having to reach the reset button, but that's about it.
>
>     And the fundamental problem is that once you throw in userspace
>     command
>     submission (and syncing, at least within the userspace driver,
>     otherwise
>     there's kinda no point if you still need the kernel for
>     cross-engine sync)
>     means you get deadlocks if you still use dma_fence for sync under
>     perfectly legit use-case. We've discussed that one ad nauseam last
>     summer:
>
>     https://dri.freedesktop.org/docs/drm/driver-api/dma-buf.html?highlight=dma_fence#indefinite-dma-fences
>     <https://dri.freedesktop.org/docs/drm/driver-api/dma-buf.html?highlight=dma_fence#indefinite-dma-fences>
>
>     See silly diagramm at the bottom.
>
>     Now I think all isn't lost, because imo the first step to getting
>     to this
>     brave new world is rebuilding the driver on top of userspace
>     fences, and
>     with the adjusted cmd submit model. You probably don't want to use
>     amdkfd,
>     but port that as a context flag or similar to render nodes for
>     gl/vk. Of
>     course that means you can only use this mode in headless, without
>     glx/wayland winsys support, but it's a start.
>     -Daniel
>
>     >
>     > Marek
>     >
>     > On Tue, Apr 20, 2021 at 4:34 PM Daniel Stone
>     <daniel@fooishbar.org <mailto:daniel@fooishbar.org>> wrote:
>     >
>     > > Hi,
>     > >
>     > > On Tue, 20 Apr 2021 at 20:30, Daniel Vetter <daniel@ffwll.ch
>     <mailto:daniel@ffwll.ch>> wrote:
>     > >
>     > >> The thing is, you can't do this in drm/scheduler. At least
>     not without
>     > >> splitting up the dma_fence in the kernel into separate memory
>     fences
>     > >> and sync fences
>     > >
>     > >
>     > > I'm starting to think this thread needs its own glossary ...
>     > >
>     > > I propose we use 'residency fence' for execution fences which
>     enact
>     > > memory-residency operations, e.g. faulting in a page
>     ultimately depending
>     > > on GPU work retiring.
>     > >
>     > > And 'value fence' for the pure-userspace model suggested by
>     timeline
>     > > semaphores, i.e. fences being (*addr == val) rather than being
>     able to look
>     > > at ctx seqno.
>     > >
>     > > Cheers,
>     > > Daniel
>     > > _______________________________________________
>     > > mesa-dev mailing list
>     > > mesa-dev@lists.freedesktop.org
>     <mailto:mesa-dev@lists.freedesktop.org>
>     > > https://lists.freedesktop.org/mailman/listinfo/mesa-dev
>     <https://lists.freedesktop.org/mailman/listinfo/mesa-dev>
>     > >
>
>     -- 
>     Daniel Vetter
>     Software Engineer, Intel Corporation
>     http://blog.ffwll.ch <http://blog.ffwll.ch>
>
>
> _______________________________________________
> mesa-dev mailing list
> mesa-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/mesa-dev


--------------FAA7710A7490BF0C39D9677F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Correct, we wouldn't have synchronization between device with and
    without user queues any more.<br>
    <br>
    That could only be a problem for A+I Laptops.<br>
    <br>
    Memory management will just work with preemption fences which pause
    the user queues of a process before evicting something. That will be
    a dma_fence, but also a well known approach.<br>
    <br>
    Christian.<br>
    <br>
    <div class="moz-cite-prefix">Am 27.04.21 um 13:49 schrieb Marek
      Olšák:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAAxE2A6APcJBwnbq58HOqc5bkHMsrzpiNnrso85kfBkRowwz+g@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="auto">
        <div>If we don't use future fences for DMA fences at all, e.g.
          we don't use them for memory management, it can work, right?
          Memory management can suspend user queues anytime. It doesn't
          need to use DMA fences. There might be something that I'm
          missing here.</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">What would we lose without DMA fences? Just
          inter-device synchronization? I think that might be
          acceptable.</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">The only case when the kernel will wait on a
          future fence is before a page flip. Everything today already
          depends on userspace not hanging the gpu, which makes
          everything a future fence.</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">Marek<br>
          <br>
          <div class="gmail_quote" dir="auto">
            <div dir="ltr" class="gmail_attr">On Tue., Apr. 27, 2021,
              04:02 Daniel Vetter, &lt;<a href="mailto:daniel@ffwll.ch"
                moz-do-not-send="true">daniel@ffwll.ch</a>&gt; wrote:<br>
            </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">On Mon,
              Apr 26, 2021 at 04:59:28PM -0400, Marek Olšák wrote:<br>
              &gt; Thanks everybody. The initial proposal is dead. Here
              are some thoughts on<br>
              &gt; how to do it differently.<br>
              &gt; <br>
              &gt; I think we can have direct command submission from
              userspace via<br>
              &gt; memory-mapped queues ("user queues") without changing
              window systems.<br>
              &gt; <br>
              &gt; The memory management doesn't have to use GPU page
              faults like HMM.<br>
              &gt; Instead, it can wait for user queues of a specific
              process to go idle and<br>
              &gt; then unmap the queues, so that userspace can't submit
              anything. Buffer<br>
              &gt; evictions, pinning, etc. can be executed when all
              queues are unmapped<br>
              &gt; (suspended). Thus, no BO fences and page faults are
              needed.<br>
              &gt; <br>
              &gt; Inter-process synchronization can use timeline
              semaphores. Userspace will<br>
              &gt; query the wait and signal value for a shared buffer
              from the kernel. The<br>
              &gt; kernel will keep a history of those queries to know
              which process is<br>
              &gt; responsible for signalling which buffer. There is
              only the wait-timeout<br>
              &gt; issue and how to identify the culprit. One of the
              solutions is to have the<br>
              &gt; GPU send all GPU signal commands and all timed out
              wait commands via an<br>
              &gt; interrupt to the kernel driver to monitor and
              validate userspace behavior.<br>
              &gt; With that, it can be identified whether the culprit
              is the waiting process<br>
              &gt; or the signalling process and which one. Invalid
              signal/wait parameters can<br>
              &gt; also be detected. The kernel can force-signal only
              the semaphores that time<br>
              &gt; out, and punish the processes which caused the
              timeout or used invalid<br>
              &gt; signal/wait parameters.<br>
              &gt; <br>
              &gt; The question is whether this synchronization solution
              is robust enough for<br>
              &gt; dma_fence and whatever the kernel and window systems
              need.<br>
              <br>
              The proper model here is the preempt-ctx dma_fence that
              amdkfd uses<br>
              (without page faults). That means dma_fence for
              synchronization is doa, at<br>
              least as-is, and we're back to figuring out the winsys
              problem.<br>
              <br>
              "We'll solve it with timeouts" is very tempting, but
              doesn't work. It's<br>
              akin to saying that we're solving deadlock issues in a
              locking design by<br>
              doing a global s/mutex_lock/mutex_lock_timeout/ in the
              kernel. Sure it<br>
              avoids having to reach the reset button, but that's about
              it.<br>
              <br>
              And the fundamental problem is that once you throw in
              userspace command<br>
              submission (and syncing, at least within the userspace
              driver, otherwise<br>
              there's kinda no point if you still need the kernel for
              cross-engine sync)<br>
              means you get deadlocks if you still use dma_fence for
              sync under<br>
              perfectly legit use-case. We've discussed that one ad
              nauseam last summer:<br>
              <br>
              <a
href="https://dri.freedesktop.org/docs/drm/driver-api/dma-buf.html?highlight=dma_fence#indefinite-dma-fences"
                rel="noreferrer noreferrer" target="_blank"
                moz-do-not-send="true">https://dri.freedesktop.org/docs/drm/driver-api/dma-buf.html?highlight=dma_fence#indefinite-dma-fences</a><br>
              <br>
              See silly diagramm at the bottom.<br>
              <br>
              Now I think all isn't lost, because imo the first step to
              getting to this<br>
              brave new world is rebuilding the driver on top of
              userspace fences, and<br>
              with the adjusted cmd submit model. You probably don't
              want to use amdkfd,<br>
              but port that as a context flag or similar to render nodes
              for gl/vk. Of<br>
              course that means you can only use this mode in headless,
              without<br>
              glx/wayland winsys support, but it's a start.<br>
              -Daniel<br>
              <br>
              &gt; <br>
              &gt; Marek<br>
              &gt; <br>
              &gt; On Tue, Apr 20, 2021 at 4:34 PM Daniel Stone &lt;<a
                href="mailto:daniel@fooishbar.org" target="_blank"
                rel="noreferrer" moz-do-not-send="true">daniel@fooishbar.org</a>&gt;
              wrote:<br>
              &gt; <br>
              &gt; &gt; Hi,<br>
              &gt; &gt;<br>
              &gt; &gt; On Tue, 20 Apr 2021 at 20:30, Daniel Vetter &lt;<a
                href="mailto:daniel@ffwll.ch" target="_blank"
                rel="noreferrer" moz-do-not-send="true">daniel@ffwll.ch</a>&gt;
              wrote:<br>
              &gt; &gt;<br>
              &gt; &gt;&gt; The thing is, you can't do this in
              drm/scheduler. At least not without<br>
              &gt; &gt;&gt; splitting up the dma_fence in the kernel
              into separate memory fences<br>
              &gt; &gt;&gt; and sync fences<br>
              &gt; &gt;<br>
              &gt; &gt;<br>
              &gt; &gt; I'm starting to think this thread needs its own
              glossary ...<br>
              &gt; &gt;<br>
              &gt; &gt; I propose we use 'residency fence' for execution
              fences which enact<br>
              &gt; &gt; memory-residency operations, e.g. faulting in a
              page ultimately depending<br>
              &gt; &gt; on GPU work retiring.<br>
              &gt; &gt;<br>
              &gt; &gt; And 'value fence' for the pure-userspace model
              suggested by timeline<br>
              &gt; &gt; semaphores, i.e. fences being (*addr == val)
              rather than being able to look<br>
              &gt; &gt; at ctx seqno.<br>
              &gt; &gt;<br>
              &gt; &gt; Cheers,<br>
              &gt; &gt; Daniel<br>
              &gt; &gt; _______________________________________________<br>
              &gt; &gt; mesa-dev mailing list<br>
              &gt; &gt; <a href="mailto:mesa-dev@lists.freedesktop.org"
                target="_blank" rel="noreferrer" moz-do-not-send="true">mesa-dev@lists.freedesktop.org</a><br>
              &gt; &gt; <a
                href="https://lists.freedesktop.org/mailman/listinfo/mesa-dev"
                rel="noreferrer noreferrer" target="_blank"
                moz-do-not-send="true">https://lists.freedesktop.org/mailman/listinfo/mesa-dev</a><br>
              &gt; &gt;<br>
              <br>
              -- <br>
              Daniel Vetter<br>
              Software Engineer, Intel Corporation<br>
              <a href="http://blog.ffwll.ch" rel="noreferrer noreferrer"
                target="_blank" moz-do-not-send="true">http://blog.ffwll.ch</a><br>
            </blockquote>
          </div>
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

--------------FAA7710A7490BF0C39D9677F--

--===============0027441916==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0027441916==--
