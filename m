Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 741FE3F7E87
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 00:25:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0176E435;
	Wed, 25 Aug 2021 22:25:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59FE66E432
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 22:24:48 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 x10-20020a056830408a00b004f26cead745so897916ott.10
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 15:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wf37F7O7IL2IiPzK/k4sYEedZBRYlQXH7AwChdDZqEk=;
 b=qKY0grhTmd1JFzstw/We1TyOjHL21kwORROQBGNIOsKhmgJ5FZoGmTYUjCbIM8G67x
 n4tBwYZqKSRGWF1MGtJ1RtydSWs2wX+tr2mp+/JKurF6qigvUymhUFBnaXuYbemDZzf3
 TFGjvYYxjOjQWn8qy2zoBnEQAUEUoPU1+gQAy85VWL7xU9mh5umeH1fR/UPX2k0bvpaP
 C6lvkEroI8JODXEvCDQlGL/BhaxMVJFaebbPRiWW6KbLIAM5sauRy8haub7N2VNobUOm
 tsbN63nRzwivjk0IaI1CWY1AGNsHlxLfbB4Ve06O+1B1M3nR0AjLOIrgV+2qOWWhEOrl
 JioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wf37F7O7IL2IiPzK/k4sYEedZBRYlQXH7AwChdDZqEk=;
 b=A0bCrpxotCaMSlcVV1gGr0/A97JfiJXFYMcIdg5PbElIx4K9NaJmhiHsHcK56ZgvSl
 Ugk2o51yoTk7y0Z28vJQa71A/c017/JbrtAxhMzDu2PwMPEnck4vo9Z5HnmWqHdx9Gkk
 IuDC/b4w8YrSjxe+BhR3BCvC1JGIDvLr4csJ4mwGH2i997TwhTsvHF2d4XymmSkj85hW
 0Brl1heMcUQT5oaOYFyuVzZ2TyDm4f+/PZoN9C1+D+knDWw0gM3T6WVRJhF4V831iATn
 AdtwAXGAfLYQHArbVvD4CXusdRy7TIWOLExyLpVIVAdYSHiCGU+/IAw5fdo45XvW6JLr
 NpxQ==
X-Gm-Message-State: AOAM533AubQ6cy60eWdOn+wO+LvuzZaKIQdbCHBnIGytzCQJ+ml8oLAA
 lNfu1p02XJgz89g72iq4vPANNw==
X-Google-Smtp-Source: ABdhPJyRF6UC73nLSrPPJbNIlI71Fmej//08g2MJkwieFV+8Zk2WWYZn/tRdfkCwlSb3kf7lHGIw0Q==
X-Received: by 2002:a9d:7a8a:: with SMTP id l10mr581214otn.256.1629930287645; 
 Wed, 25 Aug 2021 15:24:47 -0700 (PDT)
Received: from localhost.localdomain
 (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id u19sm263721oiv.28.2021.08.25.15.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 15:24:47 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>, Tanmay Shah <tanmay@codeaurora.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] drm/msm/dp: Refactor ioremap wrapper
Date: Wed, 25 Aug 2021 15:25:55 -0700
Message-Id: <20210825222557.1499104-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210825222557.1499104-1-bjorn.andersson@linaro.org>
References: <20210825222557.1499104-1-bjorn.andersson@linaro.org>
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

In order to deal with multiple memory ranges in the following commit
change the ioremap wrapper to not poke directly into the dss_io_data
struct.

While at it, devm_ioremap_resource() already prints useful error
messages on failure, so omit the unnecessary prints from the caller.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Dropped initialization of "res"
- Fixed devm_ioremap() return value check
- Dropped error prints (as devm_ioremap() already does that)

 drivers/gpu/drm/msm/dp/dp_parser.c | 30 ++++++++++--------------------
 drivers/gpu/drm/msm/dp/dp_parser.h |  2 +-
 2 files changed, 11 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index c064ced78278..215065336268 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -19,40 +19,30 @@ static const struct dp_regulator_cfg sdm845_dp_reg_cfg = {
 	},
 };
 
-static int msm_dss_ioremap(struct platform_device *pdev,
-				struct dss_io_data *io_data)
+static void __iomem *dp_ioremap(struct platform_device *pdev, int idx, size_t *len)
 {
-	struct resource *res = NULL;
+	struct resource *res;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	res = platform_get_resource(pdev, IORESOURCE_MEM, idx);
 	if (!res) {
 		DRM_ERROR("%pS->%s: msm_dss_get_res failed\n",
 			__builtin_return_address(0), __func__);
-		return -ENODEV;
+		return ERR_PTR(-ENODEV);
 	}
 
-	io_data->len = (u32)resource_size(res);
-	io_data->base = devm_ioremap(&pdev->dev, res->start, io_data->len);
-	if (!io_data->base) {
-		DRM_ERROR("%pS->%s: ioremap failed\n",
-			__builtin_return_address(0), __func__);
-		return -EIO;
-	}
-
-	return 0;
+	*len = resource_size(res);
+	return devm_ioremap_resource(&pdev->dev, res);
 }
 
 static int dp_parser_ctrl_res(struct dp_parser *parser)
 {
-	int rc = 0;
 	struct platform_device *pdev = parser->pdev;
 	struct dp_io *io = &parser->io;
+	struct dss_io_data *dss = &io->dp_controller;
 
-	rc = msm_dss_ioremap(pdev, &io->dp_controller);
-	if (rc) {
-		DRM_ERROR("unable to remap dp io resources, rc=%d\n", rc);
-		return rc;
-	}
+	dss->base = dp_ioremap(pdev, 0, &dss->len);
+	if (IS_ERR(dss->base))
+		return PTR_ERR(dss->base);
 
 	io->phy = devm_phy_get(&pdev->dev, "dp");
 	if (IS_ERR(io->phy))
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index 34b49628bbaf..dc62e70b1640 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -26,7 +26,7 @@ enum dp_pm_type {
 };
 
 struct dss_io_data {
-	u32 len;
+	size_t len;
 	void __iomem *base;
 };
 
-- 
2.29.2

