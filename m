Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7232B1505
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 05:11:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4047A6E051;
	Fri, 13 Nov 2020 04:11:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 549146E051
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 04:11:14 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id y22so7830929oti.10
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 20:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6Vp6Ye4zHAsO/1lQb1hLWokRekpvOJV+o7NCMb8DaaE=;
 b=Qa6e0o2MTNxSR2x/AFXIeXFa9hK0PgyN0HPuzIbYkqXlUhzXTcd42lvLDfl92BI87T
 aIG6cAKsR801xekG10xVjR8pNXAInC8Mj7VxvmuNBZIVlr5uyyUsEo0+fkFqDAkTnTGm
 Dl7xfWLCMwh6LRKGfbZpJ5GVM5D9xke19iuC1hIP71lvZwLmxM2wrNR0PdByMFuxvYGZ
 gn1l5J53ObjDwhRdGoWLS8LIH+x6LR/aB+SbwWHTWr5K2VgoG44J5h7CUeOArBxT+cJ/
 FGqN4YkzrS3Tam6VJOJn9MrLxdY+j4uv/UBugOelPcSjJ8Gl4ZmBgTEzvZ8Fzrb1YK4C
 HfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6Vp6Ye4zHAsO/1lQb1hLWokRekpvOJV+o7NCMb8DaaE=;
 b=X9xlx9N4rPDM/aAm1pqt8oslnz0pcANQUmnTfk46+c6xz5X2JBkgD3ZhrQc4WXRVgb
 PVaJDkFVPuWdZyfxTKcGNqCAWBeieXrjCb0tQkTXpIenGXojoiizkM6RYtbZ2TfzgKnp
 RAAMi1gySG13oQp8/zb+q87iKI/QTYBT7qUhqd2YBrfjlvWq6ponlXOsISEb3meCc8U6
 KTd+NMPCIOay8ajRfctPtO1eoVENaAavPaS07jTMqQrFv/SK9UANLD/Ro9jHKcM9VLlp
 p96oqOksyXOCse/XHN8JQ+H6Bc02gVn1KTiKLA+ssURCiKv4qajn5siGnsXqjVVvvXQr
 6c2g==
X-Gm-Message-State: AOAM530T5FjeUCXU031IvsUU76feUBdFwlb36tncw8JC0AoRh2eDtBDc
 kXGiny6QgeJNrMOWn8CxyNn1Ruab9Bfx1pCS79IVOg==
X-Google-Smtp-Source: ABdhPJwYCP/b4fCtGjK0atPBYVGM7yxdt7QQana5Wms11v6t39DNuoV/FkT8WBcUzB5I3nvIYQcrrnB4RNL88x5zbeU=
X-Received: by 2002:a9d:64ce:: with SMTP id n14mr229095otl.352.1605240673557; 
 Thu, 12 Nov 2020 20:11:13 -0800 (PST)
MIME-Version: 1.0
References: <20201110034934.70898-1-john.stultz@linaro.org>
 <CAO_48GHNE6AyKv4k=3=2EVjfSZsgz4pjuMJ1xJojbuFU9a90EQ@mail.gmail.com>
 <20201112093237.GS401619@phenom.ffwll.local>
In-Reply-To: <20201112093237.GS401619@phenom.ffwll.local>
From: John Stultz <john.stultz@linaro.org>
Date: Thu, 12 Nov 2020 20:11:02 -0800
Message-ID: <CALAqxLWWBaOc3W1s3xBe-innHZ0pAon7UCfumjjQftPqf7bO0Q@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] dma-buf: Performance improvements for system heap
 & a system-uncached implementation
To: Sumit Semwal <sumit.semwal@linaro.org>,
 John Stultz <john.stultz@linaro.org>, 
 Christian Koenig <christian.koenig@amd.com>,
 lkml <linux-kernel@vger.kernel.org>, 
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@kernel.org>, 
 Brian Starkey <Brian.Starkey@arm.com>, Hridya Valsaraju <hridya@google.com>, 
 Suren Baghdasaryan <surenb@google.com>, Sandeep Patil <sspatil@google.com>, 
 Daniel Mentz <danielmentz@google.com>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>, 
 =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>, 
 Robin Murphy <robin.murphy@arm.com>, Ezequiel Garcia <ezequiel@collabora.com>, 
 Simon Ser <contact@emersion.fr>, James Jones <jajones@nvidia.com>, 
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>, 
 DRI mailing list <dri-devel@lists.freedesktop.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 12, 2020 at 1:32 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> On Thu, Nov 12, 2020 at 11:09:04AM +0530, Sumit Semwal wrote:
> > On Tue, 10 Nov 2020 at 09:19, John Stultz <john.stultz@linaro.org> wrote:
> > >
> > > Hey All,
> > >   So just wanted to send my last revision of my patch series
> > > of performance optimizations to the dma-buf system heap.
> >
> > Thanks very much for your patches - I think the first 5 patches look good to me.
> >
> > I know there was a bit of discussion over adding a new system-uncached
> > heap v/s using a flag to identify that; I think I prefer the separate
> > heap idea, but lets ask one last time if any one else has any real
> > objections to it.
> >
> > Daniel, Christian: any comments from your side on this?
>
> I do wonder a bit where the userspace stack for this all is, since tuning
> allocators without a full stack is fairly pointless. dma-buf heaps is a
> bit in a limbo situation here it feels like.

As mentioned in the system-uncached patch:
Pending opensource users of this code include:
* AOSP HiKey960 gralloc:
  - https://android-review.googlesource.com/c/device/linaro/hikey/+/1399519
  - Visibly improves performance over the system heap
* AOSP Codec2 (possibly, needs more review):
  - https://android-review.googlesource.com/c/platform/frameworks/av/+/1360640/17/media/codec2/vndk/C2DmaBufAllocator.cpp#325

Additionally both the HiKey, HiKey960 grallocs  and Codec2 are already
able to use the current dmabuf heaps instead of ION.

So I'm not sure what you mean by limbo, other than it being in a
transition state where the interface is upstream and we're working on
moving vendors to it from ION (which is staged to be dropped in 5.11).
Part of that work is making sure we don't regress the performance
expectations.

> Plus I'm vary of anything related to leaking this kind of stuff beyond the
> dma-api because dma api maintainers don't like us doing that. But
> personally no concern on that front really, gpus need this. It's just that
> we do need solid justification I think if we land this. Hence back to
> first point.
>
> Ideally first point comes in the form of benchmarking on android together
> with a mesa driver (or mesa + some v4l driver or whatever it takes to
> actually show the benefits, I have no idea).

Tying it with mesa is a little tough as the grallocs for mesa devices
usually use gbm (gralloc.gbm or gralloc.minigbm). Swapping the
allocation path for dmabuf heaps there gets a little complex as last I
tried that (when trying to get HiKey working with Lima graphics, as
gbm wouldn't allocate the contiguous buffers required by the display),
I ran into issues with the drm_hwcomposer and mesa expecting the gbm
private handle metadata in the buffer when it was passed in.

But I might take a look at it again. I got a bit lost digging through
the mesa gbm allocation paths last time.

I'll also try to see if I can find a benchmark for the codec2 code
(using dmabuf heaps with and without the uncached heap) on on db845c
(w/ mesa), as that is already working and I suspect that might be
close to what you're looking for.

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
