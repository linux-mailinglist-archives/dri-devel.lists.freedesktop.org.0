Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A1443A73C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 00:46:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE6FF6E2ED;
	Mon, 25 Oct 2021 22:46:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 996366E2D1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 22:45:50 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id o26so16225489ljj.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 15:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a2MUWDuJJpUna7beoys7HUlkLc5dT2+PUJ7Pew4QVd8=;
 b=ML4jIAvEJ8vKTsq17AYfVBKsZiuf7fZVFYxdsBt6xSXhJf4t+Iqim6iDlJD/piWXni
 fek3dcepc8dG06HIwCB9hxkpzgyX3ZeFfbfhj+jfM11+D0A2q3JYkYU2/UPA7vyvGNno
 6gjgC9GOhgNgbp/sWcH/2wvbwrSx5WnYqbzWO1FpB9SNg5WIem+yiCRS+KC2IzU4ybg6
 UlAzcjGrkSPcIfalST9W/8JB/Bp2do3N6/et5WjfyVZ3b3ytIAObcTT8fTXHRcjWyATF
 qZHYhDROEZ68g+0Lrdbt24VcudseLdSJK2SQeJh/tqwfo6zI5Z+cLTZFnHOCdXtwcFu3
 pxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a2MUWDuJJpUna7beoys7HUlkLc5dT2+PUJ7Pew4QVd8=;
 b=hweM8G1CbZE2Fm4sJg9BSSPx+Lbbt/3lQ6P+zCcZmROxm4XSKauH5bq7naJOu7f9P9
 saB5bhhZryjrjR9Zu+55Vx/DwS7KN+ptB0iWjlowl1bSMXcaEgpdI+4AEWW228b54LE8
 7VWt59zRFK3+1DD51dLxmeL5zap/PxvDEBY8p8Q9t2Krl3VWbTPGM1JCFVqd6d7UbWkq
 nZX1pPWoazgBq5HKOyHSrsqrmPD9U+SQqxYU6OfNty4JtfWwkx8MyBD4QeIgAo3snsrd
 lQKUVaI36YuKhLhtY6Y5J1qn12lrH9qyFfEid6tyb3rpTVW6FGjt4y8ubSr6i4kqs0Vf
 OkZg==
X-Gm-Message-State: AOAM532345Man8kiWpOdNsUM+tZ1nreoc9OR34dzpNjELJjDCK2ZoHk6
 yBsE8ZpE2E8v/CGqNsB1HYRATetTntg=
X-Google-Smtp-Source: ABdhPJwf9J5HuDmSJa4aWGCkbBrXSd1imh4D76BahTsUk6U/GExWJ3IrLvvMKTvVAy3s4MuYABg6tw==
X-Received: by 2002:a2e:88cf:: with SMTP id a15mr21829394ljk.378.1635201948920; 
 Mon, 25 Oct 2021 15:45:48 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id t20sm2040956lft.240.2021.10.25.15.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 15:45:48 -0700 (PDT)
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
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-mmc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, David Heidelberg <david@ixit.cz>
Subject: [PATCH v14 03/39] soc/tegra: Don't print error message when OPPs not
 available
Date: Tue, 26 Oct 2021 01:39:56 +0300
Message-Id: <20211025224032.21012-4-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211025224032.21012-1-digetx@gmail.com>
References: <20211025224032.21012-1-digetx@gmail.com>
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

Previously we assumed that devm_tegra_core_dev_init_opp_table() will
be used only by drivers that will always have device with OPP table,
but this is not true anymore. For example now Tegra30 will have OPP table
for PWM, but Tegra20 not and both use the same driver. Hence let's not
print the error message about missing OPP table in the common helper,
we can print it elsewhere.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/common.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common.c
index d930a2b4facc..bcc93e6f9205 100644
--- a/drivers/soc/tegra/common.c
+++ b/drivers/soc/tegra/common.c
@@ -127,9 +127,7 @@ int devm_tegra_core_dev_init_opp_table(struct device *dev,
 	 */
 	err = devm_pm_opp_of_add_table(dev);
 	if (err) {
-		if (err == -ENODEV)
-			dev_err_once(dev, "OPP table not found, please update device-tree\n");
-		else
+		if (err != -ENODEV)
 			dev_err(dev, "failed to add OPP table: %d\n", err);
 
 		return err;
-- 
2.33.1

