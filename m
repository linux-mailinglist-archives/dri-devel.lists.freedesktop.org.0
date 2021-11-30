Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE0F46427D
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 00:24:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E06AB6E811;
	Tue, 30 Nov 2021 23:24:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D998D6E5C6
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 23:23:58 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id l22so57902373lfg.7
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 15:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rGt0BYEmXAksyhDFPu2BDGLoJLdnyV3VilAtYqDDqgs=;
 b=hYjs50JpK/p++K58Ujc9ubcdJqB861uXepZV1bX+eetvwMqZMXLA80AwSAwW69dTqV
 HocIqoiHXDV1gnFBCLYGwGovcCzTKFaLnrJOTCP1nr0OCTN1Iwsx/7zr2/R7mPbPL5pT
 vp2ZjrkAXKi5np9ryjhh3kQC7B6lwUmTeGZ4iiLuRyylMogAeaRoOLm+caPjCW0HxxAF
 AJke/JX8phasLWgR64TIxDMfrg/tQBv4TSPdUGrzKKBHAkzOCfZZuWuXkS04kgBLAmS7
 HGk75M06RG/vwWydfuyXGFP3JErdCrkInMMFKh5HPm338XenpNcNCuZYlHiBcKlvJSI4
 nSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rGt0BYEmXAksyhDFPu2BDGLoJLdnyV3VilAtYqDDqgs=;
 b=kiNgOCTD7bt5JgkV/JTEeXJgrmzD+NRGjqn60ef2Wmr/2ew+3m6z5VpwqUTH+zDS7J
 gdlAvU5cGyr3ZbSvuozNUy647qGd/EYrfKHWPdNFncFKgAGP3wgtSAfJl8P+VNSgi0Ud
 UqSMheJFa17xtDEuYUQRfdvVFEOhJJ9mEYc180S7cJTdSIkxK8sED+zdRFZiv7gwp9U/
 RLEs9CqV1D5mz023KHUIzGZP8Cm7wVuUprWi7MeOq4tmu7jEZw0w/hnCbHfFLhApJ/bC
 +cNa2WGwNut1dgtRRDSfhK8DpnsdywleLmRwK97NKFxK8hx3MtS9oeYkaovD2RW2rNRP
 SgpQ==
X-Gm-Message-State: AOAM533Enc2H01+vjDqUA38ZuMmi6RaAA4Nnzc5T4I7/AsB8aBSjnlvs
 I/Z6yCMgngyZHRjthoV8gJw=
X-Google-Smtp-Source: ABdhPJxapGltrB+HI+20V4TuzLOGRIh5IkpXbQ9OWJEwi4DFAiNSljeWPGxdtCrOEA2u2i0odAiHpg==
X-Received: by 2002:a19:7709:: with SMTP id s9mr2287962lfc.682.1638314637278; 
 Tue, 30 Nov 2021 15:23:57 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id x199sm1860735lff.284.2021.11.30.15.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 15:23:56 -0800 (PST)
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
Subject: [PATCH v16 03/40] soc/tegra: Don't print error message when OPPs not
 available
Date: Wed,  1 Dec 2021 02:23:10 +0300
Message-Id: <20211130232347.950-4-digetx@gmail.com>
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

