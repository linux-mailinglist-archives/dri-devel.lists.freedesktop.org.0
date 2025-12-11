Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3277CB7584
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 00:16:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265F010E586;
	Thu, 11 Dec 2025 23:16:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="inFqY+ea";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD4F10E8BF
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 23:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765495004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NbD172mHC2Ryq1GOWpDAGfx/N1dB3vFXjgBCreduXmM=;
 b=inFqY+eafbvq76WhH50S4bGkpYjSYy9jfcUzk50Hl9z9Z4boRso1/ucMvfxT56nIrpV8Le
 4kirpTgs8bWuqUft51k0ciGw1V6E6rdBrrgzELLSYrv2rmdYtdY6HI+yOKW+nrw0GhXBVa
 cQg8k9pUSj+ViGo0no/k8VMf2v0KbOs=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-Sde5siXbP5OEjct9NbVRmA-1; Thu, 11 Dec 2025 18:16:43 -0500
X-MC-Unique: Sde5siXbP5OEjct9NbVRmA-1
X-Mimecast-MFC-AGG-ID: Sde5siXbP5OEjct9NbVRmA_1765495003
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b2e19c8558so134009385a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 15:16:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765495003; x=1766099803;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NbD172mHC2Ryq1GOWpDAGfx/N1dB3vFXjgBCreduXmM=;
 b=NEqRcfZcHVtHZm1suWfWz3UOMd1/xrq1XTqcZwtxgEAx+aO9KfV1yz2FDwUjhADM5M
 C+2u79scK+mEgsj5ZJc6gw7SVmLRcGw7MiIL41V4lqGuHFLb0qYRZS9E27GIN+mar5Q9
 cf2nys1kEr8RXE+/YGkaZLeaN+QVKxIvTvqZtI4/vOe54VCabusHihwdmz9Mzhj3nNLr
 LHyw7gRKMVQ9PfhG9HX5NJ0abidxCHjJP++bYOPvVYbwpvKersBJyeJOpeB7AGHUf5jE
 WfI2fRjSH9NupgzXOAKSI3nwDIojy5eFXrO2WXr92tOusdy7uebbo83MJiu+1Xv30xO/
 bryw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVq/+TyPH6TAOr+3EC+/d+nJ491x3q6z4/MrDhWcE2ZX1EyU61jmQUnHzbX+kUsGGauIFnrQjJlKkc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDPtOdlyytoTxPPkwbpUGWoM/RlBkvD2Ol7I5o5n8cBP81wLPg
 OfVHSdvZ/4zAYPt6Dg/qicDDxbppguE1LMPVRScCOQkkBJUWXWphvPRdMABEXAlZmBwtiEhG0vI
 9VDF2GhQMyVO41Utk1mluJVHTQY3gQ8dDYSfAAyRXUgyIKT6xkr4+2p8seg5Npx9aH2jD7w==
X-Gm-Gg: AY/fxX7/shrtyXMVY7gWRl864jTREKQ0dH2R626Uh6kla3tSsFFPGiEk8P4sB00FWQf
 /vZ7E9uUjljn4Bklgi9a5VXUr/mWFYtEEliqt7dQ6f5ceurB3dLFCbAwRaU1n8QLxk6gI5pvxDv
 jaDw0AF0pJgbLO+ObFw0UDwyX4L7vYMmBom97j1zO4EII3m/L1eZ7akc32G74++yEJylEG3iBWc
 Km5fGHH1MJMJSHjONOGMnKEGTl7xSywGfFdcj5JJsPQKYQ72Egutz70L9pM1BoWmF2k9bAzxudO
 /vGTJCvM6SpEe4Q3SrOsvTE6+1be8yC1urV4sl9JyQeoHYuawaWvKI/nohh1vjXMA0rjE1Bd8Ql
 9UMgInN7+eHbjcDeww4dK+lChGUqJ646PHt9qqfLl4mYRCT/eHXbS9w==
X-Received: by 2002:a05:620a:45a6:b0:89e:f83c:ee0c with SMTP id
 af79cd13be357-8bb3a3935d8mr36459885a.74.1765495002900; 
 Thu, 11 Dec 2025 15:16:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHTgdmowmpGEJXfkwF3JzqsLep6RU6ll2UwJli3c/rdVkRG78nuaQFcWNbYooZO1mfConbh8A==
X-Received: by 2002:a05:620a:45a6:b0:89e:f83c:ee0c with SMTP id
 af79cd13be357-8bb3a3935d8mr36454285a.74.1765495002438; 
 Thu, 11 Dec 2025 15:16:42 -0800 (PST)
Received: from [192.168.101.129] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8bab5d4edbasm317873585a.51.2025.12.11.15.16.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 15:16:41 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH v3 0/9] phy: convert from clk round_rate() to determine_rate()
Date: Fri, 12 Dec 2025 08:16:18 +0900
Message-Id: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6CMBBFr0Jm7ZhSEcSV9zAsSpnaRm3JFBsJ4
 e5W3Lp8L/nvLxCJHUU4FwswJRdd8BkOuwK0Vf5G6IbMIIU8iqYUONoZ9eOOHF5+QFYTYaVUQ6a
 shaEW8nBkMu69Ra9dZuviFHjePpL82l/u9D+XJApsy1pWjej71sgL02DVtNfhCd26rh9mQSQJt
 QAAAA==
