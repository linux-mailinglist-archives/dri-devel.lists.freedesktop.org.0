Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A6D50CEDA
	for <lists+dri-devel@lfdr.de>; Sun, 24 Apr 2022 05:20:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D5A71126F2;
	Sun, 24 Apr 2022 03:20:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0214E1126F2;
 Sun, 24 Apr 2022 03:20:08 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id hf18so8276156qtb.0;
 Sat, 23 Apr 2022 20:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EBA8aWav/CoBSWehGgBZGEgzVa0RTgL7rHF90t0PF20=;
 b=JtCtdl+5DWWk4Pj9mz99phQ52W2SEjVTzE0ETbG/GthiQd5Wtt48zvgm17LijeXvJr
 6IzCxPrwD4LoIgSQ2+7/ourtejJG8l6yw8eLo6FoULmb+Oj/bnsSYX1ft83j+PyhqiWp
 IwvEvi6FBAiL3t5BDs6w2mairv9tUe5Op/o3lYtpLWQ51kqOY/n6STPEvu9VIBUKqZ5Y
 X3DbqKe/e4ol+BBWSRXv3w7+CzjMtQzfgG4oDyuipqiGkaN06SKC/1N+ePKNwmwyredJ
 zpSOf1dW+mHjE7kL1PxJCRTK4HkX9LmIABQTXTYCGVMOToQfQbHoOISYkqgd8BdTffdS
 m0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EBA8aWav/CoBSWehGgBZGEgzVa0RTgL7rHF90t0PF20=;
 b=VAa2G2GaKNex7ZStduDtNxbzIux2mXGRhSWC7Yu/d0pR14boIpr+Wa6lZFIQKQ3P5H
 C3f/8rLXCtYR6KnOFb1+pMkw9drzX53AXSvC10ag18e6CqCnSzdJZRVlNZBiQQ+Ydh7Y
 Or6uLD4mvtIJphrrLvLLyuxK1iBZ92/vxfXyEKNBQ28rHDYZi1eZzZ5NK7itOVkkfe40
 /6zaVEBokqPHjVcjo8iQCh90EBmmewMB3oWETmzORPU+xsmMIkY2o1Q007rN1KSxUG42
 y2p2DQIUIdaetNr9kQWwpLIemC20M4aBS47y9RGLY2ht6eSD5vKB7unqDbdJbBEGX77m
 u0/Q==
X-Gm-Message-State: AOAM530w4C2AVlaUohaTlnSTmdqlAMS5GqlvRbs1YWZh/5HoTRTKwVOg
 SVhvFuf/TgeoFpfmS0SiTvQ=
X-Google-Smtp-Source: ABdhPJxjmwV+ialnqEb/Pgpw43PsgJzk6QNcPOzlVGXfI4DjI6QU1OgP12eLiyjzGuEKuW7rqWPBSA==
X-Received: by 2002:ac8:7f53:0:b0:2e0:77a0:1d35 with SMTP id
 g19-20020ac87f53000000b002e077a01d35mr7983018qtk.496.1650770408094; 
 Sat, 23 Apr 2022 20:20:08 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a05620a0e0500b0069c28a4e8ddsm3060267qkm.72.2022.04.23.20.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 20:20:07 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: lv.ruyi@zte.com.cn
To: dmitry.baryshkov@linaro.org
Subject: [PATCH v2] drm: msm: fix error check return value of
 irq_of_parse_and_map()
Date: Sun, 24 Apr 2022 03:19:59 +0000
Message-Id: <20220424031959.3172406-1-lv.ruyi@zte.com.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <39b3828e-064c-6aa4-de77-35b201b1b40f@linaro.org>
References: <39b3828e-064c-6aa4-de77-35b201b1b40f@linaro.org>
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
Cc: sean@poorly.run, airlied@linux.ie, cgel.zte@gmail.com, lv.ruyi@zte.com.cn,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_abhinavk@quicinc.com, quic_mkrishn@quicinc.com, vulab@iscas.ac.cn,
 linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
 freedreno@lists.freedesktop.org, Zeal Robot <zealci@zte.com.cn>,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lv Ruyi <lv.ruyi@zte.com.cn>

The irq_of_parse_and_map() function returns 0 on failure, and does not
return an negative value.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
---
v2: don't print irq, and return ERR_PTR(-EINVAL)
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 3b92372e7bdf..44e395e59df9 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -570,9 +570,9 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
 	}
 
 	irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
-	if (irq < 0) {
-		ret = irq;
-		DRM_DEV_ERROR(&pdev->dev, "failed to get irq: %d\n", ret);
+	if (!irq) {
+		ret = -EINVAL;
+		DRM_DEV_ERROR(&pdev->dev, "failed to get irq\n");
 		goto fail;
 	}
 
-- 
2.25.1

