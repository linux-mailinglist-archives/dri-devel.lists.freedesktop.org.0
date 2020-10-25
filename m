Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9024C2987E9
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 09:09:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60AE96E978;
	Mon, 26 Oct 2020 08:09:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B9A6E207
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 22:18:46 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id 134so6686846ljj.3
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zP8wlyQsrquUXl8RVAlWCiQmUgoZ1Odmn7sqJkdmIO4=;
 b=M3+RAmcuQgmuqGWbrQzhYMev5R7cBfQeEh8ZhJaPmZnvlCc2L8LNcmcI96FHgaooG8
 cqQfqY+faXiwP641RsFaoLRXKklHvqLaBqVAudP3wHQ0tLR53cwxQR7yuDsYqyLS7Yfg
 4uLrBNL+8ckoP+VKXICnwNTzx62mHT5JOYzFUOuK6GZn6QUX/F4mJX+eVmzHVpQHrh3Q
 CQsos3a36qo7UnhL3VvPpErYDDfbYY/fqclctOYt2icC8fGc+3C7FNpN1b9PFYUjZrRc
 DXbg2WBTb4+ueJkTUqt1GsfuuZvpiqo9dxw3Oht4PVyxcvUspfD4/EHM/ZLPRTsLw4V+
 rC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zP8wlyQsrquUXl8RVAlWCiQmUgoZ1Odmn7sqJkdmIO4=;
 b=avphZhCeB63R5whzFi3hBSjyri65GLzkXNTPHdCct6lZKK1k0l+fRF/oeNMJqIInrJ
 fX560udLB5jVu7mWJRQDmB62aXwezH9G0BrtVmtHzAxMEw3t9UNabOdiQULfcwqldQiV
 qOwvx1PtJzL5M6HvGh+zAc/uNE52L0kiCbTUsICcqH+DWwQFTdbQZqtlzH9g4td4Rkbo
 3LThnu1Ys3zZB4yFJTqC9ZEzhienfFgqUbF6Jwbdqj386Z0XM0j2HRdYowAK5jkqD9i2
 ddMNWUbrVTykHHeBlf9oyNkC6FdZsVT5Rn4tutWnnx6N8q5pvCrJFyDxZIp3TN+3NtNg
 nFVg==
X-Gm-Message-State: AOAM532xaJ1G9RcY0YxL+M/bJLsTrGiBT6O4S/xGp5w6JkhsFIAYxyQA
 KBZNF1muMF86B5CsTx1L/PI=
X-Google-Smtp-Source: ABdhPJy6sbcs2N3lwS6ML6IijCJ0oltQjJb0Jguca6wgzN/W0MEsKCoGmeLzWKNxYggf+7kIleLYrQ==
X-Received: by 2002:a05:651c:1343:: with SMTP id
 j3mr4297239ljb.336.1603664325229; 
 Sun, 25 Oct 2020 15:18:45 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.gmail.com with ESMTPSA id k13sm932423ljh.136.2020.10.25.15.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 15:18:44 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>,
 Viresh Kumar <vireshk@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v6 50/52] PM / devfreq: tegra30: Silence deferred probe error
Date: Mon, 26 Oct 2020 01:17:33 +0300
Message-Id: <20201025221735.3062-51-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201025221735.3062-1-digetx@gmail.com>
References: <20201025221735.3062-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 26 Oct 2020 08:08:06 +0000
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

Tegra EMC driver was turned into a regular kernel driver, meaning that it
could be compiled as a loadable kernel module now. Hence EMC clock isn't
guaranteed to be available and clk_get("emc") may return -EPROBE_DEFER.
Let's silence the deferred probe error.

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/tegra30-devfreq.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index f5e74c2ede85..3f732ab53573 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -801,10 +801,9 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 	}
 
 	tegra->emc_clock = devm_clk_get(&pdev->dev, "emc");
-	if (IS_ERR(tegra->emc_clock)) {
-		dev_err(&pdev->dev, "Failed to get emc clock\n");
-		return PTR_ERR(tegra->emc_clock);
-	}
+	if (IS_ERR(tegra->emc_clock))
+		return dev_err_probe(&pdev->dev, PTR_ERR(tegra->emc_clock),
+				     "Failed to get emc clock\n");
 
 	err = platform_get_irq(pdev, 0);
 	if (err < 0)
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
