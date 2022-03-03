Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C84944CC720
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 21:39:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10BB310EB5D;
	Thu,  3 Mar 2022 20:39:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 753 seconds by postgrey-1.36 at gabe;
 Thu, 03 Mar 2022 20:39:09 UTC
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9928610E32A
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 20:39:09 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 757E224000A;
 Thu,  3 Mar 2022 20:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1646339947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=QJsqTF9rz0lgtm7akJbC4rKub2xGisCi3uye4FpApS8=;
 b=aVZk0oW3JVqZkfqceZVkKflE4Q7HUVD1v5w2Ucqexc7Ogi4Tama4z4uRoX6a1UT9zAEprG
 LMtRNperar/TEEOdNyAVydPAAOi8yATnD7BPAmum5Vfh2Kyk5AzZkvbo5Od7eHwAHYoVH/
 lXAfWy1M8AOktZxRDzUWw3KXhANq2BC0Br4GXTZ0gdLgtRoL8oKrjf2Tn4+KL57hYTocYn
 W6bGJzkr4Az+4Bo1Mb+IbE2rHZVkM1kt+cYaiLr8xPsLVCRu6i6uz9JKvN8PgLpqElGxi9
 htSsKRS3vErdnuhuskK9UmWR1AuRXKU+JSdF3oodgJaGBUUohunYzlQ+g41alw==
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v11 0/2] drm: LogiCVC display controller support
Date: Thu,  3 Mar 2022 21:38:56 +0100
Message-Id: <20220303203858.314955-1-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series introduces support for the LogiCVC display controller.
The controller is a bit unusual since it is usually loaded as
programmable logic on Xilinx FPGAs or Zynq-7000 SoCs.
More details are presented on the main commit for the driver.

More information about the controller is available on the dedicated
web page: https://www.logicbricks.com/Products/logiCVC-ML.aspx

Note that this driver has rather simple connector management, which was
not converted to drm_panel_bridge to keep the ability to enable the panel
at first vblank but also to support DVI.

Changes since v10:
- Removed common compatibles for major logicvc versions;
- Switched caps detection to use the version registers instead of
  the compatible;
- Added support for major version 5 of the unit;
- Used FIELD_GET from bitfield.h and removed local equivalents;
- Updated copyright year;

Changes since v9:
- Added common compatibles for major logicvc versions;
- Add support for logicvc-5;
- Rebased on latest drm-misc next.

Changes since v8:
- Rebased on top of the latest drm-misc-next;
- Dropped useless phandle-based syscon regmap support;
- Switched to a single-port graph description;
- Updated the device-tree schema to the port schema and added a
  description for the port.

Change since v7:
- Replaced DRM_INFO/DRM_ERROR/DRM_DEBUG_DRIVER with fashions using drm_device;
- Fixed yaml binding alignment issue;
- Renamed logicvc-display name to the generic "display" name;
- Added patternProperties match for display in the parent mfd binding;
- Used drm_atomic_get_new_crtc_state when needed;
- Checked mode in mode_valid instead of atomic_check;
- Switched to drmm_mode_config_init;
- Removed useless logicvc_connector_destroy wrapper;
- Removed useless drm_dev_put calls;
- Removed atomic_commit_tail that enables the panel and streamlined the logic;
- Reworked Makefile cosmetics;
- Fixed checkpatch issues.

Changes since v6:
- Updated to the latest DRM internal API changes; 
- Used an enum to index dt properties instead of the name string.

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

Paul Kocialkowski (2):
  drm: Add support for the LogiCVC display controller
  NOTFORMERGE: drm/logicvc: Add plane colorkey support

 MAINTAINERS                                 |   6 +
 drivers/gpu/drm/Kconfig                     |   2 +
 drivers/gpu/drm/Makefile                    |   1 +
 drivers/gpu/drm/logicvc/Kconfig             |   9 +
 drivers/gpu/drm/logicvc/Makefile            |   9 +
 drivers/gpu/drm/logicvc/logicvc_crtc.c      | 280 +++++++
 drivers/gpu/drm/logicvc/logicvc_crtc.h      |  21 +
 drivers/gpu/drm/logicvc/logicvc_drm.c       | 497 +++++++++++++
 drivers/gpu/drm/logicvc/logicvc_drm.h       |  70 ++
 drivers/gpu/drm/logicvc/logicvc_interface.c | 214 ++++++
 drivers/gpu/drm/logicvc/logicvc_interface.h |  28 +
 drivers/gpu/drm/logicvc/logicvc_layer.c     | 767 ++++++++++++++++++++
 drivers/gpu/drm/logicvc/logicvc_layer.h     |  71 ++
 drivers/gpu/drm/logicvc/logicvc_mode.c      |  80 ++
 drivers/gpu/drm/logicvc/logicvc_mode.h      |  15 +
 drivers/gpu/drm/logicvc/logicvc_of.c        | 185 +++++
 drivers/gpu/drm/logicvc/logicvc_of.h        |  46 ++
 drivers/gpu/drm/logicvc/logicvc_regs.h      |  80 ++
 18 files changed, 2381 insertions(+)
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
2.35.1

