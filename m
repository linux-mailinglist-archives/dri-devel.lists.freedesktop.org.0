Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7ED67B639
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 16:50:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF0710E7F2;
	Wed, 25 Jan 2023 15:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A66310E064;
 Wed, 25 Jan 2023 15:50:28 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id vw16so48775276ejc.12;
 Wed, 25 Jan 2023 07:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A7s+zcG+Jvy1ETp3kyJm5MZOt4i9aTMhK4xPQgp1cXI=;
 b=IMi13qDJQYX+K/HYIQOfVan0JHLHVX3nEaH6+C/flxc62qy1EcExuVzaJXDKeKGrMf
 SBiwtVBPiSX4oIF1iPfmNebnzcDSX8TTgzpl98gZ8LN0DH0alubaa+pvWFdZX+zK0Inv
 or+oRPtG2ymdW5mYmFxwYeh1Jy0RwZjC2AZTPWlgmjbWahjuYu/dwsSx4uAac7B/fDVk
 yblLgeEaIKDKvaJPFbqoqIYV0rcMPrFuZ8oWJlCf0g+ryhX0rCRE+bqxBtpXTzsJOFA2
 aJxqpAc/sD4BJeb3HNJ9SDUX+g7s/2BT4+NKXpT/EjZKuNdEXL89ag9LPFtmvDIHx+Wq
 P+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A7s+zcG+Jvy1ETp3kyJm5MZOt4i9aTMhK4xPQgp1cXI=;
 b=i18JdPx6S4UB/pEuarYMx2twRFjCn89o322T11myNqgzu16yL1R8U1lli3h7G0C3NK
 Ql3P0hD7rvZQ4tSTgZA2l1qnCbddmhy791+KFpSBGwu4HVcWkOlo3JI2BB+DcBrv35tQ
 IoKKYKd0QiSeQUqHxzPqXr0VKa9spiQJ/4bidhcNjN6xoFQdIq8i/weP9mKe3XJGAFpa
 Z7xa/rURkM/YIa7OxKpDPn+CICBj42GtwJfhNcoXOZj8yMtGeUIWCmoHV/JyhS0ChyQ3
 fxSDvompOu8LpsWKmwhsc834lYk8npIMul/VTOxb8i4jNlbGQ8UoB+EyYzj2n9b0uy4q
 QHQQ==
X-Gm-Message-State: AFqh2kr1Qqtwgcy9e1r9LzRiqlOvH3PKZeqNOT9JP9JFlkoiYQQlUdGv
 ghVBEf4WE0DhmxYG9mgxo0g=
X-Google-Smtp-Source: AMrXdXsZcw9cBL/ZwUP6Up4MwLIs/bpfB7mUdMZqzLbV0aL/Tihn1huhpOcz62YjR9drfz2i3TwEsA==
X-Received: by 2002:a17:907:629c:b0:86e:9345:e701 with SMTP id
 nd28-20020a170907629c00b0086e9345e701mr44140029ejc.2.1674661826590; 
 Wed, 25 Jan 2023 07:50:26 -0800 (PST)
Received: from EliteBook.fritz.box ([2a02:908:1256:79a0:180c:8737:8e57:6be7])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a1709063e8700b007ad69e9d34dsm2561609ejj.54.2023.01.25.07.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 07:50:26 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.william.auld@gmail.com, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/ttm: revert "stop allocating dummy resources during
 BO creation"
Date: Wed, 25 Jan 2023 16:50:23 +0100
Message-Id: <20230125155023.105584-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230125155023.105584-1-christian.koenig@amd.com>
References: <20230125155023.105584-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 00984ad39599bb2a1e6ec5d4e9c75a749f7f45c9.

It seems to still breka i915.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 33471e363ff4..9baccb2f6e99 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -957,6 +957,7 @@ int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,
 			 struct sg_table *sg, struct dma_resv *resv,
 			 void (*destroy) (struct ttm_buffer_object *))
 {
+	static const struct ttm_place sys_mem = { .mem_type = TTM_PL_SYSTEM };
 	int ret;
 
 	kref_init(&bo->kref);
@@ -973,6 +974,12 @@ int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,
 		bo->base.resv = &bo->base._resv;
 	atomic_inc(&ttm_glob.bo_count);
 
+	ret = ttm_resource_alloc(bo, &sys_mem, &bo->resource);
+	if (unlikely(ret)) {
+		ttm_bo_put(bo);
+		return ret;
+	}
+
 	/*
 	 * For ttm_bo_type_device buffers, allocate
 	 * address space from the device.
-- 
2.34.1

