Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66965560959
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 20:44:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F228C10E280;
	Wed, 29 Jun 2022 18:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5DB010E280
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 18:44:40 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 r81-20020a1c4454000000b003a0297a61ddso182053wma.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 11:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lpjeVnS37MRZXTHhlWJRP5jSKS1LyxijGlzK/Tshm9g=;
 b=ATJhBJ9ugmok84wwSO+HYBz2wAsXjKYfnwZNqr4scgd0TZLvc8JVRwUZW3O0Q832jf
 DG/SQUKzkqUSVolgMZhDEbFn6nMeaCdRXFOqlOiulTMmYNxmafx9zS2dlWLSSsSCXjLR
 Z5PCawGeoInle7l9qzdYXzbyx1jz3mSIk6TXI+dYhK+E7sARTZgwJu93aZB7hRCTOiB2
 1fRFyZwJI5UvoofzuhSir/T3y2kr8bT0cCJR3FW1hNdGS2FGBoyDd+1aCjP/VCi377TA
 7+7xCBvGGA0Nt06Ps/ZZvI3hb3cmkq4S2dluOS75v2+k03kTrhNaWRtcM9hZgjyLU8cC
 gtmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lpjeVnS37MRZXTHhlWJRP5jSKS1LyxijGlzK/Tshm9g=;
 b=SlauSyLUsXJjJTFbsAFpoC5O67TgrGrz+R0rINM8ux4Dax4zT6G8Tyum2pZWDYAVzp
 aul5nIZmSZ6M5IZBJkEvJxH52mSRMV4AhjFed4rMu7AVl8nYSLMcdtJoUH9uc4GYEp+u
 v07xlm0XR9CGedsfrKIeyVESvlz5PxVaNlZy85dv9SYipnU9aYT3WuoCQSjNL6MzQo9H
 19Y/B4iDufFX430wFno6kDipQiSIgfAiXgJUWtNkMZ3lmdylWdkGxmuHVqj9GvX+Q/l3
 3to9m+ZOEEMwj9Sw2IiXC8SB3Mwsr3DJjlFDnc9jiKfKLCI9gTanvv6ttqA9X9wWOZHR
 6AXQ==
X-Gm-Message-State: AJIora9AvTKjE5/zMAHmp/n3sQpfZqMxUarcN0rL0zxKUWU1Mol7GReP
 jn/+BSTpliK3D0hP3Fn14WHIDA==
X-Google-Smtp-Source: AGRyM1vAd8B1ZGTJtHDdB37c3Ztn/6oKjQ+dM2AgrpPNGcXEijohVmjDFbvu8f/fC534km4KRK26HA==
X-Received: by 2002:a05:600c:4e90:b0:3a0:57d6:4458 with SMTP id
 f16-20020a05600c4e9000b003a057d64458mr5478121wmq.198.1656528279491; 
 Wed, 29 Jun 2022 11:44:39 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 u23-20020a7bcb17000000b0039aef592ca0sm3834371wmj.35.2022.06.29.11.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 11:44:39 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v3 02/15] dt-bindings: display: ili9341: document canaan
 kd233's lcd
Date: Wed, 29 Jun 2022 19:43:31 +0100
Message-Id: <20220629184343.3438856-3-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629184343.3438856-1-mail@conchuod.ie>
References: <20220629184343.3438856-1-mail@conchuod.ie>
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
Cc: linux-riscv@lists.infradead.org, Niklas Cassel <niklas.cassel@wdc.com>,
 alsa-devel@alsa-project.org, Albert Ou <aou@eecs.berkeley.edu>,
 devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Jose Abreu <joabreu@synopsys.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, dmaengine@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Dillon Min <dillon.minfei@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Conor Dooley <conor.dooley@microchip.com>

The Canaan KD233 development board has a built in LCD.
Add a specific compatible for it.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/display/panel/ilitek,ili9341.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
index c5571391ca28..99e0cb9440cf 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
@@ -24,6 +24,7 @@ properties:
           - adafruit,yx240qv29
           # ili9341 240*320 Color on stm32f429-disco board
           - st,sf-tc240t-9370-t
+          - canaan,kd233-tft
       - const: ilitek,ili9341
 
   reg: true
-- 
2.36.1

