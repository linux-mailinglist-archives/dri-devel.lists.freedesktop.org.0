Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6805A3463A6
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 16:54:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70FFC6EAA8;
	Tue, 23 Mar 2021 15:54:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA08D6EAA8
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 15:54:27 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id u9so27928703ejj.7
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 08:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vLQx1Cfo6NMYGKyAzHlak3XDgfOSp0H1hbHr7UYGQH4=;
 b=N+mYceP9vCGRhM3PjsaOHNXvBi4uz1WxWLKOx9peAA38HYDQCVPyXnUTnSzQpB9J4i
 sk1f2x99Ya8yeXD9FTzn++cxVuAQpeFrWB7NqSIWOxldeIvjG/8/zPUhEz53OaD91unu
 dQOppyZBIqOr7f1AaXLtpYJNfL9X8asUyS4AHwiuvwM0juPwM1pIHmJ7kmoCVWrD0ru0
 oIKwoEnTWD5ByP1znDZNW+BgSnhVArsad8nCTeTqjbZSKFYvJ+H6BlJxDS+Lbd+rSUM3
 DhFbGaMJtMTngvicjq7fomk+KI601UwkvFV5CSKro21VFh9dW6tZ9eogiK3G1gEfYSRc
 mRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vLQx1Cfo6NMYGKyAzHlak3XDgfOSp0H1hbHr7UYGQH4=;
 b=YDlRYei0J1gqJY+3QAH4bOiFMH5Q6jbizBcWPMzqBt7vR8dBawGP9vUlFYprKow/N6
 XO8c7uwtfms0RYFa2FyyWGzS9RkbIB/sl1vr6J5tFBOLwYk+zGyQP7fu33/nsPZbuqBd
 EnvrV9u/JU14+PXyXlKxrYzbTk8duwM3YCEz2A1dGY9+qBqtz8/h7mmQ9VaeJdujH5e9
 IY8NnXmliHWcOTsfZMcMApDLLFsX3l6DMkeS6BvORnFoQi9TVb40Hd9TzaNMJMgCNCW4
 ZKJ6F1t/CWHWoHJ98/Mrfn2k3D7EQ4k/N9biZ4QxdViLtfgm90tdNF5UOKyzAw7/G6JE
 TQwA==
X-Gm-Message-State: AOAM531LKneRoP8Um0XvvgjNeTMiVl5ya9a5uZ3/OHe3XaOPID+8HQxU
 ielyW44HYJymtmy9+H+RN7QOoybzSew=
X-Google-Smtp-Source: ABdhPJyKfTt7s+hXj2wrI20wtzxyHA+LfKXIU00VLlyyCJrWQFHBCQThqvsryE6tm85XtLfRjUF3NQ==
X-Received: by 2002:a17:906:340d:: with SMTP id
 c13mr5692563ejb.29.1616514866665; 
 Tue, 23 Mar 2021 08:54:26 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id u13sm11560812ejn.59.2021.03.23.08.54.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 08:54:25 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/9] drm/tegra: dc: Inherit DMA mask
Date: Tue, 23 Mar 2021 16:54:30 +0100
Message-Id: <20210323155437.513497-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210323155437.513497-1-thierry.reding@gmail.com>
References: <20210323155437.513497-1-thierry.reding@gmail.com>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, James Jones <jajones@nvidia.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Inherit the DMA mask from host1x (on Tegra210 and earlier) or the
display hub (on Tegra186 and later). This is necessary in order to
properly map buffers without SMMU support and use the maximum IOVA
space available with SMMU support.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dc.c  | 7 +++++++
 drivers/gpu/drm/tegra/hub.c | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 2585ba70b706..5737a0c4dc9f 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2538,9 +2538,16 @@ static int tegra_dc_couple(struct tegra_dc *dc)
 
 static int tegra_dc_probe(struct platform_device *pdev)
 {
+	u64 dma_mask = dma_get_mask(pdev->dev.parent);
 	struct tegra_dc *dc;
 	int err;
 
+	err = dma_coerce_mask_and_coherent(&pdev->dev, dma_mask);
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to set DMA mask: %d\n", err);
+		return err;
+	}
+
 	dc = devm_kzalloc(&pdev->dev, sizeof(*dc), GFP_KERNEL);
 	if (!dc)
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index 8e6d329d062b..617240032c37 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -848,12 +848,19 @@ static const struct host1x_client_ops tegra_display_hub_ops = {
 
 static int tegra_display_hub_probe(struct platform_device *pdev)
 {
+	u64 dma_mask = dma_get_mask(pdev->dev.parent);
 	struct device_node *child = NULL;
 	struct tegra_display_hub *hub;
 	struct clk *clk;
 	unsigned int i;
 	int err;
 
+	err = dma_coerce_mask_and_coherent(&pdev->dev, dma_mask);
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to set DMA mask: %d\n", err);
+		return err;
+	}
+
 	hub = devm_kzalloc(&pdev->dev, sizeof(*hub), GFP_KERNEL);
 	if (!hub)
 		return -ENOMEM;
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
