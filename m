Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BBD449B2C
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 18:56:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 594C789B22;
	Mon,  8 Nov 2021 17:56:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A9D89B20;
 Mon,  8 Nov 2021 17:56:21 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id v23so6738817pjr.5;
 Mon, 08 Nov 2021 09:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xoKlavGZxr6dec4Eua5L/nU42iXPOyi8Il8xPrpTM04=;
 b=C1JnwVwkyS4l5aZtJE5WdEAc5jjNH5NSibAJqMBoxhQLU7W2NjzhTKxJ2aFI3l+uvo
 PZ9o9piRrMdYmJSuVTsvMIluA07xXA0zrDSpwAXoQn83dWLskJ6qUKUAfs740sraBLRK
 71AkeMYIJs3nzQCYX595PZZwrp0Vio2kRkp60Kd/8hU1NcC4qreyZLxS+fXm1udH0utm
 PIM6pI+DZnxdNw+qiZUO2L10CEoazD9ZQhcl/koaoCxcVeAM6+O2fY8F3fL72yWMzTL5
 jCn1qh/L181V1qreeIKAtUoWQg4M3oXrSIuI9lZwI0pMtDFoS9HlbJ7d4WzimVbCv2QZ
 yWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xoKlavGZxr6dec4Eua5L/nU42iXPOyi8Il8xPrpTM04=;
 b=a3DN9GY30yqBSJhSaUnsf76zrZQeErUezbTC3PmUDlKWY2SFqtpTcdPLZBXLZCUV01
 47Tb814z8n2yjK/1Ww2K7VYUDtKqo5v0aE+FLQJD3IMh3oq70wXupmxFWwhnTMgwpw65
 Mlb0UkNUxCqCwW4GAzZ7SZsXB/mUvzouNAGxU7ph4BVlgShS9L+ya79qpY9u+otigmvd
 dLLmQ3DSaAa88W9AoHl21v4sr+IB2s4SZA5B34DLZKplDI0vIvCrOJDkOgWG/W12al7v
 gSY/L4OepHpiwZ6WXBQuWtwoOqCp9RwJG4rMWAmHOPs02tokP1T0WoOERUJjeHjjPVIH
 Lk6w==
X-Gm-Message-State: AOAM532MSFLMR2ylcs0rnDmEUhlrjKsMttYqEqR/+Rno5bENL2mANgU9
 Lam+cF5tbwBGWsQ9JHLrzwYAMAFZJxU=
X-Google-Smtp-Source: ABdhPJzjLrMyYoznDRHV57IpXix2EYUTbgIrc9dklIedNrGBxjCwEe/OeIJy9kGFbwNJbU28cJ1aAQ==
X-Received: by 2002:a17:903:246:b0:13f:2ff9:8b93 with SMTP id
 j6-20020a170903024600b0013f2ff98b93mr1099932plh.54.1636394180901; 
 Mon, 08 Nov 2021 09:56:20 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 k18sm4295941pgb.70.2021.11.08.09.56.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 09:56:20 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Do hw_init() before capturing GPU state
Date: Mon,  8 Nov 2021 10:01:22 -0800
Message-Id: <20211108180122.487859-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

In particular, we need to ensure all the necessary blocks are switched
to 64b mode (a5xx+) otherwise the high bits of the address of the BO to
snapshot state into will be ignored, resulting in:

  *** gpu fault: ttbr0=0000000000000000 iova=0000000000012000 dir=READ type=TRANSLATION source=CP (0,0,0,0)
  platform 506a000.gmu: [drm:a6xx_gmu_set_oob] *ERROR* Timeout waiting for GMU OOB set BOOT_SLUMBER: 0x0

Fixes: 4f776f4511c7 ("drm/msm/gpu: Convert the GPU show function to use the GPU state")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index b4d1a5162d1c..956b1efc3721 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -77,6 +77,7 @@ static int msm_gpu_open(struct inode *inode, struct file *file)
 		goto free_priv;
 
 	pm_runtime_get_sync(&gpu->pdev->dev);
+	msm_gpu_hw_init(gpu);
 	show_priv->state = gpu->funcs->gpu_state_get(gpu);
 	pm_runtime_put_sync(&gpu->pdev->dev);
 
-- 
2.31.1

