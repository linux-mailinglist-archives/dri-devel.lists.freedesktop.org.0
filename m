Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E143F04D9
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 15:34:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF1EA8925D;
	Wed, 18 Aug 2021 13:33:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 720226E5C6
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 13:33:52 +0000 (UTC)
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5C0CE6109E;
 Wed, 18 Aug 2021 13:33:51 +0000 (UTC)
Date: Wed, 18 Aug 2021 09:33:49 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Kees Cook <keescook@chromium.org>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, "Gustavo
 A. R. Silva" <gustavoars@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-staging@lists.linux.dev,
 linux-block@vger.kernel.org, linux-kbuild@vger.kernel.org,
 clang-built-linux@googlegroups.com, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 50/63] tracing: Use memset_startat() to zero struct
 trace_iterator
Message-ID: <20210818093349.3144276b@oasis.local.home>
In-Reply-To: <20210818060533.3569517-51-keescook@chromium.org>
References: <20210818060533.3569517-1-keescook@chromium.org>
 <20210818060533.3569517-51-keescook@chromium.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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

On Tue, 17 Aug 2021 23:05:20 -0700
Kees Cook <keescook@chromium.org> wrote:

> In preparation for FORTIFY_SOURCE performing compile-time and run-time
> field bounds checking for memset(), avoid intentionally writing across
> neighboring fields.
> 
> Use memset_startat() to avoid confusing memset() about writing beyond
> the target struct member.
> 
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Ingo Molnar <mingo@redhat.com>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  kernel/trace/trace.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> index 13587e771567..9ff8c31975cd 100644
> --- a/kernel/trace/trace.c
> +++ b/kernel/trace/trace.c
> @@ -6691,9 +6691,7 @@ tracing_read_pipe(struct file *filp, char __user *ubuf,
>  		cnt = PAGE_SIZE - 1;
>  
>  	/* reset all but tr, trace, and overruns */
> -	memset(&iter->seq, 0,
> -	       sizeof(struct trace_iterator) -
> -	       offsetof(struct trace_iterator, seq));
> +	memset_startat(iter, 0, seq);

I can't find memset_startat() in mainline nor linux-next. I don't see it
in this thread either, but since this has 63 patches, I could have
easily missed it.

This change really should belong to a patch set that just introduces
memset_startat() (and perhaps memset_after()) and then updates all the
places that should use it. That way I can give it a proper review. In
other words, you should break this patch set up into smaller, more
digestible portions for the reviewers.

Thanks,

-- Steve



>  	cpumask_clear(iter->started);
>  	trace_seq_init(&iter->seq);
>  	iter->pos = -1;

