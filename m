Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CF08320A8
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 21:59:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10AEE10E1A1;
	Thu, 18 Jan 2024 20:58:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC6F10E8DC
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 20:58:56 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-55369c59708so5701a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 12:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1705611475; x=1706216275; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vG2d4C5q3VAnujQnY/vfroPdU2IS/AysqJ++FSIJIio=;
 b=RIDnkMr/bKZd2zs1cmr1HV1HxOmKxXyftGX1urbCdGXwgurUlvsLLS9khpQi6axH8F
 1TyAZKQ8vF/EzbuGKMi/AWpFuSc1m8wUjTWq1wS82rqbWcztvoPIt6IDkHnhv1XlnfgF
 UvWshxe1ay0eCVeQuHFE85Y/waGoG366EKF/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705611475; x=1706216275;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vG2d4C5q3VAnujQnY/vfroPdU2IS/AysqJ++FSIJIio=;
 b=oOgc8BJw8JrpdSWWxevxzS+fg/maGbghhJ7fk5Hc3AX0zp3aTGVl+I5BQsvGaQ6AXc
 31j/AqCP633vopEtcgUlQA5I+m27zAUzogWKiBmqA03vlyAqpn8lhqOqKk/lZUASFa//
 Efwj+lFwIZy5oUpb0GKNB2BgBukmlA5or9W00P9F6WIvvkRHnXFjNQsODJhpv+EPqjJM
 oM5j+CttCa3rLJRs5QRhjQ3hlG+VtPH1rWc8cKAdTm6ksy1m+IN8jbpzYnfbu0BD/DW0
 3Oyc39K0tbleTwHZOf9an5jh17iV2SFqthsf8pHk1OlcLxUx2V73KKZpdXgor46N0ObR
 h+UQ==
X-Gm-Message-State: AOJu0YwHLjEWkRmCCoNv6hephhLcCh2WApeEgETSrBuWNE/60644PdfP
 RppjoJwOxv2j+65SPDDisBFz4JiwK6hnyKu2hruahg6jasybE4Lmyho6sddrw+0=
X-Google-Smtp-Source: AGHT+IFYmE5E+AxibG3l6XMG9L3qmRanwGu4ICGZmkOTqqqlW7iV75YmqX3x6L0EdKpKJSK42kFhYg==
X-Received: by 2002:aa7:dad4:0:b0:559:87b5:9692 with SMTP id
 x20-20020aa7dad4000000b0055987b59692mr276297eds.2.1705611474838; 
 Thu, 18 Jan 2024 12:57:54 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a056402444900b00559dd0a5146sm2509754edb.44.2024.01.18.12.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jan 2024 12:57:54 -0800 (PST)
Date: Thu, 18 Jan 2024 21:57:52 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: "T.J. Mercier" <tjmercier@google.com>
Subject: Re: [PATCH] dma-buf: heaps: Don't track CMA dma-buf pages under
 RssFile
Message-ID: <ZamQ0LAX2B6qaK6g@phenom.ffwll.local>
Mail-Followup-To: "T.J. Mercier" <tjmercier@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>,
 Sandeep Patil <sspatil@android.com>,
 Laura Abbott <labbott@redhat.com>, android-mm@google.com,
 minchan@google.com, John Stultz <john.stultz@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20240117181141.286383-1-tjmercier@google.com>
 <20a68f86-27f0-48f4-a066-7dcf0092858e@amd.com>
 <Zak6iW8lktml7f2H@phenom.ffwll.local>
 <CABdmKX10zz6bk4VVDgsosJbA8_7WOxuCnkyYFiL1FPwtZ-C+WQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABdmKX10zz6bk4VVDgsosJbA8_7WOxuCnkyYFiL1FPwtZ-C+WQ@mail.gmail.com>
X-Operating-System: Linux phenom 6.5.0-4-amd64 
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
Cc: android-mm@google.com, Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 daniel@ffwll.ch, minchan@google.com,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, John Stultz <jstultz@google.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 John Stultz <john.stultz@linaro.org>, Laura Abbott <labbott@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Sandeep Patil <sspatil@android.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 18, 2024 at 08:57:16AM -0800, T.J. Mercier wrote:
> On Thu, Jan 18, 2024 at 6:49 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Thu, Jan 18, 2024 at 11:02:22AM +0100, Christian König wrote:
> > > Am 17.01.24 um 19:11 schrieb T.J. Mercier:
> > > > DMA buffers allocated from the CMA dma-buf heap get counted under
> > > > RssFile for processes that map them and trigger page faults. In
> > > > addition to the incorrect accounting reported to userspace, reclaim
> > > > behavior was influenced by the MM_FILEPAGES counter until linux 6.8, but
> > > > this memory is not reclaimable. [1] Change the CMA dma-buf heap to set
> > > > VM_PFNMAP on the VMA so MM does not poke at the memory managed by this
> > > > dma-buf heap, and use vmf_insert_pfn to correct the RSS accounting.
> > > >
> > > > The system dma-buf heap does not suffer from this issue since
> > > > remap_pfn_range is used during the mmap of the buffer, which also sets
> > > > VM_PFNMAP on the VMA.
> > >
> > > Mhm, not an issue with this patch but Daniel wanted to add a check for
> > > VM_PFNMAP to dma_buf_mmap() which would have noted this earlier.
> > >
> > > I don't fully remember the discussion but for some reason that was never
> > > committed. We should probably try that again.
> >
> > Iirc the issue is that dma_mmap is not guaranteed to give you a VM_SPECIAL
> > mapping, at least on absolutely all architectures. That's why I defacto
> > dropped that idea, but it would indeed be really great if we could
> > resurrect it.
> 
> I actually had it in my head that it was a BUG_ON check for VM_PFNMAP
> in dma_buf_mmap and it was merged, so I was surprised to discover that
> it wasn't set for these CMA buffers.
> 
> > Maybe for x86 only? Or x86+armv8, I'm honestly not sure anymore which
> > exact cases ended up with a VM_NORMAL mapping ... Would need a pile of
> > digging.
> 
> Looking back at the patch, the CI email at the end of the thread lists
> a bunch of now-broken links to DMESG-WARN test failures I assume
> pointed at a large chunk of them.
> 
> https://lore.kernel.org/all/166919750173.15575.2864736980735346730@emeril.freedesktop.org/

I thought there was a more recent submission, where I at least fixed the
various fallout in gem code. But maybe I only dreamed ...

Also I did the code grepping again, and at least iommu_dma_mmap() in
drivers/iommu/dma-iommu.c and arm_iommu_mmap_attrs() for arm use
vm_map_pages in certain cases, which is _not_ VM_PFNMAP.

Means really no cases where I think we can assume we'll always get
VM_PFNMAP, and unfortunately we need VM_PFNMAP or VM_IO to prevent
get_user_pages and similar bad things from happening to dma-buf mmaps.

So still no luck :-/
-Sima


> 
> > >
> > > > [1]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/mm/vmscan.c?id=fb46e22a9e3863e08aef8815df9f17d0f4b9aede
> > > >
> > > > Fixes: b61614ec318a ("dma-buf: heaps: Add CMA heap to dmabuf heaps")
> > > > Signed-off-by: T.J. Mercier<tjmercier@google.com>
> > >
> > > Acked-by: Christian König <christian.koenig@amd.com>
> 
> Thanks Christian.

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
