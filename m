Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A9576F08C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 19:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0470C10E63A;
	Thu,  3 Aug 2023 17:24:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9979910E63A;
 Thu,  3 Aug 2023 17:24:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 83BA961E43;
 Thu,  3 Aug 2023 17:24:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2680EC433C8;
 Thu,  3 Aug 2023 17:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1691083487;
 bh=oIo8w6drezvDhvrXgj4j0LpRAgS/qxGC1oMH8Yk1tvw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eMUBImiK3nx9CnEb8dGmTePWdUsS7g5uZigscN46OZefvAG3cHSY2c1TSsAcLKC40
 zPxEuHVQWiL5/mNhVTLbA8ihaNKKMYztp8m3nTQYBzC0NmOSQDQIdWjQg3Y7lhAX8W
 XkhnUZWaEsgnvMagICmJ859HiRc9GHDBYBWe6kXc=
Date: Thu, 3 Aug 2023 10:24:46 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 1/1] drm/i915: Move abs_diff() to math.h
Message-Id: <20230803102446.8edf94acc77e81ab2e09cee3@linux-foundation.org>
In-Reply-To: <20230803131918.53727-1-andriy.shevchenko@linux.intel.com>
References: <20230803131918.53727-1-andriy.shevchenko@linux.intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 linux-fbdev@vger.kernel.org, linux-serial@vger.kernel.org,
 Jani Nikula <jani.nikula@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 Jiri Slaby <jirislaby@kernel.org>, Alexey Dobriyan <adobriyan@gmail.com>,
 Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu,  3 Aug 2023 16:19:18 +0300 Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> abs_diff() belongs to math.h. Move it there.
> This will allow others to use it.
> 
> ...
>
> --- a/include/linux/math.h
> +++ b/include/linux/math.h
> @@ -155,6 +155,13 @@ __STRUCT_FRACT(u32)
>  	__builtin_types_compatible_p(typeof(x), unsigned type),		\
>  	({ signed type __x = (x); __x < 0 ? -__x : __x; }), other)
>  
> +#define abs_diff(a, b) ({			\
> +	typeof(a) __a = (a);			\
> +	typeof(b) __b = (b);			\
> +	(void)(&__a == &__b);			\
> +	__a > __b ? (__a - __b) : (__b - __a);	\
> +})

Can we document it please?

Also, the open-coded type comparison could be replaced with __typecheck()?

And why the heck isn't __typecheck() in typecheck.h, to be included by
minmax.h.

etcetera.  Sigh.  I'll grab it, but please at least send along some
kerneldoc?


