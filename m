Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBFB3C6908
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 06:07:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29CFF6E02C;
	Tue, 13 Jul 2021 04:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB4526E02B
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 04:07:49 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id
 s83-20020a2545560000b029055ae952c336so24899223yba.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 21:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=lsRQcYOnLNGeZNFv9ZqabeUiQqK2KSkzul/BCImYOGQ=;
 b=gPSXuiokMiiFcRSzhrt4fHhIbGRoeQi7Eq4XA3gKVm2B6yAWrkdk1rCOxk5ky642fW
 8EHwZOyTerEb18XV86OudV9UyVF5PNC3+cN/Owf5gp3iAAtyiQpPC5juqs2nfmbNcZNp
 G9iSIfJn0IcLbJvo+qX+4b97x+ytRKUmB707yHZX0a4Ugkbu3BPyzJYBscBtOIlr+9PZ
 4s9qPHYX8K2TTwoSRiEs7/l7fbu7mjOlJKvImJQMMIhMInUcVqAKkbHhqySlvBw1V/Aw
 MnhDQH+dkssXHH6sEZFKpPcBmVs1Td2epMkxH7yfPTDg8blpTOoYfNx8z26aFc+hNMe5
 iBHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=lsRQcYOnLNGeZNFv9ZqabeUiQqK2KSkzul/BCImYOGQ=;
 b=bEtyAJDu/Sgw64OpwbFD/0tKBF6AiErZHS2DZCo165TYTgTfTG5sX4Rt3BPZ1xSl13
 ByzPhlWT5+Ee76GA+wxpUXDJT1PFdaYxNnC+TQ3eICNUT1Cvsdyq9RQKVssyrxX0r8Dm
 JEVskA++iSlTbYwP/5Z+V0JvKnWEWQ1EyECyRltgPs4QQ5O0Wiqobc5vsoNW3HWdcSkJ
 Utgx5Bw1/lXD3/9tHrKdzGiWZ+L5J9ytLF/gi1hFdBec0r0z5uNeDCZOpBR9bFZgKNWu
 DAiAI/Fg2Tm++67ZnO1f70wzJ0Ntc04eyGk/4EaYHjAygXii3D2BUTm/LGCM8dnwUNpP
 e2PA==
X-Gm-Message-State: AOAM531fFnd2jqTfFR5IK1nVEhGeF26+8L5B577ynyg145kQqx8moIWy
 8gvCI7py8mwj5t9r+CgTYKuF9IzPEtc=
X-Google-Smtp-Source: ABdhPJxZMjSGTD6Q9sj/OJwUJwZToli5AFricGI0zhixsoa2+/EbM8Q8aIAn6TH/hNqolerSh4FEQ1DfqVs=
X-Received: from hridya.mtv.corp.google.com
 ([2620:15c:211:200:2156:3303:4d7a:cc35])
 (user=hridya job=sendgmr) by 2002:a5b:c0a:: with SMTP id
 f10mr3006444ybq.9.1626149269053; 
 Mon, 12 Jul 2021 21:07:49 -0700 (PDT)
Date: Mon, 12 Jul 2021 21:07:38 -0700
Message-Id: <20210713040742.2680135-1-hridya@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
Subject: [PATCH v2] dma-buf: Delete the DMA-BUF attachment sysfs statistics
From: Hridya Valsaraju <hridya@google.com>
To: christian.koenig@amd.com, Sumit Semwal <sumit.semwal@linaro.org>, 
 Hridya Valsaraju <hridya@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org
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
Cc: surenb@google.com, kernel-team@android.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DMA-BUF attachment statistics form a subset of the DMA-BUF
sysfs statistics that recently merged to the drm-misc tree. They are not
UABI yet since they have not merged to the upstream Linux kernel.

Since there has been a reported a performance regression due to the
overhead of sysfs directory creation/teardown during
dma_buf_attach()/dma_buf_detach(), this patch deletes the DMA-BUF
attachment statistics from sysfs.

Fixes: bdb8d06dfefd (dmabuf: Add the capability to expose DMA-BUF stats
in sysfs)
Signed-off-by: Hridya Valsaraju <hridya@google.com>
Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---

Changes in v2:
Updated commit message to clarify that the sysfs files being removed
have not yet merged to upstream Linux and are hence not ABI.

Hi Christian,

I have updated the commit message as per your suggestion. Please do take
another look when you get a chance.

Thanks,
Hridya

 .../ABI/testing/sysfs-kernel-dmabuf-buffers   |  28 ----
 drivers/dma-buf/dma-buf-sysfs-stats.c         | 140 +-----------------
 drivers/dma-buf/dma-buf-sysfs-stats.h         |  27 ----
 drivers/dma-buf/dma-buf.c                     |  16 --
 include/linux/dma-buf.h                       |  17 ---
 5 files changed, 4 insertions(+), 224 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers b/Docume=
