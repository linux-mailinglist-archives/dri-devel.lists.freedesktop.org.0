Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD6754B1FF
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 15:08:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FEB810F51E;
	Tue, 14 Jun 2022 13:08:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F2110E866
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 13:08:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A253BB81865;
 Tue, 14 Jun 2022 13:08:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2081EC3411B;
 Tue, 14 Jun 2022 13:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655212117;
 bh=EZWyEzJis+wg+PHTrtf74/eJzbtQm0oSGOp6nBki/Rk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AHrZD7735QNaoCMuug4m4qn9KDEQV0TbICVBpz+nqBEOQCVpQ60kgseLGx6wx4DyY
 A/CS2P/thli6EBiDkEiUayVVmhgyskPzplaDm2HqJeYNnEsxvwoMRRHT7cco34hTvi
 ca4wyxORjxPgD44fL2mBeCA+aOSR2lPKCXDade6oMAyCZSyhDnw19SDWPGttx5R1R9
 pr3Srk7PmSU9/NFBH3BypFwJL0zPQWXY1N3+Vq5MezkjHRpUyE4iq5F5WJ0GQKrvLW
 kJl7EWKB2wL18RUY22AXcOYO1hYsQWoa8stdoUgeVt/lS8ibbeKs3mo4BcaUJrHXqr
 6YIuDW6u3H10Q==
Message-ID: <bdcb78c1-eeda-d9e2-90fc-527bda8dd28c@kernel.org>
Date: Tue, 14 Jun 2022 15:08:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/3] mm/mempool: use might_alloc()
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>
References: <20220605152539.3196045-1-daniel.vetter@ffwll.ch>
 <20220605152539.3196045-3-daniel.vetter@ffwll.ch>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <20220605152539.3196045-3-daniel.vetter@ffwll.ch>
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
> mempool are generally used for GFP_NOIO, so this wont benefit all that
> much because might_alloc currently only checks GFP_NOFS. But it does
> validate against mmu notifier pte zapping, some might catch some
> drivers doing really silly things, plus it's a bit more meaningful in
> what we're checking for here.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-mm@kvack.org

Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

> ---
>  mm/mempool.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/mempool.c b/mm/mempool.c
> index b933d0fc21b8..96488b13a1ef 100644
> --- a/mm/mempool.c
> +++ b/mm/mempool.c
> @@ -379,7 +379,7 @@ void *mempool_alloc(mempool_t *pool, gfp_t gfp_mask)
>  	gfp_t gfp_temp;
>  
>  	VM_WARN_ON_ONCE(gfp_mask & __GFP_ZERO);
> -	might_sleep_if(gfp_mask & __GFP_DIRECT_RECLAIM);
> +	might_alloc(gfp_mask);
>  
>  	gfp_mask |= __GFP_NOMEMALLOC;	/* don't allocate emergency reserves */
>  	gfp_mask |= __GFP_NORETRY;	/* don't loop in __alloc_pages */

