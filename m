Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 650CC560986
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 20:45:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F9A10EA0F;
	Wed, 29 Jun 2022 18:45:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6739B10E95C
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 18:45:02 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 h186-20020a1c21c3000000b003a03567d5e9so185857wmh.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 11:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZPnaNl2N6OCS49bYwYg25LRRooD0U5t+6njnQfYqn3w=;
 b=cun3Fr5kbB1kc8fHUe1Pp/5QcguZXRCH+7TrDGk+ZMirUtgQL36YLVbJCyhLZkOBJy
 LhvI1GVPT1ZTiqmhJOU4Q4LLd5pGvHUxjtjZGRI3dGMdUZcBN86wcFBgUizT8kZoHfh+
 rzleb2gxRvUVaOsxtxjzB3eOBv6fv6XHPIx7hcXbCi9kY8hS+dv7hGMpXyC9zsYxLjVV
 OdIhzsTDSyIcq3kRndNjuRbrJ/XkT7HQi3aadRk0Mm5KKIz0aoZlheM2JjydatfBmbmE
 b2/Cw63ViZ4v3295nkIXbKulmCKxxxTgoEJn+r+AuOx8BCV+qEspBTkmWddspDZSYqKX
 yfng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZPnaNl2N6OCS49bYwYg25LRRooD0U5t+6njnQfYqn3w=;
 b=AHDe5wOWkxnX4EGRWft+Blv1k5d7WKvGpFD5dqskboDcSqZcPTh6PNKtqRVeb3HTXL
 8Iv9zZM+mPtO8FgbIAMFkGbUlwG3lENrA6047+ewxs0oiTlk8HgPK3ua0mDrPeeX/NGB
 aC+warl6zVYnRFHVoxOQVh4xCRzvFI/ad+M3av7E4Kx0iL8/f/alWrU1aosRkSbNkvzN
 uH5Q4Y9p7k4jQp6IZJTJEzZREXs1xcAjUg+9K+mfTezQJyzwnsyzRIzORE1wtXSeWLjk
 hpsRnE8mIHVk/7OCUyNKBSxbfKvUaIYJRpZctKWpXrnmpnFLp1oaZDVLznD96a8ovn55
 fHxA==
X-Gm-Message-State: AJIora8f1hzDYrmy+Avz9vUckfCw9DLnLDZC6mU9MPoCXuexUrujn6JN
 WaMAQLNfD++/TgojrpvNMoU4dQ==
X-Google-Smtp-Source: AGRyM1ssGrLiDWDuNuov06ew/GRkUp9AxME43xf1zuFe29c5Ad1nznXlVQLFaI/03jH4fxep5tbDyQ==
X-Received: by 2002:a05:600c:886:b0:3a0:49d7:d8b9 with SMTP id
 l6-20020a05600c088600b003a049d7d8b9mr7557614wmp.115.1656528300967; 
 Wed, 29 Jun 2022 11:45:00 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 u23-20020a7bcb17000000b0039aef592ca0sm3834371wmj.35.2022.06.29.11.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 11:45:00 -0700 (PDT)
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
Subject: [PATCH v3 15/15] riscv: dts: canaan: build all devicetress if
 SOC_CANAAN
Date: Wed, 29 Jun 2022 19:43:44 +0100
Message-Id: <20220629184343.3438856-16-mail@conchuod.ie>
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

Testing & checking the Canaan devicetrees is inconvenient as only the
devicetree corresponding to SOC_CANAAN_K210_DTB_BUILTIN will be built.
Change the Makefile so that all devicetrees are built by default if
SOC_CANAAN but only the one specified by SOC_CANAAN_K210_DTB_BUILTIN
gets built as an object.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/Makefile | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/Makefile b/arch/riscv/boot/dts/canaan/Makefile
index c61b08ac8554..befe4eb7527b 100644
--- a/arch/riscv/boot/dts/canaan/Makefile
+++ b/arch/riscv/boot/dts/canaan/Makefile
@@ -1,3 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
-dtb-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += $(addsuffix .dtb, $(CONFIG_SOC_CANAAN_K210_DTB_SOURCE))
-obj-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += $(addsuffix .o, $(dtb-y))
+dtb-$(CONFIG_SOC_CANAAN) += canaan_kd233.dtb
+dtb-$(CONFIG_SOC_CANAAN) += k210_generic.dtb
+dtb-$(CONFIG_SOC_CANAAN) += sipeed_maix_bit.dtb
+dtb-$(CONFIG_SOC_CANAAN) += sipeed_maix_dock.dtb
+dtb-$(CONFIG_SOC_CANAAN) += sipeed_maix_go.dtb
+dtb-$(CONFIG_SOC_CANAAN) += sipeed_maixduino.dtb
+
+obj-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += $(addsuffix .dtb.o, $(CONFIG_SOC_CANAAN_K210_DTB_SOURCE))
-- 
2.36.1

