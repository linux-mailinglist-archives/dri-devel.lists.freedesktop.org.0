Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9BE44FA3E
	for <lists+dri-devel@lfdr.de>; Sun, 14 Nov 2021 20:36:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F9BD6E875;
	Sun, 14 Nov 2021 19:36:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 578216E871
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 19:36:01 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id l22so37516356lfg.7
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 11:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rGt0BYEmXAksyhDFPu2BDGLoJLdnyV3VilAtYqDDqgs=;
 b=lVqJAOeNI0okpK+ZNPrPpQzhKhnvBynLj6rEd5DozN5lsk4t7hvTL+CgzdLf5NesKP
 llHomqAOkg5bAWNLo7neo17ZmmABy46e5gJrTg1ghb+ivk1IFEjkLEP/1PaHaTEI7DDU
 s8occ9jGoqqBZUqKdoUNcNCoTICQXgG17ow2VYDDlCZHDUTBciRSFYSuNef/PGF910Cw
 WCL+AZZDNxa0mTnCCIi5slFWeDBu38zmI056Lxwsbw6ErQxX3oSqjbjs5jY318csw4FG
 3tW3yCimiKuZW1MArDrTyNWNZLAx36+vRAimvL2Jy9qTn53Y9qBFxrUcYy6ZveN7kObk
 jDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rGt0BYEmXAksyhDFPu2BDGLoJLdnyV3VilAtYqDDqgs=;
 b=QLmcyj6T+FgoNXogbe+PUyqyrsCP7zJQTdqzIyBM2sOtYNrK8zvA5PylxN6FAe6uNl
 3ISoefMSfl1lA3OW5PU3RpGNY5bXPORgD+kbmGlIzkXBnB2VVS8YQhQ8yLrCr0dkeUwZ
 kPo24mWJhtknaVZincguu/GBOLdn7su+xNpAONn9mDgdTvcVPe3VETFY/cyo2a0je6SA
 LDlByluMcIFnfrFRA2ij21gmgwcQrCsMp+s2+7ijrUvcDmPjCg/hCSHWq+qiuiIfY4lK
 zCuhKgzorVC6lKSJLhhYJj5+4zUjP7IfAj4khupL97Ob6R75nvD2dTGBTWUiLSLtw1gX
 VurA==
X-Gm-Message-State: AOAM531/Uqkji5g3Y0WqRhPUJ8ZcmGXbEO2YVb3tC7dsZMg+NPsAC55K
 enyjjL0CstD9AnAiaRO4WRQw76I67QM=
X-Google-Smtp-Source: ABdhPJyY+x77AHzGE324Voq1Crep3/hYOUHM6QvyVpOEpDOayjzVPnC7YoCw0MpQChNlRezJlYre7A==
X-Received: by 2002:a05:6512:5c2:: with SMTP id
 o2mr25852093lfo.8.1636918559591; 
 Sun, 14 Nov 2021 11:35:59 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru.
 [46.138.46.211])
 by smtp.gmail.com with ESMTPSA id p18sm1191280lfu.127.2021.11.14.11.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 11:35:59 -0800 (PST)
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
Subject: [PATCH v15 03/39] soc/tegra: Don't print error message when OPPs not
 available
Date: Sun, 14 Nov 2021 22:33:59 +0300
Message-Id: <20211114193435.7705-4-digetx@gmail.com>
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

Previously we assumed that devm_tegra_core_dev_init_opp_table() will
be used only by drivers that will always have device with OPP table,
but this is not true anymore. For example now Tegra30 will have OPP table
for PWM, but Tegra20 not and both use the same driver. Hence let's not
print the error message about missing OPP table in the common helper,
we can print it elsewhere.

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/common.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common.c
index 35c882da55fc..32c346b72635 100644
--- a/drivers/soc/tegra/common.c
+++ b/drivers/soc/tegra/common.c
@@ -136,9 +136,7 @@ int devm_tegra_core_dev_init_opp_table(struct device *dev,
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

