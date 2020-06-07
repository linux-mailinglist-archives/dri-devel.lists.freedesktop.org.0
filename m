Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AD61F0F00
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 21:13:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6AD96E3CB;
	Sun,  7 Jun 2020 19:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 794936E394
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jun 2020 18:57:32 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id 9so8118732ljv.5
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Jun 2020 11:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=061hlrRfunwkyZki3oWiaKmN7ev2U21u3B6yt3cimTc=;
 b=OpeCLlYVr3IRPV2bWVGeZGoM/AcV5A0pdWEKydgN/1uX4UBx4HRNJyI65ktEmJN67Y
 U+upq4RGVxvRV1fPu3I4yvBa0omogL/IXYDm/kVNOeIJ9UnIrnMT/9RSfu2Qg+aP2BuS
 rL9JvCGvgrtRGYYnSQv28MPXPPFz4CIxrOl31hBUgVagyt3F59onvYlhKTeREiCBvLnG
 htgLq7n9SV+LgHR3+chUjMZVFCd+NzBJj9LYzKD21Cn60rNJzB9gItbsV+OMoFzIyr+B
 pomvyTmtSZfEqRu/1Kc2UW7k+MRV5pKHVum2Ch8QAjw68aGtVG1TMUxNb7byOwAuLf6W
 eiDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=061hlrRfunwkyZki3oWiaKmN7ev2U21u3B6yt3cimTc=;
 b=lTBLtV7mNHldNJJgi1Rq24VMS4hy/D7qoO4pHxn7sJwsNvLKsCfvHVf4UJWKCp6PRw
 gUbiJqsrkvRaxSfh7xbBway5gAixrvK0ebZkr83ggrZb1Egcx6vG3DgJoR6uVBDBy8kO
 4CVFTqfBVoNZ0TdITDDImHSVNbOvKdWH4qfhOl55Ok9ttpxKU6QQcYM5FfdeA+fiMX3R
 1PztmDsk7LIxIYnHcClZm6X9JIwcYjEDdN7oVRTTOIsbzIIG/texMO61s9XykvmkmsqJ
 N4myGBvAXvNpX/ufgRdgNPXXpXS58g0cPY8cxpxGlKtCDTcYseD/z9eQ07Eoh4BDo2iW
 dduA==
X-Gm-Message-State: AOAM530Dekpx7utjuQ57f0/TD03lmI+QkI72ZRl1c+IRej1y8C3IGB0s
 ysixrS5MTMW3b9XpS3MiHEA=
X-Google-Smtp-Source: ABdhPJz7379nhczt27dgiUBvJO9L0ly/gGz6aROzdQPsGh2iExP9kIqzL5tstRWYuiTHNaiqba385Q==
X-Received: by 2002:a2e:9987:: with SMTP id w7mr8917913lji.215.1591556250974; 
 Sun, 07 Jun 2020 11:57:30 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id e21sm3650953ljb.135.2020.06.07.11.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 11:57:30 -0700 (PDT)
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
Subject: [PATCH v3 16/39] PM / devfreq: tegra20: Adjust clocks conversion
 ratio and polling interval
Date: Sun,  7 Jun 2020 21:55:07 +0300
Message-Id: <20200607185530.18113-17-digetx@gmail.com>
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

The current conversion ratio results in a higher frequency than needed,
that is not very actual now since the Display Controller driver got
support for memory bandwidth management and hence memory frequency can
go lower now without bad consequences. Since memory freq now goes to a
lower rates, the responsiveness of interactive applications become worse
due to a quite high polling interval value that is currently set to 500ms.
Changing polling interval to 30ms results in a good responsiveness of the
system.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/tegra20-devfreq.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/devfreq/tegra20-devfreq.c b/drivers/devfreq/tegra20-devfreq.c
index 249d0dc44f6c..7cdea4ba38f7 100644
--- a/drivers/devfreq/tegra20-devfreq.c
+++ b/drivers/devfreq/tegra20-devfreq.c
@@ -79,16 +79,12 @@ static int tegra_devfreq_get_dev_status(struct device *dev,
 
 	/*
 	 * EMC_COUNT returns number of memory events, that number is lower
-	 * than the number of clocks. Conversion ratio of 1/8 results in a
-	 * bit higher bandwidth than actually needed, it is good enough for
-	 * the time being because drivers don't support requesting minimum
-	 * needed memory bandwidth yet.
-	 *
-	 * TODO: adjust the ratio value once relevant drivers will support
-	 * memory bandwidth management.
+	 * than the number of total EMC clocks over the sampling period.
+	 * The clocks number is converted to maximum possible number of
+	 * memory events using the ratio of 1/4.
 	 */
 	stat->busy_time = readl_relaxed(tegra->regs + MC_STAT_EMC_COUNT);
-	stat->total_time = readl_relaxed(tegra->regs + MC_STAT_EMC_CLOCKS) / 8;
+	stat->total_time = readl_relaxed(tegra->regs + MC_STAT_EMC_CLOCKS) / 4;
 	stat->current_frequency = clk_get_rate(tegra->emc_clock);
 
 	writel_relaxed(EMC_GATHER_CLEAR, tegra->regs + MC_STAT_CONTROL);
@@ -98,7 +94,7 @@ static int tegra_devfreq_get_dev_status(struct device *dev,
 }
 
 static struct devfreq_dev_profile tegra_devfreq_profile = {
-	.polling_ms	= 500,
+	.polling_ms	= 30,
 	.target		= tegra_devfreq_target,
 	.get_dev_status	= tegra_devfreq_get_dev_status,
 };
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
