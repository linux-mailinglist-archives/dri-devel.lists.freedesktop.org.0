Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3D296EEA1
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 10:57:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5DE110E9C8;
	Fri,  6 Sep 2024 08:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="kFHUkK18";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F91310E9C8
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 08:57:52 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 46e09a7af769-710d0cdc876so70217a34.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2024 01:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1725613071; x=1726217871; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HGUemR1VhN2nMqLUgi9zXLGIZPomuw+no6hZxV3BaX0=;
 b=kFHUkK18GXrTkeDZk2w+aTdoUIc+UxJ9GJIGwiue+Lp1Ug+l/rZFT8ypjiJa478VBa
 mE0hOY0THzvlMALFaDwRvcCKBQ+diTtPSqFC8P1Y7xnLtfuGL5aRfBJVGuhq7kM3PUAp
 2C075YnKFXfLJp1adgXK86sHsKhhu+Rd3T/mHGFFieSfgH1jahx86lr38bM0ghWccOFx
 kR6+e2orOYF/436gXQYisLc4lEgJg+B2T4zle/y8Rl+lub8L8Y2DrvBJYb24kg7WP4M1
 7ue0GTP902ZlCHBCBmozPjbt8q7K9sAr31BX9/oWSjaLO4AuJoha1ms9PcRckWapI2OW
 S34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725613071; x=1726217871;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HGUemR1VhN2nMqLUgi9zXLGIZPomuw+no6hZxV3BaX0=;
 b=mv+q8PO8A0tlp9brKf+UThVGX5+dhrK/HAlMgTRnHOs3DN77fU9KmlbJCuW7oM6Urd
 xwKUbsvi1QbJa1JsBs3XXnu5YLTjQLBrZIeaQkwgqyaqsiMlGjsmBVvXyReSpDCUBW+B
 SExZUp61IX3fJ/H0BKj46BmKBqxLHDXBTFVyRQqZ1XRcAxkQhIZgZAs2XJa//Lufpz+C
 KqOaMnvvC3PEm8V5OhgZPU04upaoZmbkYoVgSZeu8zz7N2dWLBhNsAH5oaQe6hfRFZBa
 K+yqnmuDugRSC/Q65vSUBedJr2kgEYz5L1Lv+lKbG6a4AOLkUP21tdUKtLuAPukq+oN+
 pTLA==
X-Gm-Message-State: AOJu0YzoV0EpJvq5MBkHgqoHpvrFiBPgf8yO6gcBTWSWSqyzsuOSvlJd
 L6XdDZlZbcQauKfxrhS4BI2FkYQqIffzGF7smo65nQ72gQH0te5emXOvA1SZQtE=
X-Google-Smtp-Source: AGHT+IFk6WA0QFBBPEfr+oxwj7x0SWhji/tk64+zlRIENA9+hoq0FUcNrJY4D3BBYjbPQUuMA8Ocbw==
X-Received: by 2002:a05:6870:8289:b0:260:f43e:7d89 with SMTP id
 586e51a60fabf-27b82db9750mr1951434fac.2.1725613071057; 
 Fri, 06 Sep 2024 01:57:51 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71798286219sm1439166b3a.57.2024.09.06.01.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 01:57:50 -0700 (PDT)
From: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
To: angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 knoxchiou@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Subject: [PATCH v4 0/2] arm64: dts: mediatek: Add MT8186 Ponyta
Date: Fri,  6 Sep 2024 16:57:37 +0800
Message-Id: <20240906085739.1322676-1-cengjianeng@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
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

This is v4 of the MT8186 Chromebook device tree series.
---
Changes in v4:
- PATCH 1/2: Add more info for Ponyta custom label in commit.
- Link to v3:https://lore.kernel.org/all/20240904081501.2060933-1-cengjianeng@huaqin.corp-partner.google.com/

Changes in v3:
- PATCH 0/2: Add the modify records.
- PATCH 1/2: Modify lable to label.
- Link to v2:https://lore.kernel.org/all/20240903061603.3007289-1-cengjianeng@huaqin.corp-partner.google.com/

Changes in v2:
- PATCH 2/2: Modify the dtb name without rev2.
- Link to v1:https://lore.kernel.org/all/20240902125502.1844374-1-cengjianeng@huaqin.corp-partner.google.com/

Jianeng Ceng (2):
  dt-bindings: arm: mediatek: Add MT8186 Ponyta Chromebook
  arm64: dts: mediatek: Add MT8186 Ponyta Chromebooks

 .../devicetree/bindings/arm/mediatek.yaml     | 11 +++++
 arch/arm64/boot/dts/mediatek/Makefile         |  2 +
 .../mediatek/mt8186-corsola-ponyta-sku0.dts   | 24 ++++++++++
 .../mediatek/mt8186-corsola-ponyta-sku1.dts   | 27 ++++++++++++
 .../dts/mediatek/mt8186-corsola-ponyta.dtsi   | 44 +++++++++++++++++++
 5 files changed, 108 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi

-- 
2.34.1

