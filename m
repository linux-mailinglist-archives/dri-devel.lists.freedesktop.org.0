Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 668143DAB80
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 20:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DDD16EE28;
	Thu, 29 Jul 2021 18:58:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC106EE28
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 18:58:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D1F9600D4;
 Thu, 29 Jul 2021 18:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627585135;
 bh=NY+6KsF6TgwvjW8V2qdlD2zqaxdlHCFW8WbLHI1uw44=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QwbKTXNKGQlFHhv+nWwVAGS0y7dhrRo4QVZVXmOtNRN5nEqtsizCnwgYVL71jdemC
 NN4LRUz2GWMm7y5nxjYEDLhzAkGKRRgwxxSk0RtIMXokH62NJ6mpGF6A4PMG9LR/dk
 TFkkqH24xr7RZti78Lg43eSuDbQW/o4UTfuxqASt48qIZ7hGRVSrrGAHfGoGqApQr4
 fe/qqMg9s0eu93lcxSA+fP7WwiK2Zm7316Nw0lTenmESdj7Qq2k4auX+VlqVjOzIyH
 tJgu8hsfbG/DoN1PkOib/PnMN36fOPMKqtasZoBoWlwaNtiGVNPNof0RnW7kK1gS1x
 /NEEryLj0coQw==
Date: Thu, 29 Jul 2021 11:58:50 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 54/64] ipv6: Use struct_group() to zero rt6_info
Message-ID: <20210729115850.7f913c73@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210727205855.411487-55-keescook@chromium.org>
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-55-keescook@chromium.org>
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
Cc: linux-kbuild@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-block@vger.kernel.org, clang-built-linux@googlegroups.com,
 Keith Packard <keithpac@amazon.com>, linux-hardening@vger.kernel.org,
 netdev@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 27 Jul 2021 13:58:45 -0700 Kees Cook wrote:
> In preparation for FORTIFY_SOURCE performing compile-time and run-time
> field bounds checking for memset(), avoid intentionally writing across
> neighboring fields.
> 
> Add struct_group() to mark region of struct rt6_info that should be
> initialized to zero.

memset_after() ?

> diff --git a/include/net/ip6_fib.h b/include/net/ip6_fib.h
> index 15b7fbe6b15c..9816e7444918 100644
> --- a/include/net/ip6_fib.h
> +++ b/include/net/ip6_fib.h
> @@ -205,20 +205,22 @@ struct fib6_info {
>  
>  struct rt6_info {
>  	struct dst_entry		dst;
> -	struct fib6_info __rcu		*from;
> -	int				sernum;
> -
> -	struct rt6key			rt6i_dst;
> -	struct rt6key			rt6i_src;
> -	struct in6_addr			rt6i_gateway;
> -	struct inet6_dev		*rt6i_idev;
> -	u32				rt6i_flags;
> -
> -	struct list_head		rt6i_uncached;
> -	struct uncached_list		*rt6i_uncached_list;
> -
> -	/* more non-fragment space at head required */
> -	unsigned short			rt6i_nfheader_len;
> +	struct_group(init,
> +		struct fib6_info __rcu		*from;
> +		int				sernum;
> +
> +		struct rt6key			rt6i_dst;
> +		struct rt6key			rt6i_src;
> +		struct in6_addr			rt6i_gateway;
> +		struct inet6_dev		*rt6i_idev;
> +		u32				rt6i_flags;
> +
> +		struct list_head		rt6i_uncached;
> +		struct uncached_list		*rt6i_uncached_list;
> +
> +		/* more non-fragment space at head required */
> +		unsigned short			rt6i_nfheader_len;
> +	);
>  };
>  
>  struct fib6_result {
> diff --git a/net/ipv6/route.c b/net/ipv6/route.c
> index 6b8051106aba..bbcc605bab57 100644
> --- a/net/ipv6/route.c
> +++ b/net/ipv6/route.c
> @@ -327,9 +327,7 @@ static const struct rt6_info ip6_blk_hole_entry_template = {
>  
>  static void rt6_info_init(struct rt6_info *rt)
>  {
> -	struct dst_entry *dst = &rt->dst;
> -
> -	memset(dst + 1, 0, sizeof(*rt) - sizeof(*dst));
> +	memset(&rt->init, 0, sizeof(rt->init));
>  	INIT_LIST_HEAD(&rt->rt6i_uncached);
>  }
>  

