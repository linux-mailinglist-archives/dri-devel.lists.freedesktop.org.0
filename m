Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D265093F4
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 01:52:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5A9610F2C2;
	Wed, 20 Apr 2022 23:52:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C5D10F2CC
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 23:52:52 +0000 (UTC)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-2ef53391dbaso29245407b3.11
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 16:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=/gvN+QpYV7OLh/aEKqlMjgKuKem4NnQTY6rvHp91u8M=;
 b=sMA3qf7elQFHyscq19H1EpWDhaRa/I7ci48fDvM7QclHAcQqhkQtppdGXfJls2ija/
 MvtUn9QqCmeX2jXoh9aXOsqLWBhS95CDoqK3LEcBjVCrsZn3rhJ6gF2q3wsCJy6141rn
 HXihJHcxQFcvvrhcZnXaBAOeuPSzPOu5OP6IP7nryfGBwy/4jH9/4rQvdFweYWS4ZJ7o
 iFBWJJboWcdIl0qxM5PnlYsSTP+g7LGwTte4o0TcoqvscLQAxZbvTu5sODCDXJ8Q1tgA
 rw3i8pgp7ryIMuZezHAtqRxaB/qJTOcE2DcxLzUs4No3oDDwuF4FO1tWii3lpPVJrOBb
 r2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=/gvN+QpYV7OLh/aEKqlMjgKuKem4NnQTY6rvHp91u8M=;
 b=1v2ktBoz97bD1PhycQaIn4kYdxm98sBvwyixNjgQYqvu3hP9bBw5ZOHzGYa2mgdoHF
 f9TGWk52ha5Q9uvLFJcpwQ/A2Cjl+mAkGIgyjNfa485VccRHLzeAdBHNq1xBpvBKovim
 X8KaDG8RqqnL3//PrlWPinIOxkGxTckBAbURQpwHATwDjfJakyM1ecREi0PRRZmHXtQA
 faevq6NyBA/vqB7jAUoaalkTxeHVuio7lPLoeOMrNlApCrucjmvJhPlRK09XbSakD3DH
 tMve0OHrc5Z2b7HmaiDHAc280EvPNj/9fQNbMcuwLcLLc4PfS8CfTKejJ6GWthGtCRr6
 0cbw==
X-Gm-Message-State: AOAM531i2qe12ptfun3TAaZ6h98HEtmtTHimahSaPJnTsQeDIVHmb3Fo
 yJX1zKMdHGiUUe8VWUXPcZe3FZTT9wDnvtE=
X-Google-Smtp-Source: ABdhPJxTnlpo/iNagwkjPHbucxYH+CtEj8ohxJdE5GbeBLJ3G2GWRSAkV6DdlP8lN0r7l8RCXlv3YW3DGl+NeWs=
X-Received: from tj.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:53a])
 (user=tjmercier job=sendgmr) by 2002:a25:2d4d:0:b0:641:d14e:ff85 with SMTP id
 s13-20020a252d4d000000b00641d14eff85mr21685745ybe.128.1650498771646; Wed, 20
 Apr 2022 16:52:51 -0700 (PDT)
Date: Wed, 20 Apr 2022 23:52:23 +0000
In-Reply-To: <20220420235228.2767816-1-tjmercier@google.com>
Message-Id: <20220420235228.2767816-6-tjmercier@google.com>
Mime-Version: 1.0
References: <20220420235228.2767816-1-tjmercier@google.com>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
Subject: [RFC v5 5/6] binder: Add flags to relinquish ownership of fds
From: "T.J. Mercier" <tjmercier@google.com>
To: tjmercier@google.com, daniel@ffwll.ch, tj@kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joel@joelfernandes.org>, Christian Brauner <brauner@kernel.org>,
 Hridya Valsaraju <hridya@google.com>, Suren Baghdasaryan <surenb@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Kenny.Ho@amd.com, kaleshsingh@google.com, cmllamas@google.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, mkoutny@suse.com, skhan@linuxfoundation.org,
 jstultz@google.com, kernel-team@android.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hridya Valsaraju <hridya@google.com>

This patch introduces flags BINDER_FD_FLAG_SENDER_NO_NEED, and
BINDER_FDA_FLAG_SENDER_NO_NEED that a process sending an individual
fd or fd array to another process over binder IPC can set to relinquish
ownership of the fds being sent for memory accounting purposes. If the
flag is found to be set during the fd or fd array translation and the
fd is for a DMA-BUF, the buffer is uncharged from the sender's cgroup
and charged to the receiving process's cgroup instead.

It is up to the sending process to ensure that it closes the fds
regardless of whether the transfer failed or succeeded.

