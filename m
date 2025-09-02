Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB72B40468
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 15:42:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD5E510E71A;
	Tue,  2 Sep 2025 13:42:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QUdYcK/Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42FE810E71A;
 Tue,  2 Sep 2025 13:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756820554; x=1788356554;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=dlnqyeR+5I6qruWbk7IABHALhsF2hRcTjNBGT4VTdMM=;
 b=QUdYcK/YrpNQOnVw39W2K7jmXNErLNpHswsELTQ72xy+/YV401ecO171
 TKeZmee+qiR+AH7z+wsHIQWwmOEl/r9dMS+eCtCl141hn6utweURdL+G/
 EWQYPN1wzsa0dg+aSBZLxiQ7xY2e9NhsQv9TJx28ghLgpoOquzAEChWHt
 3viDrVMjipN8pBrU2p252/qwDvtK1n1PHJGI6iMbEE90OKHh0Cv2ci3UL
 C6A/wcin+hMR8r9KZGga1i7PQMX3B6wi2U4H3yF8O4tCajD61qECUdbjr
 qC+2HLaLR1g87io7ymv2U2SZYFY8c/8lPLgwMRfC6EzKhr6jiTL0GbXja w==;
X-CSE-ConnectionGUID: I80nBvZFSNaeyHx3Kd4nOQ==
X-CSE-MsgGUID: l9a59a40Tiq8PLirg8M9eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="58951222"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="58951222"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 06:42:33 -0700
X-CSE-ConnectionGUID: 87TOoN+JSuyyXu64BJLX8Q==
X-CSE-MsgGUID: XyDjfStqRz6SEEHMNLLv9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="171175094"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.245.33])
 ([10.245.245.33])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 06:42:26 -0700
Message-ID: <da5885a94d89a2c0dece04e09182e832e8e40410.camel@linux.intel.com>
Subject: Re: [RFC 0/3] cgroups: Add support for pinned device memory
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: David Hildenbrand <david@redhat.com>, Maarten Lankhorst
 <dev@lankhorst.se>,  Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo
 Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,  Simona
 Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>, Natalie Vock
 <natalie.vock@gmx.de>,  Tejun Heo <tj@kernel.org>, Johannes Weiner
 <hannes@cmpxchg.org>, 'Michal =?ISO-8859-1?Q?Koutn=FD=27?=	
 <mkoutny@suse.com>, Michal Hocko <mhocko@kernel.org>, Roman Gushchin	
 <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Muchun
 Song	 <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "'Liam R . Howlett'"
 <Liam.Howlett@oracle.com>,  Vlastimil Babka	 <vbabka@suse.cz>, Mike
 Rapoport <rppt@kernel.org>, Suren Baghdasaryan	 <surenb@google.com>, Thomas
 Zimmermann <tzimmermann@suse.de>
Cc: Michal Hocko <mhocko@suse.com>, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 cgroups@vger.kernel.org, linux-mm@kvack.org
Date: Tue, 02 Sep 2025 15:42:20 +0200
In-Reply-To: <776629b2-5459-4fa0-803e-23d4824e7b24@redhat.com>
References: <20250819114932.597600-5-dev@lankhorst.se>
 <dc21e54c-d7ae-4d7e-9acb-6a3fa573b20f@redhat.com>
 <9c296c72-768e-4893-a099-a2882027f2b9@lankhorst.se>
 <b6b13ad22345bcdf43325173052614c17e803d00.camel@linux.intel.com>
 <776629b2-5459-4fa0-803e-23d4824e7b24@redhat.com>
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

