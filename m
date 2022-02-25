Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D634C3C6B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 04:28:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7FE310E893;
	Fri, 25 Feb 2022 03:28:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0654D10E88F
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 03:28:00 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id t14so547847pgr.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 19:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lZMKM13WOXr0Cj+JFI693E2RT8tiGsgNHY8tIWC/7wA=;
 b=NlEBER48+BAv+pYpPTx0rfeKZ1GwncJgF+xLdGTwRe3mDhFs5KsTN6WYQcXYUt6VPG
 wuhKmKVgs7OG3yHA6LjqWJRNXaplIMBeQWsy/oPEeF4+zBTqs9sltsPPY9QPCKZOXXON
 661cGzrUtj/uEV0VytoAeEu/9v/3lQcw4b/jo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lZMKM13WOXr0Cj+JFI693E2RT8tiGsgNHY8tIWC/7wA=;
 b=c1A5RZAHvC/ZM8qpFYqNxijpovBYOILti3QOkwNdE7ZuEREGVmjvXCxFaCz7g82hxe
 yB2SSszSQ271MZM/h8C8SOuhqcMzHeviaOG0c6zD6lp3df6T6H3fuNKx259ZckWAKYVt
 ifkGl3ga4a5MgUtcYDkDbvKB3s/F3hsgRO74St8aMgxXhP30eseSJ7/qWFR0X+BxL7C6
 ffaJRfxSibtzJG+0R5ltDkrVQ1wvoYRjIb/BBB58LSIq6gBHGrafJ7GCOYnXqrjSnqoq
 0V2VBFwuwJwhTlOFk64hUPgdtVGQiiBmIDcVv/VHTssVBVRuWm8TNA47TFkCrfTT4qiU
 JbEQ==
X-Gm-Message-State: AOAM531Gicjwgqyud7OGCBPjmSzf5L/P17BDfW+0wvPbyo+RCdQZUC6m
 OKPYZlMNBTvL7fuMnYOezONOig==
X-Google-Smtp-Source: ABdhPJx+kHFiPrkhdZm5XLElk/g3benE49UUovXBtXArAuVbE2sKuAaWSgZHosRUd7JHRRrHV4UmWw==
X-Received: by 2002:a65:6c0d:0:b0:364:ae2e:9708 with SMTP id
 y13-20020a656c0d000000b00364ae2e9708mr4611904pgu.189.1645759679598; 
 Thu, 24 Feb 2022 19:27:59 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:d786:892f:a6fa:6f0c])
 by smtp.gmail.com with ESMTPSA id
 q5-20020a056a00150500b004be09fd6ad6sm905097pfu.191.2022.02.24.19.27.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 19:27:59 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] drm/mediatek: Fix DPI component detection for MT8192
Date: Fri, 25 Feb 2022 11:27:54 +0800
Message-Id: <20220225032754.140168-1-wenst@chromium.org>
X-Mailer: git-send-email 2.35.1.574.g5d30c73bfb-goog
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
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wenst@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When support for MT8192 was added, the DPI device was not added to the
list of components to look for. This causes the secondary display
pipeline to not be able to fully bind, and the DRM driver subsequently
defers probing.

Add the DPI device compatible to list of DPI components to fix this.

Fixes: 01365f549c88 ("drm/mediatek: Add support for Mediatek SoC MT8192")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index b147797177c6..47ba18cbc5c8 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -511,6 +511,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DPI },
 	{ .compatible = "mediatek,mt8183-dpi",
 	  .data = (void *)MTK_DPI },
+	{ .compatible = "mediatek,mt8192-dpi",
+	  .data = (void *)MTK_DPI },
 	{ .compatible = "mediatek,mt2701-dsi",
 	  .data = (void *)MTK_DSI },
 	{ .compatible = "mediatek,mt8173-dsi",
-- 
2.35.1.574.g5d30c73bfb-goog

