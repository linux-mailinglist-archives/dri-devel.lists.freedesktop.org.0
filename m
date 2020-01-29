Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F7314CA27
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 13:05:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 992706F519;
	Wed, 29 Jan 2020 12:05:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 032346E328
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 12:05:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B145AAFAC;
 Wed, 29 Jan 2020 12:05:34 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Subject: [PATCH v5 00/15] Use no_vblank property for drivers without VBLANK
Date: Wed, 29 Jan 2020 13:05:16 +0100
Message-Id: <20200129120531.6891-1-tzimmermann@suse.de>
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
Cc: xen-devel@lists.xenproject.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of faking VBLANK events by themselves, drivers without VBLANK
support can enable drm_crtc_vblank.no_vblank and let DRM do the rest.
The patchset makes this official and converts over drivers.

The current implementation looks at state of a device wrt vblanking. If
vblanking has been initialized for the device, the driver is responsible
for sending out VBLANK events. Otherwise, DRM will send out the event.
The behaviour is selected by initializing no_vblank as part of
drm_atomic_helper_check_modeset().

I went through all drivers, looking for those that call send out VBLANK
events but do not call drm_vblank_init(). These are converted to the new
semantics. This affects tiny drivers; drivers for virtual hardware; and
a few others, which do not support interrupts. Xen comes with its
own VBLANK logic and now disables no_vblank explicitly.

v5:
	* documentation updates in DRM core and xen (Daniel, Emil, Oleksandr)
v4:
	* replaced drm_crtc_has_vblank() with drm_dev_has_vblank() (Daniel)
	* squashed patches 1 and 2
	* moved driver updates into separate patches
v3:
	* reorder and squash patches
	* set no_vblank in drm_atomic_helper_check_modeset() for *all*
	  drivers (Daniel)
	* convert all drivers to new semnatics as necessary
v2:
	* document functionality (Daniel)
	* cleanup ast (Daniel)
	* let simple-kms handle no_vblank where possible

Thomas Zimmermann (15):
  drm: Initialize struct drm_crtc_state.no_vblank from device settings
  drm/arc: Remove sending of vblank event
  drm/ast: Don't set struct drm_crtc_state.no_vblank explictly
  drm/bochs: Remove sending of vblank event
  drm/cirrus: Remove sending of vblank event
  drm/gm12u320: Remove sending of vblank event
  drm/ili9225: Remove sending of vblank event
  drm/mipi-dbi: Remove sending of vblank event
  drm/qxl: Remove sending of vblank event
  drm/repaper: Remove sending of vblank event
  drm/st7586: Remove sending of vblank event
  drm/udl: Don't set struct drm_crtc_state.no_vblank explictly
  drm/vboxvideo: Remove sending of vblank event
  drm/virtio: Remove sending of vblank event
  drm/xen: Explicitly disable automatic sending of vblank event

 drivers/gpu/drm/arc/arcpgu_crtc.c        | 16 -----------
 drivers/gpu/drm/ast/ast_mode.c           |  2 --
 drivers/gpu/drm/bochs/bochs_kms.c        |  9 -------
 drivers/gpu/drm/cirrus/cirrus.c          |  8 ------
 drivers/gpu/drm/drm_atomic_helper.c      | 10 ++++++-
 drivers/gpu/drm/drm_mipi_dbi.c           |  9 -------
 drivers/gpu/drm/drm_vblank.c             | 28 +++++++++++++++++++
 drivers/gpu/drm/qxl/qxl_display.c        | 14 ----------
 drivers/gpu/drm/tiny/gm12u320.c          |  9 -------
 drivers/gpu/drm/tiny/ili9225.c           |  9 -------
 drivers/gpu/drm/tiny/repaper.c           |  9 -------
 drivers/gpu/drm/tiny/st7586.c            |  9 -------
 drivers/gpu/drm/udl/udl_modeset.c        | 11 --------
 drivers/gpu/drm/vboxvideo/vbox_mode.c    | 12 ---------
 drivers/gpu/drm/virtio/virtgpu_display.c |  8 ------
 drivers/gpu/drm/xen/xen_drm_front_kms.c  | 19 +++++++++++++
 include/drm/drm_crtc.h                   | 34 +++++++++++++++++++-----
 include/drm/drm_simple_kms_helper.h      |  7 +++--
 include/drm/drm_vblank.h                 |  1 +
 19 files changed, 89 insertions(+), 135 deletions(-)

--
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
