Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEB73C9AD1
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 10:45:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0089189DA3;
	Thu, 15 Jul 2021 08:44:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10BE86E3C6
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 14:54:33 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id p36so2239740pfw.11
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 07:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=D6ZlnySp4n2JYKZ3BnTwy0o+3Z06IrEAN7j91AepWbA=;
 b=TBzn5wiz/qArllKQmKvIMY0YBIRem/ED996A0xDoCuqkK6dKUMHmbgPCBChTXLfmYy
 KqgT2VuoQuQ+ZaTFbFs9ZKeRHnmv+rVrolGKUCHqijanujwOslOYRaeGYX/5EDcGNdJ6
 Wzmid0bJCLmRqjxyXEbOA0pO6n53fT/Zj8n4rn6wvG23GmxzYZl7lBs3MewHHDuNyzIm
 NhgfbWW+a1WgGgMyLfSqv6vV36RnbBRD83nJ1GKUq2UQyMJB8Z90bKmaBk4Roou70T92
 WwTNGz8sM6GVGTiuumSBgxYTkofCk5F4iQxQx7xi/YNCw5XGkNQWEOclJIiA3ExpxdwV
 EVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=D6ZlnySp4n2JYKZ3BnTwy0o+3Z06IrEAN7j91AepWbA=;
 b=ITWpUXRcGmJBDgmOMqeCeg8nLVbzS2/d8gf3sc5AGhy6AAmzu8nzaDwKvP8MHtWyKT
 JTzhYqDm90LzWjxHNunkW9zpQCEDt8YCPSgkC/4jDeyjPm1xq7ESGhTan71b1NaPajeq
 yJ8MWzL6aSwWajxGqV0Hll5p5MQUVmMSYB1UBDZ3aqZHMYJO+NPVgqg4o0llPx4i9+DR
 e3PXrw+XJjS1i+aRdaqSg/LRg1SKMsf9p63UAOy/TxaPMU5Ex8jXeIV07tnovw3rKLKU
 w+9SNfnp1UpasEQkkwiNI+lqnFtksyzIxIEoqu/TWg9kBkMd1JPySoiVf6exkq4wRGRN
 jxEA==
X-Gm-Message-State: AOAM530hR0WC22LkHtAjew6J94y1ERM116Crf0/zyvyo1xmAKsa1Tcj0
 tcWTfgZsf7bb/hB94mD9Fg==
X-Google-Smtp-Source: ABdhPJytmXSLQnNsOiOOvEvl6ehtqWfymtV5pVH/x19S40xL1M3Ewl0Vy0jPc0IdVHs8jSu5nIZRyA==
X-Received: by 2002:a63:145d:: with SMTP id 29mr10005317pgu.135.1626274472676; 
 Wed, 14 Jul 2021 07:54:32 -0700 (PDT)
Received: from vultr.guest ([107.191.53.97])
 by smtp.gmail.com with ESMTPSA id e16sm3541317pgl.54.2021.07.14.07.54.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 14 Jul 2021 07:54:32 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: christian.koenig@amd.com, ray.huang@amd.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm/ttm: add a check against null pointer dereference
Date: Wed, 14 Jul 2021 14:54:19 +0000
Message-Id: <1626274459-8148-1-git-send-email-zheyuma97@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Thu, 15 Jul 2021 08:44:52 +0000
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
Cc: Zheyu Ma <zheyuma97@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When calling ttm_range_man_fini(), 'man' may be uninitialized, which may
cause a null pointer dereference bug.

Fix this by checking if it is a null pointer.

This log reveals it:

[    7.902580 ] BUG: kernel NULL pointer dereference, address: 0000000000000058
[    7.905721 ] RIP: 0010:ttm_range_man_fini+0x40/0x160
[    7.911826 ] Call Trace:
[    7.911826 ]  radeon_ttm_fini+0x167/0x210
[    7.911826 ]  radeon_bo_fini+0x15/0x40
[    7.913767 ]  rs400_fini+0x55/0x80
[    7.914358 ]  radeon_device_fini+0x3c/0x140
[    7.914358 ]  radeon_driver_unload_kms+0x5c/0xe0
[    7.914358 ]  radeon_driver_load_kms+0x13a/0x200
[    7.914358 ]  ? radeon_driver_unload_kms+0xe0/0xe0
[    7.914358 ]  drm_dev_register+0x1db/0x290
[    7.914358 ]  radeon_pci_probe+0x16a/0x230
[    7.914358 ]  local_pci_probe+0x4a/0xb0

Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
---
 drivers/gpu/drm/ttm/ttm_range_manager.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
index 03395386e8a7..f4b08a8705b3 100644
--- a/drivers/gpu/drm/ttm/ttm_range_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -181,6 +181,9 @@ int ttm_range_man_fini(struct ttm_device *bdev,
 	struct drm_mm *mm = &rman->mm;
 	int ret;
 
+	if (!man)
+		return 0;
+
 	ttm_resource_manager_set_used(man, false);
 
 	ret = ttm_resource_manager_evict_all(bdev, man);
-- 
2.17.6

