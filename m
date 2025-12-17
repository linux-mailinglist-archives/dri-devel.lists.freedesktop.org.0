Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E134CC5924
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 01:13:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9664210E990;
	Wed, 17 Dec 2025 00:13:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="UEBIouRU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF98C10E8BE;
 Wed, 17 Dec 2025 00:13:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E608140543;
 Wed, 17 Dec 2025 00:13:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11BFDC113D0;
 Wed, 17 Dec 2025 00:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1765930412;
 bh=guSmMQslz2eUQy2vPYhbxWxtnXj+yzMG6VNMUP1e+TI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UEBIouRUlYkISx+P/il+LrpXfirQuqfYpiZGSCCJrw7KFHQQeQfeEXRgD6KFjJr8O
 kuFhJvTOwSo+cL2ls6MqVR8MPyLa4G9ye/dKlVX9siq2A2HvgE0eqvbYHKd2ZqJxmF
 MAI4vd1r4qo6BySMSBEUnY3BTEGSEPeARB3AaGLw=
Date: Tue, 16 Dec 2025 16:13:16 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Christophe Leroy
 <chleroy@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar
 <mingo@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, David Laight
 <david.laight@runbox.com>, Petr Pavlu <petr.pavlu@suse.com>, Andi Shyti
 <andi.shyti@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko
 Ursulin <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] tracing: move tracing declarations from kernel.h
 to a dedicated header
Message-Id: <20251216161316.45b3f19ff0ad482018137189@linux-foundation.org>
In-Reply-To: <20251205175237.242022-5-yury.norov@gmail.com>
References: <20251205175237.242022-1-yury.norov@gmail.com>
 <20251205175237.242022-5-yury.norov@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri,  5 Dec 2025 12:52:35 -0500 "Yury Norov (NVIDIA)" <yury.norov@gmail.com> wrote:

> Tracing is a half of the kernel.h in terms of LOCs, although it's
> a self-consistent part. It is intended for quick debugging purposes
> and isn't used by the normal tracing utilities.
> 
> Move it to a separate header. If someone needs to just throw a
> trace_printk() in their driver, they will not have to pull all
> the heavy tracing machinery.
> 
> This is a pure move, except for removing a few 'extern's.
> 

This one blows up my x86_64 allmodconfig, gcc-15.2.0:

In file included from ./include/linux/string.h:386,
                 from ./include/linux/trace_printk.h:9,
                 from ./include/linux/kernel.h:34,
                 from arch/x86/purgatory/purgatory.c:12:
./include/linux/fortify-string.h:626:63: error: expected identifier or '(' before '{' token
  626 |                              p_size_field, q_size_field, op) ({         \
      |                                                               ^
./include/linux/fortify-string.h:694:27: note: in expansion of macro '__fortify_memcpy_chk'
  694 | #define memmove(p, q, s)  __fortify_memcpy_chk(p, q, s,                 \
      |                           ^~~~~~~~~~~~~~~~~~~~
arch/x86/purgatory/../boot/string.h:11:7: note: in expansion of macro 'memmove'
   11 | void *memmove(void *dst, const void *src, size_t len);
      |       ^~~~~~~
./include/linux/fortify-string.h:258:9: error: expected identifier or '(' before '__builtin_choose_expr'
  258 |         __builtin_choose_expr(__is_constexpr(__builtin_strlen(p)),      \
      |         ^~~~~~~~~~~~~~~~~~~~~
arch/x86/purgatory/../boot/string.h:23:15: note: in expansion of macro 'strlen'
   23 | extern size_t strlen(const char *s);
      |               ^~~~~~
make[4]: *** [scripts/Makefile.build:287: arch/x86/purgatory/purgatory.o] Error 1
make[3]: *** [scripts/Makefile.build:556: arch/x86/purgatory] Error 2
make[2]: *** [scripts/Makefile.build:556: arch/x86] Error 2
make[1]: *** [/usr/src/25/Makefile:2054: .] Error 2
make: *** [Makefile:248: __sub-make] Error 2

