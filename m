Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A1D968761
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 14:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 873C410E2CC;
	Mon,  2 Sep 2024 12:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="S2UwNRHs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B57AA10E2D0
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 12:20:25 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-42c2e50ec6aso11481655e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 05:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1725279624; x=1725884424; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fs8K9SSQie2EcY0vLdYoMEUI8BIofNYlXekWwGQYN7A=;
 b=S2UwNRHszXFJcxnrCsnTQtAc9eKAUBSnUM97/Gso4KNvc5ybg8BD+qAJxB+7eQyRhq
 VwRjgTflIZktWxrxyvtGNPWg0R9hwFxrEBn+5xxOV/h9Hd6wNR4Mt35dvzjSgOoi4WY6
 PitzO98vgModMk8+Zq1o0B1nemwGAKUNcpTI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725279624; x=1725884424;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fs8K9SSQie2EcY0vLdYoMEUI8BIofNYlXekWwGQYN7A=;
 b=cOXcyBwyUSWkM/CqQr9qTzWgATbEN522vOKqMmr0jh9qTMvNDhvdKA3WccyNH831A0
 4RZD3BxOyjWntZ9aq9SLSFI76/Tv7dvuYEMiBNPwI3uNnpnRG0KtX5ng8TO2r+/LAdki
 uaW7Q1gP2rWF74JRA3TvVluEMnyt6nr4sNcgkizl+PRRYV8Xub0McdnXxJfFNBf+SbXo
 aMb18yBIaIxd70GPDRI4AHMYSMtjXQEaNlJm20oXiGuQOECVGZbirtLjb7wbKkMIMmQN
 M6YYPMMsWkiTCGWNamdNVCVXez5uu8Na5zVR3mM6GChbyklNRDrm3tRucL1HtAsGWPRE
 uq3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEYYCVuFqxKNYZcHDdVQJwzkzLSKeBVLrvnH2Mp9sVE6mFwAf7/ThfUflChQhgLbqRFW9TXkaXaeo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwX1lKabh4559I+rTKWSzZFpsQ+CuiE2VOYFL71/B+9lqwHgtF7
 ctIxy2KE61vLokgvPPRLr1uNyka+61XiEFUd9rFfvRFs9d2GfvBLOZwcO23Ww+4=
X-Google-Smtp-Source: AGHT+IGUk7nVdjyRqAS0vvlsSJE0TNxg14EUd62pfL7ok/yoYTz7ioH7tS1DY9F+bguytpSQ1AJ/bg==
X-Received: by 2002:a05:600c:3510:b0:429:ea2e:36e1 with SMTP id
 5b1f17b1804b1-42bb4caa0c2mr78086385e9.13.1725279624017; 
 Mon, 02 Sep 2024 05:20:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42baf7fa745sm151539765e9.31.2024.09.02.05.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 05:20:23 -0700 (PDT)
Date: Mon, 2 Sep 2024 14:20:21 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, airlied@gmail.com,
 christian.koenig@amd.com, matthew.auld@intel.com, daniel@ffwll.ch
Subject: Re: [RFC PATCH 05/28] drm/gpusvm: Add support for GPU Shared Virtual
 Memory
Message-ID: <ZtWthfrGthO6GCSB@phenom.ffwll.local>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-6-matthew.brost@intel.com>
 <b8f536b7f804da791869e6ff8c13b36ff93cd1eb.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b8f536b7f804da791869e6ff8c13b36ff93cd1eb.camel@linux.intel.com>
X-Operating-System: Linux phenom 6.9.12-amd64 
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

On Fri, Aug 30, 2024 at 11:16:53AM +0200, Thomas Hellström wrote:
> Hi, Matthew
> 
> On Tue, 2024-08-27 at 19:48 -0700, Matthew Brost wrote:
> > +/**
> > + * DOC: Overview
> > + *
> > + * GPU Shared Virtual Memory (GPU SVM) layer for the Direct
> > Rendering Manager (DRM)
> > + *
> > + * The GPU SVM layer is a component of the DRM framework designed to
> > manage shared
> > + * virtual memory between the CPU and GPU. It enables efficient data
> > exchange and
> > + * processing for GPU-accelerated applications by allowing memory
> > sharing and
> > + * synchronization between the CPU's and GPU's virtual address
> > spaces.
> > + *
> > + * Key GPU SVM Components:
> > + * - Notifiers: Notifiers: Used for tracking memory intervals and
> > notifying the
> > + *		GPU of changes, notifiers are sized based on a GPU
> > SVM
> > + *		initialization parameter, with a recommendation of
> > 512M or
> > + *		larger. They maintain a Red-BlacK tree and a list of
> > ranges that
> > + *		fall within the notifier interval. Notifiers are
> > tracked within
> > + *		a GPU SVM Red-BlacK tree and list and are
> > dynamically inserted
> > + *		or removed as ranges within the interval are created
> > or
> > + *		destroyed.
> > + * - Ranges: Represent memory ranges mapped in a DRM device and
> > managed
> > + *	     by GPU SVM. They are sized based on an array of chunk
> > sizes, which
> > + *	     is a GPU SVM initialization parameter, and the CPU
> > address space.
> > + *	     Upon GPU fault, the largest aligned chunk that fits
> > within the
> > + *	     faulting CPU address space is chosen for the range
> > size. Ranges are
> > + *	     expected to be dynamically allocated on GPU fault and
> > removed on an
> > + *	     MMU notifier UNMAP event. As mentioned above, ranges
> > are tracked in
> > + *	     a notifier's Red-Black tree.
> > + * - Operations: Define the interface for driver-specific SVM
> > operations such as
> > + *		 allocation, page collection, migration,
> > invalidations, and VRAM
> > + *		 release.
> > + *
> 
> Another question, since ranges, as I understand it, are per gpuvm and
> per cpu mm, whereas migration is per device and per cpu_mm, (whe might
> have multiple gpuvms mapping the same cpu_mm), I figure the gpu_svm is
> per gpuvm, but that makes migration currently inconsistent, right?

I think anything that tracks va must be 1:1 tied to the single specific
cpu mm that we use for hmm/svm. So I think that's ok.

There's a pile of paths where that 1:1 mapping doesn't capture the entire
picture. but I think there the right choice is to just completely ignore
any cpu/gpu mm/vma stuff, and defacto rely on the core mm rmap
datastructure to make sure we find them all (e.g. to update/invalidate
ptes during migration).
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
