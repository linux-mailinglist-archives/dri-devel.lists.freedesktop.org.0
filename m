Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3457D39C8
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 16:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D2710E200;
	Mon, 23 Oct 2023 14:41:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B931A10E1F0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 14:41:04 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-6ce344fa7e4so2389349a34.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 07:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698072064; x=1698676864;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pH3GFq5D69xS1Tzi4QqCw1RIdz10bV1qyKuEWVVtejs=;
 b=LOd57qWursSJDeLPJcMTj2Z3gqjF1ffjYmyjEukRyTcUEJo2zM4+/S2LFiMORz3RaP
 /NqXAc+Qmt0n9XEIvy+roQu+BOnVqp3qchmCjuJWf93RbUC7JdAsRmZNBT0yY3NFEurl
 vYgb8g8yCYBqEf/ipTZaZvu7e2FViO7HDCDQnAuoQsmyIzkAjF1mWOWCydyheeahkBmu
 C1kOGwVI5vfoy9yHU4zQWa8Pok9POnkJiuIdOExKg/LbvH5IchsxCtNeu7Y7Em+J4nUO
 cSjp67lGpaOHllynSJ2o57uIKDH5WeXOY/Ek6StChM0QktOpgLuiqvwWjfu9pIjY9Vvw
 DCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698072064; x=1698676864;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pH3GFq5D69xS1Tzi4QqCw1RIdz10bV1qyKuEWVVtejs=;
 b=SlRg7LHaJEv0BgwoaxzY8WcH/UEIvPxiRhcETqATy8qOvU0Lg1tvIZ8vO/Ov30RClp
 sO6upgOoKagNAma9nHUlTmXkROG9hn7duGN/YhMucPV4H6LrnZyDh9pWf1ZdUbfilLct
 wjRIpiEar2rmgCzZycOlv0UAOeLd77+xBP3FBemh+WK8vKfo8emYh2NFe21cnnTOinxC
 5srjDw9sSNuc/Iv3LDaUOMYdaH3L0YtJqCd7oe4D+auOwKhJfMw/9vi8TnfMKYo/U9mv
 M2eia9Mgg7rg+OyD+wA+o0EG3Yz+tNRgrM65pGkZbmuYbbhlgrK/noZ1AAJbMOj8MtDF
 0nXQ==
X-Gm-Message-State: AOJu0YxCTSSOyEvraINFs3ArafnhHUQlFex1AlcBvUzkJj/mB0DD+QCh
 pzoF6HPwFhHHKy6xi0SG1zr+KQ==
X-Google-Smtp-Source: AGHT+IH1IkI6TnT+ttcmCoscPeOrIopE1WBAZEg4r9UimrR6CIMRAoo8nMxYKo95tMWEpnGtVl6eKw==
X-Received: by 2002:a9d:6188:0:b0:6bd:c8c2:b70f with SMTP id
 g8-20020a9d6188000000b006bdc8c2b70fmr9880668otk.34.1698072063987; 
 Mon, 23 Oct 2023 07:41:03 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 f1-20020a05620a408100b007789a3499casm2725020qko.115.2023.10.23.07.41.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 07:41:03 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 23 Oct 2023 16:40:13 +0200
Subject: [PATCH 13/18] drm/mediatek: dsi: Improves the DSI lane setup
 robustness
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v1-13-5c860ed5c33b@baylibre.com>
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
In-Reply-To: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>, 
 CK Hu <ck.hu@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1234; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=M0lgMNEWbaoZ4qkfmFQ2d2c6SqYe0EzRwVFM4lhot+4=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlNoXP9F3RAu1ZKmUXEIyW8a/kP5CK+Jb3tGF7IdoH
 1RqcA3mJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZTaFzwAKCRArRkmdfjHURTPOD/
 9t+6pSLsY0qJ4yNYIAy8Yj64n+qV7yRH4vlC9ppkx91ePv2Sf/rsw1+QRG5hlj0j3d5dWf0ZGe/qPt
 DjapblIQRzzn7BcMUQD/gavAeQ+YuLMd4IOyVk4uXEBjys9STpAuYQuKC03y3NcyjL6JWTj2fmFXTq
 FSDDYsV/wNBpk5ALR2J7sE92+GGZXhthAmqro6CeVxpKs8z4H+c8lJOUUGaohZDWJkzoPl3QJssrhq
 XljafCvUMlRJYbGBRWHusF+de6q6F9tY7mJoX2udGUIrH/cZR16ydBWCpSVaFEKmGEioAQXsFQ1JpS
 3/FHHTBX2h2nfGJQ2eT5muUbMii7hB7u5QWiVCF3BFBfzU4ketZCF3bj5Dk9xLBskq1ddV951Z1VJq
 aWbuUgtjoALtwalhNzN12FffvNPsJIBz4z1TjRHf/cK4a6jaXgVBorbrdg3g+HRu0BH+uAGnC6c1j1
 BZhh5BAQvMKdxFZnbk/zwmdsmAwXbfIPVcs2R2rk5mriJ4BOy13/lj/L2c/671sxkorHAFPtQUsi9I
 4XIePB314S80C1hBbP4Le8sz3x/gPiLeaQOFxu1Y38FmqYPDFc9iZvDBov3qmHwo1awkx6YyeMuOrY
 kr/y4GCxn8tSG8oU6g3QQsh+p+1wUWzZ6V47BRTgBHkVb5pT5lxJo6zeFjNg==
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
Cc: devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
 Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
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
index d8bfc2cce54d..81cf0ddcc399 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -668,6 +668,8 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 	mtk_dsi_config_vdo_timing(dsi);
 	mtk_dsi_set_interrupt_enable(dsi);
 
+	dsi->lanes_ready = false;
+
 	return 0;
 err_disable_engine_clk:
 	clk_disable_unprepare(dsi->engine_clk);

-- 
2.25.1

