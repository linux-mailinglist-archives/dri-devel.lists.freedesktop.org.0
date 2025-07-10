Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F6DB00827
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 18:08:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D07EC10E920;
	Thu, 10 Jul 2025 16:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VdlOJHnU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 285C110E920
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 16:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752163714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jTOJwZJsmHoGcZ8h71+3z1fiOauF+CUgacJvRTAcORU=;
 b=VdlOJHnUZkTtNrDc25UOMa2zxqTSmYzR0PCSGFFDEO+hqX8EhSBvcX7u3gdVhS70+vYXVO
 OVxNrkIO0IR4oDPOS1Bbi1Fc0ex5tfYzdu2Dx2JXIwCUyvGPxG/68FR22NF8jG18oZwlcD
 PpGsbm/rIN71HLm6u/fb1jzlErC/7gc=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-sD4gyyt8PJKXlHsR0Nj9aw-1; Thu, 10 Jul 2025 12:08:32 -0400
X-MC-Unique: sD4gyyt8PJKXlHsR0Nj9aw-1
X-Mimecast-MFC-AGG-ID: sD4gyyt8PJKXlHsR0Nj9aw_1752163711
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-7048ed0751fso24494436d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 09:08:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752163711; x=1752768511;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jTOJwZJsmHoGcZ8h71+3z1fiOauF+CUgacJvRTAcORU=;
 b=t/c8fMtzhn8C92ugk+nP5RIabPgWBiZtmGEAfO6oibk6LHBOJDtM9MkKFDyVDO/s7V
 uVVR5clYHsh4NYOBt4TFi4D+QOM+07sSdk9c9V1MyY0BOgPURcq2ewEHyXDoEA4fZftg
 6IuCxKzcO11meIUDHWKR0DsUUbExFBU9baQutoRDToy6HhjpQ1KeJE+xDxBNH6w0vXKP
 pJDedrLj/4c8R2zXHbWMv437fkTy35eNOLcyQ5ufXlUtnEWKnPB6U1xjgthWvucJTzfU
 8/RILGFwpVzxCmTd94Eo5b9xOMQAndtVt7OIGE0WKBS4IkxZxbri3QMspMF0KQrsYXPA
 Oi8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDx3EAs9LpQwMraOaxQVL3WTsoq+FCEK8X8vAZ1bQ64iG0HF0NpKP/FP/cxLGDQJzDwluktGaM8F8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzq12g1KNJ05VxQDXXfiXSt9Q6TDwPZnPvmZMCwrKIp2+0q1S1S
 XdLLvehro+HB9xet63NZGxwa7m5OMaQ+avbqNOUZuzO1/J3dMiOf6FUYVGkxcgpeIzB1+bqSAEf
 r6AyZ9xeCJoGMQ1cWqlJyiLcXgEudE8/WBEkVOm+blSIn/3PDTihXKa3wS4BeUy40i9eHeQ==
X-Gm-Gg: ASbGncucSjdrZyk5shYx0610i7MH0yuf/O34Y7nsJ9eDUZxFM7K3Dib6ucumNPWf+cP
 w8ms7r2sPMvKQ7wHiTJw8P6TMB6sVio+XNeyXDpHc9te54/p8zKHzEXKB72osPiARrG6MCja2Yt
 1CfIlfOs1RuzXgMpKKL8U1AOHN/sqWHZlu+2ZnE5a4FoiB5iJLusIDOuI0Ctkreio5Pvzi8+PCP
 9cl3l+Hn3DQtOMBnsngaEqKxxr0D9ai8x0HdPbckA1n480mgROOiDSVz/2o4k9fG+iQDrL+X/Mb
 bIG9z3tlAwJPNybhVYYOQT+PBNq67VBRX1QhiOGfudPzurRG16nIAaRtfXFq
X-Received: by 2002:a05:6214:468f:b0:704:885e:bebf with SMTP id
 6a1803df08f44-704981edb41mr38252206d6.33.1752163711086; 
 Thu, 10 Jul 2025 09:08:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlqOGrQN8krksQLxHGl7XCXnHCMvXuYKuTeyW1zhM5hweEhYitnN6UMrP83jETXzN/T64C2g==
X-Received: by 2002:a05:6214:468f:b0:704:885e:bebf with SMTP id
 6a1803df08f44-704981edb41mr38251666d6.33.1752163710538; 
 Thu, 10 Jul 2025 09:08:30 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-70497d39749sm9670216d6.58.2025.07.10.09.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 09:08:29 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:07:19 -0400
Subject: [PATCH 9/9] phy: ti: phy-j721e-wiz: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-phy-clk-round-rate-v1-9-0ff274055e42@redhat.com>
References: <20250710-phy-clk-round-rate-v1-0-0ff274055e42@redhat.com>
In-Reply-To: <20250710-phy-clk-round-rate-v1-0-0ff274055e42@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, Maxime Ripard <mripard@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752163685; l=1629;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=pMJI6s5tTYu1BzJU7vvw5Y0iwaNTd3NH6yMHjsN8/cM=;
 b=0nPrE2c6cl5ohekNJUp1MPpsItdutqAcWnGrmBosgKM0YvNyBYPz4zo1bZfpAq6S3ivaSbkgi
 TWd7oICIP84Cvj784x11Hev/+JYsi8/Mx0kVOHPtXnwdacpkl9MVEHt
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: c4-K32CrmlzlqrsEVG3Rt-vx6f6KXIPug0_u7mkWrg8_1752163711
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/ti/phy-j721e-wiz.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/ti/phy-j721e-wiz.c b/drivers/phy/ti/phy-j721e-wiz.c
index ab2a4f2c0a5bf3aa4b77045f4da8b0ddcc079f7a..12dafb2bd49bc33c13dd49246bc26df082e3dd40 100644
--- a/drivers/phy/ti/phy-j721e-wiz.c
+++ b/drivers/phy/ti/phy-j721e-wiz.c
@@ -934,12 +934,15 @@ static unsigned long wiz_clk_div_recalc_rate(struct clk_hw *hw,
 	return divider_recalc_rate(hw, parent_rate, val, div->table, 0x0, 2);
 }
 
-static long wiz_clk_div_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *prate)
+static int wiz_clk_div_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct wiz_clk_divider *div = to_wiz_clk_div(hw);
 
-	return divider_round_rate(hw, rate, prate, div->table, 2, 0x0);
+	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
+				       div->table, 2, 0x0);
+
+	return 0;
 }
 
 static int wiz_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -958,7 +961,7 @@ static int wiz_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops wiz_clk_div_ops = {
 	.recalc_rate = wiz_clk_div_recalc_rate,
-	.round_rate = wiz_clk_div_round_rate,
+	.determine_rate = wiz_clk_div_determine_rate,
 	.set_rate = wiz_clk_div_set_rate,
 };
 

-- 
2.50.0

