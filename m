Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F77F8B0127
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 07:41:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 465161137DD;
	Wed, 24 Apr 2024 05:41:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="pdY1H2gC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Wed, 24 Apr 2024 05:41:25 UTC
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A0081137DD
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 05:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1713937285; x=1745473285;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mitb+D/nVSsGthWI422LmnlrCmG2yJ527JL4f7Ea30k=;
 b=pdY1H2gC4NjOL0isC6CYcNXiiFaJGIUPD6i34JuC/yPrFcYB0109ZPRh
 aBQYBwtyv3NThnDVDWUQ9LfQwmAD/tnGUzpDsK5ZtqohiGPZ82x8avYvL
 +6ugyHPAovWohr/48wDchodNxu/g7+0GBM4gnSd+/kSQSppBLecF5nzuN
 r9BwAaGnyvya2rLK1nonsOdyzVBuJM8bLtD4fE3S/Sa5YPUEZLy+EhuVX
 jY70kZa3t6SfdOQNdic6wGVx9k6ZqGy52hznGHzaMRhmbdIP9fABddWj6
 eY0bYxlPiid82Lkh8OFCgJFfkk4VXjgqSN88afSr3DLjFlcjzUQSZUC+i Q==;
X-CSE-ConnectionGUID: Er+woXTdRGuoFCdDEDLh7g==
X-CSE-MsgGUID: YvvVZm/ST2Og96PTIZWFyQ==
X-IronPort-AV: E=Sophos;i="6.07,225,1708412400"; d="scan'208";a="22410826"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Apr 2024 22:34:18 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 22:34:18 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 22:34:09 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <sam@ravnborg.org>, <bbrezillon@kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <lee@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <Hari.PrasathGE@microchip.com>, <Balamanikandan.Gunasundar@microchip.com>, 
 <Durai.ManickamKR@microchip.com>, <Nayabbasha.Sayed@microchip.com>,
 <Dharma.B@microchip.com>, <Varshini.Rajendran@microchip.com>,
 <Balakrishnan.S@microchip.com>, <Charan.Pedumuru@microchip.com>, "Manikandan
 Muralidharan" <manikandan.m@microchip.com>
Subject: [PATCH RESEND v9 0/8]  Add support for XLCDC to sam9x7 SoC family.
Date: Wed, 24 Apr 2024 11:03:43 +0530
Message-ID: <20240424053351.589830-1-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

This patch series aims to add support for XLCDC IP of sam9x7 SoC family
to the DRM subsystem.XLCDC IP has additional registers and new
configuration bits compared to the existing register set of HLCDC IP.
The new compatible string "microchip,sam9x75-xlcdc" is defined for sam9x75
variant of the sam9x7 SoC family.The is_xlcdc flag under driver data and
IP specific driver ops helps to differentiate the XLCDC and existing HLCDC
code within the same driver.

changes in v9:
* Fix struct comments as per kernel-doc format
* Rename LCDC ops
* Move regmap_read_poll_timeout change to separate commit
* cosmetic fixes

changes in v8:
* Re-arrange the patch set to prepare and update the current HLCDC
code base with the new LCDC IP based driver ops and then add support
for XLCDC code changes.
* Fix Cosmetic issues.

changes in v7:
* LCDC IP driver ops functions are declared static and its
declaration are removed.

changes in v6:
* Fixed Cosmetic defects.
* Added comments for readability.

changes in v5:
* return value of regmap_read_poll_timeout is checked in failure
case.
* HLCDC and XLCDC specific driver functions are now invoked
using its IP specific driver ops w/o the need of checking is_xlcdc flag.
* Removed empty spaces and blank lines.

changes in v4:
* fixed kernel warnings reported by kernel test robot.

changes in v3:
* Removed de-referencing the value of is_xlcdc flag multiple times in
a single function.
* Removed cpu_relax() call when using regmap_read_poll_timeout.
* Updated xfactor and yfactor equations using shift operators
* Defined CSC co-efficients in an array for code readability.

changes in v2:
* Change the driver compatible name from "microchip,sam9x7-xlcdc" to
"microchip,sam9x75-xlcdc".
* Move is_xlcdc flag to driver data.
* Remove unsed Macro definitions.
* Add co-developed-bys tags
* Replace regmap_read() with regmap_read_poll_timeout() call
* Split code into two helpers for code readablitity.

------------
Durai Manickam KR (1):
  drm: atmel-hlcdc: Define XLCDC specific registers

Manikandan Muralidharan (7):
  drm: atmel-hlcdc: add driver ops to differentiate HLCDC and XLCDC IP
  drm: atmel_hlcdc: replace regmap_read with regmap_read_poll_timeout
  drm: atmel_hlcdc: Add support for XLCDC using IP specific driver ops
  drm: atmel-hlcdc: add DPI mode support for XLCDC
  drm: atmel-hlcdc: add vertical and horizontal scaling support for
    XLCDC
  drm: atmel-hlcdc: add support for DSI output formats
  drm: atmel-hlcdc: add LCD controller layer definition for sam9x75

 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 172 ++++++--
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  | 105 +++++
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h  | 132 +++++--
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   | 369 +++++++++++++++---
 include/linux/mfd/atmel-hlcdc.h               |  10 +
 5 files changed, 673 insertions(+), 115 deletions(-)

-- 
2.25.1

