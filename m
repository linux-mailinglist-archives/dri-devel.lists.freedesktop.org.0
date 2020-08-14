Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C6C245D2B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:07:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9916C6E4E3;
	Mon, 17 Aug 2020 07:06:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 978146EAC6
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 00:07:20 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id t23so8128393ljc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 17:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wfJYL8aXUf9lRrXprT0mqkyze705HA4O8j1DWQetbEI=;
 b=my3A4tKVBigkrRYLF1Krc4GOtlJzt0P2g/74fhD9KzbIrJF9Rg1/HqU0XunxgkRVXJ
 0FdyKYeH4eUOR4RPJYf3FiJcF7epo3GUGlRNEqvrbmMe9iqUMSIxNckhigAteTzaLd1I
 2Io7dwqd0cJI7yaz59glwIEHCaM8CGHDJPsjz0usOWF8ybTnxeYx5kBM6dE6Nyj6REzd
 J76Z6dFcRURlrNDn0wL97VmnHxgv+HGrJBgBlZE58Ok6kj2NH3svnBCl50rsFBI/pVvk
 TbPF//ryb3sRYuAXPlKp7Lm7zEEOAnpyzWsv0v8SutNb2hj0pcW6hm4PDcCC+HOJ5RP0
 6JIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wfJYL8aXUf9lRrXprT0mqkyze705HA4O8j1DWQetbEI=;
 b=Mhe7cSkQprnFSsLILtcqq6GtYOHkxc+TUzyUNxsPS7THpheKj9IdW9Gwm7TOClFI7a
 Gq7ha3/5IT5rZIxcPzOt0VWuPpIa/04EKNCse/8w7z9728qWpvZf5/0fhLstHVnVdP0F
 Z/HPi5HMwjmTqCOQRxwV1EOlxt/dVJlm0YL4WeS6Sthz4ZYXokbGYjp0fZWnK+lmSgSc
 SSZIyzerBmpaHRSEZDI41SCuK/ETyZu0c3OCnlOqoBT38T9dlXQzExjgz8HYF28ZuiEy
 vNv319ILLNMH3JXm4qdTjV0GaD1CCkPnGL25g5WAXotBPH9XP7RoqNKJZA5Xx1rzojv+
 j+aQ==
X-Gm-Message-State: AOAM530tiSxj43dSRk429FPS3K9N8ZmJoGtU1+nygfWjuzI1sBEOr6tc
 C4KhvBqeG0Y8XB2vWNWbNeI=
X-Google-Smtp-Source: ABdhPJxBvuBmhhAkFkBbI6TMp1X9JwSDrFst/K/Lm16UeyfuogFsx1dcqkjUA2IrQ44jEvFcr159wA==
X-Received: by 2002:a2e:a556:: with SMTP id e22mr88364ljn.317.1597363639026;
 Thu, 13 Aug 2020 17:07:19 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.gmail.com with ESMTPSA id c17sm1504450lfr.23.2020.08.13.17.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 17:07:18 -0700 (PDT)
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
Subject: [PATCH v5 16/36] PM / devfreq: tegra20: Adjust clocks conversion
 ratio and polling interval
Date: Fri, 14 Aug 2020 03:06:01 +0300
Message-Id: <20200814000621.8415-17-digetx@gmail.com>
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

The current conversion ratio results in a higher frequency than needed,
that is not very actual now since the Display Controller driver got
support for memory bandwidth management and hence memory frequency can
go lower now without bad consequences. Since memory freq now goes to a
lower rates, the responsiveness of interactive applications become worse
due to a quite high polling interval value that is currently set to 500ms.
Changing polling interval to 30ms results in a good responsiveness of the
system.

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/tegra20-devfreq.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/devfreq/tegra20-devfreq.c b/drivers/devfreq/tegra20-devfreq.c
index bc43284996de..ebfc5ac9e5c3 100644
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
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
