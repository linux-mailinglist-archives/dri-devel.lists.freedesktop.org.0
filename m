Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B57ED370B2A
	for <lists+dri-devel@lfdr.de>; Sun,  2 May 2021 12:50:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE326E7DD;
	Sun,  2 May 2021 10:49:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAD716E05F
 for <dri-devel@lists.freedesktop.org>; Sun,  2 May 2021 10:49:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F2AB7B05E;
 Sun,  2 May 2021 10:49:55 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH 0/7] drm: Completely remove struct drm_device.pdev
Date: Sun,  2 May 2021 12:49:46 +0200
Message-Id: <20210502104953.21768-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
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

The pdev field in struct drm_device was recently moved into the legacy
section. Remove it entirely. References are replaced with upcasts from
the structure's dev field. This change only affects legacy drivers for
userspace modesetting.

Thomas Zimmermann (7):
  drm/i810: Remove references to struct drm_device.pdev
  drm/mga: Remove references to struct drm_device.pdev
  drm/r128: Remove references to struct drm_device.pdev
  drm/savage: Remove references to struct drm_device.pdev
  drm/sis: Remove references to struct drm_device.pdev
  drm/via: Remove references to drm_device.pdev
  drm: Remove pdev field from struct drm_device

 drivers/gpu/drm/drm_pci.c           |  1 -
 drivers/gpu/drm/i810/i810_dma.c     |  8 +++++---
 drivers/gpu/drm/mga/mga_dma.c       | 13 +++++++------
 drivers/gpu/drm/mga/mga_state.c     |  3 ++-
 drivers/gpu/drm/r128/ati_pcigart.c  | 11 ++++++-----
 drivers/gpu/drm/r128/r128_drv.c     |  4 +++-
 drivers/gpu/drm/r128/r128_state.c   |  3 ++-
 drivers/gpu/drm/savage/savage_bci.c | 26 ++++++++++++++------------
 drivers/gpu/drm/sis/sis_drv.c       |  3 ++-
 drivers/gpu/drm/via/via_dmablit.c   | 15 +++++++++------
 drivers/gpu/drm/via/via_map.c       |  3 ++-
 include/drm/drm_device.h            |  3 ---
 12 files changed, 52 insertions(+), 41 deletions(-)

--
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
