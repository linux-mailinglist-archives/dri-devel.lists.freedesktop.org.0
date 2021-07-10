Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9F43C32F4
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 07:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 538F26EAD2;
	Sat, 10 Jul 2021 05:10:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA5996EAD2
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jul 2021 05:10:42 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id
 132-20020a25158a0000b029055791ebe1e6so14418028ybv.20
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 22:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=6tW4U4W+M5Q9a7hEOvLNXBNqiO2VzjTmy/E0pzjtni8=;
 b=izsa5rVePDMRnv9gXUgJM5JDfwEKUTFqTkWClk7ibQkEoVgCSi3grTzQ3hkxlKirBq
 bZJwCOSvqc38fxkFlG6VcLsNfP49/E+6kcvpDpHxY/u3ON7tuV+BTczgroEsVVbzmfMT
 wkRse6Dowc8JEluc0DeZFcRMFhYMkgpjzSHT4C/YTFSyO9RT9o9++dm82LsKpfnN/xub
 JvTvEsjUnBkDIodCVnkCM/yanR172guDb5wDxy3XCpBGPOJ6P+1eMcehkQhreuMx8Ahj
 ufLjuF+wvYwIDDr3+F9eaV47/Oa2/cCihY0qe4hK8HZC6620nLZK4DcpdXA69R4lriUS
 XfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=6tW4U4W+M5Q9a7hEOvLNXBNqiO2VzjTmy/E0pzjtni8=;
 b=npOKL8wXtTknbJO6VeKMQz+kVmO3GaY+Vw2x5Ka0ChAYI9LQPruU2STl0B2EdzmoQh
 QOkqBBjZEWOYszglpV6v/neoStxYdnpMlx1CCfm3/9/tK+2CstH8lnQVinn7gpRPbctu
 PlWq5l4DiPdtk0pA6z9pFUkTn91Tj+UEDQztpZGJXxSZiKQPdAaoHbcAveEINw0JGbcS
 KHxrDQQ5IyAn1IdkcUFGT6lbrBjRZb80WzArFExTMFVMU6oNG4jzCBBS8n2sMeC4KkZM
 hPuWJdxMTxPjhUOm/XHBSqi4bDyRw3ZnBVusY97PXcO3JQWoLgvEUeUnhDBkZR5TMGpP
 36lQ==
X-Gm-Message-State: AOAM533P/VutgII9tByJcLzsH7Nk8bm+7y1nFY4Z1RXcvHWUwbgvrbtI
 ehUWuY016wr207neFFzj/GrjzzbV2zo=
X-Google-Smtp-Source: ABdhPJyJrczkRmhH/qXGrgt/Sk2CsDUTJN9iO7OAgXi5y504LUYz/G0g6KzCyzyU24u66S2nQAnAjDPvxx8=
X-Received: from hridya.mtv.corp.google.com
 ([2620:15c:211:200:6d15:d8fd:a01e:e439])
 (user=hridya job=sendgmr) by 2002:a25:3b86:: with SMTP id
 i128mr51665265yba.363.1625893841864; 
 Fri, 09 Jul 2021 22:10:41 -0700 (PDT)
Date: Fri,  9 Jul 2021 22:10:24 -0700
Message-Id: <20210710051027.42828-1-hridya@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
Subject: [PATCH] dma-buf: Delete the DMA-BUF attachment sysfs statistics
From: Hridya Valsaraju <hridya@google.com>
To: daniel@ffwll.ch, Sumit Semwal <sumit.semwal@linaro.org>, 
 "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>,
 Hridya Valsaraju <hridya@google.com>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: surenb@google.com, kernel-team@android.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DMA-BUF attachment statistics form a subset of the DMA-BUF
sysfs statistics that recently merged to the drm-misc tree.
Since there has been a reported a performance regression due to the
overhead of sysfs directory creation/teardown during
dma_buf_attach()/dma_buf_detach(), this patch deletes the DMA-BUF
attachment statistics from sysfs.

Fixes: bdb8d06dfefd (dmabuf: Add the capability to expose DMA-BUF stats
in sysfs)
Signed-off-by: Hridya Valsaraju <hridya@google.com>
---

