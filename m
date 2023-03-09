Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DA76B26CA
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 15:23:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2640310E833;
	Thu,  9 Mar 2023 14:23:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB0CF10E82B
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 14:23:19 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id l1so2017432wry.12
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 06:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678371798;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9/9vCBz7vbbih/lGkwmf+FEiexLxZqGCZA0WwN10Gcg=;
 b=iR41EdXLcY9VmMqJ50wJe8DxepsDnm3Avc5gouB6/svk5ih5KOyFUnMsz8p27ckXPI
 0gOMwjO162Erp1Z58W9sV/sh8R01CFL+0tE3RO8y0H7wU9ov49zSm+oudXb9sPqMexp7
 /xzKoRzA7BS5qwBYi/l81ZDJUAjCr9UVUqAuPAoW3pfuwMcUQbUUdx6mWLr4QfDFHDcc
 jA5iuY/FR8loTZdfEb567T4q0bM8A/o8x4tCp6GsGOQxyYoLvgxUg/rHmDNiwUVa9SaO
 4/gDznsmQqxeHoKtgQI4AnJ6tjAkJdFqfMC8TD2P/z8dL0DnLiW5LXwMjQY0zi6d1uZU
 Ac/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678371798;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9/9vCBz7vbbih/lGkwmf+FEiexLxZqGCZA0WwN10Gcg=;
 b=1St753ZS57xEX+SS0IJEgNnpIGLntCjNRR1T/orTmarpieWif5prm4v8vltzaFPV+G
 UL9T5uDFdn405PVIPxteTesu3CzwHS+It+b7qigcHGmNuDwoLhfSdXXI+Ib06YiuIvuZ
 aEG5UWMYX7xN3aNhoQ4YeeoTiaqwYap9NlWtzIbq+IO9+yE3XovKkRxn+PGTH/fLljX8
 5J6zYvfLNFQRNlG52PVqkNE5UseObF+PHzkGlk3bM/riRF3ifuzUXS01HxPnLf7fqHri
 nxBXc01iVgASCrxPG8kpLEPHV6ySrrcJ5Lg1FcUwZYi94e1G4P8+h8nh01wUGqtTmXM4
 qlfw==
X-Gm-Message-State: AO0yUKW+P9UDrug6QJiemo37Rfot8pQZQ8hQQjy3AcRSyG61bDb2GHgG
 AKI+wwHnqrITntdwdVY6wSCZSg==
X-Google-Smtp-Source: AK7set+I0/ScP4SoVVLH79fHBqsv90Adjnwakl9v2Z2Ku5kb3jT39ZJyQd/sDPiy8yRapuXBhAaTuw==
X-Received: by 2002:a5d:65cb:0:b0:2c5:5ec7:43bc with SMTP id
 e11-20020a5d65cb000000b002c55ec743bcmr18750369wrw.18.1678371797937; 
 Thu, 09 Mar 2023 06:23:17 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 x22-20020a1c7c16000000b003e8dc7a03basm2772434wmc.41.2023.03.09.06.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 06:23:17 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Mar 2023 15:23:07 +0100
Subject: [PATCH 18/21] drm/mediatek: dsi: Improves the DSI lane setup
 robustness
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230220-display-v1-18-45cbc68e188b@baylibre.com>
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
To: Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Xinlei Lee <xinlei.lee@mediatek.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1237; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=EBgpLyWateYNZX8XUe74shY32q1eVTHyK4Cgywlf4I4=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkCeu+czZ0Nf/pPTdrIG0J4SybkuXb2pnV+MfQKa3s
 6O0w84GJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAnrvgAKCRArRkmdfjHURRyID/
 9CnYh9rUbc4xP78TqMzB81pS2PcGxhOcRpKPDqDPBsQ8MkxsoG8+MY3aHW0oWOYwkkCKJILq1eWvrZ
 FcGBxafCafObuCEud3eX/BmgrilCpkw9k14ReSAhoLBleabN5e4BHhxGwdY4MppGPkp5z4tcO+cBKo
 3NLvSlo7vGuU6t0pyo20+qO+Lgq7gyDW3qRYDQKyq8IaxIKxdTBJYJNUaZ7ys7TuQ4ljzSqdtle4xJ
 l2BNqkNuQfsq8NQ33JmFcv8fr8OjREJ1MkMJcGQ8yjmF7odFz0S00bNX8mOTCDNkuyL/gbUpMwym7j
 UDpymWJ38bRBsUoDiVbCZvFkpLyxmO9FD4OYNAK/FsSDWLAHsuSbWiEVSTIoUEpTz40K5hrN4MTVVX
 ZMY6bRv+KWIIfOqflp4HPRxHbMEPykdomliNR+UpGXU9RbGmiOVSIox47gyIK2ehXUPi6uR0hYmMA+
 meTS4KhKpspzecO0R1jj2ocU73Bj8FMaBsR1ZeZQBxehsGGEyZnuPBeI87HC6zGceNO4bfmtxQMEoO
 qpVdgs/c2cZ3lBj7PKzAw29XuxFAzFRq6UIJPYku+GJtrC/ARlfmxQVgSbfP53xN+TxJ0znX0YGjAv
 qruUaP/4i4Vh0y3GHvZeBUTuyBur6wgU6j9w+hojKtE0FBIRpZOvzCRRta5w==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org,
 Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Guillaume La Roque <glaroque@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, mtk_dsi_lane_ready (which setup the DSI lane) is triggered
before mtk_dsi_poweron. lanes_ready flag toggle to true during
mtk_dsi_lane_ready function, and the DSI module is set up during
mtk_dsi_poweron.

Later, during panel driver init, mtk_dsi_lane_ready is triggered but does
nothing because lanes are considered ready. Unfortunately, when the panel
driver try to communicate, the DSI returns a timeout.

The solution found here is to put lanes_ready flag to false after the DSI
module setup into mtk_dsi_poweron to init the DSI lanes after the power /
setup of the DSI module.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 3b7d13028fb6..35c36cc05c04 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -667,6 +667,8 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 	mtk_dsi_config_vdo_timing(dsi);
 	mtk_dsi_set_interrupt_enable(dsi);
 
+	dsi->lanes_ready = false;
+
 	return 0;
 err_disable_engine_clk:
 	clk_disable_unprepare(dsi->engine_clk);

-- 
b4 0.10.1
