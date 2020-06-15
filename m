Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9ED1F8FD0
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF716E29E;
	Mon, 15 Jun 2020 07:27:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B0989B57;
 Mon, 15 Jun 2020 06:12:32 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id r2so16595781ioo.4;
 Sun, 14 Jun 2020 23:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=MpaNV/qQKz10iqV54hZ3d06qChO86uOpWp9hsgu+lWY=;
 b=R9dTqLFqtzTAkZcs7wraz0nABjqsFyXZgImHWAjW/JRpifRBjCvM4fhxHp9/gej4n5
 DNMG3Ht6UnmJefKwqtmlhhw6gIS51mdT1Y03Dnl9+jenWXLpeSk0+rwg8O4nQtCext1X
 nN6yPFGPJ+ELR06ivu2dPofx7LFNSa56L2y+2g3mphJQsRxGkMX1+fAFWN3JLabu4yBa
 O0YY12KchtNRz8i9AUYqDcaxqSQcOnKPDZ8O/HCnOaFRm4DSY0kKjelxhtlSXgZ0kMnS
 I1pPgussUNro4NKXQN6Zm8TzPLvyU8Ak5siiRMN+2tg6y27KxK1az6mPo3c1JgSpplOw
 J5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=MpaNV/qQKz10iqV54hZ3d06qChO86uOpWp9hsgu+lWY=;
 b=RH5hX2PlB0zVqRH8nMJmklCSMj6UaST9flAdfeqPTVMubiTAG4kyo/F11bScP8jefU
 4jdgLcT69duIAI+HhhI43vAMEqtfBQHANPDhvRhWM/5tzsejXr4FhWeOJYZk4GJQ0TrK
 dzI86r6kYc1ovwWZ2N0EwS5B/CK0x6kyn7B1t/E66gONmpN8Z8QI25kK1K374ibRuIId
 ihiHBHD60tIjKzmQY9KoC7VTaImy5HUyV6OwlzLEQKv6ZZFmsuvxaR9/mK+GhRGnpP7M
 uxZ6sqNOcWoK+0SP1olwmKLlwk/YHEnQn94/rNICwwQ77jKRWrRR32yQ920hNTuqZOmt
 ffkg==
X-Gm-Message-State: AOAM530tQP3kElqTzUajemxmhIZ9WmIk39nhozI2zOU/mOCX2c//pXxJ
 +JJB3oinT+NXMzxuJQFY/fA=
X-Google-Smtp-Source: ABdhPJyzcnYLaAIqOamesc01+OyA8JCS1/7QXApZEWy/YVtyVV5vBZBB6DNo4QZqY8CgYo+qQnFOqw==
X-Received: by 2002:a05:6638:d05:: with SMTP id
 q5mr19398438jaj.2.1592201551850; 
 Sun, 14 Jun 2020 23:12:31 -0700 (PDT)
Received: from cs-u-kase.dtc.umn.edu (cs-u-kase.cs.umn.edu. [160.94.64.2])
 by smtp.googlemail.com with ESMTPSA id c3sm7421822ilr.45.2020.06.14.23.12.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2020 23:12:31 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/etnaviv: fix ref count leak via pm_runtime_get_sync
Date: Mon, 15 Jun 2020 01:12:20 -0500
Message-Id: <20200615061220.68711-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAHp75VcLR2w9Ym0YOqUT9G8xT9qWrdD1-wP4UA-1wtuwCNxqSA@mail.gmail.com>
References: <CAHp75VcLR2w9Ym0YOqUT9G8xT9qWrdD1-wP4UA-1wtuwCNxqSA@mail.gmail.com>
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
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
Cc: kjlu@umn.edu, mccamant@cs.umn.edu, andy.shevchenko@gmail.com,
 emamd001@umn.edu, wu000273@umn.edu,
 Navid Emamdoost <navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

in etnaviv_gpu_submit, etnaviv_gpu_recover_hang, etnaviv_gpu_debugfs,
and etnaviv_gpu_init the call to pm_runtime_get_sync increments the
counter even in case of failure, leading to incorrect ref count.
In case of failure, decrement the ref count before returning.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
Changes in v2:
	- replace pm_runtime_put with  pm_runtime_put_noidle
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index a31eeff2b297..7c9f3f9ba123 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -722,7 +722,7 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
 	ret = pm_runtime_get_sync(gpu->dev);
 	if (ret < 0) {
 		dev_err(gpu->dev, "Failed to enable GPU power domain\n");
-		return ret;
+		goto pm_put;
 	}
 
 	etnaviv_hw_identify(gpu);
@@ -819,6 +819,7 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
 
 fail:
 	pm_runtime_mark_last_busy(gpu->dev);
+pm_put:
 	pm_runtime_put_autosuspend(gpu->dev);
 
 	return ret;
@@ -859,7 +860,7 @@ int etnaviv_gpu_debugfs(struct etnaviv_gpu *gpu, struct seq_file *m)
 
 	ret = pm_runtime_get_sync(gpu->dev);
 	if (ret < 0)
-		return ret;
+		goto pm_put;
 
 	dma_lo = gpu_read(gpu, VIVS_FE_DMA_LOW);
 	dma_hi = gpu_read(gpu, VIVS_FE_DMA_HIGH);
@@ -1003,6 +1004,7 @@ int etnaviv_gpu_debugfs(struct etnaviv_gpu *gpu, struct seq_file *m)
 	ret = 0;
 
 	pm_runtime_mark_last_busy(gpu->dev);
+pm_put:
 	pm_runtime_put_autosuspend(gpu->dev);
 
 	return ret;
@@ -1016,7 +1018,7 @@ void etnaviv_gpu_recover_hang(struct etnaviv_gpu *gpu)
 	dev_err(gpu->dev, "recover hung GPU!\n");
 
 	if (pm_runtime_get_sync(gpu->dev) < 0)
-		return;
+		goto pm_put;
 
 	mutex_lock(&gpu->lock);
 
@@ -1035,6 +1037,7 @@ void etnaviv_gpu_recover_hang(struct etnaviv_gpu *gpu)
 
 	mutex_unlock(&gpu->lock);
 	pm_runtime_mark_last_busy(gpu->dev);
+pm_put:
 	pm_runtime_put_autosuspend(gpu->dev);
 }
 
@@ -1308,8 +1311,10 @@ struct dma_fence *etnaviv_gpu_submit(struct etnaviv_gem_submit *submit)
 
 	if (!submit->runtime_resumed) {
 		ret = pm_runtime_get_sync(gpu->dev);
-		if (ret < 0)
+		if (ret < 0) {
+			pm_runtime_put_noidle(gpu->dev);
 			return NULL;
+		}
 		submit->runtime_resumed = true;
 	}
 
@@ -1326,6 +1331,7 @@ struct dma_fence *etnaviv_gpu_submit(struct etnaviv_gem_submit *submit)
 	ret = event_alloc(gpu, nr_events, event);
 	if (ret) {
 		DRM_ERROR("no free events\n");
+		pm_runtime_put_noidle(gpu->dev);
 		return NULL;
 	}
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
