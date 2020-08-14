Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58773245D1D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:07:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F6D6E488;
	Mon, 17 Aug 2020 07:06:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8E316EAC3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 00:07:13 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id g6so8067784ljn.11
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 17:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=enQXWXa7CxfwNeu1ctQcEFbFznRpVI/PIPqSe3dmn9s=;
 b=fT2X/WHGIWN9qFvv6TLNL4L+JH4lBV6w7Hw9xzB7m7YipcGaPXAe//qgx/6I/G0ner
 VOE80Q9FSV4cV6ccz6c3xU4CX35rsHAXuGvk1PbKEFX4oW2B6tieZ28GoBWH2rxj02xY
 QYA9pta3/aKbi16nYk+a4BpINAtv6LkZbhpI1Qfh6/Us3NH4WlLpBkqKiLsHMb4bPuGc
 +vBEMAM7Nde5Js1uzfDIt222+JPm9Ro8p6CJIX5aNhcar/SxNv4XnaQFVud97yueoSTG
 EeDEtHGhJOIh63/OV5uoq2eGYPWFfVKVupvYWFX9yWKa4jGKrkRtppVhpkNzDjd1ghwj
 dgsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=enQXWXa7CxfwNeu1ctQcEFbFznRpVI/PIPqSe3dmn9s=;
 b=MsnoQMfi+q78oVPPXodjqpjFEJo6gJ6CLY5EuoLXDitsfM8qQAU9C1362gN2OY5MFq
 C0YMeoezPRSEU7KB9zshQIRokMS5p1jm6AbH0xgjYsxXwj2Xt1ilPsLw3VgtAyX7PULL
 RHXHzuQXZE/y2FV/tpUddWiVnT2myFwA/taLKgnXSzelCCtj0ujGrxViyjUJV+WDGd/M
 osVC29Q/m9Rh6XExnYwixqieJkXmfb7xpUYn3XIU1yHiSsn50UFahBpVGTECnjG7DuGz
 3rhxhhhHgvqVwlJd7B8TfFSosliTjrvw4dCbLduxTqi7g8TitRhjgzxUSsq/aMpy4ivq
 /4aA==
X-Gm-Message-State: AOAM530zt5egYQj/DJTEMjUNLe/c0PARxgiyfkLAval7jhMIcIcMSxQI
 G8nTzmkODmD5qHQHKmFe34Y=
X-Google-Smtp-Source: ABdhPJzfIHAKIWQU/LUL3hX6UDGeCUZOy/9fZTDOZx4s14uO/SyEtUjHIPep24IM1BlpBWm+N3r5ZQ==
X-Received: by 2002:a2e:b165:: with SMTP id a5mr89666ljm.269.1597363632216;
 Thu, 13 Aug 2020 17:07:12 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.gmail.com with ESMTPSA id c17sm1504450lfr.23.2020.08.13.17.07.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 17:07:11 -0700 (PDT)
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
Subject: [PATCH v5 10/36] PM / devfreq: tegra20: Silence deferred probe error
Date: Fri, 14 Aug 2020 03:05:55 +0300
Message-Id: <20200814000621.8415-11-digetx@gmail.com>
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
 drivers/devfreq/tegra20-devfreq.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/devfreq/tegra20-devfreq.c b/drivers/devfreq/tegra20-devfreq.c
index ff82bac9ee4e..6469dc69c5e0 100644
--- a/drivers/devfreq/tegra20-devfreq.c
+++ b/drivers/devfreq/tegra20-devfreq.c
@@ -141,9 +141,11 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 
 	/* EMC is a system-critical clock that is always enabled */
 	tegra->emc_clock = devm_clk_get(&pdev->dev, "emc");
-	if (IS_ERR(tegra->emc_clock)) {
-		err = PTR_ERR(tegra->emc_clock);
-		dev_err(&pdev->dev, "failed to get emc clock: %d\n", err);
+	err = PTR_ERR_OR_ZERO(tegra->emc_clock);
+	if (err) {
+		if (err != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "failed to get emc clock: %d\n",
+				err);
 		return err;
 	}
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
