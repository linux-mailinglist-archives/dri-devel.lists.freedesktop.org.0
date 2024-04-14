Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E694C8A4581
	for <lists+dri-devel@lfdr.de>; Sun, 14 Apr 2024 22:55:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C958510E935;
	Sun, 14 Apr 2024 20:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="Dyti9lVC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mainlining.org [94.241.141.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C6810FFD1
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Apr 2024 15:31:32 +0000 (UTC)
Received: from david-ryuzu.localdomain
 (ipbcc3a836.dynamic.kabel-deutschland.de [188.195.168.54])
 by mail.mainlining.org (Postfix) with ESMTPSA id 931B5E21A1;
 Sun, 14 Apr 2024 15:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
 s=psm; t=1713108186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qT61WY3ccUFg/GjjL36acuqJpraSqI5TD4a9LEcwBYY=;
 b=Dyti9lVC+bTG/7cWYHVrB72GeSYwNkx0ZK/wuyyReNyBbvgUO1GQ1qPyjHasZu6pA+toda
 gkfJh0ANqFXzDcNWRjhReZVyy+uMzK3o0HjRSDbuOLNeITG6pGwYLnquz2OvpxpUDH/xBW
 Ymu+nIzEFCADglUlaqj+m1Ciu8bFuNCeNNW77ut0vMpS/mcbkoR+dpuCIRbFGvEItiRGns
 xkc3X0i/DOS6p/sYUDSqAuJi34OM3IfihekYb2xgyjCm4y1YSWjQbYy22TgSYlzN5mukpQ
 Uxhv8rwRB9oMOMNqbmPk8h0fuRej5A1t05A2bPxQcRihpznhFE+BkHmzrFHlZg==
From: David Wronek <david@mainlining.org>
Subject: [PATCH 0/2] Add driver for Raydium RM69380-based DSI panels
Date: Sun, 14 Apr 2024 17:22:29 +0200
Message-Id: <20240414-raydium-rm69380-driver-v1-0-5e86ba2490b5@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALX0G2YC/x3MMQ6DMAxA0asgz1gKxkqhV0EdoHGKB6ByBCqKu
 DtRxzf8nyGJqSR4VhlMDk26rQVNXcF7HtePoIZiIEfsuGG08Qy6L2iL79vOYTA9xJAfkWjykTg
 KlPhrEvX3Hw+v67oBjbh+B2gAAAA=
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
 David Wronek <david@mainlining.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713108185; l=1013;
 i=david@mainlining.org; s=20240121; h=from:subject:message-id;
 bh=KCbN3AaRoKVj9vjtbieCSuk6IriODycJBXnS4VDwxFo=;
 b=SO3+/vE1qxF8sxuE4CShhuqNMdm5yxMqzGqrsaCQU11XkTm3wM/ZK2IUa76Oyy0XUaFJ/Fp0J
 itQy7Mk2gstAxDZ6TlGbfRHx4RlYYVEQ2xoDhBYoS5F2CCeWE5B/EZv
X-Developer-Key: i=david@mainlining.org; a=ed25519;
 pk=PJIYyFK3VrK6x+9W6ih8IGSJ5dxRXHiYay+gG1qQzqs=
X-Mailman-Approved-At: Sun, 14 Apr 2024 20:55:33 +0000
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
David Wronek (2):
      dt-bindings: display: panel: Add Raydium RM69380
      drm/panel: Add driver for EDO RM69380 OLED panel

 .../bindings/display/panel/raydium,rm69380.yaml    |  94 +++++
 drivers/gpu/drm/panel/Kconfig                      |  14 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-raydium-rm69380.c      | 378 +++++++++++++++++++++
 4 files changed, 487 insertions(+)
---
base-commit: 9ed46da14b9b9b2ad4edb3b0c545b6dbe5c00d39
change-id: 20240414-raydium-rm69380-driver-47f22b6f24fe

Best regards,
-- 
David Wronek <david@mainlining.org>

