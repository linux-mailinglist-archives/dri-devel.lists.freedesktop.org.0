Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5985D41FEB4
	for <lists+dri-devel@lfdr.de>; Sun,  3 Oct 2021 01:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BC876E051;
	Sat,  2 Oct 2021 23:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE8C46E056
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Oct 2021 23:35:48 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id z2so10030059wmc.3
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Oct 2021 16:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5QeZHLVghCs6DLC29cur3iiPtjPr54ogskINtSo0wnk=;
 b=MfwJruBA9/BRaqKP6GZK7cl2lh3Yp38xU24WrGjTNzfPhNgTb4yfCvD8qAekWxzp3Q
 4BHUt6Wl8ek49y1q3ZIBTRxZjrKrh4hAhwPp4Tondezo8ARacBql6nQVkNgwJCfFqCFo
 bz/8CWlOhw8kHrxe3i+KQZWc03PnQY0Ky59vj1YRf4gTuBraalCj2ABHVhouTxUXvoIw
 fW80QjpcQ43DGcAUAmR2u7xBQv1e0SpTK7ncJquF5IzW4zCAESkkq0JcFPMET+KNDkbZ
 1kQnotsCDymIcebfFsuDxzvbviFBUIv1M5KJD8QG0E6uLCAvXNEeWUXS+13zLNE8jRXz
 98RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5QeZHLVghCs6DLC29cur3iiPtjPr54ogskINtSo0wnk=;
 b=slCSVX+wT4crZUuyr0hUCCEABE6kqEVDsW2AwkvDF8a4j2u1KDWdwPOLwgqWQejAwc
 ZU3x9FFLsBijnu4wQ0Cg2oNwHpap/d3ihLlqeqqF5M8ysAA0tf19uz+891dLtMikUjbM
 AXySlYwOaQBEMdMAzdn5Hf74hegwu0b6FtQf7M6FJAAuKiAiR6aWG2hdAUoHPvOFlOGa
 Uyjtdm0/KjjEMfrj3m5w1quMY4mF8TuwK+h1GDjoIJ/dwafLnnyW2xf5JABsUc8+GNUD
 Jnh+HnoHZqDREVCjhHvb8phNFHL7WNRyHDZVa/Xs27KdOnjWbyH8FlZoR0v/PMMGmNgW
 RzVQ==
X-Gm-Message-State: AOAM530AulLfAQ6u6EuY4UipdNRUjUO3y16wblGUTMJgsV0Dv76gise3
 VtFm7KEuGjee7ciflzSp/kQ=
X-Google-Smtp-Source: ABdhPJxLGgYJXFJw+Zk5FrXA+HpKo3BKb28MjcD+RZUrQnYXzFz7caP54CXHVGzXNnX+O3KdmhaHaQ==
X-Received: by 2002:a7b:c056:: with SMTP id u22mr11300886wmc.15.1633217747453; 
 Sat, 02 Oct 2021 16:35:47 -0700 (PDT)
Received: from localhost.localdomain (94-29-54-195.dynamic.spd-mgts.ru.
 [94.29.54.195])
 by smtp.gmail.com with ESMTPSA id r2sm10487089wmq.28.2021.10.02.16.35.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 16:35:47 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>,
 Andreas Westman Dorcsak <hedmoo@yahoo.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/5] drm/bridge: tc358768: Enable reference clock
Date: Sun,  3 Oct 2021 02:34:43 +0300
Message-Id: <20211002233447.1105-2-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211002233447.1105-1-digetx@gmail.com>
References: <20211002233447.1105-1-digetx@gmail.com>
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

The driver assumes that reference clock is always-enabled, but this is
hardware-dependent and not true for ASUS Transformer TF700T. Make driver
enable / disable the reference clock.

Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo.com> # Asus TF700T
Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> #TF700T
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/bridge/tc358768.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index a3db532bbdd1..18ae6605a803 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -237,6 +237,10 @@ static void tc358768_hw_enable(struct tc358768_priv *priv)
 	if (priv->enabled)
 		return;
 
+	ret = clk_prepare_enable(priv->refclk);
+	if (ret < 0)
+		dev_err(priv->dev, "error enabling refclk (%d)\n", ret);
+
 	ret = regulator_bulk_enable(ARRAY_SIZE(priv->supplies), priv->supplies);
 	if (ret < 0)
 		dev_err(priv->dev, "error enabling regulators (%d)\n", ret);
@@ -274,6 +278,8 @@ static void tc358768_hw_disable(struct tc358768_priv *priv)
 	if (ret < 0)
 		dev_err(priv->dev, "error disabling regulators (%d)\n", ret);
 
+	clk_disable_unprepare(priv->refclk);
+
 	priv->enabled = false;
 }
 
-- 
2.32.0

