Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B0C61990E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 15:14:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E09F10E7EB;
	Fri,  4 Nov 2022 14:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2A8910E7E9
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 14:14:25 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id h9so7303693wrt.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Nov 2022 07:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7ZMIvZlN2RweJkUN5B//uFf7tgMLArGLgtt1G8UfvMA=;
 b=vaZQ6TBoKkbx6TGxCcFW+YH+RxWS+kSPBpJm20J0qkLGMHIEa0T1ZM2r2Zqy6pJ5gF
 1q5R0qy6Cx33RKk0/W4UYWCc3HAqeVlyBulwzqdGQ4r6019aq24y6lYW/8hd/8C8ynqL
 xIl4S6/k4pj9slu3IkHzLkj6jHAp3cWFHdS3XbU8OHjl/IpRC8JmYlVRpIqlyV0wVP+Z
 0141hvtRLwVgnNzOCE+ahZzOOgGzGq2BLnrRBJlONSwoGtZVYYdEri//pLry3Cf7ibyT
 meRI7L/rIoGsKpR3HROJLlLhdp8PBdIUk8AyBYOqpoyNk1lHRar4rDHdxG++TFo4zafr
 HhAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7ZMIvZlN2RweJkUN5B//uFf7tgMLArGLgtt1G8UfvMA=;
 b=55ELT2whpJo94Wvxt5kfG2P8b0bgeY6YhOvIgnDFx8J/AktBr/0zNHQoSc+AGgz2ET
 OlURY0MYtsbQrCrjrI0laocaCR9DhTCc9PRMWOnTu5x/MGnRbW9kFKUPJehZ+F/xhB6W
 LECFbiFX1YQG5yG7ToKkUixqQXuJXOATMhw/gR/IrBcdVJv4mGJh813/qWgwkejQMLQw
 z6+wyWGc1Q0wDbN1rPeWRqkVSTkIwvCNXLWAjmzQ6Xp9h1i/8toMAhrKLH409+o8QsGI
 oQEeKV97sQcPbmervBZ3mmM5/eza/GJ50KD5LWcdx1bXsWCBf1fnry9FYPN+g8Om4rR/
 KOUw==
X-Gm-Message-State: ACrzQf0HU2tyU/RfIHYF787k8FdFfHPN5WLDLYhTMgRoIsP/R2QEx+dE
 oPBXY5tMuoOvHt1g5eS9Lz/fkA==
X-Google-Smtp-Source: AMsMyM6vxkBTMx3zpCwdVJDHci7QUsUI/9KYwNLHnBbluAYJIfNZUyVM5fn6RwNaPAlohJffVGFYwQ==
X-Received: by 2002:a05:6000:1c08:b0:236:e52d:b0d7 with SMTP id
 ba8-20020a0560001c0800b00236e52db0d7mr215846wrb.46.1667571264124; 
 Fri, 04 Nov 2022 07:14:24 -0700 (PDT)
Received: from [127.0.0.1]
 (2a02-8440-6440-7fff-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6440:7fff:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 bj9-20020a0560001e0900b002365cd93d05sm3594512wrb.102.2022.11.04.07.14.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 07:14:23 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Fri, 04 Nov 2022 15:09:55 +0100
Subject: [PATCH v3 09/12] phy: phy-mtk-hdmi: Add generic phy configure callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v3-9-a803f2660127@baylibre.com>
References: <20220919-v3-0-a803f2660127@baylibre.com>
In-Reply-To: <20220919-v3-0-a803f2660127@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Jitao shi <jitao.shi@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, 
 CK Hu <ck.hu@mediatek.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Kishon Vijay Abraham I <kishon@ti.com>
X-Mailer: b4 0.11.0-dev
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mac.shen@mediatek.com, stuart.lee@mediatek.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some phys, such as mt8195, needs to have a configure callback defined.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi.c | 12 ++++++++++++
 drivers/phy/mediatek/phy-mtk-hdmi.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.c b/drivers/phy/mediatek/phy-mtk-hdmi.c
index b16d437d6721..32f713301768 100644
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
 
@@ -43,6 +45,16 @@ static int mtk_hdmi_phy_power_off(struct phy *phy)
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
index c7fa65cff989..f5aac9d352d8 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi.h
+++ b/drivers/phy/mediatek/phy-mtk-hdmi.h
@@ -24,6 +24,7 @@ struct mtk_hdmi_phy_conf {
 	const struct clk_ops *hdmi_phy_clk_ops;
 	void (*hdmi_phy_enable_tmds)(struct mtk_hdmi_phy *hdmi_phy);
 	void (*hdmi_phy_disable_tmds)(struct mtk_hdmi_phy *hdmi_phy);
+	int (*hdmi_phy_configure)(struct phy *phy, union phy_configure_opts *opts);
 };
 
 struct mtk_hdmi_phy {

-- 
b4 0.11.0-dev
