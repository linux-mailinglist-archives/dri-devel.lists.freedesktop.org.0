Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7017050B349
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 10:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5742C10EC54;
	Fri, 22 Apr 2022 08:52:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5700010EBA3;
 Fri, 22 Apr 2022 08:52:20 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id d14so5064824qtw.5;
 Fri, 22 Apr 2022 01:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R6g4D7mTtXbmJbP4V29JqDtbmx2cmeevRLcE291yfLw=;
 b=dceCRkgeMucI4j00b+6DMN6jUHuFGTzb9UsP2b6PAVaekNpBuYgNj8cI3MS39K4cbT
 tz51tIx68lnxOEk/UKNv0E6NFWbf2isguESFyfRMWIH6el5JVs5NKvRK9NWHxUb2ViZn
 SSaMpwUugcmKN2jU9/kmdhrunh/uItjSG7Z6qCSKtmfJoTvZEJRU2cAHYfo27EYMX/aA
 aqs6ajvV2jcObr8TaxdfotUVxCiuEc/pvuwplX2kb09dHqZhMjpA9RNMpSCO7TSOs1aQ
 4hduk1dvqcQS1mWD0/Z6NvqfplgM4CQCLUGulpUN326fbry8sX4L3rKT6eh+yQpGHhOJ
 p5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R6g4D7mTtXbmJbP4V29JqDtbmx2cmeevRLcE291yfLw=;
 b=jGFoEfULLvQWEYmDBg/P6ycP+RT5vAJL1zoIV2nxN7shz9LSH3DZmwL3+MxwXxb9cd
 n1ZtS37Y6EJ10xKBvY9t+8Tfn/XAOCh9ROivdKlxTN1u1MzIXczWOWcmi2GBj9DHCJJw
 EhmaQH/p+hYCm6aldvnN93ag+pq1Frlcvcf0t4iJhUsuZKDVd4wf18Kbw9RbkEGnw5ht
 SzoSL9e6Wg7nA32SL4zTqS2Wes1YJM1vwsF8QduRmVqHqa3hAkgILG6prCzu/X0K85wv
 zWGjx08LMi2JG8uTN7l+M+tRc75GzVrwNvU79wgHsI2Gh67CEsxHzcygoTXPXrY42IWJ
 4aqQ==
X-Gm-Message-State: AOAM533TsyOr1AO8hLUTMu5yjtc1gtua880tP1To5a0zE74Ag2wDmn0U
 S5Mb9Hu0jmXjqkvIrx5D/FI=
X-Google-Smtp-Source: ABdhPJwObvkgqUBfe9bcmTg2V6y72e0AwWi8Lhh/TLBS9aIbfzev1hrlTn7rpRBejrw9L44qjVZBRw==
X-Received: by 2002:a05:622a:4cd:b0:2f3:3f55:fba7 with SMTP id
 q13-20020a05622a04cd00b002f33f55fba7mr2401053qtx.524.1650617539473; 
 Fri, 22 Apr 2022 01:52:19 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 n8-20020ac85a08000000b002f1fc230725sm900764qta.31.2022.04.22.01.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 01:52:19 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: lv.ruyi@zte.com.cn
To: robdclark@gmail.com,
	sean@poorly.run,
	dmitry.baryshkov@linaro.org
Subject: [PATCH] drm: msm: fix error check return value of
 irq_of_parse_and_map()
Date: Fri, 22 Apr 2022 08:52:11 +0000
Message-Id: <20220422085211.2776419-1-lv.ruyi@zte.com.cn>
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 Lv Ruyi <lv.ruyi@zte.com.cn>, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, quic_mkrishn@quicinc.com,
 vulab@iscas.ac.cn, freedreno@lists.freedesktop.org,
 Zeal Robot <zealci@zte.com.cn>, linux-kernel@vger.kernel.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lv Ruyi <lv.ruyi@zte.com.cn>

The irq_of_parse_and_map() function returns 0 on failure, and does not
return an negative value.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 3b92372e7bdf..1fb1ed9e95d9 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -570,7 +570,7 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
 	}
 
 	irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
-	if (irq < 0) {
+	if (!irq) {
 		ret = irq;
 		DRM_DEV_ERROR(&pdev->dev, "failed to get irq: %d\n", ret);
 		goto fail;
-- 
2.25.1

