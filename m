Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 363479840C4
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 10:41:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5CFE10E636;
	Tue, 24 Sep 2024 08:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="eJQ7ckJx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3036710E636
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 08:41:51 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a8d60e23b33so712992966b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 01:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1727167309; x=1727772109; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tbov/vI4P++cYfqbi5/gFJVzgd+SiPrkgS8bqwQCZwU=;
 b=eJQ7ckJxTcBofz/ltNAuriTSKj5xcOT1Poi0OPn+fftH9GTw2AjfYVvhzoFethBjVH
 SAvp+E/Bfp0zmfKfrq5/c5DHi0TuLgeU7W8co46bxbE6DrIm4gYyOo2b/W2H+Ul4sR/F
 5LPADRo1yKpJ45iOxjnJCVACvVUCo+F5o8qf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727167309; x=1727772109;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tbov/vI4P++cYfqbi5/gFJVzgd+SiPrkgS8bqwQCZwU=;
 b=leaF7fk5/i+eIjFqdCUCaJ7fP9t2+umJIxON0E47uwwEMlWAoLcAJtd2pe7nR2ueEo
 3lPjnHbuPoowTFTbbUonZVZC0Saxt8Pj9GpjYSgr7dWqmvoi/GhgNXe0ShknTa6N9rsl
 BmouW0isQAn/Rf9BUF7ujaBMKDOUYQoyutdKboaS4vOWkLAL2TuFdooSbDDqdvNHRAZ3
 V7J7X65zWcEmC+0B45jxF0E60XDzEhUhYG6XOVvWDFyvewY4DM1u1emyQhDE7h/b9r7j
 PyC2hA1GEEwCErBxv9garlYa4/hc3EtbuU2pEJ+6wLbWzfs9loU+BKf2O+KhwmGIMx3c
 M0kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWp35ADtYtnCfsPcrc4orY/ODnWNHBQzn2Ur6+bBZYj+EQ4/92OlkFT2nfxw9nkpmRGQHZltn/apwo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpIabnWJvpgOO9nZwW15BuolmhU5kUKYECTzkAdk99l980HD0L
 UFIg4OKZTIL7jagliHMzhXkh67hjRjix6le6DLlbefEJ9EEBaCw6Zo2sWlk5y9Y=
X-Google-Smtp-Source: AGHT+IHPHzynR7n8+X4XV7nPemf+7lzF7LLSbtlJUxcmjgbBNNL5qUUlL0+5lxR1QZC1e63FbH3TqA==
X-Received: by 2002:a17:907:9282:b0:a91:1787:a955 with SMTP id
 a640c23a62f3a-a911787a9d2mr243880166b.28.1727167309362; 
 Tue, 24 Sep 2024 01:41:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930cadccsm57225566b.125.2024.09.24.01.41.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 01:41:48 -0700 (PDT)
Date: Tue, 24 Sep 2024 10:41:47 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, christian.koenig@amd.com, matthew.auld@intel.com,
 daniel@ffwll.ch
Subject: Re: [RFC PATCH 05/28] drm/gpusvm: Add support for GPU Shared Virtual
 Memory
Message-ID: <ZvJ7S8SJEQjCb1_Y@phenom.ffwll.local>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-6-matthew.brost@intel.com>
 <d66e492df25e8ec3533575245c10eb7dcca709ca.camel@linux.intel.com>
 <ZtCzo11oKXBeKmWp@DUT025-TGLU.fm.intel.com>
 <b657ceec08091a666bdd907f9171727ef395c093.camel@linux.intel.com>
 <ZtDgd7bd6RCs2Orl@DUT025-TGLU.fm.intel.com>
 <ZtWwhM5rJDVVFbVf@phenom.ffwll.local>
 <740fb4b8d88385c879b2b9be2f7f24a38b96b3c3.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <740fb4b8d88385c879b2b9be2f7f24a38b96b3c3.camel@linux.intel.com>
