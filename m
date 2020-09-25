Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3030B2788F9
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 15:02:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C656E214;
	Fri, 25 Sep 2020 13:02:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A1EE6E203;
 Fri, 25 Sep 2020 13:02:23 +0000 (UTC)
IronPort-SDR: PKT3SLQO61EqLs8o3z64XjMC9iWk83/WWa8bOVTiO6eOAvTxKkwN1OPZwE70NzIGWsvOWX7u7D
 oy+sxLfKfPjw==
X-IronPort-AV: E=McAfee;i="6000,8403,9754"; a="158862328"
X-IronPort-AV: E=Sophos;i="5.77,302,1596524400"; d="scan'208";a="158862328"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2020 06:02:10 -0700
IronPort-SDR: OZamlwX2zWqLUrbLSEoIsVvtwGhUUsxA4uAx8BG9zebWwmpfo9ZeyTDwYsvjJeAEWzi0tdodhs
 m+aC4Xx9uiAA==
X-IronPort-AV: E=Sophos;i="5.77,302,1596524400"; d="scan'208";a="455821735"
Received: from mlevy2-mobl.ger.corp.intel.com (HELO [10.251.176.131])
 ([10.251.176.131])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2020 06:02:02 -0700
Subject: Re: [PATCH 07/11] drm/i915: stop using kmap in i915_gem_object_map
To: Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>
References: <20200924135853.875294-1-hch@lst.de>
 <20200924135853.875294-8-hch@lst.de>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <8d318fcb-f472-85ed-6639-18f9c45f30e4@linux.intel.com>
Date: Fri, 25 Sep 2020 14:01:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200924135853.875294-8-hch@lst.de>
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Peter Zijlstra <peterz@infradead.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, x86@kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Minchan Kim <minchan@kernel.org>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Nitin Gupta <ngupta@vflare.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 24/09/2020 14:58, Christoph Hellwig wrote:
> kmap for !PageHighmem is just a convoluted way to say page_address,
> and kunmap is a no-op in that case.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_pages.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> index d6eeefab3d018b..6550c0bc824ea2 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> @@ -162,8 +162,6 @@ static void unmap_object(struct drm_i915_gem_object *obj, void *ptr)
>   {
>   	if (is_vmalloc_addr(ptr))
>   		vunmap(ptr);
> -	else
> -		kunmap(kmap_to_page(ptr));
>   }
>   
>   struct sg_table *
> @@ -277,11 +275,10 @@ static void *i915_gem_object_map(struct drm_i915_gem_object *obj,
>   		 * forever.
>   		 *
>   		 * So if the page is beyond the 32b boundary, make an explicit
> -		 * vmap. On 64b, this check will be optimised away as we can
> -		 * directly kmap any page on the system.
> +		 * vmap.
>   		 */
>   		if (!PageHighMem(page))
> -			return kmap(page);
> +			return page_address(page);
>   	}
>   
>   	mem = stack;
> 

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
