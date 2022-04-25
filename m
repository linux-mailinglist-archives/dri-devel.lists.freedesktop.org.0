Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F321650DC0B
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 11:10:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF0610E02E;
	Mon, 25 Apr 2022 09:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FFD210E09B;
 Mon, 25 Apr 2022 09:09:58 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id t11so2960252qto.11;
 Mon, 25 Apr 2022 02:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fxgLQ1soDdNo6GOHgPvluqBZIfBwx/V3C+hOxuZtNW8=;
 b=BtwHxyPpct0J/94b6H6JFnfA626J0AL2B34MiNkgVl/GmKQdL0t7FSK6PAhiLi7Km6
 h876ttC1XBP68qbB3vc4+a93XEN5R9ZwU/dKsbGptAD3v+11FS+3wniG62kH+RdmoDLV
 zt79dPL4a8c0YUu3WvbCSchqL2EyqvClNf4zAlgruLcHdamP2Ll6euQm5p7yAKi7Sw1v
 ZmGYY9bmlAHDsDAXexFR8zv64kfP9DKxxg5/uOZ9egdrB98PmSnG8LKTl2pX7fYdU+wR
 a4tqIPxNnHfzca27KN5WaSkZCNc9OkxMXrTysh5MHJupPxFOXcAGmz2Dq4xmkElk+UDO
 2Gvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fxgLQ1soDdNo6GOHgPvluqBZIfBwx/V3C+hOxuZtNW8=;
 b=3/TpoSVT9VR/Y6COMCvOxvja1d2VSJ8oh2PTYZteXbpIQ0ExJP1etxgXYmRIF25YQ5
 ctPHO0fX7ti8OAtvOAvdkcvkQQBvRMQqGEjhKSCbSNYFBgkAqu+24z1C5A0dzygN6nuN
 6zwxl/PYoKjihDOAY3bKKN8043dAcsGRuNwJdCvrnWCtwjA5cBuZgTFVTKyXWEflFq66
 mRzLXi2IcnJylHnnj8PG7HiPH451Vy1HdS7WocEs81JATeLvqIL645nWTo9xjcAbTFWN
 R+FTqlDl9kNk2cOV4WMfkTUTEG/f/Uc85S19ierIfCNG+Iy2JILQah0vaAGSLVbyk32M
 sFFw==
X-Gm-Message-State: AOAM533nhWc5tefTlvx8PFQMTpp2kUJgSdeUJngFOV6M+ubiH9c9Ujgj
 3kja3tCbwkUbwyxjHxCH8pk=
X-Google-Smtp-Source: ABdhPJwBdVMVBLRA8VCjJ4w1pDSTXYa39d9cefp0lgq6pG4EAjTTfJBWbxdQxFOYYMlZhszBt2D22w==
X-Received: by 2002:a05:622a:100a:b0:2f3:391c:3ce6 with SMTP id
 d10-20020a05622a100a00b002f3391c3ce6mr11187185qte.351.1650877797522; 
 Mon, 25 Apr 2022 02:09:57 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 y189-20020a37afc6000000b0069ede17247csm4799225qke.86.2022.04.25.02.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 02:09:57 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: lv.ruyi@zte.com.cn
To: robdclark@gmail.com,
	sean@poorly.run
Subject: [PATCH] drm/msm/dpu: fix error check return value of
 irq_of_parse_and_map()
Date: Mon, 25 Apr 2022 09:09:47 +0000
Message-Id: <20220425090947.3498897-1-lv.ruyi@zte.com.cn>
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
Cc: architt@codeaurora.org, linux-kernel@vger.kernel.org, ryadav@codeaurora.org,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org, Lv Ruyi <lv.ruyi@zte.com.cn>,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, tiny.windzz@gmail.com,
 angelogioacchino.delregno@somainline.org, dmitry.baryshkov@linaro.org,
 jsanka@codeaurora.org, swboyd@chromium.org, freedreno@lists.freedesktop.org,
 Zeal Robot <zealci@zte.com.cn>, skolluku@codeaurora.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lv Ruyi <lv.ruyi@zte.com.cn>

The irq_of_parse_and_map() function returns 0 on failure, and does not
return a negative value anyhow, so never enter this conditional branch.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index e29796c4f27b..36eeeae7fe45 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1187,9 +1187,9 @@ struct msm_kms *dpu_kms_init(struct drm_device *dev)
 	dpu_kms = to_dpu_kms(priv->kms);
 
 	irq = irq_of_parse_and_map(dpu_kms->pdev->dev.of_node, 0);
-	if (irq < 0) {
-		DPU_ERROR("failed to get irq: %d\n", irq);
-		return ERR_PTR(irq);
+	if (!irq) {
+		DPU_ERROR("failed to get irq\n");
+		return ERR_PTR(-EINVAL);
 	}
 	dpu_kms->base.irq = irq;
 
-- 
2.25.1

