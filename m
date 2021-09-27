Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED753419DBC
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 20:00:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B8E89EF7;
	Mon, 27 Sep 2021 18:00:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBEBA89F33
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 18:00:23 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 il14-20020a17090b164e00b0019c7a7c362dso437196pjb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 11:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XeK3fC1as7/l09IEKRp5nj1z/349IvKAECLEDwlj+pQ=;
 b=eeMKXoA4LwztWls+u58Kp6dhBDTL2K6aGw4lSmpWOp9Aq9feo0aOC2ysbKEjJzfccI
 wF8/owbs/fy7OeESMzFl6Hott5p4vcWR2HAELQiL3e/AW8M5bXzUtHcTRiyI2mwMH5yh
 4QRYDRIBMaMxhNxzcZghfcZ/TM05tDlxAUEeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XeK3fC1as7/l09IEKRp5nj1z/349IvKAECLEDwlj+pQ=;
 b=RlypKVqHnv5IcqOIAotLw/IYzTSc5Y3fAnzmlnXjoRxKfXImIcbvvxDG93L4dsATw9
 oxgQytF88wvcuPBx5vILgnz7OE/zuzl6NL4G3+9OWjl+2PZ6GjqqMwyTEFrcu4ANrNK1
 oxo6K6QDoiAUGzVYNNepYiMWKnATFsIW5Ab6pAiUIXTS5nNHPpmR92o4ca3/NHi3ClA8
 Vp9hxGSM4LS2QVa4FJHp5ZvaeGrPh0/slaHxgO7LOzG8g7ygnFl415nzLQzCR3TKp/Mn
 Xp9NbdwXEsen+U27OXXTzxbAPDIAb9+VAehCVRZwxePFBHTy/JopN7TNhd2cZobo7Eq1
 YbqA==
X-Gm-Message-State: AOAM530qMuQcKNxFRPvmt7DYkanM5Olx33H/nHVCmhSbXKg7vXdIrr6D
 0t/DPUrRFESB2A0td8pfYx4i3g==
X-Google-Smtp-Source: ABdhPJx99jitosZspKZ2TAmKA7Weg9Nq6qSA3epb+VhUvrhehR+ICQzgBodfoUiEwH6y9LdUTRTFkQ==
X-Received: by 2002:a17:90b:4d05:: with SMTP id
 mw5mr379107pjb.175.1632765623593; 
 Mon, 27 Sep 2021 11:00:23 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:82d7:f099:76bc:7017])
 by smtp.gmail.com with UTF8SMTPSA id q12sm19986829pgv.26.2021.09.27.11.00.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 11:00:23 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>
Cc: Thomas Hebb <tommyhebb@gmail.com>, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wenst@chromium.org>, linux-rockchip@lists.infradead.org,
 Sandy Huang <hjc@rock-chips.com>, linux-kernel@vger.kernel.org,
 Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 2/3] drm/rockchip: dsi: Fix unbalanced clock on probe error
Date: Mon, 27 Sep 2021 10:59:43 -0700
Message-Id: <20210927105928.v2.2.Ie8ceefb51ab6065a1151869b6fcda41a467d4d2c@changeid>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
In-Reply-To: <20210927175944.3381314-1-briannorris@chromium.org>
References: <20210927175944.3381314-1-briannorris@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Our probe() function never enabled this clock, so we shouldn't disable
it if we fail to probe the bridge.

Noted by inspection.

Fixes: 2d4f7bdafd70 ("drm/rockchip: dsi: migrate to use dw-mipi-dsi bridge driver")
Signed-off-by: Brian Norris <briannorris@chromium.org>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 45676b23c019..fa4080176719 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -1398,14 +1398,10 @@ static int dw_mipi_dsi_rockchip_probe(struct platform_device *pdev)
 		if (ret != -EPROBE_DEFER)
 			DRM_DEV_ERROR(dev,
 				      "Failed to probe dw_mipi_dsi: %d\n", ret);
-		goto err_clkdisable;
+		return ret;
 	}
 
 	return 0;
-
-err_clkdisable:
-	clk_disable_unprepare(dsi->pllref_clk);
-	return ret;
 }
 
 static int dw_mipi_dsi_rockchip_remove(struct platform_device *pdev)
-- 
2.33.0.685.g46640cef36-goog

