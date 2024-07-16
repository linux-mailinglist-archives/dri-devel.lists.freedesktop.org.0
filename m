Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0F49326AC
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 14:35:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB38C10E6D4;
	Tue, 16 Jul 2024 12:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hlFb4PLn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B0CE10E6BC
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 12:35:30 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3678fbf4a91so2756603f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 05:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721133328; x=1721738128; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DIfjtgN2/cxio1fcSzw3JuFkvzcTdAdpWmNLF/iaaDE=;
 b=hlFb4PLngHk84cmqMZkRrQu0FLPXeRGAfMsi3bPBXjMPRyHzQ+ESP1JRaBTNvrLYn+
 5sun+GwLzqUK4uRbqmfix9g+QvCn+WbUa3fV7OgFC/YpNhgQsPhb/J1PQAF+p3B/C44D
 eOeYvbBSHS/M8YFMxvO776hToumIUQwXtMi8phvqxwqKQn0mh5IE0wngP9glZFFMfme5
 AjRB1doDtBSp7L/1GwTQ0EX9dnIjMI3R1FWQti4pEU7Db1ufrMYZAzbknTyo+3/W2snY
 BrCc8zyoT2z6jdtCcb2mir4jSo+6q9FEDyXZXH/BcttCLEFB1912F9FSZ942VI/Wc/Tb
 MaTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721133328; x=1721738128;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DIfjtgN2/cxio1fcSzw3JuFkvzcTdAdpWmNLF/iaaDE=;
 b=bsa46kfXPY7HZAsJXUaxoyTGHWjYUg+Qi1xBEqisAEXmswPePaS4PWJ4k7nf62I+7l
 ClSq2ZG5hGzrz4aNhykeEG1GdTe1Ky0d9uO71ihg4J19dTR1dPHAyFVCssiDcUx62JGv
 l/Wq8JInSjNjqmADzLtJE8r4MUdtKUsbwTIvFYR6ARzY87/DfOhe8rAtbT0TJ1UBWQES
 wKOBYaLtrdlZdKdPMetV5aTV63oB1rfeJUREMzITrC8dLOKPxm9UuSGglDTCh8kXnbNj
 jh/i8aDCeDynad1Ff8uC/6emxHmxUVpEykOVGl2lTPEVp8FbrP5GYEX2vTZBKnneBGDd
 FmJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlQbh3PVFUbKbyUFGmxc0qi7eFBWPZ29AUuexkgt8rxEKiVrVHTCasjwdF6+QzjFIcSvb0kZWXnggbB/JdrTLZFFm43hb8bmXlRdd8qCq4
X-Gm-Message-State: AOJu0YzxtQDoJNLKr7G7020aNh/29HTxkHwwx0qBZ6EK6g5l9SBoyaZC
 xGz+dD7G5L/q2jm5dBt8yTxyRuXsUAdRTLxEyRULBKqsqOM/WTLQ
X-Google-Smtp-Source: AGHT+IFfwzYU8/CEOOTt5lqNKtSzORHpI02K1v8sVZq58Kj5hJymd3D4B3IChWtbXcEifxwoq2FvGg==
X-Received: by 2002:adf:f0cf:0:b0:367:9c4b:6486 with SMTP id
 ffacd0b85a97d-36826157b1fmr1231421f8f.32.1721133328168; 
 Tue, 16 Jul 2024 05:35:28 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1592:7f00:1c98:7fd3:7b80:1cc1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e77493sm127058225e9.7.2024.07.16.05.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 05:35:27 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 8/9] drm/ttm: use GEM references for VM mappings
Date: Tue, 16 Jul 2024 14:35:18 +0200
Message-Id: <20240716123519.1884-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240716123519.1884-1-christian.koenig@amd.com>
References: <20240716123519.1884-1-christian.koenig@amd.com>
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

Instead of a TTM reference grab a GEM reference whenever necessary for a
VM mapping.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_vm.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index 4212b8c91dd4..3f283b3433f8 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -58,13 +58,13 @@ static vm_fault_t ttm_bo_vm_fault_idle(struct ttm_buffer_object *bo,
 		if (vmf->flags & FAULT_FLAG_RETRY_NOWAIT)
 			return VM_FAULT_RETRY;
 
-		ttm_bo_get(bo);
+		drm_gem_object_get(&bo->base);
 		mmap_read_unlock(vmf->vma->vm_mm);
 		(void)dma_resv_wait_timeout(bo->base.resv,
 					    DMA_RESV_USAGE_KERNEL, true,
 					    MAX_SCHEDULE_TIMEOUT);
 		dma_resv_unlock(bo->base.resv);
-		ttm_bo_put(bo);
+		drm_gem_object_put(&bo->base);
 		return VM_FAULT_RETRY;
 	}
 
@@ -130,12 +130,12 @@ vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
 		 */
 		if (fault_flag_allow_retry_first(vmf->flags)) {
 			if (!(vmf->flags & FAULT_FLAG_RETRY_NOWAIT)) {
-				ttm_bo_get(bo);
+				drm_gem_object_get(&bo->base);
 				mmap_read_unlock(vmf->vma->vm_mm);
 				if (!dma_resv_lock_interruptible(bo->base.resv,
 								 NULL))
 					dma_resv_unlock(bo->base.resv);
-				ttm_bo_put(bo);
+				drm_gem_object_put(&bo->base);
 			}
 
 			return VM_FAULT_RETRY;
@@ -353,7 +353,7 @@ void ttm_bo_vm_open(struct vm_area_struct *vma)
 
 	WARN_ON(bo->bdev->dev_mapping != vma->vm_file->f_mapping);
 
-	ttm_bo_get(bo);
+	drm_gem_object_get(&bo->base);
 }
 EXPORT_SYMBOL(ttm_bo_vm_open);
 
@@ -361,7 +361,7 @@ void ttm_bo_vm_close(struct vm_area_struct *vma)
 {
 	struct ttm_buffer_object *bo = vma->vm_private_data;
 
-	ttm_bo_put(bo);
+	drm_gem_object_put(&bo->base);
 	vma->vm_private_data = NULL;
 }
 EXPORT_SYMBOL(ttm_bo_vm_close);
@@ -462,7 +462,7 @@ int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo)
 	if (is_cow_mapping(vma->vm_flags))
 		return -EINVAL;
 
-	ttm_bo_get(bo);
+	drm_gem_object_get(&bo->base);
 
 	/*
 	 * Drivers may want to override the vm_ops field. Otherwise we
-- 
2.34.1

