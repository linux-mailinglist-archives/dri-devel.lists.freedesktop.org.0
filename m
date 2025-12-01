Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAF0C96678
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 10:38:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2165810E338;
	Mon,  1 Dec 2025 09:38:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GdvDEAEF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B30A110E338;
 Mon,  1 Dec 2025 09:38:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A0BD86013A;
 Mon,  1 Dec 2025 09:38:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73726C4CEF1;
 Mon,  1 Dec 2025 09:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764581887;
 bh=4p2wg1jmOngnkzqKp6YIZ9UwcAm/w6dhGKvcrcI//Ok=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=GdvDEAEFt0aGU5ln/ROKVDXUPfJFeouk5NuQRf4tzsuamtFpi6ayLs4mMLZn0bkSA
 tbBtWTvwS1FdfhGP03SFL+5x2JrTBLkfrPT5zbmp8IkhZAUcUAeStqzOprHT1vEKBH
 BxwhXHuBsY6erQgpyld5jroWvYmoLA4hmWXecHHXScuQE38VjTnq4MqnKX70DeBPPr
 ExeDG4SucnRtoWYtI3elukieHFaaTCndJDK1mrQMi+bOVZlknQigDvQHuAoSE22e8b
 KbTG3h3Q8YOO018TQwixvc4ft1NT2apZi3P/SBkhkF4CD1QSXZEe9cCXeae0b2Ri1A
 FDU8aHJPDvC/Q==
Message-ID: <3e7ddbea-978f-44f7-abdd-7319908fd83c@kernel.org>
Date: Mon, 1 Dec 2025 10:38:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] kernel.h: drop STACK_MAGIC macro
To: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
References: <20251129195304.204082-1-yury.norov@gmail.com>
 <20251129195304.204082-2-yury.norov@gmail.com>
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Content-Language: fr-FR
In-Reply-To: <20251129195304.204082-2-yury.norov@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Le 29/11/2025 à 20:53, Yury Norov (NVIDIA) a écrit :
> The macro is only used by i915. Move it to a local header and drop from
> the kernel.h.

At the begining of the git history we have:

$ git grep STACK_MAGIC 1da177e4c3f41
1da177e4c3f41:arch/h8300/kernel/traps.c:        if (STACK_MAGIC != 
*(unsigned long *)((unsigned long)current+PAGE_SIZE))
1da177e4c3f41:arch/m68k/mac/macints.c:          if (STACK_MAGIC != 
*(unsigned long *)current->kernel_stack_page)
1da177e4c3f41:include/linux/kernel.h:#define STACK_MAGIC        0xdeadbeef

Would be good to know the history of its usage over time.

I see:
- Removed from m68k by 3cd53b14e7c4 ("m68k/mac: Improve NMI handler")
- Removed from h8300 by 1c4b5ecb7ea1 ("remove the h8300 architecture")
- Started being used in i915 selftest by 250f8c8140ac ("drm/i915/gtt: 
Read-only pages for insert_entries on bdw+")

Christophe

> 
> Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
> ---
>   drivers/gpu/drm/i915/i915_utils.h | 2 ++
>   include/linux/kernel.h            | 2 --
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
> index a0c892e4c40d..6c197e968305 100644
> --- a/drivers/gpu/drm/i915/i915_utils.h
> +++ b/drivers/gpu/drm/i915/i915_utils.h
> @@ -32,6 +32,8 @@
>   #include <linux/workqueue.h>
>   #include <linux/sched/clock.h>
>   
> +#define STACK_MAGIC	0xdeadbeef
> +
>   #ifdef CONFIG_X86
>   #include <asm/hypervisor.h>
>   #endif
> diff --git a/include/linux/kernel.h b/include/linux/kernel.h
> index 5b46924fdff5..61d63c57bc2d 100644
> --- a/include/linux/kernel.h
> +++ b/include/linux/kernel.h
> @@ -40,8 +40,6 @@
>   
>   #include <uapi/linux/kernel.h>
>   
> -#define STACK_MAGIC	0xdeadbeef
> -
>   struct completion;
>   struct user;
>   

