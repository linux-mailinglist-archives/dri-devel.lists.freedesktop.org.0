Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E09878BF8CE
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 10:40:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E535010F26B;
	Wed,  8 May 2024 08:40:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="hK+q+5Qk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D396910F26B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 08:40:02 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a59a86fb052so133845266b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 01:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1715157601; x=1715762401; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TjDECsAq9W3dnXC6ANhg0GrZ6XSPEO0XVnHc2JQoQ80=;
 b=hK+q+5Qkzsu9LOeVhgSXVjZ+/mkxO3vvIYTnTibuUwhNGSmdq4k6Ijf8UBBSzfz/Px
 Ml+mVEA3sEq3cyJevwoIQ/qYaxe6HJOIkh2b6L3tkDZeJieO02miSCFYPtY93+XEOpRa
 SgGexLFifArVtafbAnxOmaDPTqMV19fKu/GQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715157601; x=1715762401;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TjDECsAq9W3dnXC6ANhg0GrZ6XSPEO0XVnHc2JQoQ80=;
 b=YC+KWeofCb6prVkDq22u62jGA59wLdpCu0VkWAq3Nf2MNYtSEBiztMcFRXj/HfCLyM
 D585hoNe4WtD4hZe6Nzi5wAwji/JBRUYoAAevhjtzt5upqZeC50Aw9qlflllFd0n6F80
 IgcjKwHQ/+QdfRYA5BxpU78avBzsr3ODdb7Q5u1VhUwiw/VC6ze4j42dKgTebPEGe7gP
 +yoBR9nb/KVxtyBKLmFhcwwJ90kYXOUeaq4+J6aYwhHAqC85DKoXUD3BDDvgF3/fLnxR
 NYhMS74HJfwGRjSZCb3Glxtj9zebxFgUs5utLA2n89Qtbq2UTSovUwNM/l1vy4uAQQ9x
 m89A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOQovZKDOkPa4mUUBFy/FI731cDLKxLn3CTNMGni4xEieudTpCidMijfEWVvuQ8Rwc0kwVSwibc6v68ui25FwJ7fB7ZZH5M/Ohz1vwv2+B
X-Gm-Message-State: AOJu0Yx7+PEBV464SgAYdRd6tIXlcYWz94fTIlrVTVTUU305UHfO0bkU
 b619MisdgniH5IFyaWefhWHEyWdBsHTuqJV+Z9beyTAwovyvnTH8nYC3++jdvIs=
X-Google-Smtp-Source: AGHT+IGPIAQ6Tm4FnC70hw3PFhT5mBH/5wt01YJzyWABi0B27GbCxWEn36XIAqIwrxHxasKk9JiZiw==
X-Received: by 2002:a17:906:ccce:b0:a59:cf59:f7ff with SMTP id
 a640c23a62f3a-a59fb94f3c4mr140742766b.2.1715157601017; 
 Wed, 08 May 2024 01:40:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 bi11-20020a170907368b00b00a59f73fb086sm1155563ejc.196.2024.05.08.01.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 01:40:00 -0700 (PDT)
Date: Wed, 8 May 2024 10:39:58 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
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
Message-ID: <Zjs6Xt_W0VsY8wJc@phenom.ffwll.local>
Mail-Followup-To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Lennart Poettering <mzxreary@0pointer.de>,
 Robert Mader <robert.mader@collabora.com>,
 Sebastien Bacher <sebastien.bacher@canonical.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Milan Zamazal <mzamazal@redhat.com>,
 Maxime Ripard <mripard@redhat.com>,
 Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
 <ojduxo54lpcbfg2wfuhqhy7k3phncamtklh65z7gvttcwztmhk@zkifewcy4ovi>
 <3c0c7e7e-1530-411b-b7a4-9f13e0ff1f9e@redhat.com>
 <e7ilwp3vc32xze3iu2ejgqlgz44codsktnvyiufjhuf2zxcnnf@tnwzgzoxvbg2>
 <d2a512b2-e6b1-4675-b406-478074bbbe95@linaro.org>
 <CAA8EJpr4bJUQt2T63_FZ=KHGEm4vixfpk3pMV9naABEONJfMmQ@mail.gmail.com>
 <20240507184049.GC20390@pendragon.ideasonboard.com>
 <CAA8EJpqLu5w7gnqtDyuDDQBd7AEROTd6LTYi8muzjToXmkKR3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpqLu5w7gnqtDyuDDQBd7AEROTd6LTYi8muzjToXmkKR3w@mail.gmail.com>
X-Operating-System: Linux phenom 6.6.15-amd64 
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
> On Tue, 7 May 2024 at 21:40, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
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
> 
> >
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

I think there's two reasons:

- It's a really hard problem with many aspects. Where you need to allocate
  the buffer is just one of the myriad of issues a common allocator needs
  to solve.

- Every linux-based os has their own solution for these, and the one that
  suffers most has an entirely different one from everyone else: Android
  uses binder services to allow apps to make these allocations, keep track
  of them and make sure there's no abuse. And if there is, it can just
  nuke the app.

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
