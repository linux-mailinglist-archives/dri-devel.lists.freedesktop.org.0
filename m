Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB86CE578E
	for <lists+dri-devel@lfdr.de>; Sun, 28 Dec 2025 22:31:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C408112621;
	Sun, 28 Dec 2025 21:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="uJDfCTVf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A44112621;
 Sun, 28 Dec 2025 21:31:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B280B41789;
 Sun, 28 Dec 2025 21:31:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEDFEC4CEFB;
 Sun, 28 Dec 2025 21:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1766957511;
 bh=RmuKLZ3sZCzDzTXc4AqK859HnGlXw2AUurpubxSNsXU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uJDfCTVftVwMa2XsyOr5TGBpTc8L5ZEB0rtH29CWCovofEiPBEIxYtV/YGToTkYgM
 /5OY5Kp1PwiaPQ6fHsd0tCWscNsnPAUY/S7G00WsSGg1y37ajSqI/E/v3NneOYHigM
 teZo8kMbZXPvSc/pRwzu1e9k3k4yJXE1KJAaJb4Q=
Date: Sun, 28 Dec 2025 13:31:50 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>, Masami Hiramatsu
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
Subject: Re: [PATCH v4 7/7] kernel.h: drop trace_printk.h
Message-Id: <20251228133150.1d5731d04bc1b685b0fe81c1@linux-foundation.org>
In-Reply-To: <20251226115848.298465d4@gandalf.local.home>
References: <20251225170930.1151781-1-yury.norov@gmail.com>
 <20251225170930.1151781-8-yury.norov@gmail.com>
 <20251226115848.298465d4@gandalf.local.home>
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

On Fri, 26 Dec 2025 11:58:48 -0500 Steven Rostedt <rostedt@goodmis.org> wrote:

> On Thu, 25 Dec 2025 12:09:29 -0500
> "Yury Norov (NVIDIA)" <yury.norov@gmail.com> wrote:
> 
> > The trace_printk.h header is debugging-only by nature, but now it's
> > included by almost every compilation unit via kernel.h.
> > 
> > Removing trace_printk.h saves 1.5-2% of compilation time on my
> > Ubuntu-derived x86_64/localyesconfig.
> > 
> > There's ~30 files in the codebase, requiring trace_printk.h for
> > non-debugging reasons: mostly to disable tracing on panic or under
> > similar conditions. Include the header for those explicitly.
> > 
> > This implicitly decouples linux/kernel.h and linux/instruction_pointer.h
> > as well, because it has been isolated to trace_printk.h early in the
> > series.
> > 
> > Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
> 
> I'm still against this patch. It means every time someone adds
> trace_printk() they need to add the header for it.
> 
> trace_printk() should be as available to the kernel as printk() is.

um, why?  trace_printk is used 1% as often as is printk.  Seems
reasonable to include a header file to access such a rarely-used(!) and
specialized thing?
