Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F42E44FAA1
	for <lists+dri-devel@lfdr.de>; Sun, 14 Nov 2021 20:37:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D9D76E89E;
	Sun, 14 Nov 2021 19:36:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5A16E888
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 19:36:28 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id z8so30668154ljz.9
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 11:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KmcymaX/CCDsjvKZ+BlarVFlOy3iTU1wE2LEPj5HoVo=;
 b=QVoRPM7LtqDuHOLWm1MC29HEJkjnB72zqcdZUlj53y23OvWuAqa/IjqMWbVKZ1dCe5
 KTG5iRgMzi3fN4X88vB3VAE7mCDKDoOSZatxoBud+uNXlgb8R0yUAHS6vkSBvV+ZN4LH
 FShMM+2v7uMr1m7KtxU8iVNPuekvvEh/4z6firy1SY9UTUNSaJACqgbbLytgqSl84dyd
 VGr06x5Aj7y4WGXuHVeIZp/FtkUSgge03k9K9f5RdyBauclGEjhStvhVPLBhGbD2kTcO
 V433kEokw1XVUFnMD27FRMCh/gfxqqrI6oeBOI+7OgOl23WH8cReYsCn8zKFa4+CU+QC
 Uexw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KmcymaX/CCDsjvKZ+BlarVFlOy3iTU1wE2LEPj5HoVo=;
 b=wC7z0ilm8xGWZdXCFbpJX1MB//3bKNdpyAZTFczJ3xdqsNv23KQzSW+lbUuYoOhnX2
 QhGVcSDadNsAb3yIKO2+Rh4uB4ufxI7vUyI9JkB9tl9mKcn8W5DGqn5tYDUAW7zNQJY+
 n2PIqyy7MUY6RDr7E9dxDO6FbDtkEMAdNHfwE6JYL2eRhigtgfuS0/q39f+7HcK7Fr0C
 X2c3+o3p7XuEGDDjbRpUsGi46NIrsX4Tee67Sj8VT4Tam05DJxQRbDQOwCrgGyWpVMBQ
 Ig8RJSjlQGUQnIKG+/f2Gwe93+mckoAeMXeepjFr4PB3oYL3ozb8GUK2WwOb/CLoNook
 i6SA==
X-Gm-Message-State: AOAM53198ChMvlThwymiP3YaZsQkQ120BLqNTj2nH2eRoiufnlW6xU7Z
 hJLsM3LZk7r0nK9y2VW9uWOWiNlx1/c=
X-Google-Smtp-Source: ABdhPJxb0PhhPD6n8iMAFQeacuKy19PXCB8pzsadQwOzQ8U5DbUiG7dZTWUE+ZwIhVTlV+zNNvtg3Q==
X-Received: by 2002:a2e:9903:: with SMTP id v3mr31613021lji.143.1636918587036; 
 Sun, 14 Nov 2021 11:36:27 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru.
 [46.138.46.211])
 by smtp.gmail.com with ESMTPSA id p18sm1191280lfu.127.2021.11.14.11.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 11:36:26 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v15 32/39] soc/tegra: pmc: Enable core domain support for
 Tegra20 and Tegra30
Date: Sun, 14 Nov 2021 22:34:28 +0300
Message-Id: <20211114193435.7705-33-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114193435.7705-1-digetx@gmail.com>
References: <20211114193435.7705-1-digetx@gmail.com>
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
Cc: linux-pwm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Heidelberg <david@ixit.cz>,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All device drivers got runtime PM and OPP support. Flip the core domain
support status for Tegra20 and Tegra30 SoCs.

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/pmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index de6234ec4f9b..585a05968ea9 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -3070,7 +3070,7 @@ static void tegra20_pmc_setup_irq_polarity(struct tegra_pmc *pmc,
 }
 
 static const struct tegra_pmc_soc tegra20_pmc_soc = {
-	.supports_core_domain = false,
+	.supports_core_domain = true,
 	.num_powergates = ARRAY_SIZE(tegra20_powergates),
 	.powergates = tegra20_powergates,
 	.num_cpu_powergates = 0,
@@ -3131,7 +3131,7 @@ static const char * const tegra30_reset_sources[] = {
 };
 
 static const struct tegra_pmc_soc tegra30_pmc_soc = {
-	.supports_core_domain = false,
+	.supports_core_domain = true,
 	.num_powergates = ARRAY_SIZE(tegra30_powergates),
 	.powergates = tegra30_powergates,
 	.num_cpu_powergates = ARRAY_SIZE(tegra30_cpu_powergates),
-- 
2.33.1