Hello all,

One of our partners recently reported a perf regression in a driver
which was being caused due to the overhead of setup/teardown of the
sysfs attachment statistics in the dma_buf_attach()/dma_buf_detach()
invocations. Since the driver's latency requirements were of the order
of microseconds(~100us), the overhead was significant.
Since this indicates that the solution might not work well for
all DMA-BUF importers, I think the right thing to do might be to delete
the same before it reaches upstream and becomes ABI :( I apologize for
the inconvenience.

This patch is based on the drm-misc-next branch. Please feel free to
let me know if you would prefer that I send a full revert and new patch that
adds the rest of the statistics.

Regards,
Hridya

 .../ABI/testing/sysfs-kernel-dmabuf-buffers   |  28 ----
 drivers/dma-buf/dma-buf-sysfs-stats.c         | 140 +-----------------
 drivers/dma-buf/dma-buf-sysfs-stats.h         |  27 ----
 drivers/dma-buf/dma-buf.c                     |  16 --
 include/linux/dma-buf.h                       |  17 ---
 5 files changed, 4 insertions(+), 224 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers b/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
index a243984ed420..5d3bc997dc64 100644
--- a/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
+++ b/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
@@ -22,31 +22,3 @@ KernelVersion:	v5.13
 Contact:	Hridya Valsaraju <hridya@google.com>
 Description:	This file is read-only and specifies the size of the DMA-BUF in
 		bytes.
-
-What:		/sys/kernel/dmabuf/buffers/<inode_number>/attachments
-Date:		May 2021
-KernelVersion:	v5.13
-Contact:	Hridya Valsaraju <hridya@google.com>
-Description:	This directory will contain subdirectories representing every
-		attachment of the DMA-BUF.
-
-What:		/sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attachment_uid>
-Date:		May 2021
-KernelVersion:	v5.13
-Contact:	Hridya Valsaraju <hridya@google.com>
-Description:	This directory will contain information on the attached device
-		and the number of current distinct device mappings.
-
-What:		/sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attachment_uid>/device
-Date:		May 2021
-KernelVersion:	v5.13
-Contact:	Hridya Valsaraju <hridya@google.com>
-Description:	This file is read-only and is a symlink to the attached device's
-		sysfs entry.
-
-What:		/sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attachment_uid>/map_counter
-Date:		May 2021
-KernelVersion:	v5.13
-Contact:	Hridya Valsaraju <hridya@google.com>
-Description:	This file is read-only and contains a map_counter indicating the
-		number of distinct device mappings of the attachment.
diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dma-buf-sysfs-stats.c
index a2638e84199c..053baadcada9 100644
--- a/drivers/dma-buf/dma-buf-sysfs-stats.c
+++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
@@ -40,14 +40,11 @@
  *
  * * ``/sys/kernel/dmabuf/buffers/<inode_number>/exporter_name``
  * * ``/sys/kernel/dmabuf/buffers/<inode_number>/size``
- * * ``/sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach_uid>/device``
- * * ``/sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach_uid>/map_counter``
  *
- * The information in the interface can also be used to derive per-exporter and
- * per-device usage statistics. The data from the interface can be gathered
- * on error conditions or other important events to provide a snapshot of
- * DMA-BUF usage. It can also be collected periodically by telemetry to monitor
- * various metrics.
+ * The information in the interface can also be used to derive per-exporter
+ * statistics. The data from the interface can be gathered on error conditions
+ * or other important events to provide a snapshot of DMA-BUF usage.
+ * It can also be collected periodically by telemetry to monitor various metrics.
  *
  * Detailed documentation about the interface is present in
  * Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers.
@@ -121,120 +118,6 @@ static struct kobj_type dma_buf_ktype = {
 	.default_groups = dma_buf_stats_default_groups,
 };
 
-#define to_dma_buf_attach_entry_from_kobj(x) container_of(x, struct dma_buf_attach_sysfs_entry, kobj)
-
-struct dma_buf_attach_stats_attribute {
-	struct attribute attr;
-	ssize_t (*show)(struct dma_buf_attach_sysfs_entry *sysfs_entry,
-			struct dma_buf_attach_stats_attribute *attr, char *buf);
-};
-#define to_dma_buf_attach_stats_attr(x) container_of(x, struct dma_buf_attach_stats_attribute, attr)
-
-static ssize_t dma_buf_attach_stats_attribute_show(struct kobject *kobj,
-						   struct attribute *attr,
-						   char *buf)
-{
-	struct dma_buf_attach_stats_attribute *attribute;
-	struct dma_buf_attach_sysfs_entry *sysfs_entry;
-
-	attribute = to_dma_buf_attach_stats_attr(attr);
-	sysfs_entry = to_dma_buf_attach_entry_from_kobj(kobj);
-
-	if (!attribute->show)
-		return -EIO;
-
-	return attribute->show(sysfs_entry, attribute, buf);
-}
-
-static const struct sysfs_ops dma_buf_attach_stats_sysfs_ops = {
-	.show = dma_buf_attach_stats_attribute_show,
-};
-
-static ssize_t map_counter_show(struct dma_buf_attach_sysfs_entry *sysfs_entry,
-				struct dma_buf_attach_stats_attribute *attr,
-				char *buf)
-{
-	return sysfs_emit(buf, "%u\n", sysfs_entry->map_counter);
-}
-
-static struct dma_buf_attach_stats_attribute map_counter_attribute =
-	__ATTR_RO(map_counter);
-
-static struct attribute *dma_buf_attach_stats_default_attrs[] = {
-	&map_counter_attribute.attr,
-	NULL,
-};
-ATTRIBUTE_GROUPS(dma_buf_attach_stats_default);
-
-static void dma_buf_attach_sysfs_release(struct kobject *kobj)
-{
-	struct dma_buf_attach_sysfs_entry *sysfs_entry;
-
-	sysfs_entry = to_dma_buf_attach_entry_from_kobj(kobj);
-	kfree(sysfs_entry);
-}
-
-static struct kobj_type dma_buf_attach_ktype = {
-	.sysfs_ops = &dma_buf_attach_stats_sysfs_ops,
-	.release = dma_buf_attach_sysfs_release,
-	.default_groups = dma_buf_attach_stats_default_groups,
-};
-
-void dma_buf_attach_stats_teardown(struct dma_buf_attachment *attach)
-{
-	struct dma_buf_attach_sysfs_entry *sysfs_entry;
-
-	sysfs_entry = attach->sysfs_entry;
-	if (!sysfs_entry)
-		return;
-
-	sysfs_delete_link(&sysfs_entry->kobj, &attach->dev->kobj, "device");
-
-	kobject_del(&sysfs_entry->kobj);
-	kobject_put(&sysfs_entry->kobj);
-}
-
-int dma_buf_attach_stats_setup(struct dma_buf_attachment *attach,
-			       unsigned int uid)
-{
-	struct dma_buf_attach_sysfs_entry *sysfs_entry;
-	int ret;
-	struct dma_buf *dmabuf;
-
-	if (!attach)
-		return -EINVAL;
-
-	dmabuf = attach->dmabuf;
-
-	sysfs_entry = kzalloc(sizeof(struct dma_buf_attach_sysfs_entry),
-			      GFP_KERNEL);
-	if (!sysfs_entry)
-		return -ENOMEM;
-
-	sysfs_entry->kobj.kset = dmabuf->sysfs_entry->attach_stats_kset;
-
-	attach->sysfs_entry = sysfs_entry;
-
-	ret = kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_attach_ktype,
-				   NULL, "%u", uid);
-	if (ret)
-		goto kobj_err;
-
-	ret = sysfs_create_link(&sysfs_entry->kobj, &attach->dev->kobj,
-				"device");
-	if (ret)
-		goto link_err;
-
-	return 0;
-
-link_err:
-	kobject_del(&sysfs_entry->kobj);
-kobj_err:
-	kobject_put(&sysfs_entry->kobj);
-	attach->sysfs_entry = NULL;
-
-	return ret;
-}
 void dma_buf_stats_teardown(struct dma_buf *dmabuf)
 {
 	struct dma_buf_sysfs_entry *sysfs_entry;
@@ -243,7 +126,6 @@ void dma_buf_stats_teardown(struct dma_buf *dmabuf)
 	if (!sysfs_entry)
 		return;
 
-	kset_unregister(sysfs_entry->attach_stats_kset);
 	kobject_del(&sysfs_entry->kobj);
 	kobject_put(&sysfs_entry->kobj);
 }
