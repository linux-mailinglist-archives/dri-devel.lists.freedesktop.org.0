Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CE5BA8EAB
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 12:48:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C4410E3F9;
	Mon, 29 Sep 2025 10:48:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034D610E3F9
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 10:48:40 +0000 (UTC)
Received: from jtjnmail201611.home.langchao.com
 by ssh248.corpemail.net ((D)) with ASMTP (SSL) id 202509291848307657;
 Mon, 29 Sep 2025 18:48:30 +0800
Received: from localhost.localdomain.com (10.94.6.25) by
 jtjnmail201611.home.langchao.com (10.100.2.11) with Microsoft SMTP Server id
 15.1.2507.58; Mon, 29 Sep 2025 18:48:33 +0800
From: Chu Guangqing <chuguangqing@inspur.com>
To: <tzimmermann@suse.de>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <dmitry.baryshkov@oss.qualcomm.com>
CC: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, Chu
 Guangqing <chuguangqing@inspur.com>
Subject: [PATCH v8 0/1] [DRIVER] gpu: drm: add support for YHGCH ZX1000 soc
 chipset
Date: Mon, 29 Sep 2025 18:48:30 +0800
Message-ID: <20250929104831.8548-1-chuguangqing@inspur.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250929063103.7375-1-chuguangqing@inspur.com>
References: <20250929063103.7375-1-chuguangqing@inspur.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.94.6.25]
tUid: 20259291848302c5c7ca0ec33c85d0c36bfdc58448c62
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
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

v8:
 - Use YHGCH uniformly and add the company's official website.

v7:
 - Delete the three preceding function definitions
 - delete Delete the redundant code and comments
(https://lore.kernel.org/all/20250929063103.7375-1-chuguangqing@inspur.com/)

v6:
 - simplify to return drm_atomic_helper_check_plane_state()
 - remove empty line
 - remove call drm_probe_ddc and smidebug
 - replace drm_err with drm_dbg_kms
 - add callback .disable
 (https://lore.kernel.org/all/20250928054123.32895-1-chuguangqing@inspur.com/)

v5:
  - remove extra level of subdiretories, change to driver/gpu/drm/yhgch
  - remove else from > +        else if (!new_plane_state->visible)
  - remove extra check in function yhgch_plane_atomic_check
  - remove the extra parentheses
  - change the author like other modules
  - use drm_edit_read function instead drm_get_edit
  - remove debug info drm_warn call
  - rename function name smi_connector_helper_detect_from_ddc to
     yhgch_connector_helper_detect_from_ddc, remove extra return statement.
  (https://lore.kernel.org/all/20250925091715.12739-1-chuguangqing@inspur.com/)

v4:
  - remove  VRAM helpers from Kconfig
  - use the coding style in ast/mgag200 for the DDC
  - use plane_state->dst instead of crtc_h/w/x/y.
  - delete duplicate framebuffer's atomic_check.
  - use FIELD_PREP() directly.
  - use dev->mode_config.
  - delete unnecessary drm_atomic_helper_shutdown call
  - add AUTHOR
  - using .enable instead
  (https://lore.kernel.org/all/20250924064954.3921-1-chuguangqing@inspur.com/)

v3:
  - The order of the code blocks has been adjusted, and the "warn-on" branch
     has been removed.
  - removed the related formats for the alpha channel.
  - removed the atomic_flush function.
  - have removed the empty line.
  - have removed the error message here.
  - replaced it with the drmm_encoder_init function.
  (https://lore.kernel.org/all/20250910022311.2655-1-chuguangqing@inspur.com/)

v2:
  - Delete unnecessary comments
  - Delete unnecessary branch
  - Use drm_atomic_helper_check_plane_state
  - remove the alpha formats form this list.
  - use w,h rather than x, y
  - delete type casting
  - use a simple call to drm_atomic_helper_shutdown()
  - delete yhgch_load function
  - delete vblanking code
  - delete unneeded i2c type
  (https://lore.kernel.org/all/20250903054533.68540-1-chuguangqing@inspur.com/)

v1:
  (https://lore.kernel.org/all/20250808053508.52202-1-chuguangqing@inspur.com/)

Chu Guangqing (1):
  [DRIVER] gpu: drm: add support for YHGCH ZX1000 soc chipset

 MAINTAINERS                            |   6 +
 drivers/gpu/drm/Kconfig                |   2 +
 drivers/gpu/drm/Makefile               |   1 +
 drivers/gpu/drm/yhgch/Kconfig          |  11 +
 drivers/gpu/drm/yhgch/Makefile         |   4 +
 drivers/gpu/drm/yhgch/yhgch_drm_de.c   | 398 +++++++++++++++++++++++++
 drivers/gpu/drm/yhgch/yhgch_drm_drv.c  | 308 +++++++++++++++++++
 drivers/gpu/drm/yhgch/yhgch_drm_drv.h  |  51 ++++
 drivers/gpu/drm/yhgch/yhgch_drm_i2c.c  | 114 +++++++
 drivers/gpu/drm/yhgch/yhgch_drm_regs.h | 208 +++++++++++++
 drivers/gpu/drm/yhgch/yhgch_drm_vdac.c | 134 +++++++++
 11 files changed, 1237 insertions(+)
 create mode 100644 drivers/gpu/drm/yhgch/Kconfig
 create mode 100644 drivers/gpu/drm/yhgch/Makefile
 create mode 100644 drivers/gpu/drm/yhgch/yhgch_drm_de.c
 create mode 100644 drivers/gpu/drm/yhgch/yhgch_drm_drv.c
 create mode 100644 drivers/gpu/drm/yhgch/yhgch_drm_drv.h
 create mode 100644 drivers/gpu/drm/yhgch/yhgch_drm_i2c.c
 create mode 100644 drivers/gpu/drm/yhgch/yhgch_drm_regs.h
 create mode 100644 drivers/gpu/drm/yhgch/yhgch_drm_vdac.c

-- 
2.43.5

