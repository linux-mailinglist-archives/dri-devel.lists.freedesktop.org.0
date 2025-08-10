Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CA1B1FCCE
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 00:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0958D10E2AF;
	Sun, 10 Aug 2025 22:46:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Iy58V6RB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D6110E2AF
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Aug 2025 22:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754865979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CYtRvLWH1nEitW0lp1POxLyrQ3/VdPLRfNjB0vWutHg=;
 b=Iy58V6RBGZiiCVIntGmv0oNMbs9BskuJb37wGIhNqB9MYZoT5IkIzVHKq8eq+DFW4WIdnQ
 s+5//FDhOm7JyGtL+t5SvMYoYn4Xini3DtNkPDl/YRFHdxoHY2971/bkoOZBoqskYQiMxI
 mnx/UGBw9hzgSEFBsRB9Vdv6wF8Snsw=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-116-ZCvzZJYzNyGhFgjJrQ6fKQ-1; Sun, 10 Aug 2025 18:46:18 -0400
X-MC-Unique: ZCvzZJYzNyGhFgjJrQ6fKQ-1
X-Mimecast-MFC-AGG-ID: ZCvzZJYzNyGhFgjJrQ6fKQ_1754865977
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b0a3557d05so80004551cf.2
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Aug 2025 15:46:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754865977; x=1755470777;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CYtRvLWH1nEitW0lp1POxLyrQ3/VdPLRfNjB0vWutHg=;
 b=dXe/FxT94d2BkvRUQBhlrvPQAT721h8N41dIY2whOsWhjlEs9hQK5FQJhtxzRE2bMp
 OxVgcxy24r8+GvlcP+eyR6rbOiCEgmw+nZjf3EQkVoz/Y9/ub2LK7fEZofl6QlzNUHVY
 LLX80DOaARBcEnylfoVvC+imvmJd7jntF/2+dI8/0d6tPEs9gFoX/0Q5/e302bBienXN
 xXFrSqIIdmJ8cSV0Gy+G01BygPcI0d0srUPCYjn7lDIpFKj7bupycJVZw1PLfsWWNQ1m
 A5dyodlhWTQ7a1g/wRVF7M8YgGOLroMUTBD2THePvVEGTqEeQ9jcFcaGZsbDWnnvj36B
 QhKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxln+uIN6niqYpiGRODT0Zq9k356KrZYplrVoKY48EqHOCj2qmJjVXj5/f2daHkh6whdldH/zbVhw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLrwfqyQVw2FDK5qNJHL0Mu0Iul8gOrS8mNdHKt9Vgk2i5brTE
 7Ye/TEztHg7+1kuWzUbDiwm7gi+IcC/OXU95NBnaDl0Ww16MVz50HV0bp5uoW8BsoZcolEv/U3A
 eSzrnMV459JkQJOAc9s92sCtH8n6FO/HyFs4BL48vVUlAqnROjOBGH3hFRxO4hurmP/nYow==
X-Gm-Gg: ASbGnctikExGiaM0xY/nPMxBnD0+kULMG5zm0NYB5S9qdD1MhDXeD+3j2mF0ybE/kj4
 442HmgNFuxLngj5CGcP0YJejMRWEpKLbpWzz0zMfHW8zFqji1LNjnNtQi5sB2n0nQeAssl1vCHH
 UCKvWpWyr0miXnRw49Z/D8vyIuv6zQckycGklks+K4sEIOpuiQvOmcy80iSgvVUaBM2f91JUlXB
 DCq86PNdc6aXM/XFUwTCky/0wIx1shHHbMHja7ZTcp0KlU3j/Mr3u9D6nr9phXGoz3lgRjXd5Pe
 C2pZ6R3Ky3IABzH5qBSKtlH0FmjwTAWotZyBFAJQfhDzZLTcbRBr7o6cRtewAwCRs+v8rwIytCb
 qoK2YsQ==
X-Received: by 2002:a05:622a:1a93:b0:4b0:8037:c0fa with SMTP id
 d75a77b69052e-4b0aed93038mr151727481cf.58.1754865977531; 
 Sun, 10 Aug 2025 15:46:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExCDCgOrUi7VTan6/AGqAAE3FbTWvD0DlZHmaitVHPb5PTrx90u14A2hmRLrvSxJ8XKrUUiA==
X-Received: by 2002:a05:622a:1a93:b0:4b0:8037:c0fa with SMTP id
 d75a77b69052e-4b0aed93038mr151727231cf.58.1754865977145; 
 Sun, 10 Aug 2025 15:46:17 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b0ad996459sm42685171cf.46.2025.08.10.15.46.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Aug 2025 15:46:16 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:45:31 -0400
Subject: [PATCH v2 3/9] phy: mediatek: phy-mtk-hdmi-mt8173: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250810-phy-clk-round-rate-v2-3-9162470bb9f2@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754865940; l=1767;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=+ttqLK3CCvX22rG8r1u2aky/pyqBIfYJ3wcP4wTqxkI=;
 b=3obEgP8yrDCMdOaBGI+w4Tat/8TZLPDL5bV/fvqowKe5RG+J17OP5TtRquid0xdyZAAnUyd/x
 LCD0oPAU7awC9owBT91elCcJ0kc+tWZOGloj7ttnD+fpn6ULYnrgJiH
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sFD08996gobpIqYJQvHS4BdcwfZHQjbfoWOcWYW6oqk_1754865977
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
 drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
index d04758396046363ab9edc584ae10bf31e9c5fb0f..58c6596c8c20bdacf96a97709b8f5709f447e85b 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
@@ -118,18 +118,18 @@ static void mtk_hdmi_pll_unprepare(struct clk_hw *hw)
 	usleep_range(100, 150);
 }
 
-static long mtk_hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *parent_rate)
+static int mtk_hdmi_pll_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
 
-	hdmi_phy->pll_rate = rate;
-	if (rate <= 74250000)
-		*parent_rate = rate;
+	hdmi_phy->pll_rate = req->rate;
+	if (req->rate <= 74250000)
+		req->best_parent_rate = req->rate;
 	else
-		*parent_rate = rate / 2;
+		req->best_parent_rate = req->rate / 2;
 
-	return rate;
+	return 0;
 }
 
 static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -223,7 +223,7 @@ static const struct clk_ops mtk_hdmi_phy_pll_ops = {
 	.prepare = mtk_hdmi_pll_prepare,
 	.unprepare = mtk_hdmi_pll_unprepare,
 	.set_rate = mtk_hdmi_pll_set_rate,
-	.round_rate = mtk_hdmi_pll_round_rate,
+	.determine_rate = mtk_hdmi_pll_determine_rate,
 	.recalc_rate = mtk_hdmi_pll_recalc_rate,
 };
 

-- 
2.50.1

