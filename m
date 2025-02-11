Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DBDA30400
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 07:59:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CAB310E222;
	Tue, 11 Feb 2025 06:59:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TZpKpCGN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD77E10E136;
 Tue, 11 Feb 2025 06:59:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1B5DEA40139;
 Tue, 11 Feb 2025 06:57:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25880C4CEDD;
 Tue, 11 Feb 2025 06:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739257162;
 bh=zn03NYUWlorjpWcW8rYMRK7iAV7p3dUDfxQ2kfLiz0c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TZpKpCGN/gwKCjVEwGWTHXWPnF82ODA84GaEvupijIwIXzW3AkFDN/jK0cyFFP+6p
 yblmsX65KhyykSwLqdx/Drtr7JJ51ONxH44nmmp7oyHdC7xwmO0Nnsne4z3T45HYEU
 D/6mhsZvjG2dJSX1W8swu8kYgxTCj98mnJ2m1qmV5tgBPi7aoKNx438wydZBYFFDib
 r1RaoQhdYNB1AgI7qkHrCB24Y4WF29++tUFVl/Qvh6gi6JVnMB8zgn7yBmE+8ujrn4
 ym+s5bKOIAR3BCEpgH002IjRMToHrI8nNch8jwhFvVP4AKL5N8C2on/2w7PO+98ve9
 xi/BqOGhF0a0A==
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
Subject: Re: [PATCH v2 14/17] mm/damon: handle device-exclusive entries
 correctly in damon_folio_young_one()
Date: Mon, 10 Feb 2025 22:59:19 -0800
Message-Id: <20250211065919.5935-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250210193801.781278-15-david@redhat.com>
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

On Mon, 10 Feb 2025 20:37:56 +0100 David Hildenbrand <david@redhat.com> wrote:

> Ever since commit b756a3b5e7ea ("mm: device exclusive memory access")
> we can return with a device-exclusive entry from page_vma_mapped_walk().
> 
> damon_folio_young_one() is not prepared for that, so teach it about these
> PFN swap PTEs. Note that device-private entries are so far not applicable
> on that path, as we expect ZONE_DEVICE pages so far only in migration code
> when it comes to the RMAP.
> 
> The impact is rather small: we'd be calling pte_young() on a
> non-present PTE, which is not really defined to have semantic.
> 
> Note that we could currently only run into this case with
> device-exclusive entries on THPs. We still adjust the mapcount on
> conversion to device-exclusive; this makes the rmap walk
> abort early for small folios, because we'll always have
> !folio_mapped() with a single device-exclusive entry. We'll adjust the
> mapcount logic once all page_vma_mapped_walk() users can properly
> handle device-exclusive entries.
> 
> Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

[...]
