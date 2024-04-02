Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CFB895126
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 12:59:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1AF410FC55;
	Tue,  2 Apr 2024 10:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=shruggie-ro.20230601.gappssmtp.com header.i=@shruggie-ro.20230601.gappssmtp.com header.b="T4QkUHb0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A0010FC5A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 10:59:51 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a4a393b699fso753455366b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Apr 2024 03:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shruggie-ro.20230601.gappssmtp.com; s=20230601; t=1712055590; x=1712660390;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/xHYPXNx2h46gZYDFc9h0qpHaxqChYbQzhX9Mgt5D3Y=;
 b=T4QkUHb0ySapPMkpSe2arY51NXTWkJ+Ut/qOUuboDmxawje/My0x6Q5TdB8rXteFMJ
 jvWRRPFh5T3R7A1tWcUkiuAAE8RGaprxpuAvg2GaIqIDPse/XMkEtBTeqldLUyal7gaB
 gC9PD0xX4r4P+sPJLTJ6WP3YRSkwxXQqv4m7yedA3RgmBN/3n7w95Sif/WPx0IkjyKsd
 Q55xzpOZc4OEm+mI+j+rM19mtGgSbzoMgsTa2Mxu6DO/tW8Wo9hDFwDlLGvyQlunMlZr
 9xZTbkgK88AULQ5gV5ySDb3RwBcnRjaGFli2bmqx7vHxf6fEVwiFKlUdP8V8i02+AF9p
 v/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712055590; x=1712660390;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/xHYPXNx2h46gZYDFc9h0qpHaxqChYbQzhX9Mgt5D3Y=;
 b=jPGFswXC4nBg/Ee2YKxt4CgrOS/CE5pqsUi1rhelqJvH5uKp7wJha+z2zUCmHuSf6Z
 VF413ujN/AeiAIwiEDn6F6+Fkfn5X7Ubjy9CQ3mI3teu5abZEgtNeuypohbAmkiUX6/n
 GrNEOw36/GLGM1H/w/qP6O1c/uRmuxMwy6P9hxbJkJjV3d1CASH2+zrbvJHgfAWPRv03
 vTh9GtiPVk+UI49bjbNSy00qWR8EKSH/BeZ86+JTv7+RSL12TNugqsdG0Eqt/Mq3YG5A
 0WV5/6QO1LMGe6YUnLa2igAzdsKBS9PKZcCQuchNKihIft2e6ZfTzmWg5eKVJNuCEFtc
 v5+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrLDO4fAd9RYIKDAtaQefw0pHDzf7gjr67TYCax0sFCbuk+c8Nb6uipKLJYvLohlhPwSA0ZRo885DWcasbexDJ+iPwSXmyej1YmYKpopBg
X-Gm-Message-State: AOJu0YwwaeOltxV3zm+qt57n0DUFZrFFWgwLrrgiwOVjZosCA1ULRZPO
 uArr36uJbxp0Gk6ArW2veqBtZLrO5T4Ax5gy1/CSzMCYtbbBUpunyIAUk/FTTyo=
X-Google-Smtp-Source: AGHT+IGa+NA1FgnIiV2VfDXy9ye9++b9ByVqAg4FCZ08kg46GwnDhf8HaPy5NcbTWJ6S0TKVE0o+nA==
X-Received: by 2002:a17:907:3f20:b0:a4e:4981:d3fb with SMTP id
 hq32-20020a1709073f2000b00a4e4981d3fbmr8787279ejc.29.1712055589421; 
 Tue, 02 Apr 2024 03:59:49 -0700 (PDT)
Received: from localhost.localdomain ([188.27.131.149])
 by smtp.gmail.com with ESMTPSA id
 a17-20020a170906275100b00a4644397aa9sm6398780ejd.67.2024.04.02.03.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Apr 2024 03:59:49 -0700 (PDT)
From: Alexandru Ardelean <alex@shruggie.ro>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Cc: adrien.grassein@gmail.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 stefan.eichenberger@toradex.com, francesco.dolcini@toradex.com,
 marius.muresan@mxt.ro, irina.muresan@mxt.ro,
 Alexandru Ardelean <alex@shruggie.ro>
Subject: [PATCH 1/2] drm/bridge: lt8912b: add support for P/N pin swap
Date: Tue,  2 Apr 2024 13:59:24 +0300
Message-ID: <20240402105925.905144-1-alex@shruggie.ro>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On some HW designs, it's easier for the layout if the P/N pins are swapped.
In those cases, we need to adjust (for this) by configuring the MIPI analog
registers differently. Specifically, register 0x3e needs to be 0xf6
(instead of 0xd6).

This change adds a 'lontium,pn-swap' device-tree property to configure the
MIPI analog registers for P/N swap.

Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
---
 drivers/gpu/drm/bridge/lontium-lt8912b.c | 25 +++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 4b2ae27f0a57f..154126bb922b4 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -47,6 +47,7 @@ struct lt8912 {
 
 	u8 data_lanes;
 	bool is_power_on;
+	bool do_pn_swap;
 };
 
 static int lt8912_write_init_config(struct lt8912 *lt)
@@ -78,15 +79,31 @@ static int lt8912_write_init_config(struct lt8912 *lt)
 		{0x55, 0x44},
 		{0x57, 0x01},
 		{0x5a, 0x02},
-
-		/*MIPI Analog*/
+	};
+	const struct reg_sequence mipi_analog_seq[] = {
 		{0x3e, 0xd6},
 		{0x3f, 0xd4},
 		{0x41, 0x3c},
 		{0xB2, 0x00},
 	};
+	const struct reg_sequence mipi_analog_pn_swap_seq[] = {
+		{0x3e, 0xf6},
+		{0x3f, 0xd4},
+		{0x41, 0x3c},
+		{0xB2, 0x00},
+	};
+	int ret;
 
-	return regmap_multi_reg_write(lt->regmap[I2C_MAIN], seq, ARRAY_SIZE(seq));
+	ret = regmap_multi_reg_write(lt->regmap[I2C_MAIN], seq, ARRAY_SIZE(seq));
+	if (ret < 0)
+		return ret;
+
+	if (!lt->do_pn_swap)
+		return regmap_multi_reg_write(lt->regmap[I2C_MAIN], mipi_analog_seq,
+					      ARRAY_SIZE(mipi_analog_seq));
+
+	return regmap_multi_reg_write(lt->regmap[I2C_MAIN], mipi_analog_pn_swap_seq,
+				      ARRAY_SIZE(mipi_analog_pn_swap_seq));
 }
 
 static int lt8912_write_mipi_basic_config(struct lt8912 *lt)
@@ -702,6 +719,8 @@ static int lt8912_parse_dt(struct lt8912 *lt)
 	}
 	lt->gp_reset = gp_reset;
 
+	lt->do_pn_swap = device_property_read_bool(dev, "lontium,pn-swap");
+
 	data_lanes = drm_of_get_data_lanes_count_ep(dev->of_node, 0, -1, 1, 4);
 	if (data_lanes < 0) {
 		dev_err(lt->dev, "%s: Bad data-lanes property\n", __func__);
-- 
2.44.0

