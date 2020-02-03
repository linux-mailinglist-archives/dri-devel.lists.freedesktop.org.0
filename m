Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BC4150A4A
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 16:53:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 956676EC6A;
	Mon,  3 Feb 2020 15:53:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B176EC6A
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2020 15:53:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A9A2EADCC;
 Mon,  3 Feb 2020 15:53:03 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 z.liuxinliang@hisilicon.com, zourongrong@gmail.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 hdegoede@redhat.com, sam@ravnborg.org
Subject: [PATCH v2 0/4] drm/vram: Check display modes against available VRAM
Date: Mon,  3 Feb 2020 16:52:54 +0100
Message-Id: <20200203155258.9346-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds drm_vram_helper_mode_valid(), which tests a display mode against
the available video memory. It's a helper function to sort out display
modes that cannot be used because of a lack of video memory.

The ast driver already implemented this test for a while. The patchset
converts ast over to the helper and adds the test to the over drivers
that use VRAM helpers; except mgag200. I left out mgag200 as it doesn't
have atomic modesetting yet and needs adjustments to memory management
first.

v2:
	* WARN_ON if VRAM memory manager has not been initialized (Daniel)
	* unexport drm_vram_helper_mode_valid_internal() (Daniel)
	* documentation formatting (Daniel)
	* remove bochs_connector_mode_valid() (Gerd)

Thomas Zimmermann (4):
  drm/vram: Add helpers to validate a display mode's memory requirements
  drm/bochs: Implement struct drm_mode_config_funcs.mode_valid
  drm/hibmc: Implement struct drm_mode_config_funcs.mode_valid
  drm/vboxvideo: Implement struct drm_mode_config_funcs.mode_valid

 drivers/gpu/drm/ast/ast_main.c              | 24 +-------
 drivers/gpu/drm/bochs/bochs_kms.c           | 21 +------
 drivers/gpu/drm/drm_gem_vram_helper.c       | 61 +++++++++++++++++++++
 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c |  1 +
 drivers/gpu/drm/vboxvideo/vbox_mode.c       |  1 +
 include/drm/drm_gem_vram_helper.h           |  9 +++
 6 files changed, 74 insertions(+), 43 deletions(-)

--
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
