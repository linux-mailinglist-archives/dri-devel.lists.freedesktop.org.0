Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F15A5245D38
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:08:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 890F36E4DE;
	Mon, 17 Aug 2020 07:06:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D95F6EAC8
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 00:07:19 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id h8so3940991lfp.9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 17:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/fHS4JZ6NTiAMWoTmk+f2h360uLuiAqGO28JRAaIjCg=;
 b=Lqx09r7+P63CZvLzEGEDL0uOTZeO/s26FbByWHeGJ1n7nOIxKsE1UXqDfldmqaZTKH
 Gse1kFdFIIb0N09gKhG/eWwLQC5KAM/jXs12Ba+3mY5jhQYYYUJTBowkarLKzuTbxXWk
 lNaz3TEdJwyZDtHoHss7PDWWQi2fHb0AhTsUQ5qOik29Z5mSA2gK9sO2nkpimESw+kjr
 MnXfdqx49jUBIsT7mAlXTtmkI+FnXOl/u0uJ7Db5ko+5X1MgkTwxny9l2juuh82duC/6
 8pcx/n9G3afmZF30SBMB0zKAxL/asyFIHHF1RSRvNCDeJikEPXujNV5tPnPUpyZFMekJ
 vVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/fHS4JZ6NTiAMWoTmk+f2h360uLuiAqGO28JRAaIjCg=;
 b=lrCmX3pmH+GCMwCsJKM0HIILG2vFCio/kqB0Tw6aQDD5MI8yzxKzK2b1MY2iu4HQhV
 4woaEhUoQozo3FwAYbbtxQjCjaFlkPGEoRdWlYLI/b04R/i9N01A5dQVuOIReciYgf84
 kCSd7tEcRTsBkxBzzdfnAMooVzeuyEdzug5PShPwK3vphO7PrrJ/a2sES/BdE+rWjb0B
 SrnIWNRuFGxwCDIMsQk0Y55/RNQpoENQUg4no9bJ+492oDzkLuDPFRSrHtRL9b0u0ZVx
 g5gCfjsXIe50ar6R7mXc34bMHova9izQ3T+Vup7SC3qP2a1HsOlST1I9jh8ass6h1PPU
 bPaw==
X-Gm-Message-State: AOAM531H8HQnXCGSX4f+sLv6yQdZ52ss0CtHYr25Vz5gQ8pou/TAn6Lb
 DfLA8IVgRndHcUUaCelR0Co=
X-Google-Smtp-Source: ABdhPJxvOiaOjt9dqdR33UJkVITr0YjNchkctX2ILPK0T5GLwCiT4LZAsrVrwRABtUfkiA3Lcg6juw==
X-Received: by 2002:ac2:5335:: with SMTP id f21mr3268841lfh.114.1597363637850; 
 Thu, 13 Aug 2020 17:07:17 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.gmail.com with ESMTPSA id c17sm1504450lfr.23.2020.08.13.17.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 17:07:17 -0700 (PDT)
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
Subject: [PATCH v5 15/36] PM / devfreq: tegra30: Add error messages to
 tegra_devfreq_target()
Date: Fri, 14 Aug 2020 03:06:00 +0300
Message-Id: <20200814000621.8415-16-digetx@gmail.com>
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

It's useful to now when something goes wrong instead of failing silently,
so let's add error messages to tegra_devfreq_target() to prevent situation
where it fails silently.

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/tegra30-devfreq.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 6c2f56b34535..a0d6f628aaa4 100644
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
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
