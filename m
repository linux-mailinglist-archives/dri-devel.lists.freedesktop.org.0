Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6DA5E6BDF
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 21:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FDF610E08A;
	Thu, 22 Sep 2022 19:40:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC7E10E062
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 19:40:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 585666115C;
 Thu, 22 Sep 2022 19:40:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45829C433C1;
 Thu, 22 Sep 2022 19:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663875641;
 bh=Iu+ioVZAl++oTxE1oI47t/6oQuwifWn8lmpY1yCr8J4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YC8ixN8EP0aZI0e+nDZs91siEij37VrKEmFWG3Ty2t8usgwjVxksauo5Og7qifkq5
 ESf2BqmXtU9USNgh+H2YKJEXRWpyu7EDcgicu3AJOn2B/4WayyL94dp8xbokjZvmw2
 M56qmrIx+uvo2sUUrQmzfQ5/ucT/pOiWMPHGNcLJ6IIzRCYzVRcutddcWgSvzdbhZM
 fcZkJSFboZpZl7fu6RLNBgaLlv3gbFkR4ETLqK750bOZ4J5pst6/eAIZH31PhhVZLn
 QMHkEcQOXS8pXwYt/LtILex4KMGS/VXDhD7XC9erQbOO/ciNySxRd4PP7XyTR4i5Zs
 1sdrT7lGqR5Mw==
Date: Thu, 22 Sep 2022 12:40:39 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 02/12] skbuff: Proactively round up to kmalloc bucket size
Message-ID: <20220922124039.688be0b8@kernel.org>
In-Reply-To: <20220922031013.2150682-3-keescook@chromium.org>
References: <20220922031013.2150682-1-keescook@chromium.org>
 <20220922031013.2150682-3-keescook@chromium.org>
MIME-Version: 1.0
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
Cc: linux-wireless@vger.kernel.org, Jacob Shin <jacob.shin@amd.com>,
 llvm@lists.linux.dev, dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, linux-hardening@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, dev@openvswitch.org, x86@kernel.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 intel-wired-lan@lists.osuosl.org, David Rientjes <rientjes@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Yonghong Song <yhs@fb.com>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Marco Elver <elver@google.com>, Josef Bacik <josef@toxicpanda.com>,
 linaro-mm-sig@lists.linaro.org, David Sterba <dsterba@suse.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, Vlastimil Babka <vbabka@suse.cz>,
 Alex Elder <elder@kernel.org>, netdev@vger.kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Pekka Enberg <penberg@kernel.org>,
 Daniel Micay <danielmicay@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 21 Sep 2022 20:10:03 -0700 Kees Cook wrote:
> diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> index 974bbbbe7138..4fe4c7544c1d 100644
> --- a/net/core/skbuff.c
> +++ b/net/core/skbuff.c
> @@ -427,14 +427,15 @@ struct sk_buff *__alloc_skb(unsigned int size, gfp_t gfp_mask,
>  	 */
>  	size = SKB_DATA_ALIGN(size);
>  	size += SKB_DATA_ALIGN(sizeof(struct skb_shared_info));
> -	data = kmalloc_reserve(size, gfp_mask, node, &pfmemalloc);
> -	if (unlikely(!data))
> -		goto nodata;
> -	/* kmalloc(size) might give us more room than requested.
> +	/* kmalloc(size) might give us more room than requested, so
> +	 * allocate the true bucket size up front.
>  	 * Put skb_shared_info exactly at the end of allocated zone,
>  	 * to allow max possible filling before reallocation.
>  	 */
> -	osize = ksize(data);
> +	osize = kmalloc_size_roundup(size);
> +	data = kmalloc_reserve(osize, gfp_mask, node, &pfmemalloc);
> +	if (unlikely(!data))
> +		goto nodata;
>  	size = SKB_WITH_OVERHEAD(osize);
>  	prefetchw(data + size);

I'd rename osize here to alloc_size for consistency but one could 
argue either way :)

Acked-by: Jakub Kicinski <kuba@kernel.org>
