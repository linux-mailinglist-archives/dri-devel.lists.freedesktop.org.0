Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1562A4458
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 12:35:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E31FE6EB8B;
	Tue,  3 Nov 2020 11:34:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6A9126EB8B
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 11:34:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B8E53AC23;
 Tue,  3 Nov 2020 11:34:57 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: hdegoede@redhat.com, airlied@linux.ie, daniel@ffwll.ch, sean@poorly.run,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH v3 0/2] drm: Store USB device in struct drm_device
Date: Tue,  3 Nov 2020 12:34:54 +0100
Message-Id: <20201103113456.3066-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.0
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

The drivers gm12u320 and udl operate on USB devices. They leave the PCI
device in struct drm_device empty and store the USB device in their own
driver structure. It's expected that DRM core and helpers only touch the
PCI-device field for actual PCI devices.

Fix this special case by upcasting struct drm_device.dev to the USB
device. The drivers' udev variables are being removed.

v3:
	* drop USB helper in favor of driver-internal helpers (Daniel)
v2:
	* upcast USB device from struct drm_device.dev (Daniel)

Thomas Zimmermann (2):
  drm/tiny/gm12u320: Retrieve USB device from struct drm_device.dev
  drm/udl: Retrieve USB device from struct drm_device.dev

 drivers/gpu/drm/tiny/gm12u320.c     | 56 ++++++++++++++---------------
 drivers/gpu/drm/udl/udl_connector.c |  8 ++---
 drivers/gpu/drm/udl/udl_drv.c       |  3 --
 drivers/gpu/drm/udl/udl_drv.h       |  6 +++-
 drivers/gpu/drm/udl/udl_main.c      | 23 ++++++------
 5 files changed, 49 insertions(+), 47 deletions(-)

--
2.29.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
