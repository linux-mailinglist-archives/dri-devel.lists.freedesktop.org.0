Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 200BEA117D1
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 04:33:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 209F210E392;
	Wed, 15 Jan 2025 03:33:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="bERF0PVU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB1CB10E392
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 03:32:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B9CE3A41375;
 Wed, 15 Jan 2025 03:31:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F3E0C4CEDD;
 Wed, 15 Jan 2025 03:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1736911977;
 bh=T4dcbDI/vKyWRblxs1ywFALBVAfQe8tiDcHpfJM6RN8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bERF0PVUQI4js/tXDP63ORxOW/2+/PHDid/ylo91qKh7+q5Ymbi8I0mhhtdg7LF5t
 VeMCK3B4Qbo5Vcxz8SCqqSYPF9HyCZkrSPuC9aAS1GOmYZyxt+TPgnAtPd/sH3rdlV
 KD9hRAbzLTi/y6DF539AQQoK095/jG0bOU+jUq3w=
Date: Tue, 14 Jan 2025 19:32:56 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com, Steve Sistare
 <steven.sistare@oracle.com>, Muchun Song <muchun.song@linux.dev>, David
 Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 1/2] mm/memfd: reserve hugetlb folios before allocation
Message-Id: <20250114193256.c1cdb555ba24afc9790a40c8@linux-foundation.org>
In-Reply-To: <20250114080927.2616684-2-vivek.kasireddy@intel.com>
References: <20250114080927.2616684-1-vivek.kasireddy@intel.com>
 <20250114080927.2616684-2-vivek.kasireddy@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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

On Tue, 14 Jan 2025 00:08:00 -0800 Vivek Kasireddy <vivek.kasireddy@intel.com> wrote:

> There are cases when we try to pin a folio but discover that it has
> not been faulted-in. So, we try to allocate it in memfd_alloc_folio()
> but there is a chance that we might encounter a crash/failure
> (VM_BUG_ON(!h->resv_huge_pages)) if there are no active reservations
> at that instant. This issue was reported by syzbot:
> 
> kernel BUG at mm/hugetlb.c:2403!
>
> ...
> 
> Therefore, to avoid this situation and fix this issue, we just need
> to make a reservation (by calling hugetlb_reserve_pages()) before
> we try to allocate the folio. This will ensure that we are properly
> doing region/subpool accounting associated with our allocation.
> 
> While at it, move subpool_inode() into hugetlb header and also
> replace the VM_BUG_ON() with WARN_ON_ONCE() as there is no need to
> crash the system in this scenario and instead we could just warn
> and fail the allocation.
> 
> ...
>
> @@ -2397,12 +2392,15 @@ struct folio *alloc_hugetlb_folio_reserve(struct hstate *h, int preferred_nid,
>  	struct folio *folio;
>  
>  	spin_lock_irq(&hugetlb_lock);
> +	if (WARN_ON_ONCE(!h->resv_huge_pages)) {
> +		spin_unlock_irq(&hugetlb_lock);
> +		return NULL;
> +	}
> +

What is is that we're warning of here?  Is there any action which
either kernel developers or the user can take to prevent this warning
from being issued?

IOW, maybe the WARN shouldn't be present?
