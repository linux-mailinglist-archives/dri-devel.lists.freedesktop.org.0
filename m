Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 316CD5164E4
	for <lists+dri-devel@lfdr.de>; Sun,  1 May 2022 17:12:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF14510F246;
	Sun,  1 May 2022 15:12:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B57F310F23B
 for <dri-devel@lists.freedesktop.org>; Sun,  1 May 2022 15:12:25 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id l19so15843087ljb.7
 for <dri-devel@lists.freedesktop.org>; Sun, 01 May 2022 08:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QgI1RLE4QjZBMdfYSm+1pfZAQh9ERx+LC2dX8V73DIk=;
 b=Sk5V9+hcGZ2vhjdPvbMVdA2+0QSRX1JUp4+W00RgJTYiFeJzairgk6e+bRMqd5TTpx
 t7dupZa/pDOL2bo2/Rh1F5D1OwYXlchvU/px8KGfuosWGXERh744o3ETZ3ktbDOhELR3
 6lqzQiKrlgx7U4+eysp3o/9fRYtUEv6G9j53fgiappsQgPdPIsevbIha1gX+BLGaULt6
 Uv1vqxxRJp38wJjIY2NyrgF/AiP/IlQUlsEA87onHuioBp+JczYNU0k7e/8Dbu4jq6ZR
 7pVejmb0NAH7cmk1DX/iV9AQw2UoabyeBQGLQv3Kbf39BJFMe+Ea6aa31Ve+/gY4K4gn
 xPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QgI1RLE4QjZBMdfYSm+1pfZAQh9ERx+LC2dX8V73DIk=;
 b=ImntVCpFGmym0IKb7Og93ui7lOsBf/NCDARi/0MN0nJmz3od8g1dNcYCMRzBMu7KfO
 D58eH/22lQxvXvjItpH7EH6/svB1Adl30bcaFeHsRjadYivjOPjTvW8P2PBpICE4JIhR
 Y18v8cbc3q478dTe5Wizet/Wb5llrArKCcAPlYog/vjE6E6KpnBRsleJUpSOiDEwUAg0
 HC3BglsDHaCQNCQZI0l7AC1AtDTPnDMEV5zejUeR1pdZfclsucvJ+AwKYZ0ZMDVGUESX
 jM3aqu4X5nUkzYHHMxzaWZwqJube2OCIhuUGwMcpuuz0OsmuS7Lp+ci6Bkle0AqTCnQk
 8udA==
X-Gm-Message-State: AOAM532fitQ2/z5sIrYntzK8DaFIPuDFq96qyq32QgFMhQfiKqHhbNpx
 YXzogW9M2WwZF32EiAFcN+mw+g==
X-Google-Smtp-Source: ABdhPJyc3fJfnPgQHWznkOtDdnF03pldZtT/k0xHZMBcfFyaS2gkFMw+G1J2k5EXTxVwhD08Qnwz4Q==
X-Received: by 2002:a05:651c:54a:b0:250:5b67:b7b6 with SMTP id
 q10-20020a05651c054a00b002505b67b7b6mr565451ljp.305.1651417944069; 
 Sun, 01 May 2022 08:12:24 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 l16-20020ac25550000000b0047255d210dbsm461975lfk.10.2022.05.01.08.12.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 May 2022 08:12:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 3/3] drm/panel: drop DSC pps pointer
Date: Sun,  1 May 2022 18:12:20 +0300
Message-Id: <20220501151220.3999164-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220501151220.3999164-1-dmitry.baryshkov@linaro.org>
References: <20220501151220.3999164-1-dmitry.baryshkov@linaro.org>
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
Cc: Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Complete the move of DSC data pointer from struct drm_panel to struct
mipi_dsi_device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/drm/drm_panel.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index d279ee455f01..1ba2d424a53f 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -179,13 +179,6 @@ struct drm_panel {
 	 * Panel entry in registry.
 	 */
 	struct list_head list;
-
-	/**
-	 * @dsc:
-	 *
-	 * Panel DSC pps payload to be sent
-	 */
-	struct drm_dsc_config *dsc;
 };
 
 void drm_panel_init(struct drm_panel *panel, struct device *dev,
-- 
2.35.1