ntation/ABI/testing/sysfs-kernel-dmabuf-buffers
index a243984ed420..5d3bc997dc64 100644
--- a/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
+++ b/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
@@ -22,31 +22,3 @@ KernelVersion:	v5.13
 Contact:	Hridya Valsaraju <hridya@google.com>
 Description:	This file is read-only and specifies the size of the DMA-BUF =
in
 		bytes.
-
-What:		/sys/kernel/dmabuf/buffers/<inode_number>/attachments
-Date:		May 2021
-KernelVersion:	v5.13
-Contact:	Hridya Valsaraju <hridya@google.com>
-Description:	This directory will contain subdirectories representing every
-		attachment of the DMA-BUF.
-
-What:		/sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attachment_u=
id>
-Date:		May 2021
-KernelVersion:	v5.13
-Contact:	Hridya Valsaraju <hridya@google.com>
-Description:	This directory will contain information on the attached devic=
e
-		and the number of current distinct device mappings.
-
-What:		/sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attachment_u=
id>/device
-Date:		May 2021
-KernelVersion:	v5.13
-Contact:	Hridya Valsaraju <hridya@google.com>
-Description:	This file is read-only and is a symlink to the attached devic=
e's
-		sysfs entry.
-
-What:		/sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attachment_u=
id>/map_counter
-Date:		May 2021
-KernelVersion:	v5.13
-Contact:	Hridya Valsaraju <hridya@google.com>
-Description:	This file is read-only and contains a map_counter indicating =
the
-		number of distinct device mappings of the attachment.
diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dma-bu=
f-sysfs-stats.c
index a2638e84199c..053baadcada9 100644
--- a/drivers/dma-buf/dma-buf-sysfs-stats.c
+++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
@@ -40,14 +40,11 @@
  *
  * * ``/sys/kernel/dmabuf/buffers/<inode_number>/exporter_name``
  * * ``/sys/kernel/dmabuf/buffers/<inode_number>/size``
- * * ``/sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach_uid>/=
device``
- * * ``/sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach_uid>/=
map_counter``
  *
- * The information in the interface can also be used to derive per-exporte=
r and
- * per-device usage statistics. The data from the interface can be gathere=
d
- * on error conditions or other important events to provide a snapshot of
- * DMA-BUF usage. It can also be collected periodically by telemetry to mo=
nitor
- * various metrics.
+ * The information in the interface can also be used to derive per-exporte=
r
+ * statistics. The data from the interface can be gathered on error condit=
ions
+ * or other important events to provide a snapshot of DMA-BUF usage.
+ * It can also be collected periodically by telemetry to monitor various m=
etrics.
  *
  * Detailed documentation about the interface is present in
  * Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers.
@@ -121,120 +118,6 @@ static struct kobj_type dma_buf_ktype =3D {
 	.default_groups =3D dma_buf_stats_default_groups,
 };
