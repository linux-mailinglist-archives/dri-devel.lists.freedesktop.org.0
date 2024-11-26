Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A599D9B86
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 17:34:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B7B10E941;
	Tue, 26 Nov 2024 16:34:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="a99O8UWv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD5A510E941
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 16:34:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0F1CCA40EE9;
 Tue, 26 Nov 2024 16:32:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4865C4CED3;
 Tue, 26 Nov 2024 16:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732638865;
 bh=/LDcePj0XDKsYma0zK+FP7xyH1ASdKtuEO+PZnGEDFc=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=a99O8UWvqNcfnyMxK2dxnhjfTBiX2N75eQ/DkDrR+dQA6DZluHFfy88xA0PWdPhzu
 DRAGNJkMHf2pRK7rIi5zMgTk0dbFtMuhUCBtawk6M1fHm44i6sOjHcQZSDHj7HOAyW
 3m78QcpINTiKv/Lf2wo2E1dwQgz5zNDpp3dabtm229Nlw17itUow0JlSWqRzI1aH53
 v3ZS6HensCtlQI9ft2UwzHvKoszRdb07g9bfgCJUi7AOfePesWu1kDlISbU+EJ+IqC
 +rFNcpNz+zoJLDql0cxBrXBOC9jDXm+iEdophb3ptSV7fi0TP0NAaGEQ/Qt6U5ekm5
 EqVl5OtcNDRLA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id A0BBBD3B9BE;
 Tue, 26 Nov 2024 16:34:25 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Subject: [PATCH v2 0/5] Driver for pre-DCP apple display controller.
Date: Tue, 26 Nov 2024 17:34:19 +0100
Message-Id: <20241126-adpdrm-v2-0-c90485336c09@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIv4RWcC/2XMQQ6CMBCF4auQWVvDlKrAynsYFk1ngEkskNY0G
 tK7W9m6/F9evh0iB+EIfbVD4CRR1qWEPlXgZrtMrIRKg661QdRGWdooeKUvo+OGqLU3hHLeAo/
 yPqDHUHqW+FrD53AT/tY/IqGqVYMdUstXNp29T97K8+xWD0PO+QtOmwltnAAAAA==
X-Change-ID: 20241124-adpdrm-25fce3dd8a71
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Janne Grunau <j@jannau.net>, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732638864; l=2009;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=/LDcePj0XDKsYma0zK+FP7xyH1ASdKtuEO+PZnGEDFc=;
 b=OZR7bklMcaizua9kd4TjpLz0AjqB1X+Vunzk81NYY7+bDd6YxbJUoKnvBPvak/Wdfbw4r/1u6
 ivWR35297jmCQnjxOTmbOKHjfiKdJI/RzDIBL6aOxGv6AdRQodof9IX
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
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
Reply-To: fnkl.kernel@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi.

This patch series adds support for a secondary display controller
present on Apple M1/M2 chips and used to drive the display of the
"touchbar" touch panel present on those. 

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
Changes in v2:
- Addressing the review feedback.
- Split out the mipi part of the display controller into a separate device
- Link to v1: https://lore.kernel.org/r/20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com

---
Sasha Finkelstein (5):
      dt-bindings: display: Add Apple pre-DCP display controller bindings
      drm: adp: Add Apple Display Pipe driver
      drm: panel: Add a panel driver for the Summit display
      arm64: dts: apple: Add touchbar screen nodes
      MAINTAINERS: Add entries for touchbar display driver

 .../display/apple,h7-display-pipe-mipi.yaml        |  89 +++
 .../bindings/display/apple,h7-display-pipe.yaml    |  77 +++
 .../bindings/display/panel/apple,summit.yaml       |  58 ++
 MAINTAINERS                                        |   5 +
 arch/arm64/boot/dts/apple/t8103-j293.dts           |  31 ++
 arch/arm64/boot/dts/apple/t8103.dtsi               |  61 +++
 arch/arm64/boot/dts/apple/t8112-j493.dts           |  31 ++
 arch/arm64/boot/dts/apple/t8112.dtsi               |  62 +++
 drivers/gpu/drm/Kconfig                            |   2 +
 drivers/gpu/drm/Makefile                           |   1 +
 drivers/gpu/drm/adp/Kconfig                        |  16 +
 drivers/gpu/drm/adp/Makefile                       |   4 +
 drivers/gpu/drm/adp/adp-mipi.c                     | 251 +++++++++
 drivers/gpu/drm/adp/adp_drv.c                      | 594 +++++++++++++++++++++
 drivers/gpu/drm/panel/Kconfig                      |   9 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-summit.c               | 143 +++++
 17 files changed, 1435 insertions(+)
---
base-commit: 9f16d5e6f220661f73b36a4be1b21575651d8833
change-id: 20241124-adpdrm-25fce3dd8a71


