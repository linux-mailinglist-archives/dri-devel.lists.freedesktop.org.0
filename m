Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F13D12B771E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 08:46:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E86F06E372;
	Wed, 18 Nov 2020 07:46:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 775E66E372
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 07:46:48 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id f11so1223371oij.6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 23:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tkuG/qY/u9PvSPGNrCZ0GKow8OQyrX72voV0+j6nQMw=;
 b=QJPgQyP/65JRR+yG+QS7v72A1kPUPgpCDHaGQIwH8V/Qo9jpaI095XvwUHt4ZEN1jz
 C+Fdqugf4T5k/U+OJu7pdKVBLxycMswamDr4ASoUqng6ojAhA6NGwhz+Dmh4nkoBqlwt
 TsNTnbfINgTesVznCzwsZICisqay/bUpVaX5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tkuG/qY/u9PvSPGNrCZ0GKow8OQyrX72voV0+j6nQMw=;
 b=IuAV9JEa4CSca0ZemY8F73Bh+IG54051fSscLtB5j+HN5AfJO6x2mP7RpyM2h4f+5U
 MXYE3ZexnN7bG+zbgM3w1jznW8MVnFwGNqszhvTSHHaVA3dgPjY/SFvHWTfP5kCgQfLm
 PR2HxUc55vpQ2pTfTpexBGkJ0GLDwq2NOGYv2JUCTGusqLu/NGZfZG3dns0quLD/Ajvz
 P4OE8hxUE4bE+DNg8mKB+iG73zc0cBLljXFNDXTuZBvWJJMIc+fpcofyZKMNNIYEBZ+U
 VjNLod4WuZzQP/hkK65feNu+t8DHGS695iotFtMUqHk9fX9Q3gnd2gcUUIHrIbMydveo
 ik3w==
X-Gm-Message-State: AOAM531IwnRw9LrX3sU/RT1oIJCVRIvv+CNv1diPoX3+eYQTziB39E3P
 0o+hBUSJRbCaFmyTISjHnYiFfuRLTNP6ofPPuDmlAQ==
X-Google-Smtp-Source: ABdhPJzeVllnRkpX1dkgLeG2LNjSC8Z9R71z2Uo8hpSkqefs/tNQXFoBkHj0wLvcC582e5R//mTyNmrG8uvaalBUAyc=
X-Received: by 2002:aca:4f14:: with SMTP id d20mr1991417oib.14.1605685607699; 
 Tue, 17 Nov 2020 23:46:47 -0800 (PST)
MIME-Version: 1.0
References: <20201110034934.70898-1-john.stultz@linaro.org>
 <CAO_48GHNE6AyKv4k=3=2EVjfSZsgz4pjuMJ1xJojbuFU9a90EQ@mail.gmail.com>
 <20201112093237.GS401619@phenom.ffwll.local>
 <CALAqxLWWBaOc3W1s3xBe-innHZ0pAon7UCfumjjQftPqf7bO0Q@mail.gmail.com>
 <20201113203933.GT401619@phenom.ffwll.local>
 <CALAqxLU886mjGaNx3cvXB0hyOd=tTo7G=tw6iQ1uAxcXShN+kg@mail.gmail.com>
In-Reply-To: <CALAqxLU886mjGaNx3cvXB0hyOd=tTo7G=tw6iQ1uAxcXShN+kg@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 18 Nov 2020 08:46:36 +0100
Message-ID: <CAKMK7uGew_sdw=NPrzuAQ_-5_kQnn-qvLHK9DGqSk=k22tQGDg@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] dma-buf: Performance improvements for system heap
 & a system-uncached implementation
