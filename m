Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7E458337C
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 21:24:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C541C67B7;
	Wed, 27 Jul 2022 19:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 262EFC67B7
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 19:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=8PMF9RAfUsWsnizFrlCJPvao6aXNiFYw1zm8tW5odss=; b=UTld7/z9lGtIVo/RpBaSKOEH8v
 UrD4YlPiJURock7BXSSlf1jzkbcbdGDlsQo4AyRaJMgLpW6dGSkIBjqsPwBYDCX0Jg36XSWyUTnXY
 c3SpqEKj0514G8SqlIZ5BSczg8Rd2SFYdXgyIWdnLQ8lHIDSMFaIw/CKuiqoxIpWX8PIeq+RTSW/z
 qi0bUlwtjysoMUYLMPHCIxbq+JRykUdzQFC08EDFKdMoRYhgcDGBm4AqR715MlPZr84szRGq4nLIB
 OLolH7N0QQzZg9AcV4rJEM1saEU5fDy20jEBISvTwquU5zR45qN6WFTcerdrDiP/HE0W66HM3BYvz
 SyX38R9A==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1oGme6-003AhV-H5; Wed, 27 Jul 2022 19:24:38 +0000
Date: Wed, 27 Jul 2022 20:24:38 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Zack Rusin <zackr@vmware.com>
Subject: Re: [PATCH] mm: Fix a null ptr deref with CONFIG_DEBUG_VM enabled in
 wp_page_reuse
Message-ID: <YuGQ9tJPUcqnqvAV@casper.infradead.org>
References: <20220727191407.1768600-1-zack@kde.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727191407.1768600-1-zack@kde.org>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Jan Kara <jack@suse.cz>,
 David Hildenbrand <david@redhat.com>, NeilBrown <neilb@suse.de>,
 Yang Shi <shy828301@gmail.com>, dri-devel@lists.freedesktop.org,
 Michal Hocko <mhocko@kernel.org>, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, Khalid Aziz <khalid.aziz@oracle.com>,
 Don Dutile <ddutile@redhat.com>, Christoph Hellwig <hch@lst.de>,
 mombasawalam@vmware.com, Andrea Arcangeli <aarcange@redhat.com>,
 Minchan Kim <minchan@kernel.org>, Rik van Riel <riel@surriel.com>,
 Hugh Dickins <hughd@google.com>, Liang Zhang <zhangliang5@huawei.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Jason Gunthorpe <jgg@nvidia.com>,
 David Rientjes <rientjes@google.com>,
 Pedro Demarchi Gomes <pedrodemargomes@gmail.com>, Jann Horn <jannh@google.com>,
 John Hubbard <jhubbard@nvidia.com>, Shakeel Butt <shakeelb@google.com>,
 banackm@vmware.com, Muchun Song <songmuchun@bytedance.com>,
 Peter Xu <peterx@redhat.com>, Suren Baghdasaryan <surenb@google.com>,
 Vlastimil Babka <vbabka@suse.cz>, Hongchen Zhang <zhanghongchen@loongson.cn>,
 Oleg Nesterov <oleg@redhat.com>, krastevm@vmware.com,
 Nadav Amit <namit@vmware.com>, Andrew Morton <akpm@linux-foundation.org>,
 Roman Gushchin <guro@fb.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 27, 2022 at 03:14:07PM -0400, Zack Rusin wrote:
> From: Zack Rusin <zackr@vmware.com>
> 
> Write page faults on last references might not have a valid page anymore.
> wp_page_reuse has always dealt with that scenario by making
> sure the page isn't null (or the reference was shared) before doing
> anything with it. Recently added checks in VM_BUG_ON (enabled by the
> CONFIG_DEBUG_VM option) use PageAnon helpers which assume the passed
> page is never null, before making sure there is a valid page to work
> with.
> 
> Move the VM_BUG_ON, which unconditionally uses the page, after the
> code that checks that we have a valid one.

Message-ID: <CAHk-=wh_TrgNm6vz7=7CgZppr0UrZ9TwLyb3dgPXyG-w=a8kJQ@mail.gmail.com>

