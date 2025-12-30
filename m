Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 084F6CEA265
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 17:18:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5937710E92B;
	Tue, 30 Dec 2025 16:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cCJXCvE2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com
 [74.125.224.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F4B10E92B
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 16:18:40 +0000 (UTC)
Received: by mail-yx1-f41.google.com with SMTP id
 956f58d0204a3-646b8d2431dso1680935d50.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 08:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767111519; x=1767716319; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MPsyxbejDKzht/HLlmTw2OYeWbm6m6QfdKcYrQLdRPs=;
 b=cCJXCvE2PNoQLR1evpX/U3Nenyr5aEkanSYn7XVEAqkmD/bKJboHcsV4INE/t5B9/g
 6vRDL2YFWWBfGRn4tY1TsBqBS/5fWHAFVYqr7PdpMHVsQywpV4O0LWwVWlSUJHhOnrKi
 ywm1vmEiSCfmT5bmxTGQLmXa9xNnhXTUcOpbm7IIk/KjGMWbc8DS6aVW/18sIWRCyMk5
 x6/dhxYVAvP+aybtpY1lcq38OO6IKrYeSHpOJX9omWO8b9lkEAYbyDbjm7mGc6MrcNuN
 Nw2pyJFAr8v+d5MMO//2HW4AZc8MQJz7FQuUgE6U6f6NXJ0qz8WWGhv9kU6ryYEY5mMx
 qpig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767111519; x=1767716319;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MPsyxbejDKzht/HLlmTw2OYeWbm6m6QfdKcYrQLdRPs=;
 b=eBONO/Yjrp1mRqwo9ItgzROmsWXJ6E2aQUmYYRsxlIAyluG29oxJlRB4pFuiTtKSbJ
 SCJ5HoNEMVaAkCRnmLuriAF0fLGRSD5FVHAnPu7FYrPP+QVP9wbCD4Bk8KFJh16k6rRK
 B5mwCvTQwh5WaUh9LMvTLx1MAqOSsmP7D/I0sA/Y6pTU3IqlEK2ChZLQtEoFD/ExDpjF
 CnvQpCFNPIcIHT3KEAoncleYMR2p+dzyG0wgCK28cc4KL0XbGCRYWU1RZ7fW+nXmCEul
 QQItGQVHIdzn2HbQBqt4MgH2Pw8QOOdOzSi5IkADweMnM7XD8Rg68Hub55hOaynao5mk
 iTbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsThhT0D9NMgvo7mjoNTZqUw/SA6qx7JP+c6zf+CpPfbPM1saZ1X6go1c+jpUvu506Cw9KevVK2N4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBCSLMKTc/LB+IvkgbEKiQUKWKGxDQ0ksHP7/d8b0Px+F25Hur
 MoAJA4Hb1/3iswrIbZaKuslebKT+aeo3hGwoGw2by0oQjOrjDkaeNdlR
X-Gm-Gg: AY/fxX7AoQ8qE8NNwIka31lhunFcRI1ch7U6Lr91qTYrsI5Zm6+vqERoauNF05Z7v0Q
 tzBYgloa7W/kUDiO8NEv9fCQIkrsjo7Y6V466uhd4Y01GnGcAssztTcIM5DqXaHfYFbngR6RyVg
 PGeXZ4JAIIAZrK9tyYWb3VCle/vhLN+hWXeGV5hMaeJGvcv2ydq5H0ZSFu7BOgSDhGnKiH7m8yI
 AwuAMmdP/PPx3NB8A6FlxBoy3z9qUPkdBM3X9auUlXWmnV/0wB6X3tBw9CsY8iMs+SqyVWI/CqQ
 ii0JgvCpTdoXnveM84AhSw5eSd9BqJGtGr5Wk30IpRLF7u6QZRRt44QLDnRfelQFpsPd+hBbP8w
 1QsUIdhyGdS2hDI6KdfyXVukgAbuHIRNdhbK8n7BMIfa6DJZQNSFcpLym8q1ncrV5LwuZErB/HT
 1MbmB0Nx4=
X-Google-Smtp-Source: AGHT+IEgiqEBna6+E3gk4ji1N98UDvQ4ZQ6HTSlvv4L7zUJHLtl+Nax+qoAvUGugh8jqgLuKhXifXA==
X-Received: by 2002:a05:690e:11c7:b0:644:6adf:cbf0 with SMTP id
 956f58d0204a3-6466a8e6db0mr24510128d50.92.1767111518890; 
 Tue, 30 Dec 2025 08:18:38 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:79bc:cbcc:ae9e:6e4e])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-78fb44f0670sm126746507b3.26.2025.12.30.08.18.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 08:18:38 -0800 (PST)
