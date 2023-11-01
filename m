Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CECA37DDE89
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 10:37:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F373A10E68A;
	Wed,  1 Nov 2023 09:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F3210E68A
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 09:36:57 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6b1e46ca282so6644312b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Nov 2023 02:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698831417; x=1699436217; darn=lists.freedesktop.org;
 h=message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LyXL+8kMJ/1G6Wc6ZGN/nIRPqs6F9spUVK3ynSWmCqU=;
 b=U4TOEcWUCAXCeeUZVGPxS1/IwHwe/ZTg/r4HRc/54tgE3m35BO4eSqb6kXAJ/nQxYU
 P2uAX+tDGGfddMoYGG+cqrV0+VY9jShy06dujyP+wr0kWj8X/9bkozFI65o/lqZpgY0d
 uHoMAlOMzYN2veNtO1sfl0DcHdt+P0B+ceNs+cwsx6BilX/iUkLBT1z+sbapdSozZTzT
 gk//BnJ6b9dPOawdVQY2Bx0JuvEPXVL0WJfc3oFupJmbV56Homxp5U/4BsFVZdNoUpaa
 9UzqcH3Lol/ed4qc7x9KZAENLUHLCp1JC8lGdKa/Bzx/xfClo3BtQn9wMu6EhXhTLTWP
 WdzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698831417; x=1699436217;
 h=message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LyXL+8kMJ/1G6Wc6ZGN/nIRPqs6F9spUVK3ynSWmCqU=;
 b=lmehVWom2ZdgVAf4NBr1zDGe+XBdwl+l7HfltR/KUesIS9EnUJqgOhspnIoC0A4YAx
 TTD5K2JVqfpFekQCLZdleausPXU2iVtJPTVdl8fImy6Gp5HL1P873fjfaH+2/UE965eG
 XGfpYCMaBklD581RgbnjXLqHbYK+NBV66zs0UahQSJUtLJP3gvA9dHUmCV9eYOwfr/9z
 IQWwwg1omTtue3+RjgdzdwXoEuJ+8lFfNJWBNVEf9HWdo/AHmYVBZaJAP17CAeuI14sq
 j5tvkdjaz3/M/+cky2lODl8LUUY8InfnLkHuLPYbGGCYGRHN5PxWytEYlshDRoKwNhxd
 0KuQ==
X-Gm-Message-State: AOJu0YzmS7h6AqB9cjYpVfZ0CeTudjyVOBPCDzGcjxRS/59S2p1wsTkV
 he+V2dKLq6UXRuHBlhsbLH/MDxNoiN09kg==
X-Google-Smtp-Source: AGHT+IGVAKVpfpaa+6wP/Jcv5qLFNWpIv2d9/MOxDigrVyBuAn8rspFyVvLWgGqGX985E9GijFUIUg==
X-Received: by 2002:a05:6300:8083:b0:16b:9541:85e6 with SMTP id
 ap3-20020a056300808300b0016b954185e6mr18133836pzc.60.1698831416626; 
 Wed, 01 Nov 2023 02:36:56 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
 by smtp.gmail.com with ESMTPSA id
 ne19-20020a17090b375300b002776288537fsm527321pjb.53.2023.11.01.02.36.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 02:36:56 -0700 (PDT)
From: Inki Dae <inki.dae@samsung.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/exynos: fix a wrong error checking
Date: Wed,  1 Nov 2023 18:36:51 +0900
Message-Id: <20231101093651.28343-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.17.1
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
Cc: linux-samsung-soc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix a wrong error checking in exynos_drm_dma.c module.

In the exynos_drm_register_dma function, both arm_iommu_create_mapping()
and iommu_get_domain_for_dev() functions are expected to return NULL as
an error.

However, the error checking is performed using the statement if(IS_ERR(mapping)),
which doesn't provide a suitable error value. So check if 'mapping' is NULL,
and if it is, return ERR_PTR(-ENODEV).

This issue[1] was reported by Dan.

[1] https://www.spinics.net/lists/dri-devel/msg418271.html

Reported-by : Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dma.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dma.c b/drivers/gpu/drm/exynos/exynos_drm_dma.c
index a971590b81323..6d73d4dca583e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dma.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dma.c
@@ -107,18 +107,16 @@ int exynos_drm_register_dma(struct drm_device *drm, struct device *dev,
 		return 0;
 
 	if (!priv->mapping) {
-		void *mapping;
+		void *mapping = NULL;
 
 		if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU))
 			mapping = arm_iommu_create_mapping(&platform_bus_type,
 				EXYNOS_DEV_ADDR_START, EXYNOS_DEV_ADDR_SIZE);
 		else if (IS_ENABLED(CONFIG_IOMMU_DMA))
 			mapping = iommu_get_domain_for_dev(priv->dma_dev);
-		else
-			mapping = ERR_PTR(-ENODEV);
 
-		if (IS_ERR(mapping))
-			return PTR_ERR(mapping);
+		if (!mapping)
+			return PTR_ERR(-ENODEV);
 		priv->mapping = mapping;
 	}
 
-- 
2.17.1

