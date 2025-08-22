Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B505B31B87
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 16:30:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FA210EB1C;
	Fri, 22 Aug 2025 14:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gfxstrand-net.20230601.gappssmtp.com header.i=@gfxstrand-net.20230601.gappssmtp.com header.b="tMgOERiS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F7FF10EB1C
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 14:30:11 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-4b109c58e29so36004591cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 07:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20230601.gappssmtp.com; s=20230601; t=1755873010; x=1756477810;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AAQT3tVMiw/+72khjzNqX2WWn9Vk6gGlgsjlNt3pC24=;
 b=tMgOERiSYQsRI8x2IzDzoS74OzCNgheWT0dGa+qexUbRqYHIa91BnMnm4NIQNI0ddQ
 KEcfbrgGo0qJBzY3zEFaKQ/Kb7/ug2UXt/MHmEBJQDwGIXCaGH1U4ZwmJ0CILY9t31X6
 zJ/LN52MC66ZBlz5P7RICGgbYff3IOeIQEF95xzp4i+Kif1AjZgUOWfzEuUB8Py/MTap
 U7v42iBZ2RrtR6aM3ujtF43WrOI9KqfI0/wIWy9Zv7Yftu8gf+d0EdEC+GSBC8XVeLTP
 3+0r5KPZMrV9Ylo0e+1KvSUQXEWggBdWhlQ7R6WNAqFgjzttMtVJHkk+tRGWGApGQw/C
 LItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755873010; x=1756477810;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AAQT3tVMiw/+72khjzNqX2WWn9Vk6gGlgsjlNt3pC24=;
 b=mxXlgHIULOlNliQ9Ejhsf+ZqriBYJdVaUM1yM++DqrqQes7fn63KUDOoSe3Ao8OYBJ
 H+p6ohFa6exQL+vjDEvcYU7aKUGKM8Vd2A6uY9W3htb+8mMFPHO5jGyrLGsKYupkfMKS
 xgfdEodn2SnQ1JaHmqgCruzWuP4UKrnSbe7O10V7IUoVwYb+CT1+eX/LdI6HsxZPF35K
 bCowaYYdQDl1fLtqJKRNXbG9CZmNkQ/0d8IuJSihqotnJ84JxcI0ZjhuIo4DZCiABYjV
 RKIiQhgZheeZaWuf7RCH6SPBreBYEhhqlCamQIsbiJd22Q7uheTMOA3JPiChUunhJJ12
 NPSA==
X-Gm-Message-State: AOJu0YzOYhYHWSW20+YRAsn+jFBHqBzsKL7dmrP5aHIGIkbmkUEHWnoj
 yGj1DwW3AxSRMHuo0AU5e6L3guOmDL+r5k1VTuXc/nqxtoN+PWH0gTVYrSf89tH4UmcE7dvtFW7
 WNvdf0bE=
X-Gm-Gg: ASbGncvqNE4qvifaOcrmE8IiKzy1aJjG3km8T6fpPTpYbme5LTGr8SqIdEz9Y1pEfKz
 45iCN+ODxVjQj4HGP+P66kIgk/ur4WqIhYHI2/bGfiOFSeT3ag8M4rizNOjyI/HkxbIAQvqaxVT
 f+P3oAWkuvgAWdDDsni3Ms3CJyZSoJs3r2IHeL4uCMNKAdiTs0XbY7Ym3ucAuysaGS03h6Ga5QQ
 wXPpQWpEvygGGT3S6C7rmq8JiXKyOAe6WGmiTH7R4gO3GxNFWO17ys3dvOSoP3EUK1BIi1Wohh/
 BfViUM++IGtWAmtUjXgfcjQgC2sWTg8XBKL248uMBBeSX1yxlt3owbYDj9sKgtvcBQ3WsF9Tt+B
 IjCta6iX3VKMurHAyc/kys/o0af+9WzM=