Date: Tue, 30 Dec 2025 11:18:37 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Christophe Leroy <chleroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 David Laight <david.laight@runbox.com>, Petr Pavlu <petr.pavlu@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v4 7/7] kernel.h: drop trace_printk.h
Message-ID: <aVP7XVtYwb4YV9gy@yury>
References: <20251225170930.1151781-1-yury.norov@gmail.com>
 <20251225170930.1151781-8-yury.norov@gmail.com>
 <20251226115848.298465d4@gandalf.local.home>
 <20251228133150.1d5731d04bc1b685b0fe81c1@linux-foundation.org>
 <20251229111748.3ba66311@gandalf.local.home>
 <9833cb61-1ec5-4cc1-ad9d-3e07f3deff80@efficios.com>
 <aVOTbArAxmbT5LY9@smile.fi.intel.com>
 <71767aa7-0247-4bcc-8746-3338905197b3@efficios.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71767aa7-0247-4bcc-8746-3338905197b3@efficios.com>
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

On Tue, Dec 30, 2025 at 09:21:00AM -0500, Mathieu Desnoyers wrote:
> On 2025-12-30 03:55, Andy Shevchenko wrote:
> > On Mon, Dec 29, 2025 at 05:25:08PM -0500, Mathieu Desnoyers wrote:
> > 
> > ...
> > 
> > > One possible compromise would be to move it to its own header file,
> > > and introduce a CONFIG_TRACE_PRINTK Kconfig option (default Y) that
> > > would surround an include from linux/kernel.h with a preprocessor
> > > conditional.

We already have CONFIG_TRACING, and everything in the new
trace_printk.h is conditional on it. We can protect the header in
kernel.h with the same config.

> > > But please make sure the default stays as it is today:
> > > include the trace printk header by default.
> > 
> > "by default" where exactly?

Seemingly nowhere.

> > The problem is that kernel.h is a total mess and
> > it's included in a lot of mysterious ways (indirectly),

Yes!

> > and in C you _must_
> > include a header anyway for a custom API, just define *which* one.
>
> This patch series moves the guts of trace_printk into its own header
> file, which reduces clutter. So that's already progress. :)
> 
> > 
> > Based on the Steven's first replies I see a compromise in having it inside
> > printk.h. If you want to debug something with printf() (in general) the same
> > header should provide all species. Do you agree?
 
It may sound logical, but I don't like this idea. Printk() is used
for debugging by everyone, but its main goal is to communicate to
userspace and between different parts of the kernel. Notice how all
debugging and development API in linux/pritnk.h is protected with the
corresponding ifdefery. 

Contrary to that, trace_printk() is a purely debugging feature. There's
no use for it after the debugging is done. (Or I missed something?)

Everyone admits that kernel.h is a mess. Particularly, it's a mess of
development and production features. So, moving trace_printk() from an
already messy kernel.h to a less messy printk.h - to me it looks like
spreading the mess.

> I don't have a strong opinion about including trace_printk.h from either
> kernel.h or printk.h. As long as it's still included by a default kernel
> config the same way it has been documented/used since 2009.

Can you please point to the documentation and quote the exact piece
stating that? Git history points to the commit 40ada30f9621f from Ingo
that decouples tracers from DEBUG_KERNEL, and the following 422d3c7a577
from Kosaki that force-enables the new TRACING_SUPPORT regardless of
the DEBUG_KERNEL state.

To me, decoupling tracing from DEBUG_KERNEL looks accidental rather than
intentional. So maybe simply restore that dependency?

Currently, even with tinyconfig, DEBUG_KERNEL is enabled (via EXPERT).
And even if EXPERT and DEBUG_KERNEL are off, tracers are still enabled.
This doesn't look right...

Thanks,
Yury
