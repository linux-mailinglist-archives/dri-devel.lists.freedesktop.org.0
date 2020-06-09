Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B281F4F2E
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 09:37:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C1B6E44C;
	Wed, 10 Jun 2020 07:36:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 882E66E0ED
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 13:14:41 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id x22so12471390lfd.4
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 06:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mTclmq28GLYsw04BzrWHjRkTzltxC1UwK7DmWEtnz4Y=;
 b=ZgHs8HAencTPVUhtbAVYSfa4nW9ULdGMWFzfvxSBO5tClV12UMwawdaUhNd9KiiV+r
 8VAOPxPsIzXheMsc+tK3jIHwOPxrMlC82fTJ2weCWrznjCQnV0bXG7Vn0YQ2SAmR9/C/
 /lc3t/xigYaV1oRweu18DW+mJFToE/kBWplXZJM2BRu2iqfeVB2xA2R0uRupdFSrvqXf
 aJEtQTjrROz+JlCmtjUVQSagW2PayvibKYePfssT38LUkZBjclX/EoWShsr8lsX05+KH
 O3Hh8tEwYxyfmYtTR8tWhbMxfOLwMCeQW++tZF1mwRVaHAH+flGbVGxIoeDBAZUvJn9+
 lzJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mTclmq28GLYsw04BzrWHjRkTzltxC1UwK7DmWEtnz4Y=;
 b=QKosJV/AzL+pqzE48/gI0Deil+FCUzpXa54CuZNKOcHOlm5yLfC8N1WGTLlm98aXvO
 gqhWIaoUAjCm+LvONLEhGED3UXmAPX4X1eXJJ6hy+gwuj+yLwJeudxmfCsD313af4Mqg
 Ljv6qetFJLNWoyVZgOYsFqmn5q2m/a06NKX+suAp0epfqLHT9TAnPlZ7lSCir+i1o5me
 3rI6dSlEAVauIdhLm7paWiJSQEhfbvcbTQrVdocdIiAZgPzueU6PC0slUjjuB9RS/hnw
 pTci3jiU8VMmguFTLFHfz+qBaNlYKKaOWNVNtT+H7601hLnOnSRqfr34XTgbZlOr1dyg
 qPVg==
X-Gm-Message-State: AOAM530QQ/owJn6Aj6BJsJJG45hHpZxIs/DGPKnBT8IiisYS7UXdApen
 Jw6TVup6RRWtyX87ew8DkZU=
X-Google-Smtp-Source: ABdhPJyIyUMdwz3u6ZmBBB5w+U+vbMx0NlPpvQjr3Gf+YZCBZjb6DmFh+D3ifSeUDjBMxXdiWvrmYg==
X-Received: by 2002:a05:6512:10c3:: with SMTP id
 k3mr15602867lfg.33.1591708479951; 
 Tue, 09 Jun 2020 06:14:39 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id l22sm4323522lji.120.2020.06.09.06.14.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 06:14:39 -0700 (PDT)
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
Subject: [PATCH v4 12/37] PM / devfreq: tegra20: Use MC timings for building
 OPP table
Date: Tue,  9 Jun 2020 16:13:39 +0300
Message-Id: <20200609131404.17523-13-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200609131404.17523-1-digetx@gmail.com>
References: <20200609131404.17523-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 10 Jun 2020 07:35:32 +0000
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
 drivers/devfreq/tegra20-devfreq.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/devfreq/tegra20-devfreq.c b/drivers/devfreq/tegra20-devfreq.c
index 6469dc69c5e0..bf504ca4dea2 100644
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
@@ -151,12 +150,17 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 
 	tegra->regs = mc->regs;
 
-	max_rate = clk_round_rate(tegra->emc_clock, ULONG_MAX);
-
-	for (rate = 0; rate <= max_rate; rate++) {
-		rate = clk_round_rate(tegra->emc_clock, rate);
+	if (!mc->num_timings) {
+		err = dev_pm_opp_add(&pdev->dev,
+				     clk_get_rate(tegra->emc_clock), 0);
+		if (err) {
+			dev_err(&pdev->dev, "failed to add OPP: %d\n", err);
+			return err;
+		}
+	}
 
-		err = dev_pm_opp_add(&pdev->dev, rate, 0);
+	for (i = 0; i < mc->num_timings; i++) {
+		err = dev_pm_opp_add(&pdev->dev, mc->timings[i].rate, 0);
 		if (err) {
 			dev_err(&pdev->dev, "failed to add opp: %d\n", err);
 			goto remove_opps;
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
