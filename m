Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9F51AD69D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 09:00:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5CC6E37F;
	Fri, 17 Apr 2020 06:59:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4706C6E0B6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 17:26:25 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id k28so6184682lfe.10
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 10:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z/MhmV+tzvMVyTZ+hbXLTjNNEHkIH/FwOHSo977XNI0=;
 b=h4emgDt+LvITvR7yotrGC7DQa7Wpeu0jeqRjX8y+OXCYOSzN4A5WVfyJuLh+XxftJu
 lsY5lmDYAgOQqvpprcdlY3BK6hx54CxljSyam7qdjJaCrD4nBrtyCsIJWcblqGVkPV6b
 6sKk0X8ZPJarvyEUe3Hdda88110MRwsK/Fdfrsu/GfqjnGxED2CVpgTqZyKwSNz0yBOT
 w5a3yCiP4y2iMbEsGwOji8ES9i+84U/qC7x6KtJWz4lik4w0YM8Fz70kkeZbQmNLb1kI
 tEwZosvRjowapArxaeFrlEc9c9QpjHWRZc7ZJQO9GCkUy+Z99Z0pGjAchEaje3JFUT+r
 +oww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z/MhmV+tzvMVyTZ+hbXLTjNNEHkIH/FwOHSo977XNI0=;
 b=E5YC4IdjL8XePt04uI+EXjj9E5Arw7Z9LMfMgkBftTY/C0ORMq4KRri8Ne1OsuWfRv
 6xvc/Xdo4cD1iEA0q2Yj7kixcE3SEAFLByXRBJwtYSgHStGQM0FQcDE7vZMwHG26Q1nj
 mBEXR0/mkUpUlPceoPk38s2fS5uRBGCm1jMk2+sGVIKAQNrcX6oXp1tbXSlk0L6EaQry
 FF+9iyGYkMO0UYHu52BB28wkaUCj48ael8v8AFnfLl4XDlGO4dsuOgjID31atWWqmPcU
 A8waXNcAr5Jjmlz9GNaKpAif61f1kSb5CrvnkURV54UYcCAjKEfL2DKk4P6T9A1MRJqn
 NXyQ==
X-Gm-Message-State: AGi0PuY1tRSihw9nAvDm1hC20YLCfgwIEGZWJLAroQEiK63QioQTcrTd
 42X4htauQyFo6bOih7XPkdQ=
X-Google-Smtp-Source: APiQypL6WC/JhsvoIKdwk+ofEsGfvm5ZkWQ1KcRrCNOVS+Ec4rlqGkCk2QwMltYmTa896nctz0qz0g==
X-Received: by 2002:ac2:5c07:: with SMTP id r7mr6829502lfp.160.1587057983693; 
 Thu, 16 Apr 2020 10:26:23 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.gmail.com with ESMTPSA id q26sm5367381ljg.47.2020.04.16.10.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 10:26:23 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v3 1/2] drm/tegra: output: Don't leak OF node on error
Date: Thu, 16 Apr 2020 20:24:04 +0300
Message-Id: <20200416172405.5051-2-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200416172405.5051-1-digetx@gmail.com>
References: <20200416172405.5051-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 17 Apr 2020 06:59:46 +0000
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

The OF node should be put before returning error in tegra_output_probe(),
otherwise node's refcount will be leaked.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/output.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index e36e5e7c2f69..a6a711d54e88 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -102,10 +102,10 @@ int tegra_output_probe(struct tegra_output *output)
 	panel = of_parse_phandle(output->of_node, "nvidia,panel", 0);
 	if (panel) {
 		output->panel = of_drm_find_panel(panel);
+		of_node_put(panel);
+
 		if (IS_ERR(output->panel))
 			return PTR_ERR(output->panel);
-
-		of_node_put(panel);
 	}
 
 	output->edid = of_get_property(output->of_node, "nvidia,edid", &size);
@@ -113,13 +113,12 @@ int tegra_output_probe(struct tegra_output *output)
 	ddc = of_parse_phandle(output->of_node, "nvidia,ddc-i2c-bus", 0);
 	if (ddc) {
 		output->ddc = of_find_i2c_adapter_by_node(ddc);
+		of_node_put(ddc);
+
 		if (!output->ddc) {
 			err = -EPROBE_DEFER;
-			of_node_put(ddc);
 			return err;
 		}
-
-		of_node_put(ddc);
 	}
 
 	output->hpd_gpio = devm_gpiod_get_from_of_node(output->dev,
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
