Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3264E50F2
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 12:02:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B820310E6A0;
	Wed, 23 Mar 2022 11:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 369 seconds by postgrey-1.36 at gabe;
 Tue, 22 Mar 2022 15:09:13 UTC
Received: from hyperium.qtmlabs.xyz (hyperium.qtmlabs.xyz
 [IPv6:2a02:c206:2066:3319::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE6E10E11C
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 15:09:13 +0000 (UTC)
Received: from dong.kernal.eu (unknown [14.177.213.244])
 by hyperium.qtmlabs.xyz (Postfix) with ESMTPSA id E56D282001B;
 Tue, 22 Mar 2022 16:03:01 +0100 (CET)
Received: from [100.115.92.204] (unknown [27.67.15.7])
 by dong.kernal.eu (Postfix) with ESMTPSA id 94B40446752E;
 Tue, 22 Mar 2022 22:02:54 +0700 (+07)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qtmlabs.xyz; s=syka;
 t=1647961375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sYlE5ayTt6o6RJzyKmEvdZzIfO0erIg9bnxSPs+kgXY=;
 b=gqm4m0jqNabEaSe5pJJomX4Tr2KCXtl608DuBgSnQ4ZNjuTcIKvStZ61/zX0KuFeC3jPwc
 4RJ0v876z3S5rblASpIBnQ6RGelzFcMj0HoEuyp0+448Nm3zlZRU93vL/tdVDUgc9bXrJZ
 xpRBe47x/wUqFmkqhzLqWM1Z5WgkYNT4AM2tQc7ii9KdDbuZoN834P/kSvDFVVDl/M5xMO
 j4VkVjOaD8c2c9jcYCtIs9QI1EvGrN2L0sNwarTGonDH76a5+pYBCpar2dwIj1/BVRqW4V
 bJGtkPieFNMDCyd5+MoDfPmC5zNxwS+oxN2xA/JJV43ZwqcyxA7BmCHwBh+Zgw==
Content-Type: multipart/alternative;
 boundary="------------Llxp10TD802HmwdhPeveMR0g"
Message-ID: <4ffe4926-3532-ab16-96ef-ff79b0dd3623@qtmlabs.xyz>
Date: Tue, 22 Mar 2022 22:02:48 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
From: msizanoen <msizanoen@qtmlabs.xyz>
Subject: Re: [PATCH 6/6] RFC: dma-buf: Add an API for importing sync files (v7)
To: Jason Ekstrand <jason@jlekstrand.net>, dri-devel@lists.freedesktop.org
References: <20210610210925.642582-1-jason@jlekstrand.net>
 <20210610210925.642582-7-jason@jlekstrand.net>
Content-Language: en-US
In-Reply-To: <20210610210925.642582-7-jason@jlekstrand.net>
X-Mailman-Approved-At: Wed, 23 Mar 2022 11:01:42 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------Llxp10TD802HmwdhPeveMR0g
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/11/21 04:09, Jason Ekstrand wrote:
> This patch is analogous to the previous sync file export patch in that
> it allows you to import a sync_file into a dma-buf.  Unlike the previous
> patch, however, this does add genuinely new functionality to dma-buf.
> Without this, the only way to attach a sync_file to a dma-buf is to
> submit a batch to your driver of choice which waits on the sync_file and
> claims to write to the dma-buf.  Even if said batch is a no-op, a submit
> is typically way more overhead than just attaching a fence.  A submit
> may also imply extra synchronization with other work because it happens
> on a hardware queue.
>
> In the Vulkan world, this is useful for dealing with the out-fence from
> vkQueuePresent.  Current Linux window-systems (X11, Wayland, etc.) all
> rely on dma-buf implicit sync.  Since Vulkan is an explicit sync API, we
> get a set of fences (VkSemaphores) in vkQueuePresent and have to stash
> those as an exclusive (write) fence on the dma-buf.  We handle it in
> Mesa today with the above mentioned dummy submit trick.  This ioctl
> would allow us to set it directly without the dummy submit.
>
> This may also open up possibilities for GPU drivers to move away from
> implicit sync for their kernel driver uAPI and instead provide sync
> files and rely on dma-buf import/export for communicating with other
> implicit sync clients.
>
> We make the explicit choice here to only allow setting RW fences which
> translates to an exclusive fence on the dma_resv.  There's no use for
> read-only fences for communicating with other implicit sync userspace
> and any such attempts are likely to be racy at best.  When we got to
> insert the RW fence, the actual fence we set as the new exclusive fence
> is a combination of the sync_file provided by the user and all the other
> fences on the dma_resv.  This ensures that the newly added exclusive
> fence will never signal before the old one would have and ensures that
> we don't break any dma_resv contracts.  We require userspace to specify
> RW in the flags for symmetry with the export ioctl and in case we ever
> want to support read fences in the future.
>
> There is one downside here that's worth documenting:  If two clients
> writing to the same dma-buf using this API race with each other, their
> actions on the dma-buf may happen in parallel or in an undefined order.
> Both with and without this API, the pattern is the same:  Collect all
> the fences on dma-buf, submit work which depends on said fences, and
> then set a new exclusive (write) fence on the dma-buf which depends on
> said work.  The difference is that, when it's all handled by the GPU
> driver's submit ioctl, the three operations happen atomically under the
> dma_resv lock.  If two userspace submits race, one will happen before
> the other.  You aren't guaranteed which but you are guaranteed that
> they're strictly ordered.  If userspace manages the fences itself, then
> these three operations happen separately and the two render operations
> may happen genuinely in parallel or get interleaved.  However, this is a
> case of userspace racing with itself.  As long as we ensure userspace
> can't back the kernel into a corner, it should be fine.
>
> v2 (Jason Ekstrand):
>   - Use a wrapper dma_fence_array of all fences including the new one
>     when importing an exclusive fence.
>
> v3 (Jason Ekstrand):
>   - Lock around setting shared fences as well as exclusive
>   - Mark SIGNAL_SYNC_FILE as a read-write ioctl.
>   - Initialize ret to 0 in dma_buf_wait_sync_file
>
> v4 (Jason Ekstrand):
>   - Use the new dma_resv_get_singleton helper
>
> v5 (Jason Ekstrand):
>   - Rename the IOCTLs to import/export rather than wait/signal
>   - Drop the WRITE flag and always get/set the exclusive fence
>
> v6 (Jason Ekstrand):
>   - Split import and export into separate patches
>   - New commit message
>
> v7 (Daniel Vetter):
>   - Fix the uapi header to use the right struct in the ioctl
>   - Use a separate dma_buf_import_sync_file struct
>   - Add kerneldoc for dma_buf_import_sync_file
>
> Signed-off-by: Jason Ekstrand<jason@jlekstrand.net>
> Cc: Christian König<christian.koenig@amd.com>
> Cc: Daniel Vetter<daniel.vetter@ffwll.ch>
> Cc: Sumit Semwal<sumit.semwal@linaro.org>
> Cc: Maarten Lankhorst<maarten.lankhorst@linux.intel.com>
> ---
>   drivers/dma-buf/dma-buf.c    | 36 ++++++++++++++++++++++++++++++++++++
>   include/uapi/linux/dma-buf.h | 22 ++++++++++++++++++++++
>   2 files changed, 58 insertions(+)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 831828d71b646..88afd723015a2 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -422,6 +422,40 @@ static long dma_buf_export_sync_file(struct dma_buf *dmabuf,
>   	put_unused_fd(fd);
>   	return ret;
>   }
> +
> +static long dma_buf_import_sync_file(struct dma_buf *dmabuf,
> +				     const void __user *user_data)
> +{
> +	struct dma_buf_import_sync_file arg;
> +	struct dma_fence *fence, *singleton = NULL;
> +	int ret = 0;
> +
> +	if (copy_from_user(&arg, user_data, sizeof(arg)))
> +		return -EFAULT;
> +
> +	if (arg.flags != DMA_BUF_SYNC_RW)
> +		return -EINVAL;
> +
> +	fence = sync_file_get_fence(arg.fd);
> +	if (!fence)
> +		return -EINVAL;
> +
> +	dma_resv_lock(dmabuf->resv, NULL);
> +
> +	singleton = dma_resv_get_singleton(dmabuf->resv, fence);
> +	if (IS_ERR(singleton)) {
> +		ret = PTR_ERR(singleton);
> +	} else if (singleton) {
> +		dma_resv_add_excl_fence(dmabuf->resv, singleton);
> +		dma_resv_add_shared_fence(dmabuf->resv, singleton);
Shouldn't there be a dma_fence_put(singleton) here?
> +	}
> +
> +	dma_resv_unlock(dmabuf->resv);
> +
> +	dma_fence_put(fence);
> +
> +	return ret;
> +}
>   #endif
>   
>   static long dma_buf_ioctl(struct file *file,
> @@ -470,6 +504,8 @@ static long dma_buf_ioctl(struct file *file,
>   #if IS_ENABLED(CONFIG_SYNC_FILE)
>   	case DMA_BUF_IOCTL_EXPORT_SYNC_FILE:
>   		return dma_buf_export_sync_file(dmabuf, (void __user *)arg);
> +	case DMA_BUF_IOCTL_IMPORT_SYNC_FILE:
> +		return dma_buf_import_sync_file(dmabuf, (const void __user *)arg);
>   #endif
>   
>   	default:
> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
> index 82f12a4640403..7382fd67351ba 100644
> --- a/include/uapi/linux/dma-buf.h
> +++ b/include/uapi/linux/dma-buf.h
> @@ -115,6 +115,27 @@ struct dma_buf_export_sync_file {
>   	__s32 fd;
>   };
>   
> +/**
> + * struct dma_buf_import_sync_file - Insert a sync_file into a dma-buf
> + *
> + * Userspace can perform a DMA_BUF_IOCTL_IMPORT_SYNC_FILE to insert a
> + * sync_file into a dma-buf for the purposes of implicit synchronization
> + * with other dma-buf consumers.  This allows clients using explicitly
> + * synchronized APIs such as Vulkan to inter-op with dma-buf consumers
> + * which expect implicit synchronization such as OpenGL or most media
> + * drivers/video.
> + */
> +struct dma_buf_import_sync_file {
> +	/**
> +	 * @flags: Read/write flags
> +	 *
> +	 * Must be DMA_BUF_SYNC_RW.
> +	 */
> +	__u32 flags;
> +	/** @fd: Sync file descriptor */
> +	__s32 fd;
> +};
> +
>   #define DMA_BUF_BASE		'b'
>   #define DMA_BUF_IOCTL_SYNC	_IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
>   
> @@ -125,5 +146,6 @@ struct dma_buf_export_sync_file {
>   #define DMA_BUF_SET_NAME_A	_IOW(DMA_BUF_BASE, 1, u32)
>   #define DMA_BUF_SET_NAME_B	_IOW(DMA_BUF_BASE, 1, u64)
>   #define DMA_BUF_IOCTL_EXPORT_SYNC_FILE	_IOWR(DMA_BUF_BASE, 2, struct dma_buf_export_sync_file)
> +#define DMA_BUF_IOCTL_IMPORT_SYNC_FILE	_IOW(DMA_BUF_BASE, 3, struct dma_buf_import_sync_file)
>   
>   #endif
--------------Llxp10TD802HmwdhPeveMR0g
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/11/21 04:09, Jason Ekstrand wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:%3C20210610210925.642582-7-jason@jlekstrand.net%3E">
      <pre class="moz-quote-pre" wrap="">This patch is analogous to the previous sync file export patch in that
it allows you to import a sync_file into a dma-buf.  Unlike the previous
patch, however, this does add genuinely new functionality to dma-buf.
Without this, the only way to attach a sync_file to a dma-buf is to
submit a batch to your driver of choice which waits on the sync_file and
claims to write to the dma-buf.  Even if said batch is a no-op, a submit
is typically way more overhead than just attaching a fence.  A submit
may also imply extra synchronization with other work because it happens
on a hardware queue.

In the Vulkan world, this is useful for dealing with the out-fence from
vkQueuePresent.  Current Linux window-systems (X11, Wayland, etc.) all
rely on dma-buf implicit sync.  Since Vulkan is an explicit sync API, we
get a set of fences (VkSemaphores) in vkQueuePresent and have to stash
those as an exclusive (write) fence on the dma-buf.  We handle it in
Mesa today with the above mentioned dummy submit trick.  This ioctl
would allow us to set it directly without the dummy submit.

This may also open up possibilities for GPU drivers to move away from
implicit sync for their kernel driver uAPI and instead provide sync
files and rely on dma-buf import/export for communicating with other
implicit sync clients.

We make the explicit choice here to only allow setting RW fences which
translates to an exclusive fence on the dma_resv.  There's no use for
read-only fences for communicating with other implicit sync userspace
and any such attempts are likely to be racy at best.  When we got to
insert the RW fence, the actual fence we set as the new exclusive fence
is a combination of the sync_file provided by the user and all the other
fences on the dma_resv.  This ensures that the newly added exclusive
fence will never signal before the old one would have and ensures that
we don't break any dma_resv contracts.  We require userspace to specify
RW in the flags for symmetry with the export ioctl and in case we ever
want to support read fences in the future.

There is one downside here that's worth documenting:  If two clients
writing to the same dma-buf using this API race with each other, their
actions on the dma-buf may happen in parallel or in an undefined order.
Both with and without this API, the pattern is the same:  Collect all
the fences on dma-buf, submit work which depends on said fences, and
then set a new exclusive (write) fence on the dma-buf which depends on
said work.  The difference is that, when it's all handled by the GPU
driver's submit ioctl, the three operations happen atomically under the
dma_resv lock.  If two userspace submits race, one will happen before
the other.  You aren't guaranteed which but you are guaranteed that
they're strictly ordered.  If userspace manages the fences itself, then
these three operations happen separately and the two render operations
may happen genuinely in parallel or get interleaved.  However, this is a
case of userspace racing with itself.  As long as we ensure userspace
can't back the kernel into a corner, it should be fine.

v2 (Jason Ekstrand):
 - Use a wrapper dma_fence_array of all fences including the new one
   when importing an exclusive fence.

v3 (Jason Ekstrand):
 - Lock around setting shared fences as well as exclusive
 - Mark SIGNAL_SYNC_FILE as a read-write ioctl.
 - Initialize ret to 0 in dma_buf_wait_sync_file

v4 (Jason Ekstrand):
 - Use the new dma_resv_get_singleton helper

v5 (Jason Ekstrand):
 - Rename the IOCTLs to import/export rather than wait/signal
 - Drop the WRITE flag and always get/set the exclusive fence

v6 (Jason Ekstrand):
 - Split import and export into separate patches
 - New commit message

v7 (Daniel Vetter):
 - Fix the uapi header to use the right struct in the ioctl
 - Use a separate dma_buf_import_sync_file struct
 - Add kerneldoc for dma_buf_import_sync_file

Signed-off-by: Jason Ekstrand <a class="moz-txt-link-rfc2396E" href="mailto:jason@jlekstrand.net">&lt;jason@jlekstrand.net&gt;</a>
Cc: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
Cc: Daniel Vetter <a class="moz-txt-link-rfc2396E" href="mailto:daniel.vetter@ffwll.ch">&lt;daniel.vetter@ffwll.ch&gt;</a>
Cc: Sumit Semwal <a class="moz-txt-link-rfc2396E" href="mailto:sumit.semwal@linaro.org">&lt;sumit.semwal@linaro.org&gt;</a>
Cc: Maarten Lankhorst <a class="moz-txt-link-rfc2396E" href="mailto:maarten.lankhorst@linux.intel.com">&lt;maarten.lankhorst@linux.intel.com&gt;</a>
---
 drivers/dma-buf/dma-buf.c    | 36 ++++++++++++++++++++++++++++++++++++
 include/uapi/linux/dma-buf.h | 22 ++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 831828d71b646..88afd723015a2 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -422,6 +422,40 @@ static long dma_buf_export_sync_file(struct dma_buf *dmabuf,
 	put_unused_fd(fd);
 	return ret;
 }
+
+static long dma_buf_import_sync_file(struct dma_buf *dmabuf,
+				     const void __user *user_data)
+{
+	struct dma_buf_import_sync_file arg;
+	struct dma_fence *fence, *singleton = NULL;
+	int ret = 0;
+
+	if (copy_from_user(&amp;arg, user_data, sizeof(arg)))
+		return -EFAULT;
+
+	if (arg.flags != DMA_BUF_SYNC_RW)
+		return -EINVAL;
+
+	fence = sync_file_get_fence(arg.fd);
+	if (!fence)
+		return -EINVAL;
+
+	dma_resv_lock(dmabuf-&gt;resv, NULL);
+
+	singleton = dma_resv_get_singleton(dmabuf-&gt;resv, fence);
+	if (IS_ERR(singleton)) {
+		ret = PTR_ERR(singleton);
+	} else if (singleton) {
+		dma_resv_add_excl_fence(dmabuf-&gt;resv, singleton);
+		dma_resv_add_shared_fence(dmabuf-&gt;resv, singleton);</pre>
    </blockquote>
    Shouldn't there be a <font face="monospace">dma_fence_put(singleton)</font>
    here?<br>
    <blockquote type="cite"
      cite="mid:%3C20210610210925.642582-7-jason@jlekstrand.net%3E">
      <pre class="moz-quote-pre" wrap="">+	}
+
+	dma_resv_unlock(dmabuf-&gt;resv);
+
+	dma_fence_put(fence);
+
+	return ret;
+}
 #endif
 
 static long dma_buf_ioctl(struct file *file,
@@ -470,6 +504,8 @@ static long dma_buf_ioctl(struct file *file,
 #if IS_ENABLED(CONFIG_SYNC_FILE)
 	case DMA_BUF_IOCTL_EXPORT_SYNC_FILE:
 		return dma_buf_export_sync_file(dmabuf, (void __user *)arg);
+	case DMA_BUF_IOCTL_IMPORT_SYNC_FILE:
+		return dma_buf_import_sync_file(dmabuf, (const void __user *)arg);
 #endif
 
 	default:
diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
index 82f12a4640403..7382fd67351ba 100644
--- a/include/uapi/linux/dma-buf.h
+++ b/include/uapi/linux/dma-buf.h
@@ -115,6 +115,27 @@ struct dma_buf_export_sync_file {
 	__s32 fd;
 };
 
+/**
+ * struct dma_buf_import_sync_file - Insert a sync_file into a dma-buf
+ *
+ * Userspace can perform a DMA_BUF_IOCTL_IMPORT_SYNC_FILE to insert a
+ * sync_file into a dma-buf for the purposes of implicit synchronization
+ * with other dma-buf consumers.  This allows clients using explicitly
+ * synchronized APIs such as Vulkan to inter-op with dma-buf consumers
+ * which expect implicit synchronization such as OpenGL or most media
+ * drivers/video.
+ */
+struct dma_buf_import_sync_file {
+	/**
+	 * @flags: Read/write flags
+	 *
+	 * Must be DMA_BUF_SYNC_RW.
+	 */
+	__u32 flags;
+	/** @fd: Sync file descriptor */
+	__s32 fd;
+};
+
 #define DMA_BUF_BASE		'b'
 #define DMA_BUF_IOCTL_SYNC	_IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
 
@@ -125,5 +146,6 @@ struct dma_buf_export_sync_file {
 #define DMA_BUF_SET_NAME_A	_IOW(DMA_BUF_BASE, 1, u32)
 #define DMA_BUF_SET_NAME_B	_IOW(DMA_BUF_BASE, 1, u64)
 #define DMA_BUF_IOCTL_EXPORT_SYNC_FILE	_IOWR(DMA_BUF_BASE, 2, struct dma_buf_export_sync_file)
+#define DMA_BUF_IOCTL_IMPORT_SYNC_FILE	_IOW(DMA_BUF_BASE, 3, struct dma_buf_import_sync_file)
 
 #endif
</pre>
    </blockquote>
  </body>
</html>

--------------Llxp10TD802HmwdhPeveMR0g--
