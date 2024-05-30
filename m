Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D938D4734
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 10:36:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B40C210FBCA;
	Thu, 30 May 2024 08:36:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="HMix2dvP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69EE410E099
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 08:35:38 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1f3469382f2so5122345ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 01:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1717058138; x=1717662938;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SmWglR2Ij5/TGj5MHHzWjORF1jpZWpClgT/eZSAiwmw=;
 b=HMix2dvPVUElgHGLtr1hFxsi2ssDIX2CGU5ydztG82pTc1GWbsO5WFiTsHZ5rsfRQM
 4pbfN/5NGIb/N6K2FJXBhbTOpVYY9cA9anwHKcYjR0PeLvxQ4+ket/09iUoplrZ94k38
 Y6fjse67Bq4SMnIOsZVYyqMTX7EbSqj0gQxog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717058138; x=1717662938;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SmWglR2Ij5/TGj5MHHzWjORF1jpZWpClgT/eZSAiwmw=;
 b=B5XIjDmfwoo8rrf9srLamX3WGRnLHKP5pLN3dxFleh3TKhT1msmszV4P2/PRC9T7lF
 GAlCMVq1Dt7EkqFajkvDIcY/iUQI7sWudziFicFvYa+G30q01TRlAI6B7GQUk/GUiexD
 Dc2xRd28dGZiVsy1aKy//5Y7xy1S0mG9bJa8DXqi9rwaLq9HrQx9V3zo2AsJc+HqStQC
 QhdsvZ5xochEb8S3tFRYRSamOTPlnhN9/WAZu6Bi4m1mcWQOlaSA+Y1fsMiP0a8CUeZA
 k0fT5mQd6sqOqn9T2XUbmJ+N1PMoYAXGDE/0SkeTqeIEO1AuuVPL62lz3ZfCCL1b7pi2
 YyWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXscm+YdqiUQWs696qCOTpj/7dlzxh0nz1KDTXWx/RIRWh4Xs/v9S0N+rFyUlignwcKVfhs+5OZuu72M2T1qiIW/BxFDHrpJEa8SL7DIt+H
X-Gm-Message-State: AOJu0YyVwqMnugmn3mxE1N2tW/6uG86BG6Lrcr8E0WO0l9Vjgi0nf4e/
 /zIGTgZ7rJMMvo98SM8xN3c+atwLxhgru/Sdyde8JqFWQdsdGuuXuE/k41MefA==
X-Google-Smtp-Source: AGHT+IFpzoyjS8oEHpsPco6/0czovfTG+BgxZDwOvkJUGlKruUTXsaiUOVp8Alhb12YxLjpScrPXfA==
X-Received: by 2002:a17:902:74c8:b0:1f4:7f18:6d7c with SMTP id
 d9443c01a7336-1f61a4db927mr16665575ad.61.1717058137709; 
 Thu, 30 May 2024 01:35:37 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:65f0:63a9:90bb:50b8])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f617390fe7sm10950635ad.146.2024.05.30.01.35.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 01:35:37 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power domain
 clock
Date: Thu, 30 May 2024 16:35:04 +0800
Message-ID: <20240530083513.4135052-6-wenst@chromium.org>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
In-Reply-To: <20240530083513.4135052-1-wenst@chromium.org>
References: <20240530083513.4135052-1-wenst@chromium.org>
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

The MFG_ASYNC domain, which is likely associated to the whole MFG block,
currently specifies clk26m as its domain clock. This is bogus, since the
clock is an external crystal with no controls. Also, the MFG block has
a independent CLK_TOP_AXI_MFG_IN_SEL clock, which according to the block
diagram, gates access to the hardware registers. Having this one as the
domain clock makes much more sense. This also fixes access to the MFGTOP
registers.

Change the MFG_ASYNC domain clock to CLK_TOP_AXI_MFG_IN_SEL.

Fixes: 8b6562644df9 ("arm64: dts: mediatek: Add mt8173 power domain controller")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 3458be7f7f61..136b28f80cc2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -497,7 +497,7 @@ power-domain@MT8173_POWER_DOMAIN_USB {
 				};
 				mfg_async: power-domain@MT8173_POWER_DOMAIN_MFG_ASYNC {
 					reg = <MT8173_POWER_DOMAIN_MFG_ASYNC>;
-					clocks = <&clk26m>;
+					clocks = <&topckgen CLK_TOP_AXI_MFG_IN_SEL>;
 					clock-names = "mfg";
 					#address-cells = <1>;
 					#size-cells = <0>;
-- 
2.45.1.288.g0e0cd299f1-goog

