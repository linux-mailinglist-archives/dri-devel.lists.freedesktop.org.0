Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DDD97769E
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 03:55:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4639E10EC28;
	Fri, 13 Sep 2024 01:55:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="MLNLExQ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE93410EC28
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 01:55:14 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-20573eb852aso18219755ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 18:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1726192514; x=1726797314; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IMxkeNdrxiqikuKLTukYhJ/j/5AL+Bs96CDGSxnXGSg=;
 b=MLNLExQ+2aCkP8STuQJb2VSd7qmCPVX4rvnSr3XHkmxkgid2oJfcR5GopeHasfQ+rd
 +DkiBFqi134n8z+Az/eIMTVgn6OygLS8bSCylr/SpBgTRMvHhqKizEVZCORb4W71oRir
 py2Om+IFhouB4AelOScQ+1cpHaz9Qs0kxBCZ6W52Al0kZX92yPIbZ9iVloJXwzdg5MXe
 IQOEyV9Q2hG5XNCOtz489PSnN07cDviNWbKHtHCqGEcfDc76gFvcmyvOZzC9Ks+JV2Vf
 etS3HLE/YVM/aOMV7IBAf/Z86D4dN8VCh7zqU9UWGkkWHk3nsbylQueZ4MMl/sS5ZIwf
 fCuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726192514; x=1726797314;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IMxkeNdrxiqikuKLTukYhJ/j/5AL+Bs96CDGSxnXGSg=;
 b=WrW4pjhYZ0jFEiSxdIIuQvPB7dsGNklSZpE2QuVdH37B/cHOBrB5KZrn2QZ9l3SxG3
 Yr9MjpCIoNxD1Ou7CgY2k7U+ur5WcHLBFmEl0lwlKDQ6Ryla52keMo+ArjASM+ZQH+nP
 GABaxqHlHlLv7IiN4uWqx4uUpQ+yymp7knmG8Tcc7eEZg+eBewkXVvKkAF2awnb5YGcj
 PbV8XRvK+e+qv5QfIffVfMjGSz8ALv2wfGB6leJpvkbXGVdwq8CesYI2nNWa6dz1lPHs
 0mebYAtGZn4OUPwjNMSmELaeJWuOq/joLudQCDREi6c2SHkws5rWjNaAKpbV5DzDsRnN
 ke4A==
X-Gm-Message-State: AOJu0YwjB3RTUzXGTd4gHJrsqplWwKEDAeuONMnb0ZnWpFuO5P8jfwnr
 AI7+Bm31uyvBhdq/JtpDdE/Sj9GjOfuh5P0jWLYciGhSyyR4q0deqZ1Gg0z1U7g=
X-Google-Smtp-Source: AGHT+IGxrtDK2oxIlkCa8nrZNGoU6o2v1wR+o7ZOWg02JmyUm3+u/KgHhFUU6pBBIaZ4YEIAqXAk3Q==
X-Received: by 2002:a17:903:32ce:b0:205:6121:1b2d with SMTP id
 d9443c01a7336-2074c5d24aamr135964765ad.3.1726192513808; 
 Thu, 12 Sep 2024 18:55:13 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2076af49210sm19896605ad.99.2024.09.12.18.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 18:55:13 -0700 (PDT)
From: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
To: angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 knoxchiou@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Subject: [PATCH v6 0/2] arm64: dts: mediatek: Add MT8186 Ponyta
Date: Fri, 13 Sep 2024 09:55:01 +0800
Message-Id: <20240913015503.4192806-1-cengjianeng@huaqin.corp-partner.google.com>
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

This is v6 of the MT8186 Chromebook device tree series.
---
Changes in v6:
- PATCH 2/2: Remove prototype sku.
- PATCH 2/2: Disable the other trackpad to enable one of them.
- Link to v5:https://lore.kernel.org/all/20240909023148.1677936-1-cengjianeng@huaqin.corp-partner.google.com/

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

