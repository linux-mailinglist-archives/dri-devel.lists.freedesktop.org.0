Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DED391BBD
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 17:24:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 661EF6E881;
	Wed, 26 May 2021 15:24:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A269C6E881
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 15:24:18 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id e10so965613ybb.7
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 08:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TmrTb+Ehiv7eTBC5zEDgXPDQL3zkRtUsXRYHjqyOV+w=;
 b=io4n8ACOsLiusArOxZqacyXhvz6jGYuoXAyk9I/DtUt46dtO0bt5jm0oOCUu7MsQHx
 DKeSBRvtJsTOslbtaQEco9WJK6LxB6EmFiObVlKyixqdtwLDP6Ey8NkNUkMSyBsox9LM
 6Z1DpS3RlDlvvGch3r3dwsrVxRXZlmydsqrbyza+erFrFIT4OCZzQ2SfNWfQb7jRJZEZ
 9lLAS+jTLH6l1h8Oc208NXnIt+PsgYcHGFcE/XhF6PgbzXSpTaAtlpXUM5e/T+gHD2QM
 aKo8b9O5cVrBRLZRxdBD0/wNyWp/A3s9RzyTZFPgD3rz5YzvUX1PFi9r7NJvD5JMD/6l
 algQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TmrTb+Ehiv7eTBC5zEDgXPDQL3zkRtUsXRYHjqyOV+w=;
 b=gR1S3av4cMtzoKuE1iTPzdaBEu54O2jZNwTEoCpkxAaadUrER9l6zrRYxhqkTnowST
 Z8i/e4VvVsehI8KQxFtEAk3YDpyTkMjWVMedyrp1WoZhz/uToHhSs3yWP7WVdoCeb/o9
 QkwEVev4D+tzGB6ZYWYhTd+J3fxkl5POFGQAxpMBJmy+rfwvdXUNxAyHECSihvb+/WR+
 cUUMJGvcZe1Sg9BU+gAS+ze4f55yiQ9VgKJcaCMfANKqJIsUbjTxVUxe+ebVna1L1C6+
 Qt4TC8eP7q9lsLksF0JNL28Ld6f7FDvD53rW20o5HzQOQqZqbzjlifPiErsuIQJ6h2Nv
 WRmQ==
X-Gm-Message-State: AOAM531cx6EeieXpajuWJqAN/5D7LiBVO6gag9KWhMMo2G79bpG0vVXZ
 6SauEvHOaw4YGRy3QoRN5UP1AIH3Vmi54ERX6TkIAg==
X-Google-Smtp-Source: ABdhPJyHMECHVR+IR4INf11UAe26nU7Cqt3hW3ehmOEtWydmd3daWv0ZpHEPpfmHIie6SQ4zC/R9j1sfQIUuosIuYFc=
X-Received: by 2002:a25:81c5:: with SMTP id n5mr34582750ybm.323.1622042657101; 
 Wed, 26 May 2021 08:24:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210520190007.534046-1-jason@jlekstrand.net>
 <20210520190007.534046-5-jason@jlekstrand.net>
 <CAPj87rPW2xmOLKg6OgQST6QrH9u5-qmdRJrNDug+rWa=Uv6ZBQ@mail.gmail.com>
 <CAOFGe97b-djqwV95Y91xe9-ZVUyeGqjdPE8vj7MoSfV0Kcrp1Q@mail.gmail.com>
 <CAPj87rNJTHNKkdiZREVb8v6iiwUhYLXW10pjVOdV=zttd+tG3Q@mail.gmail.com>
In-Reply-To: <CAPj87rNJTHNKkdiZREVb8v6iiwUhYLXW10pjVOdV=zttd+tG3Q@mail.gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 26 May 2021 10:24:05 -0500
Message-ID: <CAOFGe95TZRw=ZpSwOKpwcxkxP_JRmEXpJn_26OS2ZPH0Mp5Kyg@mail.gmail.com>
Subject: Re: [PATCH 4/4] RFC: dma-buf: Add an API for importing sync files (v6)
To: Daniel Stone <daniel@fooishbar.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 26, 2021 at 6:09 AM Daniel Stone <daniel@fooishbar.org> wrote:
> On Mon, 24 May 2021 at 18:11, Jason Ekstrand <jason@jlekstrand.net> wrote:
> >  3. Userspace memory fences.
> >
> > Note that timeline syncobj is NOT in that list.  IMO, all the "wait
> > for submit" stuff is an implementation detail we needed in order to
> > get the timeline semantics on top of immutable SW fences.  Under the
> > hood it's all dma_fence; this just gives us a shareable container so
> > we can implement VK_KHR_timeline_semaphore with sharing.  I really
> > don't want to make Wayland protocol around it if memory fences are the
> > final solution.
>
> Typing out the Wayland protocol isn't the hard bit. If we just need to
> copy and sed syncobj to weirdsyncobj, no problem really, and it gives
> us a six-month head start on painful compositor-internal surgery
> whilst we work on common infrastructure to ship userspace fences
> around (mappable dmabuf with the sync bracketing? FD where every
> read() gives you the current value? memfd? other?).

