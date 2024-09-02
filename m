Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7124968790
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 14:33:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B3F510E2DA;
	Mon,  2 Sep 2024 12:33:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="cti5KQ48";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66CB810E2DA
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 12:33:13 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-42bb7298bdeso46641615e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 05:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1725280392; x=1725885192; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=wW/9NPe0wCKI9QH/gPLOA0sC9Gq4n58Ppr7DKQoFkhI=;
 b=cti5KQ48kpGVsQLvVEhZ7Zt2bhXvYGs4GQ/w9fE2dspDD7sn4Zw6aFmb9tlFZVMc5n
 TujHs+q/QRJQXP8ZM6GmP2wyqTYAywWMmUZvYsDXvNmsDxH5u+CHAcGtEEKUBgMpf4xS
 eJOSP7FkB57F2kQf8fboHvL3aIVYMpJBj3aig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725280392; x=1725885192;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wW/9NPe0wCKI9QH/gPLOA0sC9Gq4n58Ppr7DKQoFkhI=;
 b=NAz6BmNPae/RRhqu8PVzzub8Pwnh4ziDgHekxXgADhKYCftHNLFRksPNOekXoTbJ4T
 0ReaNthIJKMMJ8Tcl05KXHGQTchi0p+NyJpb2+hqWf5hBje+uWZUs/PXnOCHU3wbWQMa
 n9MgGUUTf9JisOFOHMh6O8P0MSdgKeXfRTKwydsT5OPAe1J7Sk/oU802U7ejntRDJbWz
 uUs3mElPCuMpECMq56ZswROXvDEgE1h3aNj3r5yBOeNs+z+i9ltjRO+EPzh/RxF9Hvz2
 Xb6ykJquh7Ox+hzSEw2qpPWjnKQ61P5nuMeHqi1dGIRxNkg73aH0Krod/exNreBS8Yr6
 V4NQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoh14mbazb4fY4TnjLfEbazB3qkGNswuvCg+aPhzYFRlHbJpXxLDeq3Ps/cs/u0tXPcIcQ+wuhMyg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJI/ETnxEXOG+Ciaw5Pv0rn2cr9NJZrtudyTl6vQW3+Rb+Sr3f
 aUm6Fs5fiSzguoT3t95LcIyPv8aQWBGGNQLNZ0bDcytsGe7CLhbQM34KC8wr3fQ=
X-Google-Smtp-Source: AGHT+IFhMI3+K0ot9GPHvGg4UnIy+he1RC85yl4Id26ZlS5NqH3qw40GlRvBpZb/cN8mpaCsM0Xmvw==
X-Received: by 2002:a05:600c:1c0a:b0:428:15b0:c8dd with SMTP id
 5b1f17b1804b1-42bb01c1e95mr138575395e9.20.1725280391485; 
 Mon, 02 Sep 2024 05:33:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6deb3efsm137652655e9.6.2024.09.02.05.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 05:33:10 -0700 (PDT)
Date: Mon, 2 Sep 2024 14:33:08 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, christian.koenig@amd.com, matthew.auld@intel.com,
 daniel@ffwll.ch
Subject: Re: [RFC PATCH 05/28] drm/gpusvm: Add support for GPU Shared Virtual
 Memory
Message-ID: <ZtWwhM5rJDVVFbVf@phenom.ffwll.local>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-6-matthew.brost@intel.com>
 <d66e492df25e8ec3533575245c10eb7dcca709ca.camel@linux.intel.com>
 <ZtCzo11oKXBeKmWp@DUT025-TGLU.fm.intel.com>
 <b657ceec08091a666bdd907f9171727ef395c093.camel@linux.intel.com>
 <ZtDgd7bd6RCs2Orl@DUT025-TGLU.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZtDgd7bd6RCs2Orl@DUT025-TGLU.fm.intel.com>
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

Jumping in here in the middle, since I think it's a solid place to drop my
idea of "align with core mm" gpusvm locking ...

On Thu, Aug 29, 2024 at 08:56:23PM +0000, Matthew Brost wrote:
> On Thu, Aug 29, 2024 at 09:18:29PM +0200, Thomas Hellström wrote:
> Issues with removing a SVM range:
> 
> - Xe bind code stores invalidation / present state in VMA, this would
>   need to be moved to the radix tree. I have Jira open for that work
>   which I believe other developers are going to own.
> - Where would the dma mapping / device pages be stored?
> 	- In the radix tree? What if ATS is enabled? We don't have a
> 	  driver owned radix tree. How do we reasonably connect a driver
> 	  owned radix to a common GPUSVM layer?

Yeah this one is really annoying, because the core mm gets away with
nothing because it can just store the pfn in the pte. And it doesn't need
anything else. So we probably still need something unfortuantely ...

> 	- In the notifier? What is the notifier is sparsely populated?
> 	  We would be wasting huge amounts of memory. What is the
> 	  notifier is configured to span the entire virtual address
> 	  space?

So if we go with the radix idea, we could model the radix to exactly match
the gpu pagetables. That's essentially what the core mm does. Then each
pagetable at each level has a spinlock for essentially a range lock.
notifier seqno would be stored into each pagetable (not the endividual
entries, that's probably too much), which should allow us to very
effeciently check whether an entire arbitrary va range is still valid on
the fault side.

On the notifier side we can also very efficiently walk arbitrary ranges,
because the locking is really fine-grained and in an adaptive way.

> - How does the garbage collector work? We can't allocate memory in the
>   notifier so we don't anything to add to the garbage collector. We
>   can't directly modify page tables given you need lock in the path of
>   reclaim.

Probably no more garbage collector, you deal with pages/folios like the
core mm expects.

> - How do we deal with fault storms (e.g. tons of faults hitting the same
>   SVM range in a row)? Without a SVM range no every to know if mapping
>   is valid and GPU page handler can be short circuited.

So the core mm sorts this out by allowing faults to be handled in
parallel, without any lock. Essentially:
- you get a fault (or prefault)
- you hold just enough read locks to make sure stuff doesn't disappear.
  Currently that's mmap_read_lock, but strictly speaking we only need the
  new-ish per-vma lock.
- you allocate memory, dma_map, everything else you need
- you grab that very fine-grained radix tree lock (pagetable locks on the
  cpu side) and recheck whether you've raced: mmu notifier seqno and the
  pte must still be non-present. If that check fails, you bail out and
  release all the vram/dma_maps you've created.

> - Do we have notifier seqno for every PTE?

I think per-pagetable, so every node in the radix tree, would make sense.
If we go with also one lock per pagetable like the cpu mm then tracking
notifier seqno to match makes the most sense imo.

Again, this is entirely aside from the discussion in this subthread about
understanding the current design and tradeoffs/reasons. Just figured this
is a good spot to drop this.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
