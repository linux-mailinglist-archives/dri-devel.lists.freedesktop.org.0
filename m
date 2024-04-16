Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB068A7040
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 17:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FBFE10F185;
	Tue, 16 Apr 2024 15:53:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1yg+GMtx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB49010F185
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 15:53:25 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a523524e5baso554266966b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 08:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713282804; x=1713887604;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=edg7ntX0oubeVIYh5vjQBOw0CX8pMqN2LX3X5tU8FAI=;
 b=1yg+GMtx69J5UHxqTejL6YuCoFFwGTgQQitn4/9CLnjpUBEA/+1tIbp2O6WFEh+6bS
 EsKVVvcSd1KrBOcsKAdjqVgtPYfs7tNWBFNedWE/6Gx/16f7KLkeKCtFJHd+qBRuPlT3
 tzbEGK+LOz+7GaZEysjoYbQ8GOuckO38PV3RGkf0jTivoWSqW0S1xKz2ynncMpvNHy2h
 iC6OPVCed8vlV6p3QyJIi7yAxPWxFStn8dFNFfF5jyT4j1JAtu+HYA7eLCi6/NwWcAzM
 6TmF7GpbDIYx0XzVqMQ/IcQMuaJKjfvJ3eiQfiWkFQkYkSYaWZn0KMpH8rI6QiQTib+q
 Zq4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713282804; x=1713887604;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=edg7ntX0oubeVIYh5vjQBOw0CX8pMqN2LX3X5tU8FAI=;
 b=gq+hoRI2RI0goDEdj0fsm88OEZZ9De9oAx2lxiHrmQhkPBzEkEemXoRWgNw8ZZC5Yk
 6Q/JpwC3T93InsoeKf3gWcG3mZ+xudmBh8beN575tO/yOZGiu/rxhcYOSH3iB9PDSgDi
 SA/LKSCgcnhz7FIwkLe1ah+dMzvDQPAxQOJuZUr/qjk78nMDHASOdjqMqdAWYXCd1aW9
 V7UA/Ubw6ocevQCSD9UKMoF0mRzdmBCpg89c0Ae/5hDXqC5QSyKNwOLtLIbnKFOFdBia
 n5Y1CXJs/nqj0ZRBSG8pDGTkUhmw/Acf9F0mwckkeT+z4dl5EuKLWSKyfvKl2po+CdiG
 41Jw==
X-Gm-Message-State: AOJu0Yzr+YqhRGWpFbfoN0wbixWs838Yl3PmApZo+Q9rfxqT08qgjt9Q
 Yr5fNHJ68iyac6lX+KskH2FjTWEIrk4nqU7ve13/lqTkEH8S3+06enxfjHJurH4=
X-Google-Smtp-Source: AGHT+IESXQOC2i2I+1wisKEvX+KfecwnRuK4o+TRRtDRQMuqOa5FvcWoQ2sFX9HYwV/C43qufmzJlQ==
X-Received: by 2002:a17:907:97c6:b0:a51:caf7:ccc2 with SMTP id
 js6-20020a17090797c600b00a51caf7ccc2mr13320552ejc.34.1713282804210; 
 Tue, 16 Apr 2024 08:53:24 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 d12-20020a170906174c00b00a52567ca1b6sm4156691eje.94.2024.04.16.08.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 08:53:23 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 16 Apr 2024 17:53:05 +0200
Subject: [PATCH v2 04/18] dt-bindings: display: mediatek: dither: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v2-4-33ce8864b227@baylibre.com>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
In-Reply-To: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=916; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=r68e1who8MIzDoQBthjo9X95W2QHnDC/iXtL89xaYGw=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmHp7qi3IRZ6AoTAH3S26Bc7tgxEDlvX0zSClY5rSE
 FqixYlCJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZh6e6gAKCRArRkmdfjHURW4bD/
 47it9KmX6jUMPorNt/fwXA8Yd6HyIWjHlDU6Ov+ZOq7aNybp+K1Z2ZWa/Id6Wx8n2RADeA8ZyZiHnM
 lHBARvya+AHMri2/Gno2bUGhA6g5XebKqomhEOZBlvyEhs0Sbx8EjK64wr7/Bsvf590gIzwBenBLLf
 gTq4T7hlswVdTEtIK5HVob+1P4pP/SifQGm0GyGVcuvyEGjO8jPmAEzaUgLP+ZIBl2h7ikU1S6YHFJ
 +Ikt70M3YfqB8QxP4AIAVrYiep8Z1kLno9PWvFYcBfzLslx6YqotiQ8mhKvzS8cRD2Q934IAocwJio
 iqY7ZbGUAG38AQ6G8QfYjO6cy92roRY64A2f8CdMsPJKhYfp9msT8wIuSiueIicgJpb+X5rw9sYRon
 SLmCHghPj/DEYgwpPKG45v/Bdh8gWH0AhZRAX+s/mIE+OuWYUPJmt92gcp/ho46+csXkXGKiUUgyta
 y5OmnEwhnstm3Smv4R9hsoKbht8soPnK31q1eHCZyeo8L7t2p/dtCWURvNwsQ3KGR78y6/t3/q6MGI
 mDAkRaGvebNzoS+aSbK6bjvwERLC54boEOWH1GlycC02Mjzoi1IuQlSQK4Hj3YG7LWdZi675DOND+S
 B0qgPjCZaWEgtVB3l8cs1/GQNpsJaAarulInreNNnw+9gZZzXvgCNQ8rX7pw==
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

Document the display Dither on MT8365, which is compatible
with that of the MT8183.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
index 1588b3f7cec7..6fceb1f95d2a 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
@@ -30,6 +30,7 @@ properties:
               - mediatek,mt8188-disp-dither
               - mediatek,mt8192-disp-dither
               - mediatek,mt8195-disp-dither
+              - mediatek,mt8365-disp-dither
           - const: mediatek,mt8183-disp-dither
 
   reg:

-- 
2.25.1

