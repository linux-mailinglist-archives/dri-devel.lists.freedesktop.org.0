Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F9CC3DD3A
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 00:26:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A69010EA09;
	Thu,  6 Nov 2025 23:26:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BzQNP56H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B14E410EA0B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 23:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762471612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r9SkuM/Zk54theYuUVPDuK/7cbD+hyZrLpLiRrTyy7g=;
 b=BzQNP56HBzj39E16hJinFDR/y4F67/XPuIDoL1pJ5be2GUIv6eYg7/Q1XA6/kXX3B00GNj
 c+1c/03UaXBV2lxJEMWeDwY+nhjxQ2r4Sj3wkUjWDt+5yD4VpWDcFx3nf09T0CpOSnAvCZ
 Jtkw4jr63g3D562vS9GeK3VQSYWbqBM=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-hErOvYnQN1u64-OIlbEyyg-1; Thu, 06 Nov 2025 18:26:51 -0500
X-MC-Unique: hErOvYnQN1u64-OIlbEyyg-1
X-Mimecast-MFC-AGG-ID: hErOvYnQN1u64-OIlbEyyg_1762471611
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-8803b5dc9b8so8613576d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 15:26:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762471611; x=1763076411;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=r9SkuM/Zk54theYuUVPDuK/7cbD+hyZrLpLiRrTyy7g=;
 b=EYFsFRi3UIWLb/vkChooQ0elWweSPXd7q1YhZtN0X8Yy1vAF1nkP9LYv5inicWF4Ry
 a5nM8Q87q6ynF7EDQAUapbJ+wPXsL+cwYhE5F6NbSU3oa8jaGpgWM22RCnUSO3RQgtWj
 HY+oYoOJP3jy/18t27AoM7/PtgYnwKwmJkdTtjlaoRMKNwxqGJ078nIknMgEoEBCl99/
 Wm20zynsDjTytX2TFB7h5uSCfmLcgxJjsQomMvycOGflTFGQBgVO0I8+7uiZJwrs+PIc
 i/Ppq7tgEOEHzA6UO9MSu+dxClVGZfYMhQBj4Q1wmyTv2HAOm5Isytetc9WF9FE8tmsY
 w53Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXisxhbSIzYO5C9sUok0KRTLSRcznDwmSxXDjGDYUc6C7s2zUE4wSyaU7HBWKYmvQESzmkVfStDlgw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJEauSeDN2+UOKriGplmaC7QGUdtMS8u7JdzPFSc4mexQsodh8
 c54MNB8Rf5I/RiL6reT1F4af30J2e0t7ZcKkUZay1Hw88mhCI+y8/SrLx4N67s9+ymgBaBQ2mjl
 5ae53Jr1z1VZOqHgEJuy0rPQpctHeBU+ebrLCBJK6GjnSBS0ZwKQo4ustIZVGrpx7xu9ilw==
X-Gm-Gg: ASbGncsZkQNGQZmg9tMmoJaewRNlz/lryhxgVr3v+2/ub/RxO7bL0UR5GZd8bKiz+vJ
 d7arl9RMWcAaIk/4n5yIg4E43VrJBxqnTZR2GhJBfG1BIY0+ZkWPwIBaUOi9jqAlfHu9XUZ9bYb
 bjMVxHnQV4gER4rq1GSi/dsdSbHLe1D5Xkp7QVflfk3zD++CQ6t5CQeg5TzrVPZk81v6HkpgPhV
 bW6SPAxDUZUvkv5qgxzJmNMUcZBLpSdBwRt7E2A3iO83+U7BVjsfeSy/k1hqstp809oUmDAtQUd
 rX0PZLfzpF6N24ZyH/yoGZ5wTwxP1nBRltCzwuUGP03zAEbwla7vTaPc4g1yvBBxv6RUx6f8AN0
 zgWg4ClRhVDmJXis6DbUJSRErRt0ODAXpED2vjg8Haw==
X-Received: by 2002:ad4:5ced:0:b0:796:5c30:b079 with SMTP id
 6a1803df08f44-8817678d8e7mr19319276d6.43.1762471611238; 
 Thu, 06 Nov 2025 15:26:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHSlSEV9dAuqFzCy0/F84dwpJ0FkW0yEvyVdQS2BVlZV8mmVJOC9OLuQQBUQWU2sDVef6rnHw==
X-Received: by 2002:ad4:5ced:0:b0:796:5c30:b079 with SMTP id
 6a1803df08f44-8817678d8e7mr19318886d6.43.1762471610821; 
 Thu, 06 Nov 2025 15:26:50 -0800 (PST)
Received: from [10.197.115.224] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88082a3aa91sm27389196d6.56.2025.11.06.15.26.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Nov 2025 15:26:50 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 06 Nov 2025 18:25:50 -0500
Subject: [PATCH v2 RESEND 4/9] phy: mediatek: phy-mtk-hdmi-mt8195: convert
 from round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20251106-phy-clk-route-rate-v2-resend-v1-4-e2058963bfb1@redhat.com>
References: <20251106-phy-clk-route-rate-v2-resend-v1-0-e2058963bfb1@redhat.com>
In-Reply-To: <20251106-phy-clk-route-rate-v2-resend-v1-0-e2058963bfb1@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, Stephen Boyd <sboyd@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1601; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=9vVtfY2SWJyaK316COu6cQ1f5v68xmVdCSUMuW44eRI=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ59RYoBp++/m+KnEwCw2Xzg4JMM1sv5LqlTfM8z3Ft1
 oPpKx5c7ihlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiTXqMDOsmKjWITF6W1vcw
 Rsfl37GwV6cmCusab9l/nnfG61Oh2ksY/pdXORfMfrL0V9JrDfar8z4f2SCwtyM0bMnTN+tL1n5
 89IIZAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: N4FnrPG0z9pCO5fgmLlKK0qZXz-CDFU-DqDZlcflf-g_1762471611
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
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
index b38f3ae26b3f3d8c9e73b43d86510acf6cedb471..1426a2db984d53b91125b18f7725738c44f19555 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
@@ -418,13 +418,13 @@ static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	return mtk_hdmi_pll_calc(hdmi_phy, hw, rate, parent_rate);
 }
 
-static long mtk_hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *parent_rate)
+static int mtk_hdmi_pll_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
 
-	hdmi_phy->pll_rate = rate;
-	return rate;
+	hdmi_phy->pll_rate = req->rate;
+	return 0;
 }
 
 static unsigned long mtk_hdmi_pll_recalc_rate(struct clk_hw *hw,
@@ -439,7 +439,7 @@ static const struct clk_ops mtk_hdmi_pll_ops = {
 	.prepare = mtk_hdmi_pll_prepare,
 	.unprepare = mtk_hdmi_pll_unprepare,
 	.set_rate = mtk_hdmi_pll_set_rate,
-	.round_rate = mtk_hdmi_pll_round_rate,
+	.determine_rate = mtk_hdmi_pll_determine_rate,
 	.recalc_rate = mtk_hdmi_pll_recalc_rate,
 };
 

-- 
2.51.0

