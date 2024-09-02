Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFD69689D6
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 16:24:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 989C610E318;
	Mon,  2 Sep 2024 14:24:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="2s9Lu+a5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C83610E2E5
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 12:55:11 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-7cd8d2731d1so2642128a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 05:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1725281711; x=1725886511; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ThRWljmoH7Hb4Hd8MB1zdTAbR9SpnQuP38bmtHqE+q8=;
 b=2s9Lu+a5EBAMdLr5iHOuJ7YCMlamvwP0ySS+H+POEf2PufqTrR7J+H9sMzsP6/4CUd
 W5UBGXXI61d/X/HCmWL5ZPIY4Sn5YzWQCUROOM3wexX/hBB10Y8b21PIZDCGZqpiIlTL
 lRdGd06KoXRYHgdYtyZnIUpjUdpm10rR/VZFauCcOq2UgXWLX0pTKu7ibNxAboi8Mo8g
 zgKmjnUllBaHztt6JjCfppYD0mm1cPs67gQ2T214UqqnYFgRkBzXnzIQ8fNYIxzv3tqb
 c7/4o+k/EqWLsRUFoFtp1CN8YR6UXt4a8q7Ysb2ExUg7/ICq8rNNZ4U3JxjOsmjPVXzg
 vzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725281711; x=1725886511;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ThRWljmoH7Hb4Hd8MB1zdTAbR9SpnQuP38bmtHqE+q8=;
 b=Ee0gL3lDyezXK449vZ7SO8KdP8AwwWY2yXse7s+3UH8R0uelo17UVX0hxsvVom4APP
 eJKdNg7tnLYqZXrqeg18K8NwG2U+JgGB9Y2vd3IDI5HSSxFWxvng+bBY2iXFuFNex1QE
 9gnwz9Qt7pejXr+khU/AHUyPd4++x4k154xGcOAbQTsPEyV7ZeSvxSNI8trT18Yfia6y
 oS2Xye/dk49ga4d9q7Na5X8v4YiPCttOrO7J6t3LlD4HexdwX5yN1ifZioTY78f+olLk
 FArf7PxZpHDIFuevvrDYTvoSXnQsWiOTt7GN1xGY+O2oXAMfvMDv2hhhY87XVjxNt6Rf
 lfpg==
X-Gm-Message-State: AOJu0YzcNJPxZn99hVqgFlheeKZkz7vCKbJn8NMjH+e8wBnp34OK6vwM
 sluTroLS7WwM7uURKE1D0OQFqETfGnkdJaHXTsUd2kIhJKT+4G9RQHh08SQ38Uo=
X-Google-Smtp-Source: AGHT+IFWYfklAZRYA4/RL84tZfC0b6rpcrS93I5FeoZ5eC3ChpSILTafiqClMF2uMDYki1jXpxc+PQ==
X-Received: by 2002:a05:6a21:6b0c:b0:1c3:b1e2:f826 with SMTP id
 adf61e73a8af0-1cece5d1548mr6768179637.35.1725281710762; 
 Mon, 02 Sep 2024 05:55:10 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-715e55a99eesm6773955b3a.50.2024.09.02.05.55.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 05:55:10 -0700 (PDT)
From: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
To: angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 knoxchiou@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Subject: [PATCH v1 0/2] arm64: dts: mediatek: Add MT8186 Ponyta
Date: Mon,  2 Sep 2024 20:55:00 +0800
Message-Id: <20240902125502.1844374-1-cengjianeng@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 02 Sep 2024 14:24:34 +0000
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

This is v1 of the MT8186 Chromebook device tree series.

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

