Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD69C419989
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 18:45:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E5F89F3C;
	Mon, 27 Sep 2021 16:44:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690F6898AF
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 16:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632761070;
 s=strato-dkim-0002; d=goldelico.com;
 h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
 bh=jRPgRBm1X+FuZv7hOzaWpG6lEhu0WS+NKYO9s9BLpfc=;
 b=AG1GEOc6tKVfQEL1PmD3dkQnT6JWvNaRPm+CFRQvE1hmb86TRDfFstrkkRbgxkKfoE
 2a3Y1vRvqkm4DmVOeSxVK69IrrQ0siyq+PAhrks0oNqq79F7wBT9rMEPrHEKGJHGjMvt
 asgTJZ+P6pDyXwhIg4CvqsfIzu2Gjumdj+QcH+gVhw5yJtNaoPBvZ950F9Tua7oSUIh9
 2cKO/+JB84mIslyRBv/WFMd9UHzcUUy9GuZIw4Yirh/iPkabFwwtRIGMNn1fY1zvudAz
 op3OwSyRJaMijbIRvzqqPDOhpDUy6kknO5WCAKeLMsyaoGkAl+MMgyiAqlvfMtSvEk3V
 lA/Q==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1KHeBQyh+ITDDFrDb4="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
 with ESMTPSA id I01f74x8RGiTav8
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 27 Sep 2021 18:44:29 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kees Cook <keescook@chromium.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Paul Boddie <paul@boddie.org.uk>
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org
Subject: [PATCH v4 00/10] MIPS: JZ4780 and CI20 HDMI
Date: Mon, 27 Sep 2021 18:44:18 +0200
Message-Id: <cover.1632761067.git.hns@goldelico.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

- fix setting output_port = 1 (issue found by paul@crapouillou.net)
- ci20.dts: convert to use hdmi-connector (by hns@goldelico.com)
- add a hdmi-regulator to control +5V power (by hns@goldelico.com)
- added a fix to dw-hdmi to call drm_kms_helper_hotplug_event on plugin event detection (by hns@goldelico.com)
- always allocate extended descriptor but initialize only for jz4780 (by hns@goldelico.com)
- updated to work on top of "[PATCH v3 0/6] drm/ingenic: Various improvements v3" (by paul@crapouillou.net)
- rebased to v5.13-rc3

PATCH V3 2021-08-08 07:10:50:
This series adds HDMI support for JZ4780 and CI20 board (and fixes one IPU related issue in registration error path)
- [patch 1/8] switched from mode_fixup to atomic_check (suggested by robert.foss@linaro.org)
  - the call to the dw-hdmi specialization is still called mode_fixup
- [patch 3/8] diverse fixes for ingenic-drm-drv (suggested by paul@crapouillou.net)
  - factor out some non-HDMI features of the jz4780 into a separate patch
  - multiple fixes around max height
  - do not change regmap config but a copy on stack
  - define some constants
  - factor out fixing of drm_init error path for IPU into separate patch
  - use FIELD_PREP()
- [patch 8/8] conversion to component framework dropped (suggested by Laurent.pinchart@ideasonboard.com and paul@crapouillou.net)

PATCH V2 2021-08-05 16:08:05:
This series adds HDMI support for JZ4780 and CI20 board

V2:
- code and commit messages revisited for checkpatch warnings
- rebased on v5.14-rc4
- include (failed, hence RFC 8/8) attempt to convert to component framework
  (was suggested by Paul Cercueil <paul@crapouillou.net> a while ago)


H. Nikolaus Schaller (2):
  drm/bridge: synopsis: Fix to properly handle HPD
  MIPS: defconfig: CI20: configure for DRM_DW_HDMI_JZ4780

Paul Boddie (7):
  drm/ingenic: Fix drm_init error path if IPU was registered
  drm/ingenic: Add support for JZ4780 and HDMI output
  drm/bridge: synopsis: Add mode_fixup and bridge timings support
  drm/ingenic: Add dw-hdmi driver for jz4780
  MIPS: DTS: jz4780: Account for Synopsys HDMI driver and LCD
    controllers
  MIPS: DTS: CI20: Add DT nodes for HDMI setup
  drm/ingenic: add some jz4780 specific features

Sam Ravnborg (1):
  dt-bindings: display: Add ingenic,jz4780-dw-hdmi DT Schema

 .../bindings/display/ingenic-jz4780-hdmi.yaml |  85 +++++++++++
 arch/mips/boot/dts/ingenic/ci20.dts           |  67 +++++++++
 arch/mips/boot/dts/ingenic/jz4780.dtsi        |  45 ++++++
 arch/mips/configs/ci20_defconfig              |   6 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |   9 ++
 drivers/gpu/drm/ingenic/Kconfig               |   9 ++
 drivers/gpu/drm/ingenic/Makefile              |   1 +
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     | 135 ++++++++++++++++-
 drivers/gpu/drm/ingenic/ingenic-drm.h         |  42 ++++++
 drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c     | 142 ++++++++++++++++++
 include/drm/bridge/dw_hdmi.h                  |   5 +
 11 files changed, 540 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
 create mode 100644 drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c

-- 
2.31.1

