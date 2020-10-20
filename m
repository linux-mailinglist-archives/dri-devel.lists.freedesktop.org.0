Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB542948B3
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 09:17:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 151F76E9AB;
	Wed, 21 Oct 2020 07:16:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE3C6F440
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 17:43:04 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id k18so2933182wmj.5
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 10:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tBhINe5+YmVPHfb1/p3z/ZugBR00FYyA2WW1AgRCGAM=;
 b=WbHD959s2sqRdOZIhuLjT2Bq0V9cHBGUM6oT9iAegHQsQ+NASd6sENwppAqbr4Aoju
 nx2mJZJa/SiVwmMqJQAUM6ktcpeVWNJ2NtRR+IjvbJF0dvxDCBbvCYBD3j5lRtQGCnts
 EeC4nyMrnqSwmfzfLQuvSWY8Vo2I6I766NCOwnNT52Aq8ka8jUDgLkG8sr1xEPnNSO9x
 2QJwoYC4uhbNJFSLbBNr3FR1JY6T/tNfwoY9g5jp08J6Gjxp3bhlsu2xVxDukEL8SVhI
 c8jPjI0t01rU7NJCIYkxPF6B3R6mvCBkIQCc/ex2IUXOxCO9ihFdQrjBOs7JaNAhmFBH
 i4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tBhINe5+YmVPHfb1/p3z/ZugBR00FYyA2WW1AgRCGAM=;
 b=rIWbPr77gTD+6qdixmbpTMwftC4B+4dcOP+7puLKZI9dz+1LTVthb+8BBxSES5xQK5
 bXvJXfaELanDAqB5LC/AnKNBVdeDGz5oOQr/DMy5HddDIUprN+iyo63neSkbt+IKdQhI
 hYBWLVm8eigL7TTrWIAKZ/U40l+mgh05u8nhpTfo54TiXmyqZmsgbrocQUc/RRU/pxv1
 Iyfddz8O3f9Lq1j9slA26DvCTu1GCORhV6qX9sWzH8B1tOfvez4oqmsyxjw5b9TVJbA7
 i/s5xqDMq2ujR0ze8AdKlgOhXbobqhhvxyqLSwU0CotjhwSMZinDAuHfVRio5cmgOzs7
 fuaQ==
X-Gm-Message-State: AOAM530llBjKI8LQGGJI9jm0lD/orY3yJYX9nrYn7uC2x7QuqWbbQOPd
 /ZUzqFiLYtN+yz4H/lV8wgFDfQ==
X-Google-Smtp-Source: ABdhPJzYZnrg/xFUR1Exo3D3a8p65ayChvkyZu0pYYwQ4gWPnT+Pl6BY9opLW0tRMMKBzlTaAg9jxw==
X-Received: by 2002:a05:600c:4107:: with SMTP id
 j7mr3965065wmi.44.1603215783589; 
 Tue, 20 Oct 2020 10:43:03 -0700 (PDT)
Received: from localhost.localdomain (199.170.185.81.rev.sfr.net.
 [81.185.170.199])
 by smtp.gmail.com with ESMTPSA id v123sm3297756wme.7.2020.10.20.10.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 10:43:03 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 4/8] drm/mediatek: dsi: add pdata variable to start clk in HS
 mode
Date: Tue, 20 Oct 2020 19:42:49 +0200
Message-Id: <20201020174253.3757771-5-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201020174253.3757771-1-fparent@baylibre.com>
References: <20201020174253.3757771-1-fparent@baylibre.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 21 Oct 2020 07:16:42 +0000
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie,
 Fabien Parent <fparent@baylibre.com>, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On MT8167, DSI seems to work fine only if we start the clk in HS mode.
If we don't start the clk in HS but try to switch later to HS, the
display does not work.

This commit adds a platform data variable to be used to start the
DSI clk in HS mode at power on.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 4a188a942c38..461643c05689 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -175,6 +175,7 @@ struct mtk_dsi_driver_data {
 	const u32 reg_cmdq_off;
 	bool has_shadow_ctl;
 	bool has_size_ctl;
+	bool use_hs_on_power_on;
 };
 
 struct mtk_dsi {
@@ -671,7 +672,7 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 
 	mtk_dsi_clk_ulp_mode_leave(dsi);
 	mtk_dsi_lane0_ulp_mode_leave(dsi);
-	mtk_dsi_clk_hs_mode(dsi, 0);
+	mtk_dsi_clk_hs_mode(dsi, !!dsi->driver_data->use_hs_on_power_on);
 
 	return 0;
 err_disable_engine_clk:
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
