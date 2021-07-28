Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 089663D8787
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 07:55:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 499F56ECA7;
	Wed, 28 Jul 2021 05:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 433616ECA7
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 05:55:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9539F60F91;
 Wed, 28 Jul 2021 05:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1627451755;
 bh=dUBkfSuy+pimGAygKvH/n56Fu+Rjei7swUaiM8a6UqY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qLN7/AfFyKyqqZDZ9FDSMX6paOr2wueWSWObcEAr/Zi1oyjzjstRV/VEwxN7kqrMN
 LrM8kTmwyBi22OUBnN5t74TunCqP0FyLqfYR4+puz8/QuIzbcLYEnwsV86MkZ/qY9S
 abW/DHoDjfQ4zF+SRbQj6vg+F6J88I07elfvWVsc=
Date: Wed, 28 Jul 2021 07:55:53 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 19/64] ip: Use struct_group() for memcpy() regions
Message-ID: <YQDxaYrHu0PeBIuX@kroah.com>
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-20-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210727205855.411487-20-keescook@chromium.org>
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
Cc: linux-kbuild@vger.kernel.org, netdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-block@vger.kernel.org,
 clang-built-linux@googlegroups.com, Keith Packard <keithpac@amazon.com>,
 linux-hardening@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 27, 2021 at 01:58:10PM -0700, Kees Cook wrote:
> In preparation for FORTIFY_SOURCE performing compile-time and run-time
> field bounds checking for memcpy(), memmove(), and memset(), avoid
> intentionally writing across neighboring fields.
> 
> Use struct_group() in struct flowi4, struct ipv4hdr, and struct ipv6hdr
> around members saddr and daddr, so they can be referenced together. This
> will allow memcpy() and sizeof() to more easily reason about sizes,
> improve readability, and avoid future warnings about writing beyond the
> end of saddr.
> 
> "pahole" shows no size nor member offset changes to struct flowi4.
> "objdump -d" shows no meaningful object code changes (i.e. only source
> line number induced differences.)
> 
> Note that since this is a UAPI header, struct_group() has been open
> coded.
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  include/net/flow.h            |  6 ++++--
>  include/uapi/linux/if_ether.h | 12 ++++++++++--
>  include/uapi/linux/ip.h       | 12 ++++++++++--
>  include/uapi/linux/ipv6.h     | 12 ++++++++++--
>  net/core/flow_dissector.c     | 10 ++++++----
>  net/ipv4/ip_output.c          |  6 ++----
>  6 files changed, 42 insertions(+), 16 deletions(-)
> 
> diff --git a/include/net/flow.h b/include/net/flow.h
> index 6f5e70240071..f1a3b6c8eae2 100644
> --- a/include/net/flow.h
> +++ b/include/net/flow.h
> @@ -81,8 +81,10 @@ struct flowi4 {
>  #define flowi4_multipath_hash	__fl_common.flowic_multipath_hash
>  
>  	/* (saddr,daddr) must be grouped, same order as in IP header */
> -	__be32			saddr;
> -	__be32			daddr;
> +	struct_group(addrs,
> +		__be32			saddr;
> +		__be32			daddr;
> +	);
>  
>  	union flowi_uli		uli;
>  #define fl4_sport		uli.ports.sport
> diff --git a/include/uapi/linux/if_ether.h b/include/uapi/linux/if_ether.h
> index a0b637911d3c..8f5667b2ea92 100644
> --- a/include/uapi/linux/if_ether.h
> +++ b/include/uapi/linux/if_ether.h
> @@ -163,8 +163,16 @@
>  
>  #if __UAPI_DEF_ETHHDR
>  struct ethhdr {
> -	unsigned char	h_dest[ETH_ALEN];	/* destination eth addr	*/
> -	unsigned char	h_source[ETH_ALEN];	/* source ether addr	*/
> +	union {
> +		struct {
> +			unsigned char h_dest[ETH_ALEN];	  /* destination eth addr */
> +			unsigned char h_source[ETH_ALEN]; /* source ether addr	  */
> +		};
> +		struct {
> +			unsigned char h_dest[ETH_ALEN];	  /* destination eth addr */
> +			unsigned char h_source[ETH_ALEN]; /* source ether addr	  */
> +		} addrs;

A union of the same fields in the same structure in the same way?

Ah, because struct_group() can not be used here?  Still feels odd to see
in a userspace-visible header.

> +	};
>  	__be16		h_proto;		/* packet type ID field	*/
>  } __attribute__((packed));
>  #endif
> diff --git a/include/uapi/linux/ip.h b/include/uapi/linux/ip.h
> index e42d13b55cf3..33647a37e56b 100644
> --- a/include/uapi/linux/ip.h
> +++ b/include/uapi/linux/ip.h
> @@ -100,8 +100,16 @@ struct iphdr {
>  	__u8	ttl;
>  	__u8	protocol;
>  	__sum16	check;
> -	__be32	saddr;
> -	__be32	daddr;
> +	union {
> +		struct {
> +			__be32	saddr;
> +			__be32	daddr;
> +		} addrs;
> +		struct {
> +			__be32	saddr;
> +			__be32	daddr;
> +		};

Same here (except you named the first struct addrs, not the second,
unlike above).


> +	};
>  	/*The options start here. */
>  };
>  
> diff --git a/include/uapi/linux/ipv6.h b/include/uapi/linux/ipv6.h
> index b243a53fa985..1c26d32e733b 100644
> --- a/include/uapi/linux/ipv6.h
> +++ b/include/uapi/linux/ipv6.h
> @@ -130,8 +130,16 @@ struct ipv6hdr {
>  	__u8			nexthdr;
>  	__u8			hop_limit;
>  
> -	struct	in6_addr	saddr;
> -	struct	in6_addr	daddr;
> +	union {
> +		struct {
> +			struct	in6_addr	saddr;
> +			struct	in6_addr	daddr;
> +		} addrs;
> +		struct {
> +			struct	in6_addr	saddr;
> +			struct	in6_addr	daddr;
> +		};

addrs first?  Consistancy is key :)

thanks,

greg k-h
