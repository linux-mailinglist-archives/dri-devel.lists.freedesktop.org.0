Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB86715703
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 09:38:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4420C10E359;
	Tue, 30 May 2023 07:38:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1582610E353
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 07:38:19 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-30ae901a9ffso1991941f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 00:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685432298; x=1688024298;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ctRkf1Nrzpq+Bo2Yx960UtDdp4B1S01USNtgO/gQUhM=;
 b=jMMrGUJAvfTZrZqX1mfK3okGKWvfNOoy+yZ4cMmFMBEU5SuvcgxRjsnG3DAsSLAZYT
 +8ANXDrhIBZOpGdTZFDJa4xt4wOU9Yy1GrENAbMGs0cSSklsmTzzdaPR7sbjsq4Hlwcv
 jL12ccLOUzaLRA+3w8EKTc5xC61IdMlSvE1LioGfP7sHYLJRWH866kG06J838NOfE0lG
 +DMABJ5t4tJxq6AAlh2GD0v6jQRgizrj41ayPgvVyaKbAwvbwpHWZtxOTCWeL8qOwvx5
 eo5dOW1P8R1GPTcODWWuc34BDSeSxqmO1B4LncBZQE6gR2jSF8pfoip9FN8103eg+FD/
 Qurw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685432298; x=1688024298;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ctRkf1Nrzpq+Bo2Yx960UtDdp4B1S01USNtgO/gQUhM=;
 b=N5/x08GGOsuOshtC95meXsbwFO9N+KWymZ5NKa1YhLDlASk7bZJLJcO3wE1PRq3zj4
 4G0virrvKUAroMwSqhvlUaYXi++Nzs8XtOcIzWoMrYKi/9SUc9iYHcqRjwog9VNbBZ2l
 gsMmgP2ADAiFDFwza4Olxr/v74h4Apd1cTS9YtFqmADF9r19NJyL597SM9O3Ufax3uhA
 g1aBhv/f7sGJwZ3Nn4Fr7xQw3T/KXxGtA4vTmdUiPv/+MYjrWNrGa4LTSI+dfaKA0FON
 60IIdaZyWIn+RunE+U3RI7dBKbgp89UNsffiOE6bk/+NhjfNneHt9vW7PD4sYEB0mtBD
 4p3A==
X-Gm-Message-State: AC+VfDyOfNnjUFxUzc1zCGYtce305tDPnodpHC3G1UvxOhBKguRqd8OR
 PS7xpS95tp1YGDurSNqvuVSgZg==
X-Google-Smtp-Source: ACHHUZ4C7tOtF573M3nwtI82CwuRsBcqayZMHzvOm/CW35Q7iEfXvwMttSTu2aZcZb8Vt79OK5xKIQ==
X-Received: by 2002:adf:e74d:0:b0:2f7:8f62:1a45 with SMTP id
 c13-20020adfe74d000000b002f78f621a45mr1236774wrn.66.1685432298189; 
 Tue, 30 May 2023 00:38:18 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a5d4a04000000b003079c402762sm2312013wrq.19.2023.05.30.00.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 00:38:17 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 30 May 2023 09:38:05 +0200
Subject: [PATCH v5 04/17] clk: meson: g12: use VCLK2_SEL, CTS_ENCL &
 CTS_ENCL_SEL public CLK IDs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-4-56eb7a4d5b8e@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4965;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ykSwF0V0lUS+Xeggc75UkrBZ6e3mEPjzepbC0GhniEs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkdafeS+RBYJ5gBUnorLdUmAymfM1ZVs6kR7L/wisf
 VI37kfGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZHWn3gAKCRB33NvayMhJ0T+CEA
 DGHyBfRCXIDqYZbNurPI1sb/Ze3ilqYZTVrrQuJjM90Tdl5a0o8b0qbWQ4kDxqEAAU/IEY99JNJfed
 fN2ZePLSSArZ3dWZ27Uz9sHdan8oAH6ato+VnQaXwv0Gr2sVJd0pkIOhITtBi9S/R4LLjuwi4t3n/d
 j5HDJAkYcOJdI7Dchkjdz48fItlAadx8zAsSwHVL/kKBE9wAQOGjeK1ew+fIyDCkNvQOTadJCi6NxA
 aV+cql+M0q6BDWHu4yicOdD2mFyMSpVKCToEI/FLBTD+ygyZvxe3eQuKD9SGVqnMC599JfvAAI0N1W
 oo9R9a2rBKGTakLKlQkvN2mZ2m+8Irmb+TzSa6KuKz7KdvfOt+yr5DKoI8P8xh0PxcafZupyoPe96J
 zYufDbbAKJ1HvsSWuPk5qiU1wcEmDl8aPbkq48H0J7VDdNgCUIKvpkj3OjW9Q00lhqlubi20bMLBHd
 DawwHZqV4+uT/DnKHLjjAJXDw3M0lbx8Q7bmDywDggDW9DVEo2WdK2PEFe4Dn4h+ffxePtd3kPt3NU
 NugxodI/LFlkkgSxrZ0PRvdcAa8mVl34uRbcF+ObjLhe/HiKKIBhKZax7QZsWqxLYX/KjGc940s/fL
 jLXmJXY5pD4LmSVneMDFo94J6M24fGigo/zZALq+zEpiX1hoqd4Pmbwr0KDQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nicolas Belin <nbelin@baylibre.com>, linux-phy@lists.infradead.org,
 linux-amlogic@lists.infradead.org, "Lukas F. Hartmann" <lukas@mntre.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now those CLK IDs were added to the public bindings header, switch
