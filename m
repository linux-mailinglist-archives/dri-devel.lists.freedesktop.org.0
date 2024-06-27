Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C62E91A4B7
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 13:13:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E8F710E218;
	Thu, 27 Jun 2024 11:13:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ns.iliad.fr (ns.iliad.fr [212.27.33.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C50210E218
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 11:13:10 +0000 (UTC)
Received: from ns.iliad.fr (localhost [127.0.0.1])
 by ns.iliad.fr (Postfix) with ESMTP id E59A8201B4;
 Thu, 27 Jun 2024 13:13:08 +0200 (CEST)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr [213.36.7.13])
 by ns.iliad.fr (Postfix) with ESMTP id CD01920077;
 Thu, 27 Jun 2024 13:13:08 +0200 (CEST)
From: Marc Gonzalez <mgonzalez@freebox.fr>
Subject: [PATCH v3 0/2] Basic support for TI TDP158
Date: Thu, 27 Jun 2024 13:13:02 +0200
Message-Id: <20240627-tdp158-v3-0-fb2fbc808346@freebox.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD5JfWYC/2WMyw6CMBBFf4XM2prpgxZd+R/GBbRT6QZISxoM4
 d8tLIzG5bm556yQKAZKcK1WiJRDCuNQQJ4qsH07PIkFVxgECoWaGza7idcNU7wRiE5bix2U8xT
 Jh+UI3R+F+5DmMb6Obub7+pfInCFz/tKQN46sdjcfibpxOfsIeyOLL0/UH08Ur5WdVMqg8a358
 bZtewPk2KvH1QAAAA==
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


---
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

Getting unusual message at run-time, need to check.

[    2.389848] platform c9a0000.hdmi-tx: Fixed dependency cycle(s) with /soc@0/i2c@c1b5000/tdp158@5e
[    2.391089] i2c 2-005e: Fixed dependency cycle(s) with /soc@0/display-subsystem@c900000/hdmi-tx@c9a0000

---
Marc Gonzalez (2):
      dt-bindings: display: bridge: add TI TDP158
      drm/bridge: add support for TI TDP158

 .../bindings/display/bridge/ti,tdp158.yaml         |  51 ++++++++++
 drivers/gpu/drm/bridge/Kconfig                     |   7 ++
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/ti-tdp158.c                 | 108 +++++++++++++++++++++
 4 files changed, 167 insertions(+)
---
base-commit: d47e2c964a51cbaa14a8c0ac641f85349584fae9
change-id: 20240617-tdp158-418200d6cc0b

Best regards,
-- 
Marc Gonzalez <mgonzalez@freebox.fr>

