Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCF0978E6A
	for <lists+dri-devel@lfdr.de>; Sat, 14 Sep 2024 08:31:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D8DC10E05E;
	Sat, 14 Sep 2024 06:31:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="ir9JpvRy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C6610E05E
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Sep 2024 06:31:32 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2057835395aso32978385ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 23:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1726295492; x=1726900292; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YA3F8RL5B/IqI+2pfLBP9VWUihTDASIHOdqEg57DLsQ=;
 b=ir9JpvRy6gKiuGEPoQ/6ZCmnwImsg4MJDNzanRtpBCoDMkuBDelpXAHKz6IIahj2j6
 nNmrC1258D+71WI2JEcShqxRalDWpjtf25MY9ReieK9x2xnNowvO3tb1t40IZlZ1+UPZ
 bTeKKvNSAtSlaxk7zWwRdP0o9pdYjiQgt6HtFacX3C7g5Keq6r1iG0qZEftBRpo5SknN
 30iSFongHkfxWVblU1dJ6JcV97ThkYzD/TH8rEhv42hWrHVCiTnQZKyL4ACqEUr0aGal
 5Jy69XhqFbQ5Hk69ZLFkXI4pZyjSkWWM/8lSVvr+ceOueufQ2Hyt7lHBH0L+1+7FImr1
 3QxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726295492; x=1726900292;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YA3F8RL5B/IqI+2pfLBP9VWUihTDASIHOdqEg57DLsQ=;
 b=pBB1B7cHOaceyB61Q1EMcMAKX0tfNzCysdAvHLCB8zYKlWB43Myvjfe2CeDLev8JNY
 9d9r2RXo4PKMYo6Nf+Nyo2sFRBGPrrmI/z7UbYQn/JI885dlmm9Lnv8LUy9GIj/+QMqZ
 QXzNZBz5ms56VSMVN+SyANDkcyNFh44Mq3C5ZaEzi59VERujA1aQVR+2a+yydbzeqwuV
 ikC7GZfXGeOjmZw/LUV7se6p0yK/A1u7tTM/cEb3JoD+gN4sqWrUjIPIj2v8o4pMmIwa
 IrBjA9sFUdj5vMpPOEoRlWpM+jDte/lTzsxKbd5fWGDKWpTlcoDaXvASZpaV+36JnPZG
 hlZQ==
X-Gm-Message-State: AOJu0Yz1bOxsFge0Inv9UhXUedLx+4cau1OVuFSLy5IzAO3/rnN/Vxmw
 0sVEgUC/vMrtWSTM8RrmuKSzM46U6zO8nABIOoS+n7FxcCmq86S9O62zbssQYzA=
X-Google-Smtp-Source: AGHT+IGtfxxOGIugbIiDlOc5Jtw9CTrvz5uv5il2P9BcO9JycK8o2ZIE40DV90rpSTLnoassY7JfoA==
X-Received: by 2002:a17:902:da8d:b0:205:3525:81bd with SMTP id
 d9443c01a7336-2076e36a660mr150026835ad.29.1726295491870; 
 Fri, 13 Sep 2024 23:31:31 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7db4990cebbsm599216a12.37.2024.09.13.23.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 23:31:31 -0700 (PDT)
From: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
To: angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 knoxchiou@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Subject: [PATCH v8 0/2] arm64: dts: mediatek: Add MT8186 Ponyta
Date: Sat, 14 Sep 2024 14:31:20 +0800
Message-Id: <20240914063122.1622196-1-cengjianeng@huaqin.corp-partner.google.com>
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

This is v8 of the MT8186 Chromebook device tree series.
---
Changes in v8:
- PATCH 1/2: Remove custom label.
- PATCH 2/2: Change the commit about ponyta.
- Link to v7:https://lore.kernel.org/all/20240913031505.372868-1-cengjianeng@huaqin.corp-partner.google.com/

Changes in v7:
- PATCH 2/2: Remove prototype sku.
- PATCH 2/2: Disable the other trackpad to enable one of them.
- Link to v5:https://lore.kernel.org/all/20240913015503.4192806-1-cengjianeng@huaqin.corp-partner.google.com/

Changes in v6:
- No change.

Changes in v5:
- PATCH 1/2: Remove sku2147483647.
- PATCH 2/2: Remove sku2147483647.
- Link to v4:https://lore.kernel.org/all/20240906085739.1322676-1-cengjianeng@huaqin.corp-partner.google.com/

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

 .../devicetree/bindings/arm/mediatek.yaml     | 10 +++++
 arch/arm64/boot/dts/mediatek/Makefile         |  2 +
 .../mediatek/mt8186-corsola-ponyta-sku0.dts   | 18 ++++++++
 .../mediatek/mt8186-corsola-ponyta-sku1.dts   | 22 ++++++++++
 .../dts/mediatek/mt8186-corsola-ponyta.dtsi   | 44 +++++++++++++++++++
 5 files changed, 96 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi

-- 
2.34.1