=20
-#define to_dma_buf_attach_entry_from_kobj(x) container_of(x, struct dma_bu=
f_attach_sysfs_entry, kobj)
-
-struct dma_buf_attach_stats_attribute {
-	struct attribute attr;
-	ssize_t (*show)(struct dma_buf_attach_sysfs_entry *sysfs_entry,
-			struct dma_buf_attach_stats_attribute *attr, char *buf);
-};
-#define to_dma_buf_attach_stats_attr(x) container_of(x, struct dma_buf_att=
ach_stats_attribute, attr)
-
-static ssize_t dma_buf_attach_stats_attribute_show(struct kobject *kobj,
-						   struct attribute *attr,
-						   char *buf)
-{
-	struct dma_buf_attach_stats_attribute *attribute;
-	struct dma_buf_attach_sysfs_entry *sysfs_entry;
-
-	attribute =3D to_dma_buf_attach_stats_attr(attr);
-	sysfs_entry =3D to_dma_buf_attach_entry_from_kobj(kobj);
-
-	if (!attribute->show)
-		return -EIO;
-
-	return attribute->show(sysfs_entry, attribute, buf);
-}
-
-static const struct sysfs_ops dma_buf_attach_stats_sysfs_ops =3D {
-	.show =3D dma_buf_attach_stats_attribute_show,
-};
-
-static ssize_t map_counter_show(struct dma_buf_attach_sysfs_entry *sysfs_e=
ntry,
-				struct dma_buf_attach_stats_attribute *attr,
-				char *buf)
-{
-	return sysfs_emit(buf, "%u\n", sysfs_entry->map_counter);
-}
-
-static struct dma_buf_attach_stats_attribute map_counter_attribute =3D
-	__ATTR_RO(map_counter);
-
-static struct attribute *dma_buf_attach_stats_default_attrs[] =3D {
-	&map_counter_attribute.attr,
-	NULL,
-};
-ATTRIBUTE_GROUPS(dma_buf_attach_stats_default);
-
-static void dma_buf_attach_sysfs_release(struct kobject *kobj)
-{
-	struct dma_buf_attach_sysfs_entry *sysfs_entry;
-
-	sysfs_entry =3D to_dma_buf_attach_entry_from_kobj(kobj);
-	kfree(sysfs_entry);
-}
-
-static struct kobj_type dma_buf_attach_ktype =3D {
-	.sysfs_ops =3D &dma_buf_attach_stats_sysfs_ops,
-	.release =3D dma_buf_attach_sysfs_release,
-	.default_groups =3D dma_buf_attach_stats_default_groups,
-};
-
-void dma_buf_attach_stats_teardown(struct dma_buf_attachment *attach)
-{
-	struct dma_buf_attach_sysfs_entry *sysfs_entry;
-
-	sysfs_entry =3D attach->sysfs_entry;
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
-	dmabuf =3D attach->dmabuf;
-
-	sysfs_entry =3D kzalloc(sizeof(struct dma_buf_attach_sysfs_entry),
-			      GFP_KERNEL);
-	if (!sysfs_entry)
-		return -ENOMEM;
-
-	sysfs_entry->kobj.kset =3D dmabuf->sysfs_entry->attach_stats_kset;
-
-	attach->sysfs_entry =3D sysfs_entry;
-
-	ret =3D kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_attach_ktype,
-				   NULL, "%u", uid);
-	if (ret)
-		goto kobj_err;
-
-	ret =3D sysfs_create_link(&sysfs_entry->kobj, &attach->dev->kobj,
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
-	attach->sysfs_entry =3D NULL;
-
-	return ret;
-}
 void dma_buf_stats_teardown(struct dma_buf *dmabuf)
 {
 	struct dma_buf_sysfs_entry *sysfs_entry;
@@ -243,7 +126,6 @@ void dma_buf_stats_teardown(struct dma_buf *dmabuf)
 	if (!sysfs_entry)
 		return;
=20
-	kset_unregister(sysfs_entry->attach_stats_kset);
 	kobject_del(&sysfs_entry->kobj);
 	kobject_put(&sysfs_entry->kobj);
 }