@@ -290,7 +172,6 @@ int dma_buf_stats_setup(struct dma_buf *dmabuf)
 {
 	struct dma_buf_sysfs_entry *sysfs_entry;
 	int ret;
-	struct kset *attach_stats_kset;
 
 	if (!dmabuf || !dmabuf->file)
 		return -EINVAL;
@@ -315,21 +196,8 @@ int dma_buf_stats_setup(struct dma_buf *dmabuf)
 	if (ret)
 		goto err_sysfs_dmabuf;
 
-	/* create the directory for attachment stats */
-	attach_stats_kset = kset_create_and_add("attachments",
-						&dmabuf_sysfs_no_uevent_ops,
-						&sysfs_entry->kobj);
-	if (!attach_stats_kset) {
-		ret = -ENOMEM;
-		goto err_sysfs_attach;
-	}
-
-	sysfs_entry->attach_stats_kset = attach_stats_kset;
-
 	return 0;
 
-err_sysfs_attach:
-	kobject_del(&sysfs_entry->kobj);
 err_sysfs_dmabuf:
 	kobject_put(&sysfs_entry->kobj);
 	dmabuf->sysfs_entry = NULL;
diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.h b/drivers/dma-buf/dma-buf-sysfs-stats.h
index 5f4703249117..a49c6e2650cc 100644
--- a/drivers/dma-buf/dma-buf-sysfs-stats.h
+++ b/drivers/dma-buf/dma-buf-sysfs-stats.h
@@ -14,23 +14,8 @@ int dma_buf_init_sysfs_statistics(void);
 void dma_buf_uninit_sysfs_statistics(void);
 
 int dma_buf_stats_setup(struct dma_buf *dmabuf);
-int dma_buf_attach_stats_setup(struct dma_buf_attachment *attach,
-			       unsigned int uid);
-static inline void dma_buf_update_attachment_map_count(struct dma_buf_attachment *attach,
-						       int delta)
-{
-	struct dma_buf_attach_sysfs_entry *entry = attach->sysfs_entry;
 
-	entry->map_counter += delta;
-}
 void dma_buf_stats_teardown(struct dma_buf *dmabuf);
-void dma_buf_attach_stats_teardown(struct dma_buf_attachment *attach);
-static inline unsigned int dma_buf_update_attach_uid(struct dma_buf *dmabuf)
-{
-	struct dma_buf_sysfs_entry *entry = dmabuf->sysfs_entry;
-
-	return entry->attachment_uid++;
-}
 #else
 
 static inline int dma_buf_init_sysfs_statistics(void)
@@ -44,19 +29,7 @@ static inline int dma_buf_stats_setup(struct dma_buf *dmabuf)
 {
 	return 0;
 }
-static inline int dma_buf_attach_stats_setup(struct dma_buf_attachment *attach,
-					     unsigned int uid)
-{
-	return 0;
-}
 
 static inline void dma_buf_stats_teardown(struct dma_buf *dmabuf) {}
-static inline void dma_buf_attach_stats_teardown(struct dma_buf_attachment *attach) {}
-static inline void dma_buf_update_attachment_map_count(struct dma_buf_attachment *attach,
-						       int delta) {}
-static inline unsigned int dma_buf_update_attach_uid(struct dma_buf *dmabuf)
-{
-	return 0;
-}
 #endif
 #endif // _DMA_BUF_SYSFS_STATS_H
diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 510b42771974..b1a6db71c656 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -738,7 +738,6 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 {
 	struct dma_buf_attachment *attach;
 	int ret;
-	unsigned int attach_uid;
 
 	if (WARN_ON(!dmabuf || !dev))
 		return ERR_PTR(-EINVAL);
@@ -764,13 +763,8 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 	}
 	dma_resv_lock(dmabuf->resv, NULL);
 	list_add(&attach->node, &dmabuf->attachments);
-	attach_uid = dma_buf_update_attach_uid(dmabuf);
 	dma_resv_unlock(dmabuf->resv);
 
-	ret = dma_buf_attach_stats_setup(attach, attach_uid);
-	if (ret)
-		goto err_sysfs;
-
 	/* When either the importer or the exporter can't handle dynamic
 	 * mappings we cache the mapping here to avoid issues with the
 	 * reservation object lock.
@@ -797,7 +791,6 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 			dma_resv_unlock(attach->dmabuf->resv);
 		attach->sgt = sgt;
 		attach->dir = DMA_BIDIRECTIONAL;
-		dma_buf_update_attachment_map_count(attach, 1 /* delta */);
 	}
 
 	return attach;
