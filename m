Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C32294D2F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 15:07:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BC5C8800A;
	Wed, 21 Oct 2020 13:07:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 819178800A
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 13:07:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 37BFBADEE;
 Wed, 21 Oct 2020 13:07:34 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: hdegoede@redhat.com, airlied@linux.ie, daniel@ffwll.ch, sean@poorly.run,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH 0/3] drm: Store USB device in struct drm_device
Date: Wed, 21 Oct 2020 15:07:29 +0200
Message-Id: <20201021130732.4048-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
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

The drivers gm12u320 and udl operate on USB devices. They leave the
PCI device in struct drm_device empty and store the USB device in their
own driver structure.

Fix this special case and save a few bytes by putting the USB device
into an anonymous union with the PCI data. It's expected that DRM
core and helpers only touch the PCI-device field for actual PCI devices.

Thomas Zimmermann (3):
  drm: Add reference to USB device to struct drm_device
  drm/tiny/gm12u320: Store USB device in struct drm_device.udev
  drm/udl: Store USB device in struct drm_device.udev

 drivers/gpu/drm/tiny/gm12u320.c     | 52 +++++++++++++----------------
 drivers/gpu/drm/udl/udl_connector.c |  8 ++---
 drivers/gpu/drm/udl/udl_drv.c       |  2 +-
 drivers/gpu/drm/udl/udl_drv.h       |  1 -
 drivers/gpu/drm/udl/udl_main.c      | 15 +++++----
 include/drm/drm_device.h            | 21 ++++++++----
 6 files changed, 52 insertions(+), 47 deletions(-)

--
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
