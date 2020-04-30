Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A851F1C0651
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 21:28:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B06C6E47E;
	Thu, 30 Apr 2020 19:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 262AC6E24E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 19:28:02 +0000 (UTC)
X-Originating-IP: 93.29.109.196
Received: from localhost.localdomain (196.109.29.93.rev.sfr.net
 [93.29.109.196])
 (Authenticated sender: paul.kocialkowski@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 779901C0007;
 Thu, 30 Apr 2020 19:27:59 +0000 (UTC)
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/3] drm: LogiCVC display controller support
Date: Thu, 30 Apr 2020 21:27:43 +0200
Message-Id: <20200430192746.1866325-1-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.26.0
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
Cc: David Airlie <airlied@linux.ie>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series introduces support for the LogiCVC display controller.
The controller is a bit unusual since it is usually loaded as
programmable logic on Xilinx FPGAs or Zynq-7000 SoCs.
More details are presented on the main commit for the driver.

More information about the controller is available on the dedicated
web page: https://www.logicbricks.com/Products/logiCVC-ML.aspx

Changes since v5:
- Subclass DRM device and use devm_drm_dev_alloc for allocation;
- Removed call to drm_mode_config_cleanup (done automatically with devm);
- Some related code cleanups;
- Bring back not-for-merge patch adding colorkey support.

Changes since v4:
- Updated to internal DRM API changes (rebased on drm-misc-next);
- Added Kconfig dependency on OF;
- Added MAINTAINERS entry;
- Used drm_err and dev_err instead of DRM_ERROR where possible;
- Various cosmetic changes.

Changes since v3:
- Rebased on latest drm-misc;
- Improved event lock wrapping;
- Added collect tag;
- Added color-key support patch (not for merge, for reference only).

Changes since v2:
- Fixed and slightly improved dt schema.

Changes since v1:
- Switched dt bindings documentation to dt schema;
- Described more possible dt parameters;
- Added support for the lvds-3bit interface;
- Added support for grabbing syscon regmap from parent node;
- Removed layers count property and count layers child nodes instead.

Cheers!

Paul Kocialkowski (3):
  dt-bindings: display: Document the Xylon LogiCVC display controller
  drm: Add support for the LogiCVC display controller
  NOTFORMERGE: drm/logicvc: Add plane colorkey support

 .../display/xylon,logicvc-display.yaml        | 313 ++++++++
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/Kconfig                       |   2 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/logicvc/Kconfig               |   9 +
 drivers/gpu/drm/logicvc/Makefile              |   4 +
 drivers/gpu/drm/logicvc/logicvc_crtc.c        | 270 +++++++
 drivers/gpu/drm/logicvc/logicvc_crtc.h        |  21 +
 drivers/gpu/drm/logicvc/logicvc_drm.c         | 470 +++++++++++
 drivers/gpu/drm/logicvc/logicvc_drm.h         |  67 ++
 drivers/gpu/drm/logicvc/logicvc_interface.c   | 238 ++++++
 drivers/gpu/drm/logicvc/logicvc_interface.h   |  30 +
 drivers/gpu/drm/logicvc/logicvc_layer.c       | 744 ++++++++++++++++++
 drivers/gpu/drm/logicvc/logicvc_layer.h       |  71 ++
 drivers/gpu/drm/logicvc/logicvc_mode.c        | 103 +++
 drivers/gpu/drm/logicvc/logicvc_mode.h        |  15 +
 drivers/gpu/drm/logicvc/logicvc_of.c          | 205 +++++
 drivers/gpu/drm/logicvc/logicvc_of.h          |  28 +
 drivers/gpu/drm/logicvc/logicvc_regs.h        |  88 +++
 19 files changed, 2685 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/xylon,logicvc-display.yaml
 create mode 100644 drivers/gpu/drm/logicvc/Kconfig
 create mode 100644 drivers/gpu/drm/logicvc/Makefile
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_crtc.c
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_crtc.h
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_drm.c
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_drm.h
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_interface.c
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_interface.h
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_layer.c
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_layer.h
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_mode.c
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_mode.h
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_of.c
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_of.h
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_regs.h

-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
