Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE809322DE
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 11:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE9A10E48A;
	Tue, 16 Jul 2024 09:31:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="b6zVeaHb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3748110E48A
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 09:31:58 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3679bc8fa9cso158792f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 02:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1721122316; x=1721727116; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bmqE+tUBq0/SZnmu4rbe4uibdP78BlfSNiZLCEbAiTQ=;
 b=b6zVeaHb8NuYy3mssaPVFRouRQSbQujFOT+s/O8Acfh0r0DFWWavJJ/v3zdXmelJtu
 2gNdUKFtWZw2U7JQzHtWBXni556HHezzIE3GiJZ42xlSv+drFimJhZvaocZamLmBh+H/
 qsAvxA4+4VLzaPV9o/SSwzG5g/IFAS7YREW+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721122316; x=1721727116;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bmqE+tUBq0/SZnmu4rbe4uibdP78BlfSNiZLCEbAiTQ=;
 b=alt6lNaSDVCR3JOvs7hRxpO7CE+PyXwdcnC1kSMkXjpq9qNWV359nfsPLMjoNpyCFQ
 dgXLnlbXqz7qqvY2TxaDTIlxIRsmG65gIXx9oYy8L9FBp6O7xyohZSVEeQBIWNVjQOCL
 9sNuP5brtbQdDjylPERp+4bePo+layM2U5igoaW6WGHrY7TVSHjEwQRbeFrNyTOAoodl
 g7useS7ulUdbfyUk5EQv02Si/GPlaGvTtI+711Ceo82R1kzrMY1c5HHG1Nio29j7eqhK
 2If0bqUgxEd/sQDxktQsOxMEfkvEivx/tj08XROJKoaOsfix9RDRbhF4v6ddmQSIcDm7
 dX2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIAdY2T/FtA8f++7GCAMmBlzl3parJAdSdEZCJqqB1A745DIJnrt0B6FwgcTlhUlMDczvTZPQOHE1P2w5rTStOukAq+yZud+Cqzvq3cTCP
X-Gm-Message-State: AOJu0YxEy0rmAOO22sTg02C/6EO2vbSvGzMOQ0DhwV5gvuoufLhtmxjF
 Mape22Q56R6BZuowc0IgcXpwc+urFTW9yHFIHMuv0SKXWyWhmVwLIafnl3wfrDc=
X-Google-Smtp-Source: AGHT+IH/pdOxEOwXcwiFkFydr3Ad0jnhs/61yWLi82ofglrUoK4E94kyYC5hYQMjmbMfPaS16eQmsw==
X-Received: by 2002:a05:600c:4f89:b0:424:ac9f:5c61 with SMTP id
 5b1f17b1804b1-427b88d2cd5mr9618625e9.3.1721122316383; 
 Tue, 16 Jul 2024 02:31:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680db038dbsm8356168f8f.95.2024.07.16.02.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 02:31:55 -0700 (PDT)
Date: Tue, 16 Jul 2024 11:31:53 +0200
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
Message-ID: <ZpY-CfcDdEhzWpxN@phenom.ffwll.local>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <06713006-c5ce-4773-a1b3-ca3bea56ee45@vivo.com>
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

On Tue, Jul 16, 2024 at 10:48:40AM +0800, Huan Yang wrote:
> I just research the udmabuf, Please correct me if I'm wrong.
> 
> 在 2024/7/15 20:32, Christian König 写道:
> > Am 15.07.24 um 11:11 schrieb Daniel Vetter:
> > > On Thu, Jul 11, 2024 at 11:00:02AM +0200, Christian König wrote:
> > > > Am 11.07.24 um 09:42 schrieb Huan Yang:
> > > > > Some user may need load file into dma-buf, current
> > > > > way is:
> > > > >     1. allocate a dma-buf, get dma-buf fd
> > > > >     2. mmap dma-buf fd into vaddr
> > > > >     3. read(file_fd, vaddr, fsz)
> > > > > This is too heavy if fsz reached to GB.
> > > > You need to describe a bit more why that is to heavy. I can only
> > > > assume you
> > > > need to save memory bandwidth and avoid the extra copy with the CPU.
> > > > 
> > > > > This patch implement a feature called DMA_HEAP_IOCTL_ALLOC_READ_FILE.
> > > > > User need to offer a file_fd which you want to load into
> > > > > dma-buf, then,
> > > > > it promise if you got a dma-buf fd, it will contains the file content.
> > > > Interesting idea, that has at least more potential than trying
> > > > to enable
> > > > direct I/O on mmap()ed DMA-bufs.
> > > > 
> > > > The approach with the new IOCTL might not work because it is a very
> > > > specialized use case.
> > > > 
> > > > But IIRC there was a copy_file_range callback in the file_operations
> > > > structure you could use for that. I'm just not sure when and how
> > > > that's used
> > > > with the copy_file_range() system call.
> > > I'm not sure any of those help, because internally they're all still
> > > based
> > > on struct page (or maybe in the future on folios). And that's the thing
> > > dma-buf can't give you, at least without peaking behind the curtain.
> > > 
> > > I think an entirely different option would be malloc+udmabuf. That
> > > essentially handles the impendence-mismatch between direct I/O and
> > > dma-buf
> > > on the dma-buf side. The downside is that it'll make the permanently
> > > pinned memory accounting and tracking issues even more apparent, but I
> > > guess eventually we do need to sort that one out.
> > 
> > Oh, very good idea!
> > Just one minor correction: it's not malloc+udmabuf, but rather
> > create_memfd()+udmabuf.

Hm right, it's create_memfd() + mmap(memfd) + udmabuf

> > And you need to complete your direct I/O before creating the udmabuf
> > since that reference will prevent direct I/O from working.
> 
> udmabuf will pin all pages, so, if returned fd, can't trigger direct I/O
> (same as dmabuf). So, must complete read before pin it.

Why does pinning prevent direct I/O? I haven't tested, but I'd expect the
rdma folks would be really annoyed if that's the case ...

> But current way is use `memfd_pin_folios` to boost alloc and pin, so maybe
> need suit it.
> 
> 
> I currently doubt that the udmabuf solution is suitable for our
> gigabyte-level read operations.
> 
> 1. The current mmap operation uses faulting, so frequent page faults will be
> triggered during reads, resulting in a lot of context switching overhead.
> 
> 2. current udmabuf size limit is 64MB, even can change, maybe not good to
> use in large size?

Yeah that's just a figleaf so we don't have to bother about the accounting
issue.

> 3. The migration and adaptation of the driver is also a challenge, and
> currently, we are unable to control it.

Why does a udmabuf fd not work instead of any other dmabuf fd? That
shouldn't matter for the consuming driver ...

> Perhaps implementing `copy_file_range` would be more suitable for us.

See my other mail, fundamentally these all rely on struct page being
present, and dma-buf doesn't give you that. Which means you need to go
below the dma-buf abstraction. And udmabuf is pretty much the thing for
that, because it wraps normal struct page memory into a dmabuf.

And copy_file_range on the underlying memfd might already work, I haven't
checked though.

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
