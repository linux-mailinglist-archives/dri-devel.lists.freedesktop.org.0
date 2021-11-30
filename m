Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BAD4642C8
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 00:25:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C75E6E852;
	Tue, 30 Nov 2021 23:24:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CD906E81D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 23:24:28 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id u3so57957612lfl.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 15:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KmcymaX/CCDsjvKZ+BlarVFlOy3iTU1wE2LEPj5HoVo=;
 b=I/QkotZVXv315Oi1g8NIMhf14WBrbAp7YkWmPJEBawAZ5+UIJNbSWrXd4N3QlQ1Fwv
 7dbwKKWNE+5ITegxRC+PwokEIJZqQVuAf7G5gFSBhv8qlCbJK99My5FBSzTCUVQ0zbrh
 tdAO5CejqWmgsjkDPxLXZ0o/l3C7ITv4wHVbeYU9qqgcGxouQgIcYol9olH2AdOV+zFE
 0J9Nn+hVWIOMRN5VI0GqrfToZM0nPBQzyFIsI18+cWXe3T6O0qyS9+h7fcteTnF+aHYc
 HQeM1+YGNhdHBUYwFgnS5sLbHbN5buz6+OZSPXFNPUy4TEQ6HxDDfXNgVTOITU7ZLWwu
 t8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KmcymaX/CCDsjvKZ+BlarVFlOy3iTU1wE2LEPj5HoVo=;
 b=jsFdZIrLiiJTolLtg2ZFt4aExp5X4TBTuA6iAFeOtTcstRTTRvV8KjTaNbPEAquCz4
 LPgBzdudjTNYE+h5noIVrXybWaorOTOybD7uSPcj9ZDVBWTDZcCEuyQoYDQFQIvN0bG4
 EavJ/BhnHxh6ewOnoM0xDZ8Zmcdc2yKrBGH2iMprh+pOxTiKScgN3F9D0g+uaePSOZOG
 Ii6yK6ecq0XSJoBNiql8wZgz7BekFwXyd72SwR87hFwT4u9gXmeDdfjBVpznHgIUFViZ
 nENfoRtCgbYbOuYOj2Boc+WWtnY8PBbicSjUvKYfL9nrG5eurDHRY8jXKLGBEKMi0698
 PGdA==
X-Gm-Message-State: AOAM533Rj8VDb0qJgNTd9oi3XL8P90WcWsN0k9l/BeCOLgUaeQV7QmJD
 wK+/o2vWxIOBhsRdd3Xk5/8=
X-Google-Smtp-Source: ABdhPJwczFO7U2TRbH10RX6DKwTV7Tq6mEdV861qEmVo8euqcNnBcJJuYQVd4mp9nIOOAK6YBjgZzg==
X-Received: by 2002:a05:6512:118b:: with SMTP id
 g11mr715311lfr.46.1638314666849; 
 Tue, 30 Nov 2021 15:24:26 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id x199sm1860735lff.284.2021.11.30.15.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 15:24:26 -0800 (PST)
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
Subject: [PATCH v16 33/40] soc/tegra: pmc: Enable core domain support for
 Tegra20 and Tegra30
Date: Wed,  1 Dec 2021 02:23:40 +0300
Message-Id: <20211130232347.950-34-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211130232347.950-1-digetx@gmail.com>
References: <20211130232347.950-1-digetx@gmail.com>
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

