Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EE8C3DD52
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 00:27:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC0A810EA0E;
	Thu,  6 Nov 2025 23:27:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="by/RSgi1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 528A310EA0E
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 23:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762471633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tBx/RbO8BQMCKJrhX3UVFzNDKA/fgJo016hiP8kJ+pU=;
 b=by/RSgi15OpAY9bfkalQPnabc9ZvyUSmjdhiad1qaAjbyZGJF9U4lDB3Cq5LMbb3AknEtP
 K88SJrWVjYlLkgX+4k0V4Ks/QoOj19pjv8Nk8pYe0Rjy01KsdjVGog3o1t4VHfNoaSCkRt
 xUPD+p3e8ZbsDNeyyxI5QhvyzC1l6IY=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-9y6NZw0XMH-BjgONul0RKQ-1; Thu, 06 Nov 2025 18:27:12 -0500
X-MC-Unique: 9y6NZw0XMH-BjgONul0RKQ-1
X-Mimecast-MFC-AGG-ID: 9y6NZw0XMH-BjgONul0RKQ_1762471631
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4e884663b25so4692081cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 15:27:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762471631; x=1763076431;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tBx/RbO8BQMCKJrhX3UVFzNDKA/fgJo016hiP8kJ+pU=;
 b=bg3Nh94mYCFuI3vWECYdf7cQ955pISg8tBwGk2i4z1aq1uX9Kctm88e6Q9h45XRf4T
 nIzmPohv7Moy+cIM298OPqmxoHuuzdsQQZc066EzEKaUHQS9DnJ1kSdutZisqgLdWI6X
 dUBq7sHukwUOOBFHk/rFz51ZPW9VPraU5ALHti17j5FqBrGfkWnUK8lmUKTf+j+e8GQ2
 ysqiNlxTykBhay8a1TSzIIN7uF+F1qU3x5A26KpIbfteeb4wHO4yVExtiEJ4IW3VLXns
 uOoGVkuIhWw/zyisqA5iX57zvvF7sR+3h3im9godtue4MUt2j8MbnfUYKMvAeDXY2z+D
 +pmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGWaVMtkQoDS95moIQ0tbU8dVV+0snpULrtLNpD5w6OSDscynhWk0KOYU10rH0bvVled2aj2b2ELQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzrc15fSXnAu7dgIxaArIwZeqQ1ZGdmGhcuq0f70D9FOKMu9bye
 YiZvqhlrBkwFhaGjyH6ZiedJw14s6WWYjm8Ec3itj2juEnKZMWnKZFZW2BO7c85MZaB69hUfA/C
 aJ5xzxxVmGoOmdeEOruz3O/0z9uY53mEkSg4dwEFFgnyxIXre++wcR3Op/DXfdmaG0WDg6A==
X-Gm-Gg: ASbGnctCCs207/TXVVD1KjvqG0zr9oBs8SQOqE1IOnjmYYpojhK013WBQGn5or2oqHP
 o9pfJqOZasVFGfIdB12Xa1EpMUWXKyYRuy2JmiKGib9Hsf49kJYLLuftMXrD3/RWLrKhAOzigw+
 yWbhDTUKVNo+NHH1FzrrdpskIPwetx8rCoc/0/jJgDM7LQxFkekNJNai7bPuqffAjke0fJEN5yU
 3TBHRAcr83LK0ATJmoegx6+bZHZZv90hFedELm+nIDeSev43y77ol113sCmPLvbRqQkj87TwNOr
 5Vk6cZm2Pza++4xYy7sT2y5JvQy9B7KS8Mz6X1RVxKGZPacJwH94ZtnR2D1vmIcMa3++iZgew1F
 EB+A2pSNa0SEUuq/53B3jo++wUzyTpSkU6TogyBuPMg==
X-Received: by 2002:a05:622a:189b:b0:4e8:affc:29a7 with SMTP id
 d75a77b69052e-4ed94a4c31dmr14935771cf.69.1762471631433; 
 Thu, 06 Nov 2025 15:27:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFt4j9euZosp2hZeGEJaF3Zc+V1HHaVy/kAkeKIc2HE/iGD894+L3jbsBB5eqZssh32fH0eaA==
X-Received: by 2002:a05:622a:189b:b0:4e8:affc:29a7 with SMTP id
 d75a77b69052e-4ed94a4c31dmr14935481cf.69.1762471631061; 
 Thu, 06 Nov 2025 15:27:11 -0800 (PST)
Received: from [10.197.115.224] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88082a3aa91sm27389196d6.56.2025.11.06.15.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Nov 2025 15:27:10 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 06 Nov 2025 18:25:54 -0500
Subject: [PATCH v2 RESEND 8/9] phy: rockchip: phy-rockchip-samsung-hdptx:
 convert from round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20251106-phy-clk-route-rate-v2-resend-v1-8-e2058963bfb1@redhat.com>
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
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2539; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=XNrncR0wdrogri0mOccJ1j7cRKzm0SbJrI8uS65MUBg=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ59RZa/lLcfPtOav3l31tLb3NLLrj9XuLfm2MKzO8eb
 lmSfiJesaOUhUGMi0FWTJFlSa5RQUTqKtt7dzRZYOawMoEMYeDiFICJLLFjZFjls3zG0W8X965q
 XmO0fd3SSvnMpefLahKc57Dc3CGSpOjH8Fe6eEW0erXU1wzZ+KO6q++4quybaPjtwWm7bfZNNya
 mn+QHAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ITARO6P0mTW2D0OVvdau-DGuakFgF-CTHH3bqrqElHA_1762471631
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
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 01bbf668e05ef94e24a3fa11f96f219c4f942451..e5436c99a3c435715358a07da73b4d10d78ef1fc 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -1868,8 +1868,8 @@ static unsigned long rk_hdptx_phy_clk_recalc_rate(struct clk_hw *hw,
 	return hdptx->hw_rate;
 }
 
-static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-					unsigned long *parent_rate)
+static int rk_hdptx_phy_clk_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
 	struct rk_hdptx_phy *hdptx = to_rk_hdptx_phy(hw);
 
@@ -1878,9 +1878,9 @@ static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
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
 
@@ -1895,7 +1895,9 @@ static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * hence ensure rk_hdptx_phy_clk_set_rate() won't be invoked with
 	 * a different rate argument.
 	 */
-	return hdptx->hdmi_cfg.tmds_char_rate;
+	req->rate = hdptx->hdmi_cfg.tmds_char_rate;
+
+	return 0;
 }
 
 static int rk_hdptx_phy_clk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -1924,7 +1926,7 @@ static const struct clk_ops hdptx_phy_clk_ops = {
 	.prepare = rk_hdptx_phy_clk_prepare,
 	.unprepare = rk_hdptx_phy_clk_unprepare,
 	.recalc_rate = rk_hdptx_phy_clk_recalc_rate,
-	.round_rate = rk_hdptx_phy_clk_round_rate,
+	.determine_rate = rk_hdptx_phy_clk_determine_rate,
 	.set_rate = rk_hdptx_phy_clk_set_rate,
 };
 

-- 
2.51.0