X-Operating-System: Linux phenom 6.10.6-amd64 
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

On Wed, Sep 04, 2024 at 02:27:15PM +0200, Thomas Hellström wrote:
> Hi, Sima,
> 
> On Mon, 2024-09-02 at 14:33 +0200, Daniel Vetter wrote:
> > Jumping in here in the middle, since I think it's a solid place to
> > drop my
> > idea of "align with core mm" gpusvm locking ...
> > 
> > On Thu, Aug 29, 2024 at 08:56:23PM +0000, Matthew Brost wrote:
> > > On Thu, Aug 29, 2024 at 09:18:29PM +0200, Thomas Hellström wrote:
> > > Issues with removing a SVM range:
> > > 
> > > - Xe bind code stores invalidation / present state in VMA, this
> > > would
> > >   need to be moved to the radix tree. I have Jira open for that
> > > work
> > >   which I believe other developers are going to own.
> > > - Where would the dma mapping / device pages be stored?
> > > 	- In the radix tree? What if ATS is enabled? We don't have
> > > a
> > > 	  driver owned radix tree. How do we reasonably connect a
> > > driver
> > > 	  owned radix to a common GPUSVM layer?
> > 
> > Yeah this one is really annoying, because the core mm gets away with
> > nothing because it can just store the pfn in the pte. And it doesn't
> > need
> > anything else. So we probably still need something unfortuantely ...
> > 
> > > 	- In the notifier? What is the notifier is sparsely
> > > populated?
> > > 	  We would be wasting huge amounts of memory. What is the
> > > 	  notifier is configured to span the entire virtual
> > > address
> > > 	  space?
> > 
> > So if we go with the radix idea, we could model the radix to exactly
> > match
> > the gpu pagetables. That's essentially what the core mm does. Then
> > each
> > pagetable at each level has a spinlock for essentially a range lock.
> > notifier seqno would be stored into each pagetable (not the
> > endividual
> > entries, that's probably too much), which should allow us to very
> > effeciently check whether an entire arbitrary va range is still valid
> > on
> > the fault side.
> 
> I still wonder wether this should be owned by the driver, though. And
> if we were optimizing for multiple simultaneous fault processing with a
> small granularity, I would agree, but given that gpu pagefaults are
> considered so slow they should be avoided, I wonder whether xe's
> current approach of a single page-table lock wouldn't suffice, in
> addition to a semi-global seqno?
> 
> For invalidations, I think we actually currently allow simultaneous
> overlapping invalidations that are only protected by the write-side of
> the notifier seqno.

Yeah I think this is just a long-term design point: As long as the
pagetable locking is conceptually a range thing I agree it doesn't matter
what we start out with, as long as it's somewhere on the line between a
global lock and the over-the-top scalable radix tree per-pagetable node
approach core mm has.

> > On the notifier side we can also very efficiently walk arbitrary
> > ranges,
> > because the locking is really fine-grained and in an adaptive way.
> > 
> > > - How does the garbage collector work? We can't allocate memory in
> > > the
> > >   notifier so we don't anything to add to the garbage collector. We
> > >   can't directly modify page tables given you need lock in the path
> > > of
> > >   reclaim.
> > 
> > Probably no more garbage collector, you deal with pages/folios like
> > the
> > core mm expects.
> 
> Yeah, if the page-table locks are reclaim-safe no more garbage
> collector, but OTOH, IIRC even in core-mm, the invalidation
> counterpart, unmap_mapping_range() can't and doesn't remove page-table
> subtrees when called from the address-space side, whereas zapping when
> called from the mm side, like madvise(WONTNEED), can.

Yeah we might need to mark up entirely empty pagetables and pass that up
the radix tree, so that on the next gpu bind we can zap those if needed.
Since we have the pagetables already it should be doable to add them to a
"needs garbage collecting" list of some sorts for entirely empty
pagetables, unlike the garbage collector that tosses out partial ranges
and so needs more stuff.

But also, future problem for post-merge I think.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
