Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E10CA866BB5
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 09:07:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF8E10EF2A;
	Mon, 26 Feb 2024 08:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="lhOwTHT+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F4810EF2C
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 08:07:29 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1dc49b00bdbso23018775ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 00:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1708934849; x=1709539649;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kBcIHteoHnr9Cz5N/WAN5bt6cpSYHYQ7aU0W3fZEze8=;
 b=lhOwTHT+NrzPyaxOFF5GY6Nyy1/QUc1ViSTV81np1HGp5Y27hLX6wwZu8KL144X3EA
 Ytk4lQ+dYxunGtmBTHLcVEvdktUifhrNh6t4gle8wrt9XE8hGrj2X08O7cmWyQ4Mdedc
 7HI0TlrrQRCWNutnBtcSCrd/Z3L/0jGV7FZn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708934849; x=1709539649;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kBcIHteoHnr9Cz5N/WAN5bt6cpSYHYQ7aU0W3fZEze8=;
 b=IzzJVC3X/rCP7Rx6OmSfpRzo7Niu8OPlcL7jKfNtM+Xr6HfqR1P4xTLGgdL8VJEQBS
 zMqi7Sh7I4Jj0BFC1VyeLmweUiRgBClAADn3rumEyVJ7Z5sD2F8KslCNTND4O6fsoSTm
 HcvsA9SFiu+qbKn5SusiIaUJHCrBnTZL/eO1KN1gDr7o3Bj/KlB8gsrccLL2Ui6mWWoI
 FHkeStAsSiO0rJjpCNshqyA8EQQnQ6DuE7Y7Yv3HgW2wyceHic9Gxyf5knxjdo4Xbd5t
 UiNy1tytz40ALcEZh/NPCSrO89ws35PgBIwU0MQhPN4rvF76MliV/SfbgF0u44HhBumO
 L01w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtLFXdCN00CVCt4aSrHX1VV9axukNDjTi0O7x9kTckVhii/n8UNAkca6SOmYEreKoBuHRnG1fAQ2dtf6GyN/7x+v+UqhbOCIpw+5Nw6Y+o
X-Gm-Message-State: AOJu0YyMbwAvKjk/NxYjIFXAjOAcyHBDxXyBAdRkfcw+RUajbjZ99H+s
 PpIE12bADPZU20Tjo6TxW/be69f+O6McXWW+YQl7kCn5L6SQklBxLNhTehcBFtNFce94Ku8pW5w
 =
X-Google-Smtp-Source: AGHT+IExiQnb+rRMNDHWEdTGrSJHafd60Czmd6wFeh8GaiNgF/iSjktfRAWY7nO1Q8GFmSikhhho1g==
X-Received: by 2002:a17:903:548:b0:1db:bd6b:d1fb with SMTP id
 jo8-20020a170903054800b001dbbd6bd1fbmr5145701plb.63.1708934849429; 
 Mon, 26 Feb 2024 00:07:29 -0800 (PST)
Received: from fshao-p620.tpe.corp.google.com
 ([2401:fa00:1:10:e3f5:67aa:a8f3:8179])
 by smtp.gmail.com with ESMTPSA id
 le6-20020a170902fb0600b001dc95cded74sm1953660plb.233.2024.02.26.00.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 00:07:29 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Fei Shao <fshao@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH] drm/mediatek: Support MT8195 OVL compatible in mtk_drm_drv
Date: Mon, 26 Feb 2024 16:06:47 +0800
Message-ID: <20240226080721.3331649-1-fshao@chromium.org>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
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

Specify the component type for mediatek,mt8195-disp-ovl in the MediaTek
DRM driver on top of commit 76cdcb87d391 ("drm/mediatek: Add MT8195 ovl
driver support").

With this, the compatible can function as an independent fallback for
other display overlays without relying on MT8192.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 14a1e0157cc4..703caba48420 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -739,6 +739,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_OVL },
 	{ .compatible = "mediatek,mt8192-disp-ovl",
 	  .data = (void *)MTK_DISP_OVL },
+	{ .compatible = "mediatek,mt8195-disp-ovl",
+	  .data = (void *)MTK_DISP_OVL },
 	{ .compatible = "mediatek,mt8183-disp-ovl-2l",
 	  .data = (void *)MTK_DISP_OVL_2L },
 	{ .compatible = "mediatek,mt8192-disp-ovl-2l",
-- 
2.44.0.rc0.258.g7320e95886-goog