@@ -814,7 +807,6 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 	if (dma_buf_is_dynamic(attach->dmabuf))
 		dma_resv_unlock(attach->dmabuf->resv);
 
-err_sysfs:
 	dma_buf_detach(dmabuf, attach);
 	return ERR_PTR(ret);
 }
@@ -864,7 +856,6 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
 			dma_resv_lock(attach->dmabuf->resv, NULL);
 
 		__unmap_dma_buf(attach, attach->sgt, attach->dir);
-		dma_buf_update_attachment_map_count(attach, -1 /* delta */);
 
 		if (dma_buf_is_dynamic(attach->dmabuf)) {
 			dmabuf->ops->unpin(attach);
@@ -878,7 +869,6 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
 	if (dmabuf->ops->detach)
 		dmabuf->ops->detach(dmabuf, attach);
 
-	dma_buf_attach_stats_teardown(attach);
 	kfree(attach);
 }
 EXPORT_SYMBOL_GPL(dma_buf_detach);
@@ -1020,10 +1010,6 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 		}
 	}
 #endif /* CONFIG_DMA_API_DEBUG */
-
-	if (!IS_ERR(sg_table))
-		dma_buf_update_attachment_map_count(attach, 1 /* delta */);
-
 	return sg_table;
 }
 EXPORT_SYMBOL_GPL(dma_buf_map_attachment);
