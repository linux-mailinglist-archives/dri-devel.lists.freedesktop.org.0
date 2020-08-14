Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDAD245D51
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:09:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C9C56E4C4;
	Mon, 17 Aug 2020 07:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E656EAC3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 00:07:14 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id t23so8128167ljc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 17:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bjS15xtHXrUnM7iCNXL7EPsczHz2L3DzWOt0K6mcHE8=;
 b=YFCS2QrRp0FGtc1iVsHYn+sIReyd8H2Ajt6myMTgLXMJhH1urQnNvUnQcIUSCXG2g5
 a7bN9akTMATX4xOuLot4+FTXmdwxXcQrw0Mfg93Nb88rhjkjCQE6455J/2X9KiPRU8kD
 iI4S3Ybf8by6MtqCE2e+Do/QLZZ867H6aK/+AZ8NMJD2s9zpTnyNk0MeYKK7gVH1H/KI
 rHTMIz3M19VYOu0OLusDkGC5LTTMXNaviuxP3tbndKhn4KOqCYGzDAyFSdCdaLS0e7Gs
 pfPjnJZLlT5iZr4wVJvG7RYVMhnq840cLcqZcBioEoKI3nChe6xluYlpcCdoi2taVEPG
 vkCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bjS15xtHXrUnM7iCNXL7EPsczHz2L3DzWOt0K6mcHE8=;
 b=Wr3MYEO+s0gtpGo6IN6yJT2jQ3AjgpFMPgbM60yujpkTWmP/Ut9ipBmwtp/359oeiC
 jb2Zn8skhu7dYM9wkTmE3yfdCKff6QF26+Ol0QR7tV1FwWcMc2RozOKtp/gqaLKS8nxI
 XRbCznZWJl5JmVF7i0r5m9sGKOFM89kVDYj/RoJwFaT6f8iI3LbZuVWxaSjtQpkGYg20
 qa9kpqraYnl785Al87/35ppsed6esnL1jyFVJNkXHf9rFNBxHN/uIS6dyKj7L7zL1jXq
 w1JTs/fw1qAUc+gUawZ4OlIbp8SJ1ZvdOwthj7U0zdppTdNcAEAsi9+GxEnudmMuPhPt
 xofg==
X-Gm-Message-State: AOAM530J3KmGSiVodTFIEZmMmDwhWW1TvmNNlgPdbB7COhPuqGd1mpZ7
 jXFD2d/rfrm9uxFNO2f19EA=
X-Google-Smtp-Source: ABdhPJwQDYHAtpZ5+gDAzMB2w7Bzd9T+Cz7ZuPoj+LPBOqaXO2G+ZzicL3WI8E8Tos3Spd/SPclalQ==
X-Received: by 2002:a2e:d1a:: with SMTP id 26mr107967ljn.422.1597363633314;
 Thu, 13 Aug 2020 17:07:13 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.gmail.com with ESMTPSA id c17sm1504450lfr.23.2020.08.13.17.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 17:07:12 -0700 (PDT)
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
Subject: [PATCH v5 11/36] PM / devfreq: tegra30: Silence deferred probe error
Date: Fri, 14 Aug 2020 03:05:56 +0300
Message-Id: <20200814000621.8415-12-digetx@gmail.com>
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

Tegra EMC driver was turned into a regular kernel driver, it also could
be compiled as a loadable kernel module now. Hence EMC clock isn't
guaranteed to be available and clk_get("emc") may return -EPROBE_DEFER and
there is no good reason to spam KMSG with a error about missing EMC clock
in this case, so let's silence the deferred probe error.

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
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
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
