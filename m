Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 489356E2319
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 14:23:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9EE410E1B2;
	Fri, 14 Apr 2023 12:23:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF4910E1B2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 12:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681474978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yPCGffG6qbUGI7F6FTErQ0LH3cHGPkEEbnsErQvfFxw=;
 b=d6PnMEWxIEnlFOxVIYUoL7RiGW/uvbjKlhFdb3Em7Q3Xt+gutyuSo4HPBIks1hJccS8m7W
 /GDM9ZugroNXxmJkQKO8W45un1ES2HPeXefFLCZoGiYKcaWJ/jPxB24AhSGXEBr6fR+uWc
 AC9un9vaSto7WmjzCwQKKqiu8I74kLg=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-457-wEMRg7LqM2SJwo3J-gBLVQ-1; Fri, 14 Apr 2023 08:22:57 -0400
X-MC-Unique: wEMRg7LqM2SJwo3J-gBLVQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 v13-20020a05622a144d00b003e22c6de617so13061955qtx.13
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 05:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681474977; x=1684066977;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yPCGffG6qbUGI7F6FTErQ0LH3cHGPkEEbnsErQvfFxw=;
 b=RGyuvAm2563eg9MxNr2/6/LhOQWtB/tArX9+Oq4G7b5orhfMAOqNeEjwr8pAH1tRLX
 NFUh6CCz7G8DSDJWE9tSBAI0nqAzjFZrDZmq7vHIQxA/kWOWCYhc6AqRzL5Td5hBmx+o
 tk6pR3/gJCpaT+p4Lf5GP6AqbHNLFWQnRxNxdL61KFlVCMWNVsBwqgAPB0tZaDQqSkjw
 hfdSPH7ka/vZzQSsgBZqD8Qkn17+PV4Lf6Fm0gc6Y6XAdPkwwOVL2tnAmyGCxlmb53S2
 xlD1gzcX8vyKj8VLP7VEFJsqMA7zgV/A7NkgDeXPfTYjRpeu7pnUpyqkTIEmyQ9MJS+L
 6oew==
X-Gm-Message-State: AAQBX9ePKVVY2En7lbUZru7n9JF/n1SBdZLGo2Ov+ONeA58Zvyy3jcNR
 q1stX1K2jpbWJuIfuf8gl5Qd5TFnaAs/dVSCYmZ6idf0Z7TW2OXzFhiKeg+edOEmVPYwZtXXkmO
 P5t7z2gYMPbtY8NYqX46+W11vOZU3
X-Received: by 2002:ac8:5945:0:b0:3e4:e2fa:66b0 with SMTP id
 5-20020ac85945000000b003e4e2fa66b0mr7771653qtz.29.1681474977146; 
 Fri, 14 Apr 2023 05:22:57 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZrFNjLa1K+ogArho3OQ0SXUeh36MSY9HRSMAimwdY9UWoY7qElQIx2CPz+MS7Z6iLrkNomrA==
X-Received: by 2002:ac8:5945:0:b0:3e4:e2fa:66b0 with SMTP id
 5-20020ac85945000000b003e4e2fa66b0mr7771633qtz.29.1681474976909; 
 Fri, 14 Apr 2023 05:22:56 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 r4-20020ac85e84000000b003e302c1f498sm1193420qtx.37.2023.04.14.05.22.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 05:22:56 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, chunfeng.yun@mediatek.com,
 vkoul@kernel.org, kishon@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, nathan@kernel.org,
 ndesaulniers@google.com, granquet@baylibre.com
Subject: [PATCH] phy: mediatek: fix returning garbage
Date: Fri, 14 Apr 2023 08:22:53 -0400
Message-Id: <20230414122253.3171524-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

clang reports
drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable
  'ret' is uninitialized when used here [-Werror,-Wuninitialized]
        if (ret)
            ^~~
ret should have been set by the preceding call to mtk_hdmi_pll_set_hw.

Fixes: 45810d486bb4 ("phy: mediatek: add support for phy-mtk-hdmi-mt8195")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
index abfc077fb0a8..c63294e451d6 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
@@ -292,9 +292,9 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
 	if (!(digital_div <= 32 && digital_div >= 1))
 		return -EINVAL;
 
-	mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
-			    PLL_FBKDIV_HS3, posdiv1, posdiv2, txprediv,
-			    txposdiv, digital_div);
+	ret = mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
+				  PLL_FBKDIV_HS3, posdiv1, posdiv2, txprediv,
+				  txposdiv, digital_div);
 	if (ret)
 		return -EINVAL;
 
-- 
2.27.0

