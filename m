Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B6319D853
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 15:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DFB56EBD7;
	Fri,  3 Apr 2020 13:59:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 550466EBA8
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 13:59:07 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id h9so8656011wrc.8
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 06:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gDlKl6kJndkWy3goQCYnpUpsumPiVmOqbn8UmjDA0X4=;
 b=VdavmpYHUfog22fqtXC9ocZl3dqh1fSqyI0NqBwusuNnkosbX0GR7MSAvx1fRH9YXd
 +feHVB7FVQQCIjdmPf8ipwXtkvRRLVDUoaRmzD4M4MsXw7Kz+OLJ4mrFr0AG7ZGqCrUj
 31khvdOAeLqJSytDRwY23vbMY4eOt8GVxDt+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gDlKl6kJndkWy3goQCYnpUpsumPiVmOqbn8UmjDA0X4=;
 b=Ekqu8YuigsOFmPwTO+qn1zzPIN0UDO56rHFK6FdMZusylsLfxXGpjUox06R3QrlhwA
 pStVVFn88GbMd+PYLvGsD7lgh4nDvKpDH0Qr2P4reQUfDOlud8RYjDJdECnRP0TvNizC
 cE++grKHMgwSqOCx3wCoXo/r6x0wp7+ueY4vNfMotZpPI14g5BJvflPrMi3Qhea52IJJ
 kWWDU7k1usr3/HaPNnzbycdTWkaPskR4+LVzlL+rosVoUMMbMsRVsII7HDsRZNrKOwD+
 TGhatN1I2CsLzhtBrbJDhCVUUlIdKJB8u//QXC9TWl3CFqSE8aOrI0PA/7WN9lR9jba9
 q/BQ==
X-Gm-Message-State: AGi0PubkxJBGojfU61pb4O1mgB1TARgjXGn0RayOBTduZ6Gd5qrCwDvM
 2y99iCR6iSYs3a+VaQPQRvWgOXBCLumkdA==
X-Google-Smtp-Source: APiQypI2ifoe0LrGUzL5L+65zmrDJkEjhLnE/KjWbJzh6sOKVZDU2UggIgLlGuo52yIhKZ9jILEzuw==
X-Received: by 2002:adf:e948:: with SMTP id m8mr9093874wrn.193.1585922345760; 
 Fri, 03 Apr 2020 06:59:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f141sm11783919wmf.3.2020.04.03.06.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:59:05 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 27/44] drm/tidss: Use devm_drm_dev_alloc
Date: Fri,  3 Apr 2020 15:58:11 +0200
Message-Id: <20200403135828.2542770-28-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Already using devm_drm_dev_init, so very simple replacment.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jyri Sarha <jsarha@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/tidss/tidss_drv.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index ad449d104306..7d4465d58be8 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -135,20 +135,13 @@ static int tidss_probe(struct platform_device *pdev)
 
 	dev_dbg(dev, "%s\n", __func__);
 
-	/* Can't use devm_* since drm_device's lifetime may exceed dev's */
-	tidss = kzalloc(sizeof(*tidss), GFP_KERNEL);
-	if (!tidss)
-		return -ENOMEM;
+	tidss = devm_drm_dev_alloc(&pdev->dev, &tidss_driver,
+				   struct tidss_device, ddev);
+	if (IS_ERR(tidss))
+		return PTR_ERR(tidss);
 
 	ddev = &tidss->ddev;
 
-	ret = devm_drm_dev_init(&pdev->dev, ddev, &tidss_driver);
-	if (ret) {
-		kfree(ddev);
-		return ret;
-	}
-	drmm_add_final_kfree(ddev, tidss);
-
 	tidss->dev = dev;
 	tidss->feat = of_device_get_match_data(dev);
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
