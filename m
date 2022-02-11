Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 445D64B30EC
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 23:40:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31C7F10EBBC;
	Fri, 11 Feb 2022 22:40:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D893010EAC7
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 16:19:07 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id
 a12-20020a056902056c00b0061dc0f2a94aso19724141ybt.6
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 08:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=yvZODKlks7uSqzZPx/QuM2FpvgBeZ2Sk/1s0RF7z1Xc=;
 b=ec1Yy1HYUYsk8sjBv+NO8SvcoXRcbLd5uiv9OPxDsNNur23ie7DmHnG9pRO3ilNRJc
 1WvllX32ogWUY0ES0dpiEE0PkkZAqEtGHDkIOKsW2C7o8MPYg3yfWoNyM+WdEiwbD35T
 Wm/nnsqgsS4c257blD2h2q3WLvab8g25Dj83ORJVcsTjGYJyVICqcM/zkGknDnaHwtni
 S4ZDOVi8GlgnNuE1vqJ9LyP4yV9NB3a+ujEPEu7FgVA5ADIEY9Yho6UbQZlXhZiHM4fN
 WFpGmfjmGs9WnZVI4xN8jGbbfCl8+QIJaWkRzPaFr5hx6+gvkC/2/iIAsFPFyG5TXVMH
 vNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=yvZODKlks7uSqzZPx/QuM2FpvgBeZ2Sk/1s0RF7z1Xc=;
 b=eio8TaciWYnGn3F/YJSVyHDSaO6m2HtCm1qhXsdyUl/m1MxJWSsmz0WjEL3Q3yFEUF
 huL3Q1KYhplp5A43H7DKbRQzoq+xqIopwac9HyW7016J8NIcX5b1tgGEgBpEczkmjPtw
 wzgHJ2n0Wc9uwUcdCn9M0KlZFaMR5UgFkvqFwXOCuf9+fuiTqqEnJRNF4z3rEr9c8Trx
 y4iWQeq/QSKi4ck3PpBskNOYAH4/HrBloZLtIAu5SJJ3bqu0/2wMZxI505PiBozpYXEQ
 VlG8dP4FZEOyT38+/Kl+WFY9oxIxDJRzlMeOH8ce08V49pH9UiWUWQtOBfiV7BnUPA56
 +fTA==
X-Gm-Message-State: AOAM531Ck6GIu+X1RkDCDLf0GL0kRqyDIbBO9yXPzlkvhexTzvwlxDyO
 S/DrNn0XH4Wb5BppW5RMdLTXJXJRDmpc1EI=
X-Google-Smtp-Source: ABdhPJyzRZpguSr08v/JtkpnGzL6Z+Soi+F7TZB5Jn0SLwqv4tx2BBp/V2mC7+AUgYjetHM8LbPfONmE/Uc6VpY=
X-Received: from tj2.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:187])
 (user=tjmercier job=sendgmr) by 2002:a81:2d03:: with SMTP id
 t3mr2496118ywt.215.1644596347024; Fri, 11 Feb 2022 08:19:07 -0800 (PST)
Date: Fri, 11 Feb 2022 16:18:28 +0000
In-Reply-To: <20220211161831.3493782-1-tjmercier@google.com>
Message-Id: <20220211161831.3493782-6-tjmercier@google.com>
Mime-Version: 1.0
References: <20220211161831.3493782-1-tjmercier@google.com>
X-Mailer: git-send-email 2.35.1.265.g69c8d7142f-goog
Subject: [RFC v2 5/6] dmabuf: Add gpu cgroup charge transfer function
From: "T.J. Mercier" <tjmercier@google.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joel@joelfernandes.org>, Christian Brauner <brauner@kernel.org>,
 Hridya Valsaraju <hridya@google.com>, Suren Baghdasaryan <surenb@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, 
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <john.stultz@linaro.org>, 
 Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>, 
 Johannes Weiner <hannes@cmpxchg.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 11 Feb 2022 22:40:02 +0000
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
Cc: linux-doc@vger.kernel.org, Kenny.Ho@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 kaleshsingh@google.com, cgroups@vger.kernel.org,
 "T.J. Mercier" <tjmercier@google.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The dma_buf_charge_transfer function provides a way for processes to
