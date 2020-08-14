Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9166A245D4F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:08:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE1D6E4E6;
	Mon, 17 Aug 2020 07:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0351C6EAC7
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 00:07:42 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id h19so8083165ljg.13
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 17:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7B2Fjpe2WofrQ7YRSrsm/9vOVUdpsuOK81+7RfPmroY=;
 b=HaM6qeJArqPXRUxsPKUHAks2qnElfoALYTWeTT9zpff+MRFIE61LHa+pfpAAY2hnVU
 6FQIXAbnNKa8nqQAvYixLwFArz2ht9xxzZIcaG8UDLqd4mvnPI5BaXL6F05MpJwrsiaH
 iiqNN8rpKet0HgKGTFWtrgWj/a77b1RLyoynmITH4k3ZGyfNhBc6kcitvZp3uFHKofdR
 NUxW0fb/4dL6bxmCWqBmfWrpMgjAV84Z/9HDi6TNI2Sg+89WgtUN4bwc6Yu+q+me2PUd
 ffmaSHrkK7qIY201GUp/uWREnjEKqRaZId3nZUT9sE9qsA+HWH6mNndqY1bKEzRiWBAB
 BbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7B2Fjpe2WofrQ7YRSrsm/9vOVUdpsuOK81+7RfPmroY=;
 b=ccuQPkpYLDqwfAiTaoFBNW++d7j8AieU6kLWYYG1NwnnWZlWYKviGJxRStfI90T+ia
 AmpW7fCFTk8mtXGMasXF3JBbJfrnm13sr/NTXrD9ppE/PrRC/Uuf2AnBER+6kF7jWD7A
 iZcGtktOJsww8xYQxatueR1JLeim+1emf/zJ5rPGCviWoB82SzRenctM+m4VXaecpn2Z
 HnlfvSsoWH94t4JX1vMD+vAigsBMHi0V0tRYG1ElXVMmaRtuxijP5yHpCyMoEm8kWYeI
 4U0a5PRxxrb0jH1Zxa3+gAqRlppP+pgG+v+NIKB2AHslnSHW0lABYF1oXfVbekvyrWMq
 QC9w==
X-Gm-Message-State: AOAM533dypRFVBS6QMhqZqwH5F6ATaGXAB2AfZasjtCD3w1qTjTzsctb
 xN6l5CBXwNNFeIT58nps5GM=
X-Google-Smtp-Source: ABdhPJwiLQtOEsyJZryW1Z/xHL/Syj4Ki1lFQT0pVOuRrIjHNd7mLGMWk53BFO0l8cNZ0e5ryYtlzA==
X-Received: by 2002:a2e:b55c:: with SMTP id a28mr98068ljn.107.1597363660402;
 Thu, 13 Aug 2020 17:07:40 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.gmail.com with ESMTPSA id c17sm1504450lfr.23.2020.08.13.17.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 17:07:39 -0700 (PDT)
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
Subject: [PATCH v5 35/36] drm/tegra: dc: Tune up high priority request
 controls for Tegra20
Date: Fri, 14 Aug 2020 03:06:20 +0300
Message-Id: <20200814000621.8415-36-digetx@gmail.com>
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
index 850fbcebefc2..4b062408467e 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1999,12 +1999,12 @@ static void tegra_crtc_atomic_enable(struct drm_crtc *crtc,
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
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
