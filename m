Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B073D875C
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 07:46:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C3F6EC98;
	Wed, 28 Jul 2021 05:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7131B6EC98
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 05:46:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AB34560F00;
 Wed, 28 Jul 2021 05:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1627451190;
 bh=RkniVPw58x8HtXFNZtC6iw7u6agFRS3hIJcKdd+55ec=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DSebIApW9TVBAUK7OJ/Tb8IqORU/SGsPM3aWGnOEmtfhuKuwrzn0QtsCBUDuV6gqM
 yOHBji91agAgQERWWduJrLj9K/W8yyM7nH4QV70xYPcZBkujd6YERI4gwzXwo+otKh
 wLtgvqZimQZTA1U1liKqT622nMyjaIAZgegBMcNI=
Date: Wed, 28 Jul 2021 07:46:27 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 09/64] staging: rtl8723bs: Avoid field-overflowing memcpy()
Message-ID: <YQDvM4r2KomO9p+J@kroah.com>
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-10-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210727205855.411487-10-keescook@chromium.org>
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

On Tue, Jul 27, 2021 at 01:58:00PM -0700, Kees Cook wrote:
> In preparation for FORTIFY_SOURCE performing compile-time and run-time
> field bounds checking for memcpy(), memmove(), and memset(), avoid
> intentionally writing across neighboring fields.
> 
> Adjust memcpy() destination to be the named structure itself, rather than
> the first member, allowing memcpy() to correctly reason about the size.
> 
> "objdump -d" shows no object code changes.
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

