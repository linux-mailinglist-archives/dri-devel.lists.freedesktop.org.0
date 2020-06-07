Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 777B91F0EFD
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 21:13:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF806E3E3;
	Sun,  7 Jun 2020 19:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBD1E6E181
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jun 2020 18:57:29 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id j18so4708091lji.2
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Jun 2020 11:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AmHb/qTFiuR6DXvA/ffC/nHLs0yGE7r571S6zKct1lc=;
 b=MqvDq9q43i2GPx/wPz9ytYWKP88kiBVVzmPi0yFwA3iNTVJYOcWPcz/wxxrokVqKJs
 RY2CBx0Uao//TS1K+2h9Hc+mVgFzsOqbu/Ghe8Wpzd/eRdkCsSLBsj2LZPSrW6lMqLUo
 VmpVlTn5mXp4qTqfXzgx84FXF1U4PCk9QykLsBNdfTfwQyr8ngdKJ+vEl4rV8ZWB5MwE
 F7TqbOvhJWSg6W3qu+BZuiUWaHqkbGdTASKaQT9ITEb3xxfOq74uJ7WW9gSbB1Jjc8GK
 gfGjh9yRYpVg255ue2RW9chLZ4Z+DBiwIFORi9YjB1lPu9vbcQifGETMCB/Jx67aWBg3
 P73g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AmHb/qTFiuR6DXvA/ffC/nHLs0yGE7r571S6zKct1lc=;
 b=hqnjAO3koq9B8uQkH2G6zCQmCHrAYg0HvVU50OB/7z6o7L3rvs1aHvyDxCQ7yO2h65
 7V4k/vqRuf6hWqNxnSEkPLCZpeOYR/f2ePOh+FqgHOnh4aTUvdcz9ZHgMDyKr2wmecI+
 cLKjQHYTusLsRUQU4KH/Wsgs+BuIr43GQFmW80mZ2+aiFFVbCHh/t45CbLWQkFTr8bJP
 8+DyTaxon8bEsxYowG6Otp/7pLQLC87VBta345lXpB4SNKW5nVM0e2Gz6CLNK8bQxONB
 gPSJRCV/XgMl9r0XM4wcqJASfHGVenpb9GGm05GgCUmuDB9dAzxeDYM4egKhOlr8JSc1
 7SFQ==
X-Gm-Message-State: AOAM530FOqs6fjnTO9XPsk/PDkNRIMJLyUc0FIpwWYOVhPqwZUs+0yw5
 tGn8aEkAzw/mSwz12kmFeBQ=
X-Google-Smtp-Source: ABdhPJwcOUSznwhDpkI4gzAVGoraSqC7sU2i1NNjjHI6KUrQgIoEDkkkPx49bixW8DPBHVbikgyv1w==
X-Received: by 2002:a2e:9dd8:: with SMTP id x24mr10027334ljj.304.1591556248332; 
 Sun, 07 Jun 2020 11:57:28 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id e21sm3650953ljb.135.2020.06.07.11.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 11:57:27 -0700 (PDT)
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
Subject: [PATCH v3 14/39] PM / devfreq: tegra20: Add error messages to
 tegra_devfreq_target()
Date: Sun,  7 Jun 2020 21:55:05 +0300
Message-Id: <20200607185530.18113-15-digetx@gmail.com>
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

It's useful to now when something goes wrong instead of failing silently,
so let's add error messages to tegra_devfreq_target() to prevent situation
where it fails silently.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/tegra20-devfreq.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/devfreq/tegra20-devfreq.c b/drivers/devfreq/tegra20-devfreq.c
index bf504ca4dea2..249d0dc44f6c 100644
--- a/drivers/devfreq/tegra20-devfreq.c
+++ b/drivers/devfreq/tegra20-devfreq.c
@@ -44,19 +44,25 @@ static int tegra_devfreq_target(struct device *dev, unsigned long *freq,
 	int err;
 
 	opp = devfreq_recommended_opp(dev, freq, flags);
-	if (IS_ERR(opp))
+	if (IS_ERR(opp)) {
+		dev_err(dev, "failed to find opp for %lu Hz\n", *freq);
 		return PTR_ERR(opp);
+	}
 
 	rate = dev_pm_opp_get_freq(opp);
 	dev_pm_opp_put(opp);
 
 	err = clk_set_min_rate(tegra->emc_clock, rate);
-	if (err)
+	if (err) {
+		dev_err(dev, "failed to set min rate: %d\n", err);
 		return err;
+	}
 
 	err = clk_set_rate(tegra->emc_clock, 0);
-	if (err)
+	if (err) {
+		dev_err(dev, "failed to set rate: %d\n", err);
 		goto restore_min_rate;
+	}
 
 	return 0;
 
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
