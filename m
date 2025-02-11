Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 140D2A30409
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 08:00:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D3EA10E427;
	Tue, 11 Feb 2025 07:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GI2gfjNc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B50310E424;
 Tue, 11 Feb 2025 07:00:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 549FA5C141C;
 Tue, 11 Feb 2025 06:59:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E770C4CEDD;
 Tue, 11 Feb 2025 07:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739257205;
 bh=2Of0rA5FoGn4ZTHvRWUGZwrrx3D8metj3Q4juNaw1eM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GI2gfjNcDnwg7GzDatzEEZWfdJYDwAQFrC79MEvER1PMZLr7IEBISVpIOBY+WVS/O
 Gv8Lp5iEfvSod7fn0czmeJmEGHThHHxD6wpiXBFV1nkPXHa9njgo6XN2sS6Rx4U67S
 sK63mMvK5ma/GUUgHThjzPIYwzhBUYy6KcmWJ2zWLBgCMb0O+5DZpMFv0OzEoV4Kmt
 B5434/VJqwbdrTCswBVUb0QbiYOXhnKk4JdWUR5CiSq6lfFLOFAyW6GydavzlbWW19
 6gVh1UsyCquTPBGSNfLBRtN9/TduDjrWCgMDEVYeiuiF24cPFXuKgba7glsc/7wRYn
 KUj/R737RmeTQ==
From: SeongJae Park <sj@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: SeongJae Park <sj@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, damon@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 15/17] mm/damon: handle device-exclusive entries
 correctly in damon_folio_mkold_one()
Date: Mon, 10 Feb 2025 23:00:02 -0800
Message-Id: <20250211070002.6005-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250210193801.781278-16-david@redhat.com>
References: 
MIME-Version: 1.0
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

On Mon, 10 Feb 2025 20:37:57 +0100 David Hildenbrand <david@redhat.com> wrote:

> Ever since commit b756a3b5e7ea ("mm: device exclusive memory access")
> we can return with a device-exclusive entry from page_vma_mapped_walk().
> 
> damon_folio_mkold_one() is not prepared for that and calls
> damon_ptep_mkold() with PFN swap PTEs. Teach damon_ptep_mkold() to deal
> with these PFN swap PTEs. Note that device-private entries are so far not
> applicable on that path, as damon_get_folio() filters out non-lru
> folios.
> 
> Should we just skip PFN swap PTEs completely? Possible, but it seems
> straight forward to just handle it correctly.
> 
> Note that we could currently only run into this case with
> device-exclusive entries on THPs. We still adjust the mapcount on
> conversion to device-exclusive; this makes the rmap walk
> abort early for small folios, because we'll always have
> !folio_mapped() with a single device-exclusive entry. We'll adjust the
> mapcount logic once all page_vma_mapped_walk() users can properly
> handle device-exclusive entries.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

[...]
