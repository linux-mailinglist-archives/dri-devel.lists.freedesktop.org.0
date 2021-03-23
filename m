Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C72346701
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 18:57:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B7C6EC97;
	Tue, 23 Mar 2021 17:57:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C15F86EC80
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 17:57:27 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id w70so17925550oie.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 10:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=RaYV/cqr1zgV3N+FJHEQE/h/dDQLh4JdU51y1hxz6oA=;
 b=pZ8LGKmne4L2HjB2jCL8Mie82CiiskMKPfN5iNXcP8fYpCvOPIoHrskGWJTkrYACtq
 iF6EFWBSvc0xP/e8NCY9yr8Plg1zWcdOcT2Ev1oWJEWAQe3KExoE9mXyMTztvM1Utrkj
 SRIKIoDHPmRtqeKoham60Eq9dXGmJPLSqsCKPcLVTBy7rniCWJx+/c9G+sGxggJUpecp
 9aER9CVVtl0oTowGAZfrn5teBYSVA2iNVhYRtDqHu1lPSNglDYwkF3/IB2Omqnt+s6SA
 1d9v7LwzlwzYHgIlAIUqkQxMhBK23N9s/FAxUPlLCRa3VwFRDKDhGJdgFOhzbt7tqhin
 o0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=RaYV/cqr1zgV3N+FJHEQE/h/dDQLh4JdU51y1hxz6oA=;
 b=ZZmiW95RKJJ9HbwgZTvNOs9pDllSSwxRF/rj4l1CaQ6QofOtswZul0ww6VPtYAR4sf
 OG6VSgowT0R17tnq/OcFzzb0wiAOQIsVFqbgkAmkhOVCRcSGmZcPRZ9WqeXY//LuZLM9
 6R03Gmrh+GXYw+y9KcuRuS6UML/fAYfRIBJLF5t1AB9BnjTa85A/8YYr8C6tEv2Nujr8
 JqrNkQoxlHNRwXKC42zsapFlnZ7G0QDneB5wZzJ5IZYm1oM1KHKV3+M1hYr49YhSibsh
 vQ40MA2+c9qyBb44+gzw8tZ7K3YjlgcqjBtNyjxNoBhgeHofDJa6Pu8/btetzCBj+QGt
 QhFQ==
X-Gm-Message-State: AOAM533NKmDZ3D8wDLo/IlvonmwVX/kqNj19rOcXESsNfmwg3nYgbmw8
 LXf/vuYMNT+Rnz3rkPCBLgTd0k5UYqE9cB662AoCbZx66to=
X-Google-Smtp-Source: ABdhPJy2BDZP6dgA6rTW8Su+0/zzLvu/Yp1wKpNWyzCm5LKDUJFdKQam4InIZxM2OR7J4cJmUn5009C9OZNWL9YvI7s=
X-Received: by 2002:aca:4d55:: with SMTP id a82mr4159913oib.23.1616522246726; 
 Tue, 23 Mar 2021 10:57:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210316045322.2020294-1-jason@jlekstrand.net>
 <20210317221940.2146688-1-jason@jlekstrand.net>
 <20210317221940.2146688-4-jason@jlekstrand.net>
In-Reply-To: <20210317221940.2146688-4-jason@jlekstrand.net>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue, 23 Mar 2021 12:57:15 -0500
Message-ID: <CAOFGe96L3Bc-hZbh+mH8Hz8EEbxDKMO+6xmX5EU3H5-auP8_wA@mail.gmail.com>
Subject: Re: [PATCH 3/3] dma-buf: Add an API for exporting sync files (v8)
To: Maling list - DRI developers <dri-devel@lists.freedesktop.org>, 
 ML mesa-dev <mesa-dev@lists.freedesktop.org>, 
 "wayland-devel @ lists . freedesktop . org"
 <wayland-devel@lists.freedesktop.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding mesa-dev and wayland-devel for broader circulation.

