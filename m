Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 792081F0F12
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 21:14:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F5BF6E40D;
	Sun,  7 Jun 2020 19:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 507636E391
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jun 2020 18:57:20 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id y11so16107552ljm.9
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Jun 2020 11:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ae1m7Ph3kgiom2IEFZ6dxXExK3ejRG1JB/t6vIr/Q3s=;
 b=mtQay4Q9ofUUP33sJvj4zMle5xvDPx3udaiiLallcoLxMfc/4jY4MBs/rgxUtbE/8s
 5iK7PUd7EjTGOFB5ZGFJ4/mfhwcDHYWcA/RwOJeq3E0moenuvYytYcKBpC1Q+Hrz9XPS
 3kEGZOXm/O6FolluFSVQySt6znSfaVMqEutG0Psw44Pt5bDyW7hdL+2XXo9i4uDrNaPX
 aKqJC+nWPql++kAoEjpiK11R3FE8I9V6ZuJPROLdtJlqn6mfhr4M+BaMlXYVMF/L1SnS
 j7RfZhrb6DcQ8N5EgqOfpJGC+dGenobV/OozuHeaLYjos/jdS+PbPjmgNNjy5XykU7Ys
 gTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ae1m7Ph3kgiom2IEFZ6dxXExK3ejRG1JB/t6vIr/Q3s=;
 b=rGnGlxu89Z470wkBlNkZ8DDM+v4IuBoa/ArlA8di7QKi5giP+MZ+E37CRbKh9sZLoE
 s0uLUd+9P0mUcCjY//6UMG5M1OWaQfpEzaD+3F+XRGJv0M3Y3cdz3WkOxBhayUzEwhFn
 gBeaZFlj6eq5L/LVkS1M3NI3JiwjyKErBn/DsZFGguN7RCKTrXxzifOQEv0iEApdmitF
 aT2iu9smk7gsKIf9Nt4yYhDRtPM8VixYs0d7F1I6XGhjpzrLof+0I8Z+5BfA6SCmgIVJ
 ZALxDGEQLIQkuua9wnv3Ihnx76XB2U2G6VWZZuvbuxP9bOnGSWfybNKLcViHik1KZUiu
 RKBA==
X-Gm-Message-State: AOAM530CmzN8Z6ZLU4fPKKtIrdAruh6Tt9/eScDdry1gZIfLFUFlLPdF
 I/saUXeblzDBcs22AJ3DL4U=
X-Google-Smtp-Source: ABdhPJyXyPjJWmFFPoPBGaAtY7gStNO11rmSiuQdVjRgxt/rUh8kwxXQgH1XhGkcP3rI6EjRdmWxaA==
X-Received: by 2002:a2e:575d:: with SMTP id r29mr5569086ljd.120.1591556238755; 
 Sun, 07 Jun 2020 11:57:18 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id e21sm3650953ljb.135.2020.06.07.11.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 11:57:18 -0700 (PDT)
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
Subject: [PATCH v3 07/39] memory: tegra124-emc: Use
 devm_platform_ioremap_resource
Date: Sun,  7 Jun 2020 21:54:58 +0300
Message-Id: <20200607185530.18113-8-digetx@gmail.com>
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

Utilize that relatively new helper which makes code a bit cleaner.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra124-emc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index 95afb0fa4a06..46089ef023a8 100644
--- a/drivers/memory/tegra/tegra124-emc.c
+++ b/drivers/memory/tegra/tegra124-emc.c
@@ -1193,7 +1193,6 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	struct platform_device *mc;
 	struct device_node *np;
 	struct tegra_emc *emc;
-	struct resource *res;
 	u32 ram_code;
 	int err;
 
@@ -1203,8 +1202,7 @@ static int tegra_emc_probe(struct platform_device *pdev)
 
 	emc->dev = &pdev->dev;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	emc->regs = devm_ioremap_resource(&pdev->dev, res);
+	emc->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(emc->regs))
 		return PTR_ERR(emc->regs);
 
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
