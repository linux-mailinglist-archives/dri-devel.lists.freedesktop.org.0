Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 583D83607DD
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 13:00:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26CA26E0A0;
	Thu, 15 Apr 2021 11:00:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFBF06E07F
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 11:00:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 40B24AE42;
 Thu, 15 Apr 2021 11:00:43 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, marex@denx.de, stefan@agner.ch, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, linux-graphics-maintainer@vmware.com,
 sroland@vmware.com, zackr@vmware.com
Subject: [PATCH 0/4] drm: Fix config dependencies for fbdev emulation
Date: Thu, 15 Apr 2021 13:00:36 +0200
Message-Id: <20210415110040.23525-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While working on the recent aperture helpers, I found it hard to
disable fbdev because drivers keep on selecting it automatically.

Cleanup the config dependencies. Fbdev support should be configured
by users. DRM drivers should check for DRM_FBDEV_EMULATION to enable
fbdev support.

Thomas Zimmermann (4):
  drm/vmwgfx: Make console emulation depend on DRM_FBDEV_EMULATION
  drm/mxsfb: Don't select DRM_KMS_FB_HELPER
  drm/zte: Don't select DRM_KMS_FB_HELPER
  drm: Remove DRM_KMS_FB_HELPER Kconfig option

 drivers/gpu/drm/Kconfig             | 28 +++++++++++-----------------
 drivers/gpu/drm/mxsfb/Kconfig       |  1 -
 drivers/gpu/drm/vmwgfx/Kconfig      |  7 +------
 drivers/gpu/drm/vmwgfx/Makefile     |  4 +++-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h | 19 +++++++++++++++++++
 drivers/gpu/drm/zte/Kconfig         |  1 -
 6 files changed, 34 insertions(+), 26 deletions(-)

--
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
