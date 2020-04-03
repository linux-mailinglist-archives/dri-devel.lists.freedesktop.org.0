Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A344519D866
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 16:00:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB16E6EBEB;
	Fri,  3 Apr 2020 13:59:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0BFE6EBE3
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 13:59:12 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id j17so8572611wru.13
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 06:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kj9EgXkkoDR4+lgYLOHu9a1ttAywo89xqS89MfiMLWE=;
 b=j2MAwijYWcDut8+40MYT5U6kGuM27kpjqaJ8c008nKLhGhnIy71usPLOuzkSQ73Q4N
 J5RZJenC3uZYM41S4VRXtG4YHdpDLbvpKPJzFc0zrBcja2JLkafiJmGQo8bUIF0fnCJ/
 5ihMsn/+xxtXO6WjGzXjp7joqheZvj5a2M2Ac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kj9EgXkkoDR4+lgYLOHu9a1ttAywo89xqS89MfiMLWE=;
 b=C3ZGz4coX/snJTF3ANOYshgp47K3PJimPpDvO0GJ5qdqFCSWG2CFT+/sDJhFt/WY7n
 N5nIqlF1ivD4HdMhqyhLqDGyaQ3d0JMOAkzlXH8k7aLWEE50Ox8RqSBL56N1ygc6+gHY
 Ib0wESQBndkcWZERar0aO3HfuuvVaADuDKiqjEKE4KQqtf/CpGJ5OdK3YYmqEBOLlDcw
 w+oMSRFse8l30PpSnZh9WR3UHCiz4zbvq0XQzS838sFAFX4k66xDiCVs+JIgMFqqNjdM
 qhVc1Z9scON072qd3Y6vf6DBzutu7tWggTYzs0dOmtGHFgJ5Vr/rWiK0I/Z6scRPpwle
 xF/A==
X-Gm-Message-State: AGi0PuYtO54D7WpOXJemeb+XjCb/EHpJFeCuNL3gQYThIT25jF0bS/vY
 6ijOqwmpLtz8RB0r8VaKOWtYq9JNFWfeEg==
X-Google-Smtp-Source: APiQypIeclvs32sFZOEF6n+jt6pCYAANPAGnmvAn7aCu1NevuMqZRJkdxQwhtgcje8AJFpuXKHIEnQ==
X-Received: by 2002:adf:e948:: with SMTP id m8mr9094258wrn.193.1585922351320; 
 Fri, 03 Apr 2020 06:59:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f141sm11783919wmf.3.2020.04.03.06.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:59:10 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 32/44] drm/mcde: Use devm_drm_dev_alloc
Date: Fri,  3 Apr 2020 15:58:16 +0200
Message-Id: <20200403135828.2542770-33-daniel.vetter@ffwll.ch>
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
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Already using devm_drm_dev_init, so very simple replacment.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/mcde/mcde_drv.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index 88cc6b4a7a64..bdb525e3c5d7 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -307,24 +307,16 @@ static int mcde_probe(struct platform_device *pdev)
 	int ret;
 	int i;
 
-	mcde = kzalloc(sizeof(*mcde), GFP_KERNEL);
-	if (!mcde)
-		return -ENOMEM;
-	mcde->dev = dev;
-
-	ret = devm_drm_dev_init(dev, &mcde->drm, &mcde_drm_driver);
-	if (ret) {
-		kfree(mcde);
-		return ret;
-	}
+	mcde = devm_drm_dev_alloc(dev, &mcde_drm_driver, struct mcde, drm);
+	if (IS_ERR(mcde))
+		return PTR_ERR(mcde);
 	drm = &mcde->drm;
 	drm->dev_private = mcde;
-	drmm_add_final_kfree(drm, mcde);
+	mcde->dev = dev;
 	platform_set_drvdata(pdev, drm);
 
 	/* Enable continuous updates: this is what Linux' framebuffer expects */
 	mcde->oneshot_mode = false;
-	drm->dev_private = mcde;
 
 	/* First obtain and turn on the main power */
 	mcde->epod = devm_regulator_get(dev, "epod");
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
