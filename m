Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8125E44B26A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 19:06:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E4B089C85;
	Tue,  9 Nov 2021 18:06:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3808A89CD7;
 Tue,  9 Nov 2021 18:06:40 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id q17so10306860plr.11;
 Tue, 09 Nov 2021 10:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ewu5OhDKta9tv0cj+vmNtgtEN7krYewINiiQiOGODF0=;
 b=Hz3G3Afbb/rY/XGlxsubGcd7n5QDeKiLAGHYPhciUQ18io5H6tC9yuVa0BHgIbtZN6
 Ubn9b1bPRCGW88lD1wVdSTyzLhjV874CD4RJS9in23QVB8UErtM8aooTsF4fbB9H34R6
 8o1q0R2n6cwZEA8GgjbiefS0G+5IrpoKulNX2DEoFjjDc/s2gbZiLB4nzqivtsMI2kEY
 TX2QQY67Q3hGg4kxCx4voWBYL4BKLKVzHJz8WOwtxx7y91Bb6YNpwKYOcs12Eb1Riocu
 eHzACDpX9r/zDuTKG0i/OE9JlM/C6iuKqWK3NOOZAeyUSw/7PYiKagMIgOd+pKMR0Yz8
 nyMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ewu5OhDKta9tv0cj+vmNtgtEN7krYewINiiQiOGODF0=;
 b=LbiQDrjJozrEXWoTqV2i1MMv+Zr2TRMmjiHDBykFw4k+yYqhOtcdYrtbcPca+i8T0n
 /DilFmt8qbNDA2GJtSflgz2C8B0dNp91mA+pYZDFyDYkCHNNNQXxoragnYa0z32jQEZx
 7ZxJKmm/jFORmA+Kt+lJn4I9/7N8YOoEqH4AfCSgGMZsu19wYEy37thLEgVI1FTeQ/Gm
 tnN+imWISH2DM161J6gP1lfnOwhGbqDQVOmzs4VRLoz64ppFt6vYC/rqQ27tR0WRT2OI
 NlxEm3Qe2vV5aqQsqLW1gkFDroRpNDXar+OjBsMqlCuBqT5UedYRSdKXpWqpOJ3EKW4x
 Fu2g==
X-Gm-Message-State: AOAM532BJrc7v4JM6wD/386JEOKE2F6o5Vktf5wLG/7pcapmhIwFPWdC
 CV7X8PJpTiphfHPY6RpZcaladoNQWjg=
X-Google-Smtp-Source: ABdhPJyPIFeaZn9nDNP9uLj4PVSpEaotzjlPNiEaPJMPzf4AQxOcA+A6MutdVsB81b5/rQZ9FKQ7/A==
X-Received: by 2002:a17:90b:1e45:: with SMTP id
 pi5mr9598315pjb.146.1636481198993; 
 Tue, 09 Nov 2021 10:06:38 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 u1sm6273840pfl.92.2021.11.09.10.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 10:06:37 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/msm: Add debugfs to disable hw err handling
Date: Tue,  9 Nov 2021 10:11:05 -0800
Message-Id: <20211109181117.591148-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211109181117.591148-1-robdclark@gmail.com>
References: <20211109181117.591148-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Yangtao Li <tiny.windzz@gmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sharat Masetty <smasetty@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Add a debugfs interface to ignore hw error irqs, in order to force
fallback to sw hangcheck mechanism.  Because the hw error detection is
pretty good on newer gens, we need this for igt tests to test the sw
hang detection.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 6 ++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++++
 drivers/gpu/drm/msm/msm_debugfs.c     | 3 +++
 drivers/gpu/drm/msm/msm_drv.h         | 9 +++++++++
 4 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 6163990a4d09..ec8e043c9d38 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1252,6 +1252,7 @@ static void a5xx_fault_detect_irq(struct msm_gpu *gpu)
 
 static irqreturn_t a5xx_irq(struct msm_gpu *gpu)
 {
+	struct msm_drm_private *priv = gpu->dev->dev_private;
 	u32 status = gpu_read(gpu, REG_A5XX_RBBM_INT_0_STATUS);
 
 	/*
@@ -1261,6 +1262,11 @@ static irqreturn_t a5xx_irq(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A5XX_RBBM_INT_CLEAR_CMD,
 		status & ~A5XX_RBBM_INT_0_MASK_RBBM_AHB_ERROR);
 
+	if (priv->disable_err_irq) {
+		status &= A5XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS |
+			  A5XX_RBBM_INT_0_MASK_CP_SW;
+	}
+
 	/* Pass status to a5xx_rbbm_err_irq because we've already cleared it */
 	if (status & RBBM_ERROR_MASK)
 		a5xx_rbbm_err_irq(gpu, status);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 3d2da81cb2c9..8a2af3a27e33 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1373,10 +1373,14 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
 
 static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
 {
+	struct msm_drm_private *priv = gpu->dev->dev_private;
 	u32 status = gpu_read(gpu, REG_A6XX_RBBM_INT_0_STATUS);
 
 	gpu_write(gpu, REG_A6XX_RBBM_INT_CLEAR_CMD, status);
 
+	if (priv->disable_err_irq)
+		status &= A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS;
+
 	if (status & A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT)
 		a6xx_fault_detect_irq(gpu);
 
diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 6a99e8b5d25d..956b1efc3721 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -242,6 +242,9 @@ void msm_debugfs_init(struct drm_minor *minor)
 	debugfs_create_u32("hangcheck_period_ms", 0600, minor->debugfs_root,
 		&priv->hangcheck_period);
 
+	debugfs_create_bool("disable_err_irq", 0600, minor->debugfs_root,
+		&priv->disable_err_irq);
+
 	debugfs_create_file("shrink", S_IRWXU, minor->debugfs_root,
 		dev, &shrink_fops);
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 2943c21d9aac..a8da7a7efb84 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -246,6 +246,15 @@ struct msm_drm_private {
 
 	/* For hang detection, in ms */
 	unsigned int hangcheck_period;
+
+	/**
+	 * disable_err_irq:
+	 *
+	 * Disable handling of GPU hw error interrupts, to force fallback to
+	 * sw hangcheck timer.  Written (via debugfs) by igt tests to test
+	 * the sw hangcheck mechanism.
+	 */
+	bool disable_err_irq;
 };
 
 struct msm_format {
-- 
2.31.1

