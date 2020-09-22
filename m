Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9BB273D38
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 10:24:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C896E072;
	Tue, 22 Sep 2020 08:24:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9378B6E072;
 Tue, 22 Sep 2020 08:24:08 +0000 (UTC)
IronPort-SDR: Glbrks/XNEQSc8Xa+PyEAtJDg8/l1R4qZ32Wn25QHKnosXE8o4PzbDRqbEZNYjnEzosciu6ogX
 IMBnqWSkjGTA==
X-IronPort-AV: E=McAfee;i="6000,8403,9751"; a="157936728"
X-IronPort-AV: E=Sophos;i="5.77,290,1596524400"; d="scan'208";a="157936728"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2020 01:24:08 -0700
IronPort-SDR: hYPYeshgQ9gLbxA+nGdC2UUT7a+sUMfvmmOdnILx1oZilih/OM+HLuWniJZ+KnDxCiUxxvah+K
 LMJGx+/weQGQ==
X-IronPort-AV: E=Sophos;i="5.77,290,1596524400"; d="scan'208";a="454404248"
Received: from atroib-mobl2.ger.corp.intel.com (HELO [10.214.238.184])
 ([10.214.238.184])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2020 01:24:02 -0700
Subject: Re: [Intel-gfx] [PATCH 3/6] drm/i915: use vmap in shmem_pin_map
To: Christoph Hellwig <hch@lst.de>, Matthew Wilcox <willy@infradead.org>
References: <20200918163724.2511-1-hch@lst.de>
 <20200918163724.2511-4-hch@lst.de>
 <20200921191157.GX32101@casper.infradead.org> <20200922062249.GA30831@lst.de>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <43d10588-2033-038b-14e4-9f41cd622d7b@linux.intel.com>
Date: Tue, 22 Sep 2020 09:23:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200922062249.GA30831@lst.de>
Content-Language: en-US
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Minchan Kim <minchan@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, intel-gfx@lists.freedesktop.org,
 x86@kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, linux-mm@kvack.org,
 Matthew Auld <matthew.auld@intel.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, Nitin Gupta <ngupta@vflare.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 22/09/2020 07:22, Christoph Hellwig wrote:
> On Mon, Sep 21, 2020 at 08:11:57PM +0100, Matthew Wilcox wrote:
>> This is awkward.  I'd like it if we had a vfree() variant which called
>> put_page() instead of __free_pages().  I'd like it even more if we
>> used release_pages() instead of our own loop that called put_page().
> 
> Note that we don't need a new vfree variant, we can do this manually if
> we want, take a look at kernel/dma/remap.c.  But I thought this code
> intentionally doesn't want to do that to avoid locking in the memory
> for the pages array.  Maybe the i915 maintainers can clarify.

+ Chris & Matt who were involved with this part of i915.

If I understood this sub-thread correctly, iterating and freeing the 
pages via the vmapped ptes, so no need for a
shmem_read_mapping_page_gfp loop in shmem_unpin_map looks plausible to me.

I did not get the reference to kernel/dma/remap.c though, and also not 
sure how to do the error unwind path in shmem_pin_map at which point the 
allocated vm area hasn't been fully populated yet. Hand-roll the loop 
walking vm area struct in there?

Regards,

Tvrtko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
