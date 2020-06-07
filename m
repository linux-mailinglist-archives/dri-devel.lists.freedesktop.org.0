Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF971F0EFA
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 21:13:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9762E6E3BC;
	Sun,  7 Jun 2020 19:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82166E392
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jun 2020 18:57:25 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id i27so6813762ljb.12
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Jun 2020 11:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=psA+m6s/YQ71wfUHabJ5pnZ0YjIiMWnkB+97bmL+R4g=;
 b=S1PDuGNq7E9mwtIgJv3NytNhAkTlVeUjHCERs0sHTWdJynfgHKj9HKiJlkdyzlVByV
 oTp2g0nv9D+dx1ZvNNYB+EUg/qEggXllzjIo9USmcdTWZCK/K3K/8XLvWKwVsdT4Aver
 mxSLQ84VaSkpwXgz7vvie32cUccuHsXBPRIiPtkHDrriVpDH7z0G3EIEPoOrl3aibOJX
 SDMGs+K0Xz96yoAZ6E6Vzga4ARu4CsUIg9ReLIOTamPFRF5o2lFCXVhVfF5sJRuAub+O
 V0TB9avmvWpoA0GHdFcNb9ZFuVvoIQXYauZiH9NcI/qJQrdIkEYcoq3n3DWhaTZSqiqS
 BGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=psA+m6s/YQ71wfUHabJ5pnZ0YjIiMWnkB+97bmL+R4g=;
 b=Hg56GCOKCX6zTeT99PfNPZqcpui+jKxy//58YzPcrxfOf9QOcB/+IKVWDZ5IzuSqhl
 o9mHiBaFNP0pt1UR4vWC1Tj2cUwAqBrFefFnnkk3p9ygAWAOjWTEXMDdwnK+ir19LtIS
 IidFwuBfhbZV2euTcJX6vPSvxOX5E4wMVgPQ7hDNaj2wxG03dADgVBwYvvr15WCUy+8I
 4ef597idYrGb0iRYgsui6BWs+K4kKxPIXvwR0mIBfGGzB1PVNCdZ1AgmmEGtwOu9hqTB
 j0oU+9eTv3YaItClYd5YwDhHAJtaG5TP1G4Gk0J4t0qxkqtkRsoUrbjgIBnuAzBdNVmp
 q2iQ==
X-Gm-Message-State: AOAM530/llim1x0hmguD8dI1YPDJgx/g9nZ0O+zMhmHks61+Lq5EJV/f
 U3XK7DszTWs1wcn7qnA9HRw=
X-Google-Smtp-Source: ABdhPJxheN0cL1ha+60/pLocAeabnd82f6oNwfdCGDjVhdBvpii8MY/VqywkmCm8atJ9gMWg7PzA7Q==
X-Received: by 2002:a2e:9cd1:: with SMTP id g17mr9784645ljj.149.1591556244340; 
 Sun, 07 Jun 2020 11:57:24 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id e21sm3650953ljb.135.2020.06.07.11.57.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 11:57:23 -0700 (PDT)
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
Subject: [PATCH v3 11/39] PM / devfreq: tegra30: Silence deferred probe error
Date: Sun,  7 Jun 2020 21:55:02 +0300
Message-Id: <20200607185530.18113-12-digetx@gmail.com>
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