@@ -1061,8 +1047,6 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
 	if (dma_buf_is_dynamic(attach->dmabuf) &&
 	    !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
 		dma_buf_unpin(attach);
-
-	dma_buf_update_attachment_map_count(attach, -1 /* delta */);
 }
 EXPORT_SYMBOL_GPL(dma_buf_unmap_attachment);
 
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 2b814fde0d11..678b2006be78 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -444,15 +444,6 @@ struct dma_buf {
 	struct dma_buf_sysfs_entry {
 		struct kobject kobj;
 		struct dma_buf *dmabuf;
-
-		/**
-		 * @sysfs_entry.attachment_uid:
-		 *
-		 * This is protected by the dma_resv_lock() on @resv and is
-		 * incremented on each attach.
-		 */
-		unsigned int attachment_uid;
-		struct kset *attach_stats_kset;
 	} *sysfs_entry;
 #endif
 };
@@ -504,7 +495,6 @@ struct dma_buf_attach_ops {
  * @importer_ops: importer operations for this attachment, if provided
  * dma_buf_map/unmap_attachment() must be called with the dma_resv lock held.
  * @importer_priv: importer specific attachment data.
- * @sysfs_entry: For exposing information about this attachment in sysfs.
  *
  * This structure holds the attachment information between the dma_buf buffer
  * and its user device(s). The list contains one attachment struct per device
@@ -525,13 +515,6 @@ struct dma_buf_attachment {
 	const struct dma_buf_attach_ops *importer_ops;
 	void *importer_priv;
 	void *priv;
-#ifdef CONFIG_DMABUF_SYSFS_STATS
-	/* for sysfs stats */
-	struct dma_buf_attach_sysfs_entry {
-		struct kobject kobj;
-		unsigned int map_counter;
-	} *sysfs_entry;
-#endif
 };
 
 /**
-- 
2.32.0.93.g670b81a890-goog

