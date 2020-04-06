Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B7019F0F1
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 09:40:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 148AD6E2C0;
	Mon,  6 Apr 2020 07:40:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F378189E9E
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 05:12:00 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id fr8so832443pjb.1
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Apr 2020 22:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E6G7y8QFHpxPoNxMI7C/eKVE0aY7FMH8n0m08py+N9o=;
 b=dcDygH+3H7RfJ8k3R9ugCj5Hu0PXxS2To/zA0WK7GU/A/MQo9xuqp2ojj5PJIpWcUa
 wtz5YOxKZA3vTWb7f4arNcS8lhf6CjzI2pDNTSmxr+VZFdX15TsG3B2NoSixDhezYpxo
 eWnEEkkOmHM9HB/RD/iD01J7tktIBu4CBba5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E6G7y8QFHpxPoNxMI7C/eKVE0aY7FMH8n0m08py+N9o=;
 b=J3AcY0J/hltjvRC2mvoSli6bu4rfa2aUTIPxdVutIJUtGVHGaTFNftQeS5p8ML8yAc
 1D773TyILfJSPHIKmC1JcDNoWb9Qim9zZ8j/lRq4UjouHQcHDk6FKqsui2pEFkV6xa+J
 wSbPyj+ew6NhA8nAFZP6tzB4M1db4SFRjTsjP4D/ZUdknuAqKtTXmx+ySTvygBYW1QfY
 ETS+0tjk2jWogT97QI68vVorWkHBEOgoiAtXV6N5cnZFkV79KVyI9ZsL4tga1tNjsyKk
 81r/wNm/7hfQV9rK5z+FwYrnJQUkQR4OOtJQZWZbrY5PIKp5K0dzLyb3zQHz636WmcYL
 ojNg==
X-Gm-Message-State: AGi0PuY2ZTXvfxwHBKs14oj5mZxzEYs09UrHVjB2nF35Rfwez4LLVS2r
 GWJN4wirbAJhB0NDlrfQDNutYQ==
X-Google-Smtp-Source: APiQypIIXfPCYmCJ6Az4vd/oeMZuklz0Lp206sJXppbut8+ldlWVk5HoXoCqx3VSKUh3QlHRXs0OSQ==
X-Received: by 2002:a17:902:9f8e:: with SMTP id
 g14mr18309768plq.289.1586149920348; 
 Sun, 05 Apr 2020 22:12:00 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id r63sm10727776pfr.42.2020.04.05.22.11.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Apr 2020 22:11:59 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH] drm: mediatek: fix device passed to cmdq
Date: Mon,  6 Apr 2020 13:11:32 +0800
Message-Id: <20200406051131.225748-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.26.0.292.g33ef6b2f38-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 Apr 2020 07:40:20 +0000
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
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm device is now probed from mmsys. We need to use mmsys device to get gce
nodes. Fix following errors:

[    0.740068] mediatek-drm mediatek-drm.1.auto: error -2 can't parse gce-client-reg property (0)
[    0.748721] mediatek-drm mediatek-drm.1.auto: error -2 can't parse gce-client-reg property (0)
...
[    2.659645] mediatek-drm mediatek-drm.1.auto: failed to request channel
[    2.666270] mediatek-drm mediatek-drm.1.auto: failed to request channel

Fixes: 1d367541aded ("soc / drm: mediatek: Fix mediatek-drm device probing")
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 6 ++++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 615a54e60fe2..8621f0289399 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -822,14 +822,16 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	mtk_crtc->cmdq_client =
-			cmdq_mbox_create(dev, drm_crtc_index(&mtk_crtc->base),
+			cmdq_mbox_create(mtk_crtc->mmsys_dev,
+					 drm_crtc_index(&mtk_crtc->base),
 					 2000);
 	if (IS_ERR(mtk_crtc->cmdq_client)) {
 		dev_dbg(dev, "mtk_crtc %d failed to create mailbox client, writing register by CPU now\n",
 			drm_crtc_index(&mtk_crtc->base));
 		mtk_crtc->cmdq_client = NULL;
 	}
-	ret = of_property_read_u32_index(dev->of_node, "mediatek,gce-events",
+	ret = of_property_read_u32_index(mtk_crtc->mmsys_dev->of_node,
+					 "mediatek,gce-events",
 					 drm_crtc_index(&mtk_crtc->base),
 					 &mtk_crtc->cmdq_event);
 	if (ret)
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index e2bb0d19ef99..dc78e86bccc0 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -517,7 +517,8 @@ static int mtk_drm_probe(struct platform_device *pdev)
 				goto err_node;
 			}
 
-			ret = mtk_ddp_comp_init(dev, node, comp, comp_id, NULL);
+			ret = mtk_ddp_comp_init(dev->parent, node, comp,
+						comp_id, NULL);
 			if (ret) {
 				of_node_put(node);
 				goto err_node;
-- 
2.26.0.292.g33ef6b2f38-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
