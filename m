Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C026BA243
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 23:18:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2B410E2D2;
	Tue, 14 Mar 2023 22:18:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52ED410E2CD;
 Tue, 14 Mar 2023 22:18:29 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id y15so12436228lfa.7;
 Tue, 14 Mar 2023 15:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678832307;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=unv7jkKhSyV7JGv+yIPCmnr6mTwYXd0VFoIWTdDr37E=;
 b=l29oKArfJSGBXwVSUsqNOVE5S1Zb1OAFW9yIYHA6BfStr7PKGfLDsfMMLA6d/Rim+i
 vlQa2cyZf2i3GTkS1Bp9hpIL422z8Cbe6bBP/aKeeCCWWfMZB3FtKzg/4naXwkfV5t2G
 6CWm50VuCCibVX/Zd7cAPubC9x/HXSs3JrBi7O4NphxayguyB5cHAM3Sua5ZF6AqSNCA
 4skJIVz7qV+q6n6msywUkLZ7lyfIw+ad4oF2wrkdiNWScpJlIaNtF8Pf42XMmZY8I70s
 cy5m91CfWMyhGWDUHWXuVSX+udh7nNrKtjpNoO4j/M1oaLIRbKKqY7QOVrNDjwpNxKqM
 4Zaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678832307;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=unv7jkKhSyV7JGv+yIPCmnr6mTwYXd0VFoIWTdDr37E=;
 b=R8ZvnGlfaNYrCcDiovEoy52xp9PSLFNWdm6l3FjASBY5DHAasMGA55tbV7BLWFOqay
 ddHF8BoxMB70cyME1jSDMx1puPj41hbE7TxeN/TroQ7Sw4Vd3N5F4Lyohg8tv055ArPi
 381njoSmqA4et3xQggpvGW58e7u0iEGj66yU6uypVXmF5Rd41GRCgev6PbPGIn9hBcYZ
 ZXAL7qGD28fykMfwPOW3v7suhEo4OIZTHnw9MmrQFJXYomG0cIV1G82N1i7+L6/Hbr42
 yE+9b7E+rvbqVW1mpOSADkv+1rYcoXU1rILJiTbzJ4N1xeuqj+cquWGqIxEL3gjCGtn9
 iVXg==
X-Gm-Message-State: AO0yUKUB9meA/NK8++oy5N3b3G+iuQAeyvL5kovGjTY13gDDyoK73suT
 2+yZ1+p8gCiT/h0FdtQ+xy8=
X-Google-Smtp-Source: AK7set/rJc+gSrVKA7Qa6wO50JW4WEimCebjK+oKixALe42HEQYmov1TyILND58iArHQtSRdwvObLQ==
X-Received: by 2002:ac2:4822:0:b0:4db:3e7e:51dc with SMTP id
 2-20020ac24822000000b004db3e7e51dcmr1199459lft.55.1678832307446; 
 Tue, 14 Mar 2023 15:18:27 -0700 (PDT)
Received: from localhost.localdomain (byw237.neoplus.adsl.tpnet.pl.
 [83.30.42.237]) by smtp.gmail.com with ESMTPSA id
 l7-20020ac24a87000000b004d23763fe96sm554893lfp.72.2023.03.14.15.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 15:18:27 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Subject: [PATCH] drm: msm: adreno: Disable preemption on Adreno 510
Date: Tue, 14 Mar 2023 23:17:17 +0100
Message-Id: <20230314221757.13096-1-a39.skl@gmail.com>
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
Cc: freedreno@lists.freedesktop.org,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Elliot Berman <quic_eberman@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Adam Skladowski <a39.skl@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, phone-devel@vger.kernel.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Downstream driver appears to not support preemption on A510 target,
trying to use one make device slow and fill log with rings related errors.
Set num_rings to 1 to disable preemption.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: e20c9284c8f2 ("drm/msm/adreno: Add support for Adreno 510 GPU")
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index d09221f97f71..074b4e9a8500 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1743,6 +1743,7 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 	struct a5xx_gpu *a5xx_gpu = NULL;
 	struct adreno_gpu *adreno_gpu;
 	struct msm_gpu *gpu;
+	unsigned int nr_rings;
 	int ret;
 
 	if (!pdev) {
@@ -1763,7 +1764,12 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 
 	check_speed_bin(&pdev->dev);
 
-	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 4);
+	nr_rings = 4;
+
+	if (adreno_is_a510(adreno_gpu))
+		nr_rings = 1;
+
+	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, nr_rings);
 	if (ret) {
 		a5xx_destroy(&(a5xx_gpu->base.base));
 		return ERR_PTR(ret);
-- 
2.25.1

