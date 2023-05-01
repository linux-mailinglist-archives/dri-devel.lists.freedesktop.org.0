Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 161B86F2C19
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 04:57:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1084E10E1E0;
	Mon,  1 May 2023 02:57:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F77C10E1E0
 for <dri-devel@lists.freedesktop.org>; Mon,  1 May 2023 02:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682909841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=T0ZkpApH9Uyl/XYPLTJH+Oty+sLxkUjSVHrKn2yb7ns=;
 b=COMFe4VyR+AuULFo/o/q2buVnJhO4ROuY+OSpvRJG+l1tyl0yoR6QRGzekUmaGsQq+wDbd
 4vE75NjXq2NQBpnikoBwEKNOOtl6ylpNY3Vrt9irvHMA/VNvEXpf7pPexQ8MQZLjq1ZMKm
 2TqZozQklLeGITZtBETZqc2DmRix5bo=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-483-Z7NXMuJ7PHe-6d9YEaOQjA-1; Sun, 30 Apr 2023 22:57:20 -0400
X-MC-Unique: Z7NXMuJ7PHe-6d9YEaOQjA-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-5ef81bca65aso33570306d6.2
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Apr 2023 19:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682909840; x=1685501840;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T0ZkpApH9Uyl/XYPLTJH+Oty+sLxkUjSVHrKn2yb7ns=;
 b=F5zrp+CmF9e33zpEj8xTTKhsgrvlipHcpSQhOysr4ao9ONSmr9hpZnN7/Au+l0gkxb
 SjdLwgZUB/AqzBYmp+pPsjSUGUz4LyAx6GA+M6zdre1U0XLxlCVVrsdwIP2rrTbHzTjq
 eAU1IqGs/NUCkZ2XqRlvudZjT2umqPZTU2Al2WxVHwvuF+F5oNOlwgs5ZKBS7bqG3lIS
 Haquv8t9CIwX9lXqDbf/+uKu5Ntfpz/zI8Iu9EAsPS9M43l1idivaTeW4u+Pqu5aMD5s
 HNqGEZvuNjVFTQ+XzLoQgeTKFQDIxiDCXyR+eNrtsY9UOZiDIb5OfvwBdZA3hp6++TK4
 FZDQ==
X-Gm-Message-State: AC+VfDw7u6rmV5Nxpku028rPvnF0Dr/Gm7AdmuGKy4bUA2/mtb8clXXX
 QBf2yzX8Ljes2LaLxsDWk2ORoqbsiDGIyl5+2b5GE+UwgDDIm9ABKz+BJYBVrrjHpyN/Qpj3cjJ
 feVuUU4M9rUgDAUkMEZJahhFfJJSP
X-Received: by 2002:a05:6214:c82:b0:60e:98be:8694 with SMTP id
 r2-20020a0562140c8200b0060e98be8694mr16050587qvr.46.1682909839880; 
 Sun, 30 Apr 2023 19:57:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4/ljLsU87nCmXWBl5vPSzg7xYiesizXksCYmzOcSH/wrxt2VTaDcOJnMVYcKodfsqf+KRBQA==
X-Received: by 2002:a05:6214:c82:b0:60e:98be:8694 with SMTP id
 r2-20020a0562140c8200b0060e98be8694mr16050578qvr.46.1682909839687; 
 Sun, 30 Apr 2023 19:57:19 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a056214030700b005eedb5cebd1sm8307482qvu.130.2023.04.30.19.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Apr 2023 19:57:19 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, chunfeng.yun@mediatek.com,
 vkoul@kernel.org, kishon@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Subject: [PATCH] phy: mediatek: rework the floating point comparisons to fixed
 point
Date: Sun, 30 Apr 2023 22:57:16 -0400
Message-Id: <20230501025716.2905609-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

gcc on aarch64 reports
drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c: In function ‘mtk_hdmi_pll_set_rate’:
drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:240:52: error: ‘-mgeneral-regs-only’
  is incompatible with the use of floating-point types
  240 |         else if (tmds_clk >= 54 * MEGA && tmds_clk < 148.35 * MEGA)

Floating point should not be used, so rework the floating point comparisons
to fixed point.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
index abfc077fb0a8..c9501a3d90a5 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
@@ -237,11 +237,11 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
 	 */
 	if (tmds_clk < 54 * MEGA)
 		txposdiv = 8;
-	else if (tmds_clk >= 54 * MEGA && tmds_clk < 148.35 * MEGA)
+	else if (tmds_clk >= 54 * MEGA && (tmds_clk * 100) < 14835 * MEGA)
 		txposdiv = 4;
-	else if (tmds_clk >= 148.35 * MEGA && tmds_clk < 296.7 * MEGA)
+	else if ((tmds_clk * 100) >= 14835 * MEGA && (tmds_clk * 10) < 2967 * MEGA)
 		txposdiv = 2;
-	else if (tmds_clk >= 296.7 * MEGA && tmds_clk <= 594 * MEGA)
+	else if ((tmds_clk * 10) >= 2967 * MEGA && tmds_clk <= 594 * MEGA)
 		txposdiv = 1;
 	else
 		return -EINVAL;
@@ -328,12 +328,12 @@ static int mtk_hdmi_pll_drv_setting(struct clk_hw *hw)
 		clk_channel_bias = 0x34; /* 20mA */
 		impedance_en = 0xf;
 		impedance = 0x36; /* 100ohm */
-	} else if (pixel_clk >= 74.175 * MEGA && pixel_clk <= 300 * MEGA) {
+	} else if ((pixel_clk * 1000) >= 74175 * MEGA && pixel_clk <= 300 * MEGA) {
 		data_channel_bias = 0x34; /* 20mA */
 		clk_channel_bias = 0x2c; /* 16mA */
 		impedance_en = 0xf;
 		impedance = 0x36; /* 100ohm */
-	} else if (pixel_clk >= 27 * MEGA && pixel_clk < 74.175 * MEGA) {
+	} else if (pixel_clk >= 27 * MEGA && (pixel_clk * 1000) < 74175 * MEGA) {
 		data_channel_bias = 0x14; /* 10mA */
 		clk_channel_bias = 0x14; /* 10mA */
 		impedance_en = 0x0;
-- 
2.27.0

