Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EA0933F7E
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 17:23:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B6610E14D;
	Wed, 17 Jul 2024 15:23:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="QPIPDLtR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B45C210E14D
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 15:23:25 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2eebc75b36cso9786831fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 08:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1721229804; x=1721834604; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=k8FiZ3Q3HqoLocenTRjlmRJv2b/Y73q4whh/GunuTuQ=;
 b=QPIPDLtRRtvIzm0GpgXO/lbWLCkUW8faMeoS5lF9upYyUZ1HLkiAw1osN2/rOoBZ/p
 1I+dG6rgxbuscpyyMeQv+X3O3IldP9+LNntLmPWdkD74Vazb06qf9CNgUMtCxivaA5Sy
 li0Bv0AGf70XVs8EiBgPfXkirEPUqflHGED34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721229804; x=1721834604;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k8FiZ3Q3HqoLocenTRjlmRJv2b/Y73q4whh/GunuTuQ=;
 b=oRmE072bsjVduUxNBr19ZMu3Vd/Yny0Mck3SVQS3uvVwZlsoqLdN37noMp7/h8u5I8
 x1R3bXGOOTV+J+YND8KmKWZN9y3YHBugTPg0F6og5ntPSK/XQB1eaR8QnIrBBgSQW8BU
 /v4uZjF+krAAfIJPjrS6h8DnVvlv2FEspXDe4gK3vOPTtTe58vW5fLsVUrx5jAtdsWiW
 DpnZIJyx0sk6bcfch/J2wTdhbVJCv8sxldigCnb9ze/trpE6NbknDZi5c3RfsRfzQ0Lp
 RKgMUOSd4V2w95WhgriV/xGHIzpryqkNMFBLcw1Rm2EWBQf6A4LEgFtmiHuvO32TMHb7
 MMvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaAzIIku2VeG6coTD31qoTBzfmxHS4PKkF0cTxBrFNTbsvK+fGVpo/lAQyMgs4dLP362T8svIvCBrxpH64zppCzYB7qKa+XXOlRAFHHSVv
X-Gm-Message-State: AOJu0YxWlNZezwijVgqxBflyRDW9vickO1k48QREpwCj9z/cuhBLh1dg
 WHNTbvryQ/olYuYqHRCrg/QBfdIoZiP3YelGeJOeXrr2WFFzhQVbks9ypWtedjk=
X-Google-Smtp-Source: AGHT+IFlciore1y+UQYW9Y0jJvuXHRLOrrsV/Ezh+JQR+RR7GejszYwFg+tRXO6qV2PyKO3GaAOQcA==
X-Received: by 2002:a2e:a552:0:b0:2ee:e196:1486 with SMTP id
 38308e7fff4ca-2eefd139261mr10209451fa.4.1721229803749; 
 Wed, 17 Jul 2024 08:23:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680dabf539sm12004669f8f.47.2024.07.17.08.23.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jul 2024 08:23:23 -0700 (PDT)
Date: Wed, 17 Jul 2024 17:23:21 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Huan Yang <link@vivo.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
Subject: Re: [PATCH 1/2] dma-buf: heaps: DMA_HEAP_IOCTL_ALLOC_READ_FILE
 framework
Message-ID: <Zpfh6VoBWwjteRUR@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, 
 Huan Yang <link@vivo.com>, Sumit Semwal <sumit.semwal@linaro.org>,
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
 <d3ad46ea-df7f-4402-b48a-349e957f198b@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d3ad46ea-df7f-4402-b48a-349e957f198b@amd.com>
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

On Tue, Jul 16, 2024 at 02:07:20PM +0200, Christian König wrote:
> Am 16.07.24 um 11:31 schrieb Daniel Vetter:
> > On Tue, Jul 16, 2024 at 10:48:40AM +0800, Huan Yang wrote:
> > > I just research the udmabuf, Please correct me if I'm wrong.
> > > 
> > > 在 2024/7/15 20:32, Christian König 写道:
> > > > Am 15.07.24 um 11:11 schrieb Daniel Vetter:
> > > > > On Thu, Jul 11, 2024 at 11:00:02AM +0200, Christian König wrote:
> > > > > > Am 11.07.24 um 09:42 schrieb Huan Yang:
> > > > > > > Some user may need load file into dma-buf, current
> > > > > > > way is:
> > > > > > >      1. allocate a dma-buf, get dma-buf fd
> > > > > > >      2. mmap dma-buf fd into vaddr
> > > > > > >      3. read(file_fd, vaddr, fsz)
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
> 
> Pinning (or rather taking another page reference) prevents writes from using
> direct I/O because writes try to find all references and make them read only
> so that nobody modifies the content while the write is done.

Where do you see that happen? That's counter to my understading of what
pin_user_page() does, which is what direct I/O uses ...

> As far as I know the same approach is used for NUMA migration and replacing
> small pages with big ones in THP. But for the read case here it should still
> work.

Yeah elevated refcount breaks migration, but that's entirely different
from the direct I/O use-case. Count me somewhat confused.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
