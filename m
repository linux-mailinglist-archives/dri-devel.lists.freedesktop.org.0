Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6400E31D8B6
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 12:48:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632B86E429;
	Wed, 17 Feb 2021 11:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48F046E429
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Feb 2021 11:48:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D3881B7D9;
 Wed, 17 Feb 2021 11:48:21 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 00/15] Raspberry PI 4 V3D enablement
Date: Wed, 17 Feb 2021 12:47:55 +0100
Message-Id: <20210217114811.22069-1-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
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
Cc: f.fainelli@gmail.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, phil@raspberrypi.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, wahrenst@gmx.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series attempts to enable V3D on BCM2711, the SoC available on the
Raspberry Pi 4 family of boards.

Due to the lack of documentation some things are taken as it from
testing/downstream implementation[1], which I'm hilighting here:

- It's not clear that the following is 100% true, maybe someone can confirm:

	"In BCM2711 the new ARGON ASB took over V3D. The old ASB is still
	present with the ISP and H264 bits, and V3D is in the same place in the
	new ASB as the old one."

- Patch #9 ("soc: bcm: bcm2835-power: Bypass power_on/off() calls"), I
  took as is from the downstream implementation, I can't really provide
  an exact explanation on what changed HW wise.

- Ultimately, I need confirmation from the Broadcom folks that they are alright
  with patch #11 ("drm/v3d: Get rid of pm code")

With all this, I get a more or less stable experience using mesa 20.3.4 and
X11/Gnome.

Regards,
Nicolas

---

Changes since v2:
 - Correct ASB names
 - Address dt-binding comments

Changes since v1:
 - Use 'reg-names'
 - Correct ASB names
 - Add missing binding patch for V3D
 - Address Stefan's comments

Nicolas Saenz Julienne (15):
  dt-bindings: soc: bcm: bcm2835-pm: Convert bindings to DT schema
  dt-bindings: soc: bcm: bcm2835-pm: Introduce reg-names
  dt-bindings: soc: bcm: bcm2835-pm: Add support for bcm2711
  ARM: dts: bcm2835/bcm2711: Introduce reg-names in watchdog node
  ARM: dts: bcm2711: Use proper compatible in PM/Watchdog node
  mfd: bcm2835-pm: Use 'reg-names' to get resources
  mfd: bcm2835-pm: Add support for BCM2711
  soc: bcm: bcm2835-power: Add support for BCM2711's RPiVid ASB
  soc: bcm: bcm2835-power: Bypass power_on/off() calls
  dt-bindings: gpu: v3d: Add BCM2711's compatible
  drm/v3d: Get rid of pm code
  drm/v3d: Add support for bcm2711
  ARM: dts: bcm2711: Enable V3D
  ARM: configs: Enable DRM_V3D
  arm64: config: Enable DRM_V3D

 .../devicetree/bindings/gpu/brcm,bcm-v3d.yaml |  1 +
 .../bindings/soc/bcm/brcm,bcm2835-pm.txt      | 46 ----------
 .../bindings/soc/bcm/brcm,bcm2835-pm.yaml     | 87 +++++++++++++++++++
 arch/arm/boot/dts/bcm2711.dtsi                | 15 +++-
 arch/arm/boot/dts/bcm2835-common.dtsi         |  1 +
 arch/arm/configs/multi_v7_defconfig           |  1 +
 arch/arm64/configs/defconfig                  |  1 +
 drivers/gpu/drm/v3d/Kconfig                   |  2 +-
 drivers/gpu/drm/v3d/v3d_debugfs.c             | 18 +---
 drivers/gpu/drm/v3d/v3d_drv.c                 | 12 +--
 drivers/gpu/drm/v3d/v3d_gem.c                 |  9 --
 drivers/mfd/bcm2835-pm.c                      | 80 ++++++++++++-----
 drivers/soc/bcm/bcm2835-power.c               | 74 ++++++++++------
 include/linux/mfd/bcm2835-pm.h                |  1 +
 14 files changed, 217 insertions(+), 131 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-pm.txt
 create mode 100644 Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-pm.yaml

-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
