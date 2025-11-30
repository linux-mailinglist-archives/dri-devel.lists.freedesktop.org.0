Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BD2C9532C
	for <lists+dri-devel@lfdr.de>; Sun, 30 Nov 2025 19:16:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A2F10E275;
	Sun, 30 Nov 2025 18:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AXfSdG70";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com
 [74.125.224.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E3610E270
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Nov 2025 18:16:21 +0000 (UTC)
Received: by mail-yx1-f46.google.com with SMTP id
 956f58d0204a3-6420dc2e5feso2579354d50.3
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Nov 2025 10:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764526580; x=1765131380; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bPTHL8VwtfKfk45TFU08paMyal7EO1gfKoy+e7omzHs=;
 b=AXfSdG70wwg+NJSOTf8MqnNpq263+h4TqLmU7bSpjQ866yjC4LEAJVLutx+FxwO18x
 Buxly7vqg8bNMWjdEB9E7kcL9AxH8qKSWWj1t0KqI4X5UREF0+aVLekRdEL/vFS8X0uG
 wjv7J75BFd7YluEGLSeIXXjQ2Mn+0hw5jh7L8dYI7XQeuTJjy5eY2bWkwm55a0hQmirp
 QBH7/UVM1LzydFMdmlwBqOXRF7rCtD+yWVKZvcMIy/+eufjI8KF0NVJ7nx/cUygVuYMB
 7r1P8nxmkjZVKbkXFniQ+Yil2Vp7xv162g7+wAfvSMxGNE4YW6fxdr6pj7X3Kox6xBHS
 6Bog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764526580; x=1765131380;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bPTHL8VwtfKfk45TFU08paMyal7EO1gfKoy+e7omzHs=;
 b=ghriLlmZUY2PVzEXoPPDje/6PZQSClZX4z9YgmtV2YV9IUgU3XYg1MmZAYqxgJ/TgA
 EYbTnQd4Rl1X+/Ws9oSXQDlo2yVs9Il8FlZTWz6j7DgPPPYfDj4WoKiiD+nag3Y/VZmU
 0TvB8Mf6bzfkCQpAt1mG+67faxkGL4qsNZthQNmraO5syPgZx9oy/F3tUS6GsvBzSoFK
 w7OwiVc1BUOXq4siOVNkqpmdlmC9YX0HaXjYXWEs729rliNOeXGWyZpx/K3Au9ZNYWHx
 aTOjtlq9dsJrw4wTdcF5cACCbNhprW0no4SygYK8Dvz2cPD9joip9juA7HtbJYzAz8KV
 F8Sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzd7qcoSxOnfUYNW3T/DdIXZo6VpSvHxnM3hF/WRt6Y1ftVUGAaAzg3U/LYZmIurvT6II4SLU+7Y0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5B5wFJXjHkcFdbnP7M2SHqhle7V3VYVqeVh9UEj17htkz3khJ
 eEHL5QSgkOjbMUgPoyiQ/eQprDw0JIjPWTn2uY8Yv2GD55YhE766AFWh
X-Gm-Gg: ASbGncun5SHdZiaWcpiwSLn+sgVrg1EfropxUxqIERyoUJnBqRgRYtedKv9qIbQh0kP
 EAjI0Ql1TjpEIkjyORFp6bp3f5HxycJDWo8GYlgPwTQvxwr/VTlGzrom+BwyXO16so8Ajy2Drow
 YgvPy0WZyVjdFPnevQXtquxbNi+kFPJDUj8idoc55a7mtdwp9gNrK0RH6SmYA1GgQJK7BOy4ASB
 ptOtP1FP1vr0N5DkVvd9+mQgwx0i+ONsUZJMD+JPf9nKiTs5gXMYDrUUgUx8SQMCJELRelKPHWl
 M3syvrO2+p2VgVgLZL/sX+u49+Fjw1wRHZvMSKEKQKXbvKW3DIB3dhcFC0VgVUN4By2hj4pIbtF
 MSDGS4t61nW0b66oBXutK71uB9qU23aBT7RRZtoPzOd68ksV6luO5ciqgXMaLAGitHAkC8/0hsL
 HnjfNQxXJ0njocbpCXvA==
X-Google-Smtp-Source: AGHT+IEQcHwA7T6ktmCXafon70hVlddeX9BaPXERtnLHGkMmTox+ufRP6CsVlNJn8W2ToaNF/lgtHw==
X-Received: by 2002:a53:acc9:0:10b0:63f:beb2:9519 with SMTP id
 956f58d0204a3-64302a2fb59mr21422815d50.5.1764526580498; 
 Sun, 30 Nov 2025 10:16:20 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:b42b:4ad9:10af:cabc])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-78ad0d603f5sm39289087b3.19.2025.11.30.10.16.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Nov 2025 10:16:20 -0800 (PST)
Date: Sun, 30 Nov 2025 13:16:19 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] tracing: move tracing declarations from kernel.h to
 a dedicated header
Message-ID: <aSyJ83v7EEAPHXeU@yury>
References: <20251129195304.204082-1-yury.norov@gmail.com>
 <20251129195304.204082-4-yury.norov@gmail.com>
 <aStX3242e3mo5H05@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aStX3242e3mo5H05@smile.fi.intel.com>
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

On Sat, Nov 29, 2025 at 10:30:23PM +0200, Andy Shevchenko wrote:
> On Sat, Nov 29, 2025 at 02:53:02PM -0500, Yury Norov (NVIDIA) wrote:
> > Tracing is a half of the kernel.h in terms of LOCs, although it's a
> > self-consistent part. Move it to a separate header.
> > 
> > This is a pure move, except for removing a few 'extern's.
> 
> Yeah, I also have something similar (but half-baked) locally, the Q I wanted to
> ask is why a separate header? We have already some of tracing headers. Doesn't
> suit well?

Just as said in the commit message - this part is more or less
self-consistent and debugging-oriented. If someone needs to just
throw trace_printk() in their driver, they will not have to pull
all the heavy tracing machinery.

> ...
> 
> > --- a/include/linux/kernel.h
> > +++ b/include/linux/kernel.h
> > @@ -27,6 +27,7 @@
> >  #include <linux/math.h>
> >  #include <linux/minmax.h>
> >  #include <linux/typecheck.h>
> 
> > +#include <linux/tracing.h>
> 
> There is better place for t*.h, i.e. after static_call_types.h.

They are poorly sorted for seemingly no good reason. I found the first
t*.h and just put this header next to it. Don't think that placing it
next to static_call_types.h is any better or worse.
 
> Btw, have you tried to sort alphabetically the bulk in the kernel.h after
> your series. Does it still build? (Just wondering about state of affairs
> with the possible cyclic dependencies.)

I didn't try. Sorting #include's is not the purpose of the series.

Thanks,
Yury
