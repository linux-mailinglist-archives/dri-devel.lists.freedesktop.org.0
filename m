Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA446A5477
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 09:34:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 198BB10E655;
	Tue, 28 Feb 2023 08:34:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 592D410E64D;
 Tue, 28 Feb 2023 08:34:20 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id o15so34045680edr.13;
 Tue, 28 Feb 2023 00:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RnOLuzBIHXd8N7NdPWm8ajKMgx1StmqHBUkyiupwMv8=;
 b=hm4c0pvjqX1fMtpUFxwCwMRES+V0XSi0Yx2BAfT4EQ0XvAh6pgMIEpMa2aQNv1SzQu
 KN9/xEwhNzWVagW2fhH2fZhIaj8Oj75XCLjHFXQ45ACUSrpao1UoVHvYhxiPbxLgXml0
 mU5eS+z3q5bko18q2403mvF4we7FMP0kMa7jo0BIj84eWaE2drSIJGs2ynlanzpItx8v
 t2ZqwTtBrtHOD0frfRhlq262GHgIXK5Mg4LtYEPaKCC+6ir+fkEUtLQoht+4Sks38y+N
 UnZLOlOyw0ykfkhFII4haBRN85TN2Jo8vy2QedWQ8tJi91oNfwsUlY9J1m68FYlG+p0L
 EXHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RnOLuzBIHXd8N7NdPWm8ajKMgx1StmqHBUkyiupwMv8=;
 b=QL2sScpEDqx4A8l53HyiTuO6LHe1xnepd9Kcu12HWQMw/tICwIjzdIcGa3zBetEf+/
 4Nv8IUXFPWFz6nJTYx+KrJ64lDnGFmux2m7py3wuA9y+lQmI/yP3spHQSpVIZbub+vvZ
 7gDmJuWMldiCv5mFh0kYsRGETFt9Nz+/u5e6Jf3ACNZJUg6YWRdisJYGYtb0FTzS1br8
 dlVV9RV8IQrqnGhHzro1OuoCcr2TBMc/q6x6YNRT0HNTeokbMd2TbhOr4EUV72InRMOQ
 oszuEFD6Q5bEbxgZoRAnk8vEUdpj0gssiUIdT1D2oc4aCw+W9np+afimmlJvLzIxgHCg
 iQ6w==
X-Gm-Message-State: AO0yUKVlgqEX6JcOO2i0xWeu7tN7YncdXCJSMN+VoUBqcmtmGpTArN/t
 Q9w2J1b9RapmDYm7oq82/zHbtDlHAhA=
X-Google-Smtp-Source: AK7set/Gj6j8lk/pcLMglOxXHpU0XW8VruRW1IMOGmRGKqZqyNfoCnn9jFAk5oTg4GGx1uK1YgIE7Q==
X-Received: by 2002:a17:906:1803:b0:885:5682:7e52 with SMTP id
 v3-20020a170906180300b0088556827e52mr1591386eje.13.1677573258932; 
 Tue, 28 Feb 2023 00:34:18 -0800 (PST)
Received: from able.fritz.box (p5b0ea2e7.dip0.t-ipconnect.de. [91.14.162.231])
 by smtp.gmail.com with ESMTPSA id
 ss17-20020a170907039100b008cf6f8798e1sm4296969ejb.54.2023.02.28.00.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 00:34:18 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 8/9] drm/qxl: switch to using drm_exec
Date: Tue, 28 Feb 2023 09:34:05 +0100
Message-Id: <20230228083406.1720795-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230228083406.1720795-1-christian.koenig@amd.com>
References: <20230228083406.1720795-1-christian.koenig@amd.com>
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
Cc: dakr@redhat.com, arunpravin.paneerselvam@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just a straightforward conversion without any optimization.

Only compile tested for now.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/qxl/qxl_drv.h     |  7 ++--
 drivers/gpu/drm/qxl/qxl_release.c | 67 ++++++++++++++++---------------
 2 files changed, 38 insertions(+), 36 deletions(-)

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

