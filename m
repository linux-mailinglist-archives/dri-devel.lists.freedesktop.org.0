Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBBE3F2776
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 09:17:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B6236EA22;
	Fri, 20 Aug 2021 07:17:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD336E9EE
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 02:10:57 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id z2so188800qvl.10
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 19:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6GBnlD7JIyrI3ypjxWJiH4K8EVYyZag/d4qLh3mFEpQ=;
 b=VZ11PEonbAYy7cyzGyN9eE/qqJI9vWpZp48IKfN3n7cZQ1XbNEjNyOABuFangAlTak
 3AMprImiO3aGZJQCgYikAvx5v0y+xbb5nTMyk5p4YEXjXg85Ph3rS4m9+FvMSn6BX471
 L7ldCkk/8vZG++GqG+PW+bh/+t+LaiRUobzBMES8V1v4yU3BGiTAlos8xPMqcIHeXqMM
 gjjWwMNdjQB+ZnrpdD4gEXa/X1sF+AgfuQXUM2+fbrFC/bjvtFaR1uqvPOKKVITnodXS
 d4Ms9bX0wFZBgSfMZA4w1K9LAdjGQeL4qbsKndTlShjAXafICXYXdvMMWSAI6Zhx8Lr8
 P58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6GBnlD7JIyrI3ypjxWJiH4K8EVYyZag/d4qLh3mFEpQ=;
 b=Hqy7xs5wqhkSvIRCBM2EgJL39RYM/yqlWn4H67Qz8BNrPVC03fmzKk5ONxYubb766L
 TwMr2o4M/JEIkNabI3F+i9HlGly7iTLo6r/oQXkdtFOV79LwHgDJ3AAlvkASxmzVvDL8
 Y/7j+WUf3N5x4C4pXlZpSyeTaDUvxuYcjV6s92TyuM/HlZEEWMfjwHoWFe3monZ3v2nZ
 WbEAmdK74XIffUXFAR5N3bWqfwQaN6cJ1Q2HfRqz9K9T/7ojyG5oJEqRIsbC4DBja+rf
 FtwZvNl+2tdpQ1Xu/nyy6RygOPH3NqnKpYjWvFzlqzCfZp8f8fpCgikkHvKvaDSsNaUr
 +xYQ==
X-Gm-Message-State: AOAM530I1Q0d1uiufvZa9X2jfudWul2Pd223MZMwYdgeJ+q6zw2EX6A9
 BVteqFybEswB+OQMoEXeKPA=
X-Google-Smtp-Source: ABdhPJyuxnKhj81Zor3HZ/w5G7/iqhNkCh/TAMNPAMf/ziEHAWuUD/V8OpjZnPsGrpXo5Qfc9s7P7w==
X-Received: by 2002:a05:6214:29ee:: with SMTP id
 jv14mr17653090qvb.5.1629425456962; 
 Thu, 19 Aug 2021 19:10:56 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id h4sm2398873qkp.86.2021.08.19.19.10.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 19:10:56 -0700 (PDT)
From: jing yangyang <cgel.zte@gmail.com>
X-Google-Original-From: jing yangyang <jing.yangyang@zte.com.cn>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Cc: Edmund Dea <edmund.j.dea@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jing yangyang <jing.yangyang@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH linux-next] : add put_device() after of_find_device_by_node()
Date: Thu, 19 Aug 2021 19:10:29 -0700
Message-Id: <20210820021029.10770-1-jing.yangyang@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 20 Aug 2021 07:16:30 +0000
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

This was found by coccicheck:
./drivers/gpu/drm/kmb/kmb_drv.c:503:2-8:
ERROR  missing put_device; call of_find_device_by_node on line 490,
but without a corresponding object release within this function.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: jing yangyang <jing.yangyang@zte.com.cn>
---
 drivers/gpu/drm/kmb/kmb_drv.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index f54392e..58495a9 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -500,8 +500,10 @@ static int kmb_probe(struct platform_device *pdev)
 	ret = kmb_dsi_host_bridge_init(get_device(&dsi_pdev->dev));
 
 	if (ret == -EPROBE_DEFER) {
+		put_device(&dsi_pdev->dev);
 		return -EPROBE_DEFER;
 	} else if (ret) {
+		put_device(&dsi_pdev->dev);
 		DRM_ERROR("probe failed to initialize DSI host bridge\n");
 		return ret;
 	}
@@ -509,9 +511,10 @@ static int kmb_probe(struct platform_device *pdev)
 	/* Create DRM device */
 	kmb = devm_drm_dev_alloc(dev, &kmb_driver,
 				 struct kmb_drm_private, drm);
-	if (IS_ERR(kmb))
+	if (IS_ERR(kmb)) {
+		put_device(&dsi_pdev->dev);
 		return PTR_ERR(kmb);
-
+	}
 	dev_set_drvdata(dev, &kmb->drm);
 
 	/* Initialize MIPI DSI */
-- 
1.8.3.1


