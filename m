Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E521C523B
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 11:57:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB5506E15C;
	Tue,  5 May 2020 09:56:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2183A6E14E
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 09:56:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D9CDFAC7D;
 Tue,  5 May 2020 09:56:54 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com, sam@ravnborg.org,
 emil.velikov@collabora.com, cogarre@gmail.com
Subject: [PATCH 0/5] drm/mgag200: Embed DRM device in struct mga_device
Date: Tue,  5 May 2020 11:56:44 +0200
Message-Id: <20200505095649.25814-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After receiving reviews on the conversion of mgag200 to atomic mode
setting, I thought it would make sense to embed the DRM device in
struct mga_device first. Several comments in the atomic-conversion
reviews refer to that.

Patches 1 to 3 do some cleanups and preparation work. Patch 4 changes
the the init functions to allocate struct mga_device before struct
drm_device. Patch 5 does the conversion.

I did not switch over struct mga_device to the new managed release
code. I found that this justifies another round of cleanup patches,
which I did not want to put into this patchset.

The patches were tested on mgag200 hardware.

Thomas Zimmermann (5):
  drm/mgag200: Convert struct drm_device to struct mga_device with macro
  drm/mgag200: Integrate init function into load function
  drm/mgag200: Remove several references to struct mga_device.dev
  drm/mgag200: Init and finalize devices in mgag200_device_{init,fini}()
  drm/mgag200: Embed DRM device instance in struct mga_device

 drivers/gpu/drm/mgag200/mgag200_cursor.c |  10 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c    |  29 +++---
 drivers/gpu/drm/mgag200/mgag200_drv.h    |   8 +-
 drivers/gpu/drm/mgag200/mgag200_i2c.c    |  10 +-
 drivers/gpu/drm/mgag200/mgag200_main.c   | 114 +++++++++++------------
 drivers/gpu/drm/mgag200/mgag200_mode.c   |  35 +++----
 drivers/gpu/drm/mgag200/mgag200_ttm.c    |   4 +-
 7 files changed, 101 insertions(+), 109 deletions(-)

--
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
