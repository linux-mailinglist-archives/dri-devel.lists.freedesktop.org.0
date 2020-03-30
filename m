Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AC1197551
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:14:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 413836E081;
	Mon, 30 Mar 2020 07:13:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B96D989F41
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 01:09:55 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id k21so16333318ljh.2
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 18:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=stlNTWc9aUdJpsj0CRgkxaVzFvCy4PtSWcEihJg934I=;
 b=GmV6d+mK8slNNEw6qzIvmLHNGh+x/WLd+YD7Hh9dEx+Uu8C+gPQTkll8G4/5FnuBB1
 68o56wo7QLyaEo/25iN8MEb/UH7dEmIrID/nxhAX1fNh3xMFGXSqv638b11xdqGPePCL
 0GrrQqS4zely6Zu+cCsBAb02zIifUAvduno4Ebk/3o2E0CeTce2kpCG6zTkzDqWBNzLZ
 hGYFCPgfJMP1K+n9Iac34mAr0wKHbVbKMdGvfUoZTa/FxCxBrhKvNq4s96Ycm5K92udv
 wLq5Y4kIe/Hh309g/9VVGDubPvFEbst++6UqovUJwnjJjOYXn1b6t6pJUjsMHzqQ3sFh
 MzWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=stlNTWc9aUdJpsj0CRgkxaVzFvCy4PtSWcEihJg934I=;
 b=JMreEegc95m8m4n+bO86aZU+MD/KHs3ODIBLbUr7qP//LC8ZLck/9EpuTGlYu710bP
 YaM8GmGw5IrMNw5ymwfy0nKo0qTlWVAa/hnPSUaq6A1a2IRiYdg4GctPVX+SgHOMYt5G
 Zoiw2TRPWjbLRvXNdErYB2x2w/GXxtU0NQkftRByg9n+ucfVSkOImNp3Q8ruAAAxuiQD
 A/d2dUnzoBg215Cf0VvSjaLX5osThtttdOuepsPyPKJ9inCuoYvgeiJzwF2cuj7qVF5r
 8BWMLMSUBWRXMIAShspnlcY8B+6UpsO3VsiLi0TQw2AlLs5GTBWhZAzHxKQ3W3EGAoft
 /QHA==
X-Gm-Message-State: AGi0PuZTLR2FDFrSwbfGocEgh7gYvmlnXKFftX/BShy6E0rqi3EEN9e1
 HrCnP6In0cwpeC3ZrwD9mCA=
X-Google-Smtp-Source: APiQypKsysMvdXjN0pdMwS7t/sXNKen7udhhcltvbAzFnJQTm+jBxHPcXJ1OcZOvorh0PVEvp3TerQ==
X-Received: by 2002:a2e:9acd:: with SMTP id p13mr5425374ljj.131.1585530594184; 
 Sun, 29 Mar 2020 18:09:54 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.gmail.com with ESMTPSA id f23sm2449005lja.60.2020.03.29.18.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2020 18:09:53 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 19/22] drm/tegra: dc: Tune up high priority request
 controls for Tegra20
Date: Mon, 30 Mar 2020 04:09:01 +0300
Message-Id: <20200330010904.27643-20-digetx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200330010904.27643-1-digetx@gmail.com>
References: <20200330010904.27643-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:11:44 +0000
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

Tegra20 has a high-priority-request control that allows to configure
when display's memory client should perform read requests with a higher
priority (Tegra30+ uses other means like Latency Allowance).

This patch changes the controls configuration in order to get a more
aggressive memory prefetching, which allows to reliably avoid FIFO
underflow when running on a lower memory frequency. This allow us
safely drop the memory bandwidth requirement by about two times in a
most popular use-cases (only one display active, video overlay inactive,
no scaling is done).

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index b540ac6ffdc4..564af302a965 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1980,12 +1980,12 @@ static void tegra_crtc_atomic_enable(struct drm_crtc *crtc,
 		tegra_dc_writel(dc, value, DC_CMD_INT_POLARITY);
 
 		/* initialize timer */
-		value = CURSOR_THRESHOLD(0) | WINDOW_A_THRESHOLD(0x20) |
-			WINDOW_B_THRESHOLD(0x20) | WINDOW_C_THRESHOLD(0x20);
+		value = CURSOR_THRESHOLD(0) | WINDOW_A_THRESHOLD(0x70) |
+			WINDOW_B_THRESHOLD(0x30) | WINDOW_C_THRESHOLD(0x70);
 		tegra_dc_writel(dc, value, DC_DISP_DISP_MEM_HIGH_PRIORITY);
 
-		value = CURSOR_THRESHOLD(0) | WINDOW_A_THRESHOLD(1) |
-			WINDOW_B_THRESHOLD(1) | WINDOW_C_THRESHOLD(1);
+		value = CURSOR_THRESHOLD(0) | WINDOW_A_THRESHOLD(0) |
+			WINDOW_B_THRESHOLD(0) | WINDOW_C_THRESHOLD(0);
 		tegra_dc_writel(dc, value, DC_DISP_DISP_MEM_HIGH_PRIORITY_TIMER);
 
 		value = VBLANK_INT | WIN_A_UF_INT | WIN_B_UF_INT | WIN_C_UF_INT |
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
