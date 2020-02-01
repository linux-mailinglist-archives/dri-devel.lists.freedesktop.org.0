Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 441C914F7BD
	for <lists+dri-devel@lfdr.de>; Sat,  1 Feb 2020 13:27:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D266EA68;
	Sat,  1 Feb 2020 12:27:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B889F6EA6E
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Feb 2020 12:27:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7C6F4AE34;
 Sat,  1 Feb 2020 12:27:49 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 z.liuxinliang@hisilicon.com, zourongrong@gmail.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 hdegoede@redhat.com, sam@ravnborg.org
Subject: [PATCH 0/4] drm/vram: Check display modes against available VRAM
Date: Sat,  1 Feb 2020 13:27:40 +0100
Message-Id: <20200201122744.27165-1-tzimmermann@suse.de>
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

Thomas Zimmermann (4):
  drm/vram: Add helpers to validate a display mode's memory requirements
  drm/bochs: Implement struct drm_mode_config_funcs.mode_valid
  drm/hibmc: Implement struct drm_mode_config_funcs.mode_valid
  drm/vboxvideo: Implement struct drm_mode_config_funcs.mode_valid

 drivers/gpu/drm/ast/ast_main.c              | 24 +------
 drivers/gpu/drm/bochs/bochs_kms.c           |  1 +
 drivers/gpu/drm/drm_gem_vram_helper.c       | 76 +++++++++++++++++++++
 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c |  1 +
 drivers/gpu/drm/vboxvideo/vbox_mode.c       |  1 +
 include/drm/drm_gem_vram_helper.h           | 14 ++++
 6 files changed, 94 insertions(+), 23 deletions(-)

--
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
