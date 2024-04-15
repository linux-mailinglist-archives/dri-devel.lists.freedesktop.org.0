Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EACFF8A572E
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 18:11:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 127BE1126CE;
	Mon, 15 Apr 2024 16:11:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="egRgqYkv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mainlining.org [94.241.141.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C662F1126D8
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 16:11:11 +0000 (UTC)
Received: from david-ryuzu.localdomain
 (ipbcc3a836.dynamic.kabel-deutschland.de [188.195.168.54])
 by mail.mainlining.org (Postfix) with ESMTPSA id 4B303E2090;
 Mon, 15 Apr 2024 16:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
 s=psm; t=1713197468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OBR7VcUe1f0cOP2L98szrpXe7yVE6MtTgThd4EGNycU=;
 b=egRgqYkvp2EK+Ga5b183eMU1Abzsm3dV76T8jNFBriPJSgWZT5g/6mp9hITB+Tl/C8QK+2
 8UHXKG4WO4+mpHuyRhdyuY/18yGP3b5Y2qL/ibCQ+yoRGmZ0CwSLKPzvTt3EC9Ptq6zy36
 KFfPdwJHCIxRocTtOxCTkKO8+pJtWMISw0Xg1piDE3vT3loZ0qBxzqzHX+MyH3WRYMwVP8
 /6WZQPf46P+Y1FgjHKFBx+NQ6FKBU9e2xLIRI8hG2NXGzOI4YgrLsnLARjuP6+KaNYFXcz
 Y88FRivrr69WjkCTmGetIzIOtbWh4ORtpyrxHnV2hduHT3of7ngFciD+xg16Uw==
From: David Wronek <david@mainlining.org>
Subject: [PATCH v2 0/2] Add driver for Raydium RM69380-based DSI panels
Date: Mon, 15 Apr 2024 18:10:40 +0200
Message-Id: <20240415-raydium-rm69380-driver-v2-0-524216461306@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIBRHWYC/4WNQQ6CMBBFr0Jm7ZhSC4Ir72FYFJnCJNKaqTYSw
 t2tXMDle8l/f4VIwhThUqwglDhy8Bn0oYD7ZP1IyENm0EobZUqDYpeB3zPKXLenRuEgnEjQnJ3
 Wfe20cQR5/BRy/NnDty7zxPEVZNl/Uvmzf5OpRIUVNXVvtWlVX11ny/7Bnv14DDJCt23bF4esW
 ELBAAAA
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713197467; l=1472;
 i=david@mainlining.org; s=20240121; h=from:subject:message-id;
 bh=7TAWvvbWPmIFcyAcYyiVLwTTiZ75LIk1+1y8ww3eOB8=;
 b=awI9NBwRIBf8sY1Xz6NcvP7ngWC4nYMHdZmh0D1d6Z/1sYVBvLNXBTqDJI8RxTKVR4re6RZDb
 lu5WC2392kKDP+rUZ2nKeurJn8afs7cnYyNfe7W81QRa1zWGUhFTwa7
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
 drivers/gpu/drm/panel/panel-raydium-rm69380.c      | 366 +++++++++++++++++++++
 4 files changed, 472 insertions(+)
---
base-commit: 6bd343537461b57f3efe5dfc5fc193a232dfef1e
change-id: 20240414-raydium-rm69380-driver-47f22b6f24fe

Best regards,
-- 
David Wronek <david@mainlining.org>