transfer charge of a buffer to a different process. This is essential
for the cases where a central allocator process does allocations for
various subsystems, hands over the fd to the client who requested the
memory and drops all references to the allocated memory.

From: Hridya Valsaraju <hridya@google.com>
Signed-off-by: Hridya Valsaraju <hridya@google.com>
Co-developed-by: T.J. Mercier <tjmercier@google.com>
Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
changes in v2
- Move dma-buf cgroup charge transfer from a dma_buf_op defined by every
heap to a single dma-buf function for all heaps per Daniel Vetter and
Christian K=C3=B6nig.

 drivers/dma-buf/dma-buf.c | 48 +++++++++++++++++++++++++++++++++++++++
 include/linux/dma-buf.h   |  2 ++
 2 files changed, 50 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 83d0d1b91547..55e1b982f840 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1374,6 +1374,54 @@ void dma_buf_vunmap(struct dma_buf *dmabuf, struct d=
ma_buf_map *map)
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_vunmap, DMA_BUF);
=20
+/**
+ * dma_buf_charge_transfer - Change the GPU cgroup to which the provided d=
ma_buf
+ * is charged.
+ * @dmabuf:	[in]	buffer whose charge will be migrated to a different GPU
+ *			cgroup
+ * @gpucg:	[in]	the destination GPU cgroup for dmabuf's charge
+ *
+ * Only tasks that belong to the same cgroup the buffer is currently charg=
ed to
+ * may call this function, otherwise it will return -EPERM.
+ *
+ * Returns 0 on success, or a negative errno code otherwise.
+ */
+int dma_buf_charge_transfer(struct dma_buf *dmabuf, struct gpucg *gpucg)
+{
+#ifdef CONFIG_CGROUP_GPU
+	struct gpucg *current_gpucg;
+	int ret =3D 0;
+
+	/*
+	 * Verify that the cgroup of the process requesting the transfer is the
+	 * same as the one the buffer is currently charged to.
+	 */
+	current_gpucg =3D gpucg_get(current);
+	mutex_lock(&dmabuf->lock);
+	if (current_gpucg !=3D dmabuf->gpucg) {
+		ret =3D -EPERM;
+		goto err;
+	}
+
+	ret =3D gpucg_try_charge(gpucg, dmabuf->gpucg_dev, dmabuf->size);
+	if (ret)
+		goto err;
+
+	dmabuf->gpucg =3D gpucg;
+
+	/* uncharge the buffer from the cgroup it's currently charged to. */
+	gpucg_uncharge(current_gpucg, dmabuf->gpucg_dev, dmabuf->size);
+
+err:
+	mutex_unlock(&dmabuf->lock);
+	gpucg_put(current_gpucg);
+	return ret;
+#else
+	return 0;
+#endif /* CONFIG_CGROUP_GPU */
+}
+EXPORT_SYMBOL_NS_GPL(dma_buf_charge_transfer, DMA_BUF);
+
 #ifdef CONFIG_DEBUG_FS
 static int dma_buf_debug_show(struct seq_file *s, void *unused)
 {
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 742f29c3daaf..85c940c08867 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -646,4 +646,6 @@ int dma_buf_mmap(struct dma_buf *, struct vm_area_struc=
t *,
 		 unsigned long);
 int dma_buf_vmap(struct dma_buf *dmabuf, struct dma_buf_map *map);
 void dma_buf_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map);
+
+int dma_buf_charge_transfer(struct dma_buf *dmabuf, struct gpucg *gpucg);
 #endif /* __DMA_BUF_H__ */
--=20
2.35.1.265.g69c8d7142f-goog

