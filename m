Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F51A7BA38
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 11:49:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1747810EB9D;
	Fri,  4 Apr 2025 09:49:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="Fmnwubo2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 597 seconds by postgrey-1.36 at gabe;
 Fri, 04 Apr 2025 09:49:24 UTC
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com
 [91.218.175.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C2710EB9D
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 09:49:23 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1743759557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HvCbJgJnFGne+TAMBgY6cQ6iJ4WbAlnhHeP54hSBG3U=;
 b=Fmnwubo2TjnwNa23ZsXq1DE1aQDCxDMZQTSrFaDHVwxBUA4J7T93QPMm4Mpo25S6FDBWbe
 hXnzoy6iMBRZc/lE9/ZTBBkQdIyDbrfWZG45bfRlKvTTSNLK55OyHl+b9lko2taHXfZnfn
 MDBdQ6PxRyGu3r5IhprHpajQ+cgmImM=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP is broken, was Re: [RFC
 PATCH 0/6] Deep talk about folio vmap
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20250404090111.GB11105@lst.de>
Date: Fri, 4 Apr 2025 17:38:35 +0800
Cc: Huan Yang <link@vivo.com>, bingbu.cao@linux.intel.com,
 Matthew Wilcox <willy@infradead.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 opensource.kernel@vivo.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <9A899641-BDED-4773-B349-56AF1DD58B21@linux.dev>
References: <20250327092922.536-1-link@vivo.com>
 <20250404090111.GB11105@lst.de>
To: Christoph Hellwig <hch@lst.de>
X-Migadu-Flow: FLOW_OUT
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



> On Apr 4, 2025, at 17:01, Christoph Hellwig <hch@lst.de> wrote:
>=20
> After the btrfs compressed bio discussion I think the hugetlb changes =
that
> skip the tail pages are fundamentally unsafe in the current kernel.
>=20
> That is because the bio_vec representation assumes tail pages do =
exist, so
> as soon as you are doing direct I/O that generates a bvec starting =
beyond
> the present head page things will blow up.  Other users of bio_vecs =
might
> do the same, but the way the block bio_vecs are generated are very =
suspect
> to that.  So we'll first need to sort that out and a few other things
> before we can even think of enabling such a feature.
>=20

I would like to express my gratitude to Christoph for including me in =
the
thread. I have carefully read the cover letter in [1], which indicates
that an issue has arisen due to the improper use of `vmap_pfn()`. I'm
wondering if we could consider using `vmap()` instead. In the HVO =
scenario,
the tail struct pages do **exist**, but they are read-only. I've =
examined
the code of `vmap()`, and it appears that it only reads the struct page.
Therefore, it seems feasible for us to use `vmap()` (I am not a expert =
in
udmabuf.). Right?

[1] =
https://lore.kernel.org/linux-mm/20250327092922.536-1-link@vivo.com/T/#m05=
5b34978cf882fd44d2d08d929b50292d8502b4

Thanks,
Muchun.

