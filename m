Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C17261F4F07
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 09:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A6196E326;
	Wed, 10 Jun 2020 07:35:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54FDC6E0ED
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 13:14:40 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id e125so12455442lfd.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 06:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=psA+m6s/YQ71wfUHabJ5pnZ0YjIiMWnkB+97bmL+R4g=;
 b=fqZ0bjYiV00boOxgS6onhvxlQ9S9CyK3l7dXy0+pQya1ipNEALmG2AE+b0GtFfTX0E
 vBjEsRnSHwVAdypxjN9AQ2RE4tkQZ0t+9Hf3LaX9zHdNqdEe1Qg1A/U2ia5X0z6CcRGi
 t0J+k/aYVe6Txy1mcz9mZWMRvJePE5u3/N7uCD4keohE5idEl7dR/6UzGLoOYPglryhL
 wkGjmcYEZKZc8ooE6EYKNJe1/Kpg1wIVDBWoOTPec9spYFSBMXwBElXLXFDP7fRDLtTr
 q7piTUsA/Wc5Fp/zWhFf9Ysp/qLz0okGyK9WdMN6ZXG5+iG3Bhm44n25wTIvyX0f69GI
 7Wzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=psA+m6s/YQ71wfUHabJ5pnZ0YjIiMWnkB+97bmL+R4g=;
 b=QQBo93BiRGhcHNqG58zlbg1UagQqpu+w8Dus0cRPituLO3iWvk+XNERgyHmwvvm4/t
 tXtMzTJiJ4lHeoRD/bnEA9WbGb5PSQchHPinEM9PlRWo0OZ/Tksf7MExSe6wqEXhIl2e
 bt/N05f7N7OPfLch9cAub+Qy5AxMo0/f+v9nsqyhrJKlHpAUxhUGGFiH6M7Az4fNLlB3
 SGF3rEZakrjyocEPrOLQZISBfp4eYmDT+fZxS5BO5KXJDEluNrCsrDg/E1hp+p/8rxke
 QpeELrTR147oC6wexH7y5kJlWdBXJdgmUQtoMPXLz8ZsOkdqjGAyybO3sVYyS3qamlzF
 W8XQ==
X-Gm-Message-State: AOAM530N7AxARrTOJGCXmVoxwXhUbchbEHhSia1cEYoqEWgPEyA32sVZ
 omrZwxObuBjwLxm9O/MSbSM=
X-Google-Smtp-Source: ABdhPJw/wnzx53uI16yvdGqHv0RalaBGuElHs69YM/FEdoHZHRzNhx+369sS1v+B+hNO8kRF0AeYRw==
X-Received: by 2002:a19:f813:: with SMTP id a19mr15271550lff.212.1591708478731; 
 Tue, 09 Jun 2020 06:14:38 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id l22sm4323522lji.120.2020.06.09.06.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 06:14:38 -0700 (PDT)
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
Subject: [PATCH v4 11/37] PM / devfreq: tegra30: Silence deferred probe error
Date: Tue,  9 Jun 2020 16:13:38 +0300
Message-Id: <20200609131404.17523-12-digetx@gmail.com>
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

Tegra EMC driver was turned into a regular kernel driver, it also could
be compiled as a loadable kernel module now. Hence EMC clock isn't
guaranteed to be available and clk_get("emc") may return -EPROBE_DEFER and
there is no good reason to spam KMSG with a error about missing EMC clock
in this case, so let's silence the deferred probe error.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/tegra30-devfreq.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index e94a27804c20..423dd35c95b3 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -801,9 +801,12 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 	}
 
 	tegra->emc_clock = devm_clk_get(&pdev->dev, "emc");
-	if (IS_ERR(tegra->emc_clock)) {
-		dev_err(&pdev->dev, "Failed to get emc clock\n");
-		return PTR_ERR(tegra->emc_clock);
+	err = PTR_ERR_OR_ZERO(tegra->emc_clock);
+	if (err) {
+		if (err != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Failed to get emc clock: %d\n",
+				err);
+		return err;
 	}
 
 	err = platform_get_irq(pdev, 0);
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
