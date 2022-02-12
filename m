Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C93EE4B3392
	for <lists+dri-devel@lfdr.de>; Sat, 12 Feb 2022 08:19:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61D6710E508;
	Sat, 12 Feb 2022 07:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C243310E508
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Feb 2022 07:19:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0D13EB82A98;
 Sat, 12 Feb 2022 07:19:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7399BC340F6;
 Sat, 12 Feb 2022 07:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1644650370;
 bh=fhuC77eYCkAqlGGGwVlWE8Ct6apx/c0HPnyA5bPYWI0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SKf8uxp7qr1huh/b9rmhZA8SDUlctbo1KuMYNMSpxkSEX1IQtB4c/q6zzPaWGjI/L
 jOPB9Sjn/ArZ+a3qliza94LcQAQ2aBGXSpMP2Nk+2hbTEuTVMSB0WyYEStJda/8QrA
 gac9s/gJGTQWroDZ92oKLhXOlEXfPG2vnrw7mYv8=
Date: Sat, 12 Feb 2022 08:19:23 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "T.J. Mercier" <tjmercier@google.com>
Subject: Re: [RFC v2 6/6] android: binder: Add a buffer flag to relinquish
 ownership of fds
Message-ID: <Ygdfe3XSvN8iFuUc@kroah.com>
References: <20220211161831.3493782-1-tjmercier@google.com>
 <20220211161831.3493782-7-tjmercier@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220211161831.3493782-7-tjmercier@google.com>
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
Cc: Zefan Li <lizefan.x@bytedance.com>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, kaleshsingh@google.com,
 Joel Fernandes <joel@joelfernandes.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Martijn Coenen <maco@android.com>, Laura Abbott <labbott@redhat.com>,
 linux-media@vger.kernel.org, Todd Kjos <tkjos@android.com>,
 linaro-mm-sig@lists.linaro.org, Tejun Heo <tj@kernel.org>,
 cgroups@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 Christian Brauner <brauner@kernel.org>, Kenny.Ho@amd.com,
 linux-kernel@vger.kernel.org, Liam Mark <lmark@codeaurora.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Johannes Weiner <hannes@cmpxchg.org>,
 Hridya Valsaraju <hridya@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 11, 2022 at 04:18:29PM +0000, T.J. Mercier wrote:
> This patch introduces a buffer flag BINDER_BUFFER_FLAG_SENDER_NO_NEED
> that a process sending an fd array to another process over binder IPC
> can set to relinquish ownership of the fds being sent for memory
> accounting purposes. If the flag is found to be set during the fd array
> translation and the fd is for a DMA-BUF, the buffer is uncharged from
> the sender's cgroup and charged to the receiving process's cgroup
> instead.
> 
> It is up to the sending process to ensure that it closes the fds
> regardless of whether the transfer failed or succeeded.
> 
> Most graphics shared memory allocations in Android are done by the
> graphics allocator HAL process. On requests from clients, the HAL process
> allocates memory and sends the fds to the clients over binder IPC.
> The graphics allocator HAL will not retain any references to the
> buffers. When the HAL sets the BINDER_BUFFER_FLAG_SENDER_NO_NEED for fd
> arrays holding DMA-BUF fds, the gpu cgroup controller will be able to
> correctly charge the buffers to the client processes instead of the
> graphics allocator HAL.
> 
> From: Hridya Valsaraju <hridya@google.com>
> Signed-off-by: Hridya Valsaraju <hridya@google.com>
> Co-developed-by: T.J. Mercier <tjmercier@google.com>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> ---
> changes in v2
> - Move dma-buf cgroup charge transfer from a dma_buf_op defined by every
> heap to a single dma-buf function for all heaps per Daniel Vetter and
> Christian König.
> 
>  drivers/android/binder.c            | 26 ++++++++++++++++++++++++++
>  include/uapi/linux/android/binder.h |  1 +
>  2 files changed, 27 insertions(+)
> 
> diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> index 8351c5638880..f50d88ded188 100644
> --- a/drivers/android/binder.c
> +++ b/drivers/android/binder.c
> @@ -42,6 +42,7 @@
>  
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
> +#include <linux/dma-buf.h>
>  #include <linux/fdtable.h>
>  #include <linux/file.h>
>  #include <linux/freezer.h>
> @@ -2482,8 +2483,10 @@ static int binder_translate_fd_array(struct list_head *pf_head,
>  {
>  	binder_size_t fdi, fd_buf_size;
>  	binder_size_t fda_offset;
> +	bool transfer_gpu_charge = false;
>  	const void __user *sender_ufda_base;
>  	struct binder_proc *proc = thread->proc;
> +	struct binder_proc *target_proc = t->to_proc;
>  	int ret;
>  
>  	fd_buf_size = sizeof(u32) * fda->num_fds;
> @@ -2521,8 +2524,15 @@ static int binder_translate_fd_array(struct list_head *pf_head,
>  	if (ret)
>  		return ret;
>  
> +	if (IS_ENABLED(CONFIG_CGROUP_GPU) &&
> +		parent->flags & BINDER_BUFFER_FLAG_SENDER_NO_NEED)
> +		transfer_gpu_charge = true;
> +
>  	for (fdi = 0; fdi < fda->num_fds; fdi++) {
>  		u32 fd;
> +		struct dma_buf *dmabuf;
> +		struct gpucg *gpucg;
> +
>  		binder_size_t offset = fda_offset + fdi * sizeof(fd);
>  		binder_size_t sender_uoffset = fdi * sizeof(fd);
>  
> @@ -2532,6 +2542,22 @@ static int binder_translate_fd_array(struct list_head *pf_head,
>  						  in_reply_to);
>  		if (ret)
>  			return ret > 0 ? -EINVAL : ret;
> +
> +		if (!transfer_gpu_charge)
> +			continue;
> +
> +		dmabuf = dma_buf_get(fd);
> +		if (IS_ERR(dmabuf))
> +			continue;
> +
> +		gpucg = gpucg_get(target_proc->tsk);
> +		ret = dma_buf_charge_transfer(dmabuf, gpucg);
> +		if (ret) {
> +			pr_warn("%d:%d Unable to transfer DMA-BUF fd charge to %d",
> +				proc->pid, thread->pid, target_proc->pid);
> +			gpucg_put(gpucg);
> +		}
> +		dma_buf_put(dmabuf);
>  	}
>  	return 0;
>  }
> diff --git a/include/uapi/linux/android/binder.h b/include/uapi/linux/android/binder.h
> index 3246f2c74696..169fd5069a1a 100644
> --- a/include/uapi/linux/android/binder.h
> +++ b/include/uapi/linux/android/binder.h
> @@ -137,6 +137,7 @@ struct binder_buffer_object {
>  
>  enum {
>  	BINDER_BUFFER_FLAG_HAS_PARENT = 0x01,
> +	BINDER_BUFFER_FLAG_SENDER_NO_NEED = 0x02,
>  };
>  
>  /* struct binder_fd_array_object - object describing an array of fds in a buffer
> -- 
> 2.35.1.265.g69c8d7142f-goog
> 

How does userspace know that binder supports this new flag?  And where
is the userspace test for this new feature?  Isn't there a binder test
framework somewhere?

thanks,

greg k-h