On Wed, Mar 17, 2021 at 5:19 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> Modern userspace APIs like Vulkan are built on an explicit
> synchronization model.  This doesn't always play nicely with the
> implicit synchronization used in the kernel and assumed by X11 and
> Wayland.  The client -> compositor half of the synchronization isn't too
> bad, at least on intel, because we can control whether or not i915
> synchronizes on the buffer and whether or not it's considered written.
>
> The harder part is the compositor -> client synchronization when we get
> the buffer back from the compositor.  We're required to be able to
> provide the client with a VkSemaphore and VkFence representing the point
> in time where the window system (compositor and/or display) finished
> using the buffer.  With current APIs, it's very hard to do this in such
> a way that we don't get confused by the Vulkan driver's access of the
> buffer.  In particular, once we tell the kernel that we're rendering to
> the buffer again, any CPU waits on the buffer or GPU dependencies will
> wait on some of the client rendering and not just the compositor.
>
> This new IOCTL solves this problem by allowing us to get a snapshot of
> the implicit synchronization state of a given dma-buf in the form of a
> sync file.  It's effectively the same as a poll() or I915_GEM_WAIT only,
> instead of CPU waiting directly, it encapsulates the wait operation, at
> the current moment in time, in a sync_file so we can check/wait on it
> later.  As long as the Vulkan driver does the sync_file export from the
> dma-buf before we re-introduce it for rendering, it will only contain
> fences from the compositor or display.  This allows to accurately turn
> it into a VkFence or VkSemaphore without any over- synchronization.
>
> v2 (Jason Ekstrand):
>  - Use a wrapper dma_fence_array of all fences including the new one
>    when importing an exclusive fence.
>
> v3 (Jason Ekstrand):
>  - Lock around setting shared fences as well as exclusive
>  - Mark SIGNAL_SYNC_FILE as a read-write ioctl.
>  - Initialize ret to 0 in dma_buf_wait_sync_file
>
> v4 (Jason Ekstrand):
>  - Use the new dma_resv_get_singleton helper
>
> v5 (Jason Ekstrand):
>  - Rename the IOCTLs to import/export rather than wait/signal
>  - Drop the WRITE flag and always get/set the exclusive fence
>
> v6 (Jason Ekstrand):
>  - Drop the sync_file import as it was all-around sketchy and not nearly
>    as useful as import.
>  - Re-introduce READ/WRITE flag support for export
>  - Rework the commit message
>
> v7 (Jason Ekstrand):
>  - Require at least one sync flag
>  - Fix a refcounting bug: dma_resv_get_excl() doesn't take a reference
>  - Use _rcu helpers since we're accessing the dma_resv read-only
>
> v8 (Jason Ekstrand):
>  - Return -ENOMEM if the sync_file_create fails
>  - Predicate support on IS_ENABLED(CONFIG_SYNC_FILE)
>
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> ---
>  drivers/dma-buf/dma-buf.c    | 62 ++++++++++++++++++++++++++++++++++++
>  include/uapi/linux/dma-buf.h |  6 ++++
>  2 files changed, 68 insertions(+)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index f264b70c383eb..a5e4b0b6a049c 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -20,6 +20,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/module.h>
>  #include <linux/seq_file.h>
> +#include <linux/sync_file.h>
>  #include <linux/poll.h>
>  #include <linux/dma-resv.h>
>  #include <linux/mm.h>
> @@ -362,6 +363,62 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
>         return ret;
>  }
>
> +#if IS_ENABLED(CONFIG_SYNC_FILE)
> +static long dma_buf_export_sync_file(struct dma_buf *dmabuf,
> +                                    void __user *user_data)
> +{
> +       struct dma_buf_sync_file arg;
> +       struct dma_fence *fence = NULL;
> +       struct sync_file *sync_file;
> +       int fd, ret;
> +
> +       if (copy_from_user(&arg, user_data, sizeof(arg)))
> +               return -EFAULT;
> +
> +       if (arg.flags & ~DMA_BUF_SYNC_RW)
> +               return -EINVAL;
> +
> +       if ((arg.flags & DMA_BUF_SYNC_RW) == 0)
> +               return -EINVAL;
> +
> +       fd = get_unused_fd_flags(O_CLOEXEC);
> +       if (fd < 0)
> +               return fd;
> +
> +       if (arg.flags & DMA_BUF_SYNC_WRITE) {
> +               ret = dma_resv_get_singleton_rcu(dmabuf->resv, &fence);
> +               if (ret)
> +                       goto err_put_fd;
> +       } else if (arg.flags & DMA_BUF_SYNC_READ) {
> +               fence = dma_resv_get_excl_rcu(dmabuf->resv);
> +       }
> +
> +       if (!fence)
> +               fence = dma_fence_get_stub();
> +
> +       sync_file = sync_file_create(fence);
> +
> +       dma_fence_put(fence);
> +
> +       if (!sync_file) {
> +               ret = -ENOMEM;
> +               goto err_put_fd;
> +       }
> +
> +       fd_install(fd, sync_file->file);
> +
> +       arg.fd = fd;
> +       if (copy_to_user(user_data, &arg, sizeof(arg)))
> +               return -EFAULT;
> +
> +       return 0;
> +
> +err_put_fd:
> +       put_unused_fd(fd);
> +       return ret;
> +}
> +#endif
> +
>  static long dma_buf_ioctl(struct file *file,
>                           unsigned int cmd, unsigned long arg)
>  {
> @@ -405,6 +462,11 @@ static long dma_buf_ioctl(struct file *file,
>         case DMA_BUF_SET_NAME_B:
>                 return dma_buf_set_name(dmabuf, (const char __user *)arg);
>
> +#if IS_ENABLED(CONFIG_SYNC_FILE)
> +       case DMA_BUF_IOCTL_EXPORT_SYNC_FILE:
> +               return dma_buf_export_sync_file(dmabuf, (void __user *)arg);
> +#endif
> +
>         default:
>                 return -ENOTTY;
>         }
> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
> index 7f30393b92c3b..9bce1e8bd31d3 100644
> --- a/include/uapi/linux/dma-buf.h
> +++ b/include/uapi/linux/dma-buf.h
> @@ -37,6 +37,11 @@ struct dma_buf_sync {
>
>  #define DMA_BUF_NAME_LEN       32
>
> +struct dma_buf_sync_file {
> +       __u32 flags;
> +       __s32 fd;
> +};
> +
>  #define DMA_BUF_BASE           'b'
>  #define DMA_BUF_IOCTL_SYNC     _IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
>
> @@ -46,5 +51,6 @@ struct dma_buf_sync {
>  #define DMA_BUF_SET_NAME       _IOW(DMA_BUF_BASE, 1, const char *)
>  #define DMA_BUF_SET_NAME_A     _IOW(DMA_BUF_BASE, 1, u32)
>  #define DMA_BUF_SET_NAME_B     _IOW(DMA_BUF_BASE, 1, u64)
> +#define DMA_BUF_IOCTL_EXPORT_SYNC_FILE _IOWR(DMA_BUF_BASE, 2, struct dma_buf_sync_file)
>
>  #endif
> --
> 2.29.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
