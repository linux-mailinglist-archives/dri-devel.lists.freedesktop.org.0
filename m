Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B21B18B34A3
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 11:55:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF47610F8EE;
	Fri, 26 Apr 2024 09:55:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YSCZ9lgZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8EDD10F84E;
 Fri, 26 Apr 2024 09:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714125311; x=1745661311;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=OYonUy2ldBnSnFIrfQIW7ggjNImz2WS60L/07uELKXY=;
 b=YSCZ9lgZY3hjLdVFnWjzBwHEPADU1Ia30OmZr8Fe/Z1DCK4/2lQDxdJ+
 iryc9ySFOeZT7Pk+VGdtOUKJuHZiVjpG55uEzvGb2pJ7VVAkQpdGARriV
 sB6H2hLEGlOvD1FFzIue0QAxttcVKJ+gg6dDywnu5kc4bvVimMZFnwmXp
 rDpJBmFAOpElb9+iRwFmkmo5R+O+2cTbiWWgw4ag/FVzZQ6FT9+WI1HKo
 Qjy3TwJiBfbmPcHJaeOGBEzonVD9uo0K7KezbADw9GBh8q4ir8HW1bKHP
 Wc03LKImIdDg51zJgGAMDr/APUl5QLp/CT8XjLk2K+VFbmDUR2st2QUzx w==;
X-CSE-ConnectionGUID: oshDGTmARluspsIGhse0Fw==
X-CSE-MsgGUID: 10iL/9mISTia4TvE+7bV7Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="21274273"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="21274273"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 02:55:10 -0700
X-CSE-ConnectionGUID: Bkkr5bxTSdSI3E/xhcMwtA==
X-CSE-MsgGUID: vaPVBENHQTiOKdsvlbPNsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="25328159"
Received: from acasaesb-mobl.amr.corp.intel.com (HELO [10.249.254.141])
 ([10.249.254.141])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 02:55:07 -0700
Message-ID: <65cb3984309d377d6e7d57cb6567473c8a83ed78.camel@linux.intel.com>
Subject: Re: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table
 from hmm range
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, "Zeng, Oak" <oak.zeng@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>,  "Welty, Brian"
 <brian.welty@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Bommu, Krishnaiah"
 <krishnaiah.bommu@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>, Leon Romanovsky <leon@kernel.org>
Date: Fri, 26 Apr 2024 11:55:05 +0200
In-Reply-To: <20240425010520.GW941030@nvidia.com>
References: <20240405003927.GA11940@nvidia.com>
 <SA1PR11MB6991E4CDCD61A5D1909BB4EF92032@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240405123725.GD5383@nvidia.com>
 <SA1PR11MB699170C0F6FFFA231985718092032@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240405180212.GG5383@nvidia.com>
 <SA1PR11MB6991A4BD0EDDDF051A9A2C5C92072@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240409172418.GA5383@nvidia.com>
 <SA1PR11MB6991EDB4351D99B4E76EBC2992112@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240424134840.GJ941030@nvidia.com>
 <SA1PR11MB699102978E72F21E6C803D6392102@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240425010520.GW941030@nvidia.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
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

Hi, Jason.

I've quickly read through the discussion here and have a couple of
questions and clarifications to hopefully help moving forward on
aligning on an approach for this.

Let's for simplicity initially ignore migration and assume this is on
integrated hardware since it seems like it's around the
hmm_range_fault() usage there is a disconnect.

First, the gpu_vma structure is something that partitions the gpu_vm
that holds gpu-related range metadata, like what to mirror, desired gpu
caching policies etc. These are managed (created, removed and split)
mainly from user-space. These are stored and looked up from an rb-tree.

Each such mirroring gpu_vma holds an mmu_interval notifier.

For invalidation only purposes, the mmu_interval seqno is not tracked.
An invalidation thus only zaps page-table entries, causing subsequent
accesses to fault. Hence for this purpose, having a single notifier
that covers a huge range is desirable and does not become a problem.

Now, when we hit a fault, we want to use hmm_range_fault() to re-
populate the faulting PTE, but also to pre-fault a range. Using a range
here (let's call this a prefault range for clarity) rather than to
insert a single PTE is for multiple reasons:

1) avoid subsequent adjacent faults
2a) Using huge GPU page-table entries.
2b) Updating the GPU page-table (tree-based and multi-level) becomes
more efficient when using a range.

Here, depending on hardware, 2a might be more or less crucial for GPU
performance. 2b somewhat ties into 2a but otherwise does not affect gpu
performance.

This is why we've been using dma_map_sg() for these ranges, since it is
assumed the benefits gained from 2) above by far outweighs any benefit
from finer-granularity dma-mappings on the rarer occasion of faults.
Are there other benefits from single-page dma mappings that you think
we need to consider here?

Second, when pre-faulting a range like this, the mmu interval notifier
seqno comes into play, until the gpu ptes for the prefault range are
safely in place. Now if an invalidation happens in a completely
separate part of the mirror range, it will bump the seqno and force us
to rerun the fault processing unnecessarily. Hence, for this purpose we
ideally just want to get a seqno bump covering the prefault range.
That's why finer-granularity mmu_interval notifiers might be beneficial
(and then cached for future re-use of the same prefault range). This
leads me to the next question:

You mention that mmu_notifiers are expensive to register. From looking
at the code it seems *mmu_interval* notifiers are cheap unless there
are ongoing invalidations in which case using a gpu_vma-wide notifier
would block anyway? Could you clarify a bit more the cost involved
here? If we don't register these smaller-range interval notifiers, do
you think the seqno bumps from unrelated subranges would be a real
problem?

Finally the size of the pre-faulting range is something we need to
tune. Currently it is cpu vma - wide. I understand you strongly suggest
this should be avoided. Could you elaborate a bit on why this is such a
bad choice?

Thanks,
Thomas


