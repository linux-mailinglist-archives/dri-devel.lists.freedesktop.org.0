Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C5D713A3E
	for <lists+dri-devel@lfdr.de>; Sun, 28 May 2023 16:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A056410E0BA;
	Sun, 28 May 2023 14:59:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59BC610E21E
 for <dri-devel@lists.freedesktop.org>; Sat, 27 May 2023 08:18:20 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1b00ed75e34so2595915ad.1
 for <dri-devel@lists.freedesktop.org>; Sat, 27 May 2023 01:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685175499; x=1687767499;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GgkyIFrBxuAzRVAXPfklB2pDA1O52uIPOrfTaBhFKGs=;
 b=qm+e8b0zkHNbENDDxLnIF6iBScBalvdL1g9zQnlk0PvyTH800CgFL/iRVnhFVqPOs6
 oBaQdJOsEvfYm5pY7XuXn7P1wonU6aeCERZDFy94mQYYGqFp61yFoWHgoAg22uKCN1DV
 MeMl6WBLU8cUacWqUeDBLq9WRYdR6drlC89VW2PXskhq2PZbFtnAn+5nvUpStUF+hzpJ
 DVjlWLnYZaJTMWs6q7vX1L8qinpHo/H/xhsI4HsUbENWAuIs4KiOL9zQ+lBYDvrmi8KD
 CYCk5dlWGxE2McweClOUal1k2r0jHEODWDgeP6sjWiR09GFNNiwuka8F0Gtdj4WT6Vzr
 iOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685175499; x=1687767499;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GgkyIFrBxuAzRVAXPfklB2pDA1O52uIPOrfTaBhFKGs=;
 b=F5ZniQud2UVfZdL6T8YHUlRPXhyy0DjrVxTjTlpZ2ZIX7TBga2iM0eEKHbgSIGzwQ8
 hYi13qiOxfTiCGnbd/RweleyxhY10ZJpcjkNZ+jsTQ9CUpPKmUS5Ze4jio+XtGD7rnK2
 VrzuXg5oiQWr95DcAgyPIZcLwdZsArvGIXg/fN8qlUXHlgFrx2h+AVcfFqWT7+EWWMp3
 7IF7uvbnwP34DQHbEu64ZXzDVcMs9LqFEeaGIdH3BlJZho1jnEWed33wP41QOaoxI9LA
 GrESEkQL9zXHIj9BVlWN8Rr/fqyJUDavZW63q3zuO/OcGmxZU2rjL7SplGmIiRycS+FA
 A67A==
X-Gm-Message-State: AC+VfDwqGLbUlSS4tg7GznBlbSnnyVYLbsWLc/n4WCyWvqDd5ZcQGAIv
 NSroce/FFxG4V+emFwFnp/RB6CTvcg8ghXB4
X-Google-Smtp-Source: ACHHUZ6Qrp4DcfEEkrmjiuOnMT+CTIIsQl6FsMr5hpxiqSImvCBsDbCfQCxS1x82Mq3I3BFFmbia1Q==
X-Received: by 2002:a17:902:e752:b0:1ae:8595:14b with SMTP id
 p18-20020a170902e75200b001ae8595014bmr5638597plf.6.1685175499229; 
 Sat, 27 May 2023 01:18:19 -0700 (PDT)
Received: from ubuntu.localdomain ([103.114.158.1])
 by smtp.gmail.com with ESMTPSA id
 b4-20020a170902d50400b001ae6e270d8bsm4395490plg.131.2023.05.27.01.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 May 2023 01:18:18 -0700 (PDT)
From: Min Li <lm0963hack@gmail.com>
To: inki.dae@samsung.com
Subject: [PATCH] drm/exynos: fix race condition UAF in exynos_g2d_exec_ioctl
Date: Fri, 26 May 2023 21:01:31 +0800
Message-Id: <20230526130131.16521-1-lm0963hack@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 28 May 2023 14:59:32 +0000
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
Cc: linux-samsung-soc@vger.kernel.org, sw0312.kim@samsung.com,
 krzysztof.kozlowski@linaro.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kyungmin.park@samsung.com,
 alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If it is async, runqueue_node is freed in g2d_runqueue_worker on another
worker thread. So in extreme cases, if g2d_runqueue_worker runs first, and
then executes the following if statement, there will be use-after-free.

Signed-off-by: Min Li <lm0963hack@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_g2d.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index ec784e58da5c..414e585ec7dd 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -1335,7 +1335,7 @@ int exynos_g2d_exec_ioctl(struct drm_device *drm_dev, void *data,
 	/* Let the runqueue know that there is work to do. */
 	queue_work(g2d->g2d_workq, &g2d->runqueue_work);
 
-	if (runqueue_node->async)
+	if (req->async)
 		goto out;
 
 	wait_for_completion(&runqueue_node->complete);
-- 
2.34.1

