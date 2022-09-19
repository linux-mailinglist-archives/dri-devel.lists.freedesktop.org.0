Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 751595BD301
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 19:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF49410E125;
	Mon, 19 Sep 2022 17:01:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D5C910E071
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 17:00:16 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id lh5so67002ejb.10
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 10:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date;
 bh=23EqGi3gFXXOB6EHxNrULl8XJT9OcS+TsgqB/BHqbHw=;
 b=cn9iS0q0xgkjHJD+ds6dZQH5Wy9i/TPkeNeu1+g/E8IpAhA+7/wzTwuy7sZV3qHvfQ
 GC/lUWWZJ92voqvSw2+0phX12M4JLdIbDHkhE+jM7LKwpctaymK9eaAv17XKtP6uRqnn
 4kqirP8cJnH0CPHjDEkXydaKMjHfFtUdgLMpTup6zuKcOicQQ6jeMHFPeHK/Gl4qLwah
 yrKgsk45GGW17HRqO1FIk3NnwzwIkgCbTq8T7p/Hje+0dxGUVe6op7iQ0gRQsLeYldiI
 1q+9QKpoYBPCHArfwScqBaDWwBgERHtGHIRSLAdz/VQBZyeHVoC4Yqz5qDa4kvYw6HMe
 LwbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=23EqGi3gFXXOB6EHxNrULl8XJT9OcS+TsgqB/BHqbHw=;
 b=g5NFzvOof58EHHt8lbuqHZhDcgnFQ6XYBnc7ZbLWl7fUWQyT/nsP0Wrw8iI76jp/j8
 MYMQ0HiwDcPs3f232VzDzEUqeweKE8/p000B/OTaDWt2niPCWoHxJBstr/XlC+aldRJe
 evtkdykLT0c+91xtjTJhSPVu5btjUiEistUm7enChWmgEISc5WLrhM69Lg419C+ldd+u
 JI82dElq/CM+xJcT/n6TxJgzUS/2HjNNrz+WzVjstiD1b8RnmHBhu/Z5S3lFOgYPqjFD
 veBIiJ9baPZdJmHE9q3tjd32czk8aK+w64x/MVqsoaTC4law/6qlT7eCwegJeBuqodRR
 Y3Mg==
X-Gm-Message-State: ACrzQf3uTRntV1Fz8E6/n57+m9UTg+hCANUe6lcbOW2cwcfJAqmqf9gY
 xaVBkEPTxmGGprhTdd/7xiM9cGhf61BwUQ==
X-Google-Smtp-Source: AMsMyM4ibbztqMuL5CwwVz+5760qZJ0rcMYySRyQ9feIjgEn12tXb0Qh8bg5Wo1IiM/vXpoPAiZsRg==
X-Received: by 2002:a17:907:728d:b0:77e:1942:f772 with SMTP id
 dt13-20020a170907728d00b0077e1942f772mr13919231ejc.222.1663606815174; 
 Mon, 19 Sep 2022 10:00:15 -0700 (PDT)
Received: from [127.0.0.1]
 (2a02-8440-6340-f287-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6340:f287:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 cf16-20020a0564020b9000b0044fc3c0930csm20424246edb.16.2022.09.19.10.00.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 10:00:14 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Mon, 19 Sep 2022 18:56:11 +0200
Subject: [PATCH v1 13/17] phy: phy-mtk-hdmi: Add generic phy configure callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v1-13-4844816c9808@baylibre.com>
References: <20220919-v1-0-4844816c9808@baylibre.com>
In-Reply-To: <20220919-v1-0-4844816c9808@baylibre.com>
To: Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@linux.ie>, 
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
X-Mailer: b4 0.10.0-dev
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
Cc: devicetree@vger.kernel.org, Guillaume Ranquet <granquet@baylibre.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 Pablo Sun <pablo.sun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some phys, such as mt8195, needs to have a configure callback defined.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.c b/drivers/phy/mediatek/phy-mtk-hdmi.c
index d4bd419abc3c..af46472237e0 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi.c
@@ -8,10 +8,12 @@
 
 static int mtk_hdmi_phy_power_on(struct phy *phy);
 static int mtk_hdmi_phy_power_off(struct phy *phy);
+static int mtk_hdmi_phy_configure(struct phy *phy, union phy_configure_opts *opts);
 
 static const struct phy_ops mtk_hdmi_phy_dev_ops = {
 	.power_on = mtk_hdmi_phy_power_on,
 	.power_off = mtk_hdmi_phy_power_off,
+	.configure = mtk_hdmi_phy_configure,
 	.owner = THIS_MODULE,
 };
 
@@ -76,6 +78,16 @@ static int mtk_hdmi_phy_power_off(struct phy *phy)
 	return 0;
 }
 
+static int mtk_hdmi_phy_configure(struct phy *phy, union phy_configure_opts *opts)
+{
+	struct mtk_hdmi_phy *hdmi_phy = phy_get_drvdata(phy);
+
+	if (hdmi_phy->conf->hdmi_phy_configure)
+		return hdmi_phy->conf->hdmi_phy_configure(phy, opts);
+
+	return 0;
+}
+
 static const struct phy_ops *
 mtk_hdmi_phy_dev_get_ops(const struct mtk_hdmi_phy *hdmi_phy)
 {
diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.h b/drivers/phy/mediatek/phy-mtk-hdmi.h
index dcf9bb13699b..05de93f63a61 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi.h
+++ b/drivers/phy/mediatek/phy-mtk-hdmi.h
@@ -25,6 +25,7 @@ struct mtk_hdmi_phy_conf {
 	const struct clk_ops *hdmi_phy_clk_ops;
 	void (*hdmi_phy_enable_tmds)(struct mtk_hdmi_phy *hdmi_phy);
 	void (*hdmi_phy_disable_tmds)(struct mtk_hdmi_phy *hdmi_phy);
+	int (*hdmi_phy_configure)(struct phy *phy, union phy_configure_opts *opts);
 };
 
 struct mtk_hdmi_phy {

-- 
b4 0.10.0-dev
