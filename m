Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E53B396B407
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 10:15:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49AD810E6BE;
	Wed,  4 Sep 2024 08:15:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="J6TyyYUr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E89710E6BE
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 08:15:14 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-714226888dfso495547b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2024 01:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1725437713; x=1726042513; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3Vg5PX8kGrMXGtA5vCBEf0DJJleopQ7dF/auLyYJl/E=;
 b=J6TyyYUri6p8LpJ3dAWK7Ugy0V5CYtSatElK+qbXx3Lu9qVyPenYu82yzJk73ipCN2
 2MMmasuKtuMUUK3NgTMs7e4KXGw4cFq7st9Wl2ZjRR3vyuLUW6VybHDcatdL9QDDiCu1
 jcepPCiTFkk88F5zbNR9IGCHhED5SWKlKMYGlzYqFJzJ97A0QSTKHdRguXZTxYc3DlUw
 CAfQRKccinE4avGQDY+u2kO6b4ciCTq7m7X6Qq8mP48Ld+q/WGNnsXZLO/OMI22ceYY5
 5SmT2/YtmtiKuLHzmXxCG2J0UAqfjolXULSe0pThrg3A+p8EuGwRsDx1UAxPJqKwon7j
 qE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725437713; x=1726042513;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3Vg5PX8kGrMXGtA5vCBEf0DJJleopQ7dF/auLyYJl/E=;
 b=b1W2CcSfZuW53fFMCcvVWGU89D9Ycxg3nzAN/s3Uya8V2rNnXkJEDCu3FPj3rQ2qGm
 XoZqTXt6w8BQ6lZXloJecHSwjj2m+XTwkMParCN/YWEvxikF7nFAS8dGMgws+oynyaKk
 w0zDPDJ/+pQJgYNkCWsyMzGSvFdhtIVoVmtUikyOJgdsiTXoQu2ZeNfGPnpmXstiC7N7
 VijZGIIC25K+4oc+qrzuOaxELmSFKlKXd/RBx7Au+4lFueGXSLvUqMTDsP6VL6kJHZwT
 uZQzAbUpqn5pzF6aq5jWgQriqLE4G+Xb6defrYjEFeTx+sApN7juUbZlI8wYLfn9PxKi
 j0hQ==
X-Gm-Message-State: AOJu0YzxaaoJlSoRaCRWZK8h2liDmpmK64H3hdUHHIvCKoDSIWNOpGHl
 2DAOKBfXuLPPnEpYBhj79AFYKd1l7KZ/mDXY7wm4QXLklIRI+sjLs4Af+BQhKKk=
X-Google-Smtp-Source: AGHT+IGQTuy3EdutFWgRY9ekGLsHfjdaIPiMHwuEXBmtWuFhcvhHmp0JqdGpR/97ULY3I9kGwoQ9PA==
X-Received: by 2002:a05:6a21:78b:b0:1c4:7d53:bf76 with SMTP id
 adf61e73a8af0-1cce10aafe2mr19982244637.38.1725437713297; 
 Wed, 04 Sep 2024 01:15:13 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-206ae94980esm9024145ad.84.2024.09.04.01.15.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 01:15:12 -0700 (PDT)
From: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
To: angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 knoxchiou@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Subject: [PATCH v3 0/2] arm64: dts: mediatek: Add MT8186 Ponyta
Date: Wed,  4 Sep 2024 16:14:59 +0800
Message-Id: <20240904081501.2060933-1-cengjianeng@huaqin.corp-partner.google.com>
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

This is v3 of the MT8186 Chromebook device tree series.
---
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

