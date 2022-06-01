Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AD353A4C1
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 14:21:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A524E10E932;
	Wed,  1 Jun 2022 12:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2576010E9E0
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 12:21:19 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id d129so1737580pgc.9
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 05:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YRYIF8QGPIv5YHK53kC4fYQBl0fPKRwkGLrQ86KpzLw=;
 b=KIidLJO1jlLoHuWi7Xpq7ZoYA102fCruSZsHK0gjeMktUqediZPb7K7OsGR5exNPPQ
 CRF5tUuHhsVWZkOPJkperWHmc1AVcoo9HCWYfbGf17b1fAy2Cw26jf//RarzxKnbc3Ao
 Zi4cDm5dP/b8PsGSFKOkhxz1FONT4ubKFh5yEv4Tzgnzc6gM6tonJldeQm2anqY58EMw
 l2SP/I3ebw8CPvRtHk1V42lU7CHV690cHiWkk82LoFX/agd0xHGwrIC0DCk1WfEgt75p
 6fGVFlL9oYQBCQ/QHdkaVT+PHTS5IQI+Mjw+GrW9H4FXuROQeYNxqGK/d+eKFo8C9Ymv
 qJLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YRYIF8QGPIv5YHK53kC4fYQBl0fPKRwkGLrQ86KpzLw=;
 b=yFx8xcnqaAzCGF4rpLFIwgU66ZIpaKDNgMNRs2gMTsshceqdF1Il6APBc6G7KTxl5K
 64a/xeXMQN4msH+Dup3+9VGsYgsEtw110hfjdEKytdkbYV3Uj3zcvfWIPfD6xg/SUwQl
 pf9poWO7n1znYvO6v4Ow0CE4hJU7BYgOCgLx5TLCveujDyJ8PDp6uqZaFBdNZnCcwt1r
 T9znhZDTcO9DzN6SbR7ASu2XzJne4fDWe4Q6gdS0W8xlvZ2JoRxvPSth3bLLl0GF7+qN
 atqBK8PMk1RHf+WtN2HU/QfyYSuza5oewTlNML9fbhNliVYQmE36CYrI0WlZ+sUQ4a1H
 GAcw==
X-Gm-Message-State: AOAM533lqapnZnGnzRsqT6qlbyjTHkigufxsvJMp8nyh3yrLlCyvijmb
 jCHYiBm2hObZQRX9h0pqcPs=
X-Google-Smtp-Source: ABdhPJwEGUcWk05+Q+/42FuszAiCUpUTMZmNg1kuYE7udK5vGUfGNYe8xk136ciYcqQORE265Z/GPQ==
X-Received: by 2002:a05:6a00:24c1:b0:50d:33cf:811f with SMTP id
 d1-20020a056a0024c100b0050d33cf811fmr66275730pfv.78.1654086078691; 
 Wed, 01 Jun 2022 05:21:18 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 t2-20020a62d142000000b0051868418b06sm1370811pfl.35.2022.06.01.05.21.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 05:21:18 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Eric Anholt <eric@anholt.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm/v3d/v3d_drv: Fix PM disable depth imbalance
Date: Wed,  1 Jun 2022 16:20:50 +0400
Message-Id: <20220601122050.1822-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linmq006@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pm_runtime_enable will increase power disable depth.
If the probe fails, we should use pm_runtime_disable() to balance
pm_runtime_enable().
Also call disable function in remove function.

Fixes: 57692c94dcbe ("drm/v3d: Introduce a new DRM driver for Broadcom V3D V3.x+")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
Changes in v3:
- call pm_runtime_disable() in v3d_platform_drm_remove
- update commit message

Changes in v2
- put pm_runtime_disable before dma_free_wc
- rename dma_free to pm_disable

v1: https://lore.kernel.org/r/20220105120442.14418-1-linmq006@gmail.com
v2: https://lore.kernel.org/r/20220106124657.32737-1-linmq006@gmail.com
---
 drivers/gpu/drm/v3d/v3d_drv.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 1afcd54fbbd5..f3380399fe17 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -286,7 +286,7 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 
 	ret = v3d_gem_init(drm);
 	if (ret)
-		goto dma_free;
+		goto pm_disable;
 
 	ret = v3d_irq_init(v3d);
 	if (ret)
@@ -302,7 +302,8 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 	v3d_irq_disable(v3d);
 gem_destroy:
 	v3d_gem_destroy(drm);
-dma_free:
+pm_disable:
+	pm_runtime_disable(dev);
 	dma_free_wc(dev, 4096, v3d->mmu_scratch, v3d->mmu_scratch_paddr);
 	return ret;
 }
@@ -316,6 +317,7 @@ static int v3d_platform_drm_remove(struct platform_device *pdev)
 
 	v3d_gem_destroy(drm);
 
+	pm_runtime_disable(&pdev->dev);
 	dma_free_wc(v3d->drm.dev, 4096, v3d->mmu_scratch,
 		    v3d->mmu_scratch_paddr);
 
-- 
2.25.1

