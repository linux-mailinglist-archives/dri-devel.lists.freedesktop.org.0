Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF58B1FCD0
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 00:46:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4DA10E2B2;
	Sun, 10 Aug 2025 22:46:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JyYM0QKB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE8110E2B2
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Aug 2025 22:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754865987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Xg8hqI9hY3cckPk/9kc3e4L3WNhIKfJgnhJhXBVxrY=;
 b=JyYM0QKBxDqkCfPEyyQbS3JULEsxpOXcgFRpKK27DDGUnkpLiWCLaD8DKOvTp62PAaGbI5
 NAPIq5WRL5lCBAvJ3ykE80rx5IBCN6USQEMiuMRlEHChZXxvS4IFPqqFK0byJuxRJ3lfjG
 QXhN8xZn7cuuZ0Gr6CqhSMb5Y47McdQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-362-I63dffi2PWG5w4Zup1Z-Ig-1; Sun, 10 Aug 2025 18:46:26 -0400
X-MC-Unique: I63dffi2PWG5w4Zup1Z-Ig-1
X-Mimecast-MFC-AGG-ID: I63dffi2PWG5w4Zup1Z-Ig_1754865985
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7e7ffcbce80so869911885a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Aug 2025 15:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754865985; x=1755470785;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9Xg8hqI9hY3cckPk/9kc3e4L3WNhIKfJgnhJhXBVxrY=;
 b=kvpHYxDZtD2G8xW61B+ZTGKQRWSC3TOMXGcdmYeRxXH/1ixDRT3FZIyKat1XTeKa29
 gxx154MinedMl64DcvEwQZBYZT4zYnATB7AjXEAIXvjgH88gVDxwjY9FxSW3zmCne3Ai
 tGHekE2qIokDC3Zy5VTfwsjO+pFavtWppm5ppUoGk6xAbPU2EnScYpF9BMz5mxv+tXXu
 /FhrGXqdn4OI9QxtFmHS/nGJNYDpFcNykSj9oxsZeJ3wNOQrip8TId988q9/52UlEWQ9
 EjVejFFweMapXezfI9IT1ZojicO6ryNdjcLR6PW9MnhAQ5LHUAry1KsdeHiAHWokyTsg
 aeYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3AyChlegc1rSI5O3Ww+SwucSO1OPkoLiI2dW9IVTyF0TtOVr6zF//CWQPGewNVcNLWY0tpH9vUhc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2ycWoa7ned4IGn7Z/rsqMcTV6XnyjeEvefMdMS53zh8JACvWH
 5AkbfUmME7NbrCP1yhmOvd3PHO8FAHoHemHOKuadGJaux/UQzzwwcqyWOJgeD+ebqssnYsDDojW
 3/SVPvsGe8fIwdPZRWtt9vobzvWM3eTWkg3DCzX6cwU8fOA3yxEbWHSNN0BDROrwdJM1TZg==
X-Gm-Gg: ASbGncsez4EO6f88yqrTdrgFMpRNbYnn6mjQOHOeJ/EakNuLMdEQXcXgOI7hlnK0vdv
 8GU8QEbLXZHXtmaoCnJBa01CNe2PX1rZtj/ZAcjtAmEVukhKdLdlcpXwxiy/kzU8cgGWdY6dhOs
 92PwC8eNt4YQ+/rID8K+20/dVZbiU3gKWsO59PF+QORS/FY46dXphDlr7cSWx9M47GVw+A4NU7a
 2MJoTgsiEvmPi16ZopYNDydIp9kN+bDXtZKRJX++a1oEq3NVGJ/Tj1hEhPaI7wCeDL4am67D6Aq
 EbEasU5qn46LuODP+31/RM/oGpYWXKJql+exlHA+eIxmXWIHkcUYMKUHNk6ifo1HJWQwEQYfVHd
 ieP7r8Q==
X-Received: by 2002:ac8:570f:0:b0:4b0:85de:483b with SMTP id
 d75a77b69052e-4b0aed794b6mr191405091cf.50.1754865985408; 
 Sun, 10 Aug 2025 15:46:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlcV+VlJl2BMsCB1be7RUmGpPT7LkQkTuorr8gQ4HxbmtzB9yCp//naKxGcJVwwxqJ9LpWMw==
X-Received: by 2002:ac8:570f:0:b0:4b0:85de:483b with SMTP id
 d75a77b69052e-4b0aed794b6mr191404891cf.50.1754865985003; 
 Sun, 10 Aug 2025 15:46:25 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b0ad996459sm42685171cf.46.2025.08.10.15.46.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Aug 2025 15:46:23 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:45:32 -0400
Subject: [PATCH v2 4/9] phy: mediatek: phy-mtk-hdmi-mt8195: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250810-phy-clk-round-rate-v2-4-9162470bb9f2@redhat.com>
References: <20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com>
In-Reply-To: <20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754865940; l=1601;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=zpxjkKUS3Ja5Hl82pWOZy7M8iozPUZUnjje7JplMAuQ=;
 b=TfkcMxwokTO3SFrhfFtRnY/2TB3MjvqVvGnOziGO+YGy6Hi3nXcV6PqOeuN7niocq8BeQPo/w
 8VIsZH9GTQrClIuzbrC8guMQvM6lpDsYvdZ4R19kOLm1cKrdM3gU0VK
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SocWd1BW2-7HmL69uWBRGuWdGHakicCAxMsyd3E2qCM_1754865985
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
2.50.1

