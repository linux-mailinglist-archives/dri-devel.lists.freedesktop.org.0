Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C87831BCB
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 15:51:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E5610E848;
	Thu, 18 Jan 2024 14:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F5610E0A8
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 14:50:50 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a29b850ec66so380700266b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 06:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1705589389; x=1706194189; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=T0SV8U+IlkdLHr/XjT2iGav+KPgKzY+DGmeC0LEv1Zs=;
 b=BJIHzeAV3vaXK57KP++CsvXfJRLviS4Va+a31vfxl08RGtilnB17DavbRfgbPg0JZv
 7vjJzccPFOvLGtGfjk+GdV1rxlwie+r57lIbwZKjtXTTak9+A3XsEKGGm0xPQcT2NJ8m
 DVKpNZxQ3AVJRk+6ZVZuUaIX5hJay48JeHIBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705589389; x=1706194189;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T0SV8U+IlkdLHr/XjT2iGav+KPgKzY+DGmeC0LEv1Zs=;
 b=eiOynAMW+sbw11CHXef1jqkHUfNC1JWjbBpBm8vUrxb2OOwgTR+pd5HgQ3YFH5uBCs
 9Szz6L1rbD4nkEGy934anOZHgB7O3FGaJ3WJtfl7S3aBLiD3XY3RCg6Qyt+Znfx8dgdl
 7tWQ0UuB2jnMNldqw+nqL2K8rRfSOIhLLfahkzkvt/xyGG6s6N2jh5A7TyZo71uAyOV0
 nQ56CAxDhbE1O8yJO9YiKABhPAiiGeUcZQgfskx+tF72fwTr75JKoQj4/cQQs5jJk0bL
 EHeK5rVL+nE4D+0tG/zPTz4SPjGeOHp1g73Cp6Ms2N/VWh/usYkKCUHTZYv941gZmljw
 HcPQ==
X-Gm-Message-State: AOJu0Yxe5c+Zu/aZYfSJ6XOX8FCJ6oCNJtYp8uwds/8dU3nAP5417lBc
 hjnnnWoYrwLlpAvK6whoPFtWFHavOzc+QkrDJAszoDza7D5+euE0WPoYafsUBkY=
X-Google-Smtp-Source: AGHT+IEVM70e6beCogh7O7jcU8xaluhv/ktlLII9rfJtR4gxAiS0g3VAw/ikru3AEG+C2Wt7+UZAPw==
X-Received: by 2002:a17:906:4088:b0:a2e:9ff8:218d with SMTP id
 u8-20020a170906408800b00a2e9ff8218dmr1190541ejj.3.1705589388609; 
 Thu, 18 Jan 2024 06:49:48 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 sa19-20020a1709076d1300b00a2eb5c46618sm2437136ejc.19.2024.01.18.06.49.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jan 2024 06:49:47 -0800 (PST)
Date: Thu, 18 Jan 2024 15:49:45 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] dma-buf: heaps: Don't track CMA dma-buf pages under
 RssFile
Message-ID: <Zak6iW8lktml7f2H@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, 
 "T.J. Mercier" <tjmercier@google.com>,
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
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20a68f86-27f0-48f4-a066-7dcf0092858e@amd.com>
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
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, minchan@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, John Stultz <jstultz@google.com>,
 daniel@ffwll.ch, John Stultz <john.stultz@linaro.org>,
 Laura Abbott <labbott@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Sandeep Patil <sspatil@android.com>, "T.J. Mercier" <tjmercier@google.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 18, 2024 at 11:02:22AM +0100, Christian König wrote:
> Am 17.01.24 um 19:11 schrieb T.J. Mercier:
> > DMA buffers allocated from the CMA dma-buf heap get counted under
> > RssFile for processes that map them and trigger page faults. In
> > addition to the incorrect accounting reported to userspace, reclaim
> > behavior was influenced by the MM_FILEPAGES counter until linux 6.8, but
> > this memory is not reclaimable. [1] Change the CMA dma-buf heap to set
> > VM_PFNMAP on the VMA so MM does not poke at the memory managed by this
> > dma-buf heap, and use vmf_insert_pfn to correct the RSS accounting.
> > 
> > The system dma-buf heap does not suffer from this issue since
> > remap_pfn_range is used during the mmap of the buffer, which also sets
> > VM_PFNMAP on the VMA.
> 
> Mhm, not an issue with this patch but Daniel wanted to add a check for
> VM_PFNMAP to dma_buf_mmap() which would have noted this earlier.
> 
> I don't fully remember the discussion but for some reason that was never
> committed. We should probably try that again.

Iirc the issue is that dma_mmap is not guaranteed to give you a VM_SPECIAL
mapping, at least on absolutely all architectures. That's why I defacto
dropped that idea, but it would indeed be really great if we could
resurrect it.

Maybe for x86 only? Or x86+armv8, I'm honestly not sure anymore which
exact cases ended up with a VM_NORMAL mapping ... Would need a pile of
digging.

I think all the other patches I've landed.
-Sima

> 
> > [1]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/mm/vmscan.c?id=fb46e22a9e3863e08aef8815df9f17d0f4b9aede
> > 
> > Fixes: b61614ec318a ("dma-buf: heaps: Add CMA heap to dmabuf heaps")
> > Signed-off-by: T.J. Mercier<tjmercier@google.com>
> 
> Acked-by: Christian König <christian.koenig@amd.com>
> 
> > ---
> >   drivers/dma-buf/heaps/cma_heap.c | 7 +++----
> >   1 file changed, 3 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
> > index ee899f8e6721..4a63567e93ba 100644
> > --- a/drivers/dma-buf/heaps/cma_heap.c
> > +++ b/drivers/dma-buf/heaps/cma_heap.c
> > @@ -168,10 +168,7 @@ static vm_fault_t cma_heap_vm_fault(struct vm_fault *vmf)
> >   	if (vmf->pgoff > buffer->pagecount)
> >   		return VM_FAULT_SIGBUS;
> > -	vmf->page = buffer->pages[vmf->pgoff];
> > -	get_page(vmf->page);
> > -
> > -	return 0;
> > +	return vmf_insert_pfn(vma, vmf->address, page_to_pfn(buffer->pages[vmf->pgoff]));
> >   }
> >   static const struct vm_operations_struct dma_heap_vm_ops = {
> > @@ -185,6 +182,8 @@ static int cma_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
> >   	if ((vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) == 0)
> >   		return -EINVAL;
> > +	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
> > +
> >   	vma->vm_ops = &dma_heap_vm_ops;
> >   	vma->vm_private_data = buffer;

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
