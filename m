Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA62CC8959
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 16:51:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E2710E8CA;
	Wed, 17 Dec 2025 15:51:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com
 [216.40.44.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA8710E8CA
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 15:51:09 +0000 (UTC)
Received: from omf17.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay02.hostedemail.com (Postfix) with ESMTP id 5A53413C06C;
 Wed, 17 Dec 2025 15:51:07 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by
 omf17.hostedemail.com (Postfix) with ESMTPA id 5FE4C17; 
 Wed, 17 Dec 2025 15:51:04 +0000 (UTC)
Date: Wed, 17 Dec 2025 10:52:39 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Xiang Gao <gxxa03070307@gmail.com>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, mhiramat@kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com,
 dhowells@redhat.com, kuba@kernel.org, brauner@kernel.org,
 akpm@linux-foundation.org, linux-trace-kernel@vger.kernel.org, gaoxiang17
 <gaoxiang17@xiaomi.com>
Subject: Re: [PATCH v7] dma-buf: add some tracepoints to debug.
Message-ID: <20251217105239.713bab41@gandalf.local.home>
In-Reply-To: <20251217105132.643300-1-gxxa03070307@gmail.com>
References: <20251217105132.643300-1-gxxa03070307@gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 5FE4C17
X-Stat-Signature: tcf4i4fk7xkn5yz87oudjo19k7x567yp
X-Spam-Status: No, score=-0.10
X-Rspamd-Server: rspamout08
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18v1MGMQqn5A+v+lnOyDc37S/bYYW5O1X4=
X-HE-Tag: 1765986664-498566
X-HE-Meta: U2FsdGVkX19l2sopADPfAmEBaW7hxuXdjWeW2Fum2wUj2NUV4lBXE+PFynuKUJ5oKDrF75CHCEYvp6h+4A1oSfzHuG3LrpV5q04LvkSHvZ7mYjzEhzT/19hmCsMlpUF/lKbJlatQHe7e5QiOKqg8Er6a3UU00d0JADxKpYBp/UzEPi/YnQPHvOPMZZExuzSnWUZNiGIPEDLriCOqtODyt5byUctZHVEwhLE13Uc3zTKFyRhg/hI7lbe4AZgcqHZaaahqxk7mcLmkCdW4lVHWMDi2cOS6aifGtOC78TZQH+naUZUQ2aySlgSw3eMiEDtqu0QaK9z26kITG8kJzn+BB/v9+GL7dTTz9yHBLs4/nRk8MKxOtH7WGlZ9I8qq2+tTVPlCoUYCfUhrk6n7Vf8jQMrdpG5/FlmzolipjIIjXmk=
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

On Wed, 17 Dec 2025 18:51:32 +0800
Xiang Gao <gxxa03070307@gmail.com> wrote:

> From: gaoxiang17 <gaoxiang17@xiaomi.com>
> 
> Since we can only inspect dmabuf by iterating over process FDs or the
> dmabuf_list, we need to add our own tracepoints to track its status in
> real time in production.
> 
> For example:
>    binder:3016_1-3102    [006] ...1.   255.126521: dma_buf_export: exp_name=qcom,system size=12685312 ino=2738
>    binder:3016_1-3102    [006] ...1.   255.126528: dma_buf_fd: exp_name=qcom,system size=12685312 ino=2738 fd=8
>    binder:3016_1-3102    [006] ...1.   255.126642: dma_buf_mmap_internal: exp_name=qcom,system size=28672 ino=2739
>      kworker/6:1-86      [006] ...1.   255.127194: dma_buf_put: exp_name=qcom,system size=12685312 ino=2738
>     RenderThread-9293    [006] ...1.   316.618179: dma_buf_get: exp_name=qcom,system size=12771328 ino=2762 fd=176
>     RenderThread-9293    [006] ...1.   316.618195: dma_buf_dynamic_attach: exp_name=qcom,system size=12771328 ino=2762 attachment:ffffff880a18dd00 is_dynamic=0 dev_name=kgsl-3d0
>     RenderThread-9293    [006] ...1.   318.878220: dma_buf_detach: exp_name=qcom,system size=12771328 ino=2762 attachment:ffffff880a18dd00 is_dynamic=0 dev_name=kgsl-3d0
> 
> Signed-off-by: Xiang Gao <gaoxiang17@xiaomi.com>
> ---
>  drivers/dma-buf/dma-buf.c      |  42 ++++++++-
>  include/trace/events/dma_buf.h | 157 +++++++++++++++++++++++++++++++++
>  2 files changed, 198 insertions(+), 1 deletion(-)
>  create mode 100644 include/trace/events/dma_buf.h
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 2bcf9ceca997..ce39bc19e13f 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -35,6 +35,25 @@
>  
>  #include "dma-buf-sysfs-stats.h"
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

Much better.

> +#define DMA_BUF_TRACE(FUNC, ...)					\
> +	do {											\
> +		if (FUNC##_enabled()) {						\
> +			guard(spinlock)(&dmabuf->name_lock);	\
> +			FUNC(__VA_ARGS__);						\
> +		}											\

Hmm, I wonder if we should also add:

		} else if (IS_ENABLED(CONFIG_LOCKDEP)) { \
			/* Expose this lock when lockdep is enabled */ \
			guard(spinlock)(&dmabuf->name_lock);	\
		}

This way, if there is any issue taking the lock, lockdep will flag it
without having to enable the tracepoint.

When LOCKDEP is not configured, the compiler should remove that block.

> +	} while (0)
> +
>  static inline int is_dma_buf_file(struct file *);
>  
>


> --- /dev/null
> +++ b/include/trace/events/dma_buf.h
> @@ -0,0 +1,157 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM dma_buf
> +
> +#if !defined(_TRACE_DMA_BUF_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _TRACE_DMA_BUF_H
> +
> +#include <linux/dma-buf.h>
> +#include <linux/tracepoint.h>
> +
> +DECLARE_EVENT_CLASS(dma_buf,
> +
> +	TP_PROTO(struct dma_buf *dmabuf),
> +
> +	TP_ARGS(dmabuf),
> +
> +	TP_STRUCT__entry(
> +		__string(exp_name, dmabuf->exp_name)
> +		__field(size_t, size)
> +		__field(ino_t, ino)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(exp_name);
> +		__entry->size = dmabuf->size;
> +		__entry->ino = dmabuf->file->f_inode->i_ino;
> +	),
> +
> +	TP_printk("exp_name=%s size=%zu ino=%lu",
> +		  __get_str(exp_name),
> +		  __entry->size,
> +		  __entry->ino)
> +);

For the rest of the patch, from a tracing point of view:

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve
