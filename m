Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D196959717
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 11:27:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE2810E46C;
	Wed, 21 Aug 2024 09:27:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="OMRiG41D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD0F710E46C
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 09:27:23 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-7bcf8077742so4755298a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 02:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1724232443; x=1724837243;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Iox3pW+t1+/mCNWqBkSwh8gOTlOVaTTolmdqxDRdGuE=;
 b=OMRiG41D/KpWdu9e5qYMReYl5jUKsfWprNQx7zWElsdpnSMMM0eRSQEzIAy9xyD1TD
 RoWebUywzPzq9gL6NofHLSsVdQo6O0KeKdrAkQZog87ocoC/XaZSAZCnvughAA81nJsb
 9g43ONhQ/Cp63o3ky4Q74ozO59ZuedVnxzpZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724232443; x=1724837243;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Iox3pW+t1+/mCNWqBkSwh8gOTlOVaTTolmdqxDRdGuE=;
 b=aFKhUqf1RMc5gis3qzs1Mu7M8FRRwieNeUY4jIumCN0prl/CuM5BhzXPAjRoyYfBRB
 C7jrrrg5Q0Lg8l7pfIfSXF5JTQHk4z/sP5+HvlgNXw2fvYNoB75bZvizsvseIkvusvBZ
 LxbOd0Y17wEuR5fJsp/jVqaEv24Lpg4QezC060UO71VXNvTOVXtZajApMN/WKLOSRSz8
 Go4igtxeJXDs68ZavPt2YyJKsWcxBPVhrzpA64rNa6Z4lY/h7mdGDW6SXyYrxyCAFkmZ
 Pz+I2YmvI+dpGTwFnnTdbxH70nw/tNtSs5hTI/DYHNwHuG13vvBzIu6mSceSWm9KYI6C
 +E/A==
X-Gm-Message-State: AOJu0YzWWtqSxdgbPbyoKY1XWMNZn97RVbO+Kw8hPXFFL1yEUQCyXg6C
 7IvUsAx95gCXtGE8XnPgkE1ljpHWF1ESDjzkOLmDYgyD+B2lapSSJKwYb6+ucQ==
X-Google-Smtp-Source: AGHT+IFSbd2+CTAvT36vYi23wFOBnvLtUPzf574J+2rtgzO0If0Rhiv3cpNXndh5NgP+JigUun2lAA==
X-Received: by 2002:a05:6a20:9e4c:b0:1c0:eabc:86a8 with SMTP id
 adf61e73a8af0-1cada0115e2mr2213758637.5.1724232443153; 
 Wed, 21 Aug 2024 02:27:23 -0700 (PDT)
Received: from localhost (185.174.143.34.bc.googleusercontent.com.
 [34.143.174.185]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-201f038e33asm89674035ad.219.2024.08.21.02.27.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Aug 2024 02:27:22 -0700 (PDT)
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
Subject: [PATCH v2 2/3] arm64: dts: mediatek: mt8186: Add power domain for DPI
Date: Wed, 21 Aug 2024 09:26:58 +0000
Message-ID: <20240821092659.1226250-3-rohiagar@chromium.org>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
In-Reply-To: <20240821092659.1226250-1-rohiagar@chromium.org>
References: <20240821092659.1226250-1-rohiagar@chromium.org>
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

