Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD063133AF
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 14:50:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C52FD6E8E5;
	Mon,  8 Feb 2021 13:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6347F6E8E5
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 13:50:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F06F4ACF4;
 Mon,  8 Feb 2021 13:50:46 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: hdegoede@redhat.com, daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 0/2] drm/vboxvideo: Use struct drm_shadow_plane_state for
 cursor plane
Date: Mon,  8 Feb 2021 14:50:42 +0100
Message-Id: <20210208135044.27827-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.0
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

(was: drm/vboxvideo: Vmap/vunmap cursor BO in prepare_fb and cleanup_fb)

Functions in the atomic commit tail are not allowed to acquire the
dmabuf's reservation lock. So we cannot legally call the GEM object's
vmap functionality in atomic_update.

But, much better, we can use drm_shadow_plane_state to do all the mapping
for us. Patch 1 exports the helpers for shadow-buffered planes from the
DRM KMS helper library and adds documentation on how to use them. Patch 2
replaces the vmap code in vbox' cursor update code with a the helpers for
shadow-buffered planes.

Thomas Zimmermann (2):
  drm/gem: Export helpers for shadow-buffered planes
  drm/vboxvideo: Implement cursor plane with struct
    drm_shadow_plane_state

 drivers/gpu/drm/drm_gem_atomic_helper.c | 148 +++++++++++++++++++++++-
 drivers/gpu/drm/vboxvideo/vbox_mode.c   |  28 ++---
 include/drm/drm_gem_atomic_helper.h     |  32 +++++
 3 files changed, 181 insertions(+), 27 deletions(-)

--
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
