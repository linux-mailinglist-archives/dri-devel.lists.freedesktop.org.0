Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A832B1FCD7
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 00:47:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7495610E2BD;
	Sun, 10 Aug 2025 22:47:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HBkg4CyQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8BA610E2BD
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Aug 2025 22:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754866028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sMcTNy0e5RVfi5VVz1vP+dp2IXm5jO1AgXXTZDV98Gs=;
 b=HBkg4CyQ2zpT0Ripi1XTH2QNOAu+NbaC+Zt5gT38922FZK4r5qkXPqXsZZ0HGNJ1I7TShl
 7yZ5Ki/uKrHBGlTRPumItdbmVt67/bb8lHAxHiftEEg+p0Aa9y4WoitNkP9XWifpKlY/vw
 6qZZWLY7kGWoKAWaAeeOSBUhiKurrfk=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-IhcbfRI0OAur98JzdG-lGQ-1; Sun, 10 Aug 2025 18:47:07 -0400
X-MC-Unique: IhcbfRI0OAur98JzdG-lGQ-1
X-Mimecast-MFC-AGG-ID: IhcbfRI0OAur98JzdG-lGQ_1754866027
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b08898f776so97598421cf.1
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Aug 2025 15:47:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754866027; x=1755470827;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sMcTNy0e5RVfi5VVz1vP+dp2IXm5jO1AgXXTZDV98Gs=;
 b=W9WayoewFH/yRyQg4jjxjv+V2o/7Hu7l4v5seX8LjRXrmXstN9tWz84wDZw/uetS6K
 qZpnTjjSVkGqYsG6l+jnpki34UwNz9LsHs1uGuWvV1d4/ZIXk9OtzNCBtE1jqjdNAJwv
 31jiP9vewBxG/GpzaWDVxEU33ijeutuwOdRykmp/0h6xd28a8KaIQEzBc1gsz5zi6LXu
 zwGP46psbg65CvAJmdAiD8gmDlBkWUOqljU3D6Qx9Tz7RojDBoVKfTyZIYHEQDAnmsx5
 0elUmbnKNcEd2jV0fgZkj1iMljXJ+Hl+tk8oDlrBjPBP06ZPiVtu0q5eftj8VLG4IM24
 iUQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfI5B2BnDj/eDPy2lYqpIcfTG8wT1GPWCFxPKrw+mrVVWSD1bDXhY5Bk5FoRG6m9a85NGvi5As/II=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKIwuihWcS5Ao/i9RmWTi63igrhog19abfCl8sg45pRW6ZSTe3
 1HPSL36Dsf7IYqSq6oHhEFu8E/PZxe58JmD0eSTwaJPfn/hKQIhrkp1zFFLAk97hhZ9PiuLm5BZ
 UCGVhRhppjU5lm/wymo8C13CEHHlkInjuSIDyBUeQ2zhJDqBArJS8jqmXj4wMtd40ui+QMg==
X-Gm-Gg: ASbGncurN+yMYZuP887mXJ74r9ti2lvMSv4T+sHR/C5f7AqZpyWzyuwBOR0rF1SMAtO
 mof6albrVrHw7PqtOiMvaBgJzTYaHBeqVE5903CNCy70DMcsSA3JMIZhStMu7R8OdlwOUxGX2o1
 ggwdlJH18t8rAk4+oY3DXNTqYUrKpKL6/KQtUWuMv+dhT8oaWpUzs98ALeoRiajQ+qAS8k5JrAE
 GZnaaZRoKgmRqRiGvfpl2xi7W6GOyfYsV5d7R6tHWr/LSfnWEoWmi85CQ5QVbs5X8Q8co+IpeSs
 6LmF4fJef6F+b2p2cRhGan100ks+0u8w67Z6IYft3zoo/XGeR5ZPgS4kB/2hPDSo0mO2EfGBM4T
 +cFpXZw==
X-Received: by 2002:ac8:5fc6:0:b0:4af:2139:7721 with SMTP id
 d75a77b69052e-4b0aed6a5f7mr163617671cf.51.1754866027094; 
 Sun, 10 Aug 2025 15:47:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHP5IJU8z9koSl05icwsQuLC7xmNyQP3PO70C+KlxY+wzOdhzlnvRlzStjW1m9tN2vsBSQZA==
X-Received: by 2002:ac8:5fc6:0:b0:4af:2139:7721 with SMTP id
 d75a77b69052e-4b0aed6a5f7mr163617431cf.51.1754866026637; 
 Sun, 10 Aug 2025 15:47:06 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b0ad996459sm42685171cf.46.2025.08.10.15.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Aug 2025 15:47:05 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:45:36 -0400
Subject: [PATCH v2 8/9] phy: rockchip: phy-rockchip-samsung-hdptx: convert
 from round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250810-phy-clk-round-rate-v2-8-9162470bb9f2@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754865940; l=2424;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=ndDF7+BW9z3oZgdFS9E606ToKp/Oxm2MLZrOcNPZM6U=;
 b=pM8GpM7PgNX1YsF24F8XlkiAdBklsmNw8Y01AAorZPrlImrF+x3wsR7deHwg6cBB+ANx46J6N
 A3zeH3x5Hu0ChDcu4CSeqRjFPm8eSd0GERqlUeKO53YvLSfbTdxsOMF
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: o5AGWUVkXbVSTWf416l5VozzsU1J7-89V7ApT3P5Las_1754866027
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
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 79db57ee90d1487b51f4ddadde870a275dd7b17b..0d4e578c8c6a08aad355aa8aa5a1cf75c7d354ed 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -1869,8 +1869,8 @@ static unsigned long rk_hdptx_phy_clk_recalc_rate(struct clk_hw *hw,
 	return hdptx->hw_rate;
 }
 
-static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-					unsigned long *parent_rate)
+static int rk_hdptx_phy_clk_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
 	struct rk_hdptx_phy *hdptx = to_rk_hdptx_phy(hw);
 
@@ -1879,9 +1879,9 @@ static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * To be dropped as soon as the RK DW HDMI QP bridge driver
 	 * switches to make use of phy_configure().
 	 */
-	if (!hdptx->restrict_rate_change && rate != hdptx->hdmi_cfg.tmds_char_rate) {
+	if (!hdptx->restrict_rate_change && req->rate != hdptx->hdmi_cfg.tmds_char_rate) {
 		struct phy_configure_opts_hdmi hdmi = {
-			.tmds_char_rate = rate,
+			.tmds_char_rate = req->rate,
 		};
 		int ret = rk_hdptx_phy_verify_hdmi_config(hdptx, &hdmi);
 
@@ -1896,7 +1896,9 @@ static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * hence ensure rk_hdptx_phy_clk_set_rate() won't be invoked with
 	 * a different rate argument.
 	 */
-	return hdptx->hdmi_cfg.tmds_char_rate;
+	req->rate = hdptx->hdmi_cfg.tmds_char_rate;
+
+	return 0;
 }
 
 static int rk_hdptx_phy_clk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -1925,7 +1927,7 @@ static const struct clk_ops hdptx_phy_clk_ops = {
 	.prepare = rk_hdptx_phy_clk_prepare,
 	.unprepare = rk_hdptx_phy_clk_unprepare,
 	.recalc_rate = rk_hdptx_phy_clk_recalc_rate,
-	.round_rate = rk_hdptx_phy_clk_round_rate,
+	.determine_rate = rk_hdptx_phy_clk_determine_rate,
 	.set_rate = rk_hdptx_phy_clk_set_rate,
 };
 

-- 
2.50.1

