Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE1A763EE8
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 20:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8158310E4A0;
	Wed, 26 Jul 2023 18:49:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4767D10E091
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 18:49:05 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-98e011f45ffso3027666b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 11:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690397343; x=1691002143;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7hDSqhH8BkuxZPIDoURvTqML0NlrWeio/ZXYmGlF4bQ=;
 b=sefRUsMi4isBuj+0ycXQFXqqdPaY1M/lVY5Uk15V0j89bZKHZ68se03hxBg3ena4fS
 +wU4f4futLrxq3ksaEyGmIX9QDYI98OHprIH6V4rxFMGs+VCL66gQqRKhnLDoMLRobnM
 grIVtc7ZoNMgLwuxO0GrMx/i3nvNQftn+GGhVmb0C4cB6+NKfWJOYNjul+LqYZ+HcKog
 36iveo8Ew8DKoS/gtMYn8xDPy62Ay0B0OQrIxHN0HT/VdUN6JuLjAn5WJwLWHcNQI/jt
 +56K3IeeJH7zCtqLoTxchY+nsxSa0KgokJTdmATU9u8HJBHK9AC1N3/cIczyOWakxvS+
 mIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690397343; x=1691002143;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7hDSqhH8BkuxZPIDoURvTqML0NlrWeio/ZXYmGlF4bQ=;
 b=Y4yFom5nCMQ1aVBMwvLHAK1/Vit7Jy4pOAwLGn3dxUT1JSqrTiECOJowH9vOrz4H87
 afJOYR/gTjEwvjlGh+S+Mwi0IyypNCQieYoo6pAEM95j2laEZVfxVSalrt9+ZlBm9pso
 uWdaU7dvTz5cHI3WK+bUXQEwjhMf0n8nNfJnBd0sZMEl9j5gwQrk9tLfKt1Bpe2RJU3I
 iuLg5diRq5/Lh/dHM4TAlNsSKQHBIqt6HmgnT78g5WeO8oTv0M4qUKm9SR7K9r/gDYWf
 rItz9a2CohNiZzolyPnWjulGoSivgNNEsxnxhSIMytW3HHMoTG/OMpVA3dkfmC7n0sJw
 35xA==
X-Gm-Message-State: ABy/qLaNPOASb2mbxWGyye3qgy/ZWpA/IkR4+fHlbgdIwRV0WoZQLeF3
 0OPXnBFYXsjUo1jN8C3fXXk=
X-Google-Smtp-Source: APBJJlFGjeZg8RvubJMrZ3BDxRJelnMBSwW516T9hXbqE08dsKnYwOHQ6rSAkg+xX21G1Pre1NzkFA==
X-Received: by 2002:a17:907:761b:b0:994:4e9c:30c6 with SMTP id
 jx27-20020a170907761b00b009944e9c30c6mr18372ejc.57.1690397343189; 
 Wed, 26 Jul 2023 11:49:03 -0700 (PDT)
Received: from localhost
 (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a170906150b00b009786ae9ed50sm9903461ejd.194.2023.07.26.11.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 11:49:02 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 3/3] ARM: tegra: Use Hannstar HSD101PWW2 on Pegatron Chagall
Date: Wed, 26 Jul 2023 20:48:57 +0200
Message-ID: <20230726184857.2294570-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726184857.2294570-1-thierry.reding@gmail.com>
References: <20230726184857.2294570-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 Svyatoslav Ryhel <clamor95@gmail.com>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

The LVDS bindings require a specific compatible string in addition to
the generic "panel-lvds". Add the HannStar HSD101PWW2 which is used on
a similar device (ASUS TF201) and seems to work fine with slightly
modified timings in DT.

Suggested-by: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dts b/arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dts
index c81d5875c31c..4012f9c799a8 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dts
@@ -2628,7 +2628,7 @@ cpu3: cpu@3 {
 	};
 
 	display-panel {
-		compatible = "panel-lvds";
+		compatible = "hannstar,hsd101pww2", "panel-lvds";
 
 		width-mm = <217>;
 		height-mm = <136>;
-- 
2.41.0

