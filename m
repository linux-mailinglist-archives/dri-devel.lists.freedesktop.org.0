Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDD654B1FD
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 15:07:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0706910F98B;
	Tue, 14 Jun 2022 13:07:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 980E110F8E0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 13:07:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 709AF6157F;
 Tue, 14 Jun 2022 13:07:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C7C9C3411B;
 Tue, 14 Jun 2022 13:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655212063;
 bh=o1i62i9cvcd6zXd6+ZKu0naAcMPa5eKgxWy6B4lu02k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Z6k5BnOssL4pis2anV8YUt2r+AigMLzMiGGeo8b0AO4vBL++oEct0NLuPZ+1a2iMQ
 BBGEW0gyIhOOL0uOIZpP/uVB3H5Y1mUc7eyJ8IM/m595KBHkXljkhh6wVfmyXxJI2g
 B3HzNNV/zhDSGx64Qvb9tueKXZjTRpmtPekoPuVPZAsqI7RZqPin6vUfIzxXWXiXIa
 Q2n3EHCpVlHUG53+vmZ/e2Nor4OQYyUAu5kgQSRmxetAN7hkF69bONJdq8YmBAbG5b
 6x4EUcWgCE0OQz1dYfjBy+JnCCSW14dMHcL8WLon0U+SMpBvZxbgCjNgTOB07k38Wj
 Fbtx97cgz9LNw==
Message-ID: <5f295a8f-058a-97d1-d9e0-095fdb5e5a7c@kernel.org>
Date: Tue, 14 Jun 2022 15:07:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/3] mm/page_alloc: use might_alloc()
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>
References: <20220605152539.3196045-1-daniel.vetter@ffwll.ch>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <20220605152539.3196045-1-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=UTF-8
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/5/22 17:25, Daniel Vetter wrote:
> ... instead of open codding it. Completely equivalent code, just
> a notch more meaningful when reading.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-mm@kvack.org

Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

> ---
>  mm/page_alloc.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 2db95780e003..277774d170cb 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -5177,10 +5177,7 @@ static inline bool prepare_alloc_pages(gfp_t gfp_mask, unsigned int order,
>  			*alloc_flags |= ALLOC_CPUSET;
>  	}
>  
> -	fs_reclaim_acquire(gfp_mask);
> -	fs_reclaim_release(gfp_mask);
> -
> -	might_sleep_if(gfp_mask & __GFP_DIRECT_RECLAIM);
> +	might_alloc(gfp_mask);
>  
>  	if (should_fail_alloc_page(gfp_mask, order))
>  		return false;

