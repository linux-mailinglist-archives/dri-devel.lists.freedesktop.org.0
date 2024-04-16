Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 441698A7051
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 17:53:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6750112D29;
	Tue, 16 Apr 2024 15:53:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="bUcrukuG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9744F10F1BE
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 15:53:39 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a51a7dc45easo514606066b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 08:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713282818; x=1713887618;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lMzjdnJXuF3c5mxPh4yfDUlaYNvWD0FrUY1FJvWIAwc=;
 b=bUcrukuGDpQgDBqNW/B9DAI/yHEk8RjKqujnrueZAvIXp6+d4th2JGQYsLE2CRfMzS
 evUgSMlriSwqTzyfemZ9kUeYZvL/BaG9cArmNPoWAZ95cYrfkbdXRFUFSSFzrMlZi/6z
 foMwrRVLEruDdQjDZbpn6yX8SwZfwPwLebE3lwMx54X+3ASg9fqkxXJMZM4Tm+kb1S6v
 whSlhzIZbnpjTBbGBYtAW3DvUHB4hrsqmo7iB74pPpzEd2bPYHagYrNguvjeBu/OjI9W
 /TmymvGJmaFjVz/At7A/5oaX6tMUct2z2ogyXT2QNJXMYJUt4+2VuMFaeVvXu+otbmoC
 chog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713282818; x=1713887618;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lMzjdnJXuF3c5mxPh4yfDUlaYNvWD0FrUY1FJvWIAwc=;
 b=IC3XZ4bjGyz7jxHN8T5rYj/j/WtIz+M0ieqg6nJuRDiw4G4Bz2V9Ul4yMiIVJueTS+
 vk3LsMHO7Ic9WuYfGbnS522YcWFMzuYoLofvY2SYkLtZGzoJyaaxNKgOP24Gb9IxfPLV
 PB3rr37g6FMzKRmel8+wMShPUsdZRaHDUG4lPMrFAmvbTBxCJsluIpiQWKsVi9AQfMDt
 IY1zFZiKdjOjpbD3bJurfuzJfCV8vcue0rvugzRS5CzKDaDaBaVKoH8RQ1B29IHfucN5
 4B8xHV0MzAQeJQq3LkwsTMh0rPYpFVjfevt3LxL04VVbXOUWH/mwLNx7ceRrvTyX+hTx
 lBIg==
X-Gm-Message-State: AOJu0Yx9iANRuHU8jzkQOqBnNUi8NkixOCPymavJDchODI5Gsr5p0gYR
 Eex3bECSZiRRoO6WJUCl33XGKBApHMdzGN3yc2QA23NjPZc6RvfLPlb/rrOFECA=
X-Google-Smtp-Source: AGHT+IFk1yoWGLqoBymQWKpJEhd6iWeTqSjELga+zlWWHUviknE2SG8H+UAr/d3dYsubXWOrLr++WQ==
X-Received: by 2002:a17:906:48ce:b0:a55:339d:bd20 with SMTP id
 d14-20020a17090648ce00b00a55339dbd20mr3437290ejt.51.1713282817957; 
 Tue, 16 Apr 2024 08:53:37 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 d12-20020a170906174c00b00a52567ca1b6sm4156691eje.94.2024.04.16.08.53.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 08:53:37 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 16 Apr 2024 17:53:13 +0200
Subject: [PATCH v2 12/18] dt-bindings: pwm: mediatek,pwm-disp: add
 compatible for mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231023-display-support-v2-12-33ce8864b227@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1010; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=f9Dg3+1sA9zIqMbmOSkIqYRfnGnKgRgwjxFViDKWg4s=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmHp7qCtkudbE2FgoQGnKNS8vlj9WP5d+Q1enfhm+3
 WS7W4ryJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZh6e6gAKCRArRkmdfjHURauREA
 C8elBHPUwyryiqhU/JftMEstWEhAI7HacOE+GjDLuT91DQoGocSdM/By6VXYsbFsuP3J2Exczi6frz
 ba2GCWSVUwiLb92u1hQpINL7ls0qmmh0r7yGgl5HnwjxAX+Zg4C8yBRoPI8RVLyfU9S/r3fPMRYni6
 Wpr0HozZOKrEQ5d0E7N2R0yj8mjdbLL7woEJYhC0OB6iOVGvyfeJqrSAD1z2BjdwlAlogg6zn4eWwC
 /asr3730Ub39vA+1gIunga8bVsoqsBzHP2xH2WIsGpLHvnHuWyGehFvyUFRY/VhKwNk/myhcyGWAdV
 Y7R57eYwNSHunhPoPnXrH+s5tGAIXqTHmctxoTL1WEd1ASFeCDB4fTxebJYFkaYyULZiWXDuE9Dt0o
 9eLZX9QjD3wcbt6howeDIggSZ3VAY2T+cS0ibSSqBOLMtALjTGE4VHqb1dD/xA2X8dTwyNeNL6eLsK
 MlNvds64Wab3wKigMbpCRWW41CI+jbomgQENOsjcrkA63E7UwXX9i3CWKbIFNn7yYXRnQtF9/ou9oB
 0/4QjL4id4kIukWNLEgjLCA0Wmwdp+jELa8HzLKgqyT13FBTs4FIX/w4if4EN86mMTaKGGznQSt+cY
 sIxk3H1lFvV+liAj3rGgvXTfPVUrOH+OqtB1mIROI0BYACxwnQsLCcUCN7cQ==
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

Add a compatible string for MediaTek Genio 350 MT8365's display PWM
block: this is the same as MT8183.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
index f8988af05287..180dd8366935 100644
--- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
+++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
@@ -31,6 +31,7 @@ properties:
               - mediatek,mt8188-disp-pwm
               - mediatek,mt8192-disp-pwm
               - mediatek,mt8195-disp-pwm
+              - mediatek,mt8365-disp-pwm
           - const: mediatek,mt8183-disp-pwm
 
   reg:

-- 
2.25.1

