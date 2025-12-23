Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E8DCD9FE6
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 17:42:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4995E10E0C3;
	Tue, 23 Dec 2025 16:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com
 [216.40.44.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C095310E0C3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 16:42:39 +0000 (UTC)
Received: from omf14.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay09.hostedemail.com (Postfix) with ESMTP id 53D3A8ADC1;
 Tue, 23 Dec 2025 16:42:37 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by
 omf14.hostedemail.com (Postfix) with ESMTPA id 44A942D; 
 Tue, 23 Dec 2025 16:42:34 +0000 (UTC)
Date: Tue, 23 Dec 2025 11:44:24 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Xiang Gao <gxxa03070307@gmail.com>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, mhiramat@kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com,
 dhowells@redhat.com, kuba@kernel.org, brauner@kernel.org,
 akpm@linux-foundation.org, linux-trace-kernel@vger.kernel.org, gaoxiang17
 <gaoxiang17@xiaomi.com>
Subject: Re: [PATCH v9] dma-buf: add some tracepoints to debug.
Message-ID: <20251223114424.1c539f7a@gandalf.local.home>
In-Reply-To: <20251223032749.1371913-1-gxxa03070307@gmail.com>
References: <20251223032749.1371913-1-gxxa03070307@gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: grxkiozmi3msuufb6c4ww3d6b1ijzhoh
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 44A942D
X-Spam-Status: No, score=-0.10
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+yIprTkm+nIvFVTiCDFSCukILDs9di80M=
X-HE-Tag: 1766508154-450411
X-HE-Meta: U2FsdGVkX1/RMwvb/I3i66TmfvJP/QYAChkQEo2YHhW8EcjemzG38cb5Wi0oW9rzAnkMwaEDpLPpnWxB+lFGcG97mdgnpnzmrWP679NlNX8FNGrdVhWTd65GLMBMoMUr+SjHIm1x2OKOW3x3Yv5CQqb+xZt2qB7wjbS1JbKgAmebXsOyZB7tdTKDStorhsE6A6YcLG7G2iDftxGHuAgcuZBnDFIVSxVQONazrjqzWjA/HgVOvmkCxGokE7ftA5fACYCUn8q6WO482an5qtVkv15JdqiiOObr0sXCp29/2DixiBpihMzyh/7Q8Y5Eio/BGGEmiOHfDVWrXM5VvhaHMuxVHi0VGfeK
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

On Tue, 23 Dec 2025 11:27:49 +0800
Xiang Gao <gxxa03070307@gmail.com> wrote:

>  
> +#define CREATE_TRACE_POINTS
> +#include <trace/events/dma_buf.h>
> +
> +/*
> + * dmabuf->name must be accessed with holding dmabuf->name_lock.
> + * we need to take the lock around the tracepoint call itself where
> + * it is called in the code.
> + *
> + * Note: FUNC##_enabled() is a static branch that will only
> + *       be set when the trace event is enabled.
> + */
> +#define DMA_BUF_TRACE(FUNC, ...)					\
> +	do {											\
> +		if (FUNC##_enabled()) {						\
> +			guard(spinlock)(&dmabuf->name_lock);	\
> +			FUNC(__VA_ARGS__);						\
> +		} else if (IS_ENABLED(CONFIG_LOCKDEP)) {	\
> +			/* Expose this lock when lockdep is enabled */	\
> +			guard(spinlock)(&dmabuf->name_lock);	\
> +		}											\
> +	} while (0)
> +

I hate to make another comment here, but I was just thinking that this can
be made to look a little nicer. Basically, we want to make sure that when
LOCKDEP is active, we always take the lock. But we also need to take the
lock when tracing is enabled. The tracepoint itself is a static branch,
which means it is a nop when not active, so there's no real problem with
calling it. Thus, this could look better as:

#define DMA_BUF_TRACE(FUNC, ...)					\
	do {								\
		/* Always expose lock if lockdep is enabled */		\
		if (IS_ENABLED(CONFIG_LOCKDEP) || FUNC##_enabled()) {	\
			guard(spinlock)(&dmabuf->name_lock);		\
			FUNC(__VA_ARGS__);				\
		}							\
	} while (0)


-- Steve
