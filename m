Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9654D9D1292
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 15:02:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63FFC10E4DD;
	Mon, 18 Nov 2024 14:02:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qSPIZy55";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3BB210E4DD
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 14:02:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3DF8E5C59F3;
 Mon, 18 Nov 2024 14:01:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 354B8C4CECC;
 Mon, 18 Nov 2024 14:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1731938561;
 bh=pnoPWSE2kQs6V5C3DEIfZ9Urt1vmv3cikv+UcUv4nAE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qSPIZy55hgSbQcV2Y/3c9cSKVIs1vOBy8X68eH5HXg/ly9YK9Yujm/vOkaU8w29/F
 DmsUCteCi52uyzdZRDB2EQUkPdCJ8nWfB8ICVS/tttVSx/5qYW4oJd2VGnFYN6Ntko
 ex2u17fQx6L1FuaAUhdb8hMJ3SOP6K/qId5J/8Wk=
Date: Mon, 18 Nov 2024 15:02:11 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v1 4/4] misc: fastrpc: Add debugfs support for fastrpc
Message-ID: <2024111804-doze-reflected-0feb@gregkh>
References: <20241118084046.3201290-1-quic_ekangupt@quicinc.com>
 <20241118084046.3201290-5-quic_ekangupt@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118084046.3201290-5-quic_ekangupt@quicinc.com>
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

On Mon, Nov 18, 2024 at 02:10:46PM +0530, Ekansh Gupta wrote:
> Add changes to support debugfs. The fastrpc directory will be
> created which will carry debugfs files for all fastrpc processes.
> The information of fastrpc user and channel contexts are getting
> captured as part of this change.
> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc/Makefile        |   3 +-
>  drivers/misc/fastrpc/fastrpc_debug.c | 156 +++++++++++++++++++++++++++
>  drivers/misc/fastrpc/fastrpc_debug.h |  31 ++++++
>  drivers/misc/fastrpc/fastrpc_main.c  |  18 +++-
>  4 files changed, 205 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/misc/fastrpc/fastrpc_debug.c
>  create mode 100644 drivers/misc/fastrpc/fastrpc_debug.h
> 
> diff --git a/drivers/misc/fastrpc/Makefile b/drivers/misc/fastrpc/Makefile
> index 020d30789a80..4ff6b64166ae 100644
> --- a/drivers/misc/fastrpc/Makefile
> +++ b/drivers/misc/fastrpc/Makefile
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_QCOM_FASTRPC)	+= fastrpc.o
> -fastrpc-objs	:= fastrpc_main.o
> \ No newline at end of file
> +fastrpc-objs	:= fastrpc_main.o \
> +		fastrpc_debug.o

Only build this file if debugfs is enabled.

And again, "debug.c"?

> diff --git a/drivers/misc/fastrpc/fastrpc_debug.c b/drivers/misc/fastrpc/fastrpc_debug.c
> new file mode 100644
> index 000000000000..cdb4fc6845a8
> --- /dev/null
> +++ b/drivers/misc/fastrpc/fastrpc_debug.c
> @@ -0,0 +1,156 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2024 Qualcomm Innovation Center.
> +
> +#include <linux/debugfs.h>
> +#include <linux/seq_file.h>
> +#include "fastrpc_shared.h"
> +#include "fastrpc_debug.h"
> +
> +#ifdef CONFIG_DEBUG_FS

Please put the #ifdef in the .h file, not in the .c file.

> +void fastrpc_create_user_debugfs(struct fastrpc_user *fl)
> +{
> +	char cur_comm[TASK_COMM_LEN];
> +	int domain_id, size;
> +	char *debugfs_buf;
> +	struct dentry *debugfs_dir = fl->cctx->debugfs_dir;
> +
> +	memcpy(cur_comm, current->comm, TASK_COMM_LEN);
> +	cur_comm[TASK_COMM_LEN-1] = '\0';
> +	if (debugfs_dir != NULL) {
> +		domain_id = fl->cctx->domain_id;
> +		size = snprintf(NULL, 0, "%.10s_%d_%d_%d", cur_comm,
> +				current->pid, fl->tgid, domain_id) + 1;
> +		debugfs_buf = kzalloc(size, GFP_KERNEL);
> +		if (debugfs_buf == NULL)
> +			return;
> +		/*
> +		 * Use HLOS process name, HLOS PID, fastrpc user TGID,
> +		 * domain_id in debugfs filename to create unique file name
> +		 */
> +		snprintf(debugfs_buf, size, "%.10s_%d_%d_%d",
> +			cur_comm, current->pid, fl->tgid, domain_id);
> +		fl->debugfs_file = debugfs_create_file(debugfs_buf, 0644,
> +				debugfs_dir, fl, &fastrpc_debugfs_fops);

Why are you saving the debugfs file?  What do you need to do with it
that you can't just delete the whole directory, or look up the name
again in the future when removing it?

> +		kfree(debugfs_buf);
> +	}
> +}
> +
> +void fastrpc_remove_user_debugfs(struct fastrpc_user *fl)
> +{
> +	debugfs_remove(fl->debugfs_file);

Why remove just the file and not the whole directory?

> +}
> +
> +struct dentry *fastrpc_create_debugfs_dir(const char *name)
> +{
> +	return debugfs_create_dir(name, NULL);

At the root of debugfs?  Why is this function even needed?

> +}
> +
> +void fastrpc_remove_debugfs_dir(struct dentry *cctx_debugfs)
> +{
> +	debugfs_remove_recursive(cctx_debugfs);

See, you don't need the debugfs file reference at all, you don't do
anything with it.

And again, why are you wrapping basic debugfs functions with your own
version?  Please don't do that.

thanks,

greg k-h
