Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1253C663711
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 03:07:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E90310E104;
	Tue, 10 Jan 2023 02:07:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1200 seconds by postgrey-1.36 at gabe;
 Tue, 10 Jan 2023 02:07:35 UTC
Received: from r3-22.sinamail.sina.com.cn (r3-22.sinamail.sina.com.cn
 [202.108.3.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD96710E104
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 02:07:35 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([114.249.61.130])
 by sina.com (172.16.97.32) with ESMTP
 id 63BCC2D800032B1C; Tue, 10 Jan 2023 09:43:54 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 490466629363
From: Hillf Danton <hdanton@sina.com>
To: "T.J. Mercier" <tjmercier@google.com>
Subject: Re: [PATCH 3/4] binder: Add flags to relinquish ownership of fds
Date: Tue, 10 Jan 2023 09:47:20 +0800
Message-Id: <20230110014720.281-1-hdanton@sina.com>
In-Reply-To: <20230109213809.418135-4-tjmercier@google.com>
References: <20230109213809.418135-1-tjmercier@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, Tejun Heo <tj@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9 Jan 2023 21:38:06 +0000 T.J. Mercier <tjmercier@google.com>
>  
> @@ -2275,6 +2276,26 @@ static int binder_translate_fd(u32 fd, binder_size_t fd_offset,
>  		goto err_security;
>  	}
>  
> +	if (IS_ENABLED(CONFIG_MEMCG) && (flags & BINDER_FD_FLAG_XFER_CHARGE)) {
> +		struct dma_buf *dmabuf;
> +
> +		if (unlikely(!is_dma_buf_file(file))) {
> +			binder_user_error(
> +				"%d:%d got transaction with XFER_CHARGE for non-dmabuf fd, %d\n",
> +				proc->pid, thread->pid, fd);
> +			ret = -EINVAL;
> +			goto err_dmabuf;
> +		}

It barely makes sense to expose is_dma_buf_file() only for this.
> +
> +		dmabuf = file->private_data;
> +		ret = dma_buf_transfer_charge(dmabuf, target_proc->tsk);
> +		if (ret) {
> +			pr_warn("%d:%d Unable to transfer DMA-BUF fd charge to %d\n",
> +				proc->pid, thread->pid, target_proc->pid);
> +			goto err_xfer;
> +		}
> +	}
> +

This whole hunk should go to dma-buf instead by adding change to
dma_buf_transfer_charge() for instance.
