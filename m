Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B147B3EDC4
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 20:22:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E963010E178;
	Mon,  1 Sep 2025 18:22:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CRU8Ijgg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D78FF10E178;
 Mon,  1 Sep 2025 18:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756750923; x=1788286923;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=d3BjrklD0G2phAKakK8SAVU5KohAaT/0bo4d3rBYrZ4=;
 b=CRU8Ijgg3NbM1Xn7Hjx2CYJG3ca8wsYe1aNNuH3hieDMVxKy1MI90100
 26xRx8HgcBaj/pXFtVQ5kx/ejw6gGM3L9s5ojc+CytXt4Z32INRulPCV6
 6saoIWzJLER7NFV1bOscZ3LuH4/7QwLDlcuO2MBId0y7coXZqZ1QvKZiu
 E6/swKwMEo4q7EGDvf+hbgVickKEI3cqc0jAR8ELI+cYouSAfacoy0p76
 YeletfhIuKKuTrq0FAh09zFF3+wUng+o8Ig2lqia9DTgKwyl+mY9A9L82
 Z+qd+SnIxTLHY+pN2aubmF87IZBBAhMGG2ntMJYtQJ3hhXoC2P5zEuIGA g==;
X-CSE-ConnectionGUID: kkX+IBgfRwy2qDLSrY+MWw==
X-CSE-MsgGUID: jiGj6vmkTQapP7nw6Bnc5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62846693"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62846693"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 11:22:03 -0700
X-CSE-ConnectionGUID: l3vRZl7yRLa9+4KiPRrykA==
X-CSE-MsgGUID: VSICzs7zTJiLad48qf7TGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="170350870"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.244.171])
 ([10.245.244.171])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 11:21:55 -0700
Message-ID: <b6b13ad22345bcdf43325173052614c17e803d00.camel@linux.intel.com>
Subject: Re: [RFC 0/3] cgroups: Add support for pinned device memory
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>, David Hildenbrand
 <david@redhat.com>,  Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo
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
Date: Mon, 01 Sep 2025 20:21:49 +0200
In-Reply-To: <9c296c72-768e-4893-a099-a2882027f2b9@lankhorst.se>
References: <20250819114932.597600-5-dev@lankhorst.se>
 <dc21e54c-d7ae-4d7e-9acb-6a3fa573b20f@redhat.com>
 <9c296c72-768e-4893-a099-a2882027f2b9@lankhorst.se>
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

Hi,

On Mon, 2025-09-01 at 20:16 +0200, Maarten Lankhorst wrote:
> Hello David,
>=20
> Den 2025-09-01 kl. 14:25, skrev David Hildenbrand:
> > On 19.08.25 13:49, Maarten Lankhorst wrote:
> > > When exporting dma-bufs to other devices, even when it is allowed
> > > to use
> > > move_notify in some drivers, performance will degrade severely
> > > when
> > > eviction happens.
> > >=20
> > > A perticular example where this can happen is in a multi-card
> > > setup,
> > > where PCI-E peer-to-peer is used to prevent using access to
> > > system memory.
> > >=20
> > > If the buffer is evicted to system memory, not only the evicting
> > > GPU wher
> > > the buffer resided is affected, but it will also stall the GPU
> > > that is
> > > waiting on the buffer.
> > >=20
> > > It also makes sense for long running jobs not to be preempted by
> > > having
> > > its buffers evicted, so it will make sense to have the ability to
> > > pin
> > > from system memory too.
> > >=20
> > > This is dependant on patches by Dave Airlie, so it's not part of
> > > this
> > > series yet. But I'm planning on extending pinning to the memory
> > > cgroup
> > > controller in the future to handle this case.
> > >=20
> > > Implementation details:
> > >=20
> > > For each cgroup up until the root cgroup, the 'min' limit is
> > > checked
> > > against currently effectively pinned value. If the value will go
> > > above
> > > 'min', the pinning attempt is rejected.
> > >=20
> > > Pinned memory is handled slightly different and affects
> > > calculating
> > > effective min/low values. Pinned memory is subtracted from both,
> > > and needs to be added afterwards when calculating.
> >=20
> > The term "pinning" is overloaded, and frequently we refer to
> > pin_user_pages() and friends.
> >=20
> > So I'm wondering if there is an alternative term to describe what
> > you want to achieve.
> >=20
> > Is it something like "unevictable" ?
> It could be required to include a call pin_user_pages(), in case a
> process wants to pin=20
> from a user's address space to the gpu.
>=20
> It's not done yet, but it wouldn't surprise me if we want to include
> it in the future.
> Functionally it's similar to mlock() and related functions.
>=20
> Perhaps call it mlocked instead?

I was under the impression that mlocked() memory can be migrated to
other physical memory but not to swap? whereas pinned memory needs to
remain the exact same physical memory.

IMO "pinned" is pretty established within GPU drivers (dma-buf, TTM)
and essentially means the same as "pin" in "pin_user_pages", so
inventing a new name would probably cause even more confusion?

Thanks,
Thomas




>=20
> Kind regards,
> ~Maarten Lankhorst

