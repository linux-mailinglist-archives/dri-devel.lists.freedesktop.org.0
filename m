Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7F722DFE9
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 17:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCEEC89F03;
	Sun, 26 Jul 2020 15:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0652F894DD;
 Sun, 26 Jul 2020 11:13:36 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id q4so6842468edv.13;
 Sun, 26 Jul 2020 04:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cs+gLIqTnPWhYBODTViZE90E8/vlMy99+hp1beAtSdc=;
 b=TfjEq8a0HN5EKRYxTu1RrtRq3PV8DWEu0s4HFYSYMFjNqF/Q/sPzeWIw6VYdwxenCy
 VSDLsjexOMBD5C4SpTiHsWj9P8IDMPWP4CZSUqFaQMuVvI8ob9Ai4ldYp3XMOJVu0Zpl
 Ae3ElERiJl2bp5NcSvoKdHLAJJmgnlomdfrMTuT45onAQEoniH5kki9IWBEIRa95myuE
 +FeVc49sACD9W+uf4ze8mpOblD0DUv4Y34PDMMWSeNHa8FRdgsVFQepYK0Q6UDpqclVZ
 sC5DcRdSiMcKGgXv+enX2h47KonLbIkBhW3nZe18zAt4LXJIfoBRxZEOXMSOOGMN8GbP
 9fTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cs+gLIqTnPWhYBODTViZE90E8/vlMy99+hp1beAtSdc=;
 b=qyzunS98KY4lZGNUvxrFjUfU50YTglvcH9MsgDuJJV3p82NwRdmTdWO6i+p0Pj/yt4
 JBOs1NPJXrx5C5fwBfcgWx8i9FN22jq546PcFwqsB5+hhC1Qsk8Sr1GCpCMpq+UiCO/X
 XcQFafLH/aiaoIaHfCOOyMnb7NC0j+hB851NxTSkbJXL9HMMw6dmkr0p/mRzNYFpa8/S
 /fcIP2ZIAMOCmZ906LF7UL5mYm/8ZULZ4m3X/VEM1rlRvFZYPDUQ6thJDiyXBLYd1GFZ
 Jl9RFdb7jfT/eS4IVkUUB0GrQkfYYG/oErvwJwx2W4ZE43eDgDvQXP+4AQukoT6cq6oS
 D/Mw==
X-Gm-Message-State: AOAM5324in2OUhFqLOrZ93Lbv01SJFL8ucYkufS54vDCGv9Q2RJq5jBc
 +ceqhsztTkJzdMMMKKJ+3Ig=
X-Google-Smtp-Source: ABdhPJweKLGsol8NQGsiYc75+IT7bG6HGpzYRGIJFqb3lQ91mVNQIxF51Gc1uUa+b+igMmW85X4QwQ==
X-Received: by 2002:aa7:c90a:: with SMTP id b10mr17062270edt.71.1595762014668; 
 Sun, 26 Jul 2020 04:13:34 -0700 (PDT)
Received: from localhost.localdomain (abad207.neoplus.adsl.tpnet.pl.
 [83.6.167.207])
 by smtp.googlemail.com with ESMTPSA id d23sm4696253ejj.74.2020.07.26.04.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 04:13:34 -0700 (PDT)
From: Konrad Dybcio <konradybcio@gmail.com>
To: konradybcio@gmail.com
Subject: [PATCH 2/9] phy: qcom-qusb2: Add support for SDM630/660
Date: Sun, 26 Jul 2020 13:11:59 +0200
Message-Id: <20200726111215.22361-3-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200726111215.22361-1-konradybcio@gmail.com>
References: <20200726111215.22361-1-konradybcio@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 26 Jul 2020 15:02:45 +0000
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
Cc: Krzysztof Wilczynski <kw@linux.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-clk@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, martin.botka1@gmail.com,
 Andy Gross <agross@kernel.org>, Brian Masney <masneyb@onstation.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Xiaozhe Shi <xiaozhes@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>, Ben Dooks <ben.dooks@codethink.co.uk>,
 Felipe Balbi <balbi@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Harigovindan P <harigovi@codeaurora.org>, linux-kernel@vger.kernel.org,
 zhengbin <zhengbin13@huawei.com>, Manu Gautam <mgautam@codeaurora.org>,
 Vinod Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QUSB on these SoCs actually uses *almost* the same
configuration that msm8996 does, so we can reuse
the phy_cfg from there with just a single change
(se clock scheme).

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 1 +
 drivers/phy/qualcomm/phy-qcom-qusb2.c                     | 7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
index b5a6195de7ff..e61a3ca3deba 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
@@ -20,6 +20,7 @@ properties:
         - enum:
           - qcom,msm8996-qusb2-phy
           - qcom,msm8998-qusb2-phy
+          - qcom,sdm660-qusb2-phy
       - items:
         - enum:
           - qcom,sc7180-qusb2-phy
diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index 393011a05b48..11852ebe9e49 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -702,7 +702,8 @@ static int qusb2_phy_init(struct phy *phy)
 	usleep_range(150, 160);
 
 	/* Default is single-ended clock on msm8996 */
-	qphy->has_se_clk_scheme = true;
+	if (!of_device_is_compatible(phy->dev.of_node, "qcom,sdm660-qusb2-phy"))
+		qphy->has_se_clk_scheme = true;
 	/*
 	 * read TCSR_PHY_CLK_SCHEME register to check if single-ended
 	 * clock scheme is selected. If yes, then disable differential
@@ -815,6 +816,10 @@ static const struct of_device_id qusb2_phy_of_match_table[] = {
 	}, {
 		.compatible	= "qcom,msm8998-qusb2-phy",
 		.data		= &msm8998_phy_cfg,
+	}, {
+		.compatible	= "qcom,sdm660-qusb2-phy",
+		/* sdm630/660 use the same config as msm8996. */
+		.data		= &msm8996_phy_cfg,
 	}, {
 		/*
 		 * Deprecated. Only here to support legacy device
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
