Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F4097CCA589
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 06:35:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2425610E5C3;
	Thu, 18 Dec 2025 05:35:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bxGhXMpG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2848210E5C3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 05:35:21 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-7f0da2dfeaeso318609b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 21:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766036121; x=1766640921; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yaGJpOKqg8zQltJlD/AWg9VGkTrfZMf+YGQyTVj+MTg=;
 b=bxGhXMpGYMbiHvs/UpKflzTqLGwf00UOLvlkR+wS97w2C5RFo1/fBOrnbKO0IgVrLI
 4ynnOLkZ4bA59VqpBwScGtETdFQS+/x2ODCwavZ0sI9akcXEb3VceaOldMm0LumVTAJ5
 HyngPJ4KVFKZq9eTegQJNE1aNAwkUWlEaEif3MfOk9NnYGX2RZSW/VksBVh+duo1Rx+J
 5s644dLpw1dqDMt7R2B05H9RLKip5yKuNf2uJcJI+KFvnptviGUqAQz3NBGu2k+e8M4W
 0leT8eUpxSSFFNoG2pBCJjX+AsSMhWBfkzUu7+gwutpoQDukRqr3s3bp3XeKLGIj8hWR
 sQUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766036121; x=1766640921;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yaGJpOKqg8zQltJlD/AWg9VGkTrfZMf+YGQyTVj+MTg=;
 b=dmAgnCdFXwNtn3tZcdNEcsVItCPkU4gwYY8lZhgnuFqqANOdF4tqRIHOsOWQYOdwMz
 dNleZ8fpj8l//3UuzP/pJzOyBUU8BkYDbufPw20AKgCPWrxhR0RmenEbj8dUq9ufbFJM
 1EXXhmN0+szRzwxdzqWGNroSdiGftdzvzHFpV+GpHZZGwXRRZqOZY2RYFwAMQYZ7xcr8
 E3S01cec+rNH4LG0H36bINe62luOS6J8Ti4KWACZBkv58pCMisgnwBi/p7tg/qT7/9MU
 ltqx+VJpccUe4bK4FPLKsJmdh3ZYYqLVUN3u2g2zy2zfCbr4Em14ssaa+ullJkQK9waD
 uEWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUh1AHRwXRz5xPsq7WhL94Q1qiEZiDm/7XO7PNIVa8D9zFPyPBINpfDa32qcS7LJrgSFr3NsYgLXhg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPfnC+jU+Yj8F2rJEfFNBeUrCuhFdJQfQcGA6Lo9yG2laT1W3n
 YUgRzhBDyFUJf2jgv0FD3+R3FcW/wPZn89FE+zJHo9Vf8pJkJoZiIj4Xu5nkEg==
X-Gm-Gg: AY/fxX6H5vTiD8MrYB5I0AoEtt3NE2S0NfpoY2/d2zF6IGueahnoOZ+HAeYvCxBxNF8
 yFAIloDA4+uKy329XVng4AmXqqo3FO60YODR2mtHZNN70YDesS0lvPgR+4R+rCI1/hpmypQWbxu
 v/QQDGLR41BuMPYgAJecGFnENjaKelaQW77bfUnZ+ZrtRz8C44BGbdEzO8eSdiEuIi1VP56390P
 z36dKXZEb7pH8fhZkgkN9rW6GOIqgZ9O6l7jW8VckHbulCztvBD25p3cwmAuPgGtk3mtbfLjbzL
 W09aoqHtOiLoch0TmWv6TadY5t/PpcXLx5ewt6bCi3zF2MlVH2QFgVxk7qtGMAsSSgLhJaTNHIz
 WHWfD2REz0NQoWqrNdSBeXjiwE/Xtr6cUJULmDsRk1zEtqtpE3UnfPf7bblY4MHEEVuNcgm9P3q
 1AT2zdcOo=
