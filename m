Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF228A88DD
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 18:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 481DE10F75B;
	Wed, 17 Apr 2024 16:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="JYdk5L67";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mainlining.org [94.241.141.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DAAE10F752
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 16:29:39 +0000 (UTC)
Received: from david-ryuzu.localdomain
 (ipbcc3a836.dynamic.kabel-deutschland.de [188.195.168.54])
 by mail.mainlining.org (Postfix) with ESMTPSA id 9AF8FE21F6;
 Wed, 17 Apr 2024 16:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
 s=psm; t=1713371376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xPYGDPhJh1vELUn0B/FqjrjcJ+/sPNoVRwyANQEYHdk=;
 b=JYdk5L67+vmCuNRp9tymIHeHUuU2TQbSDa1VyEhxVeUsB3WCzT0r2YRvj7sc/Vdz3726UR
 WiqEK82StMRBA1N/Hdt2+9GOqPHXoFyJbQxrwiAW43jI5b5OKfgXM3DNSFfUMoNaiM2g5B
 Tf4eBtfkdFXAjbdiYQiYrlOqs+Q2LPq6QdOxFwXSb8vH6I3VJSsVGgpomCt/n4IhAWKWfk
 QXk3DudT2K8sx4a71ikeej6OiNGUNuk1FHA8ieTI4W3Z9FtLK6T7l/tF9KkaHA19faBt5L
 SgNOi32aKtOcVY4RISa+7wg4duVxtlGL+tOF2Jk0Yrj5frwcc6wwBhmq3byzsg==
From: David Wronek <david@mainlining.org>
Subject: [PATCH v4 0/2] Add driver for Raydium RM69380-based DSI panels
Date: Wed, 17 Apr 2024 18:29:32 +0200
Message-Id: <20240417-raydium-rm69380-driver-v4-0-e9c2337d0049@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOz4H2YC/4XNTQrCMBCG4atI1kaS6TT+rLyHuEjbSR2wqUw1W
 KR3N3UlqLh8P5hnHmogYRrUbvFQQokH7mMOXC5UffKxJc1NbgUG0KBFLX5s+NZp6dy22BjdCCc
 SjesAULkAGEjl44tQ4PsLPhxzn3i49jK+/iQ7r3/JZLXRJW1c5QG3pir3ned45sixXfXSqtlN8
 G6VPy2YLUCwDp0tjPtqFe+W+2kV2cqQMb7GmsrwYU3T9ASYTJCqWQEAAA==
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, David Wronek <david@mainlining.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713371375; l=2367;
 i=david@mainlining.org; s=20240121; h=from:subject:message-id;
 bh=0zI/r5Ik3YIYBBvZMU3MnWLBc5VIg6oUdDjl7nfLlvs=;
 b=jvWf+sJ9X3xbT7K3CtxDZbHfGyPwlgrQtPx133MCZQbu8ADxc+8/axyDnPVtJDfpRuuDbC0D9
 x4vzaUnzzulD5lDvRs+Thrre+IPAxo+r0rWR5D64pBJ3kcf6GlpvljW
X-Developer-Key: i=david@mainlining.org; a=ed25519;
 pk=PJIYyFK3VrK6x+9W6ih8IGSJ5dxRXHiYay+gG1qQzqs=
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

This patch adds support the 2560x1600@90Hz dual DSI command mode panel by
EDO in combination with a Raydium RM69380 driver IC.

This driver IC can be found in the following devices:
 * Lenovo Xiaoxin Pad Pro 2021 (TB-J716F) with EDO panel
 * Lenovo Tab P11 Pro (TB-J706F) with EDO panel
 * Robo & Kala 2-in-1 Laptop with Sharp panel

Signed-off-by: David Wronek <david@mainlining.org>
---
Changes in v4:
- Fix up Kconfig
- Switch to devm_mipi_dsi_attach to benefit from automatic detaching
- Initialize panel at a lower brightness
- Dropped debug logs
- Signify second DSI interface in mipi_dsi_device_info as "RM69380 DSI1"
- Changed 'addtionalProperties' to 'unevaluatedProperties' in dt-binding
- Dropped 'ports' in dt-binding
- Link to v3: https://lore.kernel.org/r/20240416-raydium-rm69380-driver-v3-0-21600ac4ce5f@mainlining.org

Changes in v3:
- Removed unneeded curly brackets from some if statments
- Fix error handling code in probe function
- Include video/mipi_display.h and make use of MIPI command definitions
- Removed DRM_MODE_TYPE_PREFERRED
- Dropped 'prepared' bool entirely
- Register second DSI host using mipi_dsi_device_register_full()
- Link to v2: https://lore.kernel.org/r/20240415-raydium-rm69380-driver-v2-0-524216461306@mainlining.org

Changes in v2:
- Fixed typo in Kconfig
- Removed ctx->prepared = true; in prepare function
- Switched to drm_connector_helper_get_modes_fixed in get_modes function
- Changed dev_notice() to dev_dbg()
- Add description for compatible and reset-gpio in the dt-binding
- Always require 'ports' node in the dt-binding regardless of compatible
- Link to v1: https://lore.kernel.org/r/20240414-raydium-rm69380-driver-v1-0-5e86ba2490b5@mainlining.org

---
David Wronek (2):
      dt-bindings: display: panel: Add Raydium RM69380
      drm/panel: Add driver for EDO RM69380 OLED panel

 .../bindings/display/panel/raydium,rm69380.yaml    |  89 ++++++
 drivers/gpu/drm/panel/Kconfig                      |  12 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-raydium-rm69380.c      | 344 +++++++++++++++++++++
 4 files changed, 446 insertions(+)
---
base-commit: 4eab358930711bbeb85bf5ee267d0d42d3394c2c
change-id: 20240414-raydium-rm69380-driver-47f22b6f24fe

Best regards,
-- 
David Wronek <david@mainlining.org>

