Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 171023EE281
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 03:30:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F476E0BE;
	Tue, 17 Aug 2021 01:30:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC35B6E0C9
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 01:30:22 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id z2so38241560lft.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 18:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=798UaN2O7BsVLG2b7m1c5jRBaYmhXVVyGNLo4voHgAg=;
 b=kvVJK68rK2YZFnYH8LrFoceFEfWX8v2ppJhtJN3FQtc/XATIT5s9S++aE6VkEC9DYG
 pPWSlJsOJO1b8DlywD0Isw2szPQhLAalyo/vn4NIId4qqB70lZRXqyD99GHeDF20S2+e
 s4FCcdFSP2sZOlaAe1yaHa3/lSK7TBLCfTc1rhYcwZgeWTO0SGJw1L1+hW41irMlRuiO
 7GyUipnboEW5APuePEelNLTy6r4iWOw3fauB5LOn9xOqBTJzmU+qHr0EiHewqV6In+qF
 z9UYR5Iz3M/DDK0jPFJUiTaEyXhln+hqNTZk67UhWbAETTV8Q2N46Uq2ruOz+21d/skT
 2qmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=798UaN2O7BsVLG2b7m1c5jRBaYmhXVVyGNLo4voHgAg=;
 b=p2V5ukyH9PlrsF3S9Ru0NPE//W1HbeNZUoGHYHAnSBWqJ+zqrbX2OW13G56RJyGpCP
 n7S7pHaky6i9vCzxDiTbEAsR8ZI1VGBjhPi5WUM/Qh84jXr8amif+DpyjnG9OaZ0vkoh
 JsANeRaJXU0O4ee/Da92i2LaoHzMP6v8USp9fwxPTbtOAlLDOpa9gS421aORsvP8ds5C
 2B0Oh13ZGAgfV99KJ1m6N7eaB0ZSTNAMJTmVyvlxms28p02BMUEHLCQbRxmJHc0E8r/v
 isxgZ8DN2rTK2axQ73T7GHMDUqBPjOLfUTXehGjJ9rTNNlXrHKSijvcy7cVwSCRH8VBY
 1tbA==
X-Gm-Message-State: AOAM5300fgX5vvkoC2vZ9HW5Og0o6s64kgDe3LfjMHKu6GuHTfBscacm
 lBoDCFKTFXggFvXpyafNnT0=
X-Google-Smtp-Source: ABdhPJyYy8hUiWmuOExv2ofTHn5i3TqgWVouaLyBH4QsjrVfyVuz3wXI+GZKIfHGO5W1gt6UIhmJEg==
X-Received: by 2002:a05:6512:3190:: with SMTP id
 i16mr508725lfe.340.1629163820646; 
 Mon, 16 Aug 2021 18:30:20 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 18:30:20 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: [PATCH v8 16/34] drm/tegra: vic: Support system suspend
Date: Tue, 17 Aug 2021 04:27:36 +0300
Message-Id: <20210817012754.8710-17-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817012754.8710-1-digetx@gmail.com>
References: <20210817012754.8710-1-digetx@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hardware must be stopped before system is suspended. Add suspend-resume
callbacks.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/vic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index c02010ff2b7f..359dd77f8b85 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -315,6 +315,8 @@ static int vic_runtime_suspend(struct device *dev)
 	struct vic *vic = dev_get_drvdata(dev);
 	int err;
 
+	host1x_channel_stop(vic->channel);
+
 	err = reset_control_assert(vic->rst);
 	if (err < 0)
 		return err;
@@ -517,6 +519,8 @@ static int vic_remove(struct platform_device *pdev)
 
 static const struct dev_pm_ops vic_pm_ops = {
 	SET_RUNTIME_PM_OPS(vic_runtime_suspend, vic_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 };
 
 struct platform_driver tegra_vic_driver = {
-- 
2.32.0

