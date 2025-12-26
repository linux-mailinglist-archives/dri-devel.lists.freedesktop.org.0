Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1D3CDED21
	for <lists+dri-devel@lfdr.de>; Fri, 26 Dec 2025 17:42:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2FA310FFC6;
	Fri, 26 Dec 2025 16:42:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com
 [216.40.44.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC4110FFC6
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 16:42:21 +0000 (UTC)
Received: from omf08.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay07.hostedemail.com (Postfix) with ESMTP id A00F7161978;
 Fri, 26 Dec 2025 16:42:19 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by
 omf08.hostedemail.com (Postfix) with ESMTPA id C35DF20025; 
 Fri, 26 Dec 2025 16:42:16 +0000 (UTC)
Date: Fri, 26 Dec 2025 11:42:15 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Xiang Gao <gxxa03070307@gmail.com>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, mhiramat@kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com,
 dhowells@redhat.com, kuba@kernel.org, brauner@kernel.org,
 akpm@linux-foundation.org, linux-trace-kernel@vger.kernel.org, gaoxiang17
 <gaoxiang17@xiaomi.com>
Subject: Re: [PATCH v11] dma-buf: add some tracepoints to debug.
Message-ID: <20251226114215.02be95a3@gandalf.local.home>
In-Reply-To: <20251225121119.2194228-1-gxxa03070307@gmail.com>
References: <20251225121119.2194228-1-gxxa03070307@gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: rspamout06
X-Rspamd-Queue-Id: C35DF20025
X-Stat-Signature: sb3okpjn4xktd9o367eubuc7tjpuuo8w
X-Spam-Status: No, score=-0.12
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19y+kWzNgiBVYvXdKvKhYqoIT4fp8XtU9A=
X-HE-Tag: 1766767336-212146
X-HE-Meta: U2FsdGVkX19gExpci4Wk1XwFWElhAQMVFkVQMAJTMNsriPzFgQn959SDYSuxQJdsirEAsvSI6xQ0DiUq8KM/8ZkpbMBkNyu4pqs40H2rT4AqUiwb0VkaaCmlzz64evx4R68xA/OC59jcOftx01SCBKOoSDIz90pJqE1Q2CGYf4cYJL7CpHbs1VY8lWRAcuxaIdNi7jK1/9+11Ll2ud2gi0UVBeq2fqO9ukLjyXeCmNdPjYydj7HzROqKGW+1gzNLZOk9JKsKEuWQf28dqyVm4SGVIItuJocV7tLjFaCsmfBBXXw+xte/1t0/ygVua2bdW9a721Ni1NNgxpzHYxHxEHrDTJBtdUiBp+KIuLFnYAevQ8n5nmm1GqblgXxRVM7h/rdaIpyr1cHt4kkb4pegJOdAHIMUGyxwmVC+eGw99dRTwKqca51ET7Sp4izAra0zE17qM1x8aq4=
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

On Thu, 25 Dec 2025 20:11:19 +0800
Xiang Gao <gxxa03070307@gmail.com> wrote:

> From: gaoxiang17 <gaoxiang17@xiaomi.com>
>=20
> Since we can only inspect dmabuf by iterating over process FDs or the
> dmabuf_list, we need to add our own tracepoints to track its status in
> real time in production.
>=20
> For example:
>    binder:3016_1-3102    [006] ...1.   255.126521: dma_buf_export: exp_na=
me=3Dqcom,system size=3D12685312 ino=3D2738
>    binder:3016_1-3102    [006] ...1.   255.126528: dma_buf_fd: exp_name=
=3Dqcom,system size=3D12685312 ino=3D2738 fd=3D8
>    binder:3016_1-3102    [006] ...1.   255.126642: dma_buf_mmap_internal:=
 exp_name=3Dqcom,system size=3D28672 ino=3D2739
>      kworker/6:1-86      [006] ...1.   255.127194: dma_buf_put: exp_name=
=3Dqcom,system size=3D12685312 ino=3D2738
>     RenderThread-9293    [006] ...1.   316.618179: dma_buf_get: exp_name=
=3Dqcom,system size=3D12771328 ino=3D2762 fd=3D176
>     RenderThread-9293    [006] ...1.   316.618195: dma_buf_dynamic_attach=
: exp_name=3Dqcom,system size=3D12771328 ino=3D2762 attachment:ffffff880a18=
dd00 is_dynamic=3D0 dev_name=3Dkgsl-3d0
>     RenderThread-9293    [006] ...1.   318.878220: dma_buf_detach: exp_na=
me=3Dqcom,system size=3D12771328 ino=3D2762 attachment:ffffff880a18dd00 is_=
dynamic=3D0 dev_name=3Dkgsl-3d0
>=20
> Signed-off-by: Xiang Gao <gaoxiang17@xiaomi.com>
> ---
>=20
> Changes since v10: https://lore.kernel.org/all/20251224013455.1649879-1-g=
xxa03070307@gmail.com/

You only need to show the last revision (but since you haven't showed the
others, before it's good to show them now). But you also want to say "what =
changed"

For example:

- Used DEFINE_EVENT_CONDITION() to move the condition branch into the trace=
point.


> Changes since v9: https://lore.kernel.org/all/20251223032749.1371913-1-gx=
xa03070307@gmail.com/
> Changes since v8: https://lore.kernel.org/all/20251218062853.819744-1-gxx=
a03070307@gmail.com/
> Changes since v7: https://lore.kernel.org/all/20251217105132.643300-1-gxx=
a03070307@gmail.com/
> Changes since v6: https://lore.kernel.org/all/20251216063952.516364-1-gxx=
a03070307@gmail.com/
> Changes since v5: https://lore.kernel.org/all/20251201112148.843572-1-gxx=
a03070307@gmail.com/
> Changes since v4: https://lore.kernel.org/all/20251128085215.550100-1-gxx=
a03070307@gmail.com/
> Changes since v3: https://lore.kernel.org/all/20251127004352.376307-1-gxx=
a03070307@gmail.com/
> Changes since v2: https://lore.kernel.org/all/20251125162949.220488-1-gxx=
a03070307@gmail.com/
> Changes since v1: https://lore.kernel.org/all/20251124133648.72668-1-gxxa=
03070307@gmail.com/
>=20
>  drivers/dma-buf/dma-buf.c      |  48 +++++++++-
>  include/trace/events/dma_buf.h | 159 +++++++++++++++++++++++++++++++++
>  2 files changed, 205 insertions(+), 2 deletions(-)
>  create mode 100644 include/trace/events/dma_buf.h
>=20


> +/*
> + * dmabuf->name must be accessed with holding dmabuf->name_lock.
> + * we need to take the lock around the tracepoint call itself where
> + * it is called in the code.
> + *
> + * Note: FUNC##_enabled() is a static branch that will only
> + *       be set when the trace event is enabled.
> + */
> +#define DMA_BUF_TRACE(FUNC, ...)					\
> +	do {								\
> +		/* Always expose lock if lockdep is enabled */		\
> +		if (IS_ENABLED(CONFIG_LOCKDEP) || FUNC##_enabled()) {	\
> +			guard(spinlock)(&dmabuf->name_lock);		\
> +			FUNC(__VA_ARGS__);				\
> +		}							\
> +	} while (0)
> +
>  static inline int is_dma_buf_file(struct file *);
> =20

> +
> +DEFINE_EVENT_CONDITION(dma_buf_fd, dma_buf_fd,
> +
> +	TP_PROTO(struct dma_buf *dmabuf, int fd),
> +
> +	TP_ARGS(dmabuf, fd),
> +
> +	TP_CONDITION(fd >=3D 0)
> +);
> +


=46rom a tracing point of view (It's up to the dma maintainers to decide to
take this patch):

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve
