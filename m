Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EF9674719
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 00:20:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D87410E0AB;
	Thu, 19 Jan 2023 23:20:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB5AC10E0AB
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 23:20:32 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id 207so2722388pfv.5
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 15:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/8VFYGKVQDx9YS3Bf+JaHr5ao9ClGu3C5S4SGB4QR9A=;
 b=SN+eVLi1DRWR6rpSY2PJV70czrUs98v9bI5D2abVAhBXs5JbxT/xeCGOi/5PrneIJv
 z8ts8tKo4C2kelodjYn8/A81cUlm28upoURRlm+J3SwgKIC01dXP2G9mlfR21jEHagOt
 AgdpBaAAlgbn1ztP2fKNvRA16SRAE6fd/KNyNSMEp3yG90WZUR6JdDwzIEuZ60GMMBIE
 0XW8EH0lnzwVIF2gaOHYmtuS8/6EgJrt7pM2GPYjOpyq+cVDOixiF7Uz5YrybdLgs16/
 FgdBrfm+RiuTgWcb7GVH3jUu5b05CKFys9IlL3fkrZvq7rmH07TFi4ZX/XR8GLWNyRjK
 HeGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/8VFYGKVQDx9YS3Bf+JaHr5ao9ClGu3C5S4SGB4QR9A=;
 b=FtZAv3ALlGkDzAbSNPJmfxYyxDYRpE+jjkTkcwpmJ0sMrVenzL8rBh4aw/itAtnNzW
 l2j0cbMYRHGXmI0VAp40BornZm00g/tDnQ+/NwHsAGsrLG/sFFi/YW2LJQaXi8PWQXrd
 7T6vXbiHBGbeDC2ZxTuTGKlv5LDvAKhyC4NKfyu9pPKnD/BtSkJgf1kF2A91WSNR+/vf
 8IGEtodBH92LK4Y+jR9hWf2+8qu9Roj16cziFtIoha9SrtPl3N0dCLWF3v/t+Ht5Mt2e
 9ol7tImSgU9H/P9YrrppnGiaFqm8vTXUYk9d08d6y/yhVCbzPP8Vg0vEmqkRZVYRYGTP
 pYhQ==
X-Gm-Message-State: AFqh2kq/0cpNvKbpYUEcsygisFbXXetOLRb126pmgd7SobYmvTqraXTa
 68BD/TqU8tcEfOoYTzToeqPyeKAf7HI=
X-Google-Smtp-Source: AMrXdXurMgRBKbvVa+DeeN1KDnY9oIpSJ0B1l7OtzdgBetQn9I69jfzDhB7UqBrcd/mZIzoZShPITQ==
X-Received: by 2002:aa7:8506:0:b0:58d:966b:2f63 with SMTP id
 v6-20020aa78506000000b0058d966b2f63mr11421708pfn.20.1674170432247; 
 Thu, 19 Jan 2023 15:20:32 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 d8-20020aa797a8000000b0058837da69edsm21036005pfq.128.2023.01.19.15.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 15:20:31 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/exynos: Drop unbalanced obj unref
Date: Thu, 19 Jan 2023 15:20:37 -0800
Message-Id: <20230119232037.2885568-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.38.1
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
Cc: Rob Clark <robdclark@chromium.org>, "open list:ARM/SAMSUNG S3C,
 S5P AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, "moderated list:ARM/SAMSUNG S3C,
 S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

In the error path, exynos_drm_gem_mmap() was dropping an obj reference
that it doesn't own.

Fixes: 832316c704fe ("drm/exynos: use drm generic mmap interface")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/exynos/exynos_drm_gem.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index 3e493f48e0d4..65bca61e63a3 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -363,7 +363,6 @@ int exynos_drm_gem_dumb_create(struct drm_file *file_priv,
 static int exynos_drm_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 {
 	struct exynos_drm_gem *exynos_gem = to_exynos_gem(obj);
-	int ret;
 
 	if (obj->import_attach)
 		return dma_buf_mmap(obj->dma_buf, vma, 0);
@@ -383,16 +382,7 @@ static int exynos_drm_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct
 		vma->vm_page_prot =
 			pgprot_noncached(vm_get_page_prot(vma->vm_flags));
 
-	ret = exynos_drm_gem_mmap_buffer(exynos_gem, vma);
-	if (ret)
-		goto err_close_vm;
-
-	return ret;
-
-err_close_vm:
-	drm_gem_vm_close(vma);
-
-	return ret;
+	return exynos_drm_gem_mmap_buffer(exynos_gem, vma);
 }
 
 /* low-level interface prime helpers */
-- 
2.38.1

