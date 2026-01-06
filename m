Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2435CFB36B
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 23:10:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A19010E24C;
	Tue,  6 Jan 2026 22:10:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com
 [216.40.44.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC9C10E24C
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 22:10:28 +0000 (UTC)
Received: from omf01.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay02.hostedemail.com (Postfix) with ESMTP id A177E13C358;
 Tue,  6 Jan 2026 22:10:25 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by
 omf01.hostedemail.com (Postfix) with ESMTPA id CBCED60011; 
 Tue,  6 Jan 2026 22:10:22 +0000 (UTC)
Date: Tue, 6 Jan 2026 17:10:47 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Xiang Gao <gxxa03070307@gmail.com>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, mhiramat@kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com,
 dhowells@redhat.com, kuba@kernel.org, brauner@kernel.org,
 akpm@linux-foundation.org, linux-trace-kernel@vger.kernel.org, gaoxiang17
 <gaoxiang17@xiaomi.com>
Subject: Re: [PATCH v12] dma-buf: add some tracepoints to debug.
Message-ID: <20260106171047.766d826f@gandalf.local.home>
In-Reply-To: <20251229031547.59272-1-gxxa03070307@gmail.com>
References: <20251229031547.59272-1-gxxa03070307@gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: CBCED60011
X-Stat-Signature: nxwhsk3uahg9fg6b4b4foaktayt5rcrt
X-Spam-Status: No, score=-0.18
X-Rspamd-Server: rspamout08
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19uyhsKHaO7BoxxPx6nTLgSBJzsvmK6sSQ=
X-HE-Tag: 1767737422-377508
X-HE-Meta: U2FsdGVkX1++sGP9isx8ZBi5GSpBQtv7kAzfi0YpXt/KKuPRRRkFsJjQFiEIx7rTHXbhyow8Z6Y2N+P/uryCm1M1fPpclOp9SXHgfUb1jhFKUwclnmvkBG1Six4hXSnPV1jLxx5FqZ+hxAQFoZRRm9EzlbuNWO+a4e520oCYj/7oXCoKHFZIU5j5eTUMnvpCEKBU0IASZxyzQw+fvqtRfHetkXlLH5nwLHgGBDfVk9bZzxaynZv8zxhSXLyYaOWDIyUD+ZyMZrGoodKeUDaeOdXQ7D4g7EGpzbPKfwBMB8b3jZUeIwTHFv9ATwsa3ra2hbq23hIrcBnrCqX2FbF2MTpllbP+iuILF+aQtuM/bf01IPHIUOg/K644iQK9Q218965zng+u1zBpg5in22LIzM/g2XyZ6fZBmvTnWHaMvbI=
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

On Mon, 29 Dec 2025 11:15:47 +0800
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

=46rom a tracing POV:

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve
