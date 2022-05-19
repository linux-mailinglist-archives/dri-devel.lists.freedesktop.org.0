Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4841C52CFE2
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 11:55:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F1511B333;
	Thu, 19 May 2022 09:55:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1647411B2C0;
 Thu, 19 May 2022 09:55:20 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id i19so8835391eja.11;
 Thu, 19 May 2022 02:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9P3zYs6bGaCRflL6U752X074Zpse7jskvqxYho/Uxf4=;
 b=Ji4m6iZL7jEjPG3qV/oPU/CK80RybvPGrqPUv3Q7H9WzhNa9qKEqxknaBzBym5dBIU
 KkTS07KQK+qiC5vIurVt1vaDQvTjcvokm83loDPuSgPyBmgr3No51cl0krr0vYGu9FQc
 NAb2XeXpsinHRn5FM+5ChYfqtbYoycKN+ZLmomaZzpEJ3VM9tVdLsBAXYklx4nsU8jXw
 lRfkzj47qGRJEQ8iTNrt6q5st7QNuqraieLgBzC0xyj5vJA6JeBH+qtNEdKrO0fEpfJc
 XvYl2BHp4rGMZLI1P/FsA8caHuzWVHO694J4K69DBqK2ERi+DZIqIvOs9V1Q3vnqO8ML
 MN1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9P3zYs6bGaCRflL6U752X074Zpse7jskvqxYho/Uxf4=;
 b=HRzG8mmsa0RsuOwx/UunlTGzZ4lCU5RtjpbVqENmVfs1HkQCETzh7/ZN9qWiJcnlM8
 GHS1qJ78lBkJAo2pYQqaTgzCDzdQJ7eVbpkeeqFyWFIft2mbjRgeDYHU5amCoI0eGLTC
 tLOCwUzddQgz8nWcqTn+sQtw6tVh/xDlYWZEaI4G0RttLS0FWnNIEDTuYRyomfOsPFkd
 pHNhiW5JNvt/K+1nQ1EcIj/7NFjBURmoYhhtK43ljCfX6Vp0Ka+guhFNPqkcwuFBrARO
 sTMhnlLqQa4BMW9mJVYAkXxxqJhBsefI+AI3SJI/UUMWNKI6kyy1SDGW7dzcM2kFmeWF
 6rgg==
X-Gm-Message-State: AOAM5306uev2qpyNSz2oLd5yl48jlDn+xI1avc51Td7U4F+zEBa37Gt0
 +g9N6TED0kFi8GAEdJccW4iMIgJjWvY=
X-Google-Smtp-Source: ABdhPJw9dt14VMpNJ6IhJWdyzU8dWD6QTLEfRk8OJhfj+Xz8S+Y8AwOVHwkkvStJTco3lLCgGbWH5Q==
X-Received: by 2002:a17:906:8301:b0:6e4:896d:59b1 with SMTP id
 j1-20020a170906830100b006e4896d59b1mr3377239ejx.396.1652954118681; 
 Thu, 19 May 2022 02:55:18 -0700 (PDT)
Received: from able.fritz.box (p57b0bdaa.dip0.t-ipconnect.de. [87.176.189.170])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a170906518600b006fe9c65ffb8sm388267ejk.92.2022.05.19.02.55.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 02:55:18 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 08/11] drm/nouveau: audit bo->resource usage
Date: Thu, 19 May 2022 11:55:05 +0200
Message-Id: <20220519095508.115203-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519095508.115203-1-christian.koenig@amd.com>
References: <20220519095508.115203-1-christian.koenig@amd.com>
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
Cc: matthew.william.auld@gmail.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make sure we can at least move and release BOs without backing store.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 666941804297..fb903c62d322 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1010,7 +1010,8 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
 	}
 
 	/* Fake bo copy. */
-	if (old_reg->mem_type == TTM_PL_SYSTEM && !bo->ttm) {
+	if (!old_reg || (old_reg->mem_type == TTM_PL_SYSTEM &&
+			 !bo->ttm)) {
 		ttm_bo_move_null(bo, new_reg);
 		goto out;
 	}
-- 
2.25.1

