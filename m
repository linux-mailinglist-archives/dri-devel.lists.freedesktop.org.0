Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24926977739
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 05:15:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 916E610E0F7;
	Fri, 13 Sep 2024 03:15:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="q8fAgN8F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA26D10E0F7
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 03:15:18 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2054feabfc3so14250665ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 20:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1726197318; x=1726802118; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TubZ7clM1MJ6sPd0lA2DkuHJ4eIzYwhY6qHr+nDS2JY=;
 b=q8fAgN8FFUVAO1+8Fn4SUVFOotgBBxTTjDlfyIqh2D2wTylfcps9Mg6YPTsrLLbwML
 zuU3ySsYmRfSXKlEoXDhvU+xgp/os3hq/CXtLBG4frugCcAvVg0bX2tIZXPdI4aQT42C
 4kfBmLWU+jSNEQHYeqFOcQ3FE+ptL0jW8LKcQLS6WMWPSkvoMUgSjRsUB+BdSOb/aA7C
 FP6AwJDBRLBYImKMo8GEZtHS6oIacmZEhZxYZSSq4YqzjmEICprp9FeXHFw69FYAOgGm
 c/9fcOrskPYETHTxMZ9II2QiyNPiAyn5LyvAyAzgf0xg8ai2Fg5DBr844vLDsymu0T3s
 uTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726197318; x=1726802118;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TubZ7clM1MJ6sPd0lA2DkuHJ4eIzYwhY6qHr+nDS2JY=;
 b=QNHUGGVvxcUzmlhWE9quFuzEzIaMOGn6ZE3bYgOr8yBDSgbBzodrNKX1vvHwLy73OO
 GaA6QCUIexQgYSIo56sv6B8IgG79k1zeKmS4KR4ZkJPqMxs9FgIP3v7kc4Vkq17qSfeC
 kMP7GPP19pEPANZRQBinRtbFSRf4pwmc0EHG4vtcxij6vomzByAvMhGH4ej1VIadt3fL
 AsSH4cUa0EUtiMQgfqC3IkUSzRWnEHyWolJsAxBshBJbH7Lr/eTAxblnL8j841UKW0Ra
 Q/8OoqORoYpgyV/ngnvaKj/nfxt7sHnwVOr6H6nXUG3HPjN5Y6yjGe137ye63Ku+YyRi
 ke6A==
X-Gm-Message-State: AOJu0Yx28mSjBCY+CbyzU0h9RSi1H0Rzbjv34+Qi8rCxmV+JumYLgtah
 LzldmTtpKFPpOiPBXsJRXyBK2NPP3Ashhu29aPqHaRkct76OVKhaU0PzKBxJ5P8=
X-Google-Smtp-Source: AGHT+IE+iazR4De+MBDM48Q6idkzARa1pEpWsipiV6SxZvqaRt2xeoupHSj0UJ9RkX/BCJ/hb43PSg==
X-Received: by 2002:a17:902:d2d1:b0:206:c5cf:9727 with SMTP id
 d9443c01a7336-2076e39a4d1mr73694465ad.31.1726197317886; 
 Thu, 12 Sep 2024 20:15:17 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2076af45432sm20382305ad.91.2024.09.12.20.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 20:15:16 -0700 (PDT)
From: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
To: angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 knoxchiou@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Subject: [PATCH v7 0/2] arm64: dts: mediatek: Add MT8186 Ponyta
Date: Fri, 13 Sep 2024 11:15:03 +0800
Message-Id: <20240913031505.372868-1-cengjianeng@huaqin.corp-partner.google.com>
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

This is v7 of the MT8186 Chromebook device tree series.
---
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