Most graphics shared memory allocations in Android are done by the
graphics allocator HAL process. On requests from clients, the HAL process
allocates memory and sends the fds to the clients over binder IPC.
The graphics allocator HAL will not retain any references to the
buffers. When the HAL sets *_FLAG_SENDER_NO_NEED for fd arrays holding
DMA-BUF fds, or individual fd objects, the gpu cgroup controller will
be able to correctly charge the buffers to the client processes instead
of the graphics allocator HAL.

Since this is a new feature exposed to userspace, the kernel and userspace
must be compatible for the accounting to work for transfers. In all cases
the allocation and transport of DMA buffers via binder will succeed, but
only when both the kernel supports, and userspace depends on this feature
will the transfer accounting work. The possible scenarios are detailed
below:

1. new kernel + old userspace
The kernel supports the feature but userspace does not use it. The old
userspace won't mount the new cgroup controller, accounting is not
performed, charge is not transferred.

2. old kernel + new userspace
The new cgroup controller is not supported by the kernel, accounting is
not performed, charge is not transferred.

3. old kernel + old userspace
Same as #2

4. new kernel + new userspace
Cgroup is mounted, feature is supported and used.

Signed-off-by: Hridya Valsaraju <hridya@google.com>
Signed-off-by: T.J. Mercier <tjmercier@google.com>

---
v5 changes
Support both binder_fd_array_object and binder_fd_object. This is
necessary because new versions of Android will use binder_fd_object
instead of binder_fd_array_object, and we need to support both.

Use the new, simpler dma_buf_transfer_charge API.

v3 changes
Remove android from title per Todd Kjos.

Use more common dual author commit message format per John Stultz.

Include details on behavior for all combinations of kernel/userspace
versions in changelog (thanks Suren Baghdasaryan) per Greg Kroah-Hartman.

v2 changes
Move dma-buf cgroup charge transfer from a dma_buf_op defined by every
heap to a single dma-buf function for all heaps per Daniel Vetter and
Christian K=C3=B6nig.
---
 drivers/android/binder.c            | 27 +++++++++++++++++++++++----
 drivers/dma-buf/dma-buf.c           |  4 ++--
 include/linux/dma-buf.h             |  2 +-
 include/uapi/linux/android/binder.h | 23 +++++++++++++++++++----
 4 files changed, 45 insertions(+), 11 deletions(-)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 8351c5638880..b07d50fe1c80 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -42,6 +42,7 @@
=20
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
=20
+#include <linux/dma-buf.h>
 #include <linux/fdtable.h>
 #include <linux/file.h>
 #include <linux/freezer.h>
@@ -2170,7 +2171,7 @@ static int binder_translate_handle(struct flat_binder=
_object *fp,
 	return ret;
 }
