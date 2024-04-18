Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE1E8A9C75
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 16:17:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B86113CD1;
	Thu, 18 Apr 2024 14:17:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="VOQl84fn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C68113CD1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 14:17:13 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-41551639550so6569425e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 07:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713449832; x=1714054632;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=49BUJCpffUTma/23KKg2oGJXJqjsBZNRYKTB4uG1eb4=;
 b=VOQl84fnlLJjEFaQitHQVfRQb5nY3ouyl1CGc/UZ9TeoKjytBuy5rS7jHb57MFFCx1
 Q+0mkrG7pTiPsEb/eGhx13MkR7me1QbTUM46sCQEI44B2CLEhPPaP6KfbQY0YFfL7DOv
 WmNdsMyQsAOrER6peMPd8F30+QWBZCb8iJqDmgkE/BZo/T+8Fg7pPnI/JhGGQGi0rWl+
 P21F0dV0dqx3ZjEQ3FkMd76dCVEXQGhZhgxwWysiwrj3mlU53pGRTgw4WU1N+reJILLA
 /Zd3phhvCilN12RGtQq28OqikFt42BPK4kdFHVd/qoQad+JxlCbaJLS9bumSKy/CZJnN
 cj9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713449832; x=1714054632;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=49BUJCpffUTma/23KKg2oGJXJqjsBZNRYKTB4uG1eb4=;
 b=RCbgJsut5KNm0oT4o1VdNvc79NjHjat4PF7XLAiJ7yxE8cbcp+mI5Lm0Ecv4UBcppU
 vW2gV0s5gFi81NBx8GHWEfSdmzdLcPEfPpA9ZT6VXJzTAmOc6r5eBZQ1d97riQgSRufB
 3H3dSk2mJOx1m+FUj0Xl2sVWBkcVDR2Vv92M/JooThGqLZacF9uBSvbHvmEnEY+vw6QK
 jPALVGM57O9p6eRR+oKh62OWsAB1ikV4Xr9J5uGNZIlfuAx4KUbWf5/5IPwqjM2Er742
 76K4BRh2zbAJBn4Jkkp+fX1SMlMx5UEeGWTsZAtfpAgGAydas+2n6Dcatce3qFemIWKG
 8pPg==
X-Gm-Message-State: AOJu0YzCBLDHkoJfHHtugzSSB7QX8yqcENVSM+HZEuFLo15XoT+RcUuQ
 QQx6qun/0u0l8RlIOmu9vU77wJ0k8z6lA9KzIfnOqpUGRHjbP7q6hC6azEOEva4=
X-Google-Smtp-Source: AGHT+IFTjzRpWK6iDi01DywjVdh8/v4t3z3199bOhoMDOHvDHlFawM4QhxRAJOfj2/Qsjae2GFxPbg==
X-Received: by 2002:a05:600c:4710:b0:418:829e:efa5 with SMTP id
 v16-20020a05600c471000b00418829eefa5mr2601682wmo.20.1713449832214; 
 Thu, 18 Apr 2024 07:17:12 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 i9-20020a05600c354900b004180c6a26b4sm6267510wmq.1.2024.04.18.07.17.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Apr 2024 07:17:11 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 18 Apr 2024 16:16:50 +0200
Subject: [PATCH v3 02/17] dt-bindings: display: mediatek: ccorr: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v3-2-53388f3ed34b@baylibre.com>
References: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
In-Reply-To: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Fabien Parent <fparent@baylibre.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=DLryLa8O7iEQrZUEVAGOL74G0qHULUzTiJ6209ggFjg=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmISti5dQRvICs+TNWn9PcvcaXjHRymsUXz5cyKmOy
 gTr2alGJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZiErYgAKCRArRkmdfjHURTCbD/
 0RoSlJPIusbA/ANyTOZy03WTuf6qpmm/7E76EPyETfQy89dcQx89oVWZG7tbWvZYTCLLYQdqDSIbXJ
 EW0M94hkg3BbwPvN8d1Y35T+9XjOZj2cX8RkgQt1HJ6mN+j43iIUqY73ZQUMVY5t2xXNqYdA6vy5tG
 RwvuL8F81Qu0WbD9S4pKCHDdN+yvIvMmA5og2KAw9RKnQZWZvE0DXVkHurMOHgZFGXFwqOppvCLF+6
 c7DKgP5D5yLPrGTdHYTjfZf6AI8PacTvv1KcaGGeCW1zq6cSpv6AKfjiGETGhJxyIURzmQ8acFhHYk
 fMNj+AxQczDMNk4KL3Neuyu38RLeDKmi2pnevus7THXSeOuKWUxHFO9Ns8+gwjAb62vOhiNiDcxR30
 u22RhSdXqMhNRnPNX59D1r36QGMrOHsemN7CzpMXxtf0lmdYXIvhwD14NTSkIVDQWdV+Ko2ZcObJyd
 PjAcqW7cirsORw8QcQAb74RODyEjKrZnDN3DSaNitv++UgqdT+Ph8Jw/K+yYrCnmvS4fXIY5+aEmSZ
 AQqnjibLgU7WtuTuGSkjjThwWhmlprsOrYQvqGb+bpOna0y9QxbaXpPWgWw2JLgiRyC3Y25ayG40fL
 gUuyPpivBHlfmrEQ8mvpA6d1e1NypftXdVe5aqr5gJGUXm89nrXYGVNU4v9w==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document the display Color Correction on MT8365, which is compatible
with that of the MT8183.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
index 8c2a737237f2..9f8366763831 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
@@ -24,6 +24,9 @@ properties:
       - enum:
           - mediatek,mt8183-disp-ccorr
           - mediatek,mt8192-disp-ccorr
+      - items:
+          - const: mediatek,mt8365-disp-ccorr
+          - const: mediatek,mt8183-disp-ccorr
       - items:
           - enum:
               - mediatek,mt8186-disp-ccorr

-- 
2.25.1

