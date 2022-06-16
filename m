Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA4C54ECA9
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 23:33:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B076210E089;
	Thu, 16 Jun 2022 21:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD9410E089
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 21:33:10 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id o10so3871868edi.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 14:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=laSJoDIgvQBCTId5pVKj53fMxGvIURwK5+ffKs0ASlY=;
 b=UBd17f/1SnZchYlExkTEs7FEuYTDz5ujzCzXm/SGFxfc7vQJ4lD7bhjBqiIPj2yGEY
 OwWwEycnPAU139vVsRVxUyNnf6H75fg5PESXPcSy4hSPmAVLjAgzMN7gutw+N7PP/V/n
 4Xha3koafKzw6BNAP+dZFpiWU3OKxLzLTXz5t7r/ZXiv/OgndLmncmtxxVKo22qgcomS
 nTxiiFAiPY6wxRbda4CwsKu1nSWydVfLTtRpNEv6aAzv+AsbfvhPMIOeOhCoOLZPP9Ws
 w+cmzNI/W2M1sMrVY8ka2YLMDqLl5axbTOql/Vt16eIKZ39AGlUcV6dPfCwO1RUQQdn0
 B45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=laSJoDIgvQBCTId5pVKj53fMxGvIURwK5+ffKs0ASlY=;
 b=o7TuBpIeKTTLk7MUOfuyoAxbsYr+KZjo1GseAh4RVVzwnGneJVS/uHQfu3uwNUcfyl
 KO58rmLhf772YN/WS16n2agq/eFWyzAhZY4PgAAiH7PVoQ4N3gpOLNspJ+hFeoOn36a3
 Ze+WDo//D0swG8wSYCgq4/aiYNaIu5J7zu5zwLCaaupHDmSYUHxmXWcJyuoyn2hKg0zU
 EtqA/AU7uaVnskBYPcwyL8CSxfsOvErhCG5ENzFhpYa/ZWElLPsALc1NYoczY+c2itk6
 NtSvjiwzRjtOxEOfSK29ORoH6o+nMLP40NkCZcM3h8pFRrLhnqL1v3xcTubofSqig9xZ
 ayLA==
X-Gm-Message-State: AJIora9mT+XpxjwJmvz5Xa+lh86PNoDEygm/0v2lMDIYxjvSAdAuzjAQ
 lDZBZViYzakS0G+avR+kPyM=
X-Google-Smtp-Source: AGRyM1smWRQNfSGi+fNS3fxjPTkk1JtE/FL1CrltkwNtsatE8j54xbfVNS+Jv1BDstvw0sEj54qO3A==
X-Received: by 2002:aa7:c857:0:b0:433:5c62:ddbc with SMTP id
 g23-20020aa7c857000000b004335c62ddbcmr8865690edt.218.1655415189047; 
 Thu, 16 Jun 2022 14:33:09 -0700 (PDT)
Received: from kista.localdomain (213-161-3-76.dynamic.telemach.net.
 [213.161.3.76]) by smtp.gmail.com with ESMTPSA id
 d5-20020a170906304500b0070f7d1c5a18sm1241230ejd.55.2022.06.16.14.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 14:33:08 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Subject: [PATCH] drm/sun4i: Add DMA mask and segment size
Date: Thu, 16 Jun 2022 23:32:40 +0200
Message-Id: <20220616213240.392041-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.36.1
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
Cc: samuel@sholland.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Kernel occasionally complains that there is mismatch in segment size
when trying to render HW decoded videos and rendering them directly with
sun4i DRM driver.

Fix that by setting DMA mask and segment size.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_drv.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 275f7e4a03ae..83f4e87f77f6 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/component.h>
+#include <linux/dma-mapping.h>
 #include <linux/kfifo.h>
 #include <linux/module.h>
 #include <linux/of_graph.h>
@@ -367,6 +368,9 @@ static int sun4i_drv_probe(struct platform_device *pdev)
 
 	INIT_KFIFO(list.fifo);
 
+	dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
+
 	for (i = 0;; i++) {
 		struct device_node *pipeline = of_parse_phandle(np,
 								"allwinner,pipelines",
-- 
2.36.1

