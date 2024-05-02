Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C2B8B961A
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 10:04:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E20510E2B2;
	Thu,  2 May 2024 08:04:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="laFeLDhP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 530FF10E2B2
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 08:04:22 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4190c2ec557so4589415e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2024 01:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1714637061; x=1715241861; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=l+O2B0ZdeV1GXX49oBt/YSppfbCEznO3E1w/D6uWlxg=;
 b=laFeLDhPgNXoALr/GyhmBcM6+BdAYhgEeO2EHT19zyTs3jwesZ9+w1wemTNBfXJ6Yr
 ItvgTR2yHp/XXMQdjKmczLP8qa8eI7EV6dnE8nLBO90fDGQb3NwoT+p3w2+FyioaCyaG
 xVg2QhbeDleO0aetSHpbNEHcOFdh3XgTylI9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714637061; x=1715241861;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l+O2B0ZdeV1GXX49oBt/YSppfbCEznO3E1w/D6uWlxg=;
 b=sSYZzw5D6kIzYj87bDSw8nFxVhMzt9MSVEr0Ht3cwsJ5XHj+JvNTYXEGmPY67p9wiz
 HfwEcSCjSTB+puerNPynWkWQaXyDUPYkid0eQIEyyRbwTL+q+cm3+4j77TSIxDrfdk+R
 qKKt2EZhZE135qRIASzRucWSql4l3s8bFVF3hnUJkF22Xaz50cJKhjSI8MhPd/Q5gW0R
 1DplxI/dGwO+i8pzz1CkN7uxLhwSRWOxS89hCR5PYkeYgfsZEGNTIlJuDxWVOYLnbg8h
 1G/CsJ72BdKuGFGbnxOniZqtAKwrlY+dcUI91sSOWrIQJ2AdPBFv/x/TzGNa5Pp2L+Mw
 1uTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXffcHjOjWhOHGWhM4ac825HLfd72Bev2yJDOU+R7MWiwZoutR2aPGD9aWUT4arhjJdpCM5GOxg05ol4vPwhY2gVb9bO3I64FYfuXmXQ5uc
X-Gm-Message-State: AOJu0YzY5a6KTltULQl09HkL85KE2CjnN+UE3vzg50w48QAkOcmEFAW8
 jF+FUbuVMrgM1pcdcU98VMpekOO54tJjsxxTYRXeDplwdH7swf76IK+3LX4X/RQ=
X-Google-Smtp-Source: AGHT+IGNJ+d7X2n/F+nQFzXJR94w4Tfj9tgrOCUUEgnZZ7JT7Eu/cHrzfPvhsigbpUUXVSLob590wQ==
X-Received: by 2002:a05:600c:1991:b0:41a:408c:579c with SMTP id
 t17-20020a05600c199100b0041a408c579cmr3447620wmq.1.1714637060099; 
 Thu, 02 May 2024 01:04:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 be11-20020a05600c1e8b00b00418f7605249sm1037909wmb.24.2024.05.02.01.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 01:04:19 -0700 (PDT)
Date: Thu, 2 May 2024 10:04:17 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Daniel Vetter <daniel@ffwll.ch>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 "Zeng, Oak" <oak.zeng@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "Welty, Brian" <brian.welty@intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table
 from hmm range
Message-ID: <ZjNJASw0JdXS6dTa@phenom.ffwll.local>
References: <SA1PR11MB699102978E72F21E6C803D6392102@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240425010520.GW941030@nvidia.com>
 <65cb3984309d377d6e7d57cb6567473c8a83ed78.camel@linux.intel.com>
 <20240426120047.GX941030@nvidia.com>
 <ad82f95ee29ada403459416d4c97c2b9083b5a0f.camel@linux.intel.com>
 <20240426163519.GZ941030@nvidia.com>
 <f938dc8f7309ae833e02ccdbc72134df0607dfa4.camel@linux.intel.com>
 <20240430173002.GV941030@nvidia.com>
 <ZjE_LJ7AFFQk0Eep@phenom.ffwll.local>
 <20240501000915.GY941030@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240501000915.GY941030@nvidia.com>
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

