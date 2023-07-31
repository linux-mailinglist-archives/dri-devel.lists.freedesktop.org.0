Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB67276940A
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 13:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE6F10E263;
	Mon, 31 Jul 2023 11:01:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7470F10E262
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 11:00:53 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-26854159c05so2475045a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 04:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=edgeble-ai.20221208.gappssmtp.com; s=20221208; t=1690801253; x=1691406053;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BDpzgt3yf1dnhEnhafA21d4732XFCABNZPAtKuamjQM=;
 b=gR4DCj7EXtzZprnzrujUBpg/o6L59rnF3hNYEULV55G7XhnCZrfw49mDoyI/KOanyN
 SH7ro8/nPK1ZfvoA5jxxriXNoOa0xILmw+3uwpddG+9ef2iirdSN7ZPdLlxDX+NgMr4h
 QbmZDqOdom6dYdkb8rBCyUJOr2zXMokO92dqiTSrrmHR/OZcwDQyEPN5O+Vkr1CJ7PEX
 ndY4jGguGbbEXNLWBt+OATfh4rxk8OpY0NB1Df86ivsggUPCqnBsqwb6RHh/sDKqRxI2
 QTdB+tA0OiGZf33HHpeikiXFX0hvquzm51CfUhEncngGh7p6RqQVe4IfC0xgqUBu91wl
 Pf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690801253; x=1691406053;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BDpzgt3yf1dnhEnhafA21d4732XFCABNZPAtKuamjQM=;
 b=erw1CGMm3yNOywXoD+ukrkWQRz6OG2++ZSpWWZ9lk4UiEDgajB2MzV9tFwiGoFA2bT
 MbXCynZbTI8EzMEIhL5ey5NF1+xdIEv4tUbDJlUZANKyX/WGw2VFWCPIZ5LTisHbCnjU
 0TdMa77Repif5ZSgSOroMwRK3af+dWzvl8jtgvvB+JOuUVBdpwPCOSczoCoV8azMI2x+
 LoCj40O1jNhj9yykdUO2KyUaWbtQGsA2GFPvxiEIZCpLfySHsHY+GbaY8g3PBbHPDo8D
 QgJ2x9fUSOzao249SBspJHKSJ63tQuC/8R5iCRvvZKDn3daEQxTbSaczX+YvTgG2FSKy
 x0Lw==
X-Gm-Message-State: ABy/qLaNJviaWUVnNhy2i2nANfsfgHTLXHb+5dXCaXnHOCob4HkMPuUl
 c/pVYYkpY2X0V9GAuWbGqu9mfw==
X-Google-Smtp-Source: APBJJlFg0DC2IUqYvRu71L/g9OybK4oJw+Kju3byUa8K22Vb3WOpYfUiLi+3ql8thLtiJM0WvylDUw==
X-Received: by 2002:a17:90b:3b44:b0:262:d661:2963 with SMTP id
 ot4-20020a17090b3b4400b00262d6612963mr8657626pjb.39.1690801253045; 
 Mon, 31 Jul 2023 04:00:53 -0700 (PDT)
Received: from localhost.localdomain ([49.205.243.15])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a1709028c8e00b001b1a2c14a4asm8281096plo.38.2023.07.31.04.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 04:00:52 -0700 (PDT)
From: Jagan Teki <jagan@edgeble.ai>
To: Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: [PATCH 08/14] drm/rockchip: dsi: Add rv1126 MIPI DSI support
Date: Mon, 31 Jul 2023 16:30:06 +0530
Message-Id: <20230731110012.2913742-9-jagan@edgeble.ai>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230731110012.2913742-1-jagan@edgeble.ai>
References: <20230731110012.2913742-1-jagan@edgeble.ai>
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
Cc: Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@edgeble.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RV1126 MIPI DSI supports V1.2 DPHY with 4 lanes and 1Gbps transfer
rate for lane.

Add support for it.

Signed-off-by: Jagan Teki <jagan@edgeble.ai>
---
Cc: dri-devel@lists.freedesktop.org
Cc: Sandy Huang <hjc@rock-chips.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>

 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 0100162a73b2..8bafb2a2747f 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -198,6 +198,11 @@
 #define RK3568_DSI1_TURNDISABLE		BIT(2)
 #define RK3568_DSI1_FORCERXMODE		BIT(0)
 
+#define RV1126_GRF_DSIPHY_CON		0x10220
+#define RV1126_DSI_FORCETXSTOPMODE	(0xf << 4)
+#define RV1126_DSI_TURNDISABLE		BIT(2)
+#define RV1126_DSI_FORCERXMODE		BIT(0)
+
 #define HIWORD_UPDATE(val, mask)	(val | (mask) << 16)
 
 enum {
@@ -1651,6 +1656,18 @@ static const struct rockchip_dw_dsi_chip_data rk3568_chip_data[] = {
 	{ /* sentinel */ }
 };
 
+static const struct rockchip_dw_dsi_chip_data rv1126_chip_data[] = {
+	{
+		.reg = 0xffb30000,
+		.lanecfg1_grf_reg = RV1126_GRF_DSIPHY_CON,
+		.lanecfg1 = HIWORD_UPDATE(0, RV1126_DSI_TURNDISABLE |
+					     RV1126_DSI_FORCERXMODE |
+					     RV1126_DSI_FORCETXSTOPMODE),
+		.max_data_lanes = 4,
+	},
+	{ /* sentinel */ }
+};
+
 static const struct of_device_id dw_mipi_dsi_rockchip_dt_ids[] = {
 	{
 	 .compatible = "rockchip,px30-mipi-dsi",
@@ -1664,6 +1681,9 @@ static const struct of_device_id dw_mipi_dsi_rockchip_dt_ids[] = {
 	}, {
 	 .compatible = "rockchip,rk3568-mipi-dsi",
 	 .data = &rk3568_chip_data,
+	}, {
+	 .compatible = "rockchip,rv1126-mipi-dsi",
+	 .data = &rv1126_chip_data,
 	},
 	{ /* sentinel */ }
 };
-- 
2.25.1

