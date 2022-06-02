Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A4A53B1B1
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 04:44:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A401129BC;
	Thu,  2 Jun 2022 02:44:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7428A112914
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 02:44:17 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id q123so3565589pgq.6
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 19:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HbupgAkmVR1GYm3il4PytB0cVYenSOe+g7j17XkI4d4=;
 b=fiQbviVV7NONRimAi0Ctaq/RDSxgHCrya9Q/2+k+U8fhlYYHFuDQBk/tSbFZ1fx5Im
 GTbau0ekaRCChwa0jE4epT8v+rnupS7lwj7ZNrItTPZA8Q+94zKfN0aDAwGMmJODHL00
 GqL3iGIrLQeU8a4KLi5s9jUt4pt8BiUTJFc7kVIkY/L05xH/MSaAQV9SAgBpvtZAQYew
 gKZolAh5E/gQ2YLrLgFSKis9V88NSX4ZIoNcXiPZnNnEDsuk/rCo+rBQ6RKcK2TlOUL0
 cWD8WxU8v0cKLb/Vfp4h4BNKeIsC6Z7hXnRdNYiEhoQxt1n9PAjeHpRhcSwU3jb7tert
 yEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HbupgAkmVR1GYm3il4PytB0cVYenSOe+g7j17XkI4d4=;
 b=UFo+zmaPNPW6FMEWEjkXr6srE9MVLconWGZZuOCISyrNm5WlXAfl/QXGgyjEgHPmRU
 +MYLHI38yl81+kRPBIxpRdcCD++/Y1HOgiwNkbycJMl7p1eDrWiBfUqcyAijrTZIm1qD
 yp2vyBmdFPf/q51+EH0gAATzlbUsddXYsfFYXaqe8Xg/jYmwDB16KHR1B9OgZ0VdmHk0
 FtYM9Ny9v6wVBs2JX/6G6lz3MmW/RzbVYSkE5+OEaqRejGkQpVXA2WqhbvoQWdeAz+wD
 nmrRorDK3PaNbIfzopAL+L8qAa14C6fwuhoP/9BFvJPlbs6U0I/nqhVjmGYHzpXeuH9b
 Xhhw==
X-Gm-Message-State: AOAM531R7/6mPR16R9KFic2lLXkSGGMBuFoUQy7AyyEmtCuy4HeRE8TR
 lUzjh/LutjFP3PADoXQ7DhE=
X-Google-Smtp-Source: ABdhPJxTF2ECTA8cM8yplQy/idwVYTfY2GW0aaQ29KadG3GJLzrn5lLiXgz9B3rxdlpt/qdnJ/wjkQ==
X-Received: by 2002:a63:441f:0:b0:3fc:8bd2:f828 with SMTP id
 r31-20020a63441f000000b003fc8bd2f828mr2134422pga.579.1654137857033; 
 Wed, 01 Jun 2022 19:44:17 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 d62-20020a623641000000b0051baaa40028sm2208273pfa.11.2022.06.01.19.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 19:44:16 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Eric Anholt <eric@anholt.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4] drm/v3d/v3d_drv: Fix PM disable depth imbalance
Date: Thu,  2 Jun 2022 06:44:07 +0400
Message-Id: <20220602024408.43070-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linmq006@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pm_runtime_enable will increase power disable depth.
We need to call pm_runtime_disable() to balance it when needed
use devm_pm_runtime_enable() and handle it automatically/

Fixes: 57692c94dcbe ("drm/v3d: Introduce a new DRM driver for Broadcom V3D V3.x+")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
Changes in v4:
- use devm_pm_runtime_enable()

Changes in v3:
- call pm_runtime_disable() in v3d_platform_drm_remove
- update commit message

Changes in v2
- put pm_runtime_disable before dma_free_wc
- rename dma_free to pm_disable

v1: https://lore.kernel.org/r/20220105120442.14418-1-linmq006@gmail.com
v2: https://lore.kernel.org/r/20220106124657.32737-1-linmq006@gmail.com
v3: https://lore.kernel.org/all/20220601122050.1822-1-linmq006@gmail.com
---
 drivers/gpu/drm/v3d/v3d_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 1afcd54fbbd5..563ad4b9c2e8 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -282,7 +282,9 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_set_autosuspend_delay(dev, 50);
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		goto dma_free;
 
 	ret = v3d_gem_init(drm);
 	if (ret)
-- 
2.25.1

