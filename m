Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC67D9D7889
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 23:29:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3901D10E35E;
	Sun, 24 Nov 2024 22:29:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QE2eWlsG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEDE510E0CA
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 22:29:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 038B55C577C;
 Sun, 24 Nov 2024 22:28:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2B4BFC4CED3;
 Sun, 24 Nov 2024 22:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732487381;
 bh=c79EAnCWulfs6GRWWUruMhPsTaQlP4sqW+UN5ZBM3qQ=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=QE2eWlsGZUYvRr5tymXSf2YV+O+HTyF/z63nFx8qvcsdejVyHnFnqIulXzffn8yzF
 3F+c0briKayYmDn260FNSC4tyH7XM1bHXNjMD9O7VG8pACNlsFtRkDcxC4mgjSyCID
 y/NobayM6riJAX5YNvlR8e1m8Oin3f4VocWq6lb44QawfUyRx73Gmy0wTCRBKZ5v4Y
 AZwQXB9Vcw9u8OLoDcKCHTBpT5qkY60wKtz70CH/v8yJT+uvaK3sVldJZsoNRnYXn5
 jdYSPLR0x55/xpkeSYzKXc+99VPugf8ZA4sg6W54Y9jp32rLA9gYKB6upDuw53bdpm
 rSrpGJGJnHYYA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 01C76E668BD;
 Sun, 24 Nov 2024 22:29:41 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Subject: [PATCH 0/5] Driver for pre-DCP apple display controller.
Date: Sun, 24 Nov 2024 23:29:23 +0100
Message-Id: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMOoQ2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQyMT3cSUgpSiXF0j07TkVOOUFItEc0MloOKCotS0zAqwQdGxtbUAW3O
 zcFgAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732487379; l=1534;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=c79EAnCWulfs6GRWWUruMhPsTaQlP4sqW+UN5ZBM3qQ=;
 b=s7QBvkr2M/7LlXCH7u4T7kGhNjKD+UEGgYObKwAiPkwJOUb/YCf5XOLGMPqL2P9zWjtZeWozU
 1YTYqOqXFULA3D4XrCefQz7WnGtLwUgiixx7AL+ou4ofz0QXoOYNVGG
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
Sasha Finkelstein (5):
      dt-bindgins: display: Add Apple pre-DCP display controller bindings
      gpu: drm: adp: Add Apple Display Pipe driver
      gpu: drm: adp: Add a backlight driver for the Summit LCD
      arm64: dts: apple: Add touchbar screen nodes
      MAINTAINERS: Add entries for touchbar display driver

 .../bindings/display/apple,display-pipe.yaml       |  59 ++
 .../bindings/display/panel/apple,summit.yaml       |  24 +
 MAINTAINERS                                        |   2 +
 arch/arm64/boot/dts/apple/t8103-j293.dts           |   8 +
 arch/arm64/boot/dts/apple/t8103.dtsi               |  26 +
 arch/arm64/boot/dts/apple/t8112-j493.dts           |  15 +
 arch/arm64/boot/dts/apple/t8112.dtsi               |  25 +
 drivers/gpu/drm/Kconfig                            |   2 +
 drivers/gpu/drm/Makefile                           |   1 +
 drivers/gpu/drm/adp/Kconfig                        |  14 +
 drivers/gpu/drm/adp/Makefile                       |   5 +
 drivers/gpu/drm/adp/adp_drv.c                      | 814 +++++++++++++++++++++
 drivers/gpu/drm/adp/panel-summit.c                 | 108 +++
 13 files changed, 1103 insertions(+)
---
base-commit: 9f16d5e6f220661f73b36a4be1b21575651d8833
change-id: 20241124-adpdrm-25fce3dd8a71


