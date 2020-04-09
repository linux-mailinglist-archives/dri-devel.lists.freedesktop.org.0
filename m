Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C601A3037
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 09:34:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B16E16EB8F;
	Thu,  9 Apr 2020 07:33:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73AE56EB47
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 06:02:14 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id c23so4496986pgj.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 23:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LIZVAq7xeySwQmWqTMtWLzT3ZnpjRce1QK8YJF3B6lA=;
 b=L1WRbXtfVXrT3HXPWD00KG1nxuFSYrWBgXFk4bRo9iE2SQC73JN4rDwGcVRRLRd76w
 5840611TdDz7Jp7c8mLSuUuEAaUCM2OD6SGmXB8Blb4eyN/OXSWfgn7pk/WgYfn3Juwt
 9uDSZVlPK7PibTEsypLQ/DEdelkme+qsc1Pag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LIZVAq7xeySwQmWqTMtWLzT3ZnpjRce1QK8YJF3B6lA=;
 b=e/ZqpZGMA6AuTyWYisjbFRthrgZZllD9R2hZUlO34kLVt7dkrCht6/Ca+X1j/P77CA
 RyOd6VfFU+ThgXUcWNk6pSVU3tp54psC98DODdSddOxMDYpjHxObjhWhMqAZkXQv/cKm
 sbHTWIJJb+dLU4Mi81W+u86pp5bFVX8Vye8cjW/TDIZG2FG5DxEV2y2pFCIT08j+er5N
 o6ZlTlElzk+GQMciRn1kY/QUMZx9v0tUTm+vKYNhw9AIDpYsHKm635/L3irnDz+OfPMb
 yDYDVMegwkCxccY+OxJu3w+N278CsBkxPppZwOK2g3BPmlf5ZVLbUN/yR6wl0CnxpZXj
 yJDQ==
X-Gm-Message-State: AGi0PuYxX6oRamV3F6vS6JKDoOeXuAgky0s3BnCP/EFuA+utcoGqXFNe
 Hxs+r6xrDnVDYOdSzUgELNE4aQ==
X-Google-Smtp-Source: APiQypJ9qI2t3pspPrOWIlE7/3vyVy7azmPo/Qc+dpNgwSnPI0bXNEXcIKDQeD8aDbDAZmL3cT8sHg==
X-Received: by 2002:aa7:99d1:: with SMTP id v17mr12234526pfi.165.1586412133880; 
 Wed, 08 Apr 2020 23:02:13 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id w205sm18193515pfc.75.2020.04.08.23.02.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 23:02:13 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] drm: mediatek: fix device passed to cmdq
Date: Thu,  9 Apr 2020 14:02:09 +0800
Message-Id: <20200409060209.202677-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.26.0.292.g33ef6b2f38-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Apr 2020 07:33:24 +0000
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
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org
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
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
The patch is based on
https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git
branch v5.6-next/soc

Change log:
v1->v2:
align with 60fa8c13ab1a ("drm/mediatek: Move gce event property to mutex device node")
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 3 ++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 615a54e60fe2..7247c6f87f4a 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -822,7 +822,8 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	mtk_crtc->cmdq_client =
-			cmdq_mbox_create(dev, drm_crtc_index(&mtk_crtc->base),
+			cmdq_mbox_create(mtk_crtc->mmsys_dev,
+					 drm_crtc_index(&mtk_crtc->base),
 					 2000);
 	if (IS_ERR(mtk_crtc->cmdq_client)) {
 		dev_dbg(dev, "mtk_crtc %d failed to create mailbox client, writing register by CPU now\n",
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index e2bb0d19ef99..28418e5b83ee 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -517,7 +517,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
 				goto err_node;
 			}
 
-			ret = mtk_ddp_comp_init(dev, node, comp, comp_id, NULL);
+			ret = mtk_ddp_comp_init(dev->parent, node, comp, comp_id, NULL);
 			if (ret) {
 				of_node_put(node);
 				goto err_node;
-- 
2.26.0.292.g33ef6b2f38-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
