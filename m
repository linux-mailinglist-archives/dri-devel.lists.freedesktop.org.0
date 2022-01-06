Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C22F8486490
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 13:47:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED62310E984;
	Thu,  6 Jan 2022 12:47:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FFF610E97F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 12:47:04 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id w7so2380552plp.13
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jan 2022 04:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=KC71YFeX/q04GJdG17HRfq7w1PJzIDF05zCtW/8mUOM=;
 b=bMDvI1kcrkJ3iJg0CGOv2rdlnLJnTBwb4NtL6IQwgw5bGEe9T++vt2HuqCJwFP4Cvs
 jphp29b2+sg1wef2muOM2Zu8t0np4Sez61/xnBIYygcs60/7rQZe/BciDtqNYvgxh+M4
 ENZRiEgWPAx11hfXmIb2GomZzD2zivpf1d5/rgeu/4fhyjRUAJtwhcFlYL72iJFArxy+
 YrwX1GhJLgMJrJxxgGU9qDHz3brDt666/o8XUseGlZMhc01BQ4WCWxZUSGp2uN4BC8jO
 /3/u5fU0lnZuvyruxHbxIX39mYRX5RE8HSRbzQTFU2aWTWDOUeqU7h22Lw0KdoLHXEUm
 eg+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=KC71YFeX/q04GJdG17HRfq7w1PJzIDF05zCtW/8mUOM=;
 b=YdwYP9ra8U6DV1s39uHv6ws4GOU0pzMZPRby9+lEUItfW3SO4IbroChNyAJQE7VAdY
 cXg625Tr0Rsll7ntJnAJdn0pNioIjGXI1QW1jH/bUQBUUDJxax5tt/WhpVSKM48dZ9Mb
 ri8VbognpvsbuuB2YXZ66TSoasJCePPKJI8qw3gZFIxe2dbz4APdvm+xBsUfb3ygk2sv
 kJOWEIJHKt2HkFNx9pk8ISvqu2ZadNSnfZPiIt/u75YyRDvkk9AdXpsYuaiUPszDqWYx
 bA0zIktynuaO9XaVIuKn2VzWsa2A1dcrtT7XCT+bhGWP2WWx/LUc7PCEZh71Jx0hChxc
 FkGw==
X-Gm-Message-State: AOAM532vdQc4JMlbCzVFuqKRN+K6gnGU3lezwK8W6/Ylgd4/LCeagdRe
 n8sK8ay7aJwmh0ChRGT1nyc=
X-Google-Smtp-Source: ABdhPJzwNEzZRoPa0ZqQQ22MGbHsrSeP/vhR18csyuIzZMnAb9nSDti1FixA+AbzoStGlKdJUYigoQ==
X-Received: by 2002:a17:903:120a:b0:149:8b16:ee19 with SMTP id
 l10-20020a170903120a00b001498b16ee19mr43022958plh.11.1641473224231; 
 Thu, 06 Jan 2022 04:47:04 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id a17sm2214409pjh.11.2022.01.06.04.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 04:47:04 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: dave.stevenson@raspberrypi.com
Subject: [PATCH v2] drm/v3d: Fix PM disable depth imbalance in
 v3d_platform_drm_probe
Date: Thu,  6 Jan 2022 12:46:57 +0000
Message-Id: <20220106124657.32737-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAPY8ntAdknutH=OmV1dWPbez1ZqLgaOj-BoQQkZAu0WbhbE6nQ@mail.gmail.com>
References: <CAPY8ntAdknutH=OmV1dWPbez1ZqLgaOj-BoQQkZAu0WbhbE6nQ@mail.gmail.com>
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
Cc: linmq006@gmail.com, emma@anholt.net, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, eric@anholt.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pm_runtime_enable will increase power disable depth.
If the probe fails, we should use pm_runtime_disable() to balance
pm_runtime_enable().

Fixes: 57692c9 ("drm/v3d: Introduce a new DRM driver for Broadcom V3D V3.x+")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
Changes in v2
- put pm_runtime_disable before dma_free_wc
- rename dma_free to pm_disable
---
 drivers/gpu/drm/v3d/v3d_drv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index bd46396a1ae0..7d500dd5314e 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -282,7 +282,7 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 
 	ret = v3d_gem_init(drm);
 	if (ret)
-		goto dma_free;
+		goto pm_disable;
 
 	ret = v3d_irq_init(v3d);
 	if (ret)
@@ -298,7 +298,8 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 	v3d_irq_disable(v3d);
 gem_destroy:
 	v3d_gem_destroy(drm);
-dma_free:
+pm_disable:
+	pm_runtime_disable(dev);
 	dma_free_wc(dev, 4096, v3d->mmu_scratch, v3d->mmu_scratch_paddr);
 	return ret;
 }
-- 
2.17.1

