Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EB095ADE8
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 08:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E282D10E772;
	Thu, 22 Aug 2024 06:47:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="iVp34vY7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D3C510E771
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 06:47:10 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-2d3bd8784d3so356220a91.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 23:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1724309229; x=1724914029;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Iox3pW+t1+/mCNWqBkSwh8gOTlOVaTTolmdqxDRdGuE=;
 b=iVp34vY787e2nj0GS8TZD2TG+acLV+bCQu1GyAqtRtsrTt/z88eIX/THTNAgXm6MFe
 QVUj0p0YgeAepUv8Y4hswnxoU7qhtT5RDxTbC/+XN2wS5KEkEg5E9k3IY7LMoFQqywiP
 AaDZizDvMil3FepDSA4jFExjHoaI2rI4ufDpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724309229; x=1724914029;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Iox3pW+t1+/mCNWqBkSwh8gOTlOVaTTolmdqxDRdGuE=;
 b=FxQPVKLIvuRPCwj79rkoQizgjXmMW9/fVRL4fTrYMMCGBnNrV/jrzJuV4HJfvqwhLr
 sf7uyPH8wZCqnW13ZxCwgB19l7gZrEv37dAQXsDpGrwEbSb5LJUAzSn/T7MHPTvejjfR
 5nZDxbDYYkOYxfGrV/m0hWLS+cE3u7FfoABssQthyY2xSd8pg8AGzkF/Z4JjkGEkkOXs
 f8ATG4bG6VAYwAlN5WTRBK/uaZCkp0r0AZWOc9CK3yYGVTfcLhe7Kbp8xjXuMBNLt89c
 zN6rSfwDKg4/wS77di1hMGJJvXRiTj1jt/z9TS9JMfRckjiS6gdwpkdDWa8anaB3Tb/7
 dOig==
X-Gm-Message-State: AOJu0YxmvN3LoL5mRGBXN0e2hvS3lplz6aRfj/GKAaQzp5simyU7Y37x
 pYrr/1vQjYJIUZbFohDyboyuFhxFzTGfRe56nXDTWyEPrHF+rsT1+IvnY0yr5A==
X-Google-Smtp-Source: AGHT+IGDm0aYL8ExBHHTkePgeJ1dnpbTcM/gseUSEQPj47QfaHrXBDFNOT0Ci3LVj6t5wZrZxdp1CA==
X-Received: by 2002:a17:90b:4f89:b0:2d3:dca0:89b7 with SMTP id
 98e67ed59e1d1-2d5e99fb6d1mr6084906a91.3.1724309229382; 
 Wed, 21 Aug 2024 23:47:09 -0700 (PDT)
Received: from localhost (185.174.143.34.bc.googleusercontent.com.
 [34.143.174.185]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-2d5eb90c542sm3166866a91.18.2024.08.21.23.47.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Aug 2024 23:47:09 -0700 (PDT)
From: Rohit Agarwal <rohiagar@chromium.org>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, ck.hu@mediatek.com,
 jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Rohit Agarwal <rohiagar@chromium.org>
Subject: [PATCH v3 2/3] arm64: dts: mediatek: mt8186: Add power domain for DPI
Date: Thu, 22 Aug 2024 06:46:49 +0000
Message-ID: <20240822064650.1473930-3-rohiagar@chromium.org>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
In-Reply-To: <20240822064650.1473930-1-rohiagar@chromium.org>
References: <20240822064650.1473930-1-rohiagar@chromium.org>
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

Add power domain phandle to the DPI controller in mediatek
mt8186 SoC.

Signed-off-by: Rohit Agarwal <rohiagar@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index 4763ed5dc86c..e27c69ec8bdd 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -1824,6 +1824,7 @@ dpi: dpi@1400a000 {
 			assigned-clocks = <&topckgen CLK_TOP_DPI>;
 			assigned-clock-parents = <&topckgen CLK_TOP_TVDPLL_D2>;
 			interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_LOW 0>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
 			status = "disabled";
 
 			port {
-- 
2.46.0.295.g3b9ea8a38a-goog

