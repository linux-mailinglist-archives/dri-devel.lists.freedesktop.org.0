Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43626562DC4
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 10:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B48BF10F481;
	Fri,  1 Jul 2022 08:21:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22E9510F4CB
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 08:21:30 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 i8-20020a17090aee8800b001ecc929d14dso4882134pjz.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Jul 2022 01:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=63pbLSKne9f5UCaDcrJmMmenMVeEUp+bxWKacPvU73Q=;
 b=PRw8pWiNZY18pWGJgVJIoN7OQ1s2yw48mle6GY/4XbqXfOM8W+/dPuxPjnVsAfDGVD
 A8m3pSEoZP2W9Wg38cQ0bbaNVAzWswoC+nKCFc5XCEUUvMoqG+yW9f+wcJB9/ETVNZdE
 nKZmCNjpve7XuRAN7ahyVkdcfDMzxh43YpC8OXHMdkvtfaGo7J4qx9vShhtdTpHbehD5
 wVHcFFMn7nLHFi/wvIRCCZVlt95Rq/qbO3FoUn/v11UMiq4rPMaLoG3T6vdbH0dMdE+P
 8U33SaenNIGQFDAOssieTM5n/BXEZBYaAw6ptyOuBYLvlncREiMhWug52kkrzT9h7GP7
 raLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=63pbLSKne9f5UCaDcrJmMmenMVeEUp+bxWKacPvU73Q=;
 b=bJAkpyA8xpMEA1ADuRy6uL26q5qULnN5koXKFh7xuFIwRrW4ru5H1uEC9G9zKhglCe
 XIBtFcMeviToh8b8iNKeX8ObEtQdBHIKSaH7dFIchphUwHVz9Ln7jR5hIyEJIAC+NoZN
 RNMkc91eH628WS4pA0M8qggJif3QFarfVSyRsXoZSI4mm0AYLiAy8FLs0dj3/a60Z1+D
 xchB9iGhevtM0F9rVmvRqcJBb9oDqLu6dGxm96hejQ9GCCko1ZC0m+N90cWbbFxLdqhs
 +fhBcstXPKHoACBVQBF8l93I89iUu0b8qj4Bd8bdI+fy1gSGf/SV5vEtPkgLsfKPYH/r
 A9ug==
X-Gm-Message-State: AJIora/j+mrc7OqDkrxwQQ7sI+cqLrE6d4RW4y0LqiBRYN8BpkHOla6h
 hNsM/GVYOXSUftFv41aDsxJyZQ==
X-Google-Smtp-Source: AGRyM1uxAmkNLUVQoSG5Xz0/hnQf267BwGjWNVZUTXaOfD1kC8GpNyCWX61Jw76VoQZ5wANEVlh6sw==
X-Received: by 2002:a17:902:e84a:b0:16a:5435:b5fc with SMTP id
 t10-20020a170902e84a00b0016a5435b5fcmr20837549plg.119.1656663689707; 
 Fri, 01 Jul 2022 01:21:29 -0700 (PDT)
Received: from localhost ([122.172.201.58]) by smtp.gmail.com with ESMTPSA id
 d59-20020a17090a6f4100b001ec7ba41fe7sm6182063pjk.48.2022.07.01.01.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 01:21:29 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2 16/30] drm/tegra: Migrate to dev_pm_opp_set_config()
Date: Fri,  1 Jul 2022 13:50:11 +0530
Message-Id: <b77a02f0ceaeb252f554f5378c2407c6463caad1.1656660185.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1656660185.git.viresh.kumar@linaro.org>
References: <cover.1656660185.git.viresh.kumar@linaro.org>
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
Cc: Nishanth Menon <nm@ti.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The OPP core now provides a unified API for setting all configuration
types, i.e. dev_pm_opp_set_config().

Lets start using it.

Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/gpu/drm/tegra/gr3d.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3d.c
index a1fd3113ea96..05c45c104e13 100644
--- a/drivers/gpu/drm/tegra/gr3d.c
+++ b/drivers/gpu/drm/tegra/gr3d.c
@@ -389,6 +389,10 @@ static int gr3d_init_power(struct device *dev, struct gr3d *gr3d)
 	struct device_link *link;
 	unsigned int i;
 	int err;
+	struct dev_pm_opp_config config = {
+		.genpd_names = opp_genpd_names,
+		.virt_devs = &opp_virt_devs,
+	};
 
 	err = of_count_phandle_with_args(dev->of_node, "power-domains",
 					 "#power-domain-cells");
@@ -421,7 +425,7 @@ static int gr3d_init_power(struct device *dev, struct gr3d *gr3d)
 	if (dev->pm_domain)
 		return 0;
 
-	err = devm_pm_opp_attach_genpd(dev, opp_genpd_names, &opp_virt_devs);
+	err = devm_pm_opp_set_config(dev, &config);
 	if (err)
 		return err;
 
-- 
2.31.1.272.g89b43f80a514

