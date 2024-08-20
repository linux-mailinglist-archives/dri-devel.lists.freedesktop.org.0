Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0619580BD
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 10:19:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA9AA10E505;
	Tue, 20 Aug 2024 08:19:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="O8X+rU87";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 599DF10E4E6
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 08:07:21 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-2d41b082aecso1627059a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 01:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1724141241; x=1724746041;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Iox3pW+t1+/mCNWqBkSwh8gOTlOVaTTolmdqxDRdGuE=;
 b=O8X+rU87eC+tm/T/vnN00MOy+klFDHfjHO/nG5FWxtwT3wgin2JW88xYRU95yd+YUZ
 pcnvsbL+/flhYe1/bk38IPCM6Zx3GIovhiGvd6uku55QV7v6ymubP092QoDRtblcnkvq
 7XV1Ui2+3b6ZhT76PvFjXY6FDOTQmERZxHxmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724141241; x=1724746041;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Iox3pW+t1+/mCNWqBkSwh8gOTlOVaTTolmdqxDRdGuE=;
 b=nfHRTb1MfT7ZjaEmY1KbSh8mrKnJdBy97QvY5O9cgCn8bjr/VKuuNellHyCW32Q8O+
 hKUiicj7jIns07PeONLoodmyjppjjbWvRB6nsYx3w8FGYHOGoiD6wgTuOXPc/VN/2Dwm
 RB0lQFclPYJz/hMGBGLdOl/Lgr9wkNuZ/n2Cn5aUwjhsw1pHG0XS9waKjkuIMO5FzQpo
 WSJ9voi8op7tvX65ryQ03kLnHxPgf7PkhWGRZb+Yhuau5Um6gv5l23uV/tAp5RZvEjAn
 5XarxiNT75wX+u7+pkRYpvxBFDnshvOJa1XIiVpbM8zNBrHhVQRHtnfYN7bZ+3e88g/U
 WWGQ==
X-Gm-Message-State: AOJu0Yxq7mhnqsSrxzgs0p/8tLLKdiohsUBCNa5E5alsthV7ssGyU+PA
 zZ5hVUglAhu1bwY5NhoeaBTwsJdZT7ZqUCn7OHVthwVnXWPAFf57sOF7+tXtjw==
X-Google-Smtp-Source: AGHT+IHQpe/xH18Gz0WxkaiRSQ8MloxnO4Qm6+EYZVdcVqYqIRvsLVNRO0UiYRv0FQyI2NXLjvAwEA==
X-Received: by 2002:a17:90a:ce08:b0:2ab:8324:1b47 with SMTP id
 98e67ed59e1d1-2d47327c70bmr3278247a91.15.1724141240742; 
 Tue, 20 Aug 2024 01:07:20 -0700 (PDT)
Received: from localhost (185.174.143.34.bc.googleusercontent.com.
 [34.143.174.185]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-2d3e3c752aesm8640053a91.42.2024.08.20.01.07.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Aug 2024 01:07:20 -0700 (PDT)
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
Subject: [PATCH 2/3] arm64: dts: mediatek: mt8186: Add power domain for DPI
Date: Tue, 20 Aug 2024 08:06:58 +0000
Message-ID: <20240820080659.2136906-3-rohiagar@chromium.org>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
In-Reply-To: <20240820080659.2136906-1-rohiagar@chromium.org>
References: <20240820080659.2136906-1-rohiagar@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 20 Aug 2024 08:19:19 +0000
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

