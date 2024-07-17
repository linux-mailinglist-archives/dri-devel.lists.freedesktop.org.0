Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFAA933F5D
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 17:15:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1BE810E297;
	Wed, 17 Jul 2024 15:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="JAyQQ/tv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E19210E297
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 15:15:11 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2eebc75b36cso9770711fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 08:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1721229310; x=1721834110; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=q9HrtX7c96O18IuuXuteBar9YTu3ZWt4dVPqAERO/8M=;
 b=JAyQQ/tvianmxwUpHvf6+NHNqZUxv8M7YRmR7yjD0IE0uPBQJGJQX+kOIwcsCwe/sM
 p1QksOFP1heH8mvZ/cCaBJOWlClo1FpfyZMftBaSmJXcVGs6MKMhSxcfCODbnh9kaPnD
 z5uo35rj1Bf3foYDCkhnGxHn2aVQ7+j4fqMWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721229310; x=1721834110;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q9HrtX7c96O18IuuXuteBar9YTu3ZWt4dVPqAERO/8M=;
 b=MOXvm/nYr/cZofJGZvAySNA9gpAblY6xmU/igLps02Ql4OMPB1O/ruv8Yma6FSNDQd
 5E6rxsViOG1e11LNP7umNLks1r4KkFPd7h9XGuveEWQP/oynelPVoQ8Tg3SKSlmdAsQh
 vT11B+/8PcY/9l+OKu24LZp/ShwDjyxlsPGDT1DFjnFKecg+3yGUlUAVC4E/32FoiyHN
 TYpWzEplYw5dztFDdC3lz//WnHIhdxYUG/7cmJv7/8uOzcP1ZUPtSM3CNNk6uDq18wQD
 PlIOLMXzMb+nqyE0HD9N/BDmtM5g6sQzJrYpdDocQULGS/oRUG+iby0qb4faUmFRY3mS
 RoWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRHlQjyUscNvdIAtTsYBdurOasPMC2YSDPbL9cDx1kBB8C4m+WLM0KLMKAwo072klnrb5As4Iw/D10Vz8bHNx8EucIvETv3IUPVKwByIHO
X-Gm-Message-State: AOJu0YyjKwN/fQwRKCPgj4dOdOA68z0COjW9MPkLHrSBEvS48FIxp2+q
 C+AeGTh6Lqpoykcs5WsEzwn8PZ2tqmcs5B+zPbrMfZlnoNGwYbUsTiarn+KIWq4bKwVvziQHhpY
 sa7g=
X-Google-Smtp-Source: AGHT+IHMVqpdhwo8cN+q4abV2zZH6SbwUgRNWI5ZHWTuC/QWxkMk42eGNyxkoYfkbRzeOsg/EyRl2Q==
X-Received: by 2002:a05:651c:b1e:b0:2ee:84a1:9be4 with SMTP id
 38308e7fff4ca-2eefd06e80amr10752411fa.2.1721229309619; 
 Wed, 17 Jul 2024 08:15:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680daccbddsm11974603f8f.64.2024.07.17.08.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jul 2024 08:15:09 -0700 (PDT)
Date: Wed, 17 Jul 2024 17:15:07 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Huan Yang <link@vivo.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
Subject: Re: [PATCH 1/2] dma-buf: heaps: DMA_HEAP_IOCTL_ALLOC_READ_FILE
 framework
Message-ID: <Zpff-8LmqK5AD-a8@phenom.ffwll.local>
Mail-Followup-To: Huan Yang <link@vivo.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
References: <20240711074221.459589-1-link@vivo.com>
 <20240711074221.459589-2-link@vivo.com>
 <5ccbe705-883c-4651-9e66-6b452c414c74@amd.com>
 <ZpTnzkdolpEwFbtu@phenom.ffwll.local>
 <99364176-a7f0-4a17-8889-75ff92d5694e@amd.com>
 <06713006-c5ce-4773-a1b3-ca3bea56ee45@vivo.com>
 <ZpY-CfcDdEhzWpxN@phenom.ffwll.local>
 <b18ad853-90e4-4ad7-b621-2ca8a8111708@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b18ad853-90e4-4ad7-b621-2ca8a8111708@vivo.com>
X-Operating-System: Linux phenom 6.9.7-amd64 
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

