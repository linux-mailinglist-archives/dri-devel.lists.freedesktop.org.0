Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F2613C1B6
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 13:52:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730386E9BF;
	Wed, 15 Jan 2020 12:52:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A63886E9C2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 12:52:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7BA3BAFE0;
 Wed, 15 Jan 2020 12:52:34 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Subject: [PATCH v2 0/4] Use no_vblank property for drivers without VBLANK
Date: Wed, 15 Jan 2020 13:52:22 +0100
Message-Id: <20200115125226.13843-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
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

(Resending because I did not cc dri-devel properly.)

Instead of faking VBLANK events by themselves, drivers without VBLANK
support can enable drm_crtc_vblank.no_vblank and let DRM do the rest.
The patchset makes this official and converts over several drivers.

Ast already uses the functionality and just needs a cleanup. Cirrus can
be converted easily by setting the field in the check() callback and
removing the existing VBLANK code. For most other simple-KMS drivers
without enable_vblank() and check(), simple-KMS helpers can enable the
faked VBLANK by default. The only exception is Xen, which comes with
its own VBLANK logic and should rather to disable no_vblank.

v2:
	* document functionality (Daniel)
	* cleanup ast (Daniel)
	* let simple-kms handle no_vblank where possible

Thomas Zimmermann (4):
  drm: Document struct drm_crtc_state.no_vblank for faking VBLANK events
  drm/ast: Set struct drm_crtc_state.no_vblank in atomic_check()
  drm/cirrus: Let DRM core send VBLANK events
  drm/simple-kms: Let DRM core send VBLANK events by default

 drivers/gpu/drm/ast/ast_mode.c          |  4 ++--
 drivers/gpu/drm/bochs/bochs_kms.c       |  9 ---------
 drivers/gpu/drm/cirrus/cirrus.c         | 10 ++--------
 drivers/gpu/drm/drm_atomic_helper.c     |  4 +++-
 drivers/gpu/drm/drm_mipi_dbi.c          |  9 ---------
 drivers/gpu/drm/drm_simple_kms_helper.c | 19 +++++++++++++++----
 drivers/gpu/drm/tiny/gm12u320.c         |  9 ---------
 drivers/gpu/drm/tiny/ili9225.c          |  9 ---------
 drivers/gpu/drm/tiny/repaper.c          |  9 ---------
 drivers/gpu/drm/tiny/st7586.c           |  9 ---------
 drivers/gpu/drm/udl/udl_modeset.c       | 11 -----------
 drivers/gpu/drm/xen/xen_drm_front_kms.c | 13 +++++++++++++
 include/drm/drm_crtc.h                  |  9 +++++++--
 include/drm/drm_simple_kms_helper.h     |  7 +++++--
 14 files changed, 47 insertions(+), 84 deletions(-)

--
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
