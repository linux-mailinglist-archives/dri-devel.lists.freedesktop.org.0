Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C6B485C42
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 00:27:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43DB210E442;
	Wed,  5 Jan 2022 23:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A3B610E43B
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jan 2022 23:27:05 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id q8so1275461ljp.9
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jan 2022 15:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=58QAv1zSqapbnHsZYOklL7IQDyaDq+jkAqsKjvZ/E/Y=;
 b=Kjo4mVSxgdH4TDW8ccNVmTg4lD4jQFmHJ5XOzqcVYOLjEKC6Zeflsn9RzSmdr90VEn
 8lM/BK9c3lWY5TXLjoMjZf1kKCw7bVUFnUGFk02Q/jQ7glLeBjO0fdf9rl0ydOfdCKh0
 FkEZja32ca5ytgYGMOOJKMu8Cn0FPrTT5asw+7//viYk/mWoBJNxooRn9WyzId59uVNZ
 JMQJJb5Ktw9s07kp45mknpnTh5e9cXkfPZE6w3KGsxs1u2leE97FqznK3oJWpn85duzg
 vhhWQ4U7jLFuHC0HeU0lS+bKEg6opDmwxHC3yGZW5WlAzDbhdC2APq/OE5Zf3lopuRDy
 t0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=58QAv1zSqapbnHsZYOklL7IQDyaDq+jkAqsKjvZ/E/Y=;
 b=af0tOl2dPoYRMJQGxckVnWp9yShxWpqp0WOkzlCgmyVUZ9ENRGUaqRwiKlZzMVq0cg
 bC8uFTjE1tESL/P9vXtRGGsYid2dP98t1t97gPxSrOw9DW4jldsuUQN0uP4Sg5rFVe4R
 Bvoxe5yM1JvXNxt0+6JRCbBR8VSrz7Ir2+u4Lj+3Zni1qcXgJFUjzz5ZPFaE/48w7E1S
 16g5qFau5apqhsRA0hDprinTWwJKuqCUGoUpV88igCi5KjKFQvk41FX2l7AlLjaKouRQ
 HCRl1pUGBOnxNmOWup2o6QsjdkG5OryHWfhgpgJFajQP+A7NIz4LU+U6eFLXPkYXq4F8
 KqPg==
X-Gm-Message-State: AOAM530A4q+q+l2eUwh8PehpxIsWbuIPb22rXQMAh4zEqh6hn5Esp+bU
 f5CjwMOFLj9LJKpouteGLTL6qA==
X-Google-Smtp-Source: ABdhPJziercrKqupFX3QrWF1vReHcy6CB453wpr9RX8j0Y62WoVYu/2gv3rWq/bjtVw2J/jkCoLfNQ==
X-Received: by 2002:a2e:9e81:: with SMTP id f1mr45680361ljk.469.1641425223435; 
 Wed, 05 Jan 2022 15:27:03 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id b29sm28730lfv.187.2022.01.05.15.27.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 15:27:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@quicinc.com>
Subject: [PATCH v2 3/3] drm/msm: move msm_readl/_writel to msm_drv.h
Date: Thu,  6 Jan 2022 02:27:00 +0300
Message-Id: <20220105232700.444170-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220105232700.444170-1-dmitry.baryshkov@linaro.org>
References: <20220105232700.444170-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the reglog removal, msm_readl/_writel became single line wrappers
around readl/writel. Move those two wrappers and msm_rmw to msm_drv.h to
remove need for extra function calls when doing register writes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 20 --------------------
 drivers/gpu/drm/msm/msm_drv.h | 14 +++++++++++---
 2 files changed, 11 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 73757b7dc935..fd62a4da14a1 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -164,26 +164,6 @@ void __iomem *msm_ioremap_size(struct platform_device *pdev, const char *name,
 	return _msm_ioremap(pdev, name, false, psize);
 }
 
-void msm_writel(u32 data, void __iomem *addr)
-{
-	writel(data, addr);
-}
-
-u32 msm_readl(const void __iomem *addr)
-{
-	u32 val = readl(addr);
-
-	return val;
-}
-
-void msm_rmw(void __iomem *addr, u32 mask, u32 or)
-{
-	u32 val = msm_readl(addr);
-
-	val &= ~mask;
-	msm_writel(val | or, addr);
-}
-
 static enum hrtimer_restart msm_hrtimer_worktimer(struct hrtimer *t)
 {
 	struct msm_hrtimer_work *work = container_of(t,
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 56d1242efcc1..3ab19775a5c3 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -484,9 +484,17 @@ void __iomem *msm_ioremap(struct platform_device *pdev, const char *name);
 void __iomem *msm_ioremap_size(struct platform_device *pdev, const char *name,
 		phys_addr_t *size);
 void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const char *name);
-void msm_writel(u32 data, void __iomem *addr);
-u32 msm_readl(const void __iomem *addr);
-void msm_rmw(void __iomem *addr, u32 mask, u32 or);
+
+#define msm_writel(data, addr) writel((data), (addr))
+#define msm_readl(addr) readl((addr))
+
+static inline void msm_rmw(void __iomem *addr, u32 mask, u32 or)
+{
+	u32 val = msm_readl(addr);
+
+	val &= ~mask;
+	msm_writel(val | or, addr);
+}
 
 /**
  * struct msm_hrtimer_work - a helper to combine an hrtimer with kthread_work
-- 
2.34.1

