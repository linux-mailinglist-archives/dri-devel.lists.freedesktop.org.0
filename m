Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6761A1F4F02
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 09:35:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C070F6E053;
	Wed, 10 Jun 2020 07:35:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E6F76E054
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 13:14:46 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id c17so24951792lji.11
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 06:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=061hlrRfunwkyZki3oWiaKmN7ev2U21u3B6yt3cimTc=;
 b=axZSjAneUL42duObpUbjthqYAX09o70VhMiVjh8mLUewcbETS1bIjcyYywet8A7b1z
 shfyFgjs0qHecOJRZElkTka5Op0ww6i0Ro/YCmC5GwNWA37Iiw4Awd8ExzkwjMs/Ht6V
 J65nyAt9LZl3xQDeLvEs+u41oNK1R9JQkJpZEXQRCQ7rcakNP6pwk+SXDd6c/IFR/ujn
 +wk9B97Dwfr0UmQs2VuARV2mueB1bWmirTeZjxOZLJSQ2iVf6dWm5NSooVgtBNAAJiAz
 gAoPgEB24t/PNPO719An12piy22azY0O4+hgxKfbMLGC9AQazSLGQO8AANPw3W+2iNiW
 QG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=061hlrRfunwkyZki3oWiaKmN7ev2U21u3B6yt3cimTc=;
 b=c8dBBP2uG1nQwuMLHG6Z9CA4FuTGdn30Xuom2mfabD80QKhQ420HY5iCfepylPHXgP
 dLdfgQjEF3Jo/J2o8rUHbCzrhEO47onz10ob7UVOaZGaromKuCfgDLC4Q07wmcUz5o4e
 7pM51/elbCCZCh/GjNJ+TYLCmZDyEfq/TbmA2HgaEshAxedDFVhdpi58ZDViNVMB5Ykw
 h2te9SYVklnOmk/GyE4/3AvPzRGJbxKtS5f4AoxFubjg0ysFQe+7FRXR4ZRFQtHTBYk0
 U7DvcDa8Jb2iJkVA+KIZLtw6VUAfVdZNeqRAEzBZXunh2zSWv4jS5aOa14MIECV4TLqR
 P02Q==
X-Gm-Message-State: AOAM530UrVJWKwZAVlk/b9hBPdy2ZrhO93U2PH/+9ChhCXkXiOqPUnQp
 tA+cDM3uUlWqWkFSYgjjhuk=
X-Google-Smtp-Source: ABdhPJwmd7mQIA1zlol7FDcTPL+eVrsqyXZIVfZNkLkmHPGjO5Ho3fGM+DIMTGsL+TWXXlRInKK/VQ==
X-Received: by 2002:a2e:8809:: with SMTP id x9mr12288313ljh.442.1591708484744; 
 Tue, 09 Jun 2020 06:14:44 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id l22sm4323522lji.120.2020.06.09.06.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 06:14:44 -0700 (PDT)
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
Subject: [PATCH v4 16/37] PM / devfreq: tegra20: Adjust clocks conversion
 ratio and polling interval
Date: Tue,  9 Jun 2020 16:13:43 +0300
Message-Id: <20200609131404.17523-17-digetx@gmail.com>
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