to use those defines and drop the PRIV defines.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/meson/g12a.c | 18 +++++++++---------
 drivers/clk/meson/g12a.h |  3 ---
 2 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index a132aad2aac9..461ebd79497c 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -4411,7 +4411,7 @@ static struct clk_hw_onecell_data g12a_hw_onecell_data = {
 		[CLKID_PRIV_VID_PLL_SEL]	= &g12a_vid_pll_sel.hw,
 		[CLKID_PRIV_VID_PLL_DIV]	= &g12a_vid_pll.hw,
 		[CLKID_PRIV_VCLK_SEL]		= &g12a_vclk_sel.hw,
-		[CLKID_PRIV_VCLK2_SEL]		= &g12a_vclk2_sel.hw,
+		[CLKID_VCLK2_SEL]		= &g12a_vclk2_sel.hw,
 		[CLKID_PRIV_VCLK_INPUT]		= &g12a_vclk_input.hw,
 		[CLKID_PRIV_VCLK2_INPUT]	= &g12a_vclk2_input.hw,
 		[CLKID_PRIV_VCLK_DIV]		= &g12a_vclk_div.hw,
@@ -4438,12 +4438,12 @@ static struct clk_hw_onecell_data g12a_hw_onecell_data = {
 		[CLKID_VCLK2_DIV12]		= &g12a_vclk2_div12.hw,
 		[CLKID_PRIV_CTS_ENCI_SEL]	= &g12a_cts_enci_sel.hw,
 		[CLKID_PRIV_CTS_ENCP_SEL]	= &g12a_cts_encp_sel.hw,
-		[CLKID_PRIV_CTS_ENCL_SEL]	= &g12a_cts_encl_sel.hw,
+		[CLKID_CTS_ENCL_SEL]		= &g12a_cts_encl_sel.hw,
 		[CLKID_PRIV_CTS_VDAC_SEL]	= &g12a_cts_vdac_sel.hw,
 		[CLKID_PRIV_HDMI_TX_SEL]	= &g12a_hdmi_tx_sel.hw,
 		[CLKID_CTS_ENCI]		= &g12a_cts_enci.hw,
 		[CLKID_CTS_ENCP]		= &g12a_cts_encp.hw,
-		[CLKID_PRIV_CTS_ENCL]		= &g12a_cts_encl.hw,
+		[CLKID_CTS_ENCL]		= &g12a_cts_encl.hw,
 		[CLKID_CTS_VDAC]		= &g12a_cts_vdac.hw,
 		[CLKID_HDMI_TX]			= &g12a_hdmi_tx.hw,
 		[CLKID_PRIV_HDMI_SEL]		= &g12a_hdmi_sel.hw,
@@ -4642,7 +4642,7 @@ static struct clk_hw_onecell_data g12b_hw_onecell_data = {
 		[CLKID_PRIV_VID_PLL_SEL]	= &g12a_vid_pll_sel.hw,
 		[CLKID_PRIV_VID_PLL_DIV]	= &g12a_vid_pll.hw,
 		[CLKID_PRIV_VCLK_SEL]		= &g12a_vclk_sel.hw,
-		[CLKID_PRIV_VCLK2_SEL]		= &g12a_vclk2_sel.hw,
+		[CLKID_VCLK2_SEL]		= &g12a_vclk2_sel.hw,
 		[CLKID_PRIV_VCLK_INPUT]		= &g12a_vclk_input.hw,
 		[CLKID_PRIV_VCLK2_INPUT]	= &g12a_vclk2_input.hw,
 		[CLKID_PRIV_VCLK_DIV]		= &g12a_vclk_div.hw,
@@ -4669,12 +4669,12 @@ static struct clk_hw_onecell_data g12b_hw_onecell_data = {
 		[CLKID_VCLK2_DIV12]		= &g12a_vclk2_div12.hw,
 		[CLKID_PRIV_CTS_ENCI_SEL]	= &g12a_cts_enci_sel.hw,
 		[CLKID_PRIV_CTS_ENCP_SEL]	= &g12a_cts_encp_sel.hw,
-		[CLKID_PRIV_CTS_ENCL_SEL]	= &g12a_cts_encl_sel.hw,
+		[CLKID_CTS_ENCL_SEL]		= &g12a_cts_encl_sel.hw,
 		[CLKID_PRIV_CTS_VDAC_SEL]	= &g12a_cts_vdac_sel.hw,
 		[CLKID_PRIV_HDMI_TX_SEL]	= &g12a_hdmi_tx_sel.hw,
 		[CLKID_CTS_ENCI]		= &g12a_cts_enci.hw,
 		[CLKID_CTS_ENCP]		= &g12a_cts_encp.hw,
-		[CLKID_PRIV_CTS_ENCL]		= &g12a_cts_encl.hw,
+		[CLKID_CTS_ENCL]		= &g12a_cts_encl.hw,
 		[CLKID_CTS_VDAC]		= &g12a_cts_vdac.hw,
 		[CLKID_HDMI_TX]			= &g12a_hdmi_tx.hw,
 		[CLKID_PRIV_HDMI_SEL]		= &g12a_hdmi_sel.hw,
@@ -4908,7 +4908,7 @@ static struct clk_hw_onecell_data sm1_hw_onecell_data = {
 		[CLKID_PRIV_VID_PLL_SEL]	= &g12a_vid_pll_sel.hw,
 		[CLKID_PRIV_VID_PLL_DIV]	= &g12a_vid_pll.hw,
 		[CLKID_PRIV_VCLK_SEL]		= &g12a_vclk_sel.hw,
-		[CLKID_PRIV_VCLK2_SEL]		= &g12a_vclk2_sel.hw,
+		[CLKID_VCLK2_SEL]		= &g12a_vclk2_sel.hw,
 		[CLKID_PRIV_VCLK_INPUT]		= &g12a_vclk_input.hw,
 		[CLKID_PRIV_VCLK2_INPUT]	= &g12a_vclk2_input.hw,
 		[CLKID_PRIV_VCLK_DIV]		= &g12a_vclk_div.hw,
@@ -4935,12 +4935,12 @@ static struct clk_hw_onecell_data sm1_hw_onecell_data = {
 		[CLKID_VCLK2_DIV12]		= &g12a_vclk2_div12.hw,
 		[CLKID_PRIV_CTS_ENCI_SEL]	= &g12a_cts_enci_sel.hw,
 		[CLKID_PRIV_CTS_ENCP_SEL]	= &g12a_cts_encp_sel.hw,
-		[CLKID_PRIV_CTS_ENCL_SEL]	= &g12a_cts_encl_sel.hw,
+		[CLKID_CTS_ENCL_SEL]		= &g12a_cts_encl_sel.hw,
 		[CLKID_PRIV_CTS_VDAC_SEL]	= &g12a_cts_vdac_sel.hw,
 		[CLKID_PRIV_HDMI_TX_SEL]	= &g12a_hdmi_tx_sel.hw,
 		[CLKID_CTS_ENCI]		= &g12a_cts_enci.hw,
 		[CLKID_CTS_ENCP]		= &g12a_cts_encp.hw,
-		[CLKID_PRIV_CTS_ENCL]		= &g12a_cts_encl.hw,
+		[CLKID_CTS_ENCL]		= &g12a_cts_encl.hw,
 		[CLKID_CTS_VDAC]		= &g12a_cts_vdac.hw,
 		[CLKID_HDMI_TX]			= &g12a_hdmi_tx.hw,
 		[CLKID_PRIV_HDMI_SEL]		= &g12a_hdmi_sel.hw,
diff --git a/drivers/clk/meson/g12a.h b/drivers/clk/meson/g12a.h
index 9a3091fcaa41..8275413f2beb 100644
--- a/drivers/clk/meson/g12a.h
+++ b/drivers/clk/meson/g12a.h
@@ -168,7 +168,6 @@
 #define CLKID_PRIV_VID_PLL_SEL			130
 #define CLKID_PRIV_VID_PLL_DIV			131
 #define CLKID_PRIV_VCLK_SEL			132
-#define CLKID_PRIV_VCLK2_SEL			133
 #define CLKID_PRIV_VCLK_INPUT			134
 #define CLKID_PRIV_VCLK2_INPUT			135
 #define CLKID_PRIV_VCLK_DIV			136
@@ -265,8 +264,6 @@
 #define CLKID_PRIV_NNA_CORE_CLK_SEL		265
 #define CLKID_PRIV_NNA_CORE_CLK_DIV		266
 #define CLKID_PRIV_MIPI_DSI_PXCLK_DIV		268
-#define CLKID_PRIV_CTS_ENCL			271
-#define CLKID_PRIV_CTS_ENCL_SEL			272
 
 #define NR_CLKS					273
 

-- 
2.34.1

