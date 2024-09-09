Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D4E970BCB
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 04:32:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA1F10E2A3;
	Mon,  9 Sep 2024 02:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="PmepGo/e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD9710E2A3
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 02:32:01 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-2d885019558so2698314a91.2
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Sep 2024 19:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1725849121; x=1726453921; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h3jsBoK6osKU+9RLD62g9RUso5s5R8d15TnY03wmQ6c=;
 b=PmepGo/ec4UWKq2uMcbWcsHcoqnkWpy+VM9MirGEy07oD2/lkvaCuHYlTqBJpTVScr
 MuPFqDUAtH2NY+d6y42fE/k0yfn69EpYTOX+s0DLpaRLwj/Wq/N+eFtumjbcfCZIlk+F
 MS2JIhBvssFeDMSPJNNZD+8dq9MysqdoynikH9Qghz/BN/sfWxbm5JOYT/UIc6fh4siJ
 4fFtvpKFl/f/vx9x9JzNCvC+svscALpI44fhiGYutlHBcgQtU7ACUYySLTfjIsIyGMXT
 +GINQWvIQ90RuLof4VRYLyfRxXxDhyMH4xqt9tsOrlp4RhQCli2czPU8otKBcHOFMH3J
 3Rdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725849121; x=1726453921;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h3jsBoK6osKU+9RLD62g9RUso5s5R8d15TnY03wmQ6c=;
 b=C9ufaC9CY9F60FCJLqfGFwP2JWtd+0nbj0ES9k972iT7xIRExYQMhob90Hn6UhjwDu
 5Gtm/cD6R2H0Cu1t8lkhz3osYzmYymf4fSEmqgt4M2XYOzbi1zu32MBqJzdQX0ZDTPbF
 XTv77H0yw3Coe9GZvhDdZlU/BMCc9YsiyARkwOkarW1ZoxdoMT+p166OomLMjj4pnTln
 Opjb4Tfabc4wDrTg3DHt46GH3B23pqGVDP22jWz9BCSe6UkLa9QQHeG52wFMXE7f8q75
 nF2p+WoyNylhlE5UtYxqSPSWvku59LwVbJ7PNK2zhfwp7ohpjp4xwfMhvi4WofdGBz0q
 pytA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnSlOqe3xpSHTiCyTHwTymkCPFOlcYAeW29pC2NeRw4Jhusz+7oHY4btYMXbaVHHs7e6OCn8pkOXE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1jfRJ/Fw0ga8Nm7W8GL2RWIfGExt5fJgoB31twVSGyCJSnUUB
 3vdUPHMnHmuvIgnJg9pBm6KmrmdmVPfok5JoFbpPVnpvo7m5Ffj6PBUrAyK6Z9Y=
X-Google-Smtp-Source: AGHT+IFdVpSBGSpWYYHDlsrmgHjef/BjQGNN3o4DAAfwJWFtVeibofNSvovQsC/WeLsU5p/ooe4SLw==
X-Received: by 2002:a17:90a:be15:b0:2cc:ff56:5be1 with SMTP id
 98e67ed59e1d1-2dad50831d1mr8627025a91.7.1725849121016; 
 Sun, 08 Sep 2024 19:32:01 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2db049873b0sm3323645a91.47.2024.09.08.19.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Sep 2024 19:32:00 -0700 (PDT)
From: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
To: hsinyi@chromium.org
Cc: angelogioacchino.delregno@collabora.com,
 cengjianeng@huaqin.corp-partner.google.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hsinyi@google.com, knoxchiou@google.com, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, robh@kernel.org
Subject: [PATCH v5 0/2] arm64: dts: mediatek: Add MT8186 Ponyta
Date: Mon,  9 Sep 2024 10:31:46 +0800
Message-Id: <20240909023148.1677936-1-cengjianeng@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAJMQK-imYrDTuycVzQxkfbkZuHehE8uwc+qS2w=UDShETsBvEw@mail.gmail.com>
References: <CAJMQK-imYrDTuycVzQxkfbkZuHehE8uwc+qS2w=UDShETsBvEw@mail.gmail.com>
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

This is v5 of the MT8186 Chromebook device tree series.
---
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
 .../mediatek/mt8186-corsola-ponyta-sku0.dts   | 23 ++++++++++
 .../mediatek/mt8186-corsola-ponyta-sku1.dts   | 27 ++++++++++++
 .../dts/mediatek/mt8186-corsola-ponyta.dtsi   | 44 +++++++++++++++++++
 5 files changed, 106 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi

-- 
2.34.1

