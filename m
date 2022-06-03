Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB92A53CAA8
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 15:27:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C72EA113714;
	Fri,  3 Jun 2022 13:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5088D1136B5
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 13:27:14 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id t2so6844989pld.4
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jun 2022 06:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zGYGCHPMc2wMb8+o7znOSNlSgZiftTrEQzD43QCV+90=;
 b=i+7jqG7KVpeeNJ6V0vSnIFfrYVTh3rBccm8ii5aNFr8oAtqmONw/g0UFyZdHC+/HlS
 CFMib75eX8uio37b5hjw6af7cqpT+gCDcEs57LXHZoQ/5Nxl5fok9aPlsyOgpAofkSgS
 UA+f5V66+4EEBe6I6tCrHosahkwoXlGAwaojY4YDiZ6foQ+jH9aQs8gNwLxqCwgYHS3B
 P1wVqrLLMJR2WkCVGuHHiynWC2mKpRTIfpu3BsaC7Wa6PkWZFP6PeiA6HqtUV62lpa0v
 fnl+5xHFwdmwR5L4aEdBL1yVEABKWAZZhS/gCkAYrf6SOkV0fdHT6GMP9XFZYGPGbioG
 HxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zGYGCHPMc2wMb8+o7znOSNlSgZiftTrEQzD43QCV+90=;
 b=a/6V6LhnXMKQfncbKm1wHHkWyyiSeRkFwuq7m986ElRkk59t9AZFaPjTjCyreKwC38
 YnNJ524bfAY7X3FdESpok1qOe6gvwqki2NzZOcbIbW/q7xUe+3ky7XErqZA9Vvoi7pld
 yr2hsKI+s9XfgkhmR+I1+PV/QMfRAYLnzrJ/sBrVcA6uTQKzqgjhmqHBc582k+/2ypG2
 vPs9qDrKqGky3AtvC8d6O9BxKoM2EIZmhWBswR9JMbBqowFupUzW8QPiOJcDmlLMVqij
 oWIT0C/b4M+Ab8DlLRZPi4pbqSd8k1r5FPamUYqJzL7EQQA42yWe33q8p9jJsS0NMpS2
 oVVQ==
X-Gm-Message-State: AOAM531rtxXlI8hafpNBrKahaOsF87Qbo31MQ3Tfu0sbP2qeiVAIpdtu
 Per6YwIDFDmdzC01VOMiBVQwR5uI/k0RoFHD0rU=
X-Google-Smtp-Source: ABdhPJzluHIhouQf927OhbZ6lRASEW4yUSiTagVN/uhD04GCE3ApYGm7UAFAiucHC3zND3JTXTWVRA==
X-Received: by 2002:a17:903:22d0:b0:164:ec0:178c with SMTP id
 y16-20020a17090322d000b001640ec0178cmr10442663plg.127.1654262833917; 
 Fri, 03 Jun 2022 06:27:13 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 l24-20020a17090ac59800b001e25e3ba05csm8536780pjt.2.2022.06.03.06.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 06:27:13 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Mark Zhang <markz@nvidia.com>, Terje Bergstrom <tbergstrom@nvidia.com>,
 Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/tegra: dc: rgb: Fix refcount leak in tegra_dc_rgb_probe
Date: Fri,  3 Jun 2022 17:27:03 +0400
Message-Id: <20220603132703.42085-1-linmq006@gmail.com>
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

of_get_child_by_name() returns a node pointer with refcount
incremented, we should use of_node_put() on it when not need anymore.
So add of_node_put() in error paths.

Fixes: d8f4a9eda006 ("drm: Add NVIDIA Tegra20 support")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
changes in v2:
- update Fixes tag.
v1 Link: https://lore.kernel.org/r/20220602155615.43277-1-linmq006@gmail.com
---
 drivers/gpu/drm/tegra/rgb.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index ff8fce36d2aa..cef2b1b72385 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -196,12 +196,16 @@ int tegra_dc_rgb_probe(struct tegra_dc *dc)
 	int err;
 
 	np = of_get_child_by_name(dc->dev->of_node, "rgb");
-	if (!np || !of_device_is_available(np))
-		return -ENODEV;
+	if (!np || !of_device_is_available(np)) {
+		err = -ENODEV;
+		goto err_put_node;
+	}
 
 	rgb = devm_kzalloc(dc->dev, sizeof(*rgb), GFP_KERNEL);
-	if (!rgb)
-		return -ENOMEM;
+	if (!rgb) {
+		err = -ENOMEM;
+		goto err_put_node;
+	}
 
 	rgb->output.dev = dc->dev;
 	rgb->output.of_node = np;
@@ -209,31 +213,34 @@ int tegra_dc_rgb_probe(struct tegra_dc *dc)
 
 	err = tegra_output_probe(&rgb->output);
 	if (err < 0)
-		return err;
+		goto err_put_node;
+
 
 	rgb->clk = devm_clk_get(dc->dev, NULL);
 	if (IS_ERR(rgb->clk)) {
 		dev_err(dc->dev, "failed to get clock\n");
-		return PTR_ERR(rgb->clk);
+		err =  PTR_ERR(rgb->clk);
+		goto err_put_node;
 	}
 
 	rgb->clk_parent = devm_clk_get(dc->dev, "parent");
 	if (IS_ERR(rgb->clk_parent)) {
 		dev_err(dc->dev, "failed to get parent clock\n");
-		return PTR_ERR(rgb->clk_parent);
+		err = PTR_ERR(rgb->clk_parent);
+		goto err_put_node;
 	}
 
 	err = clk_set_parent(rgb->clk, rgb->clk_parent);
 	if (err < 0) {
 		dev_err(dc->dev, "failed to set parent clock: %d\n", err);
-		return err;
+		goto err_put_node;
 	}
 
 	rgb->pll_d_out0 = clk_get_sys(NULL, "pll_d_out0");
 	if (IS_ERR(rgb->pll_d_out0)) {
 		err = PTR_ERR(rgb->pll_d_out0);
 		dev_err(dc->dev, "failed to get pll_d_out0: %d\n", err);
-		return err;
+		goto err_put_node;
 	}
 
 	if (dc->soc->has_pll_d2_out0) {
@@ -241,13 +248,17 @@ int tegra_dc_rgb_probe(struct tegra_dc *dc)
 		if (IS_ERR(rgb->pll_d2_out0)) {
 			err = PTR_ERR(rgb->pll_d2_out0);
 			dev_err(dc->dev, "failed to get pll_d2_out0: %d\n", err);
-			return err;
+			goto err_put_node;
 		}
 	}
 
 	dc->rgb = &rgb->output;
 
 	return 0;
+
+err_put_node:
+	of_node_put(np);
+	return err;
 }
 
 int tegra_dc_rgb_remove(struct tegra_dc *dc)
-- 
2.25.1

