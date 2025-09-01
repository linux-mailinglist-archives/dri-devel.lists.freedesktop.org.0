Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A1AB3E75B
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 16:38:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F2A510E47D;
	Mon,  1 Sep 2025 14:38:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eCZ+BQTO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7666510E488;
 Mon,  1 Sep 2025 14:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756737485; x=1788273485;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=WQNkr5EKb/5FuHLMhuxLTbLlrHHNbuV0X7itYDSvCTo=;
 b=eCZ+BQTOUSC/kJi0jsd7bYPMunbDOHsDP6dsNf8GlmOR2QKudkQhTJFm
 s9iZ58hYyRtq/fQnbZmtWtnthMIHxb9A9lhc0js8G5TrVa5JO2aA7l0e3
 72llqFuofPrBte8U760YyGwue7p34WIjItPxo9//Gwyp8sKioZqiMzzhO
 3zvUAUru5aw4vKlAfSmWCAnBGhoSml9dc3zxjmKN6sERV8uw3VTxVfF48
 +Z1E2ZpHqBkMd2F5oOJoF/oOvf0epI1ymQkryRHTZiW7Y4jgIu6gG5eYk
 FJvd8IFXBOeGJPzgAPnT2I/jnBSDchVFPreb1udGF/Nxp9VepCLJqFYA6 A==;
X-CSE-ConnectionGUID: k3WvXTtST1yN6VhtV6fPWw==
X-CSE-MsgGUID: GHv8v361Tn6XiCjINQKrMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="76595901"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="76595901"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 07:38:04 -0700
X-CSE-ConnectionGUID: FKyLHvmdRWK5frmJXgJzRQ==
X-CSE-MsgGUID: TmZPTmE/S+a9W82GyBX+0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="170590896"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.244.171])
 ([10.245.244.171])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 07:37:56 -0700
Message-ID: <3713e6d83421fcf64978927a1cb40fae1e3c7a57.camel@linux.intel.com>
Subject: Re: [RFC 0/3] cgroups: Add support for pinned device memory
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Natalie Vock <natalie.vock@gmx.de>, Maarten Lankhorst
 <dev@lankhorst.se>,  Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo
 Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,  Simona
 Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>, Tejun Heo
 <tj@kernel.org>, Johannes Weiner	 <hannes@cmpxchg.org>, 'Michal
 =?ISO-8859-1?Q?Koutn=FD=27?= <mkoutny@suse.com>,  Michal Hocko
 <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, Shakeel
 Butt	 <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, Andrew
 Morton	 <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "'Liam R . Howlett'"
 <Liam.Howlett@oracle.com>,  Vlastimil Babka	 <vbabka@suse.cz>, Mike
 Rapoport <rppt@kernel.org>, Suren Baghdasaryan	 <surenb@google.com>, Thomas
 Zimmermann <tzimmermann@suse.de>
Cc: Michal Hocko <mhocko@suse.com>, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 cgroups@vger.kernel.org, linux-mm@kvack.org
Date: Mon, 01 Sep 2025 16:37:51 +0200
In-Reply-To: <25b42c8e-7233-4121-b253-e044e022b327@gmx.de>
References: <20250819114932.597600-5-dev@lankhorst.se>
 <25b42c8e-7233-4121-b253-e044e022b327@gmx.de>
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

On Mon, 2025-09-01 at 14:45 +0200, Natalie Vock wrote:
> Hi,
>=20
> On 8/19/25 13:49, Maarten Lankhorst wrote:
> > When exporting dma-bufs to other devices, even when it is allowed
> > to use
> > move_notify in some drivers, performance will degrade severely when
> > eviction happens.
> >=20
> > A perticular example where this can happen is in a multi-card
> > setup,
> > where PCI-E peer-to-peer is used to prevent using access to system
> > memory.
> >=20
> > If the buffer is evicted to system memory, not only the evicting
> > GPU wher
> > the buffer resided is affected, but it will also stall the GPU that
> > is
> > waiting on the buffer.
> >=20
> > It also makes sense for long running jobs not to be preempted by
> > having
> > its buffers evicted, so it will make sense to have the ability to
> > pin
> > from system memory too.
> >=20
> > This is dependant on patches by Dave Airlie, so it's not part of
> > this
> > series yet. But I'm planning on extending pinning to the memory
> > cgroup
> > controller in the future to handle this case.
> >=20
> > Implementation details:
> >=20
> > For each cgroup up until the root cgroup, the 'min' limit is
> > checked
> > against currently effectively pinned value. If the value will go
> > above
> > 'min', the pinning attempt is rejected.
>=20
> Why do you want to reject pins in this case? What happens in desktop=20
> usecases (e.g. PRIME buffer sharing)? AFAIU, you kind of need to be
> able=20
> to pin buffers and export them to other devices for that whole thing
> to=20
> work, right? If the user doesn't explicitly set a min value, wouldn't
> the value being zero mean any pins will be rejected (and thus PRIME=20
> would break)?

That's really the point. If an unprivileged malicious process is
allowed to pin arbitrary amounts of memory, thats a DOS vector.

However drivers that allow unlimited pinning today need to take care
when implementing restrictions to avoid regressions. Like perhaps
adding this behind a config option.

That said, IMO dma-buf clients should implement move_notify() whenever
possible to provide an option to avoid pinning unless necessary.

/Thomas



>=20
> If your objective is to prevent pinned buffers from being evicted,=20
> perhaps you could instead make TTM try to avoid evicting pinned
> buffers=20
> and prefer unpinned buffers as long as there are unpinned buffers to=20
> evict? As long as the total amount of pinned memory stays below min,
> no=20
> pinned buffers should get evicted with that either.


>=20
> Best,
> Natalie
>=20
> >=20
> > Pinned memory is handled slightly different and affects calculating
> > effective min/low values. Pinned memory is subtracted from both,
> > and needs to be added afterwards when calculating.
> >=20
> > This is because increasing the amount of pinned memory, the amount
> > of
> > free min/low memory decreases for all cgroups that are part of the
> > hierarchy.
> >=20
> > Maarten Lankhorst (3):
> > =C2=A0=C2=A0 page_counter: Allow for pinning some amount of memory
> > =C2=A0=C2=A0 cgroup/dmem: Implement pinning device memory
> > =C2=A0=C2=A0 drm/xe: Add DRM_XE_GEM_CREATE_FLAG_PINNED flag and
> > implementation
> >=20
> > =C2=A0 drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 66 ++=
+++++++++++++++++++-
> > =C2=A0 drivers/gpu/drm/xe/xe_dma_buf.c | 10 +++-
> > =C2=A0 include/linux/cgroup_dmem.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +
> > =C2=A0 include/linux/page_counter.h=C2=A0=C2=A0=C2=A0 |=C2=A0 8 +++
> > =C2=A0 include/uapi/drm/xe_drm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
10 +++-
> > =C2=A0 kernel/cgroup/dmem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 57 ++++++++++++++++++-
> > =C2=A0 mm/page_counter.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 98
> > ++++++++++++++++++++++++++++++---
> > =C2=A0 7 files changed, 237 insertions(+), 14 deletions(-)
> >=20
>=20

