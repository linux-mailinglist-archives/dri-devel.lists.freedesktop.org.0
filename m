Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AC8B2AE6B
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 18:43:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F2910E4A3;
	Mon, 18 Aug 2025 16:42:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c9J0tRLV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7BB10E4A3;
 Mon, 18 Aug 2025 16:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755535375; x=1787071375;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=FFRgUjm1Gro1I+69P/TMbAic2wfSm8DMVKGUgEm0vxw=;
 b=c9J0tRLVf010DXS5RDRVcYlG4pIubfPJ8Mfjede6UEr3PsfDiOqQjorm
 0HSnnaKGcUJETlCuUNPzuLg+GwtKDjONPkxMopfE6frF1qoAyP7lko4z9
 yfuOn3+PiAsm0dDga7uu2t7FQiCbcd/6qbyB7dWHvp0Y8O90TjXsSdkkg
 SyX8ZGpK+f7NnNgk5oll0LjjbTuKGKtHPE1/2PpEm3xU77yFVPnzcP6Sl
 SXi7yuFCvy7pGKgEH6n+9V6f4Dry0j2pxWM0GIsTM0anM+PCRX1fZRAzw
 8wT72JfeI2fDDdvBjI7Fh6P1YSjqWcxnrDErh4pNaG95lxF5WCXfqVdxj Q==;
X-CSE-ConnectionGUID: 95U2SEwIRke+rfNCyaZjhg==
X-CSE-MsgGUID: 5zN2gpUjSWGO0oGw9v/Svw==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57913911"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="57913911"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 09:42:55 -0700
X-CSE-ConnectionGUID: hg58vD3gT1C5B79/FUkiiQ==
X-CSE-MsgGUID: wD+yurJLT02ZIM7X6sfNmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="167863384"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.244.38])
 ([10.245.244.38])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 09:42:52 -0700
Message-ID: <d34ba6c8c68a2fa85f052bdb4d27be15561f4861.camel@linux.intel.com>
Subject: Re: [RFC PATCH 1/6] mm/mmu_notifier: Allow multiple struct
 mmu_interval_notifier passes
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Andrew Morton
 <akpm@linux-foundation.org>,  Simona Vetter <simona.vetter@ffwll.ch>, Dave
 Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, Christian
 =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>
Date: Mon, 18 Aug 2025 18:42:36 +0200
In-Reply-To: <20250818163617.GI599331@ziepe.ca>
References: <20250809135137.259427-1-thomas.hellstrom@linux.intel.com>
 <20250809135137.259427-2-thomas.hellstrom@linux.intel.com>
 <20250818160726.GH599331@ziepe.ca>
 <aKNT8GUu0r3i4Ikq@lstrano-desk.jf.intel.com>
 <20250818163617.GI599331@ziepe.ca>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

On Mon, 2025-08-18 at 13:36 -0300, Jason Gunthorpe wrote:
> On Mon, Aug 18, 2025 at 09:25:20AM -0700, Matthew Brost wrote:
> > I think this choice makes sense: it allows embedding the wait state
> > from
> > the initial notifier call into the pass structure. Patch [6] shows
> > this
> > by attaching the issued TLB invalidation fences to the pass. Since
> > a
> > single notifier may be invoked multiple times with different ranges
> > but
> > the same seqno,
>=20
> That should be explained, but also seems to be a bit of a different
> issue..
>=20
> If the design is really to only have two passes and this linked list
> is about retaining state then there should not be so much freedom to
> have more passes.

Actually the initial suggestion was two passes only. Then I thought I
saw a use-case for even three passes and added the multi-pass thing,
but I think it turned out we didn't have such a use-case. IMO we could
restrict it to two-pass. Matthew, that should be completely OK for the
SVM use-case, right?

/Thomas


>=20
> Jason

