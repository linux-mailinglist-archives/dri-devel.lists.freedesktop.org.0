Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 146D732A043
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 14:15:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5FA6E10C;
	Tue,  2 Mar 2021 13:15:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A40B6E10C
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 13:15:18 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id k12so14835544ljg.9
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Mar 2021 05:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9r1DFAaPtb29HC2sU6gbzgJhxX04EpEmGmNyScrTRWg=;
 b=PESF8tDUDk6Uz0FlXB9u8W4+2b2xyjPCCVflvcPHroKxon0Hf10BTl6qKtTqsW1wbp
 BsWsgjRbjrLbixpfJSdObEfyrVG4rwxYvleDu3gsGkUHEvlrQzfuUOQCE0RBcNMpT1sE
 pW5KXYtwisbRJOvlbz75/0umbgNJ6y+AY7zFI72oNFCuC7Vl9UvchqYxtNER3hwnjg4Q
 KJDjIclGGbXTwGSNhFjmFJztX5dxyeGA1+9Rx2yrLucwnbP/BxLzndCrKMp85jrk+Qd7
 ADq1Q5qOFAcqrVX539R4Og0orJwiinDOWTT28iUsWR/25obrx+r0+sV6A/cW6p/q7dXR
 ZURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9r1DFAaPtb29HC2sU6gbzgJhxX04EpEmGmNyScrTRWg=;
 b=mpE8a/i7BESQJnU5AgJMPR6HH/gVRqq0qd8zG4N/unfD4orTZd6oh+DoQjsJKnaY6y
 lBTMHeuzMT2XeY2KqhEsBD/3KG/CrzqFhU8abbww69fWgV+N9HFEJ+QVbyyDzuQdng2M
 OqG9p0QSBZgnpvvpF0IQkrrQql6Yjxpuhmv2YfkuJA0uFnCzXLOzYlULPLIIUJVjInrQ
 E4opTjXaEq6r4EfU/WmMyo3cFcbBnflB8FYjth7M9sJYOGEQmVh7wWAPsFUi3MCuttZ4
 6PiFgvW1GNlqRx9KZotN2n1LIgw7no5jLY0mw89kzCNwZKKFtvKkBxeY76Nm1dRm84Kc
 NRWw==
X-Gm-Message-State: AOAM531mf9xpyXku6KOq7AiThfLhGPJhaGMk3nw86pWQ2sGnmgz+00Hc
 6JqlQhizBe7/94gwDYAC4pg=
X-Google-Smtp-Source: ABdhPJzRPfagcDRUtiuLO17bXWYhG7ON9ldHSkMJi2dTVgAKGwqZLgthGDdYpJKBH5gxTIZofHmu/g==
X-Received: by 2002:a2e:b008:: with SMTP id y8mr3207751ljk.233.1614690917063; 
 Tue, 02 Mar 2021 05:15:17 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id i5sm1033370ljn.100.2021.03.02.05.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 05:15:16 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, David Heidelberg <david@ixit.cz>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Subject: [PATCH v1] drm/tegra: dc: Don't set PLL clock to 0Hz
Date: Tue,  2 Mar 2021 16:15:06 +0300
Message-Id: <20210302131506.11790-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGB output doesn't allow to change parent clock rate of the display and
PCLK rate is set to 0Hz in this case. The tegra_dc_commit_state() shall
not set the display clock to 0Hz since this change propagates to the
parent clock. The DISP clock is defined as a NODIV clock by the tegra-clk
driver and all NODIV clocks use the CLK_SET_RATE_PARENT flag.

This bug stayed unnoticed because by default PLLP is used as the parent
clock for the display controller and PLLP silently skips the erroneous 0Hz
rate changes because it always has active child clocks that don't permit
rate changes. The PLLP isn't acceptable for some devices that we want to
upstream (like Samsung Galaxy Tab and ASUS TF700T) due to a display panel
clock rate requirements that can't be fulfilled by using PLLP and then the
bug pops up in this case since parent clock is set to 0Hz, killing the
display output.

Don't touch DC clock if pclk=0 in order to fix the problem.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 1399e4032701..4ecda4cdf345 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1723,6 +1723,11 @@ static void tegra_dc_commit_state(struct tegra_dc *dc,
 			dev_err(dc->dev,
 				"failed to set clock rate to %lu Hz\n",
 				state->pclk);
+
+		err = clk_set_rate(dc->clk, state->pclk);
+		if (err < 0)
+			dev_err(dc->dev, "failed to set clock %pC to %lu Hz: %d\n",
+				dc->clk, state->pclk, err);
 	}
 
 	DRM_DEBUG_KMS("rate: %lu, div: %u\n", clk_get_rate(dc->clk),
@@ -1733,11 +1738,6 @@ static void tegra_dc_commit_state(struct tegra_dc *dc,
 		value = SHIFT_CLK_DIVIDER(state->div) | PIXEL_CLK_DIVIDER_PCD1;
 		tegra_dc_writel(dc, value, DC_DISP_DISP_CLOCK_CONTROL);
 	}
-
-	err = clk_set_rate(dc->clk, state->pclk);
-	if (err < 0)
-		dev_err(dc->dev, "failed to set clock %pC to %lu Hz: %d\n",
-			dc->clk, state->pclk, err);
 }
 
 static void tegra_dc_stop(struct tegra_dc *dc)
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
