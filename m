Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DEB291400
	for <lists+dri-devel@lfdr.de>; Sat, 17 Oct 2020 21:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 742BE6E255;
	Sat, 17 Oct 2020 19:04:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4351B6E199
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 19:03:44 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id m16so4258287ljo.6
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 12:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vhaZDdXwG9Htyy9xDjuNDYv8IjQyEGy8Xq6PwirKnX0=;
 b=EUNB8eg9424Pz3MhNKldl/Gb7ORKJB2IZF7A8HYSeXEkaXV1kyQYBUtA4NmwOfV2GJ
 C793nDdbvoFHUoSrofe6zkCe07kKkCOAXemj0ShENkt5VkAfIj1xJleAwSi1+QzlKBCN
 /VfsFU8ZZhlHu0gGnebxXcfAxvRMIWFL71Bo8nPSeFEWxzsd4jis1WuRXCRGIlLcwyxY
 HO8QoSjxBXYUVoWGmMhV77xRQF6q/m/Mw0U8xgItOHrDTMjcu4HFFcbN9KawKqv6VTqC
 ynuSUsoXiNMlzCO5Ds8xnCmY25YSDikVX1MU3aqHfkZu18+5A7wScX48zL6Nm92x6RJb
 ObIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vhaZDdXwG9Htyy9xDjuNDYv8IjQyEGy8Xq6PwirKnX0=;
 b=O/OEwbPK9tZva6037ilF6SeVk5WWzl9R4W6ToiaIZbdjPyaWX3zDS2LdL5mHQ5srmg
 7wh9ZgsiekW0niDEnxOOcbc67PteS5LDHP4KjQoB0k5BrEhiGZNX1iJJA3VWGa7/T91j
 Tj3SfbeulftKuSdKgjFsMau9UHtcrwPuV/x/lMszfLzLcdL5peGwNBpjre78y9VRBpwk
 anhllfqSI66evOIHwgUCUI4FApTwyu44tb1azwnWNqnc1fTVnIUb+rFHort+Mk9B38YQ
 3iXDfHyg8ERANEoIk7z476E93I0B7ezO+oEhD50JXHoTwEYCHIWdYct3nb/w7/nKq/yV
 hHzg==
X-Gm-Message-State: AOAM531ba2PvbE0428eF0uNPReHrwH0r5dwNUdpslF7R5+pEtp1mbYtC
 5Da1ODhsrJNjNV0Ema5CVlluVg==
X-Google-Smtp-Source: ABdhPJzOf/yetyToCB83zvZHrgJDHli/yZIfn5ryh53Ru5VXPFtzWszJqI2El1p0VvHgPBFP3Tt3XA==
X-Received: by 2002:a2e:9242:: with SMTP id v2mr62953ljg.115.1602788622679;
 Thu, 15 Oct 2020 12:03:42 -0700 (PDT)
Received: from eriador.lan ([94.25.229.2])
 by smtp.gmail.com with ESMTPSA id 71sm1309781lfm.78.2020.10.15.12.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2020 12:03:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH 4/4] drm/msm/dsi_phy_10nm: implement PHY disabling
Date: Thu, 15 Oct 2020 22:03:32 +0300
Message-Id: <20201015190332.1182588-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201015190332.1182588-1-dmitry.baryshkov@linaro.org>
References: <20201015190332.1182588-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 17 Oct 2020 19:04:47 +0000
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
Cc: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, Harigovindan P <harigovi@codeaurora.org>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement phy_disable() callback to disable DSI PHY lanes and blocks
when phy is not used.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: ff73ff194060 ("drm/msm/dsi: Populate the 10nm PHY funcs")
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 47403d4f2d28..d1b92d4dc197 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -192,6 +192,28 @@ static int dsi_10nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 
 static void dsi_10nm_phy_disable(struct msm_dsi_phy *phy)
 {
+	void __iomem *base = phy->base;
+	u32 data;
+
+	DBG("");
+
+	if (dsi_phy_hw_v3_0_is_pll_on(phy))
+		pr_warn("Turning OFF PHY while PLL is on\n");
+
+	dsi_phy_hw_v3_0_config_lpcdrx(phy, false);
+	data = dsi_phy_read(base + REG_DSI_10nm_PHY_CMN_CTRL_0);
+
+	/* disable all lanes */
+	data &= ~0x1F;
+	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_CTRL_0, data);
+	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_LANE_CTRL0, 0);
+
+	/* Turn off all PHY blocks */
+	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_CTRL_0, 0x00);
+	/* make sure phy is turned off */
+	wmb();
+
+	DBG("DSI%d PHY disabled", phy->id);
 }
 
 static int dsi_10nm_phy_init(struct msm_dsi_phy *phy)
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
