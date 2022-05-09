Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E4A51FD9B
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 15:10:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90FE810F194;
	Mon,  9 May 2022 13:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85DB10F19A
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 13:09:59 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id v12so19347918wrv.10
 for <dri-devel@lists.freedesktop.org>; Mon, 09 May 2022 06:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IB7d24hbSCy3UNTFAJGBnnzly76CJzsYCB4qu4XP4Tc=;
 b=HRGSQUQMveIpLQkr8iQqzTz0Tlkx+S1A3e+7cYblFq+Qp4q5YWnApTeDhIHnH5HZ0H
 /0QDH+TOvcu6X+w+I8iiIqEPyjP9b2qy0UYanK4ivFAjzkBQqe0w+ephgX2q97FoIE0V
 12TQ+EXT8uQ4Ph4UZtKla+QQzw5/ID7NuH0wcIY6HfEtrDTMMl5rQKT4NM5WcnGHDWtb
 MCq0tC3WLFihCWr3TXu3q90k41Hl5clXJwuQBFdMxX3KXyzMnqkcFp+3cE2y8KyDb/Nv
 vvY4RQA+7AEDSI5ZznVBPO2Rf5QwTUZl3jTCdLBm63J5K6ISSG1gNXAkZ2LZLnkEorvQ
 iIIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IB7d24hbSCy3UNTFAJGBnnzly76CJzsYCB4qu4XP4Tc=;
 b=X0p8EVTKtHqZST0Dz8biQ4Q2HuuAWCj2bcl9jpSsXXwPE5obKkHcONccEERzjLam8z
 JFw06+OrgCSDGUFcWwksGannX5yqpf9ju42IWag1bYVzDsVPa/dKa9MEpmUyLjH5Orym
 juOCMkDDVVwCwIfb5fUiZNLLp3dXqLvdt/lHY4EASzo52jBcYXbb9iudBL6jujK6crVj
 7cssM3EENvke+mwhNceZ2CylNKGRSnxiUjciWfFw1D0vEQDqv0vixVfLDPf2aekekRDs
 XVEST+gxa2tvkk9fk6N9GFnNiW0WfTojO1kRZQsEG85QFv4Z4+oJQuAAorSi6BqndfCQ
 qZAw==
X-Gm-Message-State: AOAM532UGwXqIoWYae2JdrtNqLkO48C/lOy3t1cqWcqy1K2xwe8S+orf
 gQ/0413rtO0pmutLKfNCQbA=
X-Google-Smtp-Source: ABdhPJw8wwGjdoAZKaWtQZWg9Fnbg4ILnOAbVSJdVRIQ7LVkE+Gdg9DEioQT1f5Pna6DplR/eE1/tw==
X-Received: by 2002:adf:e112:0:b0:206:d12:9c3a with SMTP id
 t18-20020adfe112000000b002060d129c3amr13778402wrz.391.1652101798335; 
 Mon, 09 May 2022 06:09:58 -0700 (PDT)
Received: from able.fritz.box (p57b0b3fd.dip0.t-ipconnect.de. [87.176.179.253])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a05600c2f9000b003942a244f50sm18683385wmn.41.2022.05.09.06.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 06:09:57 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: bob.beckett@collabora.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch
Subject: [PATCH 03/11] drm/vram-helper: switch over to ttm_bo_init_reserved
Date: Mon,  9 May 2022 15:09:43 +0200
Message-Id: <20220509130951.486344-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509130951.486344-1-christian.koenig@amd.com>
References: <20220509130951.486344-1-christian.koenig@amd.com>
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

Use the new interface instead.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 123045b58fec..7449cbc2f925 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -186,6 +186,7 @@ struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
 						size_t size,
 						unsigned long pg_align)
 {
+	struct ttm_operation_ctx ctx = { false, false };
 	struct drm_gem_vram_object *gbo;
 	struct drm_gem_object *gem;
 	struct drm_vram_mm *vmm = dev->vram_mm;
@@ -225,12 +226,13 @@ struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
 	 * A failing ttm_bo_init will call ttm_buffer_object_destroy
 	 * to release gbo->bo.base and kfree gbo.
 	 */
-	ret = ttm_bo_init(bdev, &gbo->bo, size, ttm_bo_type_device,
-			  &gbo->placement, pg_align, false, NULL, NULL,
-			  ttm_buffer_object_destroy);
-	if (ret)
+	ret = ttm_bo_init_reserved(bdev, &gbo->bo, size, ttm_bo_type_device,
+				   &gbo->placement, pg_align, &ctx, NULL, NULL,
+				   ttm_buffer_object_destroy);
+        if (ret)
 		return ERR_PTR(ret);
 
+	ttm_bo_unreserve(&gbo->bo);
 	return gbo;
 }
 EXPORT_SYMBOL(drm_gem_vram_create);
-- 
2.25.1

