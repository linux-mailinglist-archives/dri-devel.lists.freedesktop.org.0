Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8AE392124
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 21:50:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 460696EC52;
	Wed, 26 May 2021 19:50:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C406EC52
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 19:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622058609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s1/6uItuxoYyE47GHbWu3zlHXfIxxg+Z3u434C7Z3XM=;
 b=an7oAYoyjJ8QtC6JdXQuL3f8TWz2oeZubWMnF3vqsQqqp0cvXVaj8J+jvNoIPdhdmibArq
 Ry9tfnq7tyArefIUepaIX8HA0lAyU7oWEq6GcJ8pJcLTvgXpgSktqD+h6MrGcPSeMqqwk9
 xPsK3mDNg3hKbMxHKMLTc7b7C37YARI=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-wsUIBu6zMUKVo5SnxZyu7w-1; Wed, 26 May 2021 15:50:08 -0400
X-MC-Unique: wsUIBu6zMUKVo5SnxZyu7w-1
Received: by mail-qv1-f71.google.com with SMTP id
 b5-20020a0cc9850000b02901eece87073bso2089849qvk.21
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 12:50:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=s1/6uItuxoYyE47GHbWu3zlHXfIxxg+Z3u434C7Z3XM=;
 b=Ntu1eK+o+sTUqRnBU0yFesMhR4x5YRwtizqPJ3eP7n2UNE+4DPNGICWBKvLligRKV9
 ITDMOM4Uf4D7IEZyBf8B6oOdXzOGmZr8jXkvXyi5lIDXQuniE1YMZdWTePAccj3tRb/8
 qN8Dd29hV2zftrk1CImVuDPrJjnVVZFtzdhbbehN49vuJBzTVPGskUKhBvz8ta9MFXHX
 H+Sl1IknRCuI+JGxqWTLNmMiXWSlYdYBNxFSIavHu+gCKyZnJWlD2goGi+ChPQJ8+wM/
 kX1kqedxum6BbB+8wzstGcIBwwQ22MX/GmuZz/UFkBtAXxIxqnZWuiCer8Xw8QzwkZuE
 +32w==
X-Gm-Message-State: AOAM530pwelLpR9w0bLXmbJ2E8U8BONec4ZlXxK0y8dhS5pcGewCPi4N
 Xg1z2YsfJXzVvGSsYyT3/h+y6vx19fdOO1bkzsmIi6rkpFIctlXcY5Ly0PHZlSW1jshP95BYeri
 skyIlZvTxhzZUNXXx6ODcbqtUiPat
X-Received: by 2002:a37:7046:: with SMTP id l67mr43118535qkc.69.1622058607644; 
 Wed, 26 May 2021 12:50:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDF9KrF9YeP9fDUebqEr4gYyhgflPp+V4B+WrCnnvB/WRyfJdS1hsUee111LHB9PSeDuPW8w==
X-Received: by 2002:a37:7046:: with SMTP id l67mr43118500qkc.69.1622058607342; 
 Wed, 26 May 2021 12:50:07 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca.
 [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id g18sm2200678qke.37.2021.05.26.12.50.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 12:50:06 -0700 (PDT)
Date: Wed, 26 May 2021 15:50:05 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v9 06/10] mm/memory.c: Allow different return codes for
 copy_nonpresent_pte()
Message-ID: <YK6mbf967dV0ljHn@t490s>
References: <20210524132725.12697-1-apopple@nvidia.com>
 <20210524132725.12697-7-apopple@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20210524132725.12697-7-apopple@nvidia.com>
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
 nouveau@lists.freedesktop.org, bsingharora@gmail.com, hughd@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hch@infradead.org, linux-mm@kvack.org, jglisse@redhat.com, bskeggs@redhat.com,
 jgg@nvidia.com, jhubbard@nvidia.com, akpm@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 24, 2021 at 11:27:21PM +1000, Alistair Popple wrote:
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
> v9:
> 
> New for v9 to allow device exclusive handling to occur in
> copy_nonpresent_pte().
> ---
>  mm/memory.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index 2fb455c365c2..e061cfa18c11 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -718,7 +718,7 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
>  
>  	if (likely(!non_swap_entry(entry))) {
>  		if (swap_duplicate(entry) < 0)
> -			return entry.val;
> +			return -EAGAIN;
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
> +			if (ret == -EAGAIN) {
> +				entry = pte_to_swp_entry(*src_pte);
>  				break;
> +			}
>  			progress += 8;
>  			continue;
>  		}

Note that -EAGAIN was previously used by copy_present_page() for early cow
use.  Here later although we check entry.val first:

	if (entry.val) {
		if (add_swap_count_continuation(entry, GFP_KERNEL) < 0) {
			ret = -ENOMEM;
			goto out;
		}
		entry.val = 0;
	} else if (ret) {
		WARN_ON_ONCE(ret != -EAGAIN);
		prealloc = page_copy_prealloc(src_mm, src_vma, addr);
		if (!prealloc)
			return -ENOMEM;
		/* We've captured and resolved the error. Reset, try again. */
		ret = 0;
	}

We didn't reset "ret" in entry.val case (maybe we should?). Then in the next
round of "goto again" if "ret" is unluckily untouched, it could reach the 2nd
if check, and I think it could cause an unexpected page_copy_prealloc().

-- 
Peter Xu

