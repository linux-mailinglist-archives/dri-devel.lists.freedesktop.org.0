Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E24114EAB70
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 12:38:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DCA210E810;
	Tue, 29 Mar 2022 10:37:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2249010E82F
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 10:37:55 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id j21so14852408qta.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 03:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xKC778etah9QDKKcTZhhCigcf4xPfMmEKK8YhWBFI3U=;
 b=PDvLAK727ct6dPW56kW/LelNoVohBTmDa2Azjn40F4G+K9/a9FvkOuyluaA7aYxwTl
 LcAVtUIsDGndq1N/B6ZQp/S4nrRurzW0tiofMGqNg0yefQfbhNzyLc88hURsF1kE0b6R
 4l24zv5jf4Cg/u/AqQlyU6dLq44h7RFSeudNVrhlp6fRfWCZn/AUAzEioZrCTtO+QrKJ
 +Z9ju0P6kWUBX1Yjpsy8WGnUlb9ipnEjKh2pOYGaBE88I34X29q3f42xEip1JAKNMV0G
 Rx+1mmT4qnxxawWkem/Oqg6Qq7dsx+hgI+8tZ/dQ1cPx9COImVqWy61DA+3Vo3VANB8U
 /5eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xKC778etah9QDKKcTZhhCigcf4xPfMmEKK8YhWBFI3U=;
 b=uvYTXOIed+xwRpmzxMi6sAVJDttoE7KGihyG3FQ+9bBP1CIVYa+X6PlDO6OdXNJLst
 UskcRhndj3F1mZYFU/wuUFkE93DRtV8H2Z5IlBOJIjXPhxxxLiDYizKtaeE8Ec8zk+U1
 wY7Tw7IbKeLGJzGB5Z4EPBtgTesgj2judkXe/xBPl7uORrv2wpqYlHjkXccHwDqeuSUw
 vGPpt6M+yqzVmMUrO3fonZ5mdy/aSN/tDEvQLxRxIzA34aK1QvbsItEQK5IfT0OnTJpB
 tW3aWHwv2GSPGcsID8XKWCZ4T1zvx5Dmfxn4ZGlHoC3yXkG1x3ZWHPYcyY4NodX/n3Zy
 +I8w==
X-Gm-Message-State: AOAM530yGOav7K1RgjUysJj7s8baFcAIJOQ0Z3sCWlZVrVvvQn8Wh/q3
 SRgiQkeCdbw01qyr5wOtnqE=
X-Google-Smtp-Source: ABdhPJyjvB2r/3wtYP5p9c9+BZYtdAonfE8T69SzZfubL2yGRZlQQpA0YYQnGTkJOcqV2rR+BdnRUQ==
X-Received: by 2002:a05:622a:89:b0:2e1:b8c7:9975 with SMTP id
 o9-20020a05622a008900b002e1b8c79975mr26674072qtw.342.1648550274239; 
 Tue, 29 Mar 2022 03:37:54 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 j188-20020a3755c5000000b0067d1c76a09fsm9545713qkb.74.2022.03.29.03.37.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 03:37:53 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: lv.ruyi@zte.com.cn
To: thierry.reding@gmail.com
Subject: [PATCH] drm: tegra: fix memory leak in error handling path
Date: Tue, 29 Mar 2022 10:37:47 +0000
Message-Id: <20220329103747.2376753-1-lv.ruyi@zte.com.cn>
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
Cc: airlied@linux.ie, Lv Ruyi <lv.ruyi@zte.com.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
 Zeal Robot <zealci@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lv Ruyi <lv.ruyi@zte.com.cn>

Before leave the nvdec_load_firmware, we shuold free virt which is alloced
by dma_alloc_coherent, so change "return err" to "goto cleanup".

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
---
 drivers/gpu/drm/tegra/nvdec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/nvdec.c b/drivers/gpu/drm/tegra/nvdec.c
index 79e1e88203cf..a14863346bfa 100644
--- a/drivers/gpu/drm/tegra/nvdec.c
+++ b/drivers/gpu/drm/tegra/nvdec.c
@@ -209,7 +209,7 @@ static int nvdec_load_firmware(struct nvdec *nvdec)
 
 		err = dma_mapping_error(nvdec->dev, iova);
 		if (err < 0)
-			return err;
+			goto cleanup;
 	} else {
 		virt = tegra_drm_alloc(tegra, size, &iova);
 	}
-- 
2.25.1

