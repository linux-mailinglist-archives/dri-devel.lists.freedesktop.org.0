Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C672B7441
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 03:40:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8815A6E14F;
	Wed, 18 Nov 2020 02:40:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C1D6E174
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 02:40:23 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id f11so574486oij.6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 18:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bvdgsBLgi9EHMNSLVDq+6Fn9lRqcB8CIw2yWEiIoq80=;
 b=J35wiLmqdOFXJLv4HSpQvHl5YEa4K3iwX2kW6Ks7Gc62WwkxOifW27KzFX7wu7bTp6
 IUZd28S0eE2GdDUOWe8erY3blUciPXWTyOWyjSVllPrphPItMSzm6CNNaOAE9zFOF3pP
 RMM8RbYKvT3omqiO7jafrSLB/clgjWbTiHU1dicDjr1f7/ZIyNxe114QTLDjCD5crXG/
 DXez7Muy8FO15hQcaLg0uUPiXMZZmzN0sMCezSamFbMrPXxuawl/u+/Zh9uwg21zGqGq
 2JstVY0hkwx2VniIDYfpZW6HK+vb/0TbOd69b1PfGQ7qBmycPY+L4nJrxAgB+HpAlBHB
 PfIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bvdgsBLgi9EHMNSLVDq+6Fn9lRqcB8CIw2yWEiIoq80=;
 b=OYkKzalUxg7LsMRy87XvhPm6d8p8+FGTn9yvaQGt2/uVlIfYDnDH9Yo5Sytdu733F0
 JTotpV9KnK1bRPVHfejmwGW0FEgEolKebW1FO3qdDeDEhnQ80yECDEpvGsvsjviMYEmY
 qstJMFJqIMxSuS5NZLvpHqdxSxMIVCUFEp8kFpByV1kE1rdJ2HUX+iBrH3uwcc162txE
 5Q+V5aaHk1q52xoHun4BFuP+n22ztez1N5Ciye+lW6P58Rv4KH/WMN6xP14CcIseCSVE
 MW9V0xiV+beEq8fjKphbJG77lmXwEo6VpHN7/ficLLd6v31T4/JOPrXEhbqV0f0k/s4t
 Ur9Q==
X-Gm-Message-State: AOAM530PnAJDNrqEHSR+sKjkpMsqS+50NvL5+ry0TFcpprY9LB3Oo7zd
 qFnghsryI8ZcVLjbsd8L8xfsldT+2Znide7B6RSrNg==
X-Google-Smtp-Source: ABdhPJy0sxe/2XxPJwznFcbwNp7a1YBjsny2Xovn2b3d9sUn9AojSv42h8RwaMADnI7yZVr5fNfhexyQWdiLSAi+eFw=
X-Received: by 2002:aca:4e02:: with SMTP id c2mr1442601oib.97.1605667222447;
 Tue, 17 Nov 2020 18:40:22 -0800 (PST)
MIME-Version: 1.0
References: <20201110034934.70898-1-john.stultz@linaro.org>
 <CAO_48GHNE6AyKv4k=3=2EVjfSZsgz4pjuMJ1xJojbuFU9a90EQ@mail.gmail.com>
 <20201112093237.GS401619@phenom.ffwll.local>
 <CALAqxLWWBaOc3W1s3xBe-innHZ0pAon7UCfumjjQftPqf7bO0Q@mail.gmail.com>
 <20201113203933.GT401619@phenom.ffwll.local>
In-Reply-To: <20201113203933.GT401619@phenom.ffwll.local>
From: John Stultz <john.stultz@linaro.org>
Date: Tue, 17 Nov 2020 18:40:11 -0800
Message-ID: <CALAqxLU886mjGaNx3cvXB0hyOd=tTo7G=tw6iQ1uAxcXShN+kg@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] dma-buf: Performance improvements for system heap
 & a system-uncached implementation
To: John Stultz <john.stultz@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, 
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