@@ -290,7 +172,6 @@ int dma_buf_stats_setup(struct dma_buf *dmabuf)
 {
 	struct dma_buf_sysfs_entry *sysfs_entry;
 	int ret;
-	struct kset *attach_stats_kset;
=20
 	if (!dmabuf || !dmabuf->file)
 		return -EINVAL;
@@ -315,21 +196,8 @@ int dma_buf_stats_setup(struct dma_buf *dmabuf)
 	if (ret)
 		goto err_sysfs_dmabuf;
=20
-	/* create the directory for attachment stats */
-	attach_stats_kset =3D kset_create_and_add("attachments",
-						&dmabuf_sysfs_no_uevent_ops,
-						&sysfs_entry->kobj);
-	if (!attach_stats_kset) {
-		ret =3D -ENOMEM;
-		goto err_sysfs_attach;
-	}
-
-	sysfs_entry->attach_stats_kset =3D attach_stats_kset;
-
 	return 0;
=20
-err_sysfs_attach:
-	kobject_del(&sysfs_entry->kobj);
 err_sysfs_dmabuf:
 	kobject_put(&sysfs_entry->kobj);
 	dmabuf->sysfs_entry =3D NULL;
diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.h b/drivers/dma-buf/dma-bu=
f-sysfs-stats.h
index 5f4703249117..a49c6e2650cc 100644
--- a/drivers/dma-buf/dma-buf-sysfs-stats.h
+++ b/drivers/dma-buf/dma-buf-sysfs-stats.h
@@ -14,23 +14,8 @@ int dma_buf_init_sysfs_statistics(void);
 void dma_buf_uninit_sysfs_statistics(void);
=20
 int dma_buf_stats_setup(struct dma_buf *dmabuf);
-int dma_buf_attach_stats_setup(struct dma_buf_attachment *attach,
-			       unsigned int uid);
-static inline void dma_buf_update_attachment_map_count(struct dma_buf_atta=
chment *attach,
-						       int delta)
-{
-	struct dma_buf_attach_sysfs_entry *entry =3D attach->sysfs_entry;
=20
-	entry->map_counter +=3D delta;
-}
 void dma_buf_stats_teardown(struct dma_buf *dmabuf);
-void dma_buf_attach_stats_teardown(struct dma_buf_attachment *attach);
-static inline unsigned int dma_buf_update_attach_uid(struct dma_buf *dmabu=
f)
-{
-	struct dma_buf_sysfs_entry *entry =3D dmabuf->sysfs_entry;
-
-	return entry->attachment_uid++;
-}
 #else
=20
 static inline int dma_buf_init_sysfs_statistics(void)
@@ -44,19 +29,7 @@ static inline int dma_buf_stats_setup(struct dma_buf *dm=
abuf)
 {
 	return 0;
 }
-static inline int dma_buf_attach_stats_setup(struct dma_buf_attachment *at=
tach,
-					     unsigned int uid)
-{
-	return 0;
-}
=20
 static inline void dma_buf_stats_teardown(struct dma_buf *dmabuf) {}
-static inline void dma_buf_attach_stats_teardown(struct dma_buf_attachment=
 *attach) {}
-static inline void dma_buf_update_attachment_map_count(struct dma_buf_atta=
chment *attach,
-						       int delta) {}
-static inline unsigned int dma_buf_update_attach_uid(struct dma_buf *dmabu=
f)
-{
-	return 0;
-}
 #endif
 #endif // _DMA_BUF_SYSFS_STATS_H
diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 510b42771974..b1a6db71c656 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -738,7 +738,6 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct d=
evice *dev,
 {
 	struct dma_buf_attachment *attach;
 	int ret;
-	unsigned int attach_uid;
=20
 	if (WARN_ON(!dmabuf || !dev))
 		return ERR_PTR(-EINVAL);
@@ -764,13 +763,8 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct =
device *dev,
 	}
 	dma_resv_lock(dmabuf->resv, NULL);
 	list_add(&attach->node, &dmabuf->attachments);
-	attach_uid =3D dma_buf_update_attach_uid(dmabuf);
 	dma_resv_unlock(dmabuf->resv);
=20
-	ret =3D dma_buf_attach_stats_setup(attach, attach_uid);
-	if (ret)
-		goto err_sysfs;
-
 	/* When either the importer or the exporter can't handle dynamic
 	 * mappings we cache the mapping here to avoid issues with the
 	 * reservation object lock.
@@ -797,7 +791,6 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct d=
evice *dev,
 			dma_resv_unlock(attach->dmabuf->resv);
 		attach->sgt =3D sgt;
 		attach->dir =3D DMA_BIDIRECTIONAL;
-		dma_buf_update_attachment_map_count(attach, 1 /* delta */);
 	}
=20
 	return attach;
@@ -814,7 +807,6 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct d=
evice *dev,
 	if (dma_buf_is_dynamic(attach->dmabuf))
 		dma_resv_unlock(attach->dmabuf->resv);
=20
-err_sysfs:
 	dma_buf_detach(dmabuf, attach);
 	return ERR_PTR(ret);
 }
@@ -864,7 +856,6 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_=
buf_attachment *attach)
 			dma_resv_lock(attach->dmabuf->resv, NULL);
=20
 		__unmap_dma_buf(attach, attach->sgt, attach->dir);
-		dma_buf_update_attachment_map_count(attach, -1 /* delta */);
=20
 		if (dma_buf_is_dynamic(attach->dmabuf)) {
 			dmabuf->ops->unpin(attach);
@@ -878,7 +869,6 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_=
buf_attachment *attach)
 	if (dmabuf->ops->detach)
 		dmabuf->ops->detach(dmabuf, attach);
=20
-	dma_buf_attach_stats_teardown(attach);
 	kfree(attach);
 }
 EXPORT_SYMBOL_GPL(dma_buf_detach);
@@ -1020,10 +1010,6 @@ struct sg_table *dma_buf_map_attachment(struct dma_b=
uf_attachment *attach,
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
@@ -1061,8 +1047,6 @@ void dma_buf_unmap_attachment(struct dma_buf_attachme=
nt *attach,
 	if (dma_buf_is_dynamic(attach->dmabuf) &&
 	    !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
 		dma_buf_unpin(attach);
-
-	dma_buf_update_attachment_map_count(attach, -1 /* delta */);
 }
 EXPORT_SYMBOL_GPL(dma_buf_unmap_attachment);
=20
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
  * dma_buf_map/unmap_attachment() must be called with the dma_resv lock he=
ld.
  * @importer_priv: importer specific attachment data.
- * @sysfs_entry: For exposing information about this attachment in sysfs.
  *
  * This structure holds the attachment information between the dma_buf buf=
fer
  * and its user device(s). The list contains one attachment struct per dev=
ice
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
=20
 /**
--=20
2.32.0.93.g670b81a890-goog

