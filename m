Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF32F2A4276
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 11:37:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 622E56E86D;
	Tue,  3 Nov 2020 10:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5EAF06E0A2
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 10:37:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ABF76ACC6;
 Tue,  3 Nov 2020 10:36:59 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: hdegoede@redhat.com, airlied@linux.ie, daniel@ffwll.ch, sean@poorly.run,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH v2 0/3] drm: Store USB device in struct drm_device
Date: Tue,  3 Nov 2020 11:36:53 +0100
Message-Id: <20201103103656.17768-1-tzimmermann@suse.de>
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

v2:
	* upcast USB device from struct drm_device.dev (Daniel)

Thomas Zimmermann (3):
  drm: Add USB helpers
  drm/tiny/gm12u320: Retrieve USB device from struct drm_device.dev
  drm/udl: Retrieve USB device from struct drm_device.dev

 Documentation/gpu/drm-internals.rst |  5 +++
 drivers/gpu/drm/tiny/gm12u320.c     | 52 +++++++++++++----------------
 drivers/gpu/drm/udl/udl_connector.c |  9 ++---
 drivers/gpu/drm/udl/udl_drv.c       |  3 --
 drivers/gpu/drm/udl/udl_drv.h       |  1 -
 drivers/gpu/drm/udl/udl_main.c      | 25 ++++++++------
 include/drm/drm_usb_helper.h        | 25 ++++++++++++++
 7 files changed, 73 insertions(+), 47 deletions(-)
 create mode 100644 include/drm/drm_usb_helper.h

--
2.29.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
