Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C031C39E502
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 19:11:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08FE89E08;
	Mon,  7 Jun 2021 17:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9219989E08
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 17:11:54 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id c5so18441214wrq.9
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun 2021 10:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Egtr2GG3wGFrHEgpynwP7bBI8pqTMK+eY9RSIZkTjSM=;
 b=sozaCgN544PugTDTIfAQzQ0TVyjjx0tPwcFu4QTKg5V7vWZrgAyZMofyMH1xWsgJnE
 OjN1GFIqwi2bOdtHVDOtXB1I3YXK1V1ipvceoq0ywsJNfPOaisTmLfKdM4smy12kYTYl
 nKscn/NzzLpuXwumEOr1eVfZ7+r8wDsJ4pugPyD6zF3NoqZuPZz/tv23Dn35wQ8eh8Jd
 WM5r0xL2xEvpNfuZdnrQWwutW5p0ZfFV/INJ9aFJeBeb9fnBKiEO0lcpyWv/sj5HM572
 hjvFfRjvVPlDwn5zaUHPU+D7m9g2z14T3xYwfh8DrwVcROA64eALn/54DikSFp7CvESF
 77aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Egtr2GG3wGFrHEgpynwP7bBI8pqTMK+eY9RSIZkTjSM=;
 b=nRxyezu4kA7LvzyfpYj8vEqPuzHNYjic++9zhKD3kv2e+Bq3TPhW1vgoz+Dlc65rJC
 QGl3lS8uMCHJqgPCmZfjaKbo2JYgTLvKo+oak3VJFn3kTdc7tn2uAv+1tZJYD+dEPXct
 zmdYxh7TmpttZZKywIvy8v5AcJSno2o5wpfzr5YSVZ44Xcm4ogzpIryuhgPQQII1d3JO
 rafU1aZbOF7gwhPCuCCUN6r6Yf6Rttg3xgD+NW4I+xCA9m3H9sErbXLEjCtQuS+AEDTl
 zYjpZkR6CKWgUNiHkSpUQ4+ao+MgQzXhvNT86urlCnXbSkUWjmNmDECFjNuS14W60x4G
 TovQ==
X-Gm-Message-State: AOAM531ijHJ6REEiCmu3hwdyBhHhg5oiCT22OHTgxEqQDrfJyR4+Wph4
 rKhx5Wrg+ki9/+csGCRxwfspvJKNCDM=
X-Google-Smtp-Source: ABdhPJwQizRds2TYS4KyGTLLZeaKaKWPo2d1FsIT8VHWATDO21gHPD1TZVN7PRaxWgywoaQ4Yc0VhA==
X-Received: by 2002:adf:dec3:: with SMTP id i3mr4440562wrn.190.1623085913378; 
 Mon, 07 Jun 2021 10:11:53 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:f8b0:909c:7b9:b4ae])
 by smtp.gmail.com with ESMTPSA id u20sm10272467wmq.24.2021.06.07.10.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 10:11:53 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas_os@shipmail.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: fix access to uninitialized variable.
Date: Mon,  7 Jun 2021 19:11:52 +0200
Message-Id: <20210607171152.15914-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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

The resource is not allocated yet, so no chance that this will work.

Use the placement instead.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 7e7284da5630..0c74f4cb2a3b 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -736,7 +736,7 @@ static int ttm_bo_mem_force_space(struct ttm_buffer_object *bo,
 	struct ww_acquire_ctx *ticket;
 	int ret;
 
-	man = ttm_manager_type(bdev, (*mem)->mem_type);
+	man = ttm_manager_type(bdev, place->mem_type);
 	ticket = dma_resv_locking_ctx(bo->base.resv);
 	do {
 		ret = ttm_resource_alloc(bo, place, mem);
-- 
2.25.1

