Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BA88BEDEA
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 22:15:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0C210E8C4;
	Tue,  7 May 2024 20:15:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZjPGeIOJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7979F10E507
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 20:15:13 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C2E26DFB;
 Tue,  7 May 2024 22:15:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1715112909;
 bh=gpzcY4y3i2KBXNv1yb0z2rP0d1+GAgC9/AU3xoG+moM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZjPGeIOJTDi4STMtKK6eRAtKTpi5o3A1Luo604bMWViu+xRjvML3zbzSvIkJw3ocP
 UHz4M9uRyXtZjvHW0U6OIGFZVGYQ/cLL8yS5QF7s4z9C72gXFpE34klgqi+laBoxJH
 ASfjttCYYcd0K9T9QjIQ7QeK0dGXZAV20oUxCgg8=
Date: Tue, 7 May 2024 23:15:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Lennart Poettering <mzxreary@0pointer.de>,
 Robert Mader <robert.mader@collabora.com>,
 Sebastien Bacher <sebastien.bacher@canonical.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Milan Zamazal <mzamazal@redhat.com>, Maxime Ripard <mripard@redhat.com>,
 Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
Message-ID: <20240507201502.GC2012@pendragon.ideasonboard.com>
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
 <ojduxo54lpcbfg2wfuhqhy7k3phncamtklh65z7gvttcwztmhk@zkifewcy4ovi>
 <3c0c7e7e-1530-411b-b7a4-9f13e0ff1f9e@redhat.com>
 <e7ilwp3vc32xze3iu2ejgqlgz44codsktnvyiufjhuf2zxcnnf@tnwzgzoxvbg2>
 <d2a512b2-e6b1-4675-b406-478074bbbe95@linaro.org>
 <CAA8EJpr4bJUQt2T63_FZ=KHGEm4vixfpk3pMV9naABEONJfMmQ@mail.gmail.com>
 <20240507184049.GC20390@pendragon.ideasonboard.com>
 <CAA8EJpqLu5w7gnqtDyuDDQBd7AEROTd6LTYi8muzjToXmkKR3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAA8EJpqLu5w7gnqtDyuDDQBd7AEROTd6LTYi8muzjToXmkKR3w@mail.gmail.com>
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

On Tue, May 07, 2024 at 10:59:42PM +0300, Dmitry Baryshkov wrote:
> On Tue, 7 May 2024 at 21:40, Laurent Pinchart wrote:
> > On Tue, May 07, 2024 at 06:19:18PM +0300, Dmitry Baryshkov wrote:
> > > On Tue, 7 May 2024 at 18:15, Bryan O'Donoghue wrote:
> > > > On 07/05/2024 16:09, Dmitry Baryshkov wrote:
> > > > > Ah, I see. Then why do you require the DMA-ble buffer at all? If you are
> > > > > providing data to VPU or DRM, then you should be able to get the buffer
> > > > > from the data-consuming device.
> > > >
> > > > Because we don't necessarily know what the consuming device is, if any.
> > > >
> > > > Could be VPU, could be Zoom/Hangouts via pipewire, could for argument
> > > > sake be GPU or DSP.
> > > >
> > > > Also if we introduce a dependency on another device to allocate the
> > > > output buffers - say always taking the output buffer from the GPU, then
> > > > we've added another dependency which is more difficult to guarantee
> > > > across different arches.
> > >
> > > Yes. And it should be expected. It's a consumer who knows the
> > > restrictions on the buffer. As I wrote, Zoom/Hangouts should not
> > > require a DMA buffer at all.
> >
> > Why not ? If you want to capture to a buffer that you then compose on
> > the screen without copying data, dma-buf is the way to go. That's the
> > Linux solution for buffer sharing.
> 
> Yes. But it should be allocated by the DRM driver. As Sima wrote,
> there is no guarantee that the buffer allocated from dma-heaps is
> accessible to the GPU.

No disagreement there. From a libcamera point of view, we want to import
buffers allocated externally. It's for use cases where applications
can't provide dma buf instances easily that we need to allocate them
through the libcamera buffer allocator helper. That helper has to a)
provide dma buf fds, and b) make a best effort to allocate buffers that
will have a decent chance of being usable by other devices. We're open
to exploring other solutions than dma heaps, although I wonder what the
dma heaps are for if nobody enables them :-)

> > > Applications should be able to allocate
> > > the buffer out of the generic memory.
> >
> > If applications really want to copy data and degrade performance, they
> > are free to shoot themselves in the foot of course. Applications (or
> > compositors) need to support copying as a fallback in the worst case,
> > but all components should at least aim for the zero-copy case.
> 
> I'd say that they should aim for the optimal case. It might include
> both zero-copying access from another DMA master or simple software
> processing of some kind.
> 
> > > GPUs might also have different
> > > requirements. Consider GPUs with VRAM. It might be beneficial to
> > > allocate a buffer out of VRAM rather than generic DMA mem.
> >
> > Absolutely. For that we need a centralized device memory allocator in
> > userspace. An effort was started by James Jones in 2016, see [1]. It has
> > unfortunately stalled. If I didn't have a camera framework to develop, I
> > would try to tackle that issue :-)
> 
> I'll review the talk. However the fact that the effort has stalled
> most likely means that 'one fits them all' approach didn't really fly
> well. We have too many usecases.
> 
> > [1] https://www.x.org/wiki/Events/XDC2016/Program/Unix_Device_Memory_Allocation.pdf

-- 
Regards,

Laurent Pinchart
