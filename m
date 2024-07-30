Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47373941504
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 17:01:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A1910E533;
	Tue, 30 Jul 2024 15:01:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ns.iliad.fr (ns.iliad.fr [212.27.33.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB73510E529
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 15:01:52 +0000 (UTC)
Received: from ns.iliad.fr (localhost [127.0.0.1])
 by ns.iliad.fr (Postfix) with ESMTP id 4DF5F20C77;
 Tue, 30 Jul 2024 17:01:51 +0200 (CEST)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr [213.36.7.13])
 by ns.iliad.fr (Postfix) with ESMTP id 35DCC20547;
 Tue, 30 Jul 2024 17:01:51 +0200 (CEST)
From: Marc Gonzalez <mgonzalez@freebox.fr>
Subject: [PATCH v4 0/2] Basic support for TI TDP158
Date: Tue, 30 Jul 2024 17:01:30 +0200
Message-Id: <20240730-tdp158-v4-0-da69001bdea2@freebox.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEoAqWYC/2XNTQ6DIBCG4as0rEvDn0K76j2aLgRmKhs1YIiN8
 e5FF62Ny2/C8zKTBDFAIrfTTCLkkELflaHOJ+LapnsBDb5sIphQrOaajn7glaGKG8GYr51jlpT
 HQwQM0xZ6PMtuQxr7+N66ma/XQyJzyqjHqwHUHlzt7xgBbD9dMJK1kcXOierrRHGNtFIpzTQ2+
 uDk3v3+k8WhFWidYUaq+s8ty/IBQxaMrA0BAAA=
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Arnaud Vrac <avrac@freebox.fr>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Marc Gonzalez <mgonzalez@freebox.fr>
X-Mailer: b4 0.13.0
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

TDP158 is an AC-coupled DVI / HDMI to TMDS level shifting Redriver.

Like the TFP410, the TDP158 can be set up in 2 different ways:
1) hard-coding its configuration settings using pin-strapping resistors
2) placing it on an I2C bus, and defer set-up until run-time

The mode is selected by pin 8 = I2C_EN
I2C_EN = 1 ==> I2C Control Mode
I2C_EN = 0 ==> Pin Strap Mode

On our board, I2C_EN is pulled high (hard-wired).

---
Changes in v4:
- Rebase series on top of v6.11-rc1
- Add blurb about I2C vs pin strap mode in cover letter
- Add blurb about I2C vs pin strap mode in binding commit message
- Add blurb about I2C mode in driver commit message
- Add comment in binding explaining when reg is required
- Add comment in binding describing Operation Enable / Reset Pin
- Link to v3: https://lore.kernel.org/r/20240627-tdp158-v3-0-fb2fbc808346@freebox.fr

Changes in v3:
- Add 'select DRM_PANEL_BRIDGE' in driver Kconfig
- Fix checkpatch errors
- log errors using dev_err (so save dev pointer)
- expand a few error messages
- expand commit messages with info from the datasheet
- mark regulators as required in the DT binding
- Link to v2: https://lore.kernel.org/r/20240625-tdp158-v2-0-a3b344707fa7@freebox.fr

Changes in v2:
- Don't overload simple-bridge, spin new minimal driver
- New driver, new binding
- Default device settings work fine for us, so we don't tweak registers
- Link to v1: https://lore.kernel.org/r/20240617-tdp158-v1-0-df98ef7dec6d@freebox.fr

- Link to v0b: https://lore.kernel.org/r/b41f2f86-0d99-4199-92a9-42cbb9d6a6d5@freebox.fr/
- Link to v0a: https://lore.kernel.org/r/d3de652f-ce89-4f57-b900-07b11f8bf8f9@free.fr/

---
Marc Gonzalez (2):
      dt-bindings: display: bridge: add TI TDP158
      drm/bridge: add support for TI TDP158

 .../bindings/display/bridge/ti,tdp158.yaml         |  57 +++++++++++
 drivers/gpu/drm/bridge/Kconfig                     |   7 ++
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/ti-tdp158.c                 | 108 +++++++++++++++++++++
 4 files changed, 173 insertions(+)
---
base-commit: c6072668fcfb13295b600747dbd89f00da1a4ed9
change-id: 20240617-tdp158-418200d6cc0b

Best regards,
-- 
Marc Gonzalez <mgonzalez@freebox.fr>

