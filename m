Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FD7D223B5
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 04:02:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D071110E6AB;
	Thu, 15 Jan 2026 03:01:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="omuyeZrw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD1310E235;
 Thu, 15 Jan 2026 03:01:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 51D4660140;
 Thu, 15 Jan 2026 03:01:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7A77C4CEF7;
 Thu, 15 Jan 2026 03:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1768446116;
 bh=t62plHsTL0NzPFD3kffjbbJXeKPsO+HXKRB8ZhdlO8k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=omuyeZrwDujiPdNf06U42mHqbJE+T8krxLxsXa0Dh7kwj5wgnsDsccsWbhd7wdXP4
 UC66ZVu6CpbnfNPYvmLzhn5wXv+rRL9cYqbyE5VJMvghF+HKu7COLRojjM/kTPkbVc
 +6YenfbpT4eR4UVzrm/t6nRiEN5v/+/MXNu4aqwo=
Date: Wed, 14 Jan 2026 19:01:54 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Francois Dugast <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Matthew
 Brost <matthew.brost@intel.com>, Zi Yan <ziy@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>, adhavan Srinivasan <maddy@linux.ibm.com>, Nicholas
 Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Felix Kuehling
 <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Hildenbrand <david@kernel.org>,
 Oscar Salvador <osalvador@suse.de>, Jason Gunthorpe <jgg@ziepe.ca>, Leon
 Romanovsky <leon@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Balbir Singh
 <balbirs@nvidia.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-mm@kvack.org,
 linux-cxl@vger.kernel.org
Subject: Re: [PATCH v5 1/5] mm/zone_device: Reinitialize large zone device
 private folios
Message-Id: <20260114190154.c05e460ebf4054828430633f@linux-foundation.org>
In-Reply-To: <20260114192111.1267147-2-francois.dugast@intel.com>
References: <20260114192111.1267147-1-francois.dugast@intel.com>
 <20260114192111.1267147-2-francois.dugast@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On Wed, 14 Jan 2026 20:19:52 +0100 Francois Dugast <francois.dugast@intel.com> wrote:

> From: Matthew Brost <matthew.brost@intel.com>
> 
> Reinitialize metadata for large zone device private folios in
> zone_device_page_init prior to creating a higher-order zone device
> private folio. This step is necessary when the folio’s order changes
> dynamically between zone_device_page_init calls to avoid building a
> corrupt folio. As part of the metadata reinitialization, the dev_pagemap
> must be passed in from the caller because the pgmap stored in the folio
> page may have been overwritten with a compound head.
> 
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -201,7 +201,7 @@ static void drm_pagemap_get_devmem_page(struct page *page,
>  					struct drm_pagemap_zdd *zdd)
>  {
>  	page->zone_device_data = drm_pagemap_zdd_get(zdd);
> -	zone_device_page_init(page, 0);
> +	zone_device_page_init(page, zdd->dpagemap->pagemap, 0);
>  }

drivers/gpu/drm/drm_pagemap.c:200:40: error: 'struct drm_pagemap_zdd' has no member named 'dpagemap'

I guess this was accidentally fixed in a later patch?

Please let's decide whether to fast-track the [1/N] fix into mainline
and if so, prepare something which compiles!
