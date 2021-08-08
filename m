Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4913E38C7
	for <lists+dri-devel@lfdr.de>; Sun,  8 Aug 2021 07:11:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B939089CA2;
	Sun,  8 Aug 2021 05:10:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de
 [81.169.146.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28DD89C9C
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Aug 2021 05:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1628399444;
 s=strato-dkim-0002; d=goldelico.com;
 h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
 bh=CIECkD0GrXNC/kX5exe0hD1JNJlextiGGi7cS4Osk+o=;
 b=WGMGd3sIBjidEfF06ORFpouaOFCWhElBT3mSki82PNau+bHHhjG+fr6biK3ITdgRMo
 THb5TYBvtA43UTAqWbH4pDaiCDPWA7IMBjFVXvhV9xGJB9BBzD+LipYcG4rpqi/uwm+9
 IYObL4LtkYJWaEulejgXqeWQxTXMrD7LgWglnwE+Nufp8tFbdtR8bAdD0YC/JAbPze3w
 s2ffbaCj6/eTwjKHoJBmYrcdldwFQj4QfKDP5h0dnxzhf7e2Z83qzFGSjDjoBrbZvOuc
 yer7iQC2mSiVgwR/LVO4sGy2R9tfdqu5WvErJ+RTTDeVWCIhZ00CVMSRkz5DT0LLKikS
 TsHQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lByOdcKVX0"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 47.31.0 DYNA|AUTH)
 with ESMTPSA id Q02727x785AhEyb
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sun, 8 Aug 2021 07:10:43 +0200 (CEST)
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
 Maxime Ripard <maxime@cerno.tech>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
 Paul Boddie <paul@boddie.org.uk>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/9] MIPS: JZ4780 and CI20 HDMI
Date: Sun,  8 Aug 2021 07:10:34 +0200
Message-Id: <cover.1628399442.git.hns@goldelico.com>
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


H. Nikolaus Schaller (1):
  MIPS: CI20: defconfig: configure for DRM_DW_HDMI_JZ4780

Paul Boddie (7):
  drm/ingenic: fix drm_init error path if IPU was registered
  drm/bridge: synopsis: Add mode_fixup and bridge timings support
  drm/ingenic: Add jz4780 Synopsys HDMI driver
  drm/ingenic: Add support for JZ4780 and HDMI output
  MIPS: DTS: jz4780: account for Synopsys HDMI driver and LCD
    controllers
  MIPS: DTS: CI20: add HDMI setup
  drm/ingenic: add some jz4780 specific features

Sam Ravnborg (1):
  dt-bindings: display: Add ingenic-jz4780-hdmi DT Schema

 .../bindings/display/ingenic-jz4780-hdmi.yaml |  82 +++++++++
 arch/mips/boot/dts/ingenic/ci20.dts           |  64 +++++++
 arch/mips/boot/dts/ingenic/jz4780.dtsi        |  45 +++++
 arch/mips/configs/ci20_defconfig              |   7 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |   7 +
 drivers/gpu/drm/ingenic/Kconfig               |   9 +
 drivers/gpu/drm/ingenic/Makefile              |   1 +
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     | 169 ++++++++++++++++--
 drivers/gpu/drm/ingenic/ingenic-drm.h         |  42 +++++
 drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c     | 121 +++++++++++++
 include/drm/bridge/dw_hdmi.h                  |   5 +
 11 files changed, 538 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
 create mode 100644 drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c

-- 
2.31.1

