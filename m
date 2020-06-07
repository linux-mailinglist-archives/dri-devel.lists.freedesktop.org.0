Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 674041F0EF4
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 21:13:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D3586E3B2;
	Sun,  7 Jun 2020 19:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335766E393
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jun 2020 18:57:31 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id i27so6813909ljb.12
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Jun 2020 11:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UvPgx7nfuClCEbY/9qNxk5Wqh42dXshULVk6+zlWjrI=;
 b=Txv9TK5zoOMhF7vXS6mMGopAvQ+wLC0R/0y093Xav9/7fflf+t5MEXh1lX87cGtY7t
 EcIm+ueYddyomNsmyAYXjNonsld6ay8KVREB8rcJeZx+/W8YmwEudUGkYcyXR41nj0VB
 GKutkpURwr+mUIjkAOti8e8J+81e6jRcSJVlC4i3BZfaAXHj7072WB42o6YublbDu09+
 8zStnINDe3Y+8D1SQeF1Ib02vyjoXXPwjloqf2s9xU/R4zrPFzanc1gRCebkc0N6QhLo
 djzCJxqaKgHmuRQjAR2joQM5a6TMR1drYGm57cvhYNb5TK7i4EWU9ITCknEgTpCJvQrt
 xe9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UvPgx7nfuClCEbY/9qNxk5Wqh42dXshULVk6+zlWjrI=;
 b=s1XmAr+iAKguMijQxTlf0woVJxm/UE2pZ2K0ZUU8F5LyrG/0iXZ3teBB36nRpsJwUH
 xPa3qtFWF9YRGFzW5WZSQ5r3Fcz9JzCY/kRiZvD9Zu9wtLYNbDjylRp0BJhz/NbqUXGa
 LiBXLu3NW69n3pWlE9wNXEc4vOW/LxZmEiG/MaE5TfUbVhbo295pxZrkAghcs9EzyrX1
 2pq4XUAVnqx28WQpr+RJwRDK97OkhH8+R6lwHMFGC70AqYz9CAr3DhsdgaznE8Ro/3Tq
 Z19Ebv7uzeWALkM13ae9UMCuJWKpQJ32U3zA9z3QZXgy3TNAtiwoREdsqkX7oCEXeI12
 YH0w==
X-Gm-Message-State: AOAM533g+PYHbZ+Fvm7d7QSfq4aPezF8oQ4x4M35emqg57XJnvbsE6n3
 yAta78Nm6NdEpv3o0mYymT5BEJwF
X-Google-Smtp-Source: ABdhPJzToqPSxd3YO6VNTABt1RtCoxHsyBrguxlEv9L7QuotPpVI46VP9V3JtmxqUgxI2eV/+FvM2w==
X-Received: by 2002:a2e:9804:: with SMTP id a4mr10029549ljj.369.1591556249647; 
 Sun, 07 Jun 2020 11:57:29 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id e21sm3650953ljb.135.2020.06.07.11.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 11:57:29 -0700 (PDT)
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
Subject: [PATCH v3 15/39] PM / devfreq: tegra30: Add error messages to
 tegra_devfreq_target()
Date: Sun,  7 Jun 2020 21:55:06 +0300
Message-Id: <20200607185530.18113-16-digetx@gmail.com>
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
