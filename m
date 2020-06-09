Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5B21F4F0F
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 09:36:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C966E2E9;
	Wed, 10 Jun 2020 07:35:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FFCB6E2B8
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 13:14:45 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id s1so24996897ljo.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 06:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UvPgx7nfuClCEbY/9qNxk5Wqh42dXshULVk6+zlWjrI=;
 b=kmbgzZbGDUNhDeo1Alj9Av1nLUQou1tKAx3nPuQjstezuyq0GcBpfJoNKBkhFee4Wc
 eF3nGpANT2Rizt9dotGWkY18sFTED4pkbBbLj6YYM20gHWEzZmKkAuMmL1mpU6m2WdUw
 F/pMtlm/LNaFMLlkso6nJ6CdSyrVeBgf7aO6Sv2e0dfOHu0HNkPvBCvbIic0WvY3pOb0
 nO1voGw4DX2+X27RKEk3b5K/qOfjKk+gixvYeNjjUpOaIYNOCS4VSaTfrlb5Z04c+8Qs
 iUI5BedVAy7lGeX7TqeO3Oy+VTt2LrHAmA9NQYhVJDI7ZMHjnYYmgl3/ftBz4roif9p2
 2l5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UvPgx7nfuClCEbY/9qNxk5Wqh42dXshULVk6+zlWjrI=;
 b=AL81pQV3rI3fc7qJxKc58L3Pbzybixosh9AaF8Mo6QhDF5KRtqas3nRA15HPbhY746
 YRVfG8NjuZxirVni5gCEy54scCsZjQlvTZEBVDdS2VWthIUl7xP4qpjXc7WhcYrgFoGz
 sJDJB/nHxTj9gkR3waz219sNT9HTyosfibEv+ueYlGl2Ub53h5jTZcT8gQflQuSmgmMh
 fvnIDSChqy9snA9HYiAnoKuPLsLAaZAUfLKBCCnyampbpjwPp1vcmJqwyyeOlXhby0LZ
 17SqxSf8UIRPKpVcPMn5aftw55MU2yZEiSl4smKzZS5UqiijITe3Q2WvNWmGomFxLMt+
 i8fg==
X-Gm-Message-State: AOAM532T/PhA/Muy7L97FoAlUetf4dYIkbNMbe3OcjifJVWVQe798QQc
 zFj3/wdrF252NqiOic3W380=
X-Google-Smtp-Source: ABdhPJxy7827AnW00tq3e72FmHEJUOUiWbU5qfNMToZ6NGjWCxmQTn6D06j05VnrzcrxXbNW40Bsfg==
X-Received: by 2002:a2e:7011:: with SMTP id l17mr14742315ljc.424.1591708483540; 
 Tue, 09 Jun 2020 06:14:43 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id l22sm4323522lji.120.2020.06.09.06.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 06:14:43 -0700 (PDT)
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
Subject: [PATCH v4 15/37] PM / devfreq: tegra30: Add error messages to
 tegra_devfreq_target()
Date: Tue,  9 Jun 2020 16:13:42 +0300
Message-Id: <20200609131404.17523-16-digetx@gmail.com>
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

It's useful to now when something goes wrong instead of failing silently,
so let's add error messages to tegra_devfreq_target() to prevent situation
where it fails silently.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/tegra30-devfreq.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 13f93c6038ab..a03fb16c5c4c 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -641,12 +641,16 @@ static int tegra_devfreq_target(struct device *dev, unsigned long *freq,
 	dev_pm_opp_put(opp);
 
 	err = clk_set_min_rate(tegra->emc_clock, rate * KHZ);
-	if (err)
+	if (err) {
+		dev_err(dev, "Failed to set min rate: %d\n", err);
 		return err;
+	}
 
 	err = clk_set_rate(tegra->emc_clock, 0);
-	if (err)
+	if (err) {
+		dev_err(dev, "Failed to set rate: %d\n", err);
 		goto restore_min_rate;
+	}
 
 	return 0;
 
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
