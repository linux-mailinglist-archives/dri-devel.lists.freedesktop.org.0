Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58708CDC84D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 15:29:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A0610F7B2;
	Wed, 24 Dec 2025 14:29:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com
 [216.40.44.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E1CE10F7B1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 14:29:21 +0000 (UTC)
Received: from omf20.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay01.hostedemail.com (Postfix) with ESMTP id C29FD13117;
 Wed, 24 Dec 2025 14:29:19 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by
 omf20.hostedemail.com (Postfix) with ESMTPA id DB6C520025; 
 Wed, 24 Dec 2025 14:29:16 +0000 (UTC)
Date: Wed, 24 Dec 2025 09:31:09 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Xiang Gao <gxxa03070307@gmail.com>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, mhiramat@kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com,
 dhowells@redhat.com, kuba@kernel.org, brauner@kernel.org,
 akpm@linux-foundation.org, linux-trace-kernel@vger.kernel.org, gaoxiang17
 <gaoxiang17@xiaomi.com>
Subject: Re: [PATCH v10] dma-buf: add some tracepoints to debug.
Message-ID: <20251224093109.2fbbe3eb@gandalf.local.home>
In-Reply-To: <20251224013455.1649879-1-gxxa03070307@gmail.com>
References: <20251224013455.1649879-1-gxxa03070307@gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: a1f9h8mczhiypyrc9nax5roha5mehkw9
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: DB6C520025
X-Spam-Status: No, score=-0.11
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/VWMdqsvQo2J9WjH900tycJ9+JWRBlC3o=
X-HE-Tag: 1766586556-832599
X-HE-Meta: U2FsdGVkX1+3lwMfPTagKWldqY17UsKg76fQJZVkCrs5vxCIsqnyTtR6v0W+Lw6QXlS3bWaKNvLlR5onG9V3A1BdBmj5oJKGQModxmMyUa5xSYsANVCkZHdzEKf4SSWEDXTl2uIsQfvpT0sSxqcR7IaSgG24DTtgHszdEN4g01AXKHA6grdg9I/4tki9pYnAcGiBMOpH78ZsHG3DSVT+iokWOpFtN7KQX9Bxfd5J3Bah0SDhdLzGTlJoRIgv8QeBg3M7Z2DTAxTV1DhXGOrPH8ysnR3Fp0HOEuI85xWukv4zuOEedU+HHDyyTSN75PY+3+8gUR1M0A5VwFdYekBcBaYkclvXAbQ6sgmA5Xial2mqMefxlLFf3gHKczBiWMeaGKV9fBvtNPU=
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

On Wed, 24 Dec 2025 09:34:55 +0800
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

BTW, it's sometimes nice to have in new versions of a patch with a list of
changes below the above "---" (here):

Changes since v9: https://lore.kernel.org/all/20251223032749.1371913-1-gxxa03070307@gmail.com/

- <list changes here>

That way it keeps a nice history of all the versions of the patch.
No need to resend. Just giving you some advice for future patches.

>  drivers/dma-buf/dma-buf.c      |  49 +++++++++-
>  include/trace/events/dma_buf.h | 157 +++++++++++++++++++++++++++++++++
>  2 files changed, 204 insertions(+), 2 deletions(-)
>  create mode 100644 include/trace/events/dma_buf.h
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index edaa9e4ee4ae..5e6f65cd0306 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -35,6 +35,26 @@
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
> +#define DMA_BUF_TRACE(FUNC, ...)					\
> +	do {											\
> +		/* Always expose lock if lockdep is enabled */ 	\
> +		if (IS_ENABLED(CONFIG_LOCKDEP) || FUNC##_enabled()) {						\
> +			guard(spinlock)(&dmabuf->name_lock);	\
> +			FUNC(__VA_ARGS__);						\
> +		}											\
> +	} while (0)

I'm curious. Are the above backslashes lined up nicely in the code?

> +
>  static inline int is_dma_buf_file(struct file *);
>  
>  static DEFINE_MUTEX(dmabuf_list_mutex);
> @@ -220,6 +240,8 @@ static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
>  	    dmabuf->size >> PAGE_SHIFT)
>  		return -EINVAL;
>  
> +	DMA_BUF_TRACE(trace_dma_buf_mmap_internal, dmabuf);
> +
>  	return dmabuf->ops->mmap(dmabuf, vma);
>  }
>  
> @@ -745,6 +767,8 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>  
>  	__dma_buf_list_add(dmabuf);
>  
> +	DMA_BUF_TRACE(trace_dma_buf_export, dmabuf);
> +
>  	return dmabuf;
>  
>  err_dmabuf:
> @@ -768,10 +792,16 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_export, "DMA_BUF");
>   */
>  int dma_buf_fd(struct dma_buf *dmabuf, int flags)
>  {
> +	int fd;
> +
>  	if (!dmabuf || !dmabuf->file)
>  		return -EINVAL;
>  
> -	return FD_ADD(flags, dmabuf->file);
> +	fd = FD_ADD(flags, dmabuf->file);
> +	if (fd >= 0)
> +		DMA_BUF_TRACE(trace_dma_buf_fd, dmabuf, fd);

Instead of adding the above if statement in the code, you can make the
event conditional (See below). Then this could just be:

-	return FD_ADD(flags, dmabuf->file);
+	fd = FD_ADD(flags, dmabuf->file);
+	DMA_BUF_TRACE(trace_dma_buf_fd, dmabuf, fd);

And not have the condition hit when tracing isn't enabled.

> +
> +	return fd;
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_fd, "DMA_BUF");
>  


