Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8682913F0
	for <lists+dri-devel@lfdr.de>; Sat, 17 Oct 2020 21:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 449636E21D;
	Sat, 17 Oct 2020 19:04:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC236E197
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 19:03:42 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id a9so4828920lfc.7
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 12:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IyCk1ZWUW2yfST0VQTlsdKN7P4gFoDnnFZaxUhGVXFk=;
 b=udF8VfgwCPwP4mDSZHxOTUeoZ+UKdrud+AcDZ7nGlDNmOij56qY7u6O/vOUfoLAlLx
 q99/2Tu5CSl5pBIWShz33MD1FCWuvWmBO5h3je6KlwzUpF/SQJr9V+V3DAvWEkKWW3b9
 WXIMDkzbL8BFrJ+3LB5TtdMWnsVDgd+wsJIf4or0/zGTngtWrgcjm1P3wUSsXEgOjBA2
 2rYOfe1kAZgFvou5mdtN9j5VnZ9QFx0/JSBvjaOkQjGi7f0+YxslntsR+nK1V6HOUifD
 oDfCAXjQa6YSU34Kg5a3WPLBYvNRf8wokKH7+/BARxjlxj4y/hhmo0q8dOqWPvqsTIoz
 eyvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IyCk1ZWUW2yfST0VQTlsdKN7P4gFoDnnFZaxUhGVXFk=;
 b=gwJeTl2mAq7LSl6KZDEmU3xqJ/yg/FGREtx4o+qsIbC0Qhf/G7Tek8dC9ioLyglzlz
 FHqPik+/mhui3f+sC0eXTnP0H28HEflxWWWJ1qxkWqraGTeGuiu4OB5Bmz21ajqnRYhv
 B7zxTG1/Iz8MDXnES1+0jyg/rvukv4uRH9y+iNKx6KAYGlITAZaxMHjTn5CcdwEJKmmb
 rjEEH5fFGPm46AAdd0qOz+lpSWCKryYURj00mqRYSfI6MHDxP9X5RgHk9s2cA1uaq2L6
 AbYU38rmzBTQu8GDBnzUpdtC9EhSpfTrGh9L5stWaX+vVLQA3qdrApqe1egmsYpX3Gku
 eZsw==
X-Gm-Message-State: AOAM5338Qcmz7yugnVaQvcNAmjyvej6ufWLJ4P3Abk/zxkjsVWXMVCYh
 ARmnVbBZ/1N5rAgXPPL53N4bIA==
X-Google-Smtp-Source: ABdhPJxdJHhhA2b0ocyLA0V5KO8bb02eV68EYMcbBlYFjsRhr+aGrSQz9/7RsEN90Os+Uk1n7bdfyA==
X-Received: by 2002:a19:514:: with SMTP id 20mr14877lff.512.1602788620693;
 Thu, 15 Oct 2020 12:03:40 -0700 (PDT)
Received: from eriador.lan ([94.25.229.2])
 by smtp.gmail.com with ESMTPSA id 71sm1309781lfm.78.2020.10.15.12.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2020 12:03:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH 3/4] drm/msm/dsi_phy_7nm: implement PHY disabling
Date: Thu, 15 Oct 2020 22:03:31 +0300
Message-Id: <20201015190332.1182588-3-dmitry.baryshkov@linaro.org>
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
Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 255b5f5ab2ce..79c034ae075d 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -200,7 +200,28 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 
 static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
 {
-	/* TODO */
+	void __iomem *base = phy->base;
+	u32 data;
+
+	DBG("");
+
+	if (dsi_phy_hw_v4_0_is_pll_on(phy))
+		pr_warn("Turning OFF PHY while PLL is on\n");
+
+	dsi_phy_hw_v4_0_config_lpcdrx(phy, false);
+	data = dsi_phy_read(base + REG_DSI_7nm_PHY_CMN_CTRL_0);
+
+	/* disable all lanes */
+	data &= ~0x1F;
+	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_CTRL_0, data);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_LANE_CTRL0, 0);
+
+	/* Turn off all PHY blocks */
+	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_CTRL_0, 0x00);
+	/* make sure phy is turned off */
+	wmb();
+
+	DBG("DSI%d PHY disabled", phy->id);
 }
 
 static int dsi_7nm_phy_init(struct msm_dsi_phy *phy)
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
