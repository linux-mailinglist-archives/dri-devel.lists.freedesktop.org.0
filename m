Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B367C4CF6
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 10:22:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C666610E4BB;
	Wed, 11 Oct 2023 08:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D96610E4BB;
 Wed, 11 Oct 2023 08:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697012547; x=1728548547;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=rop2SO3ybzEk4DVuIiU1MtKYn2SMe0Tm8G/1drFuF44=;
 b=RjwKArkKyoJataX/EgLYTvxKNkeUV1+J/hMRIYPKflfIEtVokXqLfPix
 eAfaD/SIxUE6z6xk1jfH9RgKaFEQQkMFu/IRsVjwY52PM31H9R8Ms5M9W
 AwGBeo626AOSUHd1hS18FuBNH4mXNuUPo069nK96OIN4APf6DPayKrkzT
 9stAlks8olT47OE3LYn7jQmcUInO2mgfeoTCbpRRsrh4+1gYkRVKnw9EA
 Yf5L9Iy+NmlDHc0T2AKSw1P4EMldSLEN4c2JBT03qqhwAHjoTAhYPbjtD
 SsLjxN0YQs6sAleHE4X/slBw02JLXRKEv6/s18WdlUB1nuk2L2U+Ti4mX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="448810102"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="448810102"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 01:22:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="877580799"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="877580799"
Received: from clanggaa-mobl.ger.corp.intel.com (HELO [10.249.254.169])
 ([10.249.254.169])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 01:22:22 -0700
Message-ID: <925e4c2d15161ce8115409b6af97dab9a2996bf7.camel@linux.intel.com>
Subject: Re: [PATCH drm-misc-next 2/3] drm/gpuva_mgr: generalize
 dma_resv/extobj handling and GEM validation
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?=
 "(Intel)" <thomas_os@shipmail.org>
Date: Wed, 11 Oct 2023 10:22:20 +0200
In-Reply-To: <CAPM=9tz3o-m+8VJJ6hxWhykat0kpp1UE7dBJE3X91aHHo1Y2VA@mail.gmail.com>
References: <20230820215320.4187-1-dakr@redhat.com>
 <20230820215320.4187-3-dakr@redhat.com>
 <0c50ff22-0f11-1e27-c32e-694ce2b1e6c5@shipmail.org>
 <ZO864yp3UyVEfEjz@pollux>
 <88c45fe6-0942-707c-9ea7-8486c177fcd7@shipmail.org>
 <ZO9Zq2RhbX8EeHrn@pollux>
 <736b6b6d-9e04-a27d-7d60-0c45d696b304@shipmail.org>
 <ZPB26A0/oLHTmyqk@cassiopeiae>
 <a8f28d62-daec-927a-a33d-5be3eec6a1ed@shipmail.org>
 <ZPDk/lao1JlBNGoJ@cassiopeiae>
 <8a8253ae-0b85-df90-b480-64eeebfafc6d@shipmail.org>
 <CAPM=9tz3o-m+8VJJ6hxWhykat0kpp1UE7dBJE3X91aHHo1Y2VA@mail.gmail.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
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
Cc: matthew.brost@intel.com, sarah.walker@imgtec.com,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Liam.Howlett@oracle.com,
 boris.brezillon@collabora.com, Danilo Krummrich <dakr@redhat.com>,
 donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2023-10-11 at 06:23 +1000, Dave Airlie wrote:
> > I think we're then optimizing for different scenarios. Our compute
> > driver will use mostly external objects only, and if shared, I
> > don't
> > forsee them bound to many VMs. What saves us currently here is that
> > in
> > compute mode we only really traverse the extobj list after a
> > preempt
> > fence wait, or when a vm is using a new context for the first time.
> > So
> > vm's extobj list is pretty large. Each bo's vma list will typically
> > be
> > pretty small.
>=20
> Can I ask why we are optimising for this userspace, this seems
> incredibly broken.

First Judging from the discussion with Christian this is not really
uncommon. There *are* ways that we can play tricks in KMD of assorted
cleverness to reduce the extobj list size, but doing that in KMD that
wouldn't be much different than accepting a large extobj list size and
do what we can to reduce overhead of iterating over it.

Second the discussion here really was about whether we should be using
a lower level lock to allow for async state updates, with a rather
complex mechanism with weak reference counting and a requirement to
drop the locks within the loop to avoid locking inversion. If that were
a simplification with little or no overhead all fine, but IMO it's not
a simplification?

>=20
> We've has this sort of problem in the past with Intel letting the
> tail
> wag the horse, does anyone remember optimising relocations for a
> userspace that didn't actually need to use relocations?

>=20
> We need to ask why this userspace is doing this, can we get some
> pointers to it? compute driver should have no reason to use mostly
> external objects, the OpenCL and level0 APIs should be good enough to
> figure this out.

TBH for the compute UMD case, I'd be prepared to drop the *performance*
argument of fine-grained locking the extobj list since it's really only
traversed on new contexts and preemption. But as Christian mentions
there might be other cases. We should perhaps figure those out and
document?

/Thoams


>=20
> Dave.