On Tue, Apr 30, 2024 at 09:09:15PM -0300, Jason Gunthorpe wrote:
> On Tue, Apr 30, 2024 at 08:57:48PM +0200, Daniel Vetter wrote:
> > On Tue, Apr 30, 2024 at 02:30:02PM -0300, Jason Gunthorpe wrote:
> > > On Mon, Apr 29, 2024 at 10:25:48AM +0200, Thomas Hellström wrote:
> > > 
> > > > > Yes there is another common scheme where you bind a window of CPU to
> > > > > a
> > > > > window on the device and mirror a fixed range, but this is a quite
> > > > > different thing. It is not SVA, it has a fixed range, and it is
> > > > > probably bound to a single GPU VMA in a multi-VMA device page table.
> > > > 
> > > > And this above here is exactly what we're implementing, and the GPU
> > > > page-tables are populated using device faults. Regions (large) of the
> > > > mirrored CPU mm need to coexist in the same GPU vm as traditional GPU
> > > > buffer objects.
> > > 
> > > Well, not really, if that was the case you'd have a single VMA over
> > > the entire bound range, not dynamically create them.
> > > 
> > > A single VMA that uses hmm_range_fault() to populate the VM is
> > > completely logical.
> > > 
> > > Having a hidden range of mm binding and then creating/destroying 2M
> > > VMAs dynamicaly is the thing that doesn't make alot of sense.
> > 
> > I only noticed this thread now but fyi I did dig around in the
> > implementation and it's summarily an absolute no-go imo for multiple
> > reasons. It starts with this approach of trying to mirror cpu vma (which I
> > think originated from amdkfd) leading to all kinds of locking fun, and
> > then it gets substantially worse when you dig into the details.
> 
> :(
> 
> Why does the DRM side struggle so much with hmm_range fault? I would
> have thought it should have a fairly straightforward and logical
> connection to the GPU page table.

Short summary is that traditionally gpu memory was managed with buffer
objects, and each individual buffer object owns the page tables for it's
va range.

For hmm you don't have that buffer object, and you want the pagetables to
be fairly independent (maybe even with their own locking like linux cpu
pagetables do) from any mapping/backing storage. Getting to that world is
a lot of reshuffling, and so thus far all the code went with the quick
hack route of creating ad-hoc ranges that look like buffer objects to the
rest of the driver code. This includes the merged amdkfd hmm code, and if
you dig around in that it results in some really annoying locking
inversions because that middle layer of fake buffer object lookalikes only
gets in the way and results in a fairly fundamental impendendence mismatch
with core linux mm locking.

> FWIW, it does make sense to have both a window and a full MM option
> for hmm_range_fault. ODP does both and it is fine..
> 
> > I think until something more solid shows up you can just ignore this. I do
> > fully agree that for sva the main mirroring primitive needs to be page
> > centric, so dma_map_sg. 
>               ^^^^^^^^^^
> 
> dma_map_page

Oops yes.

> > There's a bit a question around how to make the
> > necessary batching efficient and the locking/mmu_interval_notifier scale
> > enough, but I had some long chats with Thomas and I think there's enough
> > option to spawn pretty much any possible upstream consensus. So I'm not
> > worried.
> 
> Sure, the new DMA API will bring some more considerations to this as
> well. ODP uses a 512M granual scheme and it seems to be OK. By far the
> worst part of all this is the faulting performance. I've yet hear any
> complains about mmu notifier performance..

Yeah I don't expect there to be any need for performance improvements on
the mmu notifier side of things. All the concerns I've heard felt rather
theoretical, or where just fallout of that fake buffer object layer in the
middle.

At worst I guess the gpu pagetables need per-pgtable locking like the cpu
pagetables have, and then maybe keep track of mmu notifier sequence
numbers on a per-pgtable basis, so that invalidates and faults on
different va ranges have no impact on each another. But even that is most
likely way, way down the road.

> > But first this needs to be page-centric in the fundamental mirroring
> > approach.
> 
> Yes

Ok clarifying consensus on this was the main reason I replied, it felt a
bit like the thread was derailing in details that don't yet matter.

Thanks, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
