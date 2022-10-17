Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 150F9600CD0
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 12:46:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED3B10ECDD;
	Mon, 17 Oct 2022 10:46:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3EE8B10E3DC
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 10:46:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E5861042;
 Mon, 17 Oct 2022 03:46:20 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.1.201])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A8A503F67D;
 Mon, 17 Oct 2022 03:46:12 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Subject: [PATCH v2 2/2] drm/panfrost: replace endian-specific types with
 native ones
Date: Mon, 17 Oct 2022 11:46:02 +0100
Message-Id: <20221017104602.142992-3-steven.price@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017104602.142992-1-steven.price@arm.com>
References: <20221017104602.142992-1-steven.price@arm.com>
MIME-Version: 1.0
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

__le32 and __le64 types aren't portable and are not available on
FreeBSD (which uses the same uAPI).

Instead of attempting to always output little endian, just use native
endianness in the dumps. Tools can detect the endianness in use by
looking at the 'magic' field, but equally we don't expect big-endian to
be used with Mali (there are no known implementations out there).

Bug: https://gitlab.freedesktop.org/mesa/mesa/-/issues/7252
Fixes: 730c2bf4ad39 ("drm/panfrost: Add support for devcoredump")
Signed-off-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_dump.c | 36 ++++++++++++------------
 include/uapi/drm/panfrost_drm.h          | 36 +++++++++++++-----------
 2 files changed, 38 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_dump.c b/drivers/gpu/drm/panfrost/panfrost_dump.c
