Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 136251F4F0D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 09:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E5F6E2DA;
	Wed, 10 Jun 2020 07:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5346E2C0
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 13:15:10 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id x18so8497916lji.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 06:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CY3FjRZp76KZl7tgz6s6CVjJ18LTSPB3H8v+jn0FVvg=;
 b=lth0L5t9emj9h7WIYX4C+MyILmvEn5rTTR1t5uicbsTDyqJHzlKcyWeEs+jHZVNJzj
 l70X/+iii3orOOm+/qRAbf04E/8ratqT+pkIkxA4gUIn0cKy2gvZ/6Jx8SngR5UiS9Mp
 aee+TaQwprhii8V5NQiFuidrF9Zz6k/1nClU2RMmumlId5X9OxKiuiMyLIgP7UMG/7TQ
 cQtqtFqoALbccdsQwu9AZRcW7C9cuMOYqICxIjiLtqDdSA5iz73Liq8bbE5qkvPZo8Mm
 RJsp8K8MmTxkaaf+IBPlzLtUNR/V398oOAZrjD5/9Kv6RwhW+iX7FLwLHU02t7HbOZE5
 oMEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CY3FjRZp76KZl7tgz6s6CVjJ18LTSPB3H8v+jn0FVvg=;
 b=PiV6NuO7r/5vEN8E0c9xx8c+WTefmyaf0z5Xvi9CUvZmDRfxaTyTUBq7X1knP7tz3Q
 Q/TxPk1cfuqcyduMBnnOC3zAqEw4cDeNkez5WXpBaZFn80AruKbVhAsNpKLbYfe2tCdS
 5hIpO14536BT1mpgUL8furcNF9ikOQm5nnWFPxsmrBXgqbDQgSzME9JSjhVZoLm4LPSF
 7irqbxwBjHhuIkVtvpWe2MSv61XGzzhRDvydiBB0nRp4HGZ1B4Ga/w2eNeVSxI7ev+ah
 1IOTvY+xaeDhoiJsYh0mop6AeGDoOHU9UtI6XkU/xzqFyjHmDXivCF//dFs354c5iZzL
 t1ng==
X-Gm-Message-State: AOAM531ZncDFqDBMocg8x1clyhBaTVhuO8XIFr5omFNX2EIjrtzcdD9D
 Nmxw7HCb2fx7cHU2y0N7IXA=
X-Google-Smtp-Source: ABdhPJxMnBTcJsjI4SwfSsZ6hCPM8ucyzc3NT3JIFYxZrzE9tWkzhkObz7tEzvH9QZyudwmh4j7wHQ==
X-Received: by 2002:a2e:9f57:: with SMTP id v23mr11786526ljk.324.1591708509218; 
 Tue, 09 Jun 2020 06:15:09 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id l22sm4323522lji.120.2020.06.09.06.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 06:15:08 -0700 (PDT)
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
Subject: [PATCH v4 36/37] drm/tegra: dc: Tune up high priority request
 controls for Tegra20
Date: Tue,  9 Jun 2020 16:14:03 +0300
Message-Id: <20200609131404.17523-37-digetx@gmail.com>
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
index 12b318bb8475..48dad375b470 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1971,12 +1971,12 @@ static void tegra_crtc_atomic_enable(struct drm_crtc *crtc,
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
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