To: John Stultz <john.stultz@linaro.org>
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
Cc: Sandeep Patil <sspatil@google.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@kernel.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 18, 2020 at 3:40 AM John Stultz <john.stultz@linaro.org> wrote:
> On Fri, Nov 13, 2020 at 12:39 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Thu, Nov 12, 2020 at 08:11:02PM -0800, John Stultz wrote:
> > > On Thu, Nov 12, 2020 at 1:32 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > On Thu, Nov 12, 2020 at 11:09:04AM +0530, Sumit Semwal wrote:
> > > > > On Tue, 10 Nov 2020 at 09:19, John Stultz <john.stultz@linaro.org> wrote:
> > > > > >
> > > > > > Hey All,
> > > > > >   So just wanted to send my last revision of my patch series
> > > > > > of performance optimizations to the dma-buf system heap.
> > > > >
> > > > > Thanks very much for your patches - I think the first 5 patches look good to me.
> > > > >
> > > > > I know there was a bit of discussion over adding a new system-uncached
> > > > > heap v/s using a flag to identify that; I think I prefer the separate
> > > > > heap idea, but lets ask one last time if any one else has any real
> > > > > objections to it.
> > > > >
> > > > > Daniel, Christian: any comments from your side on this?
> > > >
> > > > I do wonder a bit where the userspace stack for this all is, since tuning
> > > > allocators without a full stack is fairly pointless. dma-buf heaps is a
> > > > bit in a limbo situation here it feels like.
> > >
> > > As mentioned in the system-uncached patch:
> > > Pending opensource users of this code include:
> > > * AOSP HiKey960 gralloc:
> > >   - https://android-review.googlesource.com/c/device/linaro/hikey/+/1399519
> > >   - Visibly improves performance over the system heap
> > > * AOSP Codec2 (possibly, needs more review):
> > >   - https://android-review.googlesource.com/c/platform/frameworks/av/+/1360640/17/media/codec2/vndk/C2DmaBufAllocator.cpp#325
> > >
> > > Additionally both the HiKey, HiKey960 grallocs  and Codec2 are already
> > > able to use the current dmabuf heaps instead of ION.
> > >
> > > So I'm not sure what you mean by limbo, other than it being in a
> > > transition state where the interface is upstream and we're working on
> > > moving vendors to it from ION (which is staged to be dropped in 5.11).
> > > Part of that work is making sure we don't regress the performance
> > > expectations.
> >
> > The mesa thing below, since if we test this with some downstream kernel
> > drivers or at least non-mesa userspace I'm somewhat worried we're just
> > creating a nice split world between the android gfx world and the
> > mesa/linux desktop gfx world.
> >
> > But then that's kinda how android rolls, so *shrug*
> >
> > > > Plus I'm vary of anything related to leaking this kind of stuff beyond the
> > > > dma-api because dma api maintainers don't like us doing that. But
> > > > personally no concern on that front really, gpus need this. It's just that
> > > > we do need solid justification I think if we land this. Hence back to
> > > > first point.
> > > >
> > > > Ideally first point comes in the form of benchmarking on android together
> > > > with a mesa driver (or mesa + some v4l driver or whatever it takes to
> > > > actually show the benefits, I have no idea).
> > >
> > > Tying it with mesa is a little tough as the grallocs for mesa devices
> > > usually use gbm (gralloc.gbm or gralloc.minigbm). Swapping the
> > > allocation path for dmabuf heaps there gets a little complex as last I
> > > tried that (when trying to get HiKey working with Lima graphics, as
> > > gbm wouldn't allocate the contiguous buffers required by the display),
> > > I ran into issues with the drm_hwcomposer and mesa expecting the gbm
> > > private handle metadata in the buffer when it was passed in.
> > >
> > > But I might take a look at it again. I got a bit lost digging through
> > > the mesa gbm allocation paths last time.
> > >
> > > I'll also try to see if I can find a benchmark for the codec2 code
> > > (using dmabuf heaps with and without the uncached heap) on on db845c
> > > (w/ mesa), as that is already working and I suspect that might be
> > > close to what you're looking for.
> >
> > tbh I think trying to push for this long term is the best we can hope for.
> >
> > Media is also a lot more *meh* since it's deeply fragmented and a lot less
> > of it upstream than on the gles/display side.
> >
> > I think confirming that this at least doesn't horrible blow up on a
> > gralloc/gbm+mesa stack would be useful I think.
>
> Sorry, I'm still a little foggy on precisely what you're suggesting here.
>
> The patch stack I have has already been used with db845c (mesa +
> gbm_grallloc), with the codec2 (sw decoders) using dmabuf heaps.
> So no blowing up there. And I'm working with Hridya to find a
> benchmark for codec2 so we can try to show the performance delta.
>
> However, if you're wanting a dma-buf gralloc implementation with mesa,
> that may be a little tougher to do, but I guess I can give it a go.
>
> Hopefully this will address concerns about the system-uncached heap
> patch (the last two patches in this series)?
>
> In the meantime I hope we can queue the first five patches, as it
> would be nice to get the code rearranging in as there are others
> trying to stage their own heaps, and I'd like to avoid dragging that
> churn out for too long (in addition to improving the allocation
> performance). Those changes have no ABI implications.

Maybe I'm also misunderstanding what dma-buf heaps is used for in
Android, at least usually. I thought it's used to allocate all the
winsys/shared buffers through gralloc (at least in the blobby stacks),
to handle the allocation constraints problem. In the open stacks we
don't seem to have a platform with both mesa and v4l (or some other
codec) with "interesting" allocations constraints, so no one using
that gralloc+dma-buf heaps combo for what it was meant for. Hence why
I'm a bit vary that we're creating something here which just misses
the point a bit when we try to actually use it (in that glorious
forever-future world where an android platform has enough drivers in
upstream to do so).

For other "this solves a system problem" we tend to be quite a bit
more picky with the demonstration use case, to make sure we're
actually creating something that solves the problem in reality.

But it also looks like Android's just not there yet, so *shrug* ...
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
