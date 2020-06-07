Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A761F0F27
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 21:14:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29DDC6E42B;
	Sun,  7 Jun 2020 19:13:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B6366E395
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jun 2020 18:57:24 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id n24so17735216lji.10
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Jun 2020 11:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AOO2W4vvP/igevCu4IH6JEPHANPVq7vKrjpVvFg7+eU=;
 b=dRtC+StqRuLCpCgHfPYwlofqS68lJG79Brz1SZw7VYMfL8IsVxpCaJFAkWxV8XNqf2
 MPaI2Jbrx83MX40jZU+0KfrNwEpEEohcZWmAPmxNXnnhvsOfjaqJsr7xvyovlbe2akvi
 Y9gDGYBhxZ8Q66atM3UeToZn3Dl1BStCgHZaFihaHAxdXvVGHW3vAs/1xQNB1UJom3Rq
 jef6QYkisaogv0RqywxdSr2uM4zIIUZ+5wyvYdRxDHdHWZVOPdbYM5urPZ+V60RoIoJ/
 W/cKBeEvHGXIaHei1TZzk6FsvNUT+K4KdSscJLl9GBN4XnnnU9ZcsjtiGJTIyHWI2C1u
 hAkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AOO2W4vvP/igevCu4IH6JEPHANPVq7vKrjpVvFg7+eU=;
 b=l4w1p1+8KO2UxsLUJSqB4I3UtruQn0HItRufTGfwHVi+O9fVzfFJMJ1z5G3DvaLIfG
 mqMVp+zeeTzT2+L9nIYj7P+PP4RcAXfdLHjkoJ0WTF3bIRo+9jgpzuiHNHNMDGCfNv1o
 qxwvNIN0Z2sqogwfvx6+GwpS1meaxd6q2lswlMgqV1n3XVmORTmwxfcigKEfi8s1KJtP
 4Kcf8Vn+9SYZIHec70ub+IdrJMOMx6o7aJ04fEG++O/l2ELwdodTb9yIqRztMkrenEN+
 KxAvHCuWivvTdVavOhjPtwDyIxgms4sFgoTANLv7rAl6WEMu22SXtZJc6UU7IoqrkbR9
 Rl+Q==
X-Gm-Message-State: AOAM533TvYh8+aZbEx+3D1phgJUxrTyzP7dtnxu2+2tNiDKbpmbxlGzz
 CVWFZqxm9QHXlLLwUcrOLaIIpXwd
X-Google-Smtp-Source: ABdhPJzxLPXZteuNlyWl8auR9iNrq1tcOwGy23AKnpGEA2ohuyWWWo2bNz4jA8TTZz83t8FlbmeSvg==
X-Received: by 2002:a05:651c:545:: with SMTP id
 q5mr9789863ljp.57.1591556242946; 
 Sun, 07 Jun 2020 11:57:22 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id e21sm3650953ljb.135.2020.06.07.11.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 11:57:22 -0700 (PDT)
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
Subject: [PATCH v3 10/39] PM / devfreq: tegra20: Silence deferred probe error
Date: Sun,  7 Jun 2020 21:55:01 +0300
Message-Id: <20200607185530.18113-11-digetx@gmail.com>
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
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
