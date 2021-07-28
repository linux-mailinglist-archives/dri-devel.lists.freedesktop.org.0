Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E884A3D876E
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 07:49:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25DB36ECA4;
	Wed, 28 Jul 2021 05:49:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E42A6ECA1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 05:49:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1AAED60F00;
 Wed, 28 Jul 2021 05:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1627451388;
 bh=Uj+QHLYAZir2Mxo6cu76dwsKyC/KhFwLcw7JJiMlAdM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xXqgpI3gRWbEy8rq81hxDjfK+j0CJIwxB4I/Ae+KVbzLUN+qdK/pkNEczVCdkC1CB
 fCtfqsbsZlEcEq2hviBrmXL0uuu3qCrtSJHnbcmW2vDKkOM3HbDWqFcTxWgnkWe11v
 7rqUxCHJeMJoMg8dvgFXbVdy0U19thX2bW8vYx0g=
Date: Wed, 28 Jul 2021 07:49:46 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 62/64] netlink: Avoid false-positive memcpy() warning
Message-ID: <YQDv+oG7ok0T1L+r@kroah.com>
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-63-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210727205855.411487-63-keescook@chromium.org>
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

On Tue, Jul 27, 2021 at 01:58:53PM -0700, Kees Cook wrote:
> In preparation for FORTIFY_SOURCE performing compile-time and run-time
> field bounds checking for memcpy(), memmove(), and memset(), avoid
> intentionally writing across neighboring fields.
> 
> Add a flexible array member to mark the end of struct nlmsghdr, and
> split the memcpy() to avoid false positive memcpy() warning:
> 
> memcpy: detected field-spanning write (size 32) of single field (size 16)
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  include/uapi/linux/netlink.h | 1 +
>  net/netlink/af_netlink.c     | 4 +++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/netlink.h b/include/uapi/linux/netlink.h
> index 4c0cde075c27..ddeaa748df5e 100644
> --- a/include/uapi/linux/netlink.h
> +++ b/include/uapi/linux/netlink.h
> @@ -47,6 +47,7 @@ struct nlmsghdr {
>  	__u16		nlmsg_flags;	/* Additional flags */
>  	__u32		nlmsg_seq;	/* Sequence number */
>  	__u32		nlmsg_pid;	/* Sending process port ID */
> +	__u8		contents[];

Is this ok to change a public, userspace visable, structure?

Nothing breaks?

thanks,

greg k-h
