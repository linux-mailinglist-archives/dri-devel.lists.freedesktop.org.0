Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D96D23DB6D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 17:47:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FC3E6E8D8;
	Thu,  6 Aug 2020 15:47:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E496E8D8
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 15:47:36 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id a14so18532238edx.7
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Aug 2020 08:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nLq3/R3B/Bs7i1xyWXouD50ckZ3IdU6H73XFc0RzNqU=;
 b=r7IVeb5V3rQ7PjXDc5E09ALkqa3y28KDU1C+uk6A9EOwxpSael7R1V78JihJThNKbc
 fGZuY1dUVCGKkMTWemiMcapVQ03l9R/nAG2W2MmZpQdF7bdcO2mu5FvLRwtPWT7bTuOw
 3yDUYuOSRgOtllBZfztbYUKBoOexBTfk+txrM3W9LaaBJCOUyeO2gftMfNALAmqfO8md
 3Oq9piRTEckH1pUbojbW/u7WD1SwCN5puNLRAzuSe6y2SG9aHC3OQi3+OMOXDqKUnAft
 6km7Z0OAsNLJUi9EL9oYhtl0YLiWP3hvqXhL6665Jesju2IePu3LZfEXP2sQHmPwtZRU
 NAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nLq3/R3B/Bs7i1xyWXouD50ckZ3IdU6H73XFc0RzNqU=;
 b=O3keYtw38dSojCEsRszdgkuxDa7b8C0xdpMvI4bw8pSy3xjAKV4qrtXFb/771Y9M23
 5DbKpzNZ5g+Kz4sLHtJ3kJzLKPd+ZcgBEMgDAWw2mYyXhng/CaJum/xC0OiA97gw6+E1
 DJ/J94Tig9K1vRbKfvkhaEtQqheyoGyKB5t2kohgDZwD+aa2cy2C3bIMW1XlM8RWz5w4
 sddGhirvmynEn0MeSgLZvpmOUOcSTMEaLI1DixbtU+sp14V21CFh5Yx4Yi0o4tOG5RU4
 /tu2F/UA7euF01HfDwqFQTcFFd4riEuf0dU+2pzyrBcrpCPFcxe2Ze52WTI0WnCmLUlf
 19xg==
X-Gm-Message-State: AOAM5301d+M7KNubmqvATZPbwn0AIxGLn1tOdJBZJN+LUcs/qTX9rC/w
 MC5mTlQMlkQFBbp61Thkg955FpvB
X-Google-Smtp-Source: ABdhPJz+QIzxLt9aaDspcJbe9CqTN90TYeRKWfqHikZphwICsiTy8nTYschoDetBTLUSxzk5kwA4Nw==
X-Received: by 2002:a05:6402:308e:: with SMTP id
 de14mr4573955edb.344.1596728854859; 
 Thu, 06 Aug 2020 08:47:34 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id qp16sm4064854ejb.89.2020.08.06.08.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 08:47:32 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] drm/tegra: Properly reference count the DDC I2C adapter
Date: Thu,  6 Aug 2020 17:47:31 +0200
Message-Id: <20200806154731.3935679-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.27.0
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Use the of_get_i2c_adapter_by_node(), which is similar to the existing
call to of_find_i2c_adapter_by_node() except that it also takes a
reference to the owner module of the I2C adapter. In order to properly
balance this out, call i2c_put_adapter() to release the reference to the
I2C adapter and its owner module.

For the special case where the DDC comes from the DPAUX, care must be
taken to perform the same steps (i.e. get_device() and module_get()) so
that the reference counts are all balanced.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/output.c | 4 ++--
 drivers/gpu/drm/tegra/sor.c    | 7 ++++++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index e36e5e7c2f69..03382550f7d9 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -112,7 +112,7 @@ int tegra_output_probe(struct tegra_output *output)
 
 	ddc = of_parse_phandle(output->of_node, "nvidia,ddc-i2c-bus", 0);
 	if (ddc) {
-		output->ddc = of_find_i2c_adapter_by_node(ddc);
+		output->ddc = of_get_i2c_adapter_by_node(ddc);
 		if (!output->ddc) {
 			err = -EPROBE_DEFER;
 			of_node_put(ddc);
@@ -173,7 +173,7 @@ void tegra_output_remove(struct tegra_output *output)
 		free_irq(output->hpd_irq, output);
 
 	if (output->ddc)
-		put_device(&output->ddc->dev);
+		i2c_put_adapter(output->ddc);
 }
 
 int tegra_output_init(struct drm_device *drm, struct tegra_output *output)
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 45b5258c77a2..e88a17c2937f 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3728,7 +3728,12 @@ static int tegra_sor_probe(struct platform_device *pdev)
 		if (!sor->aux)
 			return -EPROBE_DEFER;
 
-		sor->output.ddc = &sor->aux->ddc;
+		if (get_device(&sor->aux->ddc.dev)) {
+			if (try_module_get(sor->aux->ddc.owner))
+				sor->output.ddc = &sor->aux->ddc;
+			else
+				put_device(&sor->aux->ddc.dev);
+		}
 	}
 
 	if (!sor->aux) {
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
