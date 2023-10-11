Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D90947C5716
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 16:38:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 683D210E4FD;
	Wed, 11 Oct 2023 14:38:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C112410E4F7
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 14:38:14 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-32167a4adaaso6282060f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 07:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697035093; x=1697639893; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vF4uO90NovqaRh6VMscLRyanHDtPOqcaalcaa8i5r2I=;
 b=ONJonBXXDF6K4z+HSsPF9nteITU7vXFgRk4L4T6NoITnhMPI5FBxZgMtgK3kMh6Eb3
 fVSVrgqsrp/D4WwFc7RjAvriQ5Ey7rDfr+crdu0Fx1O72bFAF/+cFIQSdhB332Tq3wCl
 UUvR90aliYT9Rhii6Oi1OwZ9LgqeG3vxniwzOHFN4Ibwo2ojEDHY3mbC4vd4+Axj4DYX
 ePITJXnyEdhk7a+lhUjgpM+al+OBT7bFO+jUFQmLEhY4K/XxpPL2CBKmI8UxxuSd4WDn
 CrE2z0eD0Ma1SyW08ClLfrKsG8p0WYBO9876ilXgAzpvxKypxQuEnOjBP3M2kA8DJPxy
 sG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697035093; x=1697639893;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vF4uO90NovqaRh6VMscLRyanHDtPOqcaalcaa8i5r2I=;
 b=Onz6CJmqNrFBysTsJ7W8LDWbREc+XvkjuEvMtbu0rdBqoxgnc8a99bH9pSYBwfXljM
 EC8ASfTlIjr855Go2+9OepptmdSKW6odDDNc4jJ03MudFkrAApWo5ZTaNv0DenGnv/cn
 Kevwpsnd0+kDXz1uiDgg8RnxNElddLQykYfMRDSlasVbU9AQv5/Gl/MmS3qsR1a8FYSf
 veH0PsM8XMF+6mgcIPAqGJMexprOYdGQUpdaIefMsJvEmfazw1YHoGFgN+0ueC2wDnIi
 o97C6CdhhqltPj84dsc+5Mryr9rz2RENQClqPXMffUQCIkcjN7EGHQegqbnRvFQ0auh7
 c+VQ==
X-Gm-Message-State: AOJu0YzBAer5gVpi3R8zRPXnxlsTAKrcHKVtuXWIQ4z32JUgBFf/QplC
 /nJoWfipteAaL4KS2BnY9nQ=
X-Google-Smtp-Source: AGHT+IHChBapVzVvAYkFv62bxpTDvF0tfbAwpm266ScxTppnDb9LHy1SGE1EUMg7OwHDyYDQZ8k7HA==
X-Received: by 2002:a5d:6390:0:b0:32d:3ecc:38c9 with SMTP id
 p16-20020a5d6390000000b0032d3ecc38c9mr3933985wru.0.1697035093055; 
 Wed, 11 Oct 2023 07:38:13 -0700 (PDT)
Received: from localhost
 (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a05640210d600b00530a9488623sm8962615edu.46.2023.10.11.07.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 07:38:12 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Helge Deller <deller@gmx.de>
Subject: [PATCH 2/2] fbdev/simplefb: Add support for generic power-domains
Date: Wed, 11 Oct 2023 16:38:09 +0200
Message-ID: <20231011143809.1108034-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231011143809.1108034-1-thierry.reding@gmail.com>
References: <20231011143809.1108034-1-thierry.reding@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

The simple-framebuffer device tree bindings document the power-domains
property, so make sure that simplefb supports it. This ensures that the
power domains remain enabled as long as simplefb is active.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/video/fbdev/simplefb.c | 93 +++++++++++++++++++++++++++++++++-
 1 file changed, 91 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
index 18025f34fde7..e69fb0ad2d54 100644
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
@@ -432,6 +438,83 @@ static void simplefb_regulators_enable(struct simplefb_par *par,
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
+static int simplefb_attach_genpd(struct simplefb_par *par,
+				 struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	unsigned int i;
+	int err;
+
+	par->num_genpds = of_count_phandle_with_args(dev->of_node,
+						     "power-domains",
+						     "#power-domain-cells");
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
+static int simplefb_attach_genpd(struct simplefb_par *par,
+				 struct platform_device *pdev)
+{
+	return 0;
+}
+#endif
+
 static int simplefb_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -518,6 +601,10 @@ static int simplefb_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto error_clocks;
 
+	ret = simplefb_attach_genpd(par, pdev);
+	if (ret < 0)
+		goto error_regulators;
+
 	simplefb_clocks_enable(par, pdev);
 	simplefb_regulators_enable(par, pdev);
 
@@ -534,18 +621,20 @@ static int simplefb_probe(struct platform_device *pdev)
 	ret = devm_aperture_acquire_for_platform_device(pdev, par->base, par->size);
 	if (ret) {
 		dev_err(&pdev->dev, "Unable to acquire aperture: %d\n", ret);
-		goto error_regulators;
+		goto error_genpds;
 	}
 	ret = register_framebuffer(info);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Unable to register simplefb: %d\n", ret);
-		goto error_regulators;
+		goto error_genpds;
 	}
 
 	dev_info(&pdev->dev, "fb%d: simplefb registered!\n", info->node);
 
 	return 0;
 
+error_genpds:
+	simplefb_detach_genpds(par);
 error_regulators:
 	simplefb_regulators_destroy(par);
 error_clocks:
-- 
2.42.0

