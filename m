Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE2DAE7A38
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 10:31:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5F210E04A;
	Wed, 25 Jun 2025 08:31:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="WdXHe27v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED9D10E69A
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 08:31:38 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 8E9E622D94;
 Wed, 25 Jun 2025 10:31:37 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FcRS75g62sSj; Wed, 25 Jun 2025 10:31:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1750840296; bh=kRAmnZqcu3w7ZeUPYcI9fMpa3pvDcJC7k8rDwHpG8+0=;
 h=From:Subject:Date:To:Cc;
 b=WdXHe27va2n8z1H5c68ilfgj3ICetKkCTC6CWGovHFWr1du1ifvF/RdHKIdZrBJPH
 UB32y1dIyDuyez3N2OuqOHBr8HyZ2meCiOjg3esOwnMWo3HQJsjm8fkvVy4Cy7wOcy
 7h3tBl/DawLjx6jyrGgyEFZaPV36Me8d6ZrHxTpj1I/vfkR+HI6smWkii2TDQwdExL
 kajCIdwyC8YzLUVKkvc/cv5wkkhpIYFxYL3Y1dPqtZhSwO4fjWUk095qVaLOBMO4OK
 1cELy8qqRkPDGVjDUE5r1fmDm4h1zTQicff/nOguXS75U66xm+9OK52775s/dEfTLe
 BVQfWGTx9+VJw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v2 0/2] Add driver for Samsung S6E8AA5X01 panel controller
Date: Wed, 25 Jun 2025 14:01:14 +0530
Message-Id: <20250625-panel-samsung-s6e8aa5x01-v2-0-4db72b87a5a4@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANKzW2gC/3WNQQ6CMBBFr0K6dkxbpSor72FYjHSASbQlHSQYw
 t2tuHb5XvLfX5RQYhJVFYtKNLFwDBnsrlBNj6EjYJ9ZWW1LXdoDDBjoAYJPeYUOxNEZsZy1AUJ
 7vDjCljyqPB8StTxv6VuduWcZY3pvT5P52l/UGfs/OhnQoJ1v7qhPhtBdPUuKcdzH1Kl6XdcP2
 cPkO8IAAAA=
X-Change-ID: 20250523-panel-samsung-s6e8aa5x01-ea2496eafeda
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750840288; l=1414;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=kRAmnZqcu3w7ZeUPYcI9fMpa3pvDcJC7k8rDwHpG8+0=;
 b=3BsNs2IW9OGhEJ5YRMj8U4hg9xhReajV3FtYk5Xa7VVPzEkAL59nEbYF3iACDJXKQbBO7URwm
 P70uB4DuI79BTB0rDrScfCFJ+9c/Z4mfbd+itRyhU8Kjytp1wbRjdmB
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
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

This patch series introduces a driver for Samsung S6E8AA5X01, which is
an AMOLED MIPI DSI panel controller. This panel is found in several
(mostly Samsung) phones, in at least two different sizes - 720x1280 and
720x1480.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v2:
- fixed various dt_binding_check errors (conor)
- simplified panel enable sequencing (tzimmermann)
- did s/s6e8aa5x01_update_brightness/s6e8aa5x01_update_status (tzimmermann)
- added check for panel enable in s6e8aa5x01_update_status() (tzimmermann)
- used backlight_get_brightness() in appropriate places (tzimmermann)
- Link to v1: https://lore.kernel.org/r/20250612-panel-samsung-s6e8aa5x01-v1-0-06dcba071ea6@disroot.org

---
Kaustabh Chakraborty (2):
      dt-bindings: display: panel: document Samsung S6E8AA5X01 panel driver
      drm: panel: add support for Samsung S6E8AA5X01 panel controller

 .../bindings/display/panel/samsung,s6e8aa5x01.yaml |  78 ++
 drivers/gpu/drm/panel/Kconfig                      |  11 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-samsung-s6e8aa5x01.c   | 906 +++++++++++++++++++++
 4 files changed, 996 insertions(+)
---
base-commit: 0bb71d301869446810a0b13d3da290bd455d7c78
change-id: 20250523-panel-samsung-s6e8aa5x01-ea2496eafeda

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

