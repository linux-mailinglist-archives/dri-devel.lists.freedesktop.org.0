Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 093EF245D1B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:07:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 927266E4C9;
	Mon, 17 Aug 2020 07:06:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14DAD6EAC0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 00:07:16 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id v9so8114626ljk.6
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 17:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FdFHEYH0SedaYmARghSCa7o+JjfWSMYBVfZijnGUEd0=;
 b=eRd1rHgYkncn22Ou0jtrzjuUMIhGYMHYufHy42pGDs51PAOtFx2BMutWIBqfSQZgeh
 D7/PQ6Xqbi4FxgeoJmMRNpZCjT8b2Uc+GUkG5ycvfAGH8nKeOCGifPVc+cSILE2DBkFq
 pwBsZhyi4RjC9JIaFLEoJceorJBvBa6rwT6J/Vn06MsajIMtPrlQeY1332O/NBjs8Zx7
 cCQrW7fLJxr6U1pgQqocd06kUMG4un9wqz5hetkah8/G5Frrr2jypCwDGGW0dHIaqSvR
 tloMI9cMtsC2Ggb+rToMR8iWZ0fyc0Z/grWTZbiGH4awBP6befBtmj+oE8ZDYPmB+e+1
 IXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FdFHEYH0SedaYmARghSCa7o+JjfWSMYBVfZijnGUEd0=;
 b=Bvnax9RfJPDb+PnRjf6jcZjT68mDuwr2YsAgbQXK1b80MJATNvKbIHYLzorKLLGZeA
 aqJSqVvmZl8VLR4Kbjyt/8lfoz34Y2rokgzBHF9AcHUxQk9GJilcm0jH5HH/dUXWqwMO
 Y7zlgOzINg74fD/7NoCBiNYJKXLdcNJfMAUGKGcX9CXIz80hoSvgxAJBqkSDCjZIXakt
 pxUx7ZxyKP9MbsK3c+tE9J+ndOtkyrjXpxuBWpZf5U7sDoorQAhd7CixXmEEHxUBMHju
 +EVpVwGGMIIfo3Kxg7QqTYcY9sC6G+TfsFKF2pdRpNs3GNLa0dGWebiHwkqxZrDaL2s5
 Q/Gw==
X-Gm-Message-State: AOAM5313q0MWCwRYTMguwHqG1fskEhQ9NjoEL9CkIz3QqDhI+B9lxm9x
 hUUI2/hA8Q7+P3MPW7VrJhPBLKII
X-Google-Smtp-Source: ABdhPJxL9BUYSKl5lC8jFL/iz/BrlYghtRVCp2vUSd1CIrGiHquNBYFpKfC60ekSidFAFA3FJT+PMw==
X-Received: by 2002:a2e:b008:: with SMTP id y8mr81369ljk.421.1597363634483;
 Thu, 13 Aug 2020 17:07:14 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.gmail.com with ESMTPSA id c17sm1504450lfr.23.2020.08.13.17.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 17:07:13 -0700 (PDT)
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
Subject: [PATCH v5 12/36] PM / devfreq: tegra20: Use MC timings for building
 OPP table
Date: Fri, 14 Aug 2020 03:05:57 +0300
Message-Id: <20200814000621.8415-13-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200814000621.8415-1-digetx@gmail.com>
References: <20200814000621.8415-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The clk_round_rate() won't be usable for building OPP table once
interconnect support will be added to the EMC driver because that CLK API
function limits the rounded rate based on the clk rate that is imposed by
active clk-users, and thus, the rounding won't work as expected if
interconnect will set the minimum EMC clock rate before devfreq driver is
loaded. The struct tegra_mc contains memory timings which could be used by
the devfreq driver for building up OPP table instead of rounding clock
rate, this patch implements this idea.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/tegra20-devfreq.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/devfreq/tegra20-devfreq.c b/drivers/devfreq/tegra20-devfreq.c
index 6469dc69c5e0..a985f24098f5 100644
--- a/drivers/devfreq/tegra20-devfreq.c
+++ b/drivers/devfreq/tegra20-devfreq.c
@@ -123,8 +123,7 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 {
 	struct tegra_devfreq *tegra;
 	struct tegra_mc *mc;
-	unsigned long max_rate;
-	unsigned long rate;
+	unsigned int i;
 	int err;
 
 	mc = tegra_get_memory_controller();
@@ -135,6 +134,11 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	if (!mc->num_timings) {
+		dev_info(&pdev->dev, "memory controller has no timings\n");
+		return -ENODEV;
+	}
+
 	tegra = devm_kzalloc(&pdev->dev, sizeof(*tegra), GFP_KERNEL);
 	if (!tegra)
 		return -ENOMEM;
@@ -151,12 +155,8 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 
 	tegra->regs = mc->regs;
 
-	max_rate = clk_round_rate(tegra->emc_clock, ULONG_MAX);
-
-	for (rate = 0; rate <= max_rate; rate++) {
-		rate = clk_round_rate(tegra->emc_clock, rate);
-
-		err = dev_pm_opp_add(&pdev->dev, rate, 0);
+	for (i = 0; i < mc->num_timings; i++) {
+		err = dev_pm_opp_add(&pdev->dev, mc->timings[i].rate, 0);
 		if (err) {
 			dev_err(&pdev->dev, "failed to add opp: %d\n", err);
 			goto remove_opps;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