On Fri, Nov 13, 2020 at 12:39 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> On Thu, Nov 12, 2020 at 08:11:02PM -0800, John Stultz wrote:
> > On Thu, Nov 12, 2020 at 1:32 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > On Thu, Nov 12, 2020 at 11:09:04AM +0530, Sumit Semwal wrote:
> > > > On Tue, 10 Nov 2020 at 09:19, John Stultz <john.stultz@linaro.org> wrote:
> > > > >
> > > > > Hey All,
> > > > >   So just wanted to send my last revision of my patch series
> > > > > of performance optimizations to the dma-buf system heap.
> > > >
> > > > Thanks very much for your patches - I think the first 5 patches look good to me.
> > > >
> > > > I know there was a bit of discussion over adding a new system-uncached
> > > > heap v/s using a flag to identify that; I think I prefer the separate
> > > > heap idea, but lets ask one last time if any one else has any real
> > > > objections to it.
> > > >
> > > > Daniel, Christian: any comments from your side on this?
> > >
> > > I do wonder a bit where the userspace stack for this all is, since tuning
> > > allocators without a full stack is fairly pointless. dma-buf heaps is a
> > > bit in a limbo situation here it feels like.
> >
> > As mentioned in the system-uncached patch:
> > Pending opensource users of this code include:
> > * AOSP HiKey960 gralloc:
> >   - https://android-review.googlesource.com/c/device/linaro/hikey/+/1399519
> >   - Visibly improves performance over the system heap
> > * AOSP Codec2 (possibly, needs more review):
> >   - https://android-review.googlesource.com/c/platform/frameworks/av/+/1360640/17/media/codec2/vndk/C2DmaBufAllocator.cpp#325
> >
> > Additionally both the HiKey, HiKey960 grallocs  and Codec2 are already
> > able to use the current dmabuf heaps instead of ION.
> >
> > So I'm not sure what you mean by limbo, other than it being in a
> > transition state where the interface is upstream and we're working on
> > moving vendors to it from ION (which is staged to be dropped in 5.11).
> > Part of that work is making sure we don't regress the performance
> > expectations.
>
> The mesa thing below, since if we test this with some downstream kernel
> drivers or at least non-mesa userspace I'm somewhat worried we're just
> creating a nice split world between the android gfx world and the
> mesa/linux desktop gfx world.
>
> But then that's kinda how android rolls, so *shrug*
>
> > > Plus I'm vary of anything related to leaking this kind of stuff beyond the
> > > dma-api because dma api maintainers don't like us doing that. But
> > > personally no concern on that front really, gpus need this. It's just that
> > > we do need solid justification I think if we land this. Hence back to
> > > first point.
> > >
> > > Ideally first point comes in the form of benchmarking on android together
> > > with a mesa driver (or mesa + some v4l driver or whatever it takes to
> > > actually show the benefits, I have no idea).
> >
> > Tying it with mesa is a little tough as the grallocs for mesa devices
> > usually use gbm (gralloc.gbm or gralloc.minigbm). Swapping the
> > allocation path for dmabuf heaps there gets a little complex as last I
> > tried that (when trying to get HiKey working with Lima graphics, as
> > gbm wouldn't allocate the contiguous buffers required by the display),
> > I ran into issues with the drm_hwcomposer and mesa expecting the gbm
> > private handle metadata in the buffer when it was passed in.
> >
> > But I might take a look at it again. I got a bit lost digging through
> > the mesa gbm allocation paths last time.
> >
> > I'll also try to see if I can find a benchmark for the codec2 code
> > (using dmabuf heaps with and without the uncached heap) on on db845c
> > (w/ mesa), as that is already working and I suspect that might be
> > close to what you're looking for.
>
> tbh I think trying to push for this long term is the best we can hope for.
>
> Media is also a lot more *meh* since it's deeply fragmented and a lot less
> of it upstream than on the gles/display side.
>
> I think confirming that this at least doesn't horrible blow up on a
> gralloc/gbm+mesa stack would be useful I think.

Sorry, I'm still a little foggy on precisely what you're suggesting here.

The patch stack I have has already been used with db845c (mesa +
gbm_grallloc), with the codec2 (sw decoders) using dmabuf heaps.
So no blowing up there. And I'm working with Hridya to find a
benchmark for codec2 so we can try to show the performance delta.

However, if you're wanting a dma-buf gralloc implementation with mesa,
that may be a little tougher to do, but I guess I can give it a go.

Hopefully this will address concerns about the system-uncached heap
patch (the last two patches in this series)?

In the meantime I hope we can queue the first five patches, as it
would be nice to get the code rearranging in as there are others
trying to stage their own heaps, and I'd like to avoid dragging that
churn out for too long (in addition to improving the allocation
performance). Those changes have no ABI implications.

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
