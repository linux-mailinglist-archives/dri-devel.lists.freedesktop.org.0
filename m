Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F36BB965DA5
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 11:57:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF5A10EA3F;
	Fri, 30 Aug 2024 09:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L3bdrtrf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B36010EA3F;
 Fri, 30 Aug 2024 09:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725011858; x=1756547858;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=3FoScc8OqoeYOW5WnvboJtGMgXXsAkOBBADX0G20xWo=;
 b=L3bdrtrfR0gr/61L82faSqV2Hk0UiejRg3FsnwvxnLqAJw5gLjULJdzx
 aNBp0Zcfz4ICLtjx6fP0vuAifaJ2OUgZmfoHt5KsDcoj/JnjzyN8KaO9S
 TGo220tkhoojdkg0jV07uG04WROgZH7CutozxwBRunNBm1Ck/RdFhb52c
 dFWTbRwrScoCOirbDJEIaXzsjS0Iw+Zf0liSEN+gV6uz626vLUpGqn7NU
 Acvqk1MiCvXJ5McdrjHqcJPUdm0eSUurJ9nNnRhtXwdlN2DsOFWbdxhzJ
 VmOtSsv+6csP8AWKLwLR213TR/NS30oZXPly/xfwUuDRc9vVsFkQEATL1 Q==;
X-CSE-ConnectionGUID: F6B+OKceTQancNlvN1NeUw==
X-CSE-MsgGUID: +dNao+MASzOu3AbjZVr+Eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34217007"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="34217007"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 02:57:38 -0700
X-CSE-ConnectionGUID: riEhT/tmSMqvYAqElQR0mg==
X-CSE-MsgGUID: lrc9aPowToq5DTiYI6L4Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="63477655"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 [10.245.245.123]) ([10.245.245.123])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 02:57:36 -0700
Message-ID: <666768946f0d7dbf9373ab6369a4b0c7eefd8e2d.camel@linux.intel.com>
Subject: Re: [RFC PATCH 05/28] drm/gpusvm: Add support for GPU Shared
 Virtual Memory
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 airlied@gmail.com, christian.koenig@amd.com, matthew.auld@intel.com, 
 daniel@ffwll.ch
Date: Fri, 30 Aug 2024 11:57:33 +0200
In-Reply-To: <ZtDgd7bd6RCs2Orl@DUT025-TGLU.fm.intel.com>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-6-matthew.brost@intel.com>
 <d66e492df25e8ec3533575245c10eb7dcca709ca.camel@linux.intel.com>
 <ZtCzo11oKXBeKmWp@DUT025-TGLU.fm.intel.com>
 <b657ceec08091a666bdd907f9171727ef395c093.camel@linux.intel.com>
 <ZtDgd7bd6RCs2Orl@DUT025-TGLU.fm.intel.com>
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

Hi, Matthew,

Agreed the below might not be important just now, but some ideas:

On Thu, 2024-08-29 at 20:56 +0000, Matthew Brost wrote:
> Issues with removing a SVM range:
>=20
> - Xe bind code stores invalidation / present state in VMA, this would
> =C2=A0 need to be moved to the radix tree. I have Jira open for that work
> =C2=A0 which I believe other developers are going to own.

Yeah, although we shouldn't *design* around xe bind-code and page-table
code shortcomings.


> - Where would the dma mapping / device pages be stored?
> 	- In the radix tree? What if ATS is enabled? We don't have a
> 	=C2=A0 driver owned radix tree. How do we reasonably connect a
> driver
> 	=C2=A0 owned radix to a common GPUSVM layer?

With ATS you mean IOMMU SVA, right? I think we could assume that any
user of this code also has a gpu page-table since otherwise they
couldn't be using VRAM and a simpler solution would be in place.=C2=A0

But to that specific question, drm_gpusvm state would live in a
drm_gpusvm radix tree and driver-specific stuff in the driver tree. A
helper based approach would then call drm_gpusvm_unmap_dma(range),
whereas a middle layer would just traverse the tree and unmap.

> 	- In the notifier? What is the notifier is sparsely
> populated?
> 	=C2=A0 We would be wasting huge amounts of memory. What is the
> 	=C2=A0 notifier is configured to span the entire virtual address
> 	=C2=A0 space?

Let's assume you use a fake page-table like in xe_pt_walk.c as your
"radix tree", adapted to relevant page-sizes, sparsity is not a
problem.

> - How does the garbage collector work? We can't allocate memory in
> the
> =C2=A0 notifier so we don't anything to add to the garbage collector. We
> =C2=A0 can't directly modify page tables given you need lock in the path
> of
> =C2=A0 reclaim.

The garbage collector would operate on the whole invalidated range. In
the case of xe, upon zapping under reclaim you mark individual page-
table bos that are to be removed as "invalid", the garbage collector
walks the range removing the "invalid" entries. Subsequent (re-binding)
avoids the "invalid" entries, (perhaps even helps removing them) and
can thus race with the garbage collector. Hence, any ranges implied by
the page-table code are elimitated.

> - How do we deal with fault storms (e.g. tons of faults hitting the
> same
> =C2=A0 SVM range in a row)? Without a SVM range no every to know if
> mapping
> =C2=A0 is valid and GPU page handler can be short circuited.

Perhaps look at page-table tree and check whether the gpu_pte causing
the fault is valid.

> - Do we have notifier seqno for every PTE?

I'd say no. With this approach it makes sense to have a wide notifier.
The seqno now only affects binding of new gpu_ptes, so the problem with
a wide notifier becomes that if invalidation occurs to *any* part of
the notifier while we're in the read section during binding, we need to
rerun the binding. Adding more notifiers to mitigate that would be to
optimize faulting performance over core invalidation performance which
Jason asked us to avoid.

/Thomas



