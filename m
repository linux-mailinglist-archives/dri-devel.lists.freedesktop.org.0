Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BE76F6A7B
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 13:52:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 293D410E269;
	Thu,  4 May 2023 11:52:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD5310E288;
 Thu,  4 May 2023 11:52:14 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-50bc3a2d333so539461a12.0; 
 Thu, 04 May 2023 04:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683201133; x=1685793133;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=nPc3C+fkaElM6Acph6qLW7E5RxlxIjkPmnkGZYlX+24=;
 b=bbPp/1IdLCk67moE2PoHp9ekOd8Sf2PElpxzKaVke6OEHi4KRQFMFlIQWJmuoLSgLM
 JgAGVJ5/iWJdoiRc42Y9WkTR/HWNHpaZkgPId2XaxmxtZaEJMO7NndfiQDpUM5ljMKdp
 f8PQ3yfZF5JD/vIjY7IwURUrk4JmhyjmlMrhXpo8Yd7B3ZqF+AIl9rVvRY5FmiguiZB7
 ITjRKINfv+RX5s0ACc1/lK+r4eNXtsr9OJN3rngX7UcePCy90SiMMvwf4abnjh/xR+HD
 n1XrYQaRdEm1I0u6DkZ8IouAj+torqddVf6zY/43GyUA2A55cHjt6WzPrjG7XLjN3ejR
 DoRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683201133; x=1685793133;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nPc3C+fkaElM6Acph6qLW7E5RxlxIjkPmnkGZYlX+24=;
 b=T1S5X7vuDriqiSZdhAEf0N5NifOECHXnjlx3jqyYSvmNLg2lKK7KlQ7/zG2HZJWCPU
 QsUe8/Z5mTnJVB90anaitQ7+UhHHmYFUsytWDihLXVy0uk3E6RD01VL89LQIIfDxII1j
 JexBS6dhJi7NUxPxBWanJQX8pLt8118OsNbWa3an0c4X/5BCiiqmqI0hnlUg5TtLuYaw
 AiNut1pP6PNGK2dB64FesoR1ZHoL/EEvOrtFn1o+EnjhSqTjtAmrOedEr4Xn473RsuuX
 Cwui12k3q9qgmUeaUV6j3gtBiBOvmmH3POCctiW177pVcdLKhm3h3kzmTJHM21P/X8pm
 f7FQ==
X-Gm-Message-State: AC+VfDwzlYsiUd2hxkxMZLLybYVICEKvp6d7qQb02Kn7w+UZGi6L3Aeu
 uW60qGSt9DKTrR0Cbya3cWQ=
X-Google-Smtp-Source: ACHHUZ6GQxM8VYf02ejZFx6c9tGIhe+xoXsPGr4MOP7i1ACvtjKHKc6vOrqyixh+4exIRNxED/dCFg==
X-Received: by 2002:a17:907:928a:b0:94a:5c6d:3207 with SMTP id
 bw10-20020a170907928a00b0094a5c6d3207mr7169227ejc.44.1683201132922; 
 Thu, 04 May 2023 04:52:12 -0700 (PDT)
Received: from able.fritz.box (p4fc2092b.dip0.t-ipconnect.de. [79.194.9.43])
 by smtp.gmail.com with ESMTPSA id
 hx27-20020a170906847b00b009659ecdf29fsm1061741ejc.1.2023.05.04.04.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 04:52:12 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: francois.dugast@intel.com, felix.kuehling@amd.com,
 arunpravin.paneerselvam@amd.com, thomas_os@shipmail.org, dakr@redhat.com,
 luben.tuikov@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 08/13] drm/qxl: switch to using drm_exec
Date: Thu,  4 May 2023 13:51:54 +0200
Message-Id: <20230504115159.2245-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230504115159.2245-1-christian.koenig@amd.com>
References: <20230504115159.2245-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just a straightforward conversion without any optimization.

Only compile tested for now.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/qxl/Kconfig       |  1 +
 drivers/gpu/drm/qxl/qxl_drv.h     |  7 ++--
 drivers/gpu/drm/qxl/qxl_release.c | 67 ++++++++++++++++---------------
 3 files changed, 39 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/qxl/Kconfig b/drivers/gpu/drm/qxl/Kconfig
index ca3f51c2a8fe..9c8e433be33e 100644
--- a/drivers/gpu/drm/qxl/Kconfig
+++ b/drivers/gpu/drm/qxl/Kconfig
@@ -5,6 +5,7 @@ config DRM_QXL
 	select DRM_KMS_HELPER
 	select DRM_TTM
 	select DRM_TTM_HELPER
+	select DRM_EXEC
 	select CRC32
 	help
 	  QXL virtual GPU for Spice virtualization desktop integration.
diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_drv.h
index ea993d7162e8..3e732648b332 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.h
+++ b/drivers/gpu/drm/qxl/qxl_drv.h
@@ -38,12 +38,12 @@
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_encoder.h>
+#include <drm/drm_exec.h>
 #include <drm/drm_gem_ttm_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_gem.h>
 #include <drm/qxl_drm.h>
 #include <drm/ttm/ttm_bo.h>
-#include <drm/ttm/ttm_execbuf_util.h>
 #include <drm/ttm/ttm_placement.h>
 
 #include "qxl_dev.h"
