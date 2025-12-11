Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AE3CB75AF
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 00:17:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B80610E8B6;
	Thu, 11 Dec 2025 23:17:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DeL0VAh9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EFB510E8B1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 23:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765495061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yGIhcNn4hSdtEtR/SXkjUWQp83NGU7A3xjzPvcHPB5M=;
 b=DeL0VAh9tNp+zk6lvTTicz1QWO4D1gV4wyrEIXuUmiOxWhEBpt72G27X2cSeme9tMRQQ8r
 /CgiJ8Nm69giKDgejhfB7wbr1/MI1R98My9FTZtcH/s3EhlFbD6c9q42Djc6LMT+6bDy6C
 IMosvBN5SwZaNUBfFkp4soTgOinXdhc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-rWIDxan3NEyHIqH5kYxq5A-1; Thu, 11 Dec 2025 18:17:38 -0500
X-MC-Unique: rWIDxan3NEyHIqH5kYxq5A-1
X-Mimecast-MFC-AGG-ID: rWIDxan3NEyHIqH5kYxq5A_1765495058
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b2de6600c0so152010585a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 15:17:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765495058; x=1766099858;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=yGIhcNn4hSdtEtR/SXkjUWQp83NGU7A3xjzPvcHPB5M=;
 b=tVrrHGrtdKx+kBg5o8kc0mvG9ttSrB6yp9mWEEufkQKDMvCddiysui7YsbCh0YX12C
 jCPXbM9WQP9KwbAnSTiLFpnyRCYOqeCwYpiunhH/rMe1/olRhnUgSqVlAzuHOEH4oOYN
 auwoDtezfTdjw1IIX6+QbFmMArVHUaafdqf4rez072Z8GejYKWlnQy/kKY1WJXefFcIe
 sA/sW+sDCJBtpAEYmdsav3YydzMEKp+s1P+LQukoXN0Gofns8d6a2oJnX/pAV6pSf9uH
 Z4YObubSzb+uvWi9JYZgnW46gE2hCv/3Xe/bpMv7ZOZCDe6LY02Sm8YrwXAg7w/Tmcni
 vkdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3IHxooVKZRuZDgULI+iJcRLKWqxPk4iyoU/fwY+lL7mwjkJDkWf2NrVd1Oc33LZGjiOspzA+sUV8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsmfrRx+X+feRsoJlW3p/5vbQZBkCDWe+Q9RQmgxc2ii0l+Uyl
 mKE2E1TtkfUdS4atb0g5bX/Apmgnjg/doGFSJpaTPO/wyuPGyNKze1xSZzSUY5M4dgXSN2HNXMr
 OHaZWGc9/eL7W0ibjoW6kz1Y36n+8RLEigtG3Eq1VSX9Cbsx+j3s4W0qg8NS7g+w/CEx0ig==
X-Gm-Gg: AY/fxX5FKZEV0zkpUzWomMlmXbVKmBMkRVBUBee3pbn0V3arNa9aBTQEd3l42sSYX3b
 ZApRVVJ096cX1OKA3d2dlnWVRiWGgISzaQX/+NX7xM/3HuETVSxetwhdq8JIKZZYoRiN9LaO947
 Dgiu4dB5jegahUnj+vqh3gnwyMz8Q5x6J9T2X5bDs+n21Uj+Gl6GVxDfaiKCqOWJrHaMxrxxshw
 KhSXa18tQ+ek/AfGlxTT/Wpabiz7wMjCOqrsX9NJJQbtRNlLzDalCO121VXDBcFxWbOPwK16D0N
 3+utV5wh0R1goPIjn0V7VBFLkD/zdQcClp2r0+BvBZlalq+uF408Cop83KWMjZnsh/gwLaIuOKL
 b/yaQfK7f8GeAL4mDpMCom59fbgbNOVyZIo6j/H5Q4UzRcdq6siSL/g==
X-Received: by 2002:a05:620a:4143:b0:828:aff4:3c03 with SMTP id
 af79cd13be357-8bb3b358530mr24777985a.61.1765495057866; 
 Thu, 11 Dec 2025 15:17:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJ6MyvatEvjXLdrucEm3djvv+DCSWYW1g1m07kDWXIN1ABKw8EYPVfgJJ5sUpqpKlTIcYAIw==
X-Received: by 2002:a05:620a:4143:b0:828:aff4:3c03 with SMTP id
 af79cd13be357-8bb3b358530mr24775285a.61.1765495057473; 
 Thu, 11 Dec 2025 15:17:37 -0800 (PST)
Received: from [192.168.101.129] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8bab5d4edbasm317873585a.51.2025.12.11.15.17.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 15:17:36 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 12 Dec 2025 08:16:26 +0900
Subject: [PATCH v3 8/9] phy: rockchip: phy-rockchip-samsung-hdptx: convert
 from round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20251212-phy-clk-round-rate-v3-8-beae3962f767@redhat.com>
References: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com>
In-Reply-To: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2646; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=1Db9NFuUnQhQu9U41X5Z8TkxHRghSnvnQHsnP4RTW7s=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKtAy6tv/mBQ3J1ntD97t0PtZ/sXbDtX8XDgquXTd8ZR
 upqaUakdJSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCRI7UMfyW7Kk4WyCmZJybt
 XVSS8SzsoeutV4+lLCYXcK7IPTTpxzxGho2HvrnXvlrEFdS08UIvr5StzpeJsWwOEuUlB2Zv/XN
 BlQ8A
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: N21lik8xOCbGLLJbaK0gnum7EMLj-vh-Zo2L4yhDSfI_1765495058
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

Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 29de2f7bdae8a31958e31b0a64281532fd76e64d..315ac97f52d8af6d3010dc87788575039c7a6b40 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -1870,8 +1870,8 @@ static unsigned long rk_hdptx_phy_clk_recalc_rate(struct clk_hw *hw,
 	return hdptx->hw_rate;
 }
 
-static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-					unsigned long *parent_rate)
+static int rk_hdptx_phy_clk_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
 	struct rk_hdptx_phy *hdptx = to_rk_hdptx_phy(hw);
 
@@ -1880,9 +1880,9 @@ static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
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
 
@@ -1897,7 +1897,10 @@ static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * hence ensure rk_hdptx_phy_clk_set_rate() won't be invoked with
 	 * a different rate argument.
 	 */
-	return DIV_ROUND_CLOSEST_ULL(hdptx->hdmi_cfg.tmds_char_rate * 8, hdptx->hdmi_cfg.bpc);
+	req->rate = DIV_ROUND_CLOSEST_ULL(hdptx->hdmi_cfg.tmds_char_rate * 8,
+					  hdptx->hdmi_cfg.bpc);
+
+	return 0;
 }
 
 static int rk_hdptx_phy_clk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -1927,7 +1930,7 @@ static const struct clk_ops hdptx_phy_clk_ops = {
 	.prepare = rk_hdptx_phy_clk_prepare,
 	.unprepare = rk_hdptx_phy_clk_unprepare,
 	.recalc_rate = rk_hdptx_phy_clk_recalc_rate,
-	.round_rate = rk_hdptx_phy_clk_round_rate,
+	.determine_rate = rk_hdptx_phy_clk_determine_rate,
 	.set_rate = rk_hdptx_phy_clk_set_rate,
 };
 

-- 
2.52.0

