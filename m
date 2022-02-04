Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9615B4A9B0B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 15:33:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E71010E8C0;
	Fri,  4 Feb 2022 14:33:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D98C10E8C0
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Feb 2022 14:33:42 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id r7so4635139wmq.5
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Feb 2022 06:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9HRfuw26kbdaIgCIMJCrn0p/ikh8G5VstHoJyqrHzaY=;
 b=N5GoAcSlGGBJtMEbJ0ukMjcahDwIi6iA2QZkJabB//WJv/G54PfC1Qrfzg7/ZI1TYh
 GXhH0QCbw+gpq7uTm0dWhu7TcRTYxOcV5k7t/lsc6n2nPvf9RmCPWHgzUrMufrxVAT1G
 Lsm/WHY6QYMbH7NqBUFUJRx5DCm2DZkKPdQVSIC86woRjsZkuzlUJwbFshTnN4NtWfni
 7g1L/qjPxy12sXSFEjZJ3ZERFtzvB35xQ+w8LuY1lSKUAqPW88dNka/ITANmbxgilrhl
 egqC9SA4Fpv10xkSU1ukvLxU+IEjvuHmqg3MBKOUTv65hnqvE0/FUcvuWcLHrwN3pQ52
 jyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9HRfuw26kbdaIgCIMJCrn0p/ikh8G5VstHoJyqrHzaY=;
 b=7LiANon+/TXHAZnWsEzjKjLOoghHYiH6Bg8Tn3CWbrvC/ekB08ekcFa2OnnyNsfcci
 ItoNyKV3iYUD2hZsChPd2b0JHOa7mOzRKX8TvmR2zlPCvpSIJ2MpgB1SdrQ3kVThg3Dq
 pWRqqbGimpIG6Mo9r+7XhRCF6Nv0bclexyuRO5c/XkvPBH42UaLuuRXuLiBoYx7ZP4WM
 a9/EakMp1Iwr/WBUM+u3dkFQD2gjE931Mzp8EmJTuO3TSE2Ceep7WEXKcevGYIRI4DDs
 tHf7Eo/enXFRiAGZZxobCnw6+B/jRUCsxQlMd02aurk4WgSkzYfluuFk0ZkXnIeVSoaH
 3g8w==
X-Gm-Message-State: AOAM531EfyAjcY9SZJqhYf6etLjKa8bkAhYVrc6n/YuEe1utXSCIRxH1
 fdx/CSE1ARIk2A339LwvbVmhfA==
X-Google-Smtp-Source: ABdhPJzM7rirBHeEKddHJTpT/8Ll2fTTFTnqEyoWqAVCMisHdXwtzMHwgV7V/Gu8b3v9CLpo+s2nlg==
X-Received: by 2002:a1c:4b09:: with SMTP id y9mr2438315wma.159.1643985220416; 
 Fri, 04 Feb 2022 06:33:40 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:3fbe:ff10:110:739])
 by smtp.gmail.com with ESMTPSA id
 p14sm2426053wrr.7.2022.02.04.06.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 06:33:39 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robert.foss@linaro.org
Subject: [PATCH v3] drm/bridge: dw-hdmi: use safe format when first in bridge
 chain
Date: Fri,  4 Feb 2022 15:33:37 +0100
Message-Id: <20220204143337.89221-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2327; h=from:subject;
 bh=e5N2iKj5YSVB+9PoyzM1SrjuyNvunszme9UDF4PNMaY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBh/Tk4oLM2pdcdSB7huyqScnob/k6VvXol8zz9+/KN
 tCOP+9WJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYf05OAAKCRB33NvayMhJ0dKGEA
 C8cPNgB5xfu4qvomB7nSOs2N1+E1x6dlkhbX5Pl6yeV61+6btrGe61Ca8kDv3E/lubtBCDjytFLCyn
 ot2ZtSgYUbn59l0WyO4fp5eijMILLBg+RFbA54pxb3O0qmHYsEU7Xf6MvULgsUzv30d6Q1BzK3ZhmQ
 vLYJdjRuCkwHtD+FWgZNfHuL85wLRH9H7VZVsHYM5DvNq1LDZWblU84uhJxa9x1IhH9QNvYWdbudNh
 MKj2nW9417G4++HwulDwqtI/h/aKGoNVLkM4lPByFQWeSdwjNvDhDAgKIPyr13TTWyFeI6KqPfF1A3
 TWXAbdiI7bEnjhmJCfAJENISJ5BfajEcUyhrOQAWMptsL4cVi6HjfvsgJ7fk92Vagt1Nc95yRZ7wbo
 1bTnzRW+eTlILZsI+oVc7neJRo7iPwqz4VMbuisNHLCKtU5U2RsAui/aJ3bkqTCN6aZcMMLeWN9jeR
 5Sr1981EYsHHYevtwp6rua8Vp7OdaS+OKj8oikCfxhPLf3OvfEXQfejn3G+qVTbzN71qu5i5wvgQqL
 t9m+gl4nkmJ8zwHcJQRE0LVoIXTexE55U14yiHBdhcw/9T5GxhjHDrcOGerygvHY85iKIdCK4V2TKR
 7o1ZuRlo0Ua/FP6wyvXTE3d3eDNII2wzb5RcOErBgidOAqri1TtWNksiq83A==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Content-Transfer-Encoding: 8bit
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
Cc: jernej.skrabec@gmail.com, jonas@kwiboo.se,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kieran.bingham@ideasonboard.com,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent.pinchart@ideasonboard.com, biju.das.jz@bp.renesas.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the dw-hdmi bridge is in first place of the bridge chain, this
means there is no way to select an input format of the dw-hdmi HW
component.

Since introduction of display-connector, negotiation was broken since
the dw-hdmi negotiation code only worked when the dw-hdmi bridge was
in last position of the bridge chain or behind another bridge also
supporting input & output format negotiation.

Commit 7cd70656d128 ("drm/bridge: display-connector: implement bus fmts callbacks")
was introduced to make negotiation work again by making display-connector
act as a pass-through concerning input & output format negotiation.

But in the case where the dw-hdmi is single in the bridge chain, for
example on Renesas SoCs, with the display-connector bridge the dw-hdmi
is no more single, breaking output format.

Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
Bisected-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Fixes: 7cd70656d128 ("drm/bridge: display-connector: implement bus fmts callbacks").
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
---
Changes since v2:
- Add rob's r-b
- Fix invalid Fixes commit hash

Changes since v1:
- Remove bad fix in dw_hdmi_bridge_atomic_get_input_bus_fmts
- Fix typos in commit message

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 54d8fdad395f..97cdc61b57f6 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2551,8 +2551,9 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 	if (!output_fmts)
 		return NULL;
 
-	/* If dw-hdmi is the only bridge, avoid negociating with ourselves */
-	if (list_is_singular(&bridge->encoder->bridge_chain)) {
+	/* If dw-hdmi is the first or only bridge, avoid negociating with ourselves */
+	if (list_is_singular(&bridge->encoder->bridge_chain) ||
+	    list_is_first(&bridge->chain_node, &bridge->encoder->bridge_chain)) {
 		*num_output_fmts = 1;
 		output_fmts[0] = MEDIA_BUS_FMT_FIXED;
 
-- 
2.25.1

