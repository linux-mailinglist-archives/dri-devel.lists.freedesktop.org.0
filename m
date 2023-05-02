Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0185D6F4656
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 16:50:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A7F10E29E;
	Tue,  2 May 2023 14:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1EBD10E29E
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 14:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683039030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XhmeR7C2zfghm/IL/as+Y+pN51ISJ3AaRZIBkHirVVA=;
 b=MW9c6QbT+K2SwEofhsFBvoyIAlkomDWVsoltZmbc38ZxDHjdkV+UEp5pz5ICp3KAtWa7wS
 5yOT7rLiqGBQcBljPsxt3a5TLNSOfRsQnCfDP/0AkLATU4pjksZs/Y8negXCJVp4JZA2T/
 OnIY9pKdKyxWJSdW5oLEaJPXG+3eOC0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-2sFFUhscO06b1uDS8eJ99g-1; Tue, 02 May 2023 10:50:27 -0400
X-MC-Unique: 2sFFUhscO06b1uDS8eJ99g-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-74e3f0a8349so215454585a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 May 2023 07:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683039027; x=1685631027;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XhmeR7C2zfghm/IL/as+Y+pN51ISJ3AaRZIBkHirVVA=;
 b=F3ePyGlDI7M3MsasxGVFNPBId1WtPAat8JRAG69Ioq9CmACOi6AbJ76ecz+z2wrmwO
 zwHOfFZN8LDJfQmWFhB+pwCy4xwyPp4CgC7hNCfJoR13qc69nCZ++x6Zr4zvpSXTYkNx
 rTrhP7zRincwzNW78yy/ePbKdCuglB+9zRTrYpL9WVtDPRZgv8UB1mBFFGfpcpyJC4Ej
 cdhc9KxjlALiUFS1hO71fZXWMcL1YOB2DUpBdETkKyAhgudkb7DKzNaR3UW7cW+DqXFy
 1dqkSOFIwstUt5vvtOSs8/XzbF/s254aY1vyTUhGqiSWqom1vTrh+8HVROddVVhJSuc2
 4wjw==
X-Gm-Message-State: AC+VfDyec4R7LOJbA+7bvUz4SLFDS79HG2olWuhJd3WqzVO7tI+UuqD0
 5HyVTObXmhB2dPquZv8I/iVdyoz/ekcnR037GeYRCOROdoCOoGv3uGwY2ioRPGlX/2hflEV92aG
 +PUqyGNchu3K5VPKkNRo3zIfjz3Ee
X-Received: by 2002:a05:622a:143:b0:3ea:bec4:ef57 with SMTP id
 v3-20020a05622a014300b003eabec4ef57mr28954468qtw.13.1683039027422; 
 Tue, 02 May 2023 07:50:27 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4dHp9unnIVk0+Doy1XuqLSB0Po7DZSJ94Ylm3eZ5tLIvbR2wMADu2J7HkOiAWMy91uB3Mwgg==
X-Received: by 2002:a05:622a:143:b0:3ea:bec4:ef57 with SMTP id
 v3-20020a05622a014300b003eabec4ef57mr28954428qtw.13.1683039027172; 
 Tue, 02 May 2023 07:50:27 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 g7-20020ac81247000000b003ef3bbd242asm10343812qtj.32.2023.05.02.07.50.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 07:50:26 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, chunfeng.yun@mediatek.com,
 vkoul@kernel.org, kishon@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Subject: [PATCH v2] phy: mediatek: rework the floating point comparisons to
 fixed point
Date: Tue,  2 May 2023 10:50:05 -0400
Message-Id: <20230502145005.2927101-1-trix@redhat.com>
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
v2: silence robot by casting types to u64

---
drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
index abfc077fb0a8..093c4d1da557 100644
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
+	} else if (((u64)pixel_clk * 1000) >= 74175 * MEGA && pixel_clk <= 300 * MEGA) {
 		data_channel_bias = 0x34; /* 20mA */
 		clk_channel_bias = 0x2c; /* 16mA */
 		impedance_en = 0xf;
 		impedance = 0x36; /* 100ohm */
-	} else if (pixel_clk >= 27 * MEGA && pixel_clk < 74.175 * MEGA) {
+	} else if (pixel_clk >= 27 * MEGA && ((u64)pixel_clk * 1000) < 74175 * MEGA) {
 		data_channel_bias = 0x14; /* 10mA */
 		clk_channel_bias = 0x14; /* 10mA */
 		impedance_en = 0x0;
-- 
2.27.0

