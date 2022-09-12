Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6925B5E79
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 18:44:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 204E910E597;
	Mon, 12 Sep 2022 16:44:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E7810E597
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 16:44:24 +0000 (UTC)
Received: from sobremesa.fritz.box (unknown
 [IPv6:2a02:8010:65b5:0:bbb0:f8ec:7bc9:dbe4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D3E106601FBA;
 Mon, 12 Sep 2022 17:44:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663001062;
 bh=G7sNMFR546GP6YZOsbpiSVIodIIInuIleGcWnFMaEog=;
 h=From:To:Cc:Subject:Date:From;
 b=JFXjHjo75Lkni9bCqXqribcRS6GFGK7JINGvi1UrhqsAG64IgEa9wumh2VnUqlKBa
 WrcTn1KJZ32rzM2U5iq2TF378+KkdN1kDk+CdUq1B7b8HOy8d+qQy0p590Hg8MXYe3
 ux9aLoS+Ypyg+pAt5geGF5NSDGVFArJBgHdLJZyTPnX/AazabTHhEGgPvYmLXotTy2
 VIaRKF+NU4IfnaUsfswvDSYoSvLn3G+kAbRepJ7d/Ku3HZhVzdy9Dw7jm6PHlfSY/7
 G+9h2mIzmvZD/1vLipVL3wCLU+LAsPh4IWc6aX2Lxk5CxqWMiBzsR2j30SY2jugYke
 bXvUX71KJ5uzg==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: robh@kernel.org, steven.price@arm.com, alyssa.rosenzweig@collabora.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panfrost: Give name to anonymous coredump object union
Date: Mon, 12 Sep 2022 17:44:13 +0100
Message-Id: <20220912164413.2181937-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: adrian.larumbe@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Building Mesa's Perfetto requires including the panfrost drm uAPI header in
C++ code, but the C++ compiler requires anonymous unions to have only
public non-static data members.

Commit 730c2bf4ad39 ("drm/panfrost: Add support for devcoredump")
introduces one such union, breaking the Mesa build.

Give it a name, and also rename pan_reg_hdr structure because it will
always be prefixed by the union name.

Bug: https://gitlab.freedesktop.org/mesa/mesa/-/issues/7195

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_dump.c | 20 ++++++++++----------
 include/uapi/drm/panfrost_drm.h          |  4 ++--
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_dump.c b/drivers/gpu/drm/panfrost/panfrost_dump.c
index 89056a1aac7d..e40b6eace187 100644
--- a/drivers/gpu/drm/panfrost/panfrost_dump.c
+++ b/drivers/gpu/drm/panfrost/panfrost_dump.c
@@ -177,11 +177,11 @@ void panfrost_core_dump(struct panfrost_job *job)
 	 * For now, we write the job identifier in the register dump header,
 	 * so that we can decode the entire dump later with pandecode
 	 */
-	iter.hdr->reghdr.jc = cpu_to_le64(job->jc);
-	iter.hdr->reghdr.major = cpu_to_le32(PANFROSTDUMP_MAJOR);
-	iter.hdr->reghdr.minor = cpu_to_le32(PANFROSTDUMP_MINOR);
-	iter.hdr->reghdr.gpu_id = cpu_to_le32(pfdev->features.id);
-	iter.hdr->reghdr.nbos = cpu_to_le64(job->bo_count);
+	iter.hdr->pan_hdr.regs.jc = cpu_to_le64(job->jc);
+	iter.hdr->pan_hdr.regs.major = cpu_to_le32(PANFROSTDUMP_MAJOR);
+	iter.hdr->pan_hdr.regs.minor = cpu_to_le32(PANFROSTDUMP_MINOR);
+	iter.hdr->pan_hdr.regs.gpu_id = cpu_to_le32(pfdev->features.id);
+	iter.hdr->pan_hdr.regs.nbos = cpu_to_le64(job->bo_count);
 
 	panfrost_core_dump_registers(&iter, pfdev, as_nr, slot);
 
@@ -205,20 +205,20 @@ void panfrost_core_dump(struct panfrost_job *job)
 
 		if (!bo->base.sgt) {
 			dev_err(pfdev->dev, "Panfrost Dump: BO has no sgt, cannot dump\n");
-			iter.hdr->bomap.valid = 0;
+			iter.hdr->pan_hdr.bomap.valid = 0;
 			goto dump_header;
 		}
 
 		ret = drm_gem_shmem_vmap(&bo->base, &map);
 		if (ret) {
 			dev_err(pfdev->dev, "Panfrost Dump: couldn't map Buffer Object\n");
-			iter.hdr->bomap.valid = 0;
+			iter.hdr->pan_hdr.bomap.valid = 0;
 			goto dump_header;
 		}
 
 		WARN_ON(!mapping->active);
 
-		iter.hdr->bomap.data[0] = cpu_to_le32((bomap - bomap_start));
+		iter.hdr->pan_hdr.bomap.data[0] = cpu_to_le32((bomap - bomap_start));
 
 		for_each_sgtable_page(bo->base.sgt, &page_iter, 0) {
 			struct page *page = sg_page_iter_page(&page_iter);
@@ -231,14 +231,14 @@ void panfrost_core_dump(struct panfrost_job *job)
 			}
 		}
 
-		iter.hdr->bomap.iova = cpu_to_le64(mapping->mmnode.start << PAGE_SHIFT);
+		iter.hdr->pan_hdr.bomap.iova = cpu_to_le64(mapping->mmnode.start << PAGE_SHIFT);
 
 		vaddr = map.vaddr;
 		memcpy(iter.data, vaddr, bo->base.base.size);
 
 		drm_gem_shmem_vunmap(&bo->base, &map);
 
-		iter.hdr->bomap.valid = cpu_to_le32(1);
+		iter.hdr->pan_hdr.bomap.valid = cpu_to_le32(1);
 
 dump_header:	panfrost_core_dump_header(&iter, PANFROSTDUMP_BUF_BO, iter.data +
 					  bo->base.base.size);
diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
index eac87310b348..4da33e4d7e2c 100644
--- a/include/uapi/drm/panfrost_drm.h
+++ b/include/uapi/drm/panfrost_drm.h
@@ -248,7 +248,7 @@ struct panfrost_dump_object_header {
 			__le32 major;
 			__le32 minor;
 			__le64 nbos;
-		} reghdr;
+		} regs;
 
 		struct pan_bomap_hdr {
 			__le32 valid;
@@ -262,7 +262,7 @@ struct panfrost_dump_object_header {
 		 */
 
 		__le32 sizer[496];
-	};
+	} pan_hdr;
 };
 
 /* Registers object, an array of these */
-- 
2.37.0

