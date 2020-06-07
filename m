Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6E41F0F02
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 21:13:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F7F6E3C7;
	Sun,  7 Jun 2020 19:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 440616E19A
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jun 2020 18:57:23 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id u16so8867528lfl.8
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Jun 2020 11:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z07PPt/u97dYBnTZgvhRJ5rLo7+ZbziTOZ6KMaLiXtU=;
 b=Ctrheq2+Lk6agPf9hiEOvCmdXzM5uqqaftrWAGWVrhVKMKGMDwZHxP40MhdNi98r79
 jRnM/h+E9d6TV0BLQJypxKwufygJ1ZMzDYUntJlF3gpaBlbmAXXz0ZRG6gskT3AiKqls
 FQgLziaiSgFbIij7fr5PgZWH0ZN0VOFLqrvggSQhuHCh9GqlnZgfgJ4WJYhBplI+e92p
 tWIxsqbF3q63thO9NQ3ZAlJm9DD4SYtSu7ULH0FvzWFshROa5+GDnjIFQuQBy8Dyhuvj
 vcdcgPs8fBGgE03XAlczSbYn3oFxeszqKeJUp/Fczhm6nYh/0v2Kmy8TOKQyEVASmXLx
 FrCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z07PPt/u97dYBnTZgvhRJ5rLo7+ZbziTOZ6KMaLiXtU=;
 b=mqXWx/ENykJ2FEwAWyn/YYBIV3W3AElTWqz8Inu3NfBL5kYSnw5mdWTjK+KykxhhYl
 QoKV3f1rb2Xny7X/6t0Qn8/ZU2Y9t91I7S/SxuDiaR9Z79BRiB+2xvGeCX9xeaDREN/G
 /5CQeOuSwUMLynnK0f+YW+FFue9fIp6E4QW6EeeY02Yw1BjkLq4PJz/8FHdqEgWA5QNv
 DEBptoNb8rxsjFF9RHnug7EdXkjskOubbOTUN2UXHdyrQdNqFmXVfdfIhvqWsM4Gb9oD
 P39v+XyK8mW7t0pI/nY9V56+V2Jx0PBndvYb68gKlGvTpqdiR4IC3HUGACDYbc1qxz3v
 U+8A==
X-Gm-Message-State: AOAM530F2W/7nhDc75274dJ6jXoB+gQrr3QLhtYThVbh0WuF+9DNBspH
 c1bVfJTTgY/5BpeuZrlXd1A=
X-Google-Smtp-Source: ABdhPJxaKvBwRyTdyvk01wbXZBDYI3yeNk6swFO3Ell52B0Lg1W78KUXB4yGariWUIU0YR3GP/Pujg==
X-Received: by 2002:a19:8b06:: with SMTP id n6mr10632727lfd.66.1591556241530; 
 Sun, 07 Jun 2020 11:57:21 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id e21sm3650953ljb.135.2020.06.07.11.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 11:57:21 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>
Subject: [PATCH v3 09/39] memory: tegra20-emc: Initialize MC timings
Date: Sun,  7 Jun 2020 21:55:00 +0300
Message-Id: <20200607185530.18113-10-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200607185530.18113-1-digetx@gmail.com>
References: <20200607185530.18113-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 07 Jun 2020 19:13:00 +0000
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We're going to add interconnect support to the EMC driver. Once this
support will be added, the Tegra20 devfreq driver will no longer be
able to use clk_round_rate(emc) for building up OPP table. It's quite
handy that struct tegra_mc contains memory timings which could be used
by the devfreq drivers instead of the clk rate-rounding. The tegra_mc
timings are populated by the MC driver only for Tegra30+ SoCs, hence
the Tegra20 EMC could populate timings by itself.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra20-emc.c | 47 ++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index 035d9251e28a..a95522020a25 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -15,12 +15,15 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/sort.h>
 #include <linux/types.h>
 
 #include <soc/tegra/fuse.h>
 
+#include "mc.h"
+
 #define EMC_INTSTATUS				0x000
 #define EMC_INTMASK				0x004
 #define EMC_DBG					0x008
@@ -650,6 +653,38 @@ static void tegra_emc_debugfs_init(struct tegra_emc *emc)
 			    emc, &tegra_emc_debug_max_rate_fops);
 }
 
+static int tegra_emc_init_mc_timings(struct tegra_emc *emc)
+{
+	struct tegra_mc_timing *timing;
+	struct platform_device *pdev;
+	struct device_node *np;
+	struct tegra_mc *mc;
+	unsigned int i;
+
+	np = of_find_compatible_node(NULL, NULL, "nvidia,tegra20-mc-gart");
+	if (!np)
+		return -ENOENT;
+
+	pdev = of_find_device_by_node(np);
+	of_node_put(np);
+	if (!pdev)
+		return -ENOENT;
+
+	mc = platform_get_drvdata(pdev);
+	if (!mc)
+		return -EPROBE_DEFER;
+
+	mc->timings = devm_kcalloc(mc->dev, emc->num_timings, sizeof(*timing),
+				   GFP_KERNEL);
+	if (!mc->timings)
+		return -ENOMEM;
+
+	for (i = 0; i < emc->num_timings; i++)
+		mc->timings[mc->num_timings++].rate = emc->timings[i].rate;
+
+	return 0;
+}
+
 static int tegra_emc_probe(struct platform_device *pdev)
 {
 	struct device_node *np;
@@ -705,6 +740,18 @@ static int tegra_emc_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	/*
+	 * Only Tegra30+ SoCs are having Memory Controller timings initialized
+	 * by the MC driver. For Tegra20 we need to populate the MC timings
+	 * from here. The MC timings will be used by the Tegra20 devfreq driver.
+	 */
+	err = tegra_emc_init_mc_timings(emc);
+	if (err) {
+		dev_err(&pdev->dev, "failed to initialize mc timings: %d\n",
+			err);
+		return err;
+	}
+
 	tegra20_clk_set_emc_round_callback(emc_round_rate, emc);
 
 	emc->clk = devm_clk_get(&pdev->dev, "emc");
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
