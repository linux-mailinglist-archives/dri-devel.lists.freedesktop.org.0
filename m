Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7248A733B
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 20:31:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F4910F2B9;
	Tue, 16 Apr 2024 18:31:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="kqKrEHo1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mainlining.org [94.241.141.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04BE110F2B9
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 18:31:13 +0000 (UTC)
Received: from david-ryuzu.localdomain
 (ipbcc3a836.dynamic.kabel-deutschland.de [188.195.168.54])
 by mail.mainlining.org (Postfix) with ESMTPSA id 4063BE20E0;
 Tue, 16 Apr 2024 18:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
 s=psm; t=1713292269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CDEkPdtKTNgd1iLFlJr4m5I7DfTRIEGCJhDqsto7S8E=;
 b=kqKrEHo1pbhQ4q90yt5ppV/kDqBM412ZH23DtnlWM5son7smI/mtbCocuiEd0jAxVkyYtj
 MG2QMeINp4283CTadR7wg6IRgNIUe15YuN/fS9ppYJu2bzC7xLfnDvO9SHJAuisk9hOhPf
 8onesEvjlU4SdYqak1qoGPECcD8U0HPKZ0eaJTAMlMvnYfA4jl55YoOLQNyFyCkaNaDQKj
 AFe5TedYsPVvuEaqInUnymlUjCCJsVL4FD0R0iA1bvQphbp818XopUUW5A0qHDajygaBkT
 fRs8iIevRiT2fo+noUX5xIbof9Q2oEPbDk1f2fvy+WxETp+iEAryLZAEtcGaug==
From: David Wronek <david@mainlining.org>
Subject: [PATCH v3 0/2] Add driver for Raydium RM69380-based DSI panels
Date: Tue, 16 Apr 2024 20:30:47 +0200
Message-Id: <20240416-raydium-rm69380-driver-v3-0-21600ac4ce5f@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANfDHmYC/4XNQQ6CMBCF4auQrq1ph1LBlfcwLkCmMIkUM9VGQ
 ri7hZWJMS7/l8w3swjIhEEcs1kwRgo0+hT5LhPXvvYdSmpTC1BglNFGcj219BwkD7bKSyVbpog
 szcEBNNaBcSjS8Z3R0WuDz5fUPYXHyNP2J+p1/UtGLZUssLRNDaZSTXEaavI38uS7/cidWN0In
 1bx04LVAgPaGqtzZb+sZVne/26T/g0BAAA=
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, David Wronek <david@mainlining.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713292268; l=1909;
 i=david@mainlining.org; s=20240121; h=from:subject:message-id;
 bh=rzC5W1TaCb9OYzxdOKGyAXPykw9cGXSoLeHQch7h958=;
 b=fHVKKYgh2Xauj1zzwwZfD7fVDUSHyQbzzy8cMaSXyu45ThbcnMq9DmCxgd6s4bzXCnISa63oG
 n0+jqf0FGN8D9RP9FYhxxXnkRX8e3/bUqdDQoey/lSkQOotsVK/2sF/
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

 .../bindings/display/panel/raydium,rm69380.yaml    |  91 +++++
 drivers/gpu/drm/panel/Kconfig                      |  14 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-raydium-rm69380.c      | 367 +++++++++++++++++++++
 4 files changed, 473 insertions(+)
---
base-commit: 66e4190e92ce0e4a50b2f6be0e5f5b2e47e072f4
change-id: 20240414-raydium-rm69380-driver-47f22b6f24fe

Best regards,
-- 
David Wronek <david@mainlining.org>