index 89056a1aac7d..6bd0634e2d58 100644
--- a/drivers/gpu/drm/panfrost/panfrost_dump.c
+++ b/drivers/gpu/drm/panfrost/panfrost_dump.c
@@ -63,13 +63,13 @@ static void panfrost_core_dump_header(struct panfrost_dump_iterator *iter,
 {
 	struct panfrost_dump_object_header *hdr = iter->hdr;
 
-	hdr->magic = cpu_to_le32(PANFROSTDUMP_MAGIC);
-	hdr->type = cpu_to_le32(type);
-	hdr->file_offset = cpu_to_le32(iter->data - iter->start);
-	hdr->file_size = cpu_to_le32(data_end - iter->data);
+	hdr->magic = PANFROSTDUMP_MAGIC;
+	hdr->type = type;
+	hdr->file_offset = iter->data - iter->start;
+	hdr->file_size = data_end - iter->data;
 
 	iter->hdr++;
-	iter->data += le32_to_cpu(hdr->file_size);
+	iter->data += hdr->file_size;
 }
 
 static void
@@ -93,8 +93,8 @@ panfrost_core_dump_registers(struct panfrost_dump_iterator *iter,
 
 		reg = panfrost_dump_registers[i] + js_as_offset;
 
-		dumpreg->reg = cpu_to_le32(reg);
-		dumpreg->value = cpu_to_le32(gpu_read(pfdev, reg));
+		dumpreg->reg = reg;
+		dumpreg->value = gpu_read(pfdev, reg);
 	}
 
 	panfrost_core_dump_header(iter, PANFROSTDUMP_BUF_REG, dumpreg);
@@ -106,7 +106,7 @@ void panfrost_core_dump(struct panfrost_job *job)
 	struct panfrost_dump_iterator iter;
 	struct drm_gem_object *dbo;
 	unsigned int n_obj, n_bomap_pages;
-	__le64 *bomap, *bomap_start;
+	u64 *bomap, *bomap_start;
 	size_t file_size;
 	u32 as_nr;
 	int slot;
@@ -177,11 +177,11 @@ void panfrost_core_dump(struct panfrost_job *job)
 	 * For now, we write the job identifier in the register dump header,
 	 * so that we can decode the entire dump later with pandecode
 	 */
-	iter.hdr->reghdr.jc = cpu_to_le64(job->jc);
-	iter.hdr->reghdr.major = cpu_to_le32(PANFROSTDUMP_MAJOR);
-	iter.hdr->reghdr.minor = cpu_to_le32(PANFROSTDUMP_MINOR);
-	iter.hdr->reghdr.gpu_id = cpu_to_le32(pfdev->features.id);
-	iter.hdr->reghdr.nbos = cpu_to_le64(job->bo_count);
+	iter.hdr->reghdr.jc = job->jc;
+	iter.hdr->reghdr.major = PANFROSTDUMP_MAJOR;
+	iter.hdr->reghdr.minor = PANFROSTDUMP_MINOR;
+	iter.hdr->reghdr.gpu_id = pfdev->features.id;
+	iter.hdr->reghdr.nbos = job->bo_count;
 
 	panfrost_core_dump_registers(&iter, pfdev, as_nr, slot);
 
@@ -218,27 +218,27 @@ void panfrost_core_dump(struct panfrost_job *job)
 
 		WARN_ON(!mapping->active);
 
-		iter.hdr->bomap.data[0] = cpu_to_le32((bomap - bomap_start));
+		iter.hdr->bomap.data[0] = bomap - bomap_start;
 
 		for_each_sgtable_page(bo->base.sgt, &page_iter, 0) {
 			struct page *page = sg_page_iter_page(&page_iter);
 
 			if (!IS_ERR(page)) {
-				*bomap++ = cpu_to_le64(page_to_phys(page));
+				*bomap++ = page_to_phys(page);
 			} else {
 				dev_err(pfdev->dev, "Panfrost Dump: wrong page\n");
-				*bomap++ = ~cpu_to_le64(0);
+				*bomap++ = 0;
 			}
 		}
 
-		iter.hdr->bomap.iova = cpu_to_le64(mapping->mmnode.start << PAGE_SHIFT);
+		iter.hdr->bomap.iova = mapping->mmnode.start << PAGE_SHIFT;
 
 		vaddr = map.vaddr;
 		memcpy(iter.data, vaddr, bo->base.base.size);
 
 		drm_gem_shmem_vunmap(&bo->base, &map);
 
-		iter.hdr->bomap.valid = cpu_to_le32(1);
+		iter.hdr->bomap.valid = 1;
 
 dump_header:	panfrost_core_dump_header(&iter, PANFROSTDUMP_BUF_BO, iter.data +
 					  bo->base.base.size);
diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
index bd77254be121..6f93c915cc88 100644
--- a/include/uapi/drm/panfrost_drm.h
+++ b/include/uapi/drm/panfrost_drm.h
@@ -235,25 +235,29 @@ struct drm_panfrost_madvise {
 #define PANFROSTDUMP_BUF_BO (PANFROSTDUMP_BUF_BOMAP + 1)
 #define PANFROSTDUMP_BUF_TRAILER (PANFROSTDUMP_BUF_BO + 1)
 
+/*
+ * This structure is the native endianness of the dumping machine, tools can
+ * detect the endianness by looking at the value in 'magic'.
+ */
 struct panfrost_dump_object_header {
-	__le32 magic;
-	__le32 type;
-	__le32 file_size;
-	__le32 file_offset;
+	__u32 magic;
+	__u32 type;
+	__u32 file_size;
+	__u32 file_offset;
 
 	union {
 		struct {
-			__le64 jc;
-			__le32 gpu_id;
-			__le32 major;
-			__le32 minor;
-			__le64 nbos;
+			__u64 jc;
+			__u32 gpu_id;
+			__u32 major;
+			__u32 minor;
+			__u64 nbos;
 		} reghdr;
 
-		struct {
-			__le32 valid;
-			__le64 iova;
-			__le32 data[2];
+		struct pan_bomap_hdr {
+			__u32 valid;
+			__u64 iova;
+			__u32 data[2];
 		} bomap;
 
 		/*
@@ -261,14 +265,14 @@ struct panfrost_dump_object_header {
 		 * with new fields and also keep it 512-byte aligned
 		 */
 
-		__le32 sizer[496];
+		__u32 sizer[496];
 	};
 };
 
 /* Registers object, an array of these */
 struct panfrost_dump_registers {
-	__le32 reg;
-	__le32 value;
+	__u32 reg;
+	__u32 value;
 };
 
 #if defined(__cplusplus)
-- 
2.34.1

