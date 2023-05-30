Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2437158FD
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 10:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A210210E12A;
	Tue, 30 May 2023 08:48:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4842110E157
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 08:48:49 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-51458187be1so7411346a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 01:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685436527; x=1688028527; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MHqfhex4k1JTsYeEXGwpls18ioPjTIAYp2acOWIwgpo=;
 b=jWN+niVahYUW4XDuO6u4d+X15sRRNP6SJBklfervz8Tj+qXTI+jXKJ+uQM7EcZQvDB
 7aYOkUoJhTiiHkrPR1+Tjnk3vmJiiV7J29hC56MkxepJPprIzQk53KUerZwrzBPAY6PK
 z8fbMj5psQ7L1lzIGy5m5ybnAGq9V0H9019phHEnsMkU0JizrpZaGwvwRYU8+G8v8TLH
 dh0VfcpmKDFtAHx3rviOnbpKTRY9W9UTXOMN6bfOarCqXKlRQmb2lCcJkyhicXovGBlq
 u3JqSL16vqcDRk/x11BExLTf4Amho7k2reV2m1V9o+P6Lblw0KZ1GSxyBac8zlfSYz3c
 rdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685436527; x=1688028527;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MHqfhex4k1JTsYeEXGwpls18ioPjTIAYp2acOWIwgpo=;
 b=ObySfsr2X7eArmQR6rObrDZc6EHtlTM2Cj5tCUsAbTEXJn5E4VQOy/MBXgQc4mBXBa
 MVZjGWqnxSh3n1hkOjqHNDKZ0PVar0uUsZR1gWtFUtOfa2YLI3Gfb08RCT1OMckxGvRi
 gXpgKgecakzkfrflVwXdH0y9GGBn0VDvYH9L4HGa2phqPfl7Ui8Ci1roFnnBhm+j/uer
 OKggSGdVSC0ZyqOdQV3WI1JEeG9ZFBjcTFIKl0MYfVfZiPrUg9UQTIdDXChYaOZZMMNS
 SNiSmStloN66eJX4iGFk3oIe0JAOSw5bYWPlF4fAJSZEgCjfK2LvlyKgz6ejZL5VwlMp
 BDPw==
X-Gm-Message-State: AC+VfDxOUeodae0fV4mYcmE/tW/OoWB7Km6tEIVjokP4tOUOB5axjkTl
 WEZ8SZLYxowSl2MGb092wGNaIi61FeLq6o6iC8E=
X-Google-Smtp-Source: ACHHUZ6TKXLrgG6JwuYw1Kzs78NP4b4Q0MqE5vN2rgVaizDAED6lGqcpPitCI+esTvabbTHyjvPpow==
X-Received: by 2002:a17:907:961e:b0:971:fa86:27e with SMTP id
 gb30-20020a170907961e00b00971fa86027emr1524138ejc.16.1685436527350; 
 Tue, 30 May 2023 01:48:47 -0700 (PDT)
Received: from [127.0.0.1] (abordeaux-655-1-129-86.w90-5.abo.wanadoo.fr.
 [90.5.10.86]) by smtp.gmail.com with ESMTPSA id
 k7-20020a170906054700b0096f675ce45csm6959686eja.182.2023.05.30.01.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 01:48:46 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Tue, 30 May 2023 10:43:07 +0200
Subject: [PATCH] phy: mediatek: hdmi: mt8195: fix prediv bad upper limit test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230529-hdmi_phy_fix-v1-1-bf65f53af533@baylibre.com>
X-B4-Tracking: v=1; b=H4sIABq3dWQC/zWNQQqDMBBFryKzNqipWuxVpISMGc0smkoCYgnev
 aPg8n3e42dIFJkSvIoMkTZO/A0CTVnA5G1YSLETBl3rR93pQXn3YbP6n5l5V4Oz2BO2muYnSII
 2kcJow+TPCNtKLHMnp7FGkuk6HN/H8QdvJZG6gAAAAA==
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
X-Mailer: b4 0.13-dev
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
Cc: Guillaume Ranquet <granquet@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pll prediv calculus searchs for the smallest prediv that gets
the ns_hdmipll_ck in the range of 5 GHz to 12 GHz.

A typo in the upper bound test was testing for 5Ghz to 1Ghz

Fixes: 45810d486bb44 ("phy: mediatek: add support for phy-mtk-hdmi-mt8195")
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
index 8aa7251de4a9..bbfe11d6a69d 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
@@ -253,7 +253,7 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
 	for (i = 0; i < ARRAY_SIZE(txpredivs); i++) {
 		ns_hdmipll_ck = 5 * tmds_clk * txposdiv * txpredivs[i];
 		if (ns_hdmipll_ck >= 5 * GIGA &&
-		    ns_hdmipll_ck <= 1 * GIGA)
+		    ns_hdmipll_ck <= 12 * GIGA)
 			break;
 	}
 	if (i == (ARRAY_SIZE(txpredivs) - 1) &&

---
base-commit: 9f925874281f7e8855855d6210d6e29d844e4307
change-id: 20230529-hdmi_phy_fix-9dab6eb42ef7

Best regards,
-- 
Guillaume Ranquet <granquet@baylibre.com>

