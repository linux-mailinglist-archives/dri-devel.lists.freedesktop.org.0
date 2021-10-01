Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E53E41F368
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 19:42:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 419A06EE7D;
	Fri,  1 Oct 2021 17:42:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7184A6EE83
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 17:42:20 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 97-20020a9d006a000000b00545420bff9eso12451573ota.8
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 10:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RuDmOgPfw7NqoydBG9DQd34tvaItfS8ZKq0v6QDg/FY=;
 b=XLFHevB6WrVgB1k383+Eu2L6o1qbyh58b6SA8R/5BAw8TC7lyqv5IHXHTh7gCmKLsD
 JtQJBcH+5/FlXZLnaln8on35bnRb9B7YlTtjle+vzTyxT191syLSAlrcBtl/HONyMZ5L
 OjhVF911PC8tk7jBqUUWTHpKZ2JcO4pvyNFhhZFz66ffzBIJdteqYwJbMYHqHhgrBR5/
 mINS3p9w6Jerb7cqf9Q6f2tv6/iw0CxHxcDrldyOOyDlZfSqqEDcgp/SjJV2EvHNzoD8
 Fn2r1P+gRCnNtt6UB9Edv2Guq8nw48v+1tcem18VUIAqkCcywLDGzRjzLEEBavkmiOaq
 j97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RuDmOgPfw7NqoydBG9DQd34tvaItfS8ZKq0v6QDg/FY=;
 b=VrLc7b9J8Lu2cc9Q3QQq4MdD8Ga7KgebnvqrzaVGmSAt0sX2fn4L/7tBpNxWqDSI0B
 Lz7Q2ok3Yw6w8bGmN9tnKCPve4n+EVsVrSvPGHsvRE5215X/HLJgLyaIwWeELlGWVMPZ
 0Rpm0JIP+f5cB7qVlFChP8FW8gwbLoiTXSHv35mdntr2WOLzFPOMd9nyBrZVrS8IZun9
 MdcGmniTGW4UjaldYHn6ECRCNceo8LvRcf3ekpW/p8qzC2ws3ZDbrTBP2ih99A/yWGNC
 6aw046PwVrKq97sqT3VQIx4zPpUM4pk2fJqj1bfQrGpwVtXIwR82plbHXK4CgMALsUqH
 hR6g==
X-Gm-Message-State: AOAM530SLvK0KeH5suSoNVw+yhiNIi+HwEp9BOjyKrEcfjinb2AYjRk+
 7GUKWX5tjgXHPWiFp7Bapcxl/Q==
X-Google-Smtp-Source: ABdhPJws9faHBQvlTIfIFjLeXXFXgk7jiuKKfBY2CwB4kFziy9psiZ97T1gAtt89z7WID9l5hdsO1Q==
X-Received: by 2002:a05:6830:310c:: with SMTP id
 b12mr11691000ots.193.1633110139673; 
 Fri, 01 Oct 2021 10:42:19 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 u15sm1369264oon.35.2021.10.01.10.42.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:42:19 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>, Tanmay Shah <tanmay@codeaurora.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] drm/msm/dp: Allow sub-regions to be specified in DT
Date: Fri,  1 Oct 2021 10:44:00 -0700
Message-Id: <20211001174400.981707-6-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211001174400.981707-1-bjorn.andersson@linaro.org>
References: <20211001174400.981707-1-bjorn.andersson@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Not all platforms has P0 at an offset of 0x1000 from the base address,
so add support for specifying each sub-region in DT. The code falls back
to the predefined offsets in the case that only a single reg is
specified, in order to support existing DT.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- None

 drivers/gpu/drm/msm/dp/dp_parser.c | 49 +++++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index 1f084b2b5bd3..4d6e047f803d 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -50,18 +50,45 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
 	if (IS_ERR(dss->ahb.base))
 		return PTR_ERR(dss->ahb.base);
 
-	if (dss->ahb.len < DP_DEFAULT_P0_OFFSET + DP_DEFAULT_P0_SIZE) {
-		DRM_ERROR("legacy memory region not large enough\n");
-		return -EINVAL;
-	}
+	dss->aux.base = dp_ioremap(pdev, 1, &dss->aux.len);
+	if (IS_ERR(dss->aux.base)) {
+		/*
+		 * The initial binding had a single reg, but in order to
+		 * support variation in the sub-region sizes this was split.
+		 * dp_ioremap() will fail with -ENODEV here if only a single
+		 * reg is specified, so fill in the sub-region offsets and
+		 * lengths based on this single region.
+		 */
+		if (PTR_ERR(dss->aux.base) == -ENODEV) {
+			if (dss->ahb.len < DP_DEFAULT_P0_OFFSET + DP_DEFAULT_P0_SIZE) {
+				DRM_ERROR("legacy memory region not large enough\n");
+				return -EINVAL;
+			}
+
+			dss->ahb.len = DP_DEFAULT_AHB_SIZE;
+			dss->aux.base = dss->ahb.base + DP_DEFAULT_AUX_OFFSET;
+			dss->aux.len = DP_DEFAULT_AUX_SIZE;
+			dss->link.base = dss->ahb.base + DP_DEFAULT_LINK_OFFSET;
+			dss->link.len = DP_DEFAULT_LINK_SIZE;
+			dss->p0.base = dss->ahb.base + DP_DEFAULT_P0_OFFSET;
+			dss->p0.len = DP_DEFAULT_P0_SIZE;
+		} else {
+			DRM_ERROR("unable to remap aux region: %pe\n", dss->aux.base);
+			return PTR_ERR(dss->aux.base);
+		}
+	} else {
+		dss->link.base = dp_ioremap(pdev, 2, &dss->link.len);
+		if (IS_ERR(dss->link.base)) {
+			DRM_ERROR("unable to remap link region: %pe\n", dss->link.base);
+			return PTR_ERR(dss->link.base);
+		}
 
-	dss->ahb.len = DP_DEFAULT_AHB_SIZE;
-	dss->aux.base = dss->ahb.base + DP_DEFAULT_AUX_OFFSET;
-	dss->aux.len = DP_DEFAULT_AUX_SIZE;
-	dss->link.base = dss->ahb.base + DP_DEFAULT_LINK_OFFSET;
-	dss->link.len = DP_DEFAULT_LINK_SIZE;
-	dss->p0.base = dss->ahb.base + DP_DEFAULT_P0_OFFSET;
-	dss->p0.len = DP_DEFAULT_P0_SIZE;
+		dss->p0.base = dp_ioremap(pdev, 3, &dss->p0.len);
+		if (IS_ERR(dss->p0.base)) {
+			DRM_ERROR("unable to remap p0 region: %pe\n", dss->p0.base);
+			return PTR_ERR(dss->p0.base);
+		}
+	}
 
 	io->phy = devm_phy_get(&pdev->dev, "dp");
 	if (IS_ERR(io->phy))
-- 
2.29.2

