Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EDB19D865
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 16:00:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A03E6EBE8;
	Fri,  3 Apr 2020 13:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7CD26EBE0
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 13:59:14 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id c81so7256245wmd.4
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 06:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IngScXdv0qfol6XdICwow6VLfvhITcLZ3W7Bo1q+SDM=;
 b=LEgiat1wq7imwpO5egsX6ZvJ49pldujtsuvpUuIey8PNrvtk0bIGMXJz10ZERul5vS
 LRL5Rj5qmY2iVseEMIDySXL5x7J+txWAo1gUUScNCeKgWq236q2A8eAoZFknxqK2tqWK
 rtBYkgCIhCV2eLhJiPSgBJF7foyPjVS4At7/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IngScXdv0qfol6XdICwow6VLfvhITcLZ3W7Bo1q+SDM=;
 b=E7ljGVfafGA8d+zN1kINUtzrQ1cO5zX97ppoNceXCcO4JnZ0ZWb6rqjgl2nt3ShWTh
 9xHHsgp3nDLyhPIl3y2fEltEIsVz5iuk+UH6CfYSI7wVLav0KfjvKEtZrE9E7ddhXy+t
 EXW9INHj3qDxa4Cz/AiOTXWQtrSuLF5wUT67z5Cp5red+BjGq5BotGInO0LR6cwBYC8M
 zFQSYNmmzCyDTiDf7T6t9xcPjNZvoIM3l6DjxR7I79JXCbxQgOL+jRI8fkJ9XNrVd19S
 bGeGJ+c8b4W4xhs71kmPJYFnDygvj5dI0inW6NKHPO915i2mYptPhFnvtFqT7XO7zmoJ
 Zf5g==
X-Gm-Message-State: AGi0PuaLlaYiN78YcYcSgAQMFBSHnA1UialzeA8T4UktUCXV3mwTMGe9
 ZflsiAPsk9BCJQk8IOE4lAyOGWyBPutIsw==
X-Google-Smtp-Source: APiQypK4/1dcgU8BCv7yE/0ngivqJAQyrxI9+iEv/DziKncszXDJTYgy1tGAQ2huLx1Uhd2s6lR7uw==
X-Received: by 2002:a7b:cb59:: with SMTP id v25mr9315261wmj.13.1585922353311; 
 Fri, 03 Apr 2020 06:59:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f141sm11783919wmf.3.2020.04.03.06.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:59:12 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 34/44] drm/ingenic: Use devm_drm_dev_alloc
Date: Fri,  3 Apr 2020 15:58:18 +0200
Message-Id: <20200403135828.2542770-35-daniel.vetter@ffwll.ch>
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
Cc: Paul Cercueil <paul@crapouillou.net>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Already using devm_drm_dev_init, so very simple replacment.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ingenic/ingenic-drm.c
index a9bc6623b488..bb62d8e93985 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
@@ -614,9 +614,10 @@ static int ingenic_drm_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
+	priv = devm_drm_dev_alloc(dev, &ingenic_drm_driver_data,
+				  struct ingenic_drm, drm);
+	if (IS_ERR(priv))
+		return PTR_ERR(priv);
 
 	priv->soc_info = soc_info;
 	priv->dev = dev;
@@ -625,13 +626,6 @@ static int ingenic_drm_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, priv);
 
-	ret = devm_drm_dev_init(dev, drm, &ingenic_drm_driver_data);
-	if (ret) {
-		kfree(priv);
-		return ret;
-	}
-	drmm_add_final_kfree(drm, priv);
-
 	ret = drmm_mode_config_init(drm);
 	if (ret)
 		return ret;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
