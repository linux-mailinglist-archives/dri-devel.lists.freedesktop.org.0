Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 884267DE539
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 18:20:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB4210E751;
	Wed,  1 Nov 2023 17:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF1C10E141
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 17:20:26 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-9d10f94f70bso3702766b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Nov 2023 10:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698859225; x=1699464025; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YCWX20pm7NUxv4hyK070ttliGC4ogoFW2BX+CCQgl0k=;
 b=nrbDCY9JiJx/onCtMg9t3rjkle3KN40Z5dtWg7SjQYLMQMtkDGcQjQDpvKddmJL+74
 8Y7p3ofXrLaOPOjlbJBprgQZVu4YEnclQztmDB0zkO3/NzpjTLaESZCGbXxtqh1dUiq8
 6iYmDyKZqYFSvpNCu6pT6P3PBK7HVnRFsXBJ0CoZB1DQe2PIQ8XAa9/WU1Yp/J3SzYQ7
 CATJbL+r5SdLRNNLr/cxm+l/oMUfTmitrFS6qV8mYDJo8tS7jDL5UswK0BFj/ZDE1o+c
 pBt+TSoNHHWatKOUqKbbZC2V8YvqndXa5Iegx1WFp2ii95l5+QOkTBj3YVYEJzxGt2Fa
 F2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698859225; x=1699464025;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YCWX20pm7NUxv4hyK070ttliGC4ogoFW2BX+CCQgl0k=;
 b=bQQd4COxnhiZ9V5FCC2wOkuj+wa1ttrUG9cLWna2O8sHAW/Hv9CM90Tud8A8cVdDVo
 Nn7QgM0PNfxAQAgc68shIBZYdv10KE0R9f8GwFcuYjZqTs/jQ2D8iv4gmFM9TWz3lCiY
 0+fxy300sBN69MAdLhjVLf/tnRdY79g/wiNKol61UdDH9bxAev+gEi6BBzrCbzm/w5+C
 PhkiuM7owmpsA13lG5Q5w/8N3wV/mTaONzcxE5NLdgY8TiaN51FyODiUrjzl0PVsd/sE
 4YTSagGyvsgk1ud62xCrzGwEMOme+wIvF882RpOK7cMpQ55Vv52wYFvkqMaLGgYFhcRM
 ZTlA==
X-Gm-Message-State: AOJu0YwGs3qWTUy8cBtPYyNZpnbx8uJ/IBDoX/NUH8ziuzsRaRtXjBOJ
 40O5GobZxGsZr+J01NnAHCU=
X-Google-Smtp-Source: AGHT+IELfHY0ppV6/oc/rv+QctOqXbA+B/dAZdJV4WnAElYHxcL5x8bScFtIyqNY3pUPUxYOY5G1GA==
X-Received: by 2002:a17:907:6d16:b0:9be:d55a:81c3 with SMTP id
 sa22-20020a1709076d1600b009bed55a81c3mr2300010ejc.67.1698859225126; 
 Wed, 01 Nov 2023 10:20:25 -0700 (PDT)
