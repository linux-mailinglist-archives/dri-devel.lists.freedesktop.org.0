Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6210D5F219B
	for <lists+dri-devel@lfdr.de>; Sun,  2 Oct 2022 08:46:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1063210E14F;
	Sun,  2 Oct 2022 06:45:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A2810E0E5
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Oct 2022 06:45:48 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id dv25so16503785ejb.12
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Oct 2022 23:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=I6XMIDzmAb5OEYRQrNrBJ64J1RkMPb1xdg1o6LLrqS4=;
 b=kdPlUwALYdNbkW9cx2XLVNwgOxrzhu3xLLiNM5FmcdjmtgSxDjZiXivE9cURSlKI9G
 THB25Gxkx5t8suAAn8LL2pI7YADY+GVOgVmXbiI2zDF9bH2yHej+i0+hvqZxj0Akp/p5
 uh/tBzNaQX2p0eFbQeZw5FnMylVKKnY0W1Xc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=I6XMIDzmAb5OEYRQrNrBJ64J1RkMPb1xdg1o6LLrqS4=;
 b=kzEyaj6ieCfqWd/uyHOw9nFUtaChFHFdJkgpBeFoYmadzrh4KObc0XxjO4v/alrtKq
 LXnHMxIPB4sLOy1UIhwV4uqwdvEUTl/Wm6mu0OkZcyy7UOcMR8Ra49KItM6g6Nbzz4Yi
 h5lvFv+wjr92lL1uwZ8W44ujTty4VXiKB4JbyhizAZ95EIK7CXLKjPPVWq6LKs9Oybex
 Y77TRYNNzc7YwjwYmCn0WnIqZ5EGrCDXPE1kQdCf/ed2OdBb+jfQv+YWfZAOotV+ll1/
 26ZtB1Gt66BZq6/09o3u/2NhuAK87OvO3HNvqKADAxlEsgTAR3bB85CXUWrT4TaOW2SD
 t1Rg==
X-Gm-Message-State: ACrzQf1c+jaJioeF9q5EmbX6GLO3ykeBVlvR38Q4C+WnpSazWiIpQaFS
 bpStZ+ZubIwzXM0DE1Tbpc1fdQ==
X-Google-Smtp-Source: AMsMyM42Y13+9SuPHtB+8bbihrWVsma1thKzuBn20iHav0eL1jLmBw0Y9w2/3o+fg6AJtnqVC042IA==
X-Received: by 2002:a17:907:2c67:b0:77d:740a:e9b1 with SMTP id
 ib7-20020a1709072c6700b0077d740ae9b1mr11198850ejc.614.1664693146999; 
 Sat, 01 Oct 2022 23:45:46 -0700 (PDT)
Received: from panicking.. ([109.52.206.103]) by smtp.gmail.com with ESMTPSA id
 26-20020a170906329a00b0077f5e96129fsm3569894ejw.158.2022.10.01.23.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 23:45:46 -0700 (PDT)
From: Michael Trimarchi <michael@amarulasolutions.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [RFC PATCH 2/4] phy: rockchip: Add inno_is_valid_phy_mode
Date: Sun,  2 Oct 2022 08:45:38 +0200
Message-Id: <20221002064540.2500257-3-michael@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221002064540.2500257-1-michael@amarulasolutions.com>
References: <20221002064540.2500257-1-michael@amarulasolutions.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-rockchip@lists.infradead.org,
 Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function is used to avoid to enable clock on the hardware
if the mode requested is invalid

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
 .../phy/rockchip/phy-rockchip-inno-dsidphy.c  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
index 630e01b5c19b..644cf73cfd53 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
@@ -217,6 +217,20 @@ static void phy_update_bits(struct inno_dsidphy *inno,
 	writel(tmp, inno->phy_base + reg);
 }
 
+static int inno_is_valid_phy_mode(struct inno_dsidphy *inno)
+{
+	switch (inno->mode) {
+	case PHY_MODE_MIPI_DPHY:
+		break;
+	case PHY_MODE_LVDS:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+};
+
 static unsigned long inno_dsidphy_pll_calc_rate(struct inno_dsidphy *inno,
 						unsigned long rate)
 {
@@ -495,6 +509,11 @@ static void inno_dsidphy_lvds_mode_enable(struct inno_dsidphy *inno)
 static int inno_dsidphy_power_on(struct phy *phy)
 {
 	struct inno_dsidphy *inno = phy_get_drvdata(phy);
+	int ret = 0;
+
+	ret = inno_is_valid_phy_mode(inno);
+	if (ret)
+		return ret;
 
 	clk_prepare_enable(inno->pclk_phy);
 	clk_prepare_enable(inno->ref_clk);
-- 
2.34.1