X-Change-ID: 20250710-phy-clk-round-rate-4aa7ef160fe9
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
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6172; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=ZY0h85yve8h09n3VMoGeby1rYSEr9a4xEaJTa8s51lM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKtAy5+Y5i0/XBSw5mcryf95CfUSLo+Naq9ozK7s1HrW
 7Omgj9XRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABOJd2VkmPPLinP7Iq1VoTP3
 9Fmcfl0v/MP2VI3J6eO5oTW5Ty8+qGdkWPvn/zz548dCZAM+uE9uzc3rkPFRMjjw9Gj7psmZsmf
 W8gAA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PcWJk4ewm5DHvopnrF2FR0Bb3ANBkv5w4fWrcINANFg_1765495003
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

The round_rate() clk ops is deprecated in the clk framework in favor
of the determine_rate() clk ops, so let's go ahead and convert the
drivers in the phy subsystem using the Coccinelle semantic patch
posted below. I did a few minor cosmetic cleanups of the code in a
few cases.

Changes since v2:
- Patch 8 (phy-rockchip-samsung-hdptx): fixed merge conflict so this now
  applies against next-20251211. Cristian / Heiko: I kept your
  Reviewed-by since structurally the code is still the same as before.
- Link to v2: https://lore.kernel.org/r/20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com

Changes since v1:
- Patch 8 (phy-rockchip-samsung-hdptx): fix returning error code
  (Cristian)

Coccinelle semantic patch:

    virtual patch

    // Look up the current name of the round_rate function
    @ has_round_rate @
    identifier round_rate_name =~ ".*_round_rate";
    identifier hw_param, rate_param, parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    	...
    }

    // Rename the route_rate function name to determine_rate()
    @ script:python generate_name depends on has_round_rate @
    round_rate_name << has_round_rate.round_rate_name;
    new_name;
    @@

    coccinelle.new_name = round_rate_name.replace("_round_rate", "_determine_rate")

    // Change rate to req->rate; also change occurrences of 'return XXX'.
    @ chg_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier ERR =~ "E.*";
    expression E;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    -return -ERR;
    +return -ERR;
    |
    - return rate_param;
    + return 0;
    |
    - return E;
    + req->rate = E;
    +
    + return 0;
    |
    - rate_param
    + req->rate
    )
    ...>
    }

    // Coccinelle only transforms the first occurrence of the rate parameter
    // Run a second time. FIXME: Is there a better way to do this?
    @ chg_rate2 depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    - rate_param
    + req->rate
    ...>
    }

    // Change parent_rate to req->best_parent_rate
    @ chg_parent_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    - *parent_rate_param
    + req->best_parent_rate
    |
    - parent_rate_param
    + &req->best_parent_rate
    )
    ...>
    }

    // Convert the function definition from round_rate() to determine_rate()
    @ func_definition depends on chg_rate @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier generate_name.new_name;
    @@

    - long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
    -               unsigned long *parent_rate_param)
    + int new_name(struct clk_hw *hw, struct clk_rate_request *req)
    {
        ...
    }

    // Update the ops from round_rate() to determine_rate()
    @ ops depends on func_definition @
    identifier has_round_rate.round_rate_name;
    identifier generate_name.new_name;
    @@

    {
        ...,
    -   .round_rate = round_rate_name,
    +   .determine_rate = new_name,
        ...,
    }

Note that I used coccinelle 1.2 instead of 1.3 since the newer version
adds unnecessary braces as described in this post.
https://lore.kernel.org/cocci/67642477-5f3e-4b2a-914d-579a54f48cbd@intel.com/

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (9):
      phy: freescale: phy-fsl-samsung-hdmi: convert from round_rate() to determine_rate()
      phy: mediatek: phy-mtk-hdmi-mt2701: convert from round_rate() to determine_rate()
      phy: mediatek: phy-mtk-hdmi-mt8173: convert from round_rate() to determine_rate()
      phy: mediatek: phy-mtk-hdmi-mt8195: convert from round_rate() to determine_rate()
      phy: mediatek: phy-mtk-mipi-dsi-mt8173: convert from round_rate() to determine_rate()
      phy: mediatek: phy-mtk-mipi-dsi-mt8183: convert from round_rate() to determine_rate()
      phy: rockchip: phy-rockchip-inno-hdmi: convert from round_rate() to determine_rate()
      phy: rockchip: phy-rockchip-samsung-hdptx: convert from round_rate() to determine_rate()
      phy: ti: phy-j721e-wiz: convert from round_rate() to determine_rate()

 drivers/phy/freescale/phy-fsl-samsung-hdmi.c      | 13 ++++++----
 drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c        |  8 +++---
 drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c        | 16 ++++++------
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c        | 10 ++++----
 drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c    | 10 +++++---
 drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c    | 10 +++++---
 drivers/phy/rockchip/phy-rockchip-inno-hdmi.c     | 30 ++++++++++++-----------
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 15 +++++++-----
 drivers/phy/ti/phy-j721e-wiz.c                    | 11 ++++++---
 9 files changed, 69 insertions(+), 54 deletions(-)
---
base-commit: 5ce74bc1b7cb2732b22f9c93082545bc655d6547
change-id: 20250710-phy-clk-round-rate-4aa7ef160fe9

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