X-Google-Smtp-Source: AGHT+IEvkc9EFYvtE5ILe/iO8JuK4/M+0/3+2wFTkNQAeZoxs+bBpsIoh4ewzICxIaW1OAxT2JXwCA==
X-Received: by 2002:a05:622a:1bab:b0:4b1:bf:399 with SMTP id
 d75a77b69052e-4b2aaaa8317mr42886341cf.23.1755873010066; 
 Fri, 22 Aug 2025 07:30:10 -0700 (PDT)
Received: from kermit.lan ([65.93.159.244]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b2b8e6023asm420131cf.53.2025.08.22.07.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 07:30:09 -0700 (PDT)
From: Faith Ekstrand <faith@gfxstrand.net>
X-Google-Original-From: Faith Ekstrand <faith.ekstrand@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Lo=C3=AFc=20Molinari?= <loic.molinari@collabora.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Subject: [PATCH 2/7] drm/panthor: Add flag to map GEM object Write-Back
 Cacheable
Date: Fri, 22 Aug 2025 10:29:11 -0400
Message-ID: <20250822142954.902402-3-faith.ekstrand@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250822142954.902402-1-faith.ekstrand@collabora.com>
References: <20250822142954.902402-1-faith.ekstrand@collabora.com>
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

From: Loïc Molinari <loic.molinari@collabora.com>

Signed-off-by: Loïc Molinari <loic.molinari@collabora.com>
Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c |  7 ++++++-
 drivers/gpu/drm/panthor/panthor_gem.c |  3 +++
 include/uapi/drm/panthor_drm.h        | 10 ++++++++++
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 1116f2d2826e..06ae6a2aeb16 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -899,7 +899,8 @@ static int panthor_ioctl_vm_destroy(struct drm_device *ddev, void *data,
 	return panthor_vm_pool_destroy_vm(pfile->vms, args->id);
 }
 
-#define PANTHOR_BO_FLAGS		DRM_PANTHOR_BO_NO_MMAP
+#define PANTHOR_BO_FLAGS		(DRM_PANTHOR_BO_NO_MMAP | \
+					 DRM_PANTHOR_BO_WB_MMAP)
 
 static int panthor_ioctl_bo_create(struct drm_device *ddev, void *data,
 				   struct drm_file *file)
@@ -918,6 +919,10 @@ static int panthor_ioctl_bo_create(struct drm_device *ddev, void *data,
 		goto out_dev_exit;
 	}
 
+	if ((args->flags & DRM_PANTHOR_BO_NO_MMAP) &&
+	    (args->flags & DRM_PANTHOR_BO_WB_MMAP))
+		return -EINVAL;
+
 	if (args->exclusive_vm_id) {
 		vm = panthor_vm_pool_get_vm(pfile->vms, args->exclusive_vm_id);
 		if (!vm) {
diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index a123bc740ba1..530bad12d545 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -283,6 +283,9 @@ panthor_gem_create_with_handle(struct drm_file *file,
 	bo = to_panthor_bo(&shmem->base);
 	bo->flags = flags;
 
+	if (flags & DRM_PANTHOR_BO_WB_MMAP)
+		shmem->map_wc = false;
+
 	if (exclusive_vm) {
 		bo->exclusive_vm_root_gem = panthor_vm_root_gem(exclusive_vm);
 		drm_gem_object_get(bo->exclusive_vm_root_gem);
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index e1f43deb7eca..bf47369c0220 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -635,6 +635,16 @@ struct drm_panthor_vm_get_state {
 enum drm_panthor_bo_flags {
 	/** @DRM_PANTHOR_BO_NO_MMAP: The buffer object will never be CPU-mapped in userspace. */
 	DRM_PANTHOR_BO_NO_MMAP = (1 << 0),
+
+	/**
+	 *@DRM_PANTHOR_BO_WB_MMAP: Force "Write-Back Cacheable" CPU mapping.
+	 *
+	 * CPU map the buffer object in userspace by forcing the "Write-Back
+	 * Cacheable" cacheability attribute. The mapping otherwise uses the
+	 * "Non-Cacheable" attribute if the ACE-Lite coherency protocol isn't
+	 * supported by the GPU.
+	 */
+	DRM_PANTHOR_BO_WB_MMAP = (1 << 1),
 };
 
 /**
-- 
2.50.1