@@ -101,7 +101,8 @@ struct qxl_gem {
 };
 
 struct qxl_bo_list {
-	struct ttm_validate_buffer tv;
+	struct qxl_bo		*bo;
+	struct list_head	list;
 };
 
 struct qxl_crtc {
@@ -151,7 +152,7 @@ struct qxl_release {
 	struct qxl_bo *release_bo;
 	uint32_t release_offset;
 	uint32_t surface_release_id;
-	struct ww_acquire_ctx ticket;
+	struct drm_exec	exec;
 	struct list_head bos;
 };
 
diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
index 368d26da0d6a..da7cd9cd58f9 100644
--- a/drivers/gpu/drm/qxl/qxl_release.c
+++ b/drivers/gpu/drm/qxl/qxl_release.c
@@ -121,13 +121,11 @@ qxl_release_free_list(struct qxl_release *release)
 {
 	while (!list_empty(&release->bos)) {
 		struct qxl_bo_list *entry;
-		struct qxl_bo *bo;
 
 		entry = container_of(release->bos.next,
-				     struct qxl_bo_list, tv.head);
-		bo = to_qxl_bo(entry->tv.bo);
-		qxl_bo_unref(&bo);
-		list_del(&entry->tv.head);
+				     struct qxl_bo_list, list);
+		qxl_bo_unref(&entry->bo);
+		list_del(&entry->list);
 		kfree(entry);
 	}
 	release->release_bo = NULL;
@@ -172,8 +170,8 @@ int qxl_release_list_add(struct qxl_release *release, struct qxl_bo *bo)
 {
 	struct qxl_bo_list *entry;
 
-	list_for_each_entry(entry, &release->bos, tv.head) {
-		if (entry->tv.bo == &bo->tbo)
+	list_for_each_entry(entry, &release->bos, list) {
+		if (entry->bo == bo)
 			return 0;
 	}
 
@@ -182,9 +180,8 @@ int qxl_release_list_add(struct qxl_release *release, struct qxl_bo *bo)
 		return -ENOMEM;
 
 	qxl_bo_ref(bo);
-	entry->tv.bo = &bo->tbo;
-	entry->tv.num_shared = 0;
-	list_add_tail(&entry->tv.head, &release->bos);
+	entry->bo = bo;
+	list_add_tail(&entry->list, &release->bos);
 	return 0;
 }
 
@@ -221,21 +218,27 @@ int qxl_release_reserve_list(struct qxl_release *release, bool no_intr)
 	if (list_is_singular(&release->bos))
 		return 0;
 
-	ret = ttm_eu_reserve_buffers(&release->ticket, &release->bos,
-				     !no_intr, NULL);
-	if (ret)
-		return ret;
-
-	list_for_each_entry(entry, &release->bos, tv.head) {
-		struct qxl_bo *bo = to_qxl_bo(entry->tv.bo);
-
-		ret = qxl_release_validate_bo(bo);
-		if (ret) {
-			ttm_eu_backoff_reservation(&release->ticket, &release->bos);
-			return ret;
+	drm_exec_init(&release->exec, !no_intr);
+	drm_exec_while_not_all_locked(&release->exec) {
+		list_for_each_entry(entry, &release->bos, list) {
+			ret = drm_exec_prepare_obj(&release->exec,
+						   &entry->bo->tbo.base,
+						   1);
+			drm_exec_break_on_contention(&release->exec);
+			if (ret)
+				goto error;
 		}
 	}
+
+	list_for_each_entry(entry, &release->bos, list) {
+		ret = qxl_release_validate_bo(entry->bo);
+		if (ret)
+			goto error;
+	}
 	return 0;
+error:
+	drm_exec_fini(&release->exec);
+	return ret;
 }
 
 void qxl_release_backoff_reserve_list(struct qxl_release *release)
@@ -245,7 +248,7 @@ void qxl_release_backoff_reserve_list(struct qxl_release *release)
 	if (list_is_singular(&release->bos))
 		return;
 
-	ttm_eu_backoff_reservation(&release->ticket, &release->bos);
+	drm_exec_fini(&release->exec);
 }
 
 int qxl_alloc_surface_release_reserved(struct qxl_device *qdev,
@@ -404,18 +407,18 @@ void qxl_release_unmap(struct qxl_device *qdev,
 
 void qxl_release_fence_buffer_objects(struct qxl_release *release)
 {
-	struct ttm_buffer_object *bo;
 	struct ttm_device *bdev;
-	struct ttm_validate_buffer *entry;
+	struct qxl_bo_list *entry;
 	struct qxl_device *qdev;
+	struct qxl_bo *bo;
 
 	/* if only one object on the release its the release itself
 	   since these objects are pinned no need to reserve */
 	if (list_is_singular(&release->bos) || list_empty(&release->bos))
 		return;
 
-	bo = list_first_entry(&release->bos, struct ttm_validate_buffer, head)->bo;
-	bdev = bo->bdev;
+	bo = list_first_entry(&release->bos, struct qxl_bo_list, list)->bo;
+	bdev = bo->tbo.bdev;
 	qdev = container_of(bdev, struct qxl_device, mman.bdev);
 
 	/*
@@ -426,14 +429,12 @@ void qxl_release_fence_buffer_objects(struct qxl_release *release)
 		       release->id | 0xf0000000, release->base.seqno);
 	trace_dma_fence_emit(&release->base);
 
-	list_for_each_entry(entry, &release->bos, head) {
+	list_for_each_entry(entry, &release->bos, list) {
 		bo = entry->bo;
 
-		dma_resv_add_fence(bo->base.resv, &release->base,
+		dma_resv_add_fence(bo->tbo.base.resv, &release->base,
 				   DMA_RESV_USAGE_READ);
-		ttm_bo_move_to_lru_tail_unlocked(bo);
-		dma_resv_unlock(bo->base.resv);
+		ttm_bo_move_to_lru_tail_unlocked(&bo->tbo);
 	}
-	ww_acquire_fini(&release->ticket);
+	drm_exec_fini(&release->exec);
 }
-
-- 
2.34.1