I feel like I should elaborate more about timelines.  In my earlier
reply, my commentary about timeline syncobj was mostly focused around
helping people avoid typing.  That's not really the full story,
though, and I hope more context will help.

First, let me say that timeline syncobj was designed as a mechanism to
implement VK_KHR_timeline_semaphore without inserting future fences
into the kernel.  It's entirely designed around the needs of Vulkan
drivers, not really as a window-system primitive.  The semantics are
designed around one driver communicating to another that new fences
have been added and it's safe to kick off more rendering.  I'm not
convinced that it's the right object for window-systems and I'm also
not convinced that it's a good idea to try and make a version of it
that's a wrapper around a userspace memory fence.  (I'm going to start
typing UMF for userspace memory fence because it's long to type out.)

Why?  Well, the fundamental problem with timelines in general is
trying to figure out when it's about to be done.  But timeline syncobj
solves this for us!  It gives us this fancy super-useful ioctl!
Right?  Uh.... not as well as I'd like.  Let's say we make a timeline
syncobj that's a wrapper around a userspace memory fence.  What do we
do with that ioctl?  As I mentioned above, the kernel doesn't have any
clue when it will be triggered so that ioctl turns into an actual
wait.  That's no good because it creates unnecessary stalls.

There's another potential solution here:  Have each UMF be two
timelines: submitted and completed.  At the start of every batch
that's supposed to trigger a UMF, we set the "submitted" side and
then, when it completes, we set the "completed" side.  Ok, great, now
we can get at the "about to be done" with the submitted side,
implement the ioctl, and we're all good, right?  Sadly, no.  There's
no guarantee about how long a "batch" takes.  So there's no universal
timeout the kernel can apply.  Also, if it does time out, the kernel
doesn't know who to blame for the timeout and how to prevent itself
from getting in trouble again.  The compositor does so, in theory,
given the right ioctls, it could detect the -ETIME and kill that
client.  Not a great solution.

The best option I've been able to come up with for this is some sort
of client-provided signal.  Something where it says, as part of submit
or somewhere else, "I promise I'll be done soon" where that promise
comes with dire consequences if it's not.  At that point, we can turn
the UMF and a particular wait value into a one-shot fence like a
dma_fence or sync_file, or signal a syncobj on it.  If it ever times
out, we kick their context.  In Vulkan terminology, they get
VK_ERROR_DEVICE_LOST.  There are two important bits here:  First, is
that it's based on a client-provided thing.  With a fully timeline
model and wait-before-signal, we can't infer when something is about
to be done.  Only the client knows when it submitted its last node in
the dependency graph and the whole mess is unblocked.  Second, is that
the dma_fence is created within the client's driver context.  If it's
created compositor-side, the kernel doesn't know who to blame if
things go badly.  If we create it in the client, it's pretty easy to
make context death on -ETIME part of the contract.

(Before danvet jumps in here and rants about how UMF -> dma_fence
isn't possible, I haven't forgotten.  I'm pretending, for now, that
we've solved some of those problems.)

Another option is to just stall on the UMF until it's done.  Yeah,
kind-of terrible and high-latency, but it always works and doesn't
involve any complex logic to kill clients.  If a client never gets
around to signaling a fence, it just never repaints.  The compositor
keeps going like nothing's wrong.  Maybe, if the client submits lots
of frames without ever triggering, it'll hit some max queue depth
somewhere and kill it but that's it.  More likely, the client's
vkAcquireNextImage will start timing out and it'll crash.

I suspect where we might actually land is some combination of the two
depending on client choice.  If the client wants to be dumb, it gets
the high-latency always-works path.  If the client really wants
lowest-latency VRR, it has to take the smarter path and risk
VK_ERROR_DEVICE_LOST if it misses too far.

But the point of all of this is, neither of the above two paths have
anything to do with the compositor calling a "wait for submit" ioctl.
Building a design around that and baking it into protocol is, IMO, a
mistake.  I don't see any valid way to handle this mess without "wait
for sumbit" either not existing or existing only client-side for the
purposes of WSI.

--Jason
