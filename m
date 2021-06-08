Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 270A839FA35
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 17:19:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA626EA74;
	Tue,  8 Jun 2021 15:19:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B246EA74
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 15:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623165585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dBLB4c6IVQivL3hkpAXNnbCJj11WTQNnSoK9+kBvh3Q=;
 b=THmGp8DQfuAspg7tyOXUhTM6qqqD+FSpIsCNnJkBRratxAwmqnbizMDJXW/mkusZyUTI+0
 Ito9fI/tVktpqrgBYefh6SrpUU0lxhGTRwViS8HiDaR+tijkBu/b+R43dKnAZlm+m/X5km
 BMjTkwz+FW4/KG6sje9twdIwM6qtFEk=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-aqQzs8tGPhOibpKav-YuKA-1; Tue, 08 Jun 2021 11:19:44 -0400
X-MC-Unique: aqQzs8tGPhOibpKav-YuKA-1
Received: by mail-qv1-f71.google.com with SMTP id
 br4-20020ad446a40000b029021addf7b587so15706708qvb.10
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 08:19:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dBLB4c6IVQivL3hkpAXNnbCJj11WTQNnSoK9+kBvh3Q=;
 b=qrtMOo/BR5zhs/CbEUEukvQx87cygTaGcNpk7fGzMqpxxsADL5dOmxQFvCELTlz+PJ
 Y8e8CV1sjxqgaJyQvQ4w+Bb+ilCfO4U48iA+4sXVvNnYNDmhNEqfShyBX9jS4R1GSOkM
 vteQPrSir+gD0Jo1pHFXhhqwW/jIJUcLjAtrS4jnsnwduKret/yPmMS+kjIKk67vgPTf
 PZBmVUAMyBtDzBraL1HYoLr2Pn7xbHJcC+On6zyUcAAOatoTeFO9Z7AuxRTUlpDzHzOg
 gQCCFgKYL4elcMxXruBrXUc0IdC+EciUqoFcn5ZmLv6rlKPjvds/s0K0Huj34HzDPpne
 N+rw==
X-Gm-Message-State: AOAM532xM+L1iRygSsvwz/mFZgnj0wm9I65lDJt43nvbBlRHBf4Drlni
 hQKf/dpdXEk/uaMPzPBfMxkqRYIQd+oXqFXXMF0lKVkolHS13eynOrFDDu8JNsfRYuNtrwhg8ac
 obmH2CR47fBbmXVs9ozdvNwHI9z3T
X-Received: by 2002:a37:62d6:: with SMTP id
 w205mr15381167qkb.194.1623165584115; 
 Tue, 08 Jun 2021 08:19:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9tQ2FgzwPiUwvaf6IEdO0u/PAmzdBq3+c1YQavhbNJmHVlWELWivs0V26IRzx6TXY9Z2KvQ==
X-Received: by 2002:a37:62d6:: with SMTP id
 w205mr15381138qkb.194.1623165583888; 
 Tue, 08 Jun 2021 08:19:43 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-88-174-93-75-200.dsl.bell.ca.
 [174.93.75.200])
 by smtp.gmail.com with ESMTPSA id z127sm600836qkb.98.2021.06.08.08.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 08:19:43 -0700 (PDT)
Date: Tue, 8 Jun 2021 11:19:41 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v10 06/10] mm/memory.c: Allow different return codes for
 copy_nonpresent_pte()
Message-ID: <YL+KjaB4fCt/xodJ@t490s>
References: <20210607075855.5084-1-apopple@nvidia.com>
 <20210607075855.5084-7-apopple@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20210607075855.5084-7-apopple@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, hughd@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, linux-mm@kvack.org,
 shakeelb@google.com, bskeggs@redhat.com, jgg@nvidia.com, jhubbard@nvidia.com,
 akpm@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 07, 2021 at 05:58:51PM +1000, Alistair Popple wrote:
> Currently if copy_nonpresent_pte() returns a non-zero value it is
> assumed to be a swap entry which requires further processing outside the
> loop in copy_pte_range() after dropping locks. This prevents other
> values being returned to signal conditions such as failure which a
> subsequent change requires.
> 
> Instead make copy_nonpresent_pte() return an error code if further
> processing is required and read the value for the swap entry in the main
> loop under the ptl.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> 
> ---
> 
> v10:
> 
> Use a unique error code and only check return codes for handling.
> 
> v9:
> 
> New for v9 to allow device exclusive handling to occur in
> copy_nonpresent_pte().
> ---
>  mm/memory.c | 26 ++++++++++++++++----------
>  1 file changed, 16 insertions(+), 10 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index 2fb455c365c2..0982cab37ecb 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -718,7 +718,7 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
>  
>  	if (likely(!non_swap_entry(entry))) {
>  		if (swap_duplicate(entry) < 0)
> -			return entry.val;
> +			return -EIO;
>  
>  		/* make sure dst_mm is on swapoff's mmlist. */
>  		if (unlikely(list_empty(&dst_mm->mmlist))) {
> @@ -974,11 +974,13 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
>  			continue;
>  		}
>  		if (unlikely(!pte_present(*src_pte))) {
> -			entry.val = copy_nonpresent_pte(dst_mm, src_mm,
> -							dst_pte, src_pte,
> -							src_vma, addr, rss);
> -			if (entry.val)
> +			ret = copy_nonpresent_pte(dst_mm, src_mm,
> +						dst_pte, src_pte,
> +						src_vma, addr, rss);
> +			if (ret == -EIO) {
> +				entry = pte_to_swp_entry(*src_pte);
>  				break;
> +			}
>  			progress += 8;
>  			continue;
>  		}
> @@ -1011,20 +1013,24 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
>  	pte_unmap_unlock(orig_dst_pte, dst_ptl);
>  	cond_resched();
>  
> -	if (entry.val) {
> +	if (ret == -EIO) {
> +		VM_WARN_ON_ONCE(!entry.val);
>  		if (add_swap_count_continuation(entry, GFP_KERNEL) < 0) {
>  			ret = -ENOMEM;
>  			goto out;
>  		}
>  		entry.val = 0;
> -	} else if (ret) {
> -		WARN_ON_ONCE(ret != -EAGAIN);
> +	} else if (ret ==  -EAGAIN) {
                          ^
                          |----------------------------- one more space here

>  		prealloc = page_copy_prealloc(src_mm, src_vma, addr);
>  		if (!prealloc)
>  			return -ENOMEM;
> -		/* We've captured and resolved the error. Reset, try again. */
> -		ret = 0;
> +	} else if (ret) {
> +		VM_WARN_ON_ONCE(1);
>  	}
> +
> +	/* We've captured and resolved the error. Reset, try again. */

Maybe better as:

      /*
       * We've resolved all error even if there is, reset error code and try
       * again if necessary.
       */

as it also covers the no-error path.  But I guess not a big deal..

Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks,

> +	ret = 0;
> +
>  	if (addr != end)
>  		goto again;
>  out:
> -- 
> 2.20.1
> 

-- 
Peter Xu

