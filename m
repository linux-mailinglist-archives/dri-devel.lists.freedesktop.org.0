Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 113673C153F
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 16:35:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 917516E0CC;
	Thu,  8 Jul 2021 14:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7469B6E0CC
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 14:35:08 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 k31-20020a05600c1c9fb029021727d66d33so2598935wms.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 07:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ipPj1iqNC9lnA7tWPR2FY8hVdI2WOPcAN/IFDy00v+M=;
 b=kUjx2vqbNzPCwmw0DvqVf0pTFM2RYCXbkFcKVeLrKb8lWq3fb5sXrM/Jyj+UI2kwam
 P5gSfsY2LUKeH/kC71apptesxesmAfB3TBcLUTG9f6WMISFTTFMkycDCy0tx5Xf/k3Lu
 p8ceVyemLcbK7F06uuJL0MsiFVyll2MJyb8shtUrBKcpsJWVkXF53LcKBEFS5oCR7UHA
 ZmELxe5MokRE+XNTrzICULe+0DbvNXgpo+I6E3bxaxtSfYUaJAVyKbPYurTxot/xB14e
 dYX4TDRLPgvwz1AYBPvB9kXRHMtJ+Ge17SxkEaa2sDrxFwSXDb2o4U48CYOWFXYRmn2K
 B8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ipPj1iqNC9lnA7tWPR2FY8hVdI2WOPcAN/IFDy00v+M=;
 b=kbxp59cokWzOQ4nTAk1QEyeYxp1VPmnwBGDcAaBTyxhkAclopOJncJ7W0ue3pacGsq
 gc80kqlLRVl99n9p9vPGI5PGmOfw5cPcBQI1h4fuf0siDFmQhmBzleZBa7Aa2WqXeHJG
 ni/u8le5iryTS/YBDMNtYVTBL1prq4yzzozlwD8Ar2MHkExj2GivBJReR4F78nCWb8Lp
 Kx/pKA8egbIvsS57q4dH3qEQXrYpDaPX/5gRRIbDQ0pQoqYTA9Y37+cf2ysfpjiPS4IX
 AXYrXVWNvXGr/DKXUF6gw5jNMm4qJ1Vw37eFqf9GygCNPFjDVDdL/7XfGS1qHrsEdCFw
 b1zw==
X-Gm-Message-State: AOAM531iFU8/kBuMJt6sv1qv6+TfIX3ps63k2L5VIJe9B2+9nr1cSvd4
 zuDN8l30ATH5fWptmJlzPIwOyhwF4AQ=
X-Google-Smtp-Source: ABdhPJw/2jHbxU8SCxDsF+TsGdstH4KTGC1LfafVBdspsh183upXjSK5U1TU749Kat/OiONRKVqXIA==
X-Received: by 2002:a7b:c214:: with SMTP id x20mr32696964wmi.171.1625754907129; 
 Thu, 08 Jul 2021 07:35:07 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id p7sm2398292wrr.21.2021.07.08.07.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 07:35:06 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] drm/tegra: gr2d: Explicitly control module reset
Date: Thu,  8 Jul 2021 16:37:36 +0200
Message-Id: <20210708143736.2018135-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
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
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

As of commit 4782c0a5dd88 ("clk: tegra: Don't deassert reset on enabling
clocks"), module resets are no longer automatically deasserted when the
module clock is enabled. To make sure that the gr2d module continues to
work, we need to explicitly control the module reset.

Fixes: 4782c0a5dd88 ("clk: tegra: Don't deassert reset on enabling clocks")
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/gr2d.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
index de288cba3905..ba3722f1b865 100644
--- a/drivers/gpu/drm/tegra/gr2d.c
+++ b/drivers/gpu/drm/tegra/gr2d.c
@@ -4,9 +4,11 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/iommu.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/reset.h>
 
 #include "drm.h"
 #include "gem.h"
@@ -19,6 +21,7 @@ struct gr2d_soc {
 struct gr2d {
 	struct tegra_drm_client client;
 	struct host1x_channel *channel;
+	struct reset_control *rst;
 	struct clk *clk;
 
 	const struct gr2d_soc *soc;
@@ -208,6 +211,12 @@ static int gr2d_probe(struct platform_device *pdev)
 	if (!syncpts)
 		return -ENOMEM;
 
+	gr2d->rst = devm_reset_control_get(dev, NULL);
+	if (IS_ERR(gr2d->rst)) {
+		dev_err(dev, "cannot get reset\n");
+		return PTR_ERR(gr2d->rst);
+	}
+
 	gr2d->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(gr2d->clk)) {
 		dev_err(dev, "cannot get clock\n");
@@ -220,6 +229,14 @@ static int gr2d_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	usleep_range(2000, 4000);
+
+	err = reset_control_deassert(gr2d->rst);
+	if (err < 0) {
+		dev_err(dev, "failed to deassert reset: %d\n", err);
+		goto disable_clk;
+	}
+
 	INIT_LIST_HEAD(&gr2d->client.base.list);
 	gr2d->client.base.ops = &gr2d_client_ops;
 	gr2d->client.base.dev = dev;
@@ -234,8 +251,7 @@ static int gr2d_probe(struct platform_device *pdev)
 	err = host1x_client_register(&gr2d->client.base);
 	if (err < 0) {
 		dev_err(dev, "failed to register host1x client: %d\n", err);
-		clk_disable_unprepare(gr2d->clk);
-		return err;
+		goto assert_rst;
 	}
 
 	/* initialize address register map */
@@ -245,6 +261,13 @@ static int gr2d_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, gr2d);
 
 	return 0;
+
+assert_rst:
+	(void)reset_control_assert(gr2d->rst);
+disable_clk:
+	clk_disable_unprepare(gr2d->clk);
+
+	return err;
 }
 
 static int gr2d_remove(struct platform_device *pdev)
@@ -259,6 +282,12 @@ static int gr2d_remove(struct platform_device *pdev)
 		return err;
 	}
 
+	err = reset_control_assert(gr2d->rst);
+	if (err < 0)
+		dev_err(&pdev->dev, "failed to assert reset: %d\n", err);
+
+	usleep_range(2000, 4000);
+
 	clk_disable_unprepare(gr2d->clk);
 
 	return 0;
-- 
2.32.0