X-Google-Smtp-Source: AGHT+IHIeJZ6pUO0IWI3BZr8YKRR4WYcObEmm4ye3CL4DoHkOxJXpQslAZeBIjOMe9+OleYRLYL1Lg==
X-Received: by 2002:a53:a090:0:b0:63f:bd67:7c52 with SMTP id
 956f58d0204a3-645555e7c66mr12186194d50.29.1766030374328; 
 Wed, 17 Dec 2025 19:59:34 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:52c0:aec0:bf15:a891])
 by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-646636e8a2csm581612d50.4.2025.12.17.19.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Dec 2025 19:59:33 -0800 (PST)
Date: Wed, 17 Dec 2025 22:59:33 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christophe Leroy <chleroy@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 David Laight <david.laight@runbox.com>, Petr Pavlu <petr.pavlu@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 Kees Cook <kees@kernel.org>
Subject: Re: [PATCH v3 4/4] tracing: move tracing declarations from kernel.h
 to a dedicated header
Message-ID: <aUN8Hm377C5A0ILX@yury>
References: <20251205175237.242022-1-yury.norov@gmail.com>
 <20251205175237.242022-5-yury.norov@gmail.com>
 <20251216161316.45b3f19ff0ad482018137189@linux-foundation.org>
 <55ceb7bf-0fe9-4edc-81c2-d51366847eec@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55ceb7bf-0fe9-4edc-81c2-d51366847eec@infradead.org>
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

On Tue, Dec 16, 2025 at 09:24:55PM -0800, Randy Dunlap wrote:
> [adding Kees]
> 
> On 12/16/25 4:13 PM, Andrew Morton wrote:
> > On Fri,  5 Dec 2025 12:52:35 -0500 "Yury Norov (NVIDIA)" <yury.norov@gmail.com> wrote:
> > 
> >> Tracing is a half of the kernel.h in terms of LOCs, although it's
> >> a self-consistent part. It is intended for quick debugging purposes
> >> and isn't used by the normal tracing utilities.
> >>
> >> Move it to a separate header. If someone needs to just throw a
> >> trace_printk() in their driver, they will not have to pull all
> >> the heavy tracing machinery.
> >>
> >> This is a pure move, except for removing a few 'extern's.
> >>
> 
> Hm, for a pure move, this shouldn't be necessary. Anyway, not using
> FORTIFY in purgatory.o fixes this build error.
> Or maybe there's a better answer.
> 
> ---
>  arch/x86/purgatory/Makefile |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- a/arch/x86/purgatory/Makefile
> +++ b/arch/x86/purgatory/Makefile
> @@ -62,7 +62,7 @@ PURGATORY_CFLAGS_REMOVE		+= $(CC_FLAGS_C
>  endif
>  
>  CFLAGS_REMOVE_purgatory.o	+= $(PURGATORY_CFLAGS_REMOVE)
> -CFLAGS_purgatory.o		+= $(PURGATORY_CFLAGS)
> +CFLAGS_purgatory.o		+= $(PURGATORY_CFLAGS) -D__NO_FORTIFY
>  
>  CFLAGS_REMOVE_sha256.o		+= $(PURGATORY_CFLAGS_REMOVE)
>  CFLAGS_sha256.o			+= $(PURGATORY_CFLAGS)

That happened because the new trace_printk.h includes string.h for
strlen(), so all kernel.h users now indirectly include it, and it
causes, seemingly, a circular dependency if FORTIFY is enabled.

A fix would be dropping trace_printk.h from kernel.h, or switching the
only user of string.h, trace_puts(), to __builtin_strlen().

Notice, Andy has concerned about this on the previous round, and also
suggested __builtin_strlen():

        https://lkml.org/lkml/2025/12/3/910

I deem to drop trace_printk.h from kernel.h - it is more aligned with
the idea of unloading the header. The original motivation to keep
trace_printk.h in kernel.h was just because a similar printk.h is living
there. But after all, this is a purely debugging header, so no need for
almost every C file to bear debugging stuff.

I can actually do both - switch to an intrinsic and drop the header.

Guys, please let me know what do you thing.

Thanks,
Yury
