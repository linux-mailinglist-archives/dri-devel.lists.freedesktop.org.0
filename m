Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B74952CFEA
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 11:56:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BD0611B33E;
	Thu, 19 May 2022 09:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32E4511B32A;
 Thu, 19 May 2022 09:55:15 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id c10so6358541edr.2;
 Thu, 19 May 2022 02:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IB7d24hbSCy3UNTFAJGBnnzly76CJzsYCB4qu4XP4Tc=;
 b=MGb/YcG4zrRDRdKpdsAHAjwwoUOWj/k2ujH5lQ9W/ufOee3vAswJPvEZYv0iO3iDKS
 rGblyFcndgR5nf9X20gts3gilkFzX9jcxva8opb3ifgB3/Uq2lSOXz++6kFT2W9Olvsx
 7+wjTy7EfMJHxazu/uiqA+4GS7a7JlgModnBjtokqbgc0lNQ0O/HeCHQ08pKGzghrMdd
 JT3YVkz0hKSTEeJtFiz7TAKhUOF8k4AP8I/7rG3iYxlxmu6AY5PGkP3bgaMBo+rq9lam
 /SpESHH1pylsEHL1h5oh1GgTjNawV70UYmyec0gV4o54AwpW/FJi6JsLWno0L4jH5m6X
 gviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IB7d24hbSCy3UNTFAJGBnnzly76CJzsYCB4qu4XP4Tc=;
 b=5rom4YcpxRN6D/l+4hSbVbZOV3W7bPdoJXycPALGDOYhEoOaX02y/XK5GEIV9DMTxr
 A3Qi2a30tNJrtxt+RIcb0YP9e55aNmGKdfHb/GONKxPM6uKxWa2h9RrMArFpbMD9XsXt
 6hoMn9qfiILbx2E9tkUqssfa/1maknuhKAFOZC+onAQ67DUsb4hk/OAB/KI4EuSAO86G
 Ue3/kzhA3dabX9vv2Z6AibKdsjcV/Gqr/wr/Kr1VmLXt+0tKk1OOL+EJiUOXTFNvK5Yw
 GkSXEIefNOyxcgMubDox908W98P+WKjrTYsmd+dKcKOm8+ssV71j9uZ9+ZgNVNsCb9Hd
 Ll5A==
X-Gm-Message-State: AOAM533IzBGM0RFGxz5RBMDfHiVDj9eEM44F4p+s04XKTPrkPO4RamXU
 Z+5LmqjG4mW/3HD3a+0rvtUm5LnoIQo=
X-Google-Smtp-Source: ABdhPJzvj0hrRLgWewqcnZ8VfEvjMVNtyfXXoJmWvGbz0EQU7dzzkkokrjaWPdD2vkSMA+rqSRFG4w==
X-Received: by 2002:a05:6402:363:b0:42a:aa92:c302 with SMTP id
 s3-20020a056402036300b0042aaa92c302mr4466546edw.386.1652954113680; 
 Thu, 19 May 2022 02:55:13 -0700 (PDT)
Received: from able.fritz.box (p57b0bdaa.dip0.t-ipconnect.de. [87.176.189.170])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a170906518600b006fe9c65ffb8sm388267ejk.92.2022.05.19.02.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 02:55:13 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 03/11] drm/vram-helper: switch over to ttm_bo_init_reserved
Date: Thu, 19 May 2022 11:55:00 +0200
Message-Id: <20220519095508.115203-4-christian.koenig@amd.com>
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

