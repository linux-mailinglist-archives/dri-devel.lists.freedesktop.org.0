Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D26B240A1B5
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 01:48:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F15E6E2C8;
	Mon, 13 Sep 2021 23:48:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A466E2C8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 23:48:39 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="285516268"
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; d="scan'208";a="285516268"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 16:48:38 -0700
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; d="scan'208";a="543534418"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 16:48:38 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Simon Ser <contact@emersion.fr>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 Tina Zhang <tina.zhang@intel.com>, Dongwon Kim <dongwon.kim@intel.com>,
 Satyeshwar Singh <satyeshwar.singh@intel.com>
Subject: [RFC v1 0/6] drm: Add support for DRM_CAP_RELEASE_FENCE capability
Date: Mon, 13 Sep 2021 16:35:23 -0700
Message-Id: <20210913233529.3194401-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The main idea behind DRM_CAP_RELEASE_FENCE is to add an additional
signaling mechanism for a pageflip completion in addition to out_fence
or DRM_EVENT_FLIP_COMPLETE event. This allows a compositor to start
a new repaint cycle with a new buffer instead of waiting for the
old buffer to be free. 

Why?
So, an atomic pageflip completion indicates two things to a compositor:
- that it can repaint again and
- that the old fb is free and can be reused (that was submitted in
  the previous repaint cycle)

Essentially, DRM_CAP_RELEASE_FENCE is about separating out the above
two assumptions. DRM_EVENT_FLIP_COMPLETE event or out_fence would 
serve as a signal to repaint and newly added release_fence would 
provide a way to determine when old fbs can be re-used again. 

This separation is really needed when the fb(s) associated with a
pageflip are shared outside of the OS -- which is indeed the 
case with Virtio-gpu, a Virtual KMS driver. The Virtio-gpu driver
runs in a Virtual Machine and can share the fb with the Host -- 
via Wayland UI -- in a zero-copy way. And, in this particular
environment where the Host and Guest/VM are running Wayland based
compositors, it would be desirable to have the Guest compositor's
scanout fb be placed directly on a hardware plane on the Host --
to improve performance when there are multiple Guests running.
To ensure 60 FPS and to prevent Guest and Host compositors from
using an fb at the same time, the signaling of Guest's release_fence
is tied to Host's wl_buffer_release event and DRM_EVENT_FLIP_COMPLETE/
out_fence signaling is tied to Host compositor's frame callback event.

Implementation:
Since release_fence is almost identical to out_fence, it is implemented
by making use of the existing out_fence machinery. And, although, the
drm core creates the release_fence, the Virtio-gpu driver takes care
of signaling it when it gets notified by the Host that the fb is free.

This work is based on the idea/suggestion from Simon and Pekka.

And, this patch series provides a solution for this Weston issue:
https://gitlab.freedesktop.org/wayland/weston/-/issues/514

Tested with:
Weston MR:
https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/668
and
Qemu patches:
https://lists.nongnu.org/archive/html/qemu-devel/2021-09/msg03463.html

Earlier version/discussion of this patch series can be found at:
https://lists.freedesktop.org/archives/dri-devel/2021-July/317672.html

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: Michel Dänzer <michel@daenzer.net>
Cc: Tina Zhang <tina.zhang@intel.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Satyeshwar Singh <satyeshwar.singh@intel.com>

Vivek Kasireddy (6):
  drm/atomic: Move out_fence creation/setup into a separate function
  drm/atomic: Add support for release_fence and its associated property
  drm: Add a capability flag to support additional flip completion
    signalling
  drm/virtio: Probe and implement VIRTIO_GPU_F_RELEASE_FENCE feature
  drm/virtio: Prepare set_scanout_blob to accept a fence
  drm/virtio: Add a fence to set_scanout_blob

 drivers/gpu/drm/drm_atomic_uapi.c        | 100 ++++++++++++++++++-----
 drivers/gpu/drm/drm_crtc.c               |   2 +
 drivers/gpu/drm/drm_ioctl.c              |   3 +
 drivers/gpu/drm/drm_mode_config.c        |   6 ++
 drivers/gpu/drm/virtio/virtgpu_debugfs.c |   1 +
 drivers/gpu/drm/virtio/virtgpu_drv.c     |   1 +
 drivers/gpu/drm/virtio/virtgpu_drv.h     |   5 +-
 drivers/gpu/drm/virtio/virtgpu_fence.c   |   9 ++
 drivers/gpu/drm/virtio/virtgpu_kms.c     |   9 +-
 drivers/gpu/drm/virtio/virtgpu_plane.c   |  63 ++++++++++++--
 drivers/gpu/drm/virtio/virtgpu_vq.c      |   7 +-
 include/drm/drm_atomic.h                 |   1 +
 include/drm/drm_file.h                   |   9 ++
 include/drm/drm_mode_config.h            |  15 ++++
 include/uapi/drm/drm.h                   |   1 +
 include/uapi/linux/virtio_gpu.h          |   2 +
 16 files changed, 200 insertions(+), 34 deletions(-)

-- 
2.30.2

