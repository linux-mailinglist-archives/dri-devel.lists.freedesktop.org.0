Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 769818C069B
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 23:55:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB186113258;
	Wed,  8 May 2024 21:55:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Lngs/k/w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09C5B113233
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 21:55:00 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AF36616D4;
 Wed,  8 May 2024 23:54:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1715205295;
 bh=dgQ14T7IWo3V5R5DFVrfrvyMq34UxkAK3satbMJu2i4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Lngs/k/wwpmHemT1wGeOaMh+WqgUSB8rYzqf5OvEUah3M/U0kv8F3XMydwvtuCVcl
 jWEaWpSKHvzvqilNyrOh/tOZO5/TnzuKr2Bf0V6AX2d99MubyfSnv3vvnSX1AyISLw
 2tQ7lOlWezSB/rlPYm1nO6WD1iSd3Eb2VsCg4m2o=
Date: Thu, 9 May 2024 00:54:50 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
Message-ID: <20240508215450.GC24860@pendragon.ideasonboard.com>
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
 <ojduxo54lpcbfg2wfuhqhy7k3phncamtklh65z7gvttcwztmhk@zkifewcy4ovi>
 <3c0c7e7e-1530-411b-b7a4-9f13e0ff1f9e@redhat.com>
 <e7ilwp3vc32xze3iu2ejgqlgz44codsktnvyiufjhuf2zxcnnf@tnwzgzoxvbg2>
 <d2a512b2-e6b1-4675-b406-478074bbbe95@linaro.org>
 <CAA8EJpr4bJUQt2T63_FZ=KHGEm4vixfpk3pMV9naABEONJfMmQ@mail.gmail.com>
 <20240507184049.GC20390@pendragon.ideasonboard.com>
 <CAA8EJpqLu5w7gnqtDyuDDQBd7AEROTd6LTYi8muzjToXmkKR3w@mail.gmail.com>
 <Zjs6Xt_W0VsY8wJc@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Zjs6Xt_W0VsY8wJc@phenom.ffwll.local>
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

On Wed, May 08, 2024 at 10:39:58AM +0200, Daniel Vetter wrote:
> On Tue, May 07, 2024 at 10:59:42PM +0300, Dmitry Baryshkov wrote:
> > On Tue, 7 May 2024 at 21:40, Laurent Pinchart wrote:
> > > On Tue, May 07, 2024 at 06:19:18PM +0300, Dmitry Baryshkov wrote:
> > > > On Tue, 7 May 2024 at 18:15, Bryan O'Donoghue wrote:
> > > > > On 07/05/2024 16:09, Dmitry Baryshkov wrote:
> > > > > > Ah, I see. Then why do you require the DMA-ble buffer at all? If you are
> > > > > > providing data to VPU or DRM, then you should be able to get the buffer
> > > > > > from the data-consuming device.
> > > > >
> > > > > Because we don't necessarily know what the consuming device is, if any.
> > > > >
> > > > > Could be VPU, could be Zoom/Hangouts via pipewire, could for argument
> > > > > sake be GPU or DSP.
> > > > >
> > > > > Also if we introduce a dependency on another device to allocate the
> > > > > output buffers - say always taking the output buffer from the GPU, then
> > > > > we've added another dependency which is more difficult to guarantee
> > > > > across different arches.
> > > >
> > > > Yes. And it should be expected. It's a consumer who knows the
> > > > restrictions on the buffer. As I wrote, Zoom/Hangouts should not
> > > > require a DMA buffer at all.
> > >
> > > Why not ? If you want to capture to a buffer that you then compose on
> > > the screen without copying data, dma-buf is the way to go. That's the
> > > Linux solution for buffer sharing.
> > 
> > Yes. But it should be allocated by the DRM driver. As Sima wrote,
> > there is no guarantee that the buffer allocated from dma-heaps is
> > accessible to the GPU.
> > 
> > >
> > > > Applications should be able to allocate
> > > > the buffer out of the generic memory.
> > >
> > > If applications really want to copy data and degrade performance, they
> > > are free to shoot themselves in the foot of course. Applications (or
> > > compositors) need to support copying as a fallback in the worst case,
> > > but all components should at least aim for the zero-copy case.
> > 
> > I'd say that they should aim for the optimal case. It might include
> > both zero-copying access from another DMA master or simple software
> > processing of some kind.
> > 
> > > > GPUs might also have different
> > > > requirements. Consider GPUs with VRAM. It might be beneficial to
> > > > allocate a buffer out of VRAM rather than generic DMA mem.
> > >
> > > Absolutely. For that we need a centralized device memory allocator in
> > > userspace. An effort was started by James Jones in 2016, see [1]. It has
> > > unfortunately stalled. If I didn't have a camera framework to develop, I
> > > would try to tackle that issue :-)
> > 
> > I'll review the talk. However the fact that the effort has stalled
> > most likely means that 'one fits them all' approach didn't really fly
> > well. We have too many usecases.
> 
> I think there's two reasons:
> 
> - It's a really hard problem with many aspects. Where you need to allocate
>   the buffer is just one of the myriad of issues a common allocator needs
>   to solve.

The other large problem is picking up an optimal pixel format. I wonder
if that could be decoupled from the allocation. That could help moving
forward.

> - Every linux-based os has their own solution for these, and the one that
>   suffers most has an entirely different one from everyone else: Android
>   uses binder services to allow apps to make these allocations, keep track
>   of them and make sure there's no abuse. And if there is, it can just
>   nuke the app.

-- 
Regards,

Laurent Pinchart
