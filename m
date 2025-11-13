Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BB5C5A782
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 00:08:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDDD910E959;
	Thu, 13 Nov 2025 23:08:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="2V0F07x9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 858BB10E959
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 23:08:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BEF2E44138;
 Thu, 13 Nov 2025 23:08:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8BBCC4CEF7;
 Thu, 13 Nov 2025 23:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1763075292;
 bh=2wvqa/HMit8pu0w6FTlokZJLz41y4povJ4/y0QBe68k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=2V0F07x99YAiF85Sx7V1XWStJGYjslzh/mevzVy07rE/VuwVdP2ufpoJPqaCRs6Bk
 EN1xQs77scGH//E4rc4vilieGQQUwW44aylFuMIPg20ze2nBtAe21fLQKQpDoPL5Sh
 JXD/31O+MxpDt1neiBxsZiTtccuDP2TnCwhvKE60=
Date: Thu, 13 Nov 2025 15:08:11 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Balbir Singh <balbirs@nvidia.com>
Cc: "David Hildenbrand (Red Hat)" <david@kernel.org>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org, Zi Yan
 <ziy@nvidia.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim
 <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price
 <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair
 Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>, Baolin
 Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>, Ryan Roberts
 <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song
 <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>, Danilo Krummrich
 <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>, Mika
 =?ISO-8859-1?Q?Penttil=E4?= <mpenttil@redhat.com>, Matthew Brost
 <matthew.brost@intel.com>, Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH] mm/huge_memory: fix override of entry in
 remove_migration_pmd
Message-Id: <20251113150811.081a6dbdcca8b5c474d6e399@linux-foundation.org>
In-Reply-To: <5092cfb0-ad25-40ff-9a07-3de86d37665f@nvidia.com>
References: <20251113051352.1753714-1-balbirs@nvidia.com>
 <ed523668-92a3-4eaa-a999-4fb7a43e197d@lucifer.local>
 <dd1da795-d37a-47d2-87f5-50853ba43519@kernel.org>
 <5092cfb0-ad25-40ff-9a07-3de86d37665f@nvidia.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 14 Nov 2025 07:55:29 +1100 Balbir Singh <balbirs@nvidia.com> wrote:

> >> THe logic LGTM but we don't want to have a bisect hazard here by having the bug
> >> introduced earlier then resolved here.
> > 
> > Exactly.
> > 
> 
> The hazard is a VM_WARN_ON() that checks for is_migration_entry() in the
> call to softleaf_is_migration_young(). I am happy to go down that path,
> let me send out the fixups, it felt weird to break the rebase, but I
> am sure Andrew has a better way of dealing with this stuff.

Yes, please tell us which patch introduced the issue then send a fix
for that patch.  We can figure out the softleaf changes later.  (Which
this patch provides anyway).

Also, confusing that the changelog says "The softleaf changes exposed a
BUG in remove_rmap_pmd()" but it's remove_migration_pmd() that gets
altered.  Please expand and clarify?