On Tue, Jul 16, 2024 at 06:14:48PM +0800, Huan Yang wrote:
> 
> 在 2024/7/16 17:31, Daniel Vetter 写道:
> > [你通常不会收到来自 daniel.vetter@ffwll.ch 的电子邮件。请访问 https://aka.ms/LearnAboutSenderIdentification，以了解这一点为什么很重要]
> > 
> > On Tue, Jul 16, 2024 at 10:48:40AM +0800, Huan Yang wrote:
> > > I just research the udmabuf, Please correct me if I'm wrong.
> > > 
> > > 在 2024/7/15 20:32, Christian König 写道:
> > > > Am 15.07.24 um 11:11 schrieb Daniel Vetter:
> > > > > On Thu, Jul 11, 2024 at 11:00:02AM +0200, Christian König wrote:
> > > > > > Am 11.07.24 um 09:42 schrieb Huan Yang:
> > > > > > > Some user may need load file into dma-buf, current
> > > > > > > way is:
> > > > > > >      1. allocate a dma-buf, get dma-buf fd
> > > > > > >      2. mmap dma-buf fd into vaddr
> > > > > > >      3. read(file_fd, vaddr, fsz)
> > > > > > > This is too heavy if fsz reached to GB.
> > > > > > You need to describe a bit more why that is to heavy. I can only
> > > > > > assume you
> > > > > > need to save memory bandwidth and avoid the extra copy with the CPU.
> > > > > > 
> > > > > > > This patch implement a feature called DMA_HEAP_IOCTL_ALLOC_READ_FILE.
> > > > > > > User need to offer a file_fd which you want to load into
> > > > > > > dma-buf, then,
> > > > > > > it promise if you got a dma-buf fd, it will contains the file content.
> > > > > > Interesting idea, that has at least more potential than trying
> > > > > > to enable
> > > > > > direct I/O on mmap()ed DMA-bufs.
> > > > > > 
> > > > > > The approach with the new IOCTL might not work because it is a very
> > > > > > specialized use case.
> > > > > > 
> > > > > > But IIRC there was a copy_file_range callback in the file_operations
> > > > > > structure you could use for that. I'm just not sure when and how
> > > > > > that's used
> > > > > > with the copy_file_range() system call.
> > > > > I'm not sure any of those help, because internally they're all still
> > > > > based
> > > > > on struct page (or maybe in the future on folios). And that's the thing
> > > > > dma-buf can't give you, at least without peaking behind the curtain.
> > > > > 
> > > > > I think an entirely different option would be malloc+udmabuf. That
> > > > > essentially handles the impendence-mismatch between direct I/O and
> > > > > dma-buf
> > > > > on the dma-buf side. The downside is that it'll make the permanently
> > > > > pinned memory accounting and tracking issues even more apparent, but I
> > > > > guess eventually we do need to sort that one out.
> > > > Oh, very good idea!
> > > > Just one minor correction: it's not malloc+udmabuf, but rather
> > > > create_memfd()+udmabuf.
> > Hm right, it's create_memfd() + mmap(memfd) + udmabuf
> > 
> > > > And you need to complete your direct I/O before creating the udmabuf
> > > > since that reference will prevent direct I/O from working.
> > > udmabuf will pin all pages, so, if returned fd, can't trigger direct I/O
> > > (same as dmabuf). So, must complete read before pin it.
> > Why does pinning prevent direct I/O? I haven't tested, but I'd expect the
> > rdma folks would be really annoyed if that's the case ...
> > 
> > > But current way is use `memfd_pin_folios` to boost alloc and pin, so maybe
> > > need suit it.
> > > 
> > > 
> > > I currently doubt that the udmabuf solution is suitable for our
> > > gigabyte-level read operations.
> > > 
> > > 1. The current mmap operation uses faulting, so frequent page faults will be
> > > triggered during reads, resulting in a lot of context switching overhead.
> > > 
> > > 2. current udmabuf size limit is 64MB, even can change, maybe not good to
> > > use in large size?
> > Yeah that's just a figleaf so we don't have to bother about the accounting
> > issue.
> > 
> > > 3. The migration and adaptation of the driver is also a challenge, and
> > > currently, we are unable to control it.
> > Why does a udmabuf fd not work instead of any other dmabuf fd? That
> > shouldn't matter for the consuming driver ...
> 
> Hmm, our production's driver provider by other oem. I see many of they
> implement
> 
> their own dma_buf_ops.  These may not be generic and may require them to
> reimplement.

Yeah, for exporting a buffer object allocated by that driver. But any
competent gles/vk stack also supports importing dma-buf, and that should
work with udmabuf exactly the same way as with a dma-buf allocated from
the system heap.

> > > Perhaps implementing `copy_file_range` would be more suitable for us.
> > See my other mail, fundamentally these all rely on struct page being
> > present, and dma-buf doesn't give you that. Which means you need to go
> > below the dma-buf abstraction. And udmabuf is pretty much the thing for
> > that, because it wraps normal struct page memory into a dmabuf.
> Yes, udmabuf give this, I am very interested in whether the page provided by
> udmabuf can trigger direct I/O.
> 
> So, I'll give a test and report soon.
> > 
> > And copy_file_range on the underlying memfd might already work, I haven't
> > checked though.
> 
> I have doubts.
> 
> I recently tested and found that I need to modify many places in
> vfs_copy_file_range in order to run the copy file range with DMA_BUF fd.(I
> have managed to get it working,

I'm talking about memfd, not dma-buf here. I think copy_file_range to
dma-buf is as architecturally unsound as allowing O_DIRECT on the dma-buf
mmap.

Cheers, Sima

> but I don't think the implementation is good enough, so I can't provide the
> source code.)
> 
> Maybe memfd can work or not, let's give it a test.:)
> 
> Anyway, it's a good idea too. I currently need to focus on whether it can be
> achieved, as well as the performance comparison.
> 
> > 
> > Cheers, Sima
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch/

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
