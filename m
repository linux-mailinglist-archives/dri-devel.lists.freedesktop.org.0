Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6F8B0081D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 18:08:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F7710E240;
	Thu, 10 Jul 2025 16:08:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eHrRaT2M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA89110E91D
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 16:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752163695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fJQSlBKA2g43dFqB6TuRxKz7xFAHDfxLS8SwGXWJVrM=;
 b=eHrRaT2M77r8xj16EhtxLls/jm31KizQv/R6TZ+uUSAosi65kgwLFDgpmGj53nwkEycMfB
 w4zxOhqSjOxXft2prjg/axSdclEB6Do9XYadq9JolUNaSTlO810plxU3JJOTSBTHy4O/Vn
 ubzcN7qkCbvMrfOAdUYDFqRXiLHVMQ8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-flnLtWceOAyNDBgf-BLQgA-1; Thu, 10 Jul 2025 12:08:14 -0400
X-MC-Unique: flnLtWceOAyNDBgf-BLQgA-1
X-Mimecast-MFC-AGG-ID: flnLtWceOAyNDBgf-BLQgA_1752163694
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c955be751aso185388685a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 09:08:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752163694; x=1752768494;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fJQSlBKA2g43dFqB6TuRxKz7xFAHDfxLS8SwGXWJVrM=;
 b=ZsgRlP44UUQLjNcI/BTqQF+7mJmRcJtPSlzMXKPk9H8A4bLsu+jgdClaf9FIcmanIZ
 lXoociNyYAvFjUmozj4hwLtyHnPoVNlubwQfgJmzr0FiycY5/xHxY+pESgWnqO21rWRx
 qcfjLBwvBUgSWda6tAoQpqA5S+jaxztzPWKYBYjfLzKWxcKhqerwNC8aFW2KK5gqnlNY
 RDEvFuiE9YJh7/spiN7HBFcY+IVM7hjoRqKaShDU8JQ1vRN0NjvurBLK/wavzKwTNhVG
 oiRaQ+EZs3sJR5YYPe1rEJiRXvDUkYUY89e1aKfbALOZgaO5IKHCCWIkJEDaB+pBpr+S
 1KMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtEQ0uAvwZ3hkZkShmgsSjktMfe1Jb5jbTrA5WeJm3NsHrg4+H/SN23ikpjsBy/fiGdTJkgEpAf9Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPeaN+E02YojeFknBZRMFyjcCSLyeAhGLB6HlJrCEfaOPyX3/m
 0IL15eysVfm3PGYjGfkPIdYXZtQJkf/xH7DD10dUzz43rC2tzDqaXLM2AzO+VUuyuzrpaG+d/+q
 MmCiJeJVlZov2L2lQ65RDsyfFpGuNRVHTs9jUHqk0BjDEyo8WToVhHrkO2rCGlMMVqfxWlA==
X-Gm-Gg: ASbGncv/uvJWtl6cWbkw3c0s5SSaQ8It38xcagI5osOOZJDv/55uZCpwe8WhpDK9H/f
 +uSSSkgsUpnPih1lSRYvOYTYT671xxR9WVF8bD4wuRpGYJKOP4iCWb69DpgC/yWrQx5sD7kOt7N
 KycjXpqvtQR4fnPqo88r0Y2xymWTGlYtxzmqV3Yd6OOHEY9tpkL2+ksfdzlAxo6r7jaU+BJTFVY
 bUgpGs7UnWXkn++IgMGFHT3xN7uSOUm9cAFgXOfurv7qjrXJ8NW9LyiOtHfYYGRYOgC7HKyuGyN
 GJrR/sK2xzEuBIWDvsmA9KMfgTaT69mUEwXFw5l+PE1ZnVYK4AwewiE3jz5U
X-Received: by 2002:a05:6214:d0f:b0:704:7dbd:2075 with SMTP id
 6a1803df08f44-7048b79dbe8mr93046426d6.0.1752163694055; 
 Thu, 10 Jul 2025 09:08:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEInLStwo1lDSg7F85FMOE58AhksEafUcDFpNGGZphskAtBc03MrN1OcVT08c+bAzB2AxSVXQ==
X-Received: by 2002:a05:6214:d0f:b0:704:7dbd:2075 with SMTP id
 6a1803df08f44-7048b79dbe8mr93045996d6.0.1752163693579; 
 Thu, 10 Jul 2025 09:08:13 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-70497d39749sm9670216d6.58.2025.07.10.09.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 09:08:12 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:07:12 -0400
Subject: [PATCH 2/9] phy: mediatek: phy-mtk-hdmi-mt2701: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-phy-clk-round-rate-v1-2-0ff274055e42@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752163685; l=1429;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=iJAJsOBdjX5yU2h75u6+b08f3YAfQGGv0k5DSS+fdqc=;
 b=gM9Vog/PjfK+PD7kK6yqe+FHMUUn8OmRYlp0k9f9lt5ka6hie/ovQ2orPiYAUbVKPreNvVHLO
 BW8lUYOkRwPB/LUPMWdxoK3stAq+kbRSdWnBg6NGEyKUO9GNQDXxSDY
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oUyXBmFNqq68LoDUNi0ATqfZEgHMf0rpYZ5p_BPioPk_1752163694
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
 drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
index e51b2d13eab473dddace48c75c2a8d73c8c65635..b0b6497e7eedcb6867541b573d22156ded29a4d5 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
@@ -90,10 +90,10 @@ static void mtk_hdmi_pll_unprepare(struct clk_hw *hw)
 	usleep_range(80, 100);
 }
 
-static long mtk_hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *parent_rate)
+static int mtk_hdmi_pll_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
-	return rate;
+	return 0;
 }
 
 static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -170,7 +170,7 @@ static const struct clk_ops mtk_hdmi_phy_pll_ops = {
 	.prepare = mtk_hdmi_pll_prepare,
 	.unprepare = mtk_hdmi_pll_unprepare,
 	.set_rate = mtk_hdmi_pll_set_rate,
-	.round_rate = mtk_hdmi_pll_round_rate,
+	.determine_rate = mtk_hdmi_pll_determine_rate,
 	.recalc_rate = mtk_hdmi_pll_recalc_rate,
 };
 

-- 
2.50.0