On Mon, 2025-09-01 at 20:38 +0200, David Hildenbrand wrote:
> On 01.09.25 20:21, Thomas Hellstr=C3=B6m wrote:
> > Hi,
> >=20
> > On Mon, 2025-09-01 at 20:16 +0200, Maarten Lankhorst wrote:
> > > Hello David,
> > >=20
> > > Den 2025-09-01 kl. 14:25, skrev David Hildenbrand:
> > > > On 19.08.25 13:49, Maarten Lankhorst wrote:
> > > > > When exporting dma-bufs to other devices, even when it is
> > > > > allowed
> > > > > to use
> > > > > move_notify in some drivers, performance will degrade
> > > > > severely
> > > > > when
> > > > > eviction happens.
> > > > >=20
> > > > > A perticular example where this can happen is in a multi-card
> > > > > setup,
> > > > > where PCI-E peer-to-peer is used to prevent using access to
> > > > > system memory.
> > > > >=20
> > > > > If the buffer is evicted to system memory, not only the
> > > > > evicting
> > > > > GPU wher
> > > > > the buffer resided is affected, but it will also stall the
> > > > > GPU
> > > > > that is
> > > > > waiting on the buffer.
> > > > >=20
> > > > > It also makes sense for long running jobs not to be preempted
> > > > > by
> > > > > having
> > > > > its buffers evicted, so it will make sense to have the
> > > > > ability to
> > > > > pin
> > > > > from system memory too.
> > > > >=20
> > > > > This is dependant on patches by Dave Airlie, so it's not part
> > > > > of
> > > > > this
> > > > > series yet. But I'm planning on extending pinning to the
> > > > > memory
> > > > > cgroup
> > > > > controller in the future to handle this case.
> > > > >=20
> > > > > Implementation details:
> > > > >=20
> > > > > For each cgroup up until the root cgroup, the 'min' limit is
> > > > > checked
> > > > > against currently effectively pinned value. If the value will
> > > > > go
> > > > > above
> > > > > 'min', the pinning attempt is rejected.
> > > > >=20
> > > > > Pinned memory is handled slightly different and affects
> > > > > calculating
> > > > > effective min/low values. Pinned memory is subtracted from
> > > > > both,
> > > > > and needs to be added afterwards when calculating.
> > > >=20
> > > > The term "pinning" is overloaded, and frequently we refer to
> > > > pin_user_pages() and friends.
> > > >=20
> > > > So I'm wondering if there is an alternative term to describe
> > > > what
> > > > you want to achieve.
> > > >=20
> > > > Is it something like "unevictable" ?
> > > It could be required to include a call pin_user_pages(), in case
> > > a
>=20
> We'll only care about long-term pinnings (i.e., FOLL_LONGTERM).
> Ordinary=20
> short-term pinning is just fine.
>=20
> (see how even "pinning" is overloaded? :) )
>=20
> > > process wants to pin
> > > from a user's address space to the gpu.
> > >=20
> > > It's not done yet, but it wouldn't surprise me if we want to
> > > include
> > > it in the future.
> > > Functionally it's similar to mlock() and related functions.
>=20
> Traditionally, vfio, io_uring and rdma do exactly that: they use GUP
> to=20
> longterm pin and then account that memory towards RLIMIT_MEMLOCK.
>=20
> If you grep for "rlimit(RLIMIT_MEMLOCK)", you'll see what I mean.
>=20
> There are known issues with that: imagine long-term pinning the same=20
> folio through GUP with 2 interfaces (e.g., vfio, io_uring, rdma), or=20
> within the same interface.
>=20
> You'd account the memory multiple times, which is horrible. And so
> far=20
> there is no easy way out.
>=20
> > >=20
> > > Perhaps call it mlocked instead?
> >=20
> > I was under the impression that mlocked() memory can be migrated to
> > other physical memory but not to swap? whereas pinned memory needs
> > to
> > remain the exact same physical memory.
>=20
> Yes, exactly.
>=20
> >=20
> > IMO "pinned" is pretty established within GPU drivers (dma-buf,
> > TTM)
> > and essentially means the same as "pin" in "pin_user_pages", so
> > inventing a new name would probably cause even more confusion?
>=20
> If it's the same thing, absolutely. But Marteen said "It's not done
> yet,=20
> but it wouldn't surprise me if we want to include it in the future".
>=20
> So how is the memory we are talking about in this series "pinned" ?

Reading the cover-letter from Maarten, he only talks about pinning
affecting performance, which would be similar to user-space calling
mlock(), although I doubt that moving content to other physical pages
within the same memory type will be a near-term use-case.

However what's more important are situation where a device (like RDMA)
needs to pin, because it can't handle the case where access is
interrupted and content transferred to another physical location.

Perhaps Maarten could you elaborate whether this series is intended for
both these use-cases?

/Thomas



>=20
>=20