Received: from localhost
 (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 i18-20020a170906115200b009ad8acac02asm160956eja.172.2023.11.01.10.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 10:20:24 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Helge Deller <deller@gmx.de>
Subject: [PATCH v2 2/2] fbdev/simplefb: Add support for generic power-domains
Date: Wed,  1 Nov 2023 18:20:17 +0100
Message-ID: <20231101172017.3872242-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231101172017.3872242-1-thierry.reding@gmail.com>
References: <20231101172017.3872242-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Robert Foss <rfoss@kernel.org>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

The simple-framebuffer device tree bindings document the power-domains
property, so make sure that simplefb supports it. This ensures that the
power domains remain enabled as long as simplefb is active.

v2: - remove unnecessary call to simplefb_detach_genpds() since that's
      already done automatically by devres
    - fix crash if power-domains property is missing in DT

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/video/fbdev/simplefb.c | 93 ++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
index 18025f34fde7..fe682af63827 100644
--- a/drivers/video/fbdev/simplefb.c
+++ b/drivers/video/fbdev/simplefb.c
@@ -25,6 +25,7 @@
 #include <linux/of_clk.h>
 #include <linux/of_platform.h>
 #include <linux/parser.h>
+#include <linux/pm_domain.h>
 #include <linux/regulator/consumer.h>
 
 static const struct fb_fix_screeninfo simplefb_fix = {
@@ -78,6 +79,11 @@ struct simplefb_par {
 	unsigned int clk_count;
 	struct clk **clks;
 #endif
+#if defined CONFIG_OF && defined CONFIG_PM_GENERIC_DOMAINS
+	unsigned int num_genpds;
+	struct device **genpds;
+	struct device_link **genpd_links;
+#endif
 #if defined CONFIG_OF && defined CONFIG_REGULATOR
 	bool regulators_enabled;
 	u32 regulator_count;
@@ -432,6 +438,89 @@ static void simplefb_regulators_enable(struct simplefb_par *par,
 static void simplefb_regulators_destroy(struct simplefb_par *par) { }
 #endif
 
+#if defined CONFIG_OF && defined CONFIG_PM_GENERIC_DOMAINS
+static void simplefb_detach_genpds(void *res)
+{
+	struct simplefb_par *par = res;
+	unsigned int i = par->num_genpds;
+
+	if (par->num_genpds <= 1)
+		return;
+
+	while (i--) {
+		if (par->genpd_links[i])
+			device_link_del(par->genpd_links[i]);
+
+		if (!IS_ERR_OR_NULL(par->genpds[i]))
+			dev_pm_domain_detach(par->genpds[i], true);
+	}
+}
+
+static int simplefb_attach_genpds(struct simplefb_par *par,
+				  struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	unsigned int i;
+	int err;
+
+	err = of_count_phandle_with_args(dev->of_node, "power-domains",
+					 "#power-domain-cells");
+	if (err < 0) {
+		dev_info(dev, "failed to parse power-domains: %d\n", err);
+		return err;
+	}
+
+	par->num_genpds = err;
+
+	/*
+	 * Single power-domain devices are handled by the driver core, so
+	 * nothing to do here.
+	 */
+	if (par->num_genpds <= 1)
+		return 0;
+
+	par->genpds = devm_kcalloc(dev, par->num_genpds, sizeof(*par->genpds),
+				   GFP_KERNEL);
+	if (!par->genpds)
+		return -ENOMEM;
+
+	par->genpd_links = devm_kcalloc(dev, par->num_genpds,
+					sizeof(*par->genpd_links),
+					GFP_KERNEL);
+	if (!par->genpd_links)
+		return -ENOMEM;
+
+	for (i = 0; i < par->num_genpds; i++) {
+		par->genpds[i] = dev_pm_domain_attach_by_id(dev, i);
+		if (IS_ERR(par->genpds[i])) {
+			err = PTR_ERR(par->genpds[i]);
+			if (err == -EPROBE_DEFER) {
+				simplefb_detach_genpds(par);
+				return err;
+			}
+
+			dev_warn(dev, "failed to attach domain %u: %d\n", i, err);
+			continue;
+		}
+
+		par->genpd_links[i] = device_link_add(dev, par->genpds[i],
+						      DL_FLAG_STATELESS |
+						      DL_FLAG_PM_RUNTIME |
+						      DL_FLAG_RPM_ACTIVE);
+		if (!par->genpd_links[i])
+			dev_warn(dev, "failed to link power-domain %u\n", i);
+	}
+
+	return devm_add_action_or_reset(dev, simplefb_detach_genpds, par);
+}
+#else
+static int simplefb_attach_genpds(struct simplefb_par *par,
+				  struct platform_device *pdev)
+{
+	return 0;
+}
+#endif
+
 static int simplefb_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -518,6 +607,10 @@ static int simplefb_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto error_clocks;
 
+	ret = simplefb_attach_genpds(par, pdev);
+	if (ret < 0)
+		goto error_regulators;
+
 	simplefb_clocks_enable(par, pdev);
 	simplefb_regulators_enable(par, pdev);
 
-- 
2.42.0

