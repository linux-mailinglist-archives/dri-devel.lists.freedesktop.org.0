Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1487544A44
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 13:31:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF8011B1EA;
	Thu,  9 Jun 2022 11:31:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A48711B1E6
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 11:31:51 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id a15so37493569lfb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jun 2022 04:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=osPC7nggXKqJCgggBesqx8Y0buQDmZALkohv6+cRgp8=;
 b=rxgaufoYydqleVu0MBrDVaOwUv9VSuk7YDRyq06HxJQJcY/RrJTzQBpBlj+J+CiX+W
 ZjtUS5e21LzJ1xBtgSH+YVwtBTsfH1pQBIBz7nQNBekVYj2tLH63RN2Fn7/QczwGC+OK
 arFI7LP/hK7lZmEKDiEKuAyWz95kXtrQZ3gInOAacjD0XncyN7v5pPTSoZMGZwrf77bq
 ojnKCnMZQaHDHpB1O0Prjyo1ZBAko/CF9Y4ZnCpRYuEKpfZSLOOhEfaUoBOkyl0hfbYH
 /y0EbMsU+WTvOPTeLUkUb/GCaUkM+hogrvOPr0aQ+lQO5LZTKrowtWpzOjhUoQbnJkPE
 q+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=osPC7nggXKqJCgggBesqx8Y0buQDmZALkohv6+cRgp8=;
 b=3zgL1inRWYQYVGlp2du7l6kfhsCoL6bwJ+7AWAMow+75BTpd37ipMYbIsoPMxVMnat
 /zh2JSe2xaiFEu1P7vrnhXvS48pCLtZUkrYL2pyVeFaq7KQT5WEIEYF8iLgTw1XHW4N0
 gNhLLcl8+hB/PtU2UXf1Ky4dykSei33ISGWfYfVOyReDp/SPJuTDnZVJKoCwL8KtNB0u
 4hHVOPh4Jo+Tggi4YV0RaU3PHVzLpvF1SyxxOjT+ruufsex3HLBNAypW7q6RpcxCT/Et
 04ioXv+EQt5uYTlpC52GQIadpXSXJ66qbkLOLL66ynZEaJwHlAh/9esMZjOUvb3Vy+Y0
 JmXg==
X-Gm-Message-State: AOAM532yrilA4efriYzHI7McDOKRtkzZwUm3F4kvSnA5WZYaB5z4lvp6
 Fq+/rDgVcX6UhoqaZe8hZzmogA==
X-Google-Smtp-Source: ABdhPJxW6RZmoRdg9h0UIzsoBpR2KmQ5DeD1hic3gg2SxUODs8OxB0D6TTPV4Sd5S7S435+Z44zw3A==
X-Received: by 2002:a05:6512:4004:b0:479:1d77:4e43 with SMTP id
 br4-20020a056512400400b004791d774e43mr18757090lfb.537.1654774309942; 
 Thu, 09 Jun 2022 04:31:49 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 d29-20020a0565123d1d00b00478f2325fbbsm4180147lfv.282.2022.06.09.04.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 04:31:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH] drm/msm/hdmi: fill the pwr_regs bulk regulators
Date: Thu,  9 Jun 2022 14:31:48 +0300
Message-Id: <20220609113148.3149194-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Conversion to use bulk regulator API omitted filling the pwr_regs with
proper regulator IDs. This was left unnoticed, since none of my testing
platforms has used the pwr_regs. Fix this by propagating regulator ids
properly.

Fixes: 31b3b1f5e352 ("drm/msm/hdmi: use bulk regulator API")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 992d29f75008..c66e857ef20e 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -180,6 +180,9 @@ static struct hdmi *msm_hdmi_init(struct platform_device *pdev)
 		goto fail;
 	}
 
+	for (i = 0; i < config->pwr_reg_cnt; i++)
+		hdmi->pwr_regs[i].supply = config->pwr_reg_names[i];
+
 	ret = devm_regulator_bulk_get(&pdev->dev, config->pwr_reg_cnt, hdmi->pwr_regs);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to get pwr regulator: %d\n", ret);
-- 
2.35.1

