Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88423B4A578
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 10:36:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD4810E656;
	Tue,  9 Sep 2025 08:36:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hu0RD9RR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E90F10E656;
 Tue,  9 Sep 2025 08:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757406998; x=1788942998;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=+fwcdzStCS5EtceGYH+/EDS7ZgvaO2gNnutcc4716kI=;
 b=Hu0RD9RRNBljHc8h25CfEu6vmZfsZRN446DnpO/jX/KhFQq7gxX5oWD0
 ET6lyYZCIbtaKSLnnP+qVdBuZdwLP6yT8fir1wX6/Jw3YBjzEv8nPpG4z
 TB4wgbyOX6FKWPb6TF/r6qPSpAulR2xMqpLMEC67aqIC661EyOm/fi1Yp
 EMyFKTK+RruGoiNNYqZSBrf8el0rrdIxe2QvbsB/HXGyk4j+ffSIynxV8
 RtJDElemskfHWMBI/O+DuuoYz682zs++t7Loo8sogEVt5y7mxGKDBskFW
 nNoHEh7ILhnePAsPAhjxaZ9mP4WpUP/yIBxrpPCGGhD1x35h1TU6/LnXy w==;
X-CSE-ConnectionGUID: rEjI6+5ARqaBeNXDpQjDtw==
X-CSE-MsgGUID: w2RAH4uMS12VCdivAPzV6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="58722233"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="58722233"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 01:36:38 -0700
X-CSE-ConnectionGUID: 05NPcpJ8QLCnoK4cZ+yNCQ==
X-CSE-MsgGUID: jKx5s8P5Ssyavh8hu06rZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="172291697"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.244.108])
 ([10.245.244.108])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 01:36:35 -0700
Message-ID: <f5e4507c679e5777964df4e41e9aaf06ea514c7a.camel@linux.intel.com>
Subject: Re: Switching over to GEM refcounts and a bunch of cleanups
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 matthew.brost@intel.com, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Date: Tue, 09 Sep 2025 10:36:34 +0200
In-Reply-To: <3913518c-af11-49a8-989a-4468493d075b@amd.com>
References: <20250716160555.20217-1-christian.koenig@amd.com>
 <c5830530bafa9806b9e1b0604d87f7907f651c82.camel@linux.intel.com>
 <5a9c2c36-d1b2-4871-b84a-7372aa547399@amd.com>
 <1f13c0b6-fdbb-4364-a32e-4344f8526464@amd.com>
 <fd34b897a3223346518d3fe009772996eb25c90b.camel@linux.intel.com>
 <d3f60146-39d3-458f-8271-cfcec1c92254@amd.com>
 <c14a919a352742d6344f34455de6aa1e535ecc70.camel@linux.intel.com>
 <c14bb417-276c-471b-9737-0f814af69d06@amd.com>
 <108ed59e07faaaa78167045670cea803d58f7127.camel@linux.intel.com>
 <3913518c-af11-49a8-989a-4468493d075b@amd.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
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

On Tue, 2025-09-09 at 10:13 +0200, Christian K=C3=B6nig wrote:
> On 09.09.25 09:21, Thomas Hellstr=C3=B6m wrote:
> > > > So what do you think about starting out with a fence, and if /
> > > > when
> > > > that appears not to be sufficient, we have a backup plan to
> > > > move to
> > > > a
> > > > struct completion?
> > >=20
> > > Well we need to start somewhere, so grabbing an unsignaled
> > > dma_fence
> > > reference sounds like the best plan for now.
> >=20
> > True. A good starting point. Although I have a feeling it will turn
> > out
> > to be not fully sufficient.
>=20
> Had another sleepiness night because of pain in my joints, but that
> got me another idea how to solve this.
>=20
> What if the first thread who sees the BO with the zero refcount does
> the zombiefication?
>=20
> In other words we grab the LRU lock and try to grab a reference to
> the BO, if that works we do our current handling.
>=20
> If grabbing the BO reference doesn't work we individualize the
> dma_resv and turn the BO into a zombie by adjusting the object funcs,
> init the reference count to 1 again and eventually schedule the
> cleanup worker (e.g. mostly everything currently done in
> ttm_bo_release()).
>=20
> As far as I can see that should work, only problem might be that we
> need to turn the LRU lock into a mutex to be able to alloc memory and
> sleep.

Yes that would probably work. It mighte become a little complex,
though, and we'd still have to deal with the unorthodox practice of
resurrecting a refcount.

Turning the LRU lock into a mutex is probably OK as well.

Another solution in the other direction is if we allow dma-buf
unmapping under a separate lock without holding the dma-resv, with
associated slight locking complications.

Thanks,
Thomas




>=20
> Regards,
> Christian.
>=20
>=20