[..]

> diff --git a/include/trace/events/dma_buf.h b/include/trace/events/dma_buf.h
> new file mode 100644
> index 000000000000..2c9ba8533467
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
> +		__string(	exp_name,		dmabuf->exp_name)
> +		__field(	size_t,			size)
> +		__field(	ino_t,			ino)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(exp_name);
> +		__entry->size	= dmabuf->size;
> +		__entry->ino	= dmabuf->file->f_inode->i_ino;
> +	),
> +
> +	TP_printk("exp_name=%s size=%zu ino=%lu",
> +		  __get_str(exp_name),
> +		  __entry->size,
> +		  __entry->ino)
> +);
> +
> +DECLARE_EVENT_CLASS(dma_buf_attach_dev,
> +
> +	TP_PROTO(struct dma_buf *dmabuf, struct dma_buf_attachment *attach,
> +		bool is_dynamic, struct device *dev),
> +
> +	TP_ARGS(dmabuf, attach, is_dynamic, dev),
> +
> +	TP_STRUCT__entry(
> +		__string(	dev_name,			dev_name(dev))
> +		__string(	exp_name,			dmabuf->exp_name)
> +		__field(	size_t,				size)
> +		__field(	ino_t,				ino)
> +		__field(	struct dma_buf_attachment *,	attach)
> +		__field(	bool,				is_dynamic)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(dev_name);
> +		__assign_str(exp_name);
> +		__entry->size		= dmabuf->size;
> +		__entry->ino		= dmabuf->file->f_inode->i_ino;
> +		__entry->is_dynamic	= is_dynamic;
> +		__entry->attach		= attach;
> +	),
> +
> +	TP_printk("exp_name=%s size=%zu ino=%lu attachment:%p is_dynamic=%d dev_name=%s",
> +		  __get_str(exp_name),
> +		  __entry->size,
> +		  __entry->ino,
> +		  __entry->attach,
> +		  __entry->is_dynamic,
> +		  __get_str(dev_name))
> +);
> +
> +DECLARE_EVENT_CLASS(dma_buf_fd,
> +
> +	TP_PROTO(struct dma_buf *dmabuf, int fd),
> +
> +	TP_ARGS(dmabuf, fd),
> +
> +	TP_STRUCT__entry(
> +		__string(	exp_name,		dmabuf->exp_name)
> +		__field(	size_t,			size)
> +		__field(	ino_t,			ino)
> +		__field(	int,			fd)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(exp_name);
> +		__entry->size	= dmabuf->size;
> +		__entry->ino	= dmabuf->file->f_inode->i_ino;
> +		__entry->fd	= fd;
> +	),
> +
> +	TP_printk("exp_name=%s size=%zu ino=%lu fd=%d",
> +		  __get_str(exp_name),
> +		  __entry->size,
> +		  __entry->ino,
> +		  __entry->fd)
> +);
> +

[..]

> +DEFINE_EVENT(dma_buf_fd, dma_buf_fd,
> +
> +	TP_PROTO(struct dma_buf *dmabuf, int fd),
> +
> +	TP_ARGS(dmabuf, fd)
> +);

If fd needs to be greater or equal to zero, you can make the above:

DEFINE_EVENT_CONDITION(dma_buf_fd, dma_buf_fd,

	TP_PROTO(struct dma_buf *dmabuf, int fd),

	TP_ARGS(dmabuf, fd),

	TP_CONDITION(fd >= 0)
);

This places the "fd >= 0" into the code that is called when the tracepoint
is enabled. If the condition isn't met, then the tracepoint doesn't get
recorded.

-- Steve

> +
> +DEFINE_EVENT(dma_buf_fd, dma_buf_get,
> +
> +	TP_PROTO(struct dma_buf *dmabuf, int fd),
> +
> +	TP_ARGS(dmabuf, fd)
> +);
> +
> +#endif /* _TRACE_DMA_BUF_H */
> +
> +/* This part must be outside protection */
> +#include <trace/define_trace.h>

