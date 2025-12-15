Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C3ACBFBF1
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 21:29:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A23810E02F;
	Mon, 15 Dec 2025 20:29:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com
 [216.40.44.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0715310E02F
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 20:29:04 +0000 (UTC)
Received: from omf08.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay05.hostedemail.com (Postfix) with ESMTP id 6EF1D587CD;
 Mon, 15 Dec 2025 20:29:02 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by
 omf08.hostedemail.com (Postfix) with ESMTPA id 88B9320027; 
 Mon, 15 Dec 2025 20:28:59 +0000 (UTC)
Date: Mon, 15 Dec 2025 15:30:31 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Xiang Gao <gxxa03070307@gmail.com>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, mhiramat@kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com,
 dhowells@redhat.com, kuba@kernel.org, brauner@kernel.org,
 akpm@linux-foundation.org, linux-trace-kernel@vger.kernel.org, gaoxiang17
 <gaoxiang17@xiaomi.com>
Subject: Re: [PATCH v5] dma-buf: add some tracepoints to debug.
Message-ID: <20251215153031.1a5e6d9f@gandalf.local.home>
In-Reply-To: <20251201112148.843572-1-gxxa03070307@gmail.com>
References: <20251201112148.843572-1-gxxa03070307@gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Stat-Signature: toii5izcyyq1aks869a8pijmyda7aegn
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 88B9320027
X-Spam-Status: No, score=-0.11
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+qMeEoee5LPAQ6YVQJX12qT1DsmumRLoY=
X-HE-Tag: 1765830539-300393
X-HE-Meta: U2FsdGVkX18aFf4OwvXYzVDWTA/eSboFoNzkl1eo9bEGSeiVOyuMh4NpyTVeyESiGAibqkNif2VoWI1CMmcKZ0RHh8MXurG9qjh5/YgxB9NJV9iATMpearTPpkhj1TxUgALmhp0LLxUkLjVVsN7A7kVw3jtNLbiy8bCRJdVyOIi/Xwrz48AHXp6dvA2hJgfrX6QURmHouwxi1r6h9STfqAr0E1q56kMRqast6rhijxUdGqH3EniVOBXqf35WhRhRG9e+I7K30JMQElVYGLHBLOl0YhoFEf11W8qM4uq4/N3C3OZI4WjuJO60oHpDgb4a/YYQ0kN8HTWpThl02+HA9Bd5rOlZCrDH
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

On Mon,  1 Dec 2025 19:21:48 +0800
Xiang Gao <gxxa03070307@gmail.com> wrote:

> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -35,6 +35,17 @@
> =20
>  #include "dma-buf-sysfs-stats.h"
> =20
> +#define CREATE_TRACE_POINTS
> +#include <trace/events/dma_buf.h>
> +

=46rom a tracing point of view I'm OK with this patch, but this macro really
needs a comment.

-- Steve


> +#define DMA_BUF_TRACE(FUNC, ...)                  \
> +    do {                                          \
> +        if (FUNC##_enabled()) {                   \
> +            guard(spinlock)(&dmabuf->name_lock); \
> +            FUNC(__VA_ARGS__);                    \
> +        }                                         \
> +    } while (0)
> +
>  static inline int is_dma_buf_file(struct file *);
> =20
>  static DEFINE_MUTEX(dmabuf_list_mutex);
