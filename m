Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52262B0C6A6
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 16:41:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B247D10E556;
	Mon, 21 Jul 2025 14:41:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="Vh4TTQz5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A10D10E556
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 14:41:46 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 59DD820CBF;
 Mon, 21 Jul 2025 16:41:44 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zGOlqnVLPpDF; Mon, 21 Jul 2025 16:41:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1753108903; bh=8VlZJ7NfFX9P6kbP/UbsBxb9wnj7bBEt5OE6yQCiJZ8=;
 h=From:Subject:Date:To:Cc;
 b=Vh4TTQz5jOHQekYk+nMEvka9HIe8n4VeJmBV4wiqUFJDmHqJWeG7PUkVCAs2rvO7J
 4BbYkMnk6smpz+NAlB4KksEKwiQJmrXIazwLKf6Wyj6ZzWepb1OL8ck+pHJkTAFAha
 jg53Fzm86XkIPS7KNvYa0MvE5k2/dbCSRQo1/N+sFNEsBKQOaM5SJvJJPIk2suwu1w
 mQjYvkk14NIulxFS3w3p9wvUk3HvDSfEc6FDbPYF6S31+I7+Mb1Z5wwEBwDZRK9WgM
 cvo8EXBpKc0Cr5KYgM6TRKB4N0KDI3s5a3JhsNsNUy7gs56SepNv5GNehAwUtKNxPV
 nhWct/h7KAXCQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v5 0/2] Add driver for Samsung AMS561RA01 panel with
 S6E8AA5X01 controller
Date: Mon, 21 Jul 2025 20:08:58 +0530
Message-Id: <20250721-panel-samsung-s6e8aa5x01-v5-0-1a315aba530b@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAJRfmgC/43NzarCMBCG4VuRrE8kmeandeV9iItpM6kBTyOJF
 kV670ZdqIji8v1gnjmzTClQZovZmSUaQw5xKKH/Zqzb4NATD640AwFaaKj4Dgfa8oz/+TD0PBu
 qEfVRSE4IqjGEnhyycr5L5MPxRq/WpTch72M63T6N8rreUSPhMzpKLrgwrmtRWEloli7kFON+H
 lPPruwITxToLxQUSrnWQltb1KjeqepXqipUg1I1ypPptHin1IOyIL5QqlDWNaBrj5VX+EpN03Q
 Bwo544qMBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753108898; l=2241;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=8VlZJ7NfFX9P6kbP/UbsBxb9wnj7bBEt5OE6yQCiJZ8=;
 b=WlPhe8JkFzxzWn6AWCAtFWBMonHKZ6tBCr1HUNvRyQpbsyAW1WAupE8eFZhuW3ZUsPbcWobRc
 Kju7CoC3PaYDxvyWtXB1TnTrVYNUQo4GB60AceWeTlbPTa+Dgl8dnBF
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

This patch series introduces a driver for Samsung AMS561RA01, which is
an AMOLED panel using the Samsung S6E8AA5X01 panel controller. This
panel is found in several (mostly Samsung) phones, it is a ~5.6 inch
720x1480 panel.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v5:
- fixed dt_binding_check error for invalid compatible used in example dts
  (robh's bot)
- Link to v4: https://lore.kernel.org/r/20250720-panel-samsung-s6e8aa5x01-v4-0-7d9258fa3f4a@disroot.org

Changes in v4:
- tweaked commit description of [v3 1/2] to reference the hardware.
- utilized devm_drm_panel_alloc() and devm_regulator_bulk_get_const()
  (neil.armstrong)
- redid patches to mention both panel and controller (dmitry.baryshkov)
- Link to v3: https://lore.kernel.org/r/20250625-panel-samsung-s6e8aa5x01-v3-0-9a1494fe6c50@disroot.org

Changes in v3:
- added brightness values for upto 500 nits.
- removed unused mutex object from panel code.
- Link to v2: https://lore.kernel.org/r/20250625-panel-samsung-s6e8aa5x01-v2-0-4db72b87a5a4@disroot.org

Changes in v2:
- fixed various dt_binding_check errors (conor)
- simplified panel enable sequencing (tzimmermann)
- did s/s6e8aa5x01_update_brightness/s6e8aa5x01_update_status (tzimmermann)
- added check for panel enable in s6e8aa5x01_update_status() (tzimmermann)
- used backlight_get_brightness() in appropriate places (tzimmermann)
- Link to v1: https://lore.kernel.org/r/20250612-panel-samsung-s6e8aa5x01-v1-0-06dcba071ea6@disroot.org

---
Kaustabh Chakraborty (2):
      dt-bindings: display: panel: document Samsung AMS561RA01 panel with S6E8AA5X01 controller
      drm: panel: add support for Samsung AMS561RA01 panel with S6E8AA5X01 controller

 .../panel/samsung,s6e8aa5x01-ams561ra01.yaml       |  55 ++
 drivers/gpu/drm/panel/Kconfig                      |  11 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 .../panel/panel-samsung-s6e8aa5x01-ams561ra01.c    | 981 +++++++++++++++++++++
 4 files changed, 1048 insertions(+)
---
base-commit: 97987520025658f30bb787a99ffbd9bbff9ffc9d
change-id: 20250523-panel-samsung-s6e8aa5x01-ea2496eafeda

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

