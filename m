Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A431F0F10
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 21:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FC736E3F4;
	Sun,  7 Jun 2020 19:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 847E189D5F
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jun 2020 18:57:59 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id n24so17736276lji.10
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Jun 2020 11:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CY3FjRZp76KZl7tgz6s6CVjJ18LTSPB3H8v+jn0FVvg=;
 b=hVX5Ont6noNRP2P/2CCSf7FevOekRSrVKaunpciA4p+SogwZtz+xQzL4R/xkncA7Ru
 UY+985KTJr64ll+QcIVljePsWDFkFWzlYM9BK99+400sPBNdXNSXTNtVXuriMcEMPCMM
 xpQxTuY2+tL5/9FbxOcLccYaDdbw4SgEhY3NkrH6fMOHkMq2XEN/PU1VUeSOHOYbC3PA
 +aCDx3NDNIONWlAZwKkff0B8a7XiGSkKrLsT9GbSNGeZ8r/K1PPL1/gylpLS+50ClQXq
 DaPKESo7Il34FyXaqxZ7OI456IiJ0YR0w47Pnz1xECmGksALhndZA4DgfOVXAa5DIQfe
 xfsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CY3FjRZp76KZl7tgz6s6CVjJ18LTSPB3H8v+jn0FVvg=;
 b=j4j+o36d118/t6HGcwxLrzVPLOKyZgbIYS6rqEoYsgD96LubwANaKvZu1OVpwUdGPl
 IkQ3l+1avCtfMDyQRVt3urNRz6UMIAH7Z4Z10dXUbD308fYRZtswbTNX/2kpowxPbQ2D
 rNTSeAJEJD/mTav3/8Rp8mciJJ0zcX+1SBcC+cEBnRtbQDDXIHSn4VP+XkCSD/EJJc7E
 zmcwTbQGoaZJio+9Uoz+2wMuygyvvdCaAWoHXF5qCodCX3iH58Q89vItSaI5LnBjV7yE
 eywMI5ulToxuYxKQyGoCFHeG9+shKonwXdnt4WIsdsuI61q/RgPH/kXqnUpIO4diMpC/
 pTcw==
X-Gm-Message-State: AOAM531HA/7+CmwNfnQ29KEWM3qqQOEAWsbyWXrFgF/rq8CxMCnhkIJR
 5JPn0ghF7HFMSko3Vkl6fk4=
X-Google-Smtp-Source: ABdhPJw2XOdVWfb3p0+g7ckPPPPttWtk5v4VNsp8WSNUtVnAkpbl2b9c476TMJa1JB02XN/urafppQ==
X-Received: by 2002:a05:651c:545:: with SMTP id
 q5mr9790721ljp.57.1591556278032; 
 Sun, 07 Jun 2020 11:57:58 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id e21sm3650953ljb.135.2020.06.07.11.57.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 11:57:57 -0700 (PDT)
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
Subject: [PATCH v3 36/39] drm/tegra: dc: Tune up high priority request
 controls for Tegra20
Date: Sun,  7 Jun 2020 21:55:27 +0300
Message-Id: <20200607185530.18113-37-digetx@gmail.com>
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