=20
-static int binder_translate_fd(u32 fd, binder_size_t fd_offset,
+static int binder_translate_fd(u32 fd, binder_size_t fd_offset, __u32 flag=
s,
 			       struct binder_transaction *t,
 			       struct binder_thread *thread,
 			       struct binder_transaction *in_reply_to)
@@ -2208,6 +2209,23 @@ static int binder_translate_fd(u32 fd, binder_size_t=
 fd_offset,
 		goto err_security;
 	}
=20
+	if (IS_ENABLED(CONFIG_CGROUP_GPU) && (flags & BINDER_FD_FLAG_SENDER_NO_NE=
ED)) {
+		if (is_dma_buf_file(file)) {
+			struct dma_buf *dmabuf =3D file->private_data;
+
+			ret =3D dma_buf_transfer_charge(dmabuf, target_proc->tsk);
+			if (ret)
+				pr_warn("%d:%d Unable to transfer DMA-BUF fd charge to %d\n",
+					proc->pid, thread->pid, target_proc->pid);
+		} else {
+			binder_user_error(
+				"%d:%d got transaction with SENDER_NO_NEED for non-dmabuf fd, %d\n",
+				proc->pid, thread->pid, fd);
+			ret =3D -EINVAL;
+			goto err_noneed;
+		}
+	}
+
 	/*
 	 * Add fixup record for this transaction. The allocation
 	 * of the fd in the target needs to be done from a
@@ -2226,6 +2244,7 @@ static int binder_translate_fd(u32 fd, binder_size_t =
fd_offset,
 	return ret;
=20
 err_alloc:
+err_noneed:
 err_security:
 	fput(file);
 err_fget:
@@ -2528,7 +2547,7 @@ static int binder_translate_fd_array(struct list_head=
 *pf_head,
=20
 		ret =3D copy_from_user(&fd, sender_ufda_base + sender_uoffset, sizeof(fd=
));
 		if (!ret)
-			ret =3D binder_translate_fd(fd, offset, t, thread,
+			ret =3D binder_translate_fd(fd, offset, fda->flags, t, thread,
 						  in_reply_to);
 		if (ret)
 			return ret > 0 ? -EINVAL : ret;
@@ -3179,8 +3198,8 @@ static void binder_transaction(struct binder_proc *pr=
oc,
 			struct binder_fd_object *fp =3D to_binder_fd_object(hdr);
 			binder_size_t fd_offset =3D object_offset +
 				(uintptr_t)&fp->fd - (uintptr_t)fp;
-			int ret =3D binder_translate_fd(fp->fd, fd_offset, t,
-						      thread, in_reply_to);
+			int ret =3D binder_translate_fd(fp->fd, fd_offset, fp->flags,
+						      t, thread, in_reply_to);
=20
 			fp->pad_binder =3D 0;
 			if (ret < 0 ||
diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index f3fb844925e2..36ed6cd4ddcc 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -31,7 +31,6 @@
=20
 #include "dma-buf-sysfs-stats.h"
=20
-static inline int is_dma_buf_file(struct file *);
=20
 struct dma_buf_list {
 	struct list_head head;
@@ -400,10 +399,11 @@ static const struct file_operations dma_buf_fops =3D =
{
 /*
  * is_dma_buf_file - Check if struct file* is associated with dma_buf
  */
-static inline int is_dma_buf_file(struct file *file)
+int is_dma_buf_file(struct file *file)
 {
 	return file->f_op =3D=3D &dma_buf_fops;
 }
+EXPORT_SYMBOL_NS_GPL(is_dma_buf_file, DMA_BUF);
=20
 static struct file *dma_buf_getfile(struct dma_buf *dmabuf, int flags)
 {
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 438ad8577b76..2b9812758fee 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -614,7 +614,7 @@ dma_buf_attachment_is_dynamic(struct dma_buf_attachment=
 *attach)
 {
 	return !!attach->importer_ops;
 }
-
+int is_dma_buf_file(struct file *file);
 struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
 					  struct device *dev);
 struct dma_buf_attachment *
diff --git a/include/uapi/linux/android/binder.h b/include/uapi/linux/andro=
id/binder.h
index 11157fae8a8e..b263cbb603ea 100644
--- a/include/uapi/linux/android/binder.h
+++ b/include/uapi/linux/android/binder.h
@@ -91,14 +91,14 @@ struct flat_binder_object {
 /**
  * struct binder_fd_object - describes a filedescriptor to be fixed up.
  * @hdr:	common header structure
- * @pad_flags:	padding to remain compatible with old userspace code
+ * @flags:	One or more BINDER_FD_FLAG_* flags
  * @pad_binder:	padding to remain compatible with old userspace code
  * @fd:		file descriptor
  * @cookie:	opaque data, used by user-space
  */
 struct binder_fd_object {
 	struct binder_object_header	hdr;
-	__u32				pad_flags;
+	__u32				flags;
 	union {
 		binder_uintptr_t	pad_binder;
 		__u32			fd;
@@ -107,6 +107,17 @@ struct binder_fd_object {
 	binder_uintptr_t		cookie;
 };
=20
+enum {
+	/**
+	 * @BINDER_FD_FLAG_SENDER_NO_NEED
+	 *
+	 * When set, the sender of a binder_fd_object wishes to relinquish owners=
hip of the fd for
+	 * memory accounting purposes. If the fd is for a DMA-BUF, the buffer is =
uncharged from the
+	 * sender's cgroup and charged to the receiving process's cgroup instead.
+	 */
+	BINDER_FD_FLAG_SENDER_NO_NEED =3D 0x2000,
+};
+
 /* struct binder_buffer_object - object describing a userspace buffer
  * @hdr:		common header structure
  * @flags:		one or more BINDER_BUFFER_* flags
@@ -141,7 +152,7 @@ enum {
=20
 /* struct binder_fd_array_object - object describing an array of fds in a =
buffer
  * @hdr:		common header structure
- * @pad:		padding to ensure correct alignment
+ * flags:		One or more BINDER_FDA_FLAG_* flags
  * @num_fds:		number of file descriptors in the buffer
  * @parent:		index in offset array to buffer holding the fd array
  * @parent_offset:	start offset of fd array in the buffer
@@ -162,12 +173,16 @@ enum {
  */
 struct binder_fd_array_object {
 	struct binder_object_header	hdr;
-	__u32				pad;
+	__u32				flags;
 	binder_size_t			num_fds;
 	binder_size_t			parent;
 	binder_size_t			parent_offset;
 };
=20
+enum {
+	BINDER_FDA_FLAG_SENDER_NO_NEED =3D BINDER_FD_FLAG_SENDER_NO_NEED,
+};
+
 /*
  * On 64-bit platforms where user code may run in 32-bits the driver must
  * translate the buffer (and local binder) addresses appropriately.
--=20
2.36.0.rc0.470.gd361397f0d-goog

